(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
//
Fri Sep 25 12:45:24 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload // BAS =
"./../../../SATS/xbasics.sats"
//
#staload // SYM =
"./../../../SATS/xsymbol.sats"
#staload // LOC =
"./../../../SATS/locinfo.sats"
#staload // LEX =
"./../../../SATS/lexing0.sats"
//
(* ****** ****** *)
//
#staload // S2E =
"./../../../SATS/staexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xats2cc.sats"
#staload "./../SATS/cc0emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprintln
(filr: FILR): void =
(
strn_fprint("\n", filr))//endfun
//
(* ****** ****** *)
//
fun
lctnfpr
(filr: FILR
,loc0: loc_t): void =
(
loctn_fprint(loc0,filr))//endfun
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
tlamscc0
(filr: FILR
,npos: nint
,ityp: i0typ): nint =
(
case+
ityp.node() of
|I0Tlam1
(s2vs, i0t1) =>
(
tlamscc0
(filr, npos, i0t1))
where{
val npos =
sargscc0(filr, npos, s2vs) }
//
| _(*otherwise*) => (  npos  ))
//
(* ****** ****** *)
//
fun
tlamsbd0
(
ityp: i0typ): i0typ =
(
case+
ityp.node() of
|
I0Tlam1
(s2vs, i0t1) =>
tlamsbd0(i0t1) | _(*else*) => ityp)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0dcl_cc0emit
(dcl0, env0) =
let
//
(*
//
val () =
prerrsln
("i0dcl_cc0emit: dcl0 = ", dcl0)
//
*)
//
in//let
//
case+
dcl0.node() of
//
(* ****** ****** *)
//
|I0Ddclst0
(   dcls   ) =>
let
val () =
  i0dclist_cc0emit(dcls, env0)
end(*let*)//end-of-[I0Ddclst0(...)]
//
|I0Dlocal0
(head, body) =>
let
val () =
  i0dclist_cc0emit(head, env0)
val () =
  i0dclist_cc0emit(body, env0)
end(*let*)//end-of-[I0Dlocal0(...)]
//
(* ****** ****** *)
//
|I0Ddclenv
(dcl1, i0vs) =>
let
val () = i0dcl_cc0emit(dcl1, env0)
end//let//end-of-[I0Ddclenv(dcl1,i0vs)]
//
(* ****** ****** *)
//
|I0Dsexpdef _ => f0_sexpdef(dcl0, env0)
|I0Dabstype _ => f0_abstype(dcl0, env0)
//
(* ****** ****** *)
//
|
I0Dvaldclst _ => f0_valdclst(dcl0, env0)
|
I0Dvardclst _ => f0_vardclst(dcl0, env0)
//
|
I0Dfundclst _ => f0_fundclst(dcl0, env0)
//
(* ****** ****** *)
(* ****** ****** *)
//
| _
(*otherwise*) => f0_otherwise(dcl0, env0)
//
(* ****** ****** *)
(* ****** ****** *)
//
end where//endof(i0dcl_cc0emit(dcl0,env0))
{
//
(* ****** ****** *)
//
fun
f0_sexpdef
(
dcl0: i0dcl,
env0: !envxcc0): void =
let
//
val filr =
envxcc0_filr$get(env0)
val nind =
envxcc0_nind$get(env0)
//
val-
I0Dsexpdef
(scst, ityp) = dcl0.node()
//
in//let
//
nindfpr(filr, nind);
strnfpr(filr, "// I0Dsexpdef\n");
(*
nindstrnfpr(filr, nind, "// ");
i0dcl_fprint(dcl0, filr); fprintln(filr)
*)
nindfpr(filr, nind);
strnfpr(
filr, "#define ");s2cstfpr(filr, scst);
//
(
case+
ityp.node() of
|
I0Tlam1 _ =>
( (*void*) ) where
{
val (  ) =
strnfpr(filr, "(")
val npos =
(
  tlamscc0(filr,0(*n*),ityp))
val (  ) = strnfpr(filr, ")") }
| _
(*otherwise*) => (    (*void*)    ) );
//
let
val ityp =
tlamsbd0(ityp) in
strnfpr(filr, " ");
i0typcc0(filr, ityp);fprintln(filr) end
//
end(*let*)//end-of-[f0_sexpdef(env0,dcl0)]
//
(* ****** ****** *)
//
fun
f0_abstype
(
dcl0: i0dcl,
env0: !envxcc0): void =
let
//
val filr =
envxcc0_filr$get(env0)
val nind =
envxcc0_nind$get(env0)
//
in//let
//
nindfpr(filr, nind);
strnfpr
(filr, "// I0Dabstype\n");
nindstrnfpr(filr, nind, "// ");
i0dcl_fprint(dcl0, filr); fprintln(filr)
//
end(*let*)//end-of-[f0_abstype(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_valdclst
( 
dcl0: i0dcl,
env0: !envxcc0): void =
let
//
val loc0 = dcl0.lctn()
val-
I0Dvaldclst
(tknd, i0vs) = dcl0.node()
//
in//let
i0valdclist_cc0emit(i0vs, env0)
end where
{
//
(*
val loc0 = dcl0.lctn()
val (  ) =
prerrsln
("f0_valdclst(xcc0): dcl0 = ", dcl0)
*)
//
}(*where*)//end-of-[f0_valdclst(dcl0,env0)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( 
dcl0: i0dcl,
env0: !envxcc0): void =
let
//
val loc0 = dcl0.lctn()
val-
I0Dvardclst
(tknd, i0vs) = dcl0.node()
//
in//let
i0vardclist_cc0emit(i0vs, env0)
end where
{
//
(*
val loc0 = dcl0.lctn()
val (  ) =
prerrsln
("f0_vardclst(xcc0): dcl0 = ", dcl0)
*)
//
}(*where*)//end-of-[f0_vardclst(dcl0,env0)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( 
dcl0: i0dcl,
env0: !envxcc0): void =
let
//
val loc0 = dcl0.lctn()
val-
I0Dfundclst
(tknd
,lvl0, tqas
,d2cs, i0fs) = dcl0.node()
//
in//let
i0fundclist_cc0emit(i0fs, env0)
end where
{
//
(*
val loc0 = dcl0.lctn()
val (  ) =
prerrsln
("f0_fundclst(xcc0): dcl0 = ", dcl0)
*)
//
}(*where*)//end-of-[f0_fundclst(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_otherwise
(
dcl0: i0dcl,
env0: !envxcc0): void =
let
//
val loc0 =
dcl0.lctn((*void*))
//
val filr =
envxcc0_filr$get(env0)
val nind =
envxcc0_nind$get(env0)
//
in//let
//
nindfpr(filr, nind);
strnfpr(filr, "// ");
loctn_fprint
(loc0, filr); fprintln(filr);
nindfpr(filr, nind);
strnfpr(filr, "// ");
i0dcl_fprint(dcl0, filr); fprintln(filr)
//
end(*let*)//end-of-[f0_otherwise(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[i0dcl_cc0emit(dcl0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
teqi0exp_cc0emit
  (tdxp, env0) =
(
case+ tdxp of
|TEQI0EXPnone
( (*void*) ) => ()
|TEQI0EXPsome
(teq1, i0e2) => () where
{ val
  i0e2 = i0exp_cc0emit(i0e2, env0) }
)(*case+*)//end-of-(teqi0exp_cc0emit(tdxp...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0valdcl_cc0emit
  (ival, env0) = let
//
(*
val loc0 =
i0valdcl_lctn$get(ival)
val ipat =
i0valdcl_ipat$get(ival)
*)
val tdxp =
i0valdcl_tdxp$get(ival)
//
val (  ) =
(
  teqi0exp_cc0emit(tdxp, env0))
end(*let*)//end(i0valdcl_cc0emit(ival,env0))
//
(* ****** ****** *)
//
#implfun
i0vardcl_cc0emit
  (ivar, env0) = let
//
(*
val loc0 =
i0vardcl_lctn$get(ivar)
val dpid =
i0vardcl_dpid$get(ivar)
*)
val dini =
i0vardcl_dini$get(ivar)
//
val (  ) =
(
  teqi0exp_cc0emit(dini, env0))
//
end(*let*)//end(i0vardcl_cc0emit(ivar,env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0fundcl_cc0emit
  (ifun, env0) = let
//
val (  ) =
(
  fiarglst_cc0emit(fias, env0))
//
val (  ) =
(
  teqi0exp_cc0emit(tdxp, env0))
//
end where
{
//
val loc0 = i0fundcl_lctn$get(ifun)
val fias = i0fundcl_farg$get(ifun)
val tdxp = i0fundcl_tdxp$get(ifun)
//
}(*where*)//end(i0fundcl_cc0emit(ivar,env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_cc0emit_decl00.dats] *)
(***********************************************************************)
