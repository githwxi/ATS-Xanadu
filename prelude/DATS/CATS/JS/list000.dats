(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Fri Jan  2 01:41:33 PM EST 2026
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2JS_list_vt_foritm0$f1un
{x0:vt}
( xs
: list_vt(x0)
, work
: (~x0) -> void): void
= $extnam()//extern(./list000.cats)
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
list_vt_foritm0
  (  xs  ) =
let
fun
work(x0: ~x0): void =
(
  foritm$work0<x0>(x0))
in//let
XATS2JS_list_vt_foritm0$f1un{x0}(xs, work)
end(*let*)//end-of-[ list_vt_foritm0<x0>(xs) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2JS_list_vt_forall0$f1un
{x0:vt}
( xs
: list_vt(x0)
, test
: (~x0) -> bool
, free
: (~x0) -> void): bool
= $extnam()//extern(./list000.cats)
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
list_vt_forall0
  (  xs  ) =
let
fun
test(x0: ~x0): bool =
(
  forall$test0<x0>(x0))
fun
free(x0: ~x0): void = g_free<x0>(x0)
in//let
XATS2JS_list_vt_forall0$f1un{x0}(xs, test, free)
end(*let*)//end-of-[list_vt_forall0<x0>(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_list000.dats] *)
(***********************************************************************)
