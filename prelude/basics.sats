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
abssort int
// [int] is built-in
abssort bool
// [bool] is built-in
abssort char
// [char] is built-in
*)
//
(* ****** ****** *)
//
(*
abssort real
// for handling reals
abssort float
// for handling floats
abssort string
// for handling strings
*)
//
(* ****** ****** *)
//
sortdef i0 = int
sortdef a0 = addr
sortdef b0 = bool
sortdef c0 = char
//
sortdef p0 = prop
sortdef v0 = view
sortdef t0 = type
sortdef x0 = tbox
sortdef vt = vtype
sortdef vx = vtbox
//
(* ****** ****** *)
//
#stacst
cast_b0_i0:
bool -> int // t->1/f->0
#stacst
cast_i0_b0:
(int) -> bool // !0->t/=0->f
//
sexpdef b2i = cast_b0_i0
sexpdef i2b = cast_i0_b0
//
(* ****** ****** *)
//
#stacst tt : bool // true
#stacst ff : bool // false
//
(* ****** ****** *)
//
#stacst
neg_i0: (int) -> int
#stacst
add_i0_i0: (int, int) -> int
#stacst
sub_i0_i0: (int, int) -> int
#stacst
mul_i0_i0: (int, int) -> int
#stacst
div_i0_i0: (int, int) -> int
//
sexpdef - = neg_i0 // overloading
sexpdef + = add_i0_i0 // overloading
sexpdef - = sub_i0_i0 // overloading
sexpdef * = mul_i0_i0 // overloading
sexpdef / = div_i0_i0 // overloading
//
(* ****** ****** *)
//
#stacst
lt_i0_i0: (int, int) -> bool
#stacst
gt_i0_i0: (int, int) -> bool
//
#stacst
lte_i0_i0: (int, int) -> bool
#stacst
gte_i0_i0: (int, int) -> bool
//
#stacst
eq_i0_i0: (int, int) -> bool
#stacst
neq_i0_i0: (int, int) -> bool
//
sexpdef < = lt_i0_i0 // overloading
sexpdef > = gt_i0_i0 // overloading
sexpdef = = eq_i0_i0 // overloading
//
sexpdef <= = lte_i0_i0 // overloading
sexpdef >= = gte_i0_i0 // overloading
sexpdef != = neq_i0_i0 // overloading
//
(* ****** ****** *)
//
#stacst
neg_b0_b0: (bool) -> bool
#stacst
add_b0_b0: (bool, bool) -> bool
#stacst
mul_b0_b0: (bool, bool) -> bool
//
sexpdef ~ = neg_b0 // overloading
sexpdef + = add_b0_b0 // overloading
sexpdef * = mul_b0_b0 // overloading
//
(* ****** ****** *)

sortdef nat = {a:int | a >= 0}
sortdef pos = {a:int | a >= 1}
sortdef neg = {a:int | a <= -1}

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
//
sortdef type0 = type
sortdef tbox0 = tbox
sortdef tflt0 = tflt
//
sortdef type1 = vtype
sortdef tbox1 = vtbox
sortdef tflt1 = vtflt
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
bool_type(bool) <= bool_k
//
typedef
bool0 = [b:b0] bool_type(b0)
typedef
bool1(b:bool) = bool_type(b)
//
typedef
tbool = bool_type(tt) // singleton
typedef
fbool = bool_type(ff) // singleton
//
(* ****** ****** *)
//
abstype
gint_type(a:type, int) <= a
//
typedef
sint0 = [i:i0] gint_type(sint_k, i)
typedef
sint1(i:int) = gint_type(sint_k, i)
//
typedef
uint0 = [i:i0] gint_type(uint_k, i)
typedef
uint1(i:int) = gint_type(uint_k, i)
//
typedef
slint0 = [i:i0] gint_type(slint_k, i)
typedef
slint1(i:int) = gint_type(slint_k, i)
//
typedef
ulint0 = [i:i0] gint_type(ulint_k, i)
typedef
ulint1(i:int) = gint_type(ulint_k, i)
//
typedef
ssize0 = [i:i0] gint_type(ssize_k, i)
typedef
ssize1(i:int) = gint_type(ssize_k, i)
//
typedef
usize0 = [i:i0] gint_type(usize_k, i)
typedef
usize1(i:int) = gint_type(usize_k, i)
//
(* ****** ****** *)
//
typedef int = sint0
typedef int(i:int) = sint1(i)
typedef uint = uint0
typedef uint(i:int) = uint1(i)
//
typedef lint = slint0
typedef lint(i:int) = slint1(i)
typedef ulint = ulint0
typedef ulint(i:int) = ulint1(i)
//
typedef size = usize0
typedef size(i:int) = usize1(i)
typedef ssize = ssize0
typedef ssize(i:int) = ssize1(i)
//
(* ****** ****** *)

typedef
nint = [i:int | i >= 0] sint(i)
typedef
nlint = [i:int | i >= 0] slint(i)
typedef
nsize = [i:int | i >= 0] ssize(i)

(* ****** ****** *)

typedef
sintlt(n:int) = [i:int | i < n] sint(i)
typedef
sintgt(n:int) = [i:int | i > n] sint(i)
typedef
sintlte(n:int) = [i:int | i <= n] sint(i)
typedef
sintgte(n:int) = [i:int | i >= n] sint(i)

(* ****** ****** *)

typedef
nintlt(n:int) = [i:nat | i < n] sint(i)
typedef
nintlte(n:int) = [i:nat | i <= n] sint(i)

(* ****** ****** *)
//
datatype
optn_t0_i0_x0
(
  a:type+, bool
) =
  | optn_nil(a, ff) of ()
  | optn_cons(a, tt) of (a)
//
// end of [optn_t0_i0_tbox]
//
datavtype
optn_vt_i0_vx
(
  a:vtype+, bool
) =
  | optn_vt_nil(a, ff) of ()
  | optn_vt_cons(a, tt) of (a)
//
// end of [optn_vt_i0_vx]
//
(* ****** ****** *)
//
sexpdef optn = optn_t0_i0_x0
sexpdef optn_vt = optn_vt_i0_vx
//
typedef
optn0(a:type) = [b:b0] optn(a, b)
typedef
optn1(a:type, b: bool) = optn(a, b)
//
vtypedef
optn0_vt(a:type) = [b:b0] optn_vt(a, b)
vtypedef
optn1_vt(a:type, b: bool) = optn_vt(a, b)
//
(* ****** ****** *)
//
// HX-2018-10-01:
//
datatype
list_t0_i0_x0
(
  a:type+, int(*len*)
) =
//
  | list_nil(a, 0)
//
  | {n:int | n >= 0}
    list_cons(a, n+1) of (a, list_t0_i0_x0(a, n))
//
// end of [list_t0_i0_x0]
//
datavtype
list_vt_i0_vx
(
  a:vtype+, int(*len*)
) =
//
  | list_vt_nil(a, 0)
//
  | {n:int | n >= 0}
    list_vt_cons(a, n+1) of (a, list_vt_i0_vx(a, n))
//
// end of [list_vt_i0_vx]
//
(* ****** ****** *)
//
sexpdef list = list_t0_i0_x0
sexpdef list_vt = list_vt_i0_vx
//
(* ****** ****** *)
//
typedef
list(a:type) = [n:int] list(a, n)
//
typedef
list0(a:type) = [n:int | n >= 0] list(a, n)
typedef
list1(a:type) = [n:int | n >= 1] list(a, n)
//
typedef listlt
  (a:type, n:int) = [k:nat | k < n] list(a, k)
typedef listgt
  (a:type, n:int) = [k:int | k > n] list(a, k)
//
typedef listlte
  (a:type, n:int) = [k:nat | k <= n] list(a, k)
typedef listgte
  (a:type, n:int) = [k:int | k >= n] list(a, k)
//
typedef listbtw
  (a:type, m:int, n:int) = [k:int | m <= k; k < n] list(a, k)
typedef listbtwe
  (a:type, m:int, n:int) = [k:int | m <= k; k <= n] list(a, k)
//
(* ****** ****** *)
//
vtypedef
list_vt(a:vtype) = [n:int] list_vt(a, n)
//
vtypedef
list0_vt(a:vtype) = [n:int | n >= 0] list_vt(a, n)
vtypedef
list1_vt(a:vtype) = [n:int | n >= 1] list_vt(a, n)
//
vtypedef listlt_vt
  (a:vtype, n:int) = [k:nat | k < n] list_vt(a, k)
vtypedef listgt_vt
  (a:vtype, n:int) = [k:int | k > n] list_vt(a, k)
vtypedef listlte_vt
  (a:vtype, n:int) = [k:nat | k <= n] list_vt(a, k)
vtypedef listgte_vt
  (a:vtype, n:int) = [k:int | k >= n] list_vt(a, k)
//
vtypedef listbtw_vt
  (a:vtype, m:int, n:int) = [k:int | m <= k; k < n] list_vt(a, k)
vtypedef listbtwe_vt
  (a:vtype, m:int, n:int) = [k:int | m <= k; k <= n] list_vt(a, k)
//
(* ****** ****** *)
//
abstype
string_i0_x0(n:int) <= ptr
abstype
stropt_i0_x0(n:int) <= ptr
//
typedef
string0 = [n:i0] string_i0_x0(n)
typedef
string1(n: int) = string_i0_x0(n)
//
typedef
stropt0 = [n:i0] stropt_i0_x0(n)
typedef
stropt1(n: int) = stropt_i0_x0(n)
//
(* ****** ****** *)
//
absvtype
string_i0_vx(n:int) <= ptr
absvtype
stropt_i0_vx(n:int) <= ptr
//
vtypedef
string0_vt = [n:i0] string_i0_vx(n)
vtypedef
string1_vt(n: int) = string_i0_vx(n)
//
vtypedef
stropt0_vt = [n:i0] stropt_i0_vx(n)
vtypedef
stropt1_vt(n: int) = stropt_i0_vx(n)
//
(* ****** ****** *)

(* end of [basics.sats] *)
