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
Fri 29 Mar 2024 04:29:04 PM EDT
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
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/xats2js.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
strnfpr(filr, strn) =
(
 strn_fprint(filr, strn))//end-fun
//
#implfun
nindfpr(filr, nind) =
if nind > 0 then
(
strn_fprint
(filr, " "); nindfpr(filr, nind-1))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xats2js_i1parsed
  (filr, ipar) = let
//
val stadyn =
i1parsed_get_stadyn(ipar)
val nerror =
i1parsed_get_nerror(ipar)
val source =
i1parsed_get_source(ipar)
val parsed =
i1parsed_get_parsed(ipar)
//
val
env0 = envx2js_make_out(filr)
//
in//let
(
  envx2js_free_top(env0)) where
{ val () =
  xats2js_i1dclistopt(env0, parsed) }
end (*let*) // end of [xats2js_i1parsed(ipar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_xats2js_fnp
( e1, xs, fopr ) =
(
list_foreach_e1nv<x0><e1>(xs, e1)) where
{
#vwtpdef e1 = envx2js
#impltmp
foreach$work_e1nv<x0><e1>(x0, e1) = fopr(e1, x0)
} (*where*)//end of [list_xats2js_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
optn_xats2js_fnp
( e1, xs, fopr ) =
(
case+ xs of
| optn_nil() => () | optn_cons(x1) => fopr(e1, x1))
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_xats2js.dats] *)
(***********************************************************************)
