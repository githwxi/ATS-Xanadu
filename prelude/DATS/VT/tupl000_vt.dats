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
Sat 10 Aug 2024 09:31:47 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a0:vt
, a1:vt }
g_print0
<t0up_vt(a0,a1)>
  ( tup ) =
let
//
val () =
(
  strn_print("@("))
//
val () = g_print0<a0>(tup.0)
val () = pstrn(",")
val () = g_print0<a1>(tup.1)
//
val () = strn_print(")")
//
end // end of [g_print0<t0up2>(tup)]
//
(* ****** ****** *)
//
#impltmp
{ a0:vt
, a1:vt }
g_print1
<t0up_vt(a0,a1)>
  ( tup ) =
let
//
val () =
(
  strn_print("@("))
//
val () = g_print1<a0>(tup.0)
val () = pstrn(",")
val () = g_print1<a1>(tup.1)
//
val () = strn_print(")")
//
end // end of [g_print1<t0up2>(tup)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a0:vt
, a1:vt
, a2:vt }
g_print0
<t0up_vt(a0,a1,a2)>
  ( tup ) =
let
//
val () =
  strn_print("@(")
//
val () = g_print0<a0>(tup.0)
val () = pstrn(",")
val () = g_print0<a1>(tup.1)
val () = pstrn(",")
val () = g_print0<a2>(tup.2)
//
val () = strn_print(")")
//
end // end of [g_print0<t0up3>(tup)]
//
(* ****** ****** *)
//
#impltmp
{ a0:vt
, a1:vt
, a2:vt }
g_print1
<t0up_vt(a0,a1,a2)>
  ( tup ) =
let
//
val () =
  strn_print("@(")
//
val () = g_print1<a0>(tup.0)
val () = pstrn(",")
val () = g_print1<a1>(tup.1)
val () = pstrn(",")
val () = g_print1<a2>(tup.2)
//
val () = strn_print(")")
//
end // end of [g_print1<t0up3>(tup)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a0:t0
, a1:t0 }
g_copy<t0up_vt(a0,a1)>(tup) = (tup)
#impltmp
{ a0:t0
, a1:t0 }
g_free<t0up_vt(a0,a1)>(tup) = ((*0*))
//
(* ****** ****** *)
//
#impltmp
{ a0:t0
, a2:t0
, a1:t0 }
g_copy<t0up_vt(a0,a1,a2)>(tup) = (tup)
#impltmp
{ a0:t0
, a1:t0
, a2:t0 }
g_free<t0up_vt(a0,a1,a2)>(tup) = ((*0*))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_tupl000_vt.dats] *)
