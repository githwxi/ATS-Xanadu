(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun 26 May 2024 09:29:27 AM EDT
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
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#include
"./../HATS/xats2js_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload // SYM =
"./../../../SATS/xsymbol.sats"
//
#staload // LOC =
"./../../../SATS/locinfo.sats"
//
#staload // D2E =
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2js.sats"
#staload "./../SATS/js1emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)

fun
i1valjs1
( filr: FILR
, ival: i1val): void =
let
//
(*
val () =
prerrln
("i1valfpr_js1: ival = ", ival)
*)
//
in//let
case+
ival.node() of
(* ****** ****** *)
|
_(*otherwise*) => i1val_fprint(filr, ival)
(* ****** ****** *)
end(*let*)//end-of-[i1valjs1(env0,ival)]

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_i1let
( env0,ilet ) =
let
//
val filr =
envx2js_get_filr(env0)
val nind =
envx2js_get_nind(env0)
//
in//let
//
case+ ilet of
|I1LETnew0(iins) =>
(
js1emit_i1ins(env0, iins))
//
|I1LETnew1(itnm, iins) =>
(
strnfpr(filr,"let ");i1tnmfpr(filr, itnm);
strnfpr(filr, " = ");js1emit_i1ins(env0, iins)
)
//
end(*let*)//end-of-[js1emit_i1let(env0,ilet)]
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
js1emit_fjarg
  (env0, farg) = xats2js_fjarg(env0, farg)

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
js1emit_fjarglst
  (env0, fjas) =
(
  list_js1emit_fnp(env0, fjas, js1emit_fjarg))
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_js1emit_dynexp.dats] *)
(***********************************************************************)
