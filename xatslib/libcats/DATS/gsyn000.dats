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
Thu Sep 19 04:30:38 PM EDT 2024
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./gbas000.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-19:
Thu Sep 19 04:30:48 PM EDT 2024
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
gs_prerr$beg
  ( (*void*) ): void
#extern
fun<>
gs_prerr$sep
  ( (*void*) ): void
#extern
fun<>
gs_prerr$end
  ( (*void*) ): void
//
(* ****** ****** *)
//
#extern
fun<>
gs_prerr_a0((*0*)): void
#extern
fun<>
gs_prerrln_a0((*0*)): void
//
#extern
fun
<x0:t0>
gs_prerr_a1(x0:x0): void
#extern
fun
<x0:t0>
gs_prerrln_a1(x0:x0): void
//
#extern
fun
<x0:t0>
<x1:t0>
gs_prerr_a2
  (x0: x0, x1: x1): void
#extern
fun
<x0:t0>
<x1:t0>
gs_prerrln_a2
  (x0: x0, x1: x1): void
//
#extern
fun
<x0:t0>
<x1:t0>
<x2:t0>
gs_prerr_a3
(x0: x0, x1: x1, x2: x2): void
#extern
fun
<x0:t0>
<x1:t0>
<x2:t0>
gs_prerrln_a3
(x0: x0, x1: x1, x2: x2): void
//
#extern
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
gs_prerr_a4
(x0:x0, x1:x1, x2:x2, x3:x3): void
#extern
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
gs_prerrln_a4
(x0:x0, x1:x1, x2:x2, x3:x3): void
//
#extern
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
gs_prerr_a5
(x0:x0, x1:x1, x2:x2, x3:x3, x4:x4): void
#extern
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
gs_prerrln_a5
(x0:x0, x1:x1, x2:x2, x3:x3, x4:x4): void
//
#extern
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
<x5:t0>
gs_prerr_a6
(x0:x0, x1:x1, x2:x2, x3:x3, x4:x4, x5:x5): void
#extern
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
<x5:t0>
gs_prerrln_a6
(x0:x0, x1:x1, x2:x2, x3:x3, x4:x4, x5:x5): void
//
#extern
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
<x5:t0>
<x6:t0>
gs_prerr_a7
(x0:x0, x1:x1, x2:x2, x3:x3, x4:x4, x5:x5, x6:x6): void
#extern
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
<x5:t0>
<x6:t0>
gs_prerrln_a7
(x0:x0, x1:x1, x2:x2, x3:x3, x4:x4, x5:x5, x6:x6): void
//
#extern
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
<x5:t0>
<x6:t0>
<x7:t0>
gs_prerr_a8
(x0:x0, x1:x1, x2:x2, x3:x3, x4:x4, x5:x5, x6:x6, x7:x7): void
#extern
fun
<x0:t0>
<x1:t0>
<x2:t0>
<x3:t0>
<x4:t0>
<x5:t0>
<x6:t0>
<x7:t0>
gs_prerrln_a8
(x0:x0, x1:x1, x2:x2, x3:x3, x4:x4, x5:x5, x6:x6, x7:x7): void
//
(* ****** ****** *)
//
#symload prerr with gs_prerr_a1
//
#symload prerrs with gs_prerr_a0
#symload prerrs with gs_prerr_a1
#symload prerrs with gs_prerr_a2
#symload prerrs with gs_prerr_a3
#symload prerrs with gs_prerr_a4
#symload prerrs with gs_prerr_a5
#symload prerrs with gs_prerr_a6
#symload prerrs with gs_prerr_a7
#symload prerrs with gs_prerr_a8
//
#symload prerrln with gs_prerrln_a1
//
#symload prerrsln with gs_prerrln_a0
#symload prerrsln with gs_prerrln_a1
#symload prerrsln with gs_prerrln_a2
#symload prerrsln with gs_prerrln_a3
#symload prerrsln with gs_prerrln_a4
#symload prerrsln with gs_prerrln_a5
#symload prerrsln with gs_prerrln_a6
#symload prerrsln with gs_prerrln_a7
#symload prerrsln with gs_prerrln_a8
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
gs_prerr$beg() = ((*void*))
#impltmp
<(*tmp*)>
gs_prerr$sep() = ((*void*))
#impltmp
<(*tmp*)>
gs_prerr$end() = ((*void*))
(*
#impltmp
<(*tmp*)>
g_prerr$end() = strn_prerr("\n")
*)
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
gs_prerr_a0
 ((*0*) ) =
(
gs_prerr$beg(); gs_prerr$end())
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
gs_prerr_a1
 (  x0  ) =
let
val () =
gs_prerr$beg() in//let
(
g_prerr<x0>(x0); gs_prerr$end())
end//let//end-of-[gs_prerr_a1(...)]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< x1:t0 >
gs_prerr_a2
 (x0, x1) =
let
val () =
gs_prerr$beg() in//let
(
  g_prerr<x0>(x0); gs_prerr$sep()
; g_prerr<x1>(x1); gs_prerr$end())
end//let//end-of-[gs_prerr_a2(...)]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
gs_prerr_a3
( x0
, x1, x2) =
let
val () =
gs_prerr$beg() in//let
(
  g_prerr<x0>(x0); gs_prerr$sep()
; g_prerr<x1>(x1); gs_prerr$sep()
; g_prerr<x2>(x2); gs_prerr$end())
end//let//end-of-[gs_prerr_a3(...)]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
gs_prerr_a4
( x0, x1
, x2, x3) =
let
val () =
gs_prerr$beg() in//let
(
  g_prerr<x0>(x0); gs_prerr$sep()
; g_prerr<x1>(x1); gs_prerr$sep()
; g_prerr<x2>(x2); gs_prerr$sep()
; g_prerr<x3>(x3); gs_prerr$end())
end//let//end-of-[gs_prerr_a4(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
gs_prerr_a5
( x0, x1
, x2, x3, x4) =
let
val () =
gs_prerr$beg() in//let
(
  g_prerr<x0>(x0); gs_prerr$sep()
; g_prerr<x1>(x1); gs_prerr$sep()
; g_prerr<x2>(x2); gs_prerr$sep()
; g_prerr<x3>(x3); gs_prerr$sep()
; g_prerr<x4>(x4); gs_prerr$end())
end//let//end-of-[gs_prerr_a5(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
gs_prerr_a6
( x0, x1, x2
, x3, x4, x5) =
let
val () =
gs_prerr$beg() in//let
(
  g_prerr<x0>(x0); gs_prerr$sep()
; g_prerr<x1>(x1); gs_prerr$sep()
; g_prerr<x2>(x2); gs_prerr$sep()
; g_prerr<x3>(x3); gs_prerr$sep()
; g_prerr<x4>(x4); gs_prerr$sep()
; g_prerr<x5>(x5); gs_prerr$end())
end//let//end-of-[gs_prerr_a6(...)]
//
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
gs_prerr_a7
( x0, x1, x2
, x3, x4, x5, x6) =
let
val () =
gs_prerr$beg() in//let
(
  g_prerr<x0>(x0); gs_prerr$sep()
; g_prerr<x1>(x1); gs_prerr$sep()
; g_prerr<x2>(x2); gs_prerr$sep()
; g_prerr<x3>(x3); gs_prerr$sep()
; g_prerr<x4>(x4); gs_prerr$sep()
; g_prerr<x5>(x5); gs_prerr$sep()
; g_prerr<x6>(x6); gs_prerr$end())
end//let//end-of-[gs_prerr_a7(...)]
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
gs_prerr_a8
( x0, x1, x2, x3
, x4, x5, x6, x7) =
let
val () =
gs_prerr$beg() in//let
(
  g_prerr<x0>(x0); gs_prerr$sep()
; g_prerr<x1>(x1); gs_prerr$sep()
; g_prerr<x2>(x2); gs_prerr$sep()
; g_prerr<x3>(x3); gs_prerr$sep()
; g_prerr<x4>(x4); gs_prerr$sep()
; g_prerr<x5>(x5); gs_prerr$sep()
; g_prerr<x6>(x5); gs_prerr$sep()
; g_prerr<x7>(x6); gs_prerr$end())
end//let//end-of-[gs_prerr_a8(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
gs_prerrln_a0
 ((*0*) ) =
(gs_prerr_a0<>((*0*)); g_prerr("\n"))
#impltmp
< x0:t0 >
gs_prerrln_a1
 (  x0  ) =
(gs_prerr_a1<x0>( x0 ); g_prerr("\n"))
#impltmp
< x0:t0 >
< x1:t0 >
gs_prerrln_a2
 (x0, x1) =
(gs_prerr_a2<x0><x1>(x0,x1); g_prerr("\n"))
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
gs_prerrln_a3
( x0
, x1, x2) =
(gs_prerr_a3<x0><x1><x2>(x0,x1,x2); g_prerr("\n"))
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
gs_prerrln_a4
( x0, x1
, x2, x3) =
(gs_prerr_a4<x0><x1><x2><x3>(x0,x1,x2,x3); g_prerr("\n"))
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
gs_prerrln_a5
( x0, x1
, x2, x3, x4) =
(gs_prerr_a5<x0><x1><x2><x3><x4>(x0,x1,x2,x3,x4); g_prerr("\n"))
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
gs_prerrln_a6
( x0, x1, x2
, x3, x4, x5) =
(gs_prerr_a6<x0><x1><x2><x3><x4><x5>(x0,x1,x2,x3,x4,x5); g_prerr("\n"))
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
gs_prerrln_a7
( x0, x1, x2
, x3, x4, x5, x6) =
(gs_prerr_a7<x0><x1><x2><x3><x4><x5><x6>(x0,x1,x2,x3,x4,x5,x6); g_prerr("\n"))
#impltmp
< x0:t0 >
< x1:t0 >
< x2:t0 >
< x3:t0 >
< x4:t0 >
< x5:t0 >
< x6:t0 >
< x7:t0 >
gs_prerrln_a8
( x0, x1, x2, x3
, x4, x5, x6, x7) =
(gs_prerr_a8<x0><x1><x2><x3><x4><x5><x6><x7>(x0,x1,x2,x3,x4,x5,x6,x7); g_prerr("\n"))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_libcats_DATS_gsyn000.dats] *)
