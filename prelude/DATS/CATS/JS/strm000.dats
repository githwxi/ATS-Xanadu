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
Fri Jan  2 03:05:42 PM EST 2026
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2JS_strm_vt_forall0$f1un
{x0:vt}
( xs
: strm_vt(x0)
, test
: (~x0) -> bool): bool
= $extnam()//extern(./strm000.cats)
//
#impltmp
< x0:vt >
strm_vt_forall0
  (  xs  ) =
let
fun
test(x0: ~x0): bool =
(
  forall$test0<x0>(x0))
in//let
XATS2JS_strm_vt_forall0$f1un{x0}(xs, test)
end(*let*)//end-of-[strm_vt_forall0<x0>(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2JS_strm_vt_filter0$f1un
{x0:vt}
( xs
: strm_vt(x0)
, test
: (!x0) -> bool
, free
: (~x0) -> void): strm_vt(x0)
= $extnam()//extern(./strm000.cats)
//
#impltmp
< x0:vt >
strm_vt_filter0
  (  xs  ) =
let
fun
test(x0: !x0): bool =
(
  filter$test1<x0>(x0))
fun
free(x0: ~x0): void = g_free<x0>(x0)
in//let
XATS2JS_strm_vt_filter0$f1un{x0}(xs,test,free)
end(*let*)//end-of-[strm_vt_filter0<x0>(xs:lsm)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_strm000.dats] *)
(***********************************************************************)
