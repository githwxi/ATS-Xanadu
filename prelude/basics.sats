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
// sort for true
//
(*
abssort true
// [true] is built-in
*)
//
(* ****** ****** *)
//
// predicative sorts
//
(*
abssort int
// [int] is built-in
abssort bool//tt,ff
// [bool] is built-in
abssort char//[0,256)
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
sexpdef
b2i = cast_b0_i0 // overloading
sexpdef
i2b = cast_i0_b0 // overloading
//
(* ****** ****** *)
//
#stacst
tt_b0 : bool // true
#stacst
ff_b0 : bool // false
//
sexpdef tt = tt_b0 // overloading
sexpdef ff = ff_b0 // overloading
//
(* ****** ****** *)
//
#stacst
neg_b0: (b0) -> bool
sexpdef ~ = neg_b0 // overloading
(*
sexpdef neg = neg_b0 // overloading
*)
//
#stacst
add_b0_b0: (b0, b0) -> bool
#stacst
mul_b0_b0: (b0, b0) -> bool
//
sexpdef + = add_b0_b0 // overloading
sexpdef * = mul_b0_b0 // overloading
(*
sexpdef add = add_b0_b0 // overloading
sexpdef mul = mul_b0_b0 // overloading
*)
//
(* ****** ****** *)
//
#stacst
lt_b0_b0: (b0, b0) -> bool
#stacst
gt_b0_b0: (b0, b0) -> bool
#stacst
eq_b0_b0: (b0, b0) -> bool
//
#stacst
lte_b0_b0: (b0, b0) -> bool
#stacst
gte_b0_b0: (b0, b0) -> bool
#stacst
neq_b0_b0: (b0, b0) -> bool
//
sexpdef < = lt_b0_b0 // overloading
sexpdef > = gt_b0_b0 // overloading
sexpdef = = eq_b0_b0 // overloading
//
sexpdef <= = lte_b0_b0 // overloading
sexpdef >= = gte_b0_b0 // overloading
sexpdef != = neq_b0_b0 // overloading
//
(* ****** ****** *)
//
#stacst
eq_c0_c0: (c0, c0) -> bool
#stacst
eq_c0_i0: (c0, i0) -> bool
//
sexpdef = = eq_c0_c0 // overloading
sexpdef = = eq_c0_i0 // overloading
//
(* ****** ****** *)
//
#stacst
neg_i0: int -> int
sexpdef - = neg_i0 // overloading
//
#stacst
abs_i0: int -> int
sexpdef abs = abs_i0 // overloading
//
#stacst
sgn_i0: int -> int
sexpdef sgn = sgn_i0 // overloading
//
(*
#stacst
succ_i0: int -> int
#stacst
pred_i0: int -> int
sexpdef succ = succ_i0 // overloading
sexpdef pred = pred_i0 // overloading
*)
//
(* ****** ****** *)
//
#stacst
add_i0_i0: (int, int) -> int
#stacst
sub_i0_i0: (int, int) -> int
#stacst
mul_i0_i0: (int, int) -> int
#stacst
div_i0_i0: (int, int) -> int
//
sexpdef + = add_i0_i0 // overloading
sexpdef - = sub_i0_i0 // overloading
sexpdef * = mul_i0_i0 // overloading
sexpdef / = div_i0_i0 // overloading
//
(*
sexpdef add = add_i0_i0 // overloading
sexpdef sub = sub_i0_i0 // overloading
sexpdef mul = mul_i0_i0 // overloading
sexpdef div = div_i0_i0 // overloading
*)
//
(* ****** ****** *)
//
#stacst
lt_i0_i0: (int, int) -> bool
#stacst
gt_i0_i0: (int, int) -> bool
#stacst
eq_i0_i0: (int, int) -> bool
//
#stacst
lte_i0_i0: (int, int) -> bool
#stacst
gte_i0_i0: (int, int) -> bool
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

sortdef nat = {a:int | a >= 0}
sortdef pos = {a:int | a >= 1}
sortdef neg = {a:int | a <= -1}

(* ****** ****** *)

sortdef agtz = {l:addr | l > 0}
sortdef agez = {l:addr | l >= 0}

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
//
typedef
void = $extype("xats_void_t")
//
(* ****** ****** *)
//
typedef
p1tr_k = $extype("xats_p1tr_t")
typedef
p2tr_k = $extype("xats_p2tr_t")
//
(* ****** ****** *)
//
abstype
p1tr_tbox
(l:addr) <= p1tr_k
abstype
p2tr_tbox
(x:vtype, l:addr) <= p2tr_k
//
typedef
p1tr0 = [l:a0] p1tr_tbox(l)
typedef
p1tr1(l: a0) = p1tr_tbox(l)
//
typedef
p2tr0(x: vt) = [l:a0] p2tr_tbox(x, l)
typedef
p2tr1(x: vt, l: a0) = p2tr_tbox(x, l)
//
typedef p1tr = p1tr0
typedef p1tr(l:a0) = p1tr1(l)
typedef p2tr(x:vt) = p2tr0(x)
typedef p2tr(x:vt, l:a0) = p2tr1(x, l)
//
(* ****** ****** *)

typedef
bool_k = $extype("xats_bool_t")
typedef
char_k = $extype("xats_char_t")

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
bool0 = [b:b0] bool_type(b)
typedef
bool1(b:bool) = bool_type(b)
//
(* ****** ****** *)
//
typedef
tbool = bool1(tt) // singleton
typedef
fbool = bool1(ff) // singleton
//
typedef bool = bool0
typedef bool(b:bool) = bool1(b)
//
(* ****** ****** *)
//
abstype
char_type(char) <= char_k
//
typedef
char0 = [c:c0] char_type(c)
typedef
char1(c:char) = char_type(c)
//
typedef char = char0
typedef char(c:char) = char1(c)
//
(* ****** ****** *)
//
abstype
gint_type(a:type, int) <= a
//
typedef
gint0
(a:type)=[i:int] gint_type(a, i)
typedef
gint1
(a:type,i:int) = gint_type(a, i)
//
(* ****** ****** *)
//
typedef sint0 = gint0(sint_k)
typedef uint0 = gint0(uint_k)
//
typedef
sint1(i:int) = gint1(sint_k, i)
typedef
uint1(i:int) = gint1(uint_k, i)
//
typedef slint0 = gint0(slint_k)
typedef ulint0 = gint0(ulint_k)
//
typedef
slint1(i:int) = gint1(slint_k, i)
typedef
ulint1(i:int) = gint1(ulint_k, i)
//
typedef ssize0 = gint0(ssize_k)
typedef usize0 = gint0(usize_k)
//
typedef
ssize1(i:int) = gint1(ssize_k, i)
typedef
usize1(i:int) = gint1(usize_k, i)
//
(* ****** ****** *)
//
typedef
gint(a:type) = gint0(a)
typedef
gint(a:type,i:int) = gint1(a, i)
//
(* ****** ****** *)
//
typedef int = sint0
typedef int(i:int) = sint1(i)
typedef sint = sint0
typedef sint(i:int) = sint1(i)
typedef uint = uint0
typedef uint(i:int) = uint1(i)
//
typedef lint = slint0
typedef lint(i:int) = slint1(i)
typedef slint = slint0
typedef slint(i:int) = slint1(i)
typedef ulint = ulint0
typedef ulint(i:int) = ulint1(i)
//
typedef size = usize0
typedef size(i:int) = usize1(i)
typedef usize = usize0
typedef usize(i:int) = usize1(i)
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
//
typedef
sintlt(n:int) = [i:int | i < n] sint(i)
typedef
sintgt(n:int) = [i:int | i > n] sint(i)
typedef
sintlte(n:int) = [i:int | i <= n] sint(i)
typedef
sintgte(n:int) = [i:int | i >= n] sint(i)
//
typedef
nintlt(n:int) = [i:nat | i < n] sint(i)
typedef
nintlte(n:int) = [i:nat | i <= n] sint(i)
//
typedef
sintbtw
(m:int
,n:int) = [i:int | m <= i; i < n] sint(i)
typedef
sintbtwe
(m:int
,n:int) = [i:int | m <= i; i <= n] sint(i)
//
(* ****** ****** *)

datatype
unit = unit of ()
datavtype
unit_vt = unit_vt of ()

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
(*
#symload nil with optn_nil
#symload cons with optn_cons
#symload nil_vt with optn_vt_nil
#symload cons_vt with optn_vt_cons
*)
(*
#symload none with optn_nil
#symload some with optn_cons
#symload none_vt with optn_vt_nil
#symload some_vt with optn_vt_cons
*)
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
fcast
optn_vt2t
{a:t0}{b:b0}
(optn_vt(a, b)): optn(a, b)
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
(*
#symload nil with list_nil
#symload cons with list_cons
#symload nil_vt with list_vt_nil
#symload cons_vt with list_vt_cons
*)
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
fcast
list_vt2t
{a:t0}{n:i0}
(list_vt(a, n)): list(a, n)
//
(* ****** ****** *)
//
typedef
sfloat_k =
$extype("xats_sfloat_t")
typedef
dfloat_k =
$extype("xats_dfloat_t")
typedef
dfloat_k =
$extype("xats_ldfloat_t")
//
abstype
gfloat_type(a:type) <= a
//
typedef
sfloat = gfloat_type(sfloat_k)
typedef
dfloat = gfloat_type(dfloat_k)
typedef
ldfloat = gfloat_type(ldfloat_k)
//
typedef
float = sfloat // single precision
typedef
double = dfloat // double precision
typedef
ldouble = ldfloat // double precision
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
typedef string = string0
typedef string(n:int) = string1(n)
typedef stropt = stropt0
typedef stropt(n:int) = stropt1(n)
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
//
vtypedef string_vt = string0_vt
vtypedef string_vt(n:int) = string1_vt(n)
vtypedef stropt_vt = stropt0_vt
vtypedef stropt_vt(n:int) = stropt1_vt(n)
//
(* ****** ****** *)
//
// HX:
// For exceptions:
//
absvtype excptn_vt <= ptr
//
(* ****** ****** *)
//
abstype
lazy_t0_x0(a: type+) <= ptr
typedef
lazy(a:type) = lazy_t0_x0(a)
//
absvtype
lazy_vt_vx(a: vtype+) <= ptr
vtypedef
lazy_vt(a:vtype) = lazy_vt_vx(a)
//
(* ****** ****** *)
//
datatype
strmcon(a:type+) =
| strmcon_nil of ((*void*))
| strmcon_cons of (a, stream(a))
//
where
typedef
stream(a:type) = lazy(strmcon(a))
//
datavtype
strmcon_vt(a:vtype+) =
| strmcon_vt_nil of ((*void*))
| strmcon_vt_cons of (a, stream_vt(a))
//
where
vtypedef
stream_vt(a:vtype) = lazy_vt(strmcon_vt(a))
//
(* ****** ****** *)
//
(*
#symload nil with strmcon_nil
#symload cons with strmcon_cons
#symload nil_vt with strmcon_vt_nil
#symload cons_vt with strmcon_vt_cons
*)
//
(* ****** ****** *)
//
(*
fun
<a1:t0>
<a2:vt>
assign
(x1: &a1 >> a2, x2: a2): void
//
#symload := with assign of 00
//
fun
<a1:v0>
<a2:v0>
pfexch
(pf1: !a0>>a1, pf2: !a2>>a1): void
*)
//
(* ****** ****** *)
//
abstype
FILEref_tbox <= ptr
absvtype
FILEptr_vtbox(l:addr) <= ptr
//
typedef FILEref = FILEref_tbox
sexpdef FILEptr = FILEref_vtbox
vtypedef FILEptr0 = [l:addr] FILEptr(l)
vtypedef FILEptr1 = [l:agtz] FILEptr(l)
//
(* ****** ****** *)

(* end of [basics.sats] *)
