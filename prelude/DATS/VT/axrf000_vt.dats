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
Sun 11 Aug 2024 03:44:27 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
datavwtp
a0rf_vt_dt // dt: vx
(a:vwtp+) = a0rf_vt of (a)
#absimpl
a0rf_vt_vx(a:vt) = a0rf_vt_dt(a)
//
(* ****** ****** *)
//
#impltmp
< a:vt >
a0rf_vt_free(A) =
let
val ~
a0rf_vt(x) = A in g_free<a>(x)
end(*let*)//end-of-[a0rf_vt_free(A)]
//
(* ****** ****** *)
//
#impltmp
< a:t0 >
a0rf_vt_get = a0rf_vt_cget<a>
//
#impltmp
< a:vt >
a0rf_vt_cget(A) =
let
val
a0rf_vt(x) = A in g_copy<a>(x)
end(*let*)//end-of-[a0rf_vt_cget(A)]
//
#impltmp
< a:vt >
a0rf_vt_lget(A) =
let
val
a0rf_vt(x) = A in ($fold(A); x)
end(*let*)//end-of-[a0rf_vt_lget(A)]
//
(* ****** ****** *)
//
#impltmp
< a:t0 >
a0rf_vt_set = a0rf_vt_setf<a>
//
#impltmp
< a:vt >
a0rf_vt_setf(A, y) =
let
val @
a0rf_vt(x) = A
val () = (A.0 := y) in g_free<a>(x)
end(*let*)//end-of-[a0rf_vt_setf(A)]
//
#impltmp
< a:vt >
a0rf_vt_lset(A, y) =
let
val @
a0rf_vt(x) = A // x: ?a
val () = (A.0 := y) in (*  void  *)
end(*let*)//end-of-[a0rf_vt_lset(A)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a:vt >
a0rf_vt_make_1val
  (   x   ) = $UN.castxy(a0rf_vt<a>(x))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_VT_axrf000_vt.dats] *)
(***********************************************************************)
