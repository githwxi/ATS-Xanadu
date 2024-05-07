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
Fri 29 Mar 2024 04:35:26 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
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
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2js.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/xats2js.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with i1dcl_get_lctn
#symload node with i1dcl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
fun
fprintln
(filr: FILR): void =
(
 strn_fprint(filr,"\n"))//end-fun
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1dcl
( env0,dcl0 ) =
let
val filr =
envx2js_get_filr(env0)
in//let
case+
dcl0.node() of
|
_(* otherwise *) =>
(
fprint(filr, "// ")
i1dcl_fprint(filr, dcl0); fprintln(filr))
end where
{
//
val () =
(
  prerrln("xats2js_i1dcl: dcl0 = ", dcl0))
//
}(*where*)//end-of-[xats2js_i1dcl(env0,dcl0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1dclist
  (env0, dcls) =
(
  list_xats2js_fnp(env0, dcls, xats2js_i1dcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1dclistopt
  (env0, dopt) =
(
  optn_xats2js_fnp(env0, dopt, xats2js_i1dclist))
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_xats2js.dats] *)
(***********************************************************************)
