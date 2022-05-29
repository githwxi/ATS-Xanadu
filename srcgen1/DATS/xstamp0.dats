(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xstamp0.sats"
//
(* ****** ****** *)

absimpl stamp_type = ptr

(* ****** ****** *)
//
implement
the_stamp_null = the_null_ptr
//
(* ****** ****** *)
implement
stamp_iseqz(x0) =
eq_ptr0_ptr0(x0, the_null_ptr)
(* ****** ****** *)
//
implement
stamp2uint(x0) =
let
val x0 =
$UN.cast
{uintptr}(x0) in $UN.cast{uint}(x0)
end // end of [stamp2uint]
//
(* ****** ****** *)
//
implement
eq_stamp_stamp
  (x1, x2) =
(
  eq_ptr0_ptr0(x1, x2)
)
//
(* ****** ****** *)
//
implement
cmp_stamp_stamp
  (x1, x2) =
(
  compare_ptr0_ptr0(x1, x2)
)
//
(* ****** ****** *)
//
implement
print_stamp(x0) =
fprint_stamp(stdout_ref, x0)
implement
prerr_stamp(x0) =
fprint_stamp(stderr_ref, x0)
//
implement
fprint_stamp(out, x0) =
(
fprint_uint(out, stamp2uint(x0))
)
//
(* ****** ****** *)

local
//
absimpl
stamper_tbox = ref(stamp)
//
in (* in-of-local *)
//
implement
stamper_new() =
  ref<stamp>(the_null_ptr)
//
implement
stamper_set
  (obj, n0) = let
  val n0 =
  $UN.cast{uintptr}(n0)
in
  obj[] := $UN.cast{ptr}(n0)
end // end of [stamper_set]
//
implement
stamper_getinc
  (obj) = n0 where
{
  val n0 = obj[]
  val () = obj[] := ptr_succ<byte>(n0)
}
//
end // end of [local]

(* ****** ****** *)

(* end of [xats_xstamp0.dats] *)
