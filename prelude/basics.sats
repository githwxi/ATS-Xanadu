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
// Authoremail: gmhwxiATgmailDOTcom
//
// This one was
// there at the very beginning of ATS
//
(* ****** ****** *)
//
// predicative sorts
//
(*
abssort int // [int] is built-in
abssort bool // [bool] is built-in
abssort char // [char] is built-in
*)
//
(*
abssort real // for handling reals
abssort float // for handling floats
abssort string // for handling strings
*)
//
(* ****** ****** *)
//
#stacst
neg_int: (int) -> int
#stacst
add_int_int: (int, int) -> int
#stacst
sub_int_int: (int, int) -> int
#stacst
mul_int_int: (int, int) -> int
#stacst
div_int_int: (int, int) -> int
//
sexpdef - = neg_int // overloading
sexpdef + = add_int_int // overloading
sexpdef - = sub_int_int // overloading
sexpdef * = mul_int_int // overloading
sexpdef / = div_int_int // overloading
//
(* ****** ****** *)
//
#stacst
lt_int_int: (int, int) -> bool
#stacst
gt_int_int: (int, int) -> bool
//
#stacst
lte_int_int: (int, int) -> bool
#stacst
gte_int_int: (int, int) -> bool
//
#stacst
eq_int_int: (int, int) -> bool
#stacst
neq_int_int: (int, int) -> bool
//
sexpdef < = lt_int_int // overloading
sexpdef > = gt_int_int // overloading
sexpdef = = eq_int_int // overloading
//
sexpdef <= = lte_int_int // overloading
sexpdef >= = gte_int_int // overloading
sexpdef != = neq_int_int // overloading
//
(* ****** ****** *)
//
#stacst
neg_bool_bool: (bool) -> bool
#stacst
add_bool_bool: (bool, bool) -> bool
#stacst
mul_bool_bool: (bool, bool) -> bool
//
sexpdef ~ = neg_bool // overloading
sexpdef + = add_bool_bool // overloading
sexpdef * = mul_bool_bool // overloading
//
(* ****** ****** *)
//
// impredicative sorts
//
(*
abssort prop // prop: for proofs
abssort view // view: linear prop
*)
//
(*
abssort type // unspecified size
abssort tbox // tbox: of 1-word size
abssort tflt // tflt: alias for type
*)
//
(*
abssort vtype // viewtype: linear type
abssort vtbox // viewtbox: linear tbox
abssort vtflt // viewtflt: linear tflt
*)
//
(* ****** ****** *)

typedef
bool_k = $extype("xats_bool_t")

typedef
sint_k = $extype("xats_sint_t")
typedef
uint_k = $extype("xats_uint_t")

typedef
slint_k = $extype("xats_slint_t")
typedef
ulint_k = $extype("xats_ulint_t")

typedef
ssize_k = $extype("xats_ssize_t")
typedef
usize_k = $extype("xats_usize_t")

typedef
sllint_k = $extype("xats_sllint_t")
typedef
ullint_k = $extype("xats_ullint_t")

(* ****** ****** *)
//
abstype
bool0_type <= bool_k
abstype
bool1_type(bool) <= bool_k
//
typedef
bool0 = bool0_type
typedef
bool1(b: bool) = bool1_type(b)
//
sexpdef bool = bool0
sexpdef bool = bool1
//
(* ****** ****** *)
//
abstype
g0int_type(a:type) <= a
//
typedef
sint = g0int_type(sint_k)
typedef
uint = g0int_type(uint_k)
//
typedef
slint = g0int_type(slint_k)
typedef
ulint = g0int_type(ulint_k)
//
typedef
ssize = g0int_type(ssize_k)
typedef
usize = g0int_type(usize_k)
//
typedef
sllint = g0int_type(sllint_k)
typedef
ullint = g0int_type(ullint_k)
//
(* ****** ****** *)
//
abstype
g1int_type(a:type, int) <= a
//
typedef
sint(i: int) = g1int_type(sint_k, i)
typedef
uint(i: int) = g1int_type(uint_k, i)
//
typedef
slint(i: int) = g1int_type(slint_k, i)
typedef
ulint(i: int) = g1int_type(ulint_k, i)
//
typedef
ssize(i: int) = g1int_type(ssize_k, i)
typedef
usize(i: int) = g1int_type(usize_k, i)
//
typedef
sllint(i: int) = g1int_type(sllint_k, i)
typedef
ullint(i: int) = g1int_type(ullint_k, i)
//
(* ****** ****** *)

(* end of [basics.sats] *)
