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
Wed Jan 14 02:42:28 PM EST 2026
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2PY_strx_vt_forall0$f1un
{x0:vt}
( xs
: strx_vt(x0)
, test
: (~x0) -> bool): bool
= $extnam()//extern(./strx000.cats)
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
strx_vt_forall0
  (  xs  ) =
let
fun
test(x0: ~x0): bool =
(
  forall$test0<x0>(x0))
in//let
XATS2PY_strx_vt_forall0$f1un{x0}(xs, test)
end(*let*)//end-of-[strx_vt_forall0<x0>(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2PY_strx_vt_filter0$f1un
{x0:vt}
( xs
: strx_vt(x0)
, test
: (!x0) -> bool
, free
: (~x0) -> void): strx_vt(x0)
= $extnam()//extern(./strx000.cats)
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
strx_vt_filter0
  (  xs  ) =
let
fun
test(x0: !x0): bool =
(
  filter$test1<x0>(x0))
fun
free(x0: ~x0): void = g_free<x0>(x0)
in//let
XATS2PY_strx_vt_filter0$f1un{x0}(xs, test, free)
end(*let*)//end-of-[strx_vt_filter0<x0>(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_CATS_PY_strx000.dats] *)
(***********************************************************************)
