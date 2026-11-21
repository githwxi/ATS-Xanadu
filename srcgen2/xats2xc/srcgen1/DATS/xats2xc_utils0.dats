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
(*
Wed Mar 11 01:27:57 PM EDT 2026
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
#staload // STM =
"./../../../SATS/xstamp0.sats"
//
#staload // SYM =
"./../../../SATS/xsymbol.sats"
//
#staload // LOC =
"./../../../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload // S2E =
"./../../../SATS/staexp2.sats"
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
//
(* ****** ****** *)
//
#staload "./../SATS/xats2xc.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload name with s2cst_get_name
#symload sort with s2cst_get_sort
#symload lctn with s2cst_get_lctn
#symload stmp with s2cst_get_stmp
//
(* ****** ****** *)
//
#symload lctn with d2con_get_lctn
#symload name with d2con_get_name
//
#symload lctn with d2cst_get_lctn
#symload name with d2cst_get_name
//
#symload lctn with d2var_get_lctn
#symload name with d2var_get_name
//
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
strnfpr(
filr, strn) =
(
strn_fprint(strn, filr))
//
#implfun
nindfpr(
filr, nind) =
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
s2cstfpr
(filr, scst) =
let
//
val
name = scst.name((*0*))
//
in//let
(
symbl_fprint
(name, filr);
strnfpr(filr, "_");
fprint_lctn1_as_stamp
(filr, scst.lctn((*void*))))
end(*let*)//end-of-[s2cstfpr(filr,scst)]
//
(* ****** ****** *)
//
#implfun
s2varfpr
(filr, svar) =
(
symbl_fprint(name, filr))
where
{
  val name = s2var_get_name(svar)
}(*where*)//end-of-[s2varfpr(filr,svar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0typfpr
(filr, ityp) =
(
case+ ityp.node() of
| _
(*other*) => i0typ_fprint(ityp, filr)
)(*case+*)//end-of-[i0typfpr(filr,ityp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2confpr
(filr, dcon) =
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
end(*let*)//end-of-[d2confpr(filr,dcon)]
//
(* ****** ****** *)
//
#implfun
d2cstfpr
(filr, dcst) =
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
case+
gnam of
|
_(*else*) => symbl_fprint(name,filr)
end(*let*)//end-of-[f0_some(dcst,dexp)]
//
}(*where*)
end(*let*)//end-of-[d2cstfpr(filr,dcst)]
//
(* ****** ****** *)
//
#implfun
d2varfpr
(filr, dvar) =
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
end(*let*)//end-of-[d2varfpr(filr,dvar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fprint_lctn1_as_stamp
  (out, loc) =
(
  prints(nbeg)) where
{
//
  #impltmp
  g_print$out<>() = out
//
  val pbeg = loc.pbeg()
  val nbeg = postn_get_ntot(pbeg)
//
}(*where*) // end of [fprint_lctn1_as_stamp]
//
#implfun
fprint_lctn2_as_stamp
  (out, loc) =
(
prints(nbeg, "$", nend)
) where
{
//
  #impltmp
  g_print$out<>() = out
//
  val pbeg = loc.pbeg()
  val nbeg = postn_get_ntot(pbeg)
  val pend = loc.pend()
  val nend = postn_get_ntot(pend)
//
}(*where*) // end of [fprint_lctn2_as_stamp]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2xc_srcgen1_DATS_xats2xc_utils0.dats] *)
(***********************************************************************)
(***********************************************************************)
