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
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2cc.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload sort with s2cst_get_sort
#symload name with s2cst_get_name
#symload stmp with s2cst_get_stmp
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
val name = scst.name((*0*))
//
in//let
(
symbl_fprint
(name, filr);strnfpr(filr, "$");
stamp_fprint(scst.stmp((*0*)), filr))
end(*let*)//end-of-[s2cstfpr(env0,scst)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_xats2cc_utils0.dats] *)
(***********************************************************************)
