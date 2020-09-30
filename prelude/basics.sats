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
sortdef pf = prop
sortdef v0 = view
sortdef vw = view
sortdef t0 = type
sortdef tx = tbox
sortdef x0 = tbox
sortdef vt = vwtp
sortdef vx = vtbx
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
neg_b0:
( b0 ) -> bool
sexpdef ~ = neg_b0 // overloading
(*
sexpdef neg = neg_b0 // overloading
*)
//
#stacst
add_b0_b0:
(b0, b0) -> bool
#stacst
mul_b0_b0:
(b0, b0) -> bool
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
lt_b0_b0:
(b0, b0) -> bool
#stacst
gt_b0_b0:
(b0, b0) -> bool
#stacst
eq_b0_b0:
(b0, b0) -> bool
//
#stacst
lte_b0_b0:
(b0, b0) -> bool
#stacst
gte_b0_b0:
(b0, b0) -> bool
#stacst
neq_b0_b0:
(b0, b0) -> bool
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
lt_c0_c0:
(c0, c0) -> bool // c0: [0, 256)
#stacst
gt_c0_c0:
(c0, c0) -> bool // c0: [0, 256)
#stacst
eq_c0_c0:
(c0, c0) -> bool // c0: [0, 256)
//
#stacst
lte_c0_c0:
(c0, c0) -> bool // c0: [0, 256)
#stacst
gte_c0_c0:
(c0, c0) -> bool // c0: [0, 256)
#stacst
neq_c0_c0:
(c0, c0) -> bool // c0: [0, 256)
//
sexpdef < = lt_c0_c0 // overloading
sexpdef > = gt_c0_c0 // overloading
sexpdef = = eq_c0_c0 // overloading
//
sexpdef <= = lte_c0_c0 // overloading
sexpdef >= = gte_c0_c0 // overloading
sexpdef != = neq_c0_c0 // overloading
//
(* ****** ****** *)
//
#stacst
lt_c0_i0:
(c0, i0) -> bool // c0: [0, 256)
#stacst
gt_c0_i0:
(c0, i0) -> bool // c0: [0, 256)
#stacst
eq_c0_i0:
(c0, i0) -> bool // c0: [0, 256)
//
#stacst
lte_c0_i0:
(c0, i0) -> bool // c0: [0, 256)
#stacst
gte_c0_i0:
(c0, i0) -> bool // c0: [0, 256)
#stacst
neq_c0_i0:
(c0, i0) -> bool // c0: [0, 256)
//
sexpdef < = lt_c0_i0 // overloading
sexpdef > = gt_c0_i0 // overloading
sexpdef = = eq_c0_i0 // overloading
//
sexpdef <= = lte_c0_i0 // overloading
sexpdef >= = gte_c0_i0 // overloading
sexpdef != = neq_c0_i0 // overloading
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
add_a0_i0: (a0, i0) -> a0
#stacst
add_c0_i0: (c0, i0) -> c0
#stacst
add_i0_i0: (i0, i0) -> i0
//
#stacst
sub_a0_a0: (a0, a0) -> i0
#stacst
sub_c0_c0: (c0, c0) -> i0
#stacst
sub_i0_i0: (i0, i0) -> i0
//
#stacst
mul_i0_i0: (i0, i0) -> i0
#stacst
div_i0_i0: (i0, i0) -> i0
#stacst
mod_i0_i0: (i0, i0) -> i0
//
sexpdef + = add_a0_i0 // overloading
sexpdef + = add_c0_i0 // overloading
sexpdef + = add_i0_i0 // overloading
//
sexpdef - = sub_a0_a0 // overloading
sexpdef - = sub_c0_c0 // overloading
sexpdef - = sub_i0_i0 // overloading
//
sexpdef * = mul_i0_i0 // overloading
sexpdef / = div_i0_i0 // overloading
sexpdef % = mod_i0_i0 // overloading
//
(*
//
sexpdef add = add_a0_i0 // overloading
sexpdef add = add_c0_i0 // overloading
sexpdef add = add_i0_i0 // overloading
//
*)
//
(*
sexpdef sub = sub_a0_a0 // overloading
sexpdef sub = sub_c0_c0 // overloading
sexpdef sub = sub_i0_i0 // overloading
*)
//
(*
sexpdef mul = mul_i0_i0 // overloading
sexpdef div = div_i0_i0 // overloading
*)
//
sexpdef mod = mod_i0_i0 // overloading
//
(* ****** ****** *)
//
#stacst
lt_a0_a0: (a0, a0) -> b0
#stacst
gt_a0_a0: (a0, a0) -> b0
#stacst
gt_a0_i0: (a0, i0) -> b0
#stacst
eq_a0_a0: (a0, a0) -> b0
#stacst
eq_a0_i0: (a0, i0) -> b0
//
#stacst
lte_a0_a0: (a0, a0) -> b0
#stacst
gte_a0_a0: (a0, a0) -> b0
#stacst
gte_a0_i0: (a0, i0) -> b0
#stacst
neq_a0_a0: (a0, a0) -> b0
#stacst
neq_a0_i0: (a0, i0) -> b0
//
sexpdef < = lt_a0_a0 // overloading
sexpdef > = gt_a0_a0 // overloading
sexpdef > = gt_a0_i0 // overloading
sexpdef = = eq_a0_a0 // overloading
sexpdef = = eq_a0_i0 // overloading
//
sexpdef <= = lte_a0_a0 // overloading
sexpdef >= = gte_a0_a0 // overloading
sexpdef >= = gte_a0_i0 // overloading
sexpdef != = neq_a0_a0 // overloading
sexpdef != = neq_a0_i0 // overloading
//
(* ****** ****** *)
//
#stacst
lt_i0_i0: (i0, i0) -> b0
#stacst
gt_i0_i0: (i0, i0) -> b0
#stacst
eq_i0_i0: (i0, i0) -> b0
//
#stacst
lte_i0_i0: (i0, i0) -> b0
#stacst
gte_i0_i0: (i0, i0) -> b0
#stacst
neq_i0_i0: (i0, i0) -> b0
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
#stacst
sizeof_vt_i0: (vt) -> i0
sexpdef
sz(a:vt) = sizeof_vt_i0(a)
sexpdef
size(a:vt) = sizeof_vt_i0(a)
//
(* ****** ****** *)
//
#stacst
offset_vt_cs: (vt,cs) -> int
sexpdef
ofs(a:vt,l:cs) = offset_vt_cs(a,l)
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
abssort vwtp // viewtype: linear type
abssort vtbx // viewtbox: linear tbox
(*
abssort vtype // viewtype: linear type
abssort vtbox // viewtbox: linear tbox
abssort vtflt // viewtflt: linear tflt
*)
*)
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
(x:vwtp, l:addr) <= p2tr_k
//
typedef
p1tr0 = [l:a0] p1tr_tbox(l)
typedef
p1tr1(l: a0) = p1tr_tbox(l)
//
typedef
p2tr0
(a:vt) = [l:a0] p2tr_tbox(a, l)
typedef
p2tr1
(a: vt, l: a0) = p2tr_tbox(a, l)
//
typedef p1tr = p1tr0
typedef p1tr(l:a0) = p1tr1(l)
typedef p2tr(x:vt) = p2tr0(x)
typedef p2tr(x:vt, l:a0) = p2tr1(x, l)
//
(* ****** ****** *)
//
abstype
cp1tr_tbox
(l:addr) <= p1tr_k
abstype
cp2tr_tbox
(x:vwtp, l:addr) <= p2tr_k
//
typedef
cp1tr0 = [l:a0] cp1tr_tbox(l)
typedef
cp1tr1(l: a0) = cp1tr_tbox(l)
//
typedef
cp2tr0
(a:vt) = [l:a0] cp2tr_tbox(a, l)
typedef
cp2tr1
(a: vt, l: a0) = cp2tr_tbox(a, l)
//
typedef cp1tr = cp1tr0
typedef cp1tr(l:a0) = cp1tr1(l)
typedef cp2tr(x:vt) = cp2tr0(x)
typedef cp2tr(x:vt, l:a0) = cp2tr1(x, l)
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
//
typedef
sizelt(n:int) = [i:int | i < n] size(i)
typedef
sizegt(n:int) = [i:int | i > n] size(i)
typedef
sizelte(n:int) = [i:int | i <= n] size(i)
typedef
sizegte(n:int) = [i:int | i >= n] size(i)
//
typedef
sizebtw
(m:int
,n:int) = [i:int | m <= i; i < n] size(i)
typedef
sizebtwe
(m:int
,n:int) = [i:int | m <= i; i <= n] size(i)
//
(* ****** ****** *)

datatype
unit = unit of ()
datavwtp
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
datavwtp
optn_vt_i0_vx
(
  a:vwtp+, bool
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
vwtpdef
optn0_vt(a:type) = [b:b0] optn_vt(a, b)
vwtpdef
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
datavwtp
list_vt_i0_vx
(
  a:vwtp+, int(*len*)
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
vwtpdef
list_vt(a:vwtp) = [n:int] list_vt(a, n)
//
vwtpdef
list0_vt(a:vwtp) = [n:int | n >= 0] list_vt(a, n)
vwtpdef
list1_vt(a:vwtp) = [n:int | n >= 1] list_vt(a, n)
//
vwtpdef listlt_vt
  (a:vwtp, n:int) = [k:nat | k < n] list_vt(a, k)
vwtpdef listgt_vt
  (a:vwtp, n:int) = [k:int | k > n] list_vt(a, k)
vwtpdef listlte_vt
  (a:vwtp, n:int) = [k:nat | k <= n] list_vt(a, k)
vwtpdef listgte_vt
  (a:vwtp, n:int) = [k:int | k >= n] list_vt(a, k)
//
vwtpdef listbtw_vt
  (a:vwtp, m:int, n:int) = [k:int | m <= k; k < n] list_vt(a, k)
vwtpdef listbtwe_vt
  (a:vwtp, m:int, n:int) = [k:int | m <= k; k <= n] list_vt(a, k)
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
ldfloat_k =
$extype("xats_ldfloat_t")
//
abstype
gfloat_type(a:type) <= a
//
typedef
sflt = gfloat_type(sfloat_k)
typedef
dflt = gfloat_type(dfloat_k)
typedef
ldflt = gfloat_type(ldfloat_k)
//
typedef
float = sflt // single precision
typedef
double = dflt // double precision
typedef
ldouble = ldflt // double precision
//
(* ****** ****** *)
//
abstype
string_i0_x0(n:int) <= ptr
abstype
stropt_i0_x0(n:int) <= ptr
//
typedef
string0 =
[n:i0] string_i0_x0(n)
typedef
string1
(n: int) = string_i0_x0(n)
//
typedef
stropt0 =
[n:i0] stropt_i0_x0(n)
typedef
stropt1
(n: int) = stropt_i0_x0(n)
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
absvwtp
string_i0_vx(n:int) <= ptr
absvwtp
stropt_i0_vx(n:int) <= ptr
//
vwtpdef
string0_vt =
[n:i0] string_i0_vx(n)
vwtpdef
string1_vt
(n:int) = string_i0_vx(n)
//
vwtpdef
stropt0_vt =
[n:i0] stropt_i0_vx(n)
vwtpdef
stropt1_vt
(n: int) = stropt_i0_vx(n)
//
(* ****** ****** *)
//
vwtpdef string_vt = string0_vt
vwtpdef string_vt(n:int) = string1_vt(n)
//
vwtpdef stropt_vt = stropt0_vt
vwtpdef stropt_vt(n:int) = stropt1_vt(n)
//
(* ****** ****** *)
//
// HX:
// For exceptions:
//
absvwtp excptn_vt <= ptr
//
(* ****** ****** *)
//
abstbox
lazy_t0_x0(a: type+) <= ptr
typedef
lazy(a:type) = lazy_t0_x0(a)
//
absvtbx
lazy_vt_vx(a: vwtp+) <= ptr
vwtpdef
lazy_vt(a:vwtp) = lazy_vt_vx(a)
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
datavwtp
strmcon_vt(a:vwtp+) =
| strmcon_vt_nil of ((*void*))
| strmcon_vt_cons of (a, stream_vt(a))
//
where
vwtpdef
stream_vt(a:vwtp) = lazy_vt(strmcon_vt(a))
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
absview
a0ptr_view(a:vt,l:a0)
sexpdef @ = a0ptr_view
//
absview
a1ptr_view(a:vt,l:a0,n:i0)
sexpdef arrvw = a1ptr_view
//
(* ****** ****** *)
//
abstype
FILEref_tbox <= ptr
absvwtp
FILEptr_vtbx(l:addr) <= ptr
//
typedef FILEref = FILEref_tbox
sexpdef FILEptr = FILEref_vtbx
vwtpdef FILEptr0 = [l:addr] FILEptr(l)
vwtpdef FILEptr1 = [l:agtz] FILEptr(l)
//
(* ****** ****** *)

(* end of [basics.sats] *)
