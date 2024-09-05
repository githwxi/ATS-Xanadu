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
(*
** for flat tuples
** for boxd tuples
*)
(* ****** ****** *)
(*
HX-2023-08-06:
@(...): flat tuple
#(...): boxd tuple
$tup(...): boxd tuple
(Change: $(...) -> #(...))
Sun Aug  6 19:45:40 EDT 2023
*)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(Around some time in 2022)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-04:
Copying over from [srcgen1]
Sun 04 Aug 2024 05:41:59 PM EDT
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a0:t0
, a1:t0 }
g_ptype
<t0up(a0,a1)>
(  (*void*)  ) =
( pstrn"t0up2("
; g_ptype<a0>(); pstrn(",")
; g_ptype<a1>(); pstrn(")"))
//
#impltmp
{ a0:t0
, a1:t0 }
g_ptype
<t1up(a0,a1)>
(  (*void*)  ) =
( pstrn"t1up2("
; g_ptype<a0>(); pstrn(",")
; g_ptype<a1>(); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a0:t0
, a1:t0
, a2:t0 }
g_ptype
<t0up(a0,a1,a2)>
(  (*void*)  ) =
( pstrn"t0up3("
; g_ptype<a0>(); pstrn(",")
; g_ptype<a1>(); pstrn(",")
; g_ptype<a2>(); pstrn(")"))
//
#impltmp
{ a0:t0
, a1:t0
, a2:t0 }
g_ptype
<t1up(a0,a1,a2)>
(  (*void*)  ) =
( pstrn"t1up3("
; g_ptype<a0>(); pstrn(",")
; g_ptype<a1>(); pstrn(",")
; g_ptype<a2>(); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a0:t0
, a1:t0 }
g_print
<t0up(a0,a1)>
  ( tup ) =
let
//
val () =
  strn_print("@(")
val () =
  g_print<a0>(tup.0)
//
val () = pstrn(",")
val () =
  g_print<a1>(tup.1)
//
val () = strn_print(")")
//
end // end of [g_print<t0up2>(tup)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a0:t0
, a1:t0
, a2:t0 }
g_print
<t0up(a0,a1,a2)>
  ( tup ) =
let
//
val () =
  strn_print("@(")
val () =
  g_print<a0>(tup.0)
//
val () = pstrn(",")
val () =
  g_print<a1>(tup.1)
//
val () = pstrn(",")
val () =
  g_print<a2>(tup.2)
//
val () = strn_print(")")
//
end // end of [g_print<t0up3>(tup)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a0:t0
, a1:t0
, a2:t0
, a3:t0 }
g_print
<t0up(a0,a1,a2,a3)>
  ( tup ) =
let
//
val () =
  strn_print("@(")
val () =
  g_print<a0>(tup.0)
//
val () = pstrn(",")
val () =
  g_print<a1>(tup.1)
//
val () = pstrn(",")
val () =
  g_print<a2>(tup.2)
//
val () = pstrn(",")
val () =
  g_print<a3>(tup.3)
//
val () = strn_print(")")
//
end // end of [g_print<t0up4>(tup)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a0:t0
, a1:t0
, a2:t0
, a3:t0
, a4:t0 }
g_print
<t0up(a0,a1,a2,a3,a4)>
  ( tup ) =
let
//
val () =
  strn_print("@(")
val () =
  g_print<a0>(tup.0)
//
val () = pstrn(",")
val () =
  g_print<a1>(tup.1)
//
val () = pstrn(",")
val () =
  g_print<a2>(tup.2)
//
val () = pstrn(",")
val () =
  g_print<a3>(tup.3)
//
val () = pstrn(",")
val () =
  g_print<a4>(tup.4)
//
val () = strn_print(")")
//
end // end of [g_print<t0up5>(tup)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a0:t0
, a1:t0
, a2:t0
, a3:t0
, a4:t0
, a5:t0 }
g_print
<t0up(a0,a1,a2,a3,a4,a5)>
  ( tup ) =
let
//
val () =
  strn_print("@(")
val () =
  g_print<a0>(tup.0)
//
val () = pstrn(",")
val () =
  g_print<a1>(tup.1)
//
val () = pstrn(",")
val () =
  g_print<a2>(tup.2)
//
val () = pstrn(",")
val () =
  g_print<a3>(tup.3)
//
val () = pstrn(",")
val () =
  g_print<a4>(tup.4)
//
val () = pstrn(",")
val () =
  g_print<a5>(tup.5)
//
val () = strn_print(")")
//
end // end of [g_print<t0up6>(tup)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_tupl000.dats] *)
