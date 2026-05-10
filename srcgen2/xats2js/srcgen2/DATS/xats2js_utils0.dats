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
Sat May  9 05:24:37 PM EDT 2026
*)
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
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
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
(* ****** ****** *)
//
#staload ".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"//...
//
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/trxi0i1.sats"
#staload "./../SATS/xats2js.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
strnfpr(
filr, strn) =
(
strn_fprint(strn, filr))//end-fun
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
end(*let*)//end-of-[d2varfpr(env0,dvar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_DATS_xats2js_utils0.dats] *)
(***********************************************************************)
