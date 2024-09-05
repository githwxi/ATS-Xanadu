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
Thu 05 Sep 2024 11:54:02 AM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstype
console_type
#typedef
console = console_type
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
console_log
{t0:t0}(x0: t0): void
//
#impltmp
<(*tmp*)>
console_log
  ( x0 ) =
(
XATS2JS_console_log
  ( x0 )) where
{
#extern
fun
XATS2JS_console_log
{t0:t0}(x0: t0): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
the_print_store_log(): void
//
#extern
fun<>
the_print_store_flush(): strn
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
the_print_store_log() =
console_log(the_print_store_flush())
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
the_print_store_flush
  ((*void*)) =
(
XATS2JS_the_print_store_flush
  ((*void*))) where
{
#extern
fun
XATS2JS_the_print_store_flush(): strn = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_strn000.dats] *)
