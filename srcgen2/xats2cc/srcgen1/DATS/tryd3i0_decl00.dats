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
//
(*
Author: Hongwei Xi
//
Sat Apr 18 08:50:06 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
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
#staload
"./../../../SATS/xbasics.sats"
#staload
"./../../../SATS/xstamp0.sats"
#staload
"./../../../SATS/xsymbol.sats"
#staload
"./../../../SATS/xsymmap.sats"
#staload
"./../../../SATS/xlabel0.sats"
(* ****** ****** *)
#staload
"./../../../SATS/locinfo.sats"
#staload
"./../../../SATS/lexing0.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/tryd3i0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload stmp with t0imp_stmp$get
#symload node with t0imp_node$get
(* ****** ****** *)
#symload lctn with i0dcl_lctn$get
#symload node with i0dcl_node$get
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t0imp_tryd3i0
(timp, enw0) =
(
case+
timp.node() of
//
|T0IMPall1
(d2c1
,t2js, dcls) =>
(
t0imp_make_node(
stmp,
T0IMPall1(d2c1,t2js,dcls))
) where
{
val dcls =
(
case+ dcls of
|
optn_nil() =>
optn_nil((*void*))
|
optn_cons(dcl1) =>
optn_cons(
  i0dcl_tryd3i0(dcl1, enw0)))
}(*where*)//end(T0IMPall1(...))
//
|T0IMPallx
(d2c1
,t2js, dcls) =>
(
t0imp_make_node(
stmp,
T0IMPallx(d2c1,t2js,dcls))
) where
{
val dcls =
(
case+ dcls of
|
optn_nil() =>
optn_nil((*void*))
|
optn_cons(dcl1) =>
optn_cons(
  i0dcl_tryd3i0(dcl1, enw0)))
}(*where*)//end(T0IMPallx(...))
//
) where
{
//
val stmp = timp.stmp((*void*))
//
(*
val (  ) =
prerrsln("t0imp_tryd3i0: timp = ", timp)
*)
//
}(*where*)//end-of-[t0mpl_tryd3i0(timp,enw0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0dcl_tryd3i0
(idcl, enw0) =
let
//
val () =
prerrsln("\
i0dcl_tryd3i0: idcl = ", idcl)
//
in//let
//
case+
idcl.node() of
//
(* ****** ****** *)
//
|I0Dd3ecl _ => (idcl)
//
(* ****** ****** *)
|I0Dstatic _ => (idcl)
|I0Dextern _ => (idcl)
(* ****** ****** *)
//
|I0Dtmpsub _ =>
(
  f0_tmpsub(idcl, enw0))
//
(* ****** ****** *)
//
|I0Ddclst0 _ =>
(
  f0_dclst0(idcl, enw0))
|I0Dlocal0 _ =>
(
  f0_dclst0(idcl, enw0))
//
(* ****** ****** *)
//
|I0Dinclude _ =>
(
  f0_include(idcl, enw0))
//
(* ****** ****** *)
//
|I0Dvaldclst _ =>
(
  f0_valdclst(idcl, enw0))
|I0Dvardclst _ =>
(
  f0_vardclst(idcl, enw0))
//
|I0Dfundclst _ =>
(
  f0_fundclst(idcl, enw0))
//
(* ****** ****** *)
//
|I0Dimplmnt0 _ =>
(
  f0_implmnt0(idcl, enw0))
//
(* ****** ****** *)
//
|
I0Dnone0 _ => idcl
|
I0Dnone1 _ => idcl |I0Dnone2 _ => idcl
//
(* ****** ****** *)
//
|_(* otherwise *) => i0dcl_none2( idcl )
//
(* ****** ****** *)
//
end where//let//endof(i0dcl_tryd3i0(...))
{
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
f0_d3ecl
(
idcl: i0dcl,
enw0: !enwd3i0): i0dcl =
let
val-
I0Dd3ecl _ = idcl.node() in idcl
end(*let*)//end-of-[f0_d3ecl(idcl,enw0)]
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_tmpsub
(
idcl: i0dcl,
enw0: !enwd3i0): i0dcl =
let
//
val loc0 = idcl.lctn()
//
val-
I0Dtmpsub
(svts, dcl1) = idcl.node()
//
in//let
//
let
val dcl1 =
(
  i0dcl_tryd3i0(dcl1, enw0))
in//let
i0dcl(loc0, I0Dtmpsub(svts, dcl1))
end//let
//
end(*let*)//end-of-[f0_tmpsub(idcl,enw0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dclst0
(
idcl: i0dcl,
enw0: !enwd3i0): i0dcl =
let
//
val loc0 = idcl.lctn()
//
val-
I0Ddclst0
(   dcls   ) = idcl.node()
//
val dcls =
(
  i0dclist_tryd3i0(dcls, enw0))
in//let
(
  i0dcl(loc0, I0Ddclst0( dcls )))
end(*let*)//end-of-[f0_dclst0(idcl,enw0)]
//
fun
f0_local0
(
idcl: i0dcl,
enw0: !enwd3i0): i0dcl =
let
//
val loc0 = idcl.lctn()
//
val-
I0Dlocal0
(ids1, ids2) = idcl.node()
//
val ids1 =
(
  i0dclist_tryd3i0(ids1, enw0))
val ids2 =
(
  i0dclist_tryd3i0(ids2, enw0))
//
in//let
//
(
i0dcl
(
loc0,
I0Dlocal0(ids1(*hd*), ids2(*bd*))))
//
end(*let*)//end-of-[f0_local0(idcl,enw0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_include
(
idcl: i0dcl,
enw0: !enwd3i0): i0dcl =
let
//
val loc0 = idcl.lctn()
//
val-
I0Dinclude
(sd00
,tknd, gsrc
,fopt, dopt) = idcl.node()
//
val dopt =
(
i0dclistopt_tryd3i0(dopt, enw0))
//
in//let
//
i0dcl
(
loc0,
I0Dinclude
  (sd00, tknd, gsrc, fopt, dopt))
end(*let*)//end-of-[f0_include(idcl,enw0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_valdclst
( 
idcl: i0dcl,
enw0: !enwd3i0): i0dcl =
let
//
val loc0 = idcl.lctn()
val-
I0Dvaldclst
(tknd, i0vs) = idcl.node()
//
val
i0vs =
i0valdclist_tryd3i0(i0vs, enw0)
//
in//let
(
i0dcl(loc0, I0Dvaldclst(tknd, i0vs)))
end where
{
//
(*
val loc0 = idcl.lctn()
val (  ) =
prerrsln("f0_valdclst(d3i0): idcl = ", idcl)
*)
//
}(*where*) // end of [f0_valdclst(idcl,enw0)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( 
idcl: i0dcl,
enw0: !enwd3i0): i0dcl =
let
//
val loc0 = idcl.lctn()
val-
I0Dvardclst
(tknd, i0vs) = idcl.node()
//
val
i0vs =
i0vardclist_tryd3i0(i0vs, enw0)
//
in//let
(
i0dcl(loc0, I0Dvardclst(tknd, i0vs)))
end where
{
//
(*
val loc0 = idcl.lctn()
val (  ) =
prerrsln("f0_vardclst(d3i0): idcl = ", idcl)
*)
//
}(*where*) // end of [f0_vardclst(idcl,enw0)]
//
(* ****** ****** *)
//
fun
f0_fundclst
(
idcl: i0dcl,
enw0: !enwd3i0): i0dcl =
let
//
val loc0 = idcl.lctn()
//
val-
I0Dfundclst
( tknd
, lvl0, tqas
, d2cs, i0fs) = idcl.node()
//
val (  ) =
f1_i0fs$nil(i0fs)//val((__))
val i0ws =
(
if
(lvl0 <= 0)
then list_nil() else
f1_i0fs_i0ws(enw0, i0fs)//val.
)
val (  ) =
f1_i0fs$i0ws(i0fs, i0ws)//val.
//
in//let
(
i0dcl(
loc0, I0Ddclenv(idcl, i0ws)))
where{
//
val i0fs =
i0fundclist_tryd3i0(i0fs, enw0)
//
val idcl =
i0dcl_make_node
(
loc0,
I0Dfundclst(
tknd(*fnk*), lvl0, tqas, d2cs, i0fs))}
//
end where
{
//
(*
val loc0 = idcl.lctn()
val (  ) =
prerrsln("f0_fundclst(d3i0): idcl = ", idcl)
*)
//
fun
f1_i0fs$nil
( i0fs
: i0fundclist): void =
(
case+ i0fs of
|list_nil
( (*0*) ) => ()
|list_cons
(i0f1, i0fs) =>
(
f1_i0fs$nil(i0fs))
where
{
val dpid =
i0fundcl_dpid$get
(       i0f1       )
val (  ) =
enwd3i0_dfix$insert
(enw0, dpid, list_nil(*0*))}
)
//
fun
f1_i0fs$i0ws
( i0fs
: i0fundclist
, i0ws: i0varlst): void =
(
case+ i0fs of
|list_nil
( (*0*) ) => ()
|list_cons
(i0f1, i0fs) =>
let
val dpid =
i0fundcl_dpid$get
(       i0f1       )
val (  ) =
enwd3i0_dfix$insert
( enw0, dpid, i0ws )
in
  f1_i0fs$i0ws(i0fs, i0ws)
end//let//endof(list_cons(...))
)
//
fun
f1_i0fs_i0ws
( enw0:
! enwd3i0
, i0fs
: i0fundclist): i0varlst =
let
val ivst =
i0varfst_mknil() in
list_vt2t
(
i0varfst_listize
(
f1_i0fs$ivst(enw0, i0fs, ivst)))
end//let//end-of-[f1_i0fs_i0ws()]
//
and
f1_i0fs$ivst
( enw0:
! enwd3i0
, i0fs
: i0fundclist
, ivst: i0varfst): i0varfst =
(
case+ i0fs of
|
list_nil
( (*0*) ) => (ivst)
|
list_cons
(i0f1, i0fs) =>
let
val lvl0 =
i0fundcl_lvl0$get(i0f1)
val i0vs =
i0fundcl_i0vs$get(i0f1)
val ivst =
(
f2_lvl0$i0vs$ivst(
  enw0, lvl0, i0vs, ivst))
in//let
f1_i0fs$ivst(enw0, i0fs, ivst)
end//let
)
where
{
//
fun
f2_lvl0$i0vs$ivst
( enw0:
! enwd3i0
, lvl0: sint
, i0vs: i0varlst
, ivst: i0varfst): i0varfst =
(
//
case+ i0vs of
|list_nil
( (*0*) ) => (ivst)
|list_cons
(i0v1, i0vs) =>
(
f2_lvl0$i0vs$ivst
(enw0, lvl0, i0vs, ivst)
) where
{
//
val lvl1 =
i0var_lvl0$get(i0v1)
val ivst =
(
if
(lvl1 > lvl0)
then (ivst) else
let
val bvk1 =
i0var_bvk0$get(i0v1)
in//let
if // if
not(
i0var_fixq(i0v1))
then
(
if // if
i0var_topq(i0v1)
then (ivst) else
  i0varfst_addvar(ivst, i0v1)
) else // end-of-(then)
(
(
  i0varfst_addlst(ivst, ivs2))
where
{
val dfix = i0v1.dvar((*0*))
val ivs2 =
enwd3i0_dfix$search(enw0, dfix)})
end(*let*)//else//end-of-(val(ivst))
)
}(*where*) // end of [list_cons(...)]
//
)(*case+*) // end of [f2_lvl0$i0vs$ivst]
//
}(*where*) // end of [f1_i0fs$ivst(...)]
//
}(*where*) // end of [f0_fundclst(idcl,enw0)]
//
(* ****** ****** *)
//
fun
f0_implmnt0
(
idcl: i0dcl,
enw0: !enwd3i0): i0dcl =
let
//
val loc0 = idcl.lctn()
//
val-
I0Dimplmnt0
(tknd
,lvl0, stmp
,dimp, fias
,iexp, i0vs) = idcl.node()
//
val i0ws =
(
lvl0$i0vs_tryd3i0
(lvl0, i0vs, enw0))//val(i0ws)
//
in//let
//
(
i0dcl(
loc0, I0Ddclenv(idcl, i0ws)))
where{
//
val iexp =
(
  i0exp_tryd3i0( iexp, enw0 ))
//
val idcl =
i0dcl(loc0,
I0Dimplmnt0(tknd,
  lvl0, stmp, dimp, fias, iexp, i0vs))}
//
end where
{
//
(*
val loc0 = idcl.lctn()
val (  ) =
prerrsln("f0_implmnt0(d3i0): idcl = ", idcl)
*)
//
}(*where*) // end of [f0_implmnt0(idcl,enw0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[i0dcl_tryd3i0(idcl,enw0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
teqi0exp_tryd3i0
  (tdxp, env0) =
(
case+ tdxp of
|
TEQI0EXPnone() =>
TEQI0EXPnone((*void*))
|
TEQI0EXPsome(teq1, i0e2) =>
TEQI0EXPsome(teq1, i0e2) where
{ val
  i0e2 = i0exp_tryd3i0(i0e2, env0) }
)(*case+*)//end-of-(teqi0exp_tryd3i0(tdxp...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0valdcl_tryd3i0
  (ival, env0) = let
//
val loc0 =
i0valdcl_lctn$get(ival)
val ipat =
i0valdcl_ipat$get(ival)
val tdxp =
i0valdcl_tdxp$get(ival)
//
val tdxp =
(
  teqi0exp_tryd3i0(tdxp, env0))
//
in//let
(
  i0valdcl_make_args(loc0,ipat,tdxp))
end(*let*)//end(i0valdcl_tryd3i0(dval,env0))
//
(* ****** ****** *)
//
#implfun
i0vardcl_tryd3i0
  (ivar, env0) = let
//
val loc0 =
i0vardcl_lctn$get(ivar)
val dpid =
i0vardcl_dpid$get(ivar)
val dini =
i0vardcl_dini$get(ivar)
//
val dini =
(
  teqi0exp_tryd3i0(dini, env0))
//
in//let
  i0vardcl_make_args(loc0, dpid, dini)
end(*let*)//end(i0vardcl_tryd3i0(ivar,env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0fundcl_tryd3i0
  (ifun, env0) =
let
//
val loc0 =
i0fundcl_lctn$get(ifun)
//
val lvl0 =
i0fundcl_lvl0$get(ifun)
//
val dpid =
i0fundcl_dpid$get(ifun)
val d2vs =
i0fundcl_d2vs$get(ifun)
//
val fias =
i0fundcl_farg$get(ifun)
//
val tdxp =
i0fundcl_tdxp$get(ifun)
//
val i0vs =
i0fundcl_i0vs$get(ifun)
//
val tdxp =
(
  teqi0exp_tryd3i0(tdxp, env0))
//
in//let
(
i0fundcl_make_args(loc0,
  lvl0, dpid, d2vs, fias, tdxp, i0vs))
end where
{
//
(*
val (  ) =
prerrsln("i0fundcl_tryd3i0: loc0 = ", loc0)
val (  ) =
prerrsln("i0fundcl_tryd3i0: dpid = ", dpid)
val (  ) =
prerrsln("i0fundcl_tryd3i0: fias = ", fias)
val (  ) =
prerrsln("i0fundcl_tryd3i0: tdxp = ", tdxp)
*)
//
}(*where*)//end(i0fundcl_tryd3i0(ifun,env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_tryd3i0_decl00.dats] *)
(***********************************************************************)
