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
Sat 27 Jul 2024 01:32:19 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-29:
Mon 29 Jul 2024 03:17:20 PM EDT
*)
//
#impltmp
< x0:t0 >
gs_add_a0() =
g_0<x0>((*void*))
//
#impltmp
< x0:t0 >
gs_add_a1(x1) = x1
//
#impltmp
< x0:t0 >
gs_add_a2
(x1, x2) =
(
g_add<x0>(x1, x2)
) (* end of [gs_add_a2] *)
#impltmp
< x0:t0 >
gs_add_a3
(x1, x2, x3) =
let
fun
f0(x, y) =
g_add<x0>(x, y)
in//let
  f0(f0(x1, x2), x3)
end (*let*) // end of [gs_add_a3]
#impltmp
< x0:t0 >
gs_add_a4
(x1, x2, x3, x4) =
let
fun
f0(x, y) =
g_add<x0>(x, y)
in//let
  f0(f0(f0(x1,x2),x3),x4)
end (*let*) // end of [gs_add_a4]
#impltmp
< x0:t0 >
gs_add_a5
(x1, x2, x3, x4, x5) =
let
fun
f0(x, y) =
g_add<x0>(x, y)
in//let
f0(f0(f0(f0(x1,x2),x3),x4),x5)
end (*let*) // end of [gs_add_a5]
#impltmp
< x0:t0 >
gs_add_a6
(x1, x2, x3, x4, x5, x6) =
let
fun
f0(x, y) =
g_add<x0>(x, y)
in//let
f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6)
end (*let*) // end of [gs_add_a6]
#impltmp
< x0:t0 >
gs_add_a7
(x1, x2, x3, x4, x5, x6, x7) =
let
fun
f0(x, y) =
g_add<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7)
end (*let*) // end of [gs_add_a7]
#impltmp
< x0:t0 >
gs_add_a8
(x1, x2, x3, x4, x5, x6, x7, x8) =
let
fun
f0(x, y) =
g_add<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8)
end (*let*) // end of [gs_add_a8]
#impltmp
< x0:t0 >
gs_add_a9
(x1, x2, x3, x4, x5, x6, x7, x8, x9) =
let
fun
f0(x, y) =
g_add<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9)
end (*let*) // end of [gs_add_a9]
//
#impltmp
< x0:t0 >
gs_add_a10
(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10) =
let
fun
f0(x, y) =
g_add<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9),x10)
end (*let*) // end of [gs_add_a10]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
gs_add_a11
(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11) =
let
fun
f0(x, y) =
g_add<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9),x10),x11)
end (*let*) // end of [gs_add_a11]
//
#impltmp
< x0:t0 >
gs_add_a12
(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12) =
let
fun
f0(x, y) =
g_add<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9),x10),x11),x12)
end (*let*) // end of [gs_add_a12]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-29:
Mon 29 Jul 2024 03:17:20 PM EDT
*)
//
#impltmp
< x0:t0 >
gs_mul_a0() =
g_1<x0>((*void*))
//
#impltmp
< x0:t0 >
gs_mul_a1(x1) = x1
//
#impltmp
< x0:t0 >
gs_mul_a2
(x1, x2) =
(
g_mul<x0>(x1, x2)
) (* end of [gs_mul_a2] *)
#impltmp
< x0:t0 >
gs_mul_a3
(x1, x2, x3) =
let
fun
f0(x, y) =
g_mul<x0>(x, y)
in//let
  f0(f0(x1, x2), x3)
end (*let*) // end of [gs_mul_a3]
#impltmp
< x0:t0 >
gs_mul_a4
(x1, x2, x3, x4) =
let
fun
f0(x, y) =
g_mul<x0>(x, y)
in//let
  f0(f0(f0(x1,x2),x3),x4)
end (*let*) // end of [gs_mul_a4]
#impltmp
< x0:t0 >
gs_mul_a5
(x1, x2, x3, x4, x5) =
let
fun
f0(x, y) =
g_mul<x0>(x, y)
in//let
f0(f0(f0(f0(x1,x2),x3),x4),x5)
end (*let*) // end of [gs_mul_a5]
#impltmp
< x0:t0 >
gs_mul_a6
(x1, x2, x3, x4, x5, x6) =
let
fun
f0(x, y) =
g_mul<x0>(x, y)
in//let
f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6)
end (*let*) // end of [gs_mul_a6]
#impltmp
< x0:t0 >
gs_mul_a7
(x1, x2, x3, x4, x5, x6, x7) =
let
fun
f0(x, y) =
g_mul<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7)
end (*let*) // end of [gs_mul_a7]
#impltmp
< x0:t0 >
gs_mul_a8
(x1, x2, x3, x4, x5, x6, x7, x8) =
let
fun
f0(x, y) =
g_mul<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8)
end (*let*) // end of [gs_mul_a8]
#impltmp
< x0:t0 >
gs_mul_a9
(x1, x2, x3, x4, x5, x6, x7, x8, x9) =
let
fun
f0(x, y) =
g_mul<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9)
end (*let*) // end of [gs_mul_a9]
//
#impltmp
< x0:t0 >
gs_mul_a10
(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10) =
let
fun
f0(x, y) =
g_mul<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9),x10)
end (*let*) // end of [gs_mul_a10]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
gs_mul_a11
(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11) =
let
fun
f0(x, y) =
g_mul<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9),x10),x11)
end (*let*) // end of [gs_mul_a11]
//
#impltmp
< x0:t0 >
gs_mul_a12
(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12) =
let
fun
f0(x, y) =
g_mul<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9),x10),x11),x12)
end (*let*) // end of [gs_mul_a12]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-29:
Mon 29 Jul 2024 03:17:20 PM EDT
*)
//
(*
#impltmp
< x0:t0 >
gs_max_a0() =
( -infinity )
#impltmp
< x0:t0 >
gs_max_a1(x1) = x1
*)
//
#impltmp
< x0:t0 >
gs_max_a2
(x1, x2) =
(
g_max<x0>(x1, x2)
) (* end of [gs_max_a2] *)
#impltmp
< x0:t0 >
gs_max_a3
(x1, x2, x3) =
let
fun
f0(x, y) =
g_max<x0>(x, y)
in//let
  f0(f0(x1, x2), x3)
end (*let*) // end of [gs_max_a3]
#impltmp
< x0:t0 >
gs_max_a4
(x1, x2, x3, x4) =
let
fun
f0(x, y) =
g_max<x0>(x, y)
in//let
  f0(f0(f0(x1,x2),x3),x4)
end (*let*) // end of [gs_max_a4]
#impltmp
< x0:t0 >
gs_max_a5
(x1, x2, x3, x4, x5) =
let
fun
f0(x, y) =
g_max<x0>(x, y)
in//let
f0(f0(f0(f0(x1,x2),x3),x4),x5)
end (*let*) // end of [gs_max_a5]
#impltmp
< x0:t0 >
gs_max_a6
(x1, x2, x3, x4, x5, x6) =
let
fun
f0(x, y) =
g_max<x0>(x, y)
in//let
f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6)
end (*let*) // end of [gs_max_a6]
#impltmp
< x0:t0 >
gs_max_a7
(x1, x2, x3, x4, x5, x6, x7) =
let
fun
f0(x, y) =
g_max<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7)
end (*let*) // end of [gs_max_a7]
#impltmp
< x0:t0 >
gs_max_a8
(x1, x2, x3, x4, x5, x6, x7, x8) =
let
fun
f0(x, y) =
g_max<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8)
end (*let*) // end of [gs_max_a8]
#impltmp
< x0:t0 >
gs_max_a9
(x1, x2, x3, x4, x5, x6, x7, x8, x9) =
let
fun
f0(x, y) =
g_max<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9)
end (*let*) // end of [gs_max_a9]
//
#impltmp
< x0:t0 >
gs_max_a10
(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10) =
let
fun
f0(x, y) =
g_max<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9),x10)
end (*let*) // end of [gs_max_a10]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
gs_max_a11
(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11) =
let
fun
f0(x, y) =
g_max<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9),x10),x11)
end (*let*) // end of [gs_max_a11]
//
#impltmp
< x0:t0 >
gs_max_a12
(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12) =
let
fun
f0(x, y) =
g_max<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9),x10),x11),x12)
end (*let*) // end of [gs_max_a12]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-29:
Mon 29 Jul 2024 03:17:20 PM EDT
*)
//
(*
#impltmp
< x0:t0 >
gs_min_a0() =
( +infinity )
#impltmp
< x0:t0 >
gs_min_a1(x1) = x1
*)
//
#impltmp
< x0:t0 >
gs_min_a2
(x1, x2) =
(
g_min<x0>(x1, x2)
) (* end of [gs_min_a2] *)
#impltmp
< x0:t0 >
gs_min_a3
(x1, x2, x3) =
let
fun
f0(x, y) =
g_min<x0>(x, y)
in//let
  f0(f0(x1, x2), x3)
end (*let*) // end of [gs_min_a3]
#impltmp
< x0:t0 >
gs_min_a4
(x1, x2, x3, x4) =
let
fun
f0(x, y) =
g_min<x0>(x, y)
in//let
  f0(f0(f0(x1,x2),x3),x4)
end (*let*) // end of [gs_min_a4]
#impltmp
< x0:t0 >
gs_min_a5
(x1, x2, x3, x4, x5) =
let
fun
f0(x, y) =
g_min<x0>(x, y)
in//let
f0(f0(f0(f0(x1,x2),x3),x4),x5)
end (*let*) // end of [gs_min_a5]
#impltmp
< x0:t0 >
gs_min_a6
(x1, x2, x3, x4, x5, x6) =
let
fun
f0(x, y) =
g_min<x0>(x, y)
in//let
f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6)
end (*let*) // end of [gs_min_a6]
#impltmp
< x0:t0 >
gs_min_a7
(x1, x2, x3, x4, x5, x6, x7) =
let
fun
f0(x, y) =
g_min<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7)
end (*let*) // end of [gs_min_a7]
#impltmp
< x0:t0 >
gs_min_a8
(x1, x2, x3, x4, x5, x6, x7, x8) =
let
fun
f0(x, y) =
g_min<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8)
end (*let*) // end of [gs_min_a8]
#impltmp
< x0:t0 >
gs_min_a9
(x1, x2, x3, x4, x5, x6, x7, x8, x9) =
let
fun
f0(x, y) =
g_min<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9)
end (*let*) // end of [gs_min_a9]
//
#impltmp
< x0:t0 >
gs_min_a10
(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10) =
let
fun
f0(x, y) =
g_min<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9),x10)
end (*let*) // end of [gs_min_a10]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
gs_min_a11
(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11) =
let
fun
f0(x, y) =
g_min<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9),x10),x11)
end (*let*) // end of [gs_min_a11]
//
#impltmp
< x0:t0 >
gs_min_a12
(x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12) =
let
fun
f0(x, y) =
g_min<x0>(x, y)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(f0(f0(f0(x1,x2),x3),x4),x5),x6),x7),x8),x9),x10),x11),x12)
end (*let*) // end of [gs_min_a12]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
gs_free_a1
 (  x0  ) =
(
  g_free<x0>(x0))
//
#impltmp
< x0:vt >
< x1:vt >
gs_free_a2
 (x0, x1) =
(
  g_free<x0>(x0); g_free<x1>(x1))
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
gs_free_a3
( x0
, x1, x2) =
( g_free<x0>(x0)
; g_free<x1>(x1); g_free<x2>(x2))
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
gs_free_a4
( x0, x1
, x2, x3) =
( g_free<x0>(x0); g_free<x1>(x1)
; g_free<x2>(x2); g_free<x3>(x3))
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
gs_free_a5
( x0, x1
, x2, x3, x4) =
( g_free<x0>(x0)
; g_free<x1>(x1); g_free<x2>(x2)
; g_free<x3>(x3); g_free<x4>(x4))
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
gs_free_a6
( x0, x1, x2
, x3, x4, x5) =
( g_free<x0>(x0); g_free<x1>(x1)
; g_free<x2>(x2); g_free<x3>(x3)
; g_free<x4>(x4); g_free<x5>(x5))
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
gs_free_a7
( x0, x1, x2
, x3, x4, x5, x6) =
( g_free<x0>(x0)
; g_free<x1>(x1); g_free<x2>(x2)
; g_free<x3>(x3); g_free<x4>(x4)
; g_free<x5>(x5); g_free<x6>(x6))
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
< x7:vt >
gs_free_a8
( x0, x1, x2, x3
, x4, x5, x6, x7) =
( g_free<x0>(x0); g_free<x1>(x1)
; g_free<x2>(x2); g_free<x3>(x3)
; g_free<x4>(x4); g_free<x5>(x5)
; g_free<x6>(x6); g_free<x7>(x7))
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
< x7:vt >
< x8:vt >
gs_free_a9
( x0, x1, x2, x3
, x4, x5, x6, x7, x8) =
( g_free<x0>(x0)
; g_free<x1>(x1); g_free<x2>(x2)
; g_free<x3>(x3); g_free<x4>(x4)
; g_free<x5>(x5); g_free<x6>(x6)
; g_free<x7>(x7); g_free<x8>(x8))
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
< x7:vt >
< x8:vt >
< x9:vt >
gs_free_a10
( x0, x1, x2, x3, x4
, x5, x6, x7, x8, x9) =
( g_free<x0>(x0); g_free<x1>(x1)
; g_free<x2>(x2); g_free<x3>(x3)
; g_free<x4>(x4); g_free<x5>(x5)
; g_free<x6>(x6); g_free<x7>(x7)
; g_free<x8>(x8); g_free<x9>(x9))
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
< x7:vt >
< x8:vt >
< x9:vt >
< x10:vt >
gs_free_a11
( x0, x1, x2, x3, x4
, x5, x6, x7, x8, x9, x10) =
( g_free<x0>(x0)
; g_free<x1>(x1); g_free<x2>(x2)
; g_free<x3>(x3); g_free<x4>(x4)
; g_free<x5>(x5); g_free<x6>(x6)
; g_free<x7>(x7); g_free<x8>(x8)
; g_free<x9>(x9); g_free<x10>(x10))
//
#impltmp
< x0:vt >
< x1:vt >
< x2:vt >
< x3:vt >
< x4:vt >
< x5:vt >
< x6:vt >
< x7:vt >
< x8:vt >
< x9:vt >
< x10:vt >
< x11:vt >
gs_free_a12
( x0, x1, x2, x3, x4, x5
, x6, x7, x8, x9, x10, x11) =
( g_free<x0>(x0); g_free<x1>(x1)
; g_free<x2>(x2); g_free<x3>(x3)
; g_free<x4>(x4); g_free<x5>(x5)
; g_free<x6>(x6); g_free<x7>(x7)
; g_free<x8>(x8); g_free<x9>(x9)
; g_free<x10>(x10); g_free<x11>(x11))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
gs_work$beg() = ()
#impltmp
<(*tmp*)>
gs_work$sep() = ()
#impltmp
<(*tmp*)>
gs_work$end() = ()
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
gs_work_a0
 ((*0*) ) =
(
gs_work$beg(); gs_work$end())
//
#impltmp
< x0:t0 >
gs_work_a1
 (  x0  ) =
let
val () =
gs_work$beg() in//let
(
g_work<x0>(x0); gs_work$end())
end//let//end-of-[gs_work_a1(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
gs_work_a2
 (x0, x1) =
let
val () =
gs_work$beg() in//let
(
  g_work<x0>(x0); gs_work$sep()
; g_work<x1>(x1); gs_work$end())
end//let//end-of-[gs_work_a2(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
gs_work_a3
( x0
, x1, x2) =
let
val () =
gs_work$beg() in//let
(
  g_work<x0>(x0); gs_work$sep()
; g_work<x1>(x1); gs_work$sep()
; g_work<x2>(x2); gs_work$end())
end//let//end-of-[gs_work_a3(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
gs_work_a4
( x0, x1
, x2, x3) =
let
val () =
gs_work$beg() in//let
(
  g_work<x0>(x0); gs_work$sep()
; g_work<x1>(x1); gs_work$sep()
; g_work<x2>(x2); gs_work$sep()
; g_work<x3>(x3); gs_work$end())
end//let//end-of-[gs_work_a4(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
gs_work_a5
( x0, x1
, x2, x3, x4) =
let
val () =
gs_work$beg() in//let
(
  g_work<x0>(x0); gs_work$sep()
; g_work<x1>(x1); gs_work$sep()
; g_work<x2>(x2); gs_work$sep()
; g_work<x3>(x3); gs_work$sep()
; g_work<x4>(x4); gs_work$end())
end//let//end-of-[gs_work_a5(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
gs_work_a6
( x0, x1, x2
, x3, x4, x5) =
let
val () =
gs_work$beg() in//let
(
  g_work<x0>(x0); gs_work$sep()
; g_work<x1>(x1); gs_work$sep()
; g_work<x2>(x2); gs_work$sep()
; g_work<x3>(x3); gs_work$sep()
; g_work<x4>(x4); gs_work$sep()
; g_work<x5>(x5); gs_work$end())
end//let//end-of-[gs_work_a6(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
gs_work_a7
( x0, x1, x2
, x3, x4, x5, x6) =
let
val () =
gs_work$beg() in//let
(
  g_work<x0>(x0); gs_work$sep()
; g_work<x1>(x1); gs_work$sep()
; g_work<x2>(x2); gs_work$sep()
; g_work<x3>(x3); gs_work$sep()
; g_work<x4>(x4); gs_work$sep()
; g_work<x5>(x5); gs_work$sep()
; g_work<x6>(x6); gs_work$end())
end//let//end-of-[gs_work_a7(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
gs_work_a8
( x0, x1, x2, x3
, x4, x5, x6, x7) =
let
val () =
gs_work$beg() in//let
(
  g_work<x0>(x0); gs_work$sep()
; g_work<x1>(x1); gs_work$sep()
; g_work<x2>(x2); gs_work$sep()
; g_work<x3>(x3); gs_work$sep()
; g_work<x4>(x4); gs_work$sep()
; g_work<x5>(x5); gs_work$sep()
; g_work<x6>(x6); gs_work$sep()
; g_work<x7>(x7); gs_work$end())
end//let//end-of-[gs_work_a8(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
gs_work_a9
( x0, x1, x2, x3
, x4, x5, x6, x7, x8) =
let
val () =
gs_work$beg() in//let
(
  g_work<x0>(x0); gs_work$sep()
; g_work<x1>(x1); gs_work$sep()
; g_work<x2>(x2); gs_work$sep()
; g_work<x3>(x3); gs_work$sep()
; g_work<x4>(x4); gs_work$sep()
; g_work<x5>(x5); gs_work$sep()
; g_work<x6>(x6); gs_work$sep()
; g_work<x7>(x7); gs_work$sep()
; g_work<x8>(x8); gs_work$end())
end//let//end-of-[gs_work_a9(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
< x9:t0 >
gs_work_a10
( x0, x1, x2, x3, x4
, x5, x6, x7, x8, x9) =
let
val () =
gs_work$beg() in//let
(
  g_work<x0>(x0); gs_work$sep()
; g_work<x1>(x1); gs_work$sep()
; g_work<x2>(x2); gs_work$sep()
; g_work<x3>(x3); gs_work$sep()
; g_work<x4>(x4); gs_work$sep()
; g_work<x5>(x5); gs_work$sep()
; g_work<x6>(x6); gs_work$sep()
; g_work<x7>(x7); gs_work$sep()
; g_work<x8>(x8); gs_work$sep()
; g_work<x9>(x9); gs_work$end())
end//let//end-of-[gs_work_a10(...)]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
< x9:t0 >
< x10:t0 >
gs_work_a11
( x0, x1, x2, x3, x4
, x5, x6, x7, x8, x9, x10) =
let
val () =
gs_work$beg() in//let
(
  g_work<x0>(x0); gs_work$sep()
; g_work<x1>(x1); gs_work$sep()
; g_work<x2>(x2); gs_work$sep()
; g_work<x3>(x3); gs_work$sep()
; g_work<x4>(x4); gs_work$sep()
; g_work<x5>(x5); gs_work$sep()
; g_work<x6>(x6); gs_work$sep()
; g_work<x7>(x7); gs_work$sep()
; g_work<x8>(x8); gs_work$sep()
; g_work<x9>(x9); gs_work$sep()
; g_work<x10>(x10); gs_work$end())
end//let//end-of-[gs_work_a11(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
< x9:t0 >
< x10:t0 >
< x11:t0 >
gs_work_a12
( x0, x1, x2, x3, x4, x5
, x6, x7, x8, x9, x10, x11) =
let
val () =
gs_work$beg() in//let
(
  g_work<x0>(x0); gs_work$sep()
; g_work<x1>(x1); gs_work$sep()
; g_work<x2>(x2); gs_work$sep()
; g_work<x3>(x3); gs_work$sep()
; g_work<x4>(x4); gs_work$sep()
; g_work<x5>(x5); gs_work$sep()
; g_work<x6>(x6); gs_work$sep()
; g_work<x7>(x7); gs_work$sep()
; g_work<x8>(x8); gs_work$sep()
; g_work<x9>(x9); gs_work$sep()
; g_work<x10>(x10); gs_work$sep()
; g_work<x11>(x11); gs_work$end())
end//let//end-of-[gs_work_a12(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
gs_print$beg() = ()
#impltmp
<(*tmp*)>
gs_print$sep() = ()
#impltmp
<(*tmp*)>
gs_print$end() = ()
(*
#impltmp
<(*tmp*)>
g_print$end() = strn_print("\n")
*)
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
gs_print_a0
 ((*0*) ) =
(
gs_print$beg(); gs_print$end())
//
#impltmp
< x0:t0 >
gs_print_a1
 (  x0  ) =
let
val () =
gs_print$beg() in//let
(
g_print<x0>(x0); gs_print$end())
end//let//end-of-[gs_print_a1(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
gs_print_a2
 (x0, x1) =
let
val () =
gs_print$beg() in//let
(
  g_print<x0>(x0); gs_print$sep()
; g_print<x1>(x1); gs_print$end())
end//let//end-of-[gs_print_a2(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
gs_print_a3
( x0
, x1, x2) =
let
val () =
gs_print$beg() in//let
(
  g_print<x0>(x0); gs_print$sep()
; g_print<x1>(x1); gs_print$sep()
; g_print<x2>(x2); gs_print$end())
end//let//end-of-[gs_print_a3(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
gs_print_a4
( x0, x1
, x2, x3) =
let
val () =
gs_print$beg() in//let
(
  g_print<x0>(x0); gs_print$sep()
; g_print<x1>(x1); gs_print$sep()
; g_print<x2>(x2); gs_print$sep()
; g_print<x3>(x3); gs_print$end())
end//let//end-of-[gs_print_a4(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
gs_print_a5
( x0, x1
, x2, x3, x4) =
let
val () =
gs_print$beg() in//let
(
  g_print<x0>(x0); gs_print$sep()
; g_print<x1>(x1); gs_print$sep()
; g_print<x2>(x2); gs_print$sep()
; g_print<x3>(x3); gs_print$sep()
; g_print<x4>(x4); gs_print$end())
end//let//end-of-[gs_print_a5(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
gs_print_a6
( x0, x1, x2
, x3, x4, x5) =
let
val () =
gs_print$beg() in//let
(
  g_print<x0>(x0); gs_print$sep()
; g_print<x1>(x1); gs_print$sep()
; g_print<x2>(x2); gs_print$sep()
; g_print<x3>(x3); gs_print$sep()
; g_print<x4>(x4); gs_print$sep()
; g_print<x5>(x5); gs_print$end())
end//let//end-of-[gs_print_a6(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
gs_print_a7
( x0, x1, x2
, x3, x4, x5, x6) =
let
val () =
gs_print$beg() in//let
(
  g_print<x0>(x0); gs_print$sep()
; g_print<x1>(x1); gs_print$sep()
; g_print<x2>(x2); gs_print$sep()
; g_print<x3>(x3); gs_print$sep()
; g_print<x4>(x4); gs_print$sep()
; g_print<x5>(x5); gs_print$sep()
; g_print<x6>(x6); gs_print$end())
end//let//end-of-[gs_print_a7(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
gs_print_a8
( x0, x1, x2, x3
, x4, x5, x6, x7) =
let
val () =
gs_print$beg() in//let
(
  g_print<x0>(x0); gs_print$sep()
; g_print<x1>(x1); gs_print$sep()
; g_print<x2>(x2); gs_print$sep()
; g_print<x3>(x3); gs_print$sep()
; g_print<x4>(x4); gs_print$sep()
; g_print<x5>(x5); gs_print$sep()
; g_print<x6>(x6); gs_print$sep()
; g_print<x7>(x7); gs_print$end())
end//let//end-of-[gs_print_a8(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
gs_print_a9
( x0, x1, x2, x3
, x4, x5, x6, x7, x8) =
let
val () =
gs_print$beg() in//let
(
  g_print<x0>(x0); gs_print$sep()
; g_print<x1>(x1); gs_print$sep()
; g_print<x2>(x2); gs_print$sep()
; g_print<x3>(x3); gs_print$sep()
; g_print<x4>(x4); gs_print$sep()
; g_print<x5>(x5); gs_print$sep()
; g_print<x6>(x6); gs_print$sep()
; g_print<x7>(x7); gs_print$sep()
; g_print<x8>(x8); gs_print$end())
end//let//end-of-[gs_print_a9(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
< x9:t0 >
gs_print_a10
( x0, x1, x2, x3, x4
, x5, x6, x7, x8, x9) =
let
val () =
gs_print$beg() in//let
(
  g_print<x0>(x0); gs_print$sep()
; g_print<x1>(x1); gs_print$sep()
; g_print<x2>(x2); gs_print$sep()
; g_print<x3>(x3); gs_print$sep()
; g_print<x4>(x4); gs_print$sep()
; g_print<x5>(x5); gs_print$sep()
; g_print<x6>(x6); gs_print$sep()
; g_print<x7>(x7); gs_print$sep()
; g_print<x8>(x8); gs_print$sep()
; g_print<x9>(x9); gs_print$end())
end//let//end-of-[gs_print_a10(...)]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
< x9:t0 >
< x10:t0 >
gs_print_a11
( x0, x1, x2, x3, x4
, x5, x6, x7, x8, x9, x10) =
let
val () =
gs_print$beg() in//let
(
  g_print<x0>(x0); gs_print$sep()
; g_print<x1>(x1); gs_print$sep()
; g_print<x2>(x2); gs_print$sep()
; g_print<x3>(x3); gs_print$sep()
; g_print<x4>(x4); gs_print$sep()
; g_print<x5>(x5); gs_print$sep()
; g_print<x6>(x6); gs_print$sep()
; g_print<x7>(x7); gs_print$sep()
; g_print<x8>(x8); gs_print$sep()
; g_print<x9>(x9); gs_print$sep()
; g_print<x10>(x10); gs_print$end()
)
end//let//end-of-[gs_print_a11(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
< x9:t0 >
< x10:t0 >
< x11:t0 >
gs_print_a12
( x0, x1, x2, x3, x4, x5
, x6, x7, x8, x9, x10, x11) =
let
val () =
gs_print$beg() in//let
(
  g_print<x0>(x0); gs_print$sep()
; g_print<x1>(x1); gs_print$sep()
; g_print<x2>(x2); gs_print$sep()
; g_print<x3>(x3); gs_print$sep()
; g_print<x4>(x4); gs_print$sep()
; g_print<x5>(x5); gs_print$sep()
; g_print<x6>(x6); gs_print$sep()
; g_print<x7>(x7); gs_print$sep()
; g_print<x8>(x8); gs_print$sep()
; g_print<x9>(x9); gs_print$sep()
; g_print<x10>(x10); gs_print$sep()
; g_print<x11>(x11); gs_print$end()
)
end//let//end-of-[gs_print_a12(...)]
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
gs_println_a0
 ((*0*)) =
(
  gs_print_a0<>((*0*)); g_print("\n"))
//
#impltmp
< x0:t0 >
gs_println_a1
 (  x0  ) =
(
  gs_print_a1<x0>( x0 ); g_print("\n"))
//
#impltmp
< x0:t0 >
< x1:t0 >
gs_println_a2
 (x0, x1) =
(
  gs_print_a2<x0><x1>(x0,x1); g_print("\n"))
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
gs_println_a3
( x0
, x1, x2) =
(
  gs_print_a3<x0><x1><x2>(x0,x1,x2); g_print("\n"))
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
gs_println_a4
( x0, x1
, x2, x3) =
(
  gs_print_a4<x0><x1><x2><x3>(x0,x1,x2,x3); g_print("\n"))
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
gs_println_a5
( x0, x1
, x2, x3, x4) =
(
  gs_print_a5<x0><x1><x2><x3><x4>(x0,x1,x2,x3,x4); g_print("\n"))
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
gs_println_a6
( x0, x1, x2
, x3, x4, x5) =
(
  gs_print_a6<x0><x1><x2><x3><x4><x5>(x0,x1,x2,x3,x4,x5); g_print("\n"))
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
gs_println_a7
( x0, x1, x2
, x3, x4, x5, x6) =
(
  gs_print_a7<x0><x1><x2><x3><x4><x5><x6>(x0,x1,x2,x3,x4,x5,x6); g_print("\n"))
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
gs_println_a8
( x0, x1, x2, x3
, x4, x5, x6, x7) =
(
  gs_print_a8<x0><x1><x2><x3><x4><x5><x6><x7>(x0,x1,x2,x3,x4,x5,x6,x7); g_print("\n"))
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
gs_println_a9
( x0
, x1, x2, x3, x4
, x5, x6, x7, x8) =
(
  gs_print_a9<x0><x1><x2><x3><x4><x5><x6><x7><x8>(x0,x1,x2,x3,x4,x5,x6,x7,x8); g_print("\n"))
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
< x8:t0 >
< x9:t0 >
gs_println_a10
( x0, x1
, x2, x3, x4, x5
, x6, x7, x8, x9) =
(
  gs_print_a10<x0><x1><x2><x3><x4><x5><x6><x7><x8><x9>(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9); g_print("\n"))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-24:
Wed 31 Jul 2024 08:01:45 PM EDT
*)
//
(*
#impltmp
< xs:t0 >
gs_append_a0
  ((*0*)) =
g_0<xs>((*void*))
*)
//
(*
#impltmp
< xs:t0 >
gs_append_a1
  ( y1 ) = (y1)
*)
//
#impltmp
< xs:t0 >
gs_append_a2
  (y1, y2) =
(
g_append<xs>(y1, y2)
) (* end of [gs_append_a2] *)
#impltmp
< xs:t0 >
gs_append_a3
(y1, y2, y3) =
let
fun
f0(u, v) =
g_append<xs>(u, v)
in//let
  f0(f0(y1, y2), y3)
end (*let*) // end of [gs_append_a3]
#impltmp
< xs:t0 >
gs_append_a4
(y1, y2, y3, y4) =
let
fun
f0(u, v) =
g_append<xs>(u, v)
in//let
  f0(f0(f0(y1,y2),y3),y4)
end (*let*) // end of [gs_append_a4]
#impltmp
< xs:t0 >
gs_append_a5
(y1, y2, y3, y4, y5) =
let
fun
f0(u, v) =
g_append<xs>(u, v)
in//let
f0(f0(f0(f0(y1,y2),y3),y4),y5)
end (*let*) // end of [gs_append_a5]
#impltmp
< xs:t0 >
gs_append_a6
(y1, y2, y3, y4, y5, y6) =
let
fun
f0(u, v) =
g_append<xs>(u, v)
in//let
f0(f0(f0(f0(f0(y1,y2),y3),y4),y5),y6)
end (*let*) // end of [gs_append_a6]
#impltmp
< xs:t0 >
gs_append_a7
(y1, y2, y3, y4, y5, y6, y7) =
let
fun
f0(u, v) =
g_append<xs>(u, v)
in//let
f0(f0(f0(f0(f0(f0(y1,y2),y3),y4),y5),y6),y7)
end (*let*) // end of [gs_append_a7]
#impltmp
< xs:t0 >
gs_append_a8
(y1, y2, y3, y4, y5, y6, y7, y8) =
let
fun
f0(u, v) =
g_append<xs>(u, v)
in//let
f0(f0(f0(f0(f0(f0(f0(y1,y2),y3),y4),y5),y6),y7),y8)
end (*let*) // end of [gs_append_a8]
#impltmp
< xs:t0 >
gs_append_a9
(y1, y2, y3, y4, y5, y6, y7, y8, y9) =
let
fun
f0(u, v) =
g_append<xs>(u, v)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(y1,y2),y3),y4),y5),y6),y7),y8),y9)
end (*let*) // end of [gs_append_a9]
//
#impltmp
< xs:t0 >
gs_append_a10
(y1, y2, y3, y4, y5, y6, y7, y8, y9, y10) =
let
fun
f0(u, v) =
g_append<xs>(u, v)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(f0(y1,y2),y3),y4),y5),y6),y7),y8),y9),y10)
end (*let*) // end of [gs_append_a10]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
gs_append_a11
(y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11) =
let
fun
f0(u, v) =
g_append<xs>(u, v)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(f0(f0(y1,y2),y3),y4),y5),y6),y7),y8),y9),y10),y11)
end (*let*) // end of [gs_append_a11]
//
#impltmp
< xs:t0 >
gs_append_a12
(y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12) =
let
fun
f0(u, v) =
g_append<xs>(u, v)
in//let
f0(f0(f0(f0(f0(f0(f0(f0(f0(f0(f0(y1,y2),y3),y4),y5),y6),y7),y8),y9),y10),y11),y12)
end (*let*) // end of [gs_append_a12]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gsyn000.dats] *)
