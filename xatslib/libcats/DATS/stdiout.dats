(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
//
// For generic ordering
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: April, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#staload
"xatslib\
/libcats/SATS/libcats.sats"
(* ****** ****** *)

#extern
fun<>
fgetc_ref
(filr: FILEref): int
#extern
fun<>
fgetc_ptr
(filp: !FILEptr1): int

(* ****** ****** *)

#extern
fun<>
fputc_ref
(char: int, filr: FILEref): int
#extern
fun<>
fputc_ptr
(char: int, filp: !FILEptr1): int

(* ****** ****** *)
#extern
fun
<x0:t0>
prout_ref(x0: x0): void
#extern
fun
<x0:t0>
prerr_ref(x0: x0): void
#extern
fun
<x0:vt>
prout1_ref(x0: !x0): void
#extern
fun
<x0:vt>
prerr1_ref(x0: !x0): void
(* ****** ****** *)
//
#extern
fun<>
g_print$out(): FILEref
#extern
fun<>
gl_print$out(): FILEref
//
#impltmp
gl_print$out<> = g_print$out
//
(* ****** ****** *)
#extern
fun
<x0:t0>
fprint_ref(FILEref, x0): void
#extern
fun
<x0:vt>
fprint1_ref(FILEref, !x0): void
#extern
fun
<x0:vt>
fprint1_ptr(FILEptr, !x0): void
(* ****** ****** *)
//
#impltmp
{x0:t0}
prout_ref<x0>(x0) =
fprint_ref<x0>(g_stdout<>(), x0)
#impltmp
{x0:t0}
prerr_ref<x0>(x0) =
fprint_ref<x0>(g_stderr<>(), x0)
//
(* ****** ****** *)
#impltmp
{x0:t0}
fprint0_ref<x0>(out, x0) =
  ( g_free<x0>(x0) ) where
{
  val () =
  fprint1_ref<x0>(out, x0)
}
(*
#impltmp
{x0:t0}
fprint1_ref<x0> = fprint_ref<x0>
*)
(* ****** ****** *)
#impltmp
{x0:t0}
fprint_ref<x0>
  (out, x0) =
(
  g_print<x0>(x0)) where
{
  #impltmp g_print$out<>() = out
} (*where*) // end-of(fprint_ref)
#impltmp
{x0:vt}
fprint1_ref<x0>
  (out, x0) =
(
  gl_print<x0>(x0)) where
{
  #impltmp gl_print$out<>() = out
} (*where*) // end-of(fprint_ref)
(* ****** ****** *)

#impltmp
fprint_ref<sint> =
XATS2CC_fprint_sint where
{
fun
XATS2CC_fprint_sint
(FILEref, sint): void = $extnam()
}
#impltmp
fprint_ref<char> =
{
fun
XATS2CC_fprint_char
(FILEref, char): void = $extnam()
}

(* ****** ****** *)

#impltmp
g_print<char>(x0) =
fprint_ref<char>(g_print$out<>(), x0)
#impltmp
g_print<sint>(x0) =
fprint_ref<sint>(g_print$out<>(), x0)

(* ****** ****** *)

(* end of [xatslib_libcats_stdiout.dats] *)
