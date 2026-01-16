(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Sat May  3 04:20:28 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
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
//
#staload
"./../../../SATS/xbasics.sats"
//
#staload // SYM =
"./../../../SATS/xsymbol.sats"
//
#staload // LOC =
"./../../../SATS/locinfo.sats"
//
#staload // LEX =
"./../../../SATS/lexing0.sats"
//
#staload // D2E =
"./../../../SATS/dynexp2.sats"
//
#staload // XGL =
"./../../../SATS/xglobal.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2js.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload lctn with d2con_get_lctn
#symload lctn with d2cst_get_lctn
#symload lctn with d2var_get_lctn
//
#symload name with d2con_get_name
#symload name with d2cst_get_name
#symload name with d2var_get_name
//
(* ****** ****** *)
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
valtok_prvq
(   tok   ) =
(
case-
tok.node() of
|T_VAL
( vlk ) => valkind_prvq(vlk))
(* end-of-[valtok_prvq(tok)] *)
//
#implfun
funtok_prfq
(   tok   ) =
(
case-
tok.node() of
|T_FUN
( fnk ) => funkind_prfq(fnk))
(* end-of-[funtok_prfq(tok)] *)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
strnfpr
(filr, strn) =
(
strn_fprint(strn, filr))//end-fun
//
#implfun
nindfpr
(filr, nind) =
if nind > 0 then
(
strn_fprint
(" ", filr); nindfpr(filr, nind-1))
//
#implfun
nindstrnfpr
(filr
,nind, strn) =
(
nindfpr(filr, nind);strnfpr(filr, strn))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1tnmfpr
(filr, itnm) =
(
prints("xtnm", stmp)
) where
{
//
#impltmp
g_print$out<>() = filr
//
val stmp = i1tnm_get_stmp(itnm)
//
}(*where*)//end-of-[i1tnmfpr(filr,itnm)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tokenfpr
(filr, tok0) =
let
(
  token_fprint(tok0, filr))
end(*let*)//end-of-[tokenfpr(env0,tok0)]
//
(* ****** ****** *)
//
#implfun
d2confpr
( filr,dcon ) =
let
//
val name = dcon.name((*0*))
//
in//let
(
symbl_fprint
(name, filr);
strnfpr(filr, "_");
fprint_loctn_as_stamp
(filr, dcon.lctn((*void*))))
end(*let*)//end-of-[d2confpr(env0,dcon)]
//
(* ****** ****** *)
//
#implfun
d2cstfpr
( filr,dcst ) =
let
//
val stmp =
d2cst_get_stmp(dcst)
val xopt =
the_d2cstmap_xnmfind(stmp)
//
in//let
(
case+
xopt of
| ~
optn_vt_nil
 ( (*0*) ) => f0_none(dcst)
| ~
optn_vt_cons
 (  xnam  ) =>
(
case+ xnam of
|X2NAMnone
 ( (*0*) ) => f0_none(dcst)
|X2NAMsome
 (  dexp  ) => f0_some(dcst, dexp)
)
) where
{
//
fun
f0_none
(dcst: d2cst): void =
let
//
val
lctn = dcst.lctn((*0*))
val
name = dcst.name((*0*))
//
in//let
symbl_fprint
(name, filr);strnfpr(filr, "_");
fprint_loctn_as_stamp(filr, lctn)end
//
fun
f0_some
(dcst: d2cst
,dexp: d2exp): void =
let
//
val
name = dcst.name((*0*))
//
val-
D2Eextnam
(tknd,gnam) = dexp.node((*0*))
//
in//let
case+ gnam of
|
_(* else *) => symbl_fprint(name,filr)
end(*let*)//end-of-[f0_some(dcst,dexp)]
//
}(*where*)
end(*let*)//end-of-[d2cstfpr(env0,dcst)]
//
(* ****** ****** *)
//
#implfun
d2varfpr
( filr,dvar ) =
let
//
val
name = dvar.name((*0*))
//
in//let
(
symbl_fprint
(name, filr);
strnfpr(filr, "_");
fprint_loctn_as_stamp
(filr, dvar.lctn((*void*))))
end(*let*)//end-of-[d2varfpr(env0,dvar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0chrfpr
(filr, tchr) =
(
//
case-
tchr.node() of
|T_CHAR1_nil0 _ =>
prints("XATSCNUL(", ")")
|T_CHAR2_char(rep) =>
prints("XATSCHR2(", rep, ")")
|T_CHAR3_blsh(rep) =>
let
 val()=f1_char3_blsh_rep(rep)
end
//
) where
{
//
fun
f1_char3_blsh_rep
  (rep: strn): void =
let
(*
val c0 = rep[0]
and c1 = rep[1]
*)
val c2 = rep[2]
val n0 =
(
  strn_length(rep))
//
in//let
//
case+ c2 of
//
| 'n' =>
print("XATSCHR2('\\n')")
| 't' =>
print("XATSCHR2('\\t')")
| 'r' =>
print("XATSCHR2('\\r')")
//
| 'b' =>
print("XATSCHR2('\\b')")
| 'f' =>
print("XATSCHR2('\\f')")
| 'v' =>
print("XATSCHR2('\\v')")
//
| '\'' =>
print("XATSCHR2('\\\'')")
| '\\' =>
print("XATSCHR2('\\\\')")
//
| _(*otherwise*) =>
(
print("XATSCHR3('\\\\");
f2_rep(2(*i0*)); print("')")
) where
{
fun
f2_rep
(i0: sint): void =
if
(i0 < n0) then
let
val c0 = rep[i0]
in//let
(
if c0 != '\'' then print(c0))
end//let
}
//
end//end
//
#impltmp g_print$out<>() = filr
//
}(*where*)//end-of-[i0chrfpr(filr,tchr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0strfpr
( filr, tstr) =
let
//
#impltmp
g_print$out
<(*nil*)>((*void*)) = filr
//
in//let
//
case-
tstr.node() of
//
|T_STRN1_clsd
( rep1,len2 ) =>
( print("XATSSTRN(`");
  f0_strn(rep1, len2-1); print("`)"))
|T_STRN2_ncls
( rep1,len2 ) =>
( print("XATSSTRN(`");
  f0_strn(rep1, len2-0); print("`)"))
(*
|T_STRN1_clsd
( rep1,len2 ) =>
( print("XATSSTRN(\"");
  f0_strn(rep1, len2-1); print("\")"))
|T_STRN2_ncls
( rep1,len2 ) =>
( print("XATSSTRN(\"");
  f0_strn(rep1, len2-0); print("\")"))
*)
//
end where
{
//
fun
f0_strn
( rep1: strn
, len2: sint): void =
let
//
val n0 = len2
(*
val n0 =
strn_length(rep1)
*)
//
fnx
loop1
(i0: nint): void =
if
(i0 >= n0)
then ((*0*)) else
let
//
  val c0 = rep1[i0]
//
in//let
//
if // if
(c0 = '\\')
then//then
(
  loop2(i0+1)) else
(
char_fprint(c0, filr); loop1(i0+1))
end//let//end-of-[loop1(i0)]
//
and
loop2
(i1: nint): void =
if // if
(i1 >= n0)
then//then
(
char_fprint
('\\', filr)) else
let
  val c1 = rep1[i1]
in (*let*)
if // if
(c1 = '\n')
then//then
(
  loop1(i1+1)) else
(
char_fprint('\\', filr); char_fprint(c1, filr); loop1(i1+1))
end//let//end-of-[loop1(i1)]
//
in//let
let
(*
HX: skip the first char
*)
val i0 = 1 in loop1(i0) end//let
end(*let*)//end-of-(f0_strn(rep))
//
}(* where *)//end-of-[i0strfpr(filr,tstr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_xats2js_utils0.dats] *)
(***********************************************************************)
