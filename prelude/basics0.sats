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
#abssort true
// [true] is built-in
*)
//
(* ****** ****** *)
//
// predicative sorts
//
(*
#abssort int
// [int] is built-in
#abssort addr
// [addr] is built-in
#abssort bool//tt,ff
// [bool] is built-in
#abssort char//[0,256)
// [char] is built-in
#abssort float
// [string] is built-in
#abssort string
// [string] is built-in
*)
//
(* ****** ****** *)
//
(*
#abssort real
// for handling reals
#abssort float
// for handling floats
#abssort string
// for handling strings
*)
//
(* ****** ****** *)
//
#sortdef i0 = int
#sortdef a0 = addr
#sortdef b0 = bool
#sortdef c0 = char
//
#sortdef p0 = prop
#sortdef pf = prop
#sortdef v0 = view
#sortdef vw = view
#sortdef t0 = type
#sortdef tx = tbox
#sortdef x0 = tbox
#sortdef vt = vwtp
#sortdef vx = vtbx
//
(* ****** ****** *)
//
datasort ints =
|ints_nil of ((*nil*))
|ints_cons of (i0,ints)
//
(* ****** ****** *)
//
(*
t->1/f->0
*)
#stacst0
cast_b0_i0:(b0)->i0
(*
!0->t/=0->f
*)
#stacst0
cast_i0_b0:(i0)->b0
//
#sexpdef
b2i = cast_b0_i0 // overloading
#sexpdef
i2b = cast_i0_b0 // overloading
//
(* ****** ****** *)
//
#stacst0
tt_b0 : b0 // true
#stacst0
ff_b0 : b0 // false
//
#sexpdef tt = tt_b0 // overloading
#sexpdef ff = ff_b0 // overloading
//
(* ****** ****** *)
//
#stacst0
neg_b0:( b0 ) -> b0
#sexpdef ~ = neg_b0 // overloading
(*
#sexpdef neg = neg_b0 // overloading
*)
//
#stacst0
add_b0_b0:(b0,b0)->b0
#stacst0
mul_b0_b0:(b0,b0)->b0
//
#sexpdef + = add_b0_b0 // overloading
#sexpdef * = mul_b0_b0 // overloading
#sexpdef || = add_b0_b0 // overloading
#sexpdef && = mul_b0_b0 // overloading
(*
#sexpdef add = add_b0_b0 // overloading
#sexpdef mul = mul_b0_b0 // overloading
*)
//
(* ****** ****** *)
//
#stacst0
lt_b0_b0:(b0,b0)->b0
#stacst0
gt_b0_b0:(b0,b0)->b0
#stacst0
eq_b0_b0:(b0,b0)->b0
//
#stacst0
lte_b0_b0:(b0,b0)->b0
#stacst0
gte_b0_b0:(b0,b0)->b0
#stacst0
neq_b0_b0:(b0,b0)->b0
//
#sexpdef < = lt_b0_b0 // overloading
#sexpdef > = gt_b0_b0 // overloading
#sexpdef = = eq_b0_b0 // overloading
//
#sexpdef <= = lte_b0_b0 // overloading
#sexpdef >= = gte_b0_b0 // overloading
#sexpdef != = neq_b0_b0 // overloading
//
(* ****** ****** *)
//
#stacst0
lt_c0_c0:
(c0, c0) -> b0 // c0: [0, 256)
#stacst0
gt_c0_c0:
(c0, c0) -> b0 // c0: [0, 256)
#stacst0
eq_c0_c0:
(c0, c0) -> b0 // c0: [0, 256)
//
#stacst0
lte_c0_c0:
(c0, c0) -> b0 // c0: [0, 256)
#stacst0
gte_c0_c0:
(c0, c0) -> b0 // c0: [0, 256)
#stacst0
neq_c0_c0:
(c0, c0) -> b0 // c0: [0, 256)
//
#sexpdef < = lt_c0_c0 // overloading
#sexpdef > = gt_c0_c0 // overloading
#sexpdef = = eq_c0_c0 // overloading
//
#sexpdef <= = lte_c0_c0 // overloading
#sexpdef >= = gte_c0_c0 // overloading
#sexpdef != = neq_c0_c0 // overloading
//
(* ****** ****** *)
//
#stacst0
lt_c0_i0:
(c0, i0) -> b0 // c0: [0, 256)
#stacst0
gt_c0_i0:
(c0, i0) -> b0 // c0: [0, 256)
#stacst0
eq_c0_i0:
(c0, i0) -> b0 // c0: [0, 256)
//
#stacst0
lte_c0_i0:
(c0, i0) -> b0 // c0: [0, 256)
#stacst0
gte_c0_i0:
(c0, i0) -> b0 // c0: [0, 256)
#stacst0
neq_c0_i0:
(c0, i0) -> b0 // c0: [0, 256)
//
#sexpdef < = lt_c0_i0 // overloading
#sexpdef > = gt_c0_i0 // overloading
#sexpdef = = eq_c0_i0 // overloading
//
#sexpdef <= = lte_c0_i0 // overloading
#sexpdef >= = gte_c0_i0 // overloading
#sexpdef != = neq_c0_i0 // overloading
//
(* ****** ****** *)
//
#stacst0
neg_i0: i0 -> i0
#sexpdef - = neg_i0 // overloading
//
#stacst0
abs_i0: i0 -> i0
#sexpdef abs = abs_i0 // overloading
//
#stacst0
sgn_i0: i0 -> i0
#sexpdef sgn = sgn_i0 // overloading
//
(*
#stacst0
succ_i0: i0 -> i0 // +1
#stacst0
pred_i0: i0 -> i0 // -1
#sexpdef succ = succ_i0 // overloading
#sexpdef pred = pred_i0 // overloading
*)
//
(* ****** ****** *)
//
#stacst0
add_a0_i0: (a0, i0) -> a0
#stacst0
add_c0_i0: (c0, i0) -> c0
#stacst0
add_i0_i0: (i0, i0) -> i0
//
#stacst0
sub_a0_a0: (a0, a0) -> i0
#stacst0
sub_c0_c0: (c0, c0) -> i0
#stacst0
sub_i0_i0: (i0, i0) -> i0
//
#stacst0
mul_i0_i0: (i0, i0) -> i0
#stacst0
div_i0_i0: (i0, i0) -> i0
#stacst0
mod_i0_i0: (i0, i0) -> i0
//
#sexpdef + = add_a0_i0 // overloading
#sexpdef + = add_c0_i0 // overloading
#sexpdef + = add_i0_i0 // overloading
//
#sexpdef - = sub_a0_a0 // overloading
#sexpdef - = sub_c0_c0 // overloading
#sexpdef - = sub_i0_i0 // overloading
//
#sexpdef * = mul_i0_i0 // overloading
#sexpdef / = div_i0_i0 // overloading
#sexpdef % = mod_i0_i0 // overloading
//
(*
//
#sexpdef add = add_a0_i0 // overloading
#sexpdef add = add_c0_i0 // overloading
#sexpdef add = add_i0_i0 // overloading
//
*)
//
(*
#sexpdef sub = sub_a0_a0 // overloading
#sexpdef sub = sub_c0_c0 // overloading
#sexpdef sub = sub_i0_i0 // overloading
*)
//
(*
#sexpdef mul = mul_i0_i0 // overloading
#sexpdef div = div_i0_i0 // overloading
*)
//
#sexpdef mod = mod_i0_i0 // overloading
//
(* ****** ****** *)
//
#stacst0
lt_a0_a0: (a0, a0) -> b0
#stacst0
gt_a0_a0: (a0, a0) -> b0
#stacst0
gt_a0_i0: (a0, i0) -> b0
#stacst0
eq_a0_a0: (a0, a0) -> b0
#stacst0
eq_a0_i0: (a0, i0) -> b0
//
#stacst0
lte_a0_a0: (a0, a0) -> b0
#stacst0
gte_a0_a0: (a0, a0) -> b0
#stacst0
gte_a0_i0: (a0, i0) -> b0
#stacst0
neq_a0_a0: (a0, a0) -> b0
#stacst0
neq_a0_i0: (a0, i0) -> b0
//
#sexpdef < = lt_a0_a0 // overloading
#sexpdef > = gt_a0_a0 // overloading
#sexpdef > = gt_a0_i0 // overloading
#sexpdef = = eq_a0_a0 // overloading
#sexpdef = = eq_a0_i0 // overloading
//
#sexpdef <= = lte_a0_a0 // overloading
#sexpdef >= = gte_a0_a0 // overloading
#sexpdef >= = gte_a0_i0 // overloading
#sexpdef != = neq_a0_a0 // overloading
#sexpdef != = neq_a0_i0 // overloading
//
(* ****** ****** *)
//
#stacst0
lt_i0_i0: (i0, i0) -> b0
#stacst0
gt_i0_i0: (i0, i0) -> b0
#stacst0
eq_i0_i0: (i0, i0) -> b0
//
#stacst0
lte_i0_i0: (i0, i0) -> b0
#stacst0
gte_i0_i0: (i0, i0) -> b0
#stacst0
neq_i0_i0: (i0, i0) -> b0
//
#sexpdef < = lt_i0_i0 // overloading
#sexpdef > = gt_i0_i0 // overloading
#sexpdef = = eq_i0_i0 // overloading
//
#sexpdef <= = lte_i0_i0 // overloading
#sexpdef >= = gte_i0_i0 // overloading
#sexpdef != = neq_i0_i0 // overloading
//
(* ****** ****** *)
//
#sortdef pos = {a:i0 | a > 0}
#sortdef neg = {a:i0 | a < 0}
//
#sortdef nat = {a:i0 | a >= 0}
//
(* ****** ****** *)
//
#sortdef agtz = {l:a0 | l > 0}
#sortdef agez = {l:a0 | l >= 0}
//
(* ****** ****** *)
//
#stacst0
sizeof_vt_i0: (vt) -> i0
#sexpdef
sz(a:vt) = sizeof_vt_i0(a)
#sexpdef
size(a:vt) = sizeof_vt_i0(a)
//
(* ****** ****** *)
//
(*
#stacst0
offset_vt_cs: (vt,cs) -> i0
#sexpdef
ofs(a:vt,l:cs) = offset_vt_cs(a,l)
*)
//
(* ****** ****** *)
//
// impredicative sorts
//
(*
#abssort prop // prop: for proofs
#abssort view // view: linear prop
*)
//
(*
#abssort type // unspecified size
#abssort tbox // tbox: of 1-word size
#abssort tflt // tflt: alias for type
*)
//
(*
#abssort vwtp // viewtype: linear type
#abssort vtbx // viewtbox: linear tbox
*)
(*
#abssort vtype // viewtype: linear type
#abssort vtbox // viewtbox: linear tbox
#abssort vtflt // viewtflt: linear tflt
*)
//
(* ****** ****** *)
//
#absvwtp
cbv0_vt_vt(a: vt) <= a
#absvwtp
cbv1_vt_vt(a: vt) <= a
#absvwtp
cbrf_vt_vt(a: vt) <= a
#sexpdef ~ = cbv0_vt_vt
#sexpdef ! = cbv1_vt_vt
#sexpdef & = cbrf_vt_vt
//
#abstype
top0_vt_t0(a: vt) <= a
#abstype
topz_vt_t0(a: vt) <= a
//
#sexpdef ?  = top0_vt_t0
#sexpdef ?! = topz_vt_t0
//
(* ****** ****** *)
(*
//
HX-2023-07-18:
This is not working due
to the special use of (_)
//
#absvwtp
atx2_vt_vt_vt(a:vt,b:vt)<=a
#sexpdef >> = atx2_vt_vt_vt
*)
(* ****** ****** *)
#typedef
void = $extype("xats_void_t")
(* ****** ****** *)
#typedef
p0tr = $extbox("xats_p0tr_t")
(* ****** ****** *)
//
#typedef
p1tr_k = $extype("xats_p1tr_t")
#typedef
p2tr_k = $extype("xats_p2tr_t")
//
(* ****** ****** *)
//
#abstype
p1tr_tbox(a0) <= p1tr_k
#abstype
p2tr_tbox(vt,a0) <= p2tr_k
//
#typedef
p1tr0 = [l:a0] p1tr_tbox(l)
#typedef
p1tr1(l: a0) = p1tr_tbox(l)
//
#typedef
p2tr0
(a:vt) = [l:a0] p2tr_tbox(a, l)
#typedef
p2tr1
(a: vt, l: a0) = p2tr_tbox(a, l)
//
#typedef p1tr = p1tr0
#typedef p1tr(l:a0) = p1tr1(l)
#typedef p2tr(x:vt) = p2tr0(x)
#typedef p2tr(x:vt, l:a0) = p2tr1(x, l)
//
(* ****** ****** *)
//
#absview
p2at_view(vt,a0) // linprop
#viewdef
p2at0
(a:vt) = [l:a0] p2at_view(a, l)
#viewdef
p2at1
(a: vt, l: a0) = p2at_view(a, l)
//
#viewdef p2at(x:vt) = p2tr0(x)
#viewdef p2at(x:vt, l:a0) = p2tr1(x, l)
//
(* ****** ****** *)
//
#abstype
cp1tr_tbox
(l:a0) <= p1tr_k
#abstype
cp2tr_tbox
(x:vt, l:a0) <= p2tr_k
//
#typedef
cp1tr0 = [l:a0] cp1tr_tbox(l)
#typedef
cp1tr1(l: a0) = cp1tr_tbox(l)
//
#typedef
cp2tr0
(a:vt) = [l:a0] cp2tr_tbox(a, l)
#typedef
cp2tr1
(a: vt, l: a0) = cp2tr_tbox(a, l)
//
#typedef cp1tr = cp1tr0
#typedef cp1tr(l:a0) = cp1tr1(l)
#typedef cp2tr(x:vt) = cp2tr0(x)
#typedef cp2tr(x:vt, l:a0) = cp2tr1(x, l)
//
(* ****** ****** *)

#typedef
bool_k = $extype("xats_bool_t")
#typedef
char_k = $extype("xats_char_t")

#typedef
sint_k = $extype("xats_sint_t")
#typedef
uint_k = $extype("xats_uint_t")

#typedef
slint_k = $extype("xats_slint_t")
#typedef
ulint_k = $extype("xats_ulint_t")

#typedef
ssize_k = $extype("xats_ssize_t")
#typedef
usize_k = $extype("xats_usize_t")

#typedef
sllint_k = $extype("xats_sllint_t")
#typedef
ullint_k = $extype("xats_ullint_t")

(* ****** ****** *)
//
#abstype
bool_type(b0) <= bool_k
//
#typedef
bool0 =
[b:b0] bool_type(b)
#typedef
bool1(b:b0) = bool_type(b)
//
(* ****** ****** *)
//
#typedef
tbool = bool1(tt) // singleton
#typedef
fbool = bool1(ff) // singleton
//
#typedef bool = bool0
#typedef bool(b:b0) = bool1(b)
//
(* ****** ****** *)
//
#abstype
char_type(c0) <= char_k
//
#typedef
char0 =
[c:c0] char_type(c)
#typedef
char1(c:c0) = char_type(c)
//
#typedef char = char0
#typedef char(c:c0) = char1(c)
//
(* ****** ****** *)
//
#abstype
gint_type(a:t0,i0) <= (a)
//
#typedef
gint0(a:t0)=
[i:i0] gint_type(a(*k*), i)
//
#typedef
gint1 // HX: indexed int-type
(a:t0,i:i0) = gint_type(a, i)
//
(* ****** ****** *)
//
#typedef sint0 = gint0(sint_k)
#typedef uint0 = gint0(uint_k)
//
#typedef
sint1(i:i0) = gint1(sint_k, i)
#typedef
uint1(i:i0) = gint1(uint_k, i)
//
#typedef slint0 = gint0(slint_k)
#typedef ulint0 = gint0(ulint_k)
//
#typedef
slint1(i:i0) = gint1(slint_k, i)
#typedef
ulint1(i:i0) = gint1(ulint_k, i)
//
#typedef ssize0 = gint0(ssize_k)
#typedef usize0 = gint0(usize_k)
//
#typedef
ssize1(i:i0) = gint1(ssize_k, i)
#typedef
usize1(i:i0) = gint1(usize_k, i)
//
(* ****** ****** *)
//
#typedef sllint0 = gint0(sllint_k)
#typedef ullint0 = gint0(ullint_k)
//
#typedef
sllint1(i:i0) = gint1(sllint_k, i)
#typedef
ullint1(i:i0) = gint1(ullint_k, i)
//
(* ****** ****** *)
//
#typedef
gint(a:t0) = gint0(a)
#typedef
gint(a:t0,i:i0) = gint1(a, i)
//
(* ****** ****** *)
//
#typedef int = sint0
#typedef int(i:i0) = sint1(i)
#typedef sint = sint0
#typedef sint(i:i0) = sint1(i)
#typedef uint = uint0
#typedef uint(i:i0) = uint1(i)
//
#typedef lint = slint0
#typedef lint(i:i0) = slint1(i)
#typedef slint = slint0
#typedef slint(i:i0) = slint1(i)
#typedef ulint = ulint0
#typedef ulint(i:i0) = ulint1(i)
//
#typedef size = usize0
#typedef size(i:i0) = usize1(i)
#typedef usize = usize0
#typedef usize(i:i0) = usize1(i)
#typedef ssize = ssize0
#typedef ssize(i:i0) = ssize1(i)
//
#typedef llint = sllint0
#typedef llint(i:i0) = sllint1(i)
#typedef sllint = sllint0
#typedef sllint(i:i0) = sllint1(i)
#typedef ullint = ullint0
#typedef ullint(i:i0) = ullint1(i)
//
(* ****** ****** *)
//
#typedef
nint = [i:i0 | i >= 0] sint(i)
#typedef
nlint = [i:i0 | i >= 0] slint(i)
#typedef
nsize = [i:i0 | i >= 0] ssize(i)
#typedef
nllint = [i:i0 | i >= 0] sllint(i)
//
(* ****** ****** *)
#typedef
nint(n:i0) = [ n >= 0 ] sint(n)
#typedef
nlint(n:i0) = [ n >= 0 ] slint(n)
#typedef
nsize(n:i0) = [ n >= 0 ] ssize(n)
#typedef
nllint(n:i0) = [ n >= 0 ] sllint(n)
(* ****** ****** *)
//
#typedef
sintlt
(n:i0) = [i:i0 | i < n] sint(i)
#typedef
sintgt
(n:i0) = [i:i0 | i > n] sint(i)
#typedef
sintlte
(n:i0) = [i:i0 | i <= n] sint(i)
#typedef
sintgte
(n:i0) = [i:i0 | i >= n] sint(i)
//
#typedef
nintlt
(n:i0) = [i:nat | i < n] sint(i)
#typedef
nintlte
(n:i0) = [i:nat | i <= n] sint(i)
//
#typedef
sintbtw
(m:i0
,n:i0) = [i:i0 | m <= i; i < n] sint(i)
#typedef
sintbtwe
(m:i0
,n:i0) = [i:i0 | m <= i; i <= n] sint(i)
//
(* ****** ****** *)
//
#typedef
sizelt(n:i0) = [i:i0 | i < n] size(i)
#typedef
sizegt(n:i0) = [i:i0 | i > n] size(i)
#typedef
sizelte(n:i0) = [i:i0 | i <= n] size(i)
#typedef
sizegte(n:i0) = [i:i0 | i >= n] size(i)
//
#typedef
sizebtw
(m:i0
,n:i0) = [i:i0 | m <= i; i < n] size(i)
#typedef
sizebtwe
(m:i0
,n:i0) = [i:i0 | m <= i; i <= n] size(i)
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
  a:type+, bool ) =
| optn_nil(a, ff) of ()
| optn_cons(a, tt) of (a)
//
// end of [optn_t0_i0_tbox]
//
datavwtp
optn_vt_i0_vx
(
  a:vwtp+, bool ) =
| optn_vt_nil(a, ff) of ()
| optn_vt_cons(a, tt) of (a)
//
// end of [optn_vt_i0_vtbx]
//
(* ****** ****** *)
//
#sexpdef optn = optn_t0_i0_x0
#sexpdef loptn = optn_vt_i0_vx
#sexpdef optn_vt = optn_vt_i0_vx
//
(* ****** ****** *)
//
fcast
optn_vt2t
{a:t0}{b:b0}
(xs: optn_vt(a, b)): optn(a, b)
//
(* ****** ****** *)
//
(*
#symload nil with optn_nil
#symload cons with optn_cons
#symload nil with optn_vt_nil
#symload cons with optn_vt_cons
#symload lnil with optn_vt_nil
#symload lcons with optn_vt_cons
*)
(*
#symload none with optn_nil0
#symload some with optn_cons
#symload lnone with optn_vt_nil
#symload lsome with optn_vt_cons
*)
(*
#symload nil_vt with optn_vt_nil
#symload cons_vt with optn_vt_cons
#symload none_vt with optn_vt_nil
#symload some_vt with optn_vt_cons
*)
//
(* ****** ****** *)
//
#typedef
optn
(a:t0) = [b:b0] optn(a, b)
#typedef
optn0
(a:t0) = [b:b0] optn(a, b)
#typedef
optn1(a:t0,b:b0) = optn(a, b)
//
#vwtpdef
loptn
(a:vt) = [b:b0] loptn(a, b)
#vwtpdef
loptn0
(a:vt) = [b:b0] loptn(a, b)
#vwtpdef
loptn1(a:vt,b:b0) = loptn(a, b)
//
#vwtpdef
optn_vt
(a:vt) = [b:b0] optn_vt(a, b)
#vwtpdef
optn0_vt
(a:vt) = [b:b0] optn_vt(a, b)
#vwtpdef
optn1_vt(a:vt,b:b0) = optn_vt(a, b)
//
(* ****** ****** *)
//
// HX-2018-10-01:
//
datatype
list_t0_i0_x0
(
  a:type+, int(*len*) ) =
//
|
list_nil
(a, 0(*len*)) of ((*0*))//nil
//
|
{n:i0 | n >= 0}
list_cons
(a, n+1(*len*)) of
(a, list_t0_i0_x0(a, n))//cons
//
// end of [ list_t0_i0_x0(a,n) ]
//
datavwtp
list_vt_i0_vx
(
  a:vwtp+, int(*len*) ) =
//
|
list_vt_nil
(a, 0(*len*)) of ((*0*))//nil
//
|
{n:i0 | n >= 0}
list_vt_cons
(a, n+1(*len*)) of
(a, list_vt_i0_vx(a, n))//cons
//
// end of [ list_vt_i0_vx(a,n) ]
//
(* ****** ****** *)
//
#sexpdef list = list_t0_i0_x0
#sexpdef llist = list_vt_i0_vx
#sexpdef list_vt = list_vt_i0_vx
//
(* ****** ****** *)
//
fcast
list_vt2t
{a:t0}{n:i0}
(xs: list_vt(a, n)): list(a, n)
//
(* ****** ****** *)
//
(*
#symload nil with list_nil
#symload cons with list_cons
#symload nil with list_vt_nil
#symload cons with list_vt_cons
#symload lnil with list_vt_nil
#symload lcons with list_vt_cons
#symload nil_vt with list_vt_nil
#symload cons_vt with list_vt_cons
*)
//
(* ****** ****** *)
//
#typedef
list(a:t0) = [n:i0] list(a, n)
//
#typedef
list0(a:t0) = [n:i0 | n >= 0] list(a, n)
#typedef
list1(a:t0) = [n:i0 | n >= 1] list(a, n)
//
#typedef
listlt
(a:t0, n:i0) = [k:nat | k < n] list(a, k)
#typedef
listgt
(a:t0, n:i0) = [k:nat | k > n] list(a, k)
//
#typedef
listlte
(a:t0, n:i0) = [k:nat | k <= n] list(a, k)
#typedef
listgte
(a:t0, n:i0) = [k:nat | k >= n] list(a, k)
//
#typedef
listbtw
( a:t0
, m:i0, n:i0) = [k:nat | m <= k; k < n] list(a, k)
#typedef
listbtwe
( a:t0
, m:i0, n:i0) = [k:nat | m <= k; k <= n] list(a, k)
//
(* ****** ****** *)
//
//
#vwtpdef
llist(a:vt) =
[n:i0] llist(a, n)
//
#vwtpdef
llist0(a:vt) =
[n:i0 | n >= 0] llist(a, n)
#vwtpdef
llist1(a:vt) =
[n:i0 | n >= 1] llist(a, n)
//
#vwtpdef
llistlt
(a:vt, n:i0) = [k:nat | k < n] llist(a, k)
#vwtpdef
llistgt
(a:vt, n:i0) = [k:int | k > n] llist(a, k)
#vwtpdef
llistlte
(a:vt, n:i0) = [k:nat | k <= n] llist(a, k)
#vwtpdef
llistgte
(a:vt, n:i0) = [k:int | k >= n] llist(a, k)
//
#vwtpdef
llistbtw
( a:vt
, m:i0, n:i0) = [k:i0 | m <= k; k < n] llist(a, k)
#vwtpdef
llistbtwe
( a:vt
, m:i0, n:i0) = [k:i0 | m <= k; k <= n] llist(a, k)
//
(* ****** ****** *)
//
#vwtpdef
list_vt(a:vt) =
[n:i0] list_vt(a, n)
//
#vwtpdef
list0_vt(a:vt) =
[n:i0 | n >= 0] list_vt(a, n)
#vwtpdef
list1_vt(a:vt) =
[n:i0 | n >= 1] list_vt(a, n)
//
#vwtpdef
listlt_vt
(a:vt, n:i0) = [k:nat | k < n] list_vt(a, k)
#vwtpdef
listgt_vt
(a:vt, n:i0) = [k:int | k > n] list_vt(a, k)
#vwtpdef
listlte_vt
(a:vt, n:i0) = [k:nat | k <= n] list_vt(a, k)
#vwtpdef
listgte_vt
(a:vt, n:i0) = [k:int | k >= n] list_vt(a, k)
//
#vwtpdef
listbtw_vt
( a:vt
, m:i0, n:i0) = [k:i0 | m <= k; k < n] list_vt(a, k)
#vwtpdef
listbtwe_vt
( a:vt
, m:i0, n:i0) = [k:i0 | m <= k; k <= n] list_vt(a, k)
//
(* ****** ****** *)
//
#typedef
sflt_k =
$extype("xats_sflt_t")
#typedef
dflt_k =
$extype("xats_dflt_t")
#typedef
ldflt_k =
$extype("xats_ldflt_t")
//
#abstype
gflt_type(a:t0) <= a
//
#typedef
sflt = gflt_type(sflt_k)
#typedef
dflt = gflt_type(dflt_k)
#typedef
ldflt = gflt_type(ldflt_k)
//
#typedef
gflt(a:t0) = gflt_type(a)
//
#typedef
float = sflt // single precision
#typedef
double = dflt // double precision
#typedef
ldouble = ldflt // double precision
//
(* ****** ****** *)
//
#abstype
string_i0_x0(n:i0) <= p0tr
#abstype
stropt_i0_x0(n:i0) <= p0tr
//
#typedef
string0 =
[n:i0] string_i0_x0(n)
#typedef
string1
(n:i0) = string_i0_x0( n )
//
#typedef
stropt0 =
[n:i0] stropt_i0_x0(n)
#typedef
stropt1
(n:i0) = stropt_i0_x0( n )
//
(* ****** ****** *)
//
#sexpdef strn = string0
#sexpdef strn = string1
//
#sexpdef strn0 = string0
#sexpdef strn1 = string1
//
#typedef string = string0
#typedef string(n:i0) = string1(n)
//
#typedef stropt = stropt0
#typedef stropt(n:i0) = stropt1(n)
//
(* ****** ****** *)
//
#absvwtp
string_i0_vx(n:i0) <= p0tr
#absvwtp
stropt_i0_vx(n:i0) <= p0tr
//
#vwtpdef
string0_vt =
[n:i0] string_i0_vx(n)
#vwtpdef
string1_vt
(n:i0) = string_i0_vx( n )
//
#vwtpdef
stropt0_vt =
[n:i0] stropt_i0_vx(n)
#vwtpdef
stropt1_vt
(n:i0) = stropt_i0_vx( n )
//
(* ****** ****** *)
//
#sexpdef lstrn = string0_vt
#sexpdef lstrn = string1_vt
//
#sexpdef strn_vt = string0_vt
#sexpdef strn_vt = string1_vt
//
#vwtpdef string_vt = string0_vt
#vwtpdef string_vt(n:i0) = string1_vt(n)
//
(* ****** ****** *)
//
#vwtpdef lstropt = stropt0_vt
#vwtpdef lstropt(n:i0) = stropt1_vt(n)
//
#vwtpdef stropt_vt = stropt0_vt
#vwtpdef stropt_vt(n:i0) = stropt1_vt(n)
//
(* ****** ****** *)
(*
//
// HX:
// For exceptions:
//
#absvwtp excptn_vt <= p0tr
//
*)
(* ****** ****** *)
//
#abstbox
lazy_t0_x0
(elt:type+) <= p0tr
#typedef
lazy(a:t0) = lazy_t0_x0(a)
//
#absvtbx
lazy_vt_vx
(elt:vwtp+) <= p0tr
#vwtpdef
lazy_vt(a:vt) = lazy_vt_vx(a)
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
#absview
a0ptr_view(a:vt,l:a0)
#sexpdef @ = a0ptr_view
//
#absview
a1ptr_view(a:vt,l:a0,n:i0)
#sexpdef arrvw = a1ptr_view
//
(* ****** ****** *)
//
datatype
strmcon(a:type+) =
|strmcon_nil of ((*void*))
|strmcon_cons of (a, stream(a))
and//datatype
strxcon(a:type+) =
|strxcon_cons of (a, streax(a))
//
where
{
#typedef
stream(a:t0) = lazy(strmcon(a))
#typedef
streax(a:t0) = lazy(strxcon(a)) }
//(* where *) // [strmcom/strxcom]
//
(* ****** ****** *)
#sexpdef
strm(* (a,n) *) = stream(*(a,n)*)
#sexpdef
strx(* (a,n) *) = streax(*(a,n)*)
(* ****** ****** *)
//
datavwtp
strmcon_vt(a:vwtp+) =
|
strmcon_vt_nil of ((*void*))
|
strmcon_vt_cons of (a, stream_vt(a))
//
and//datavwtp
strxcon_vt(a:vwtp+) =
|
strxcon_vt_cons of (a, streax_vt(a))
//
where
{
//
#vwtpdef
stream_vt
( a: vt ) = lazy_vt( strmcon_vt(a) )
#vwtpdef
streax_vt
( a: vt ) = lazy_vt( strxcon_vt(a) )
//
} (*where*)//end-of-[strmcon/strxcon]
//
(* ****** ****** *)
//
#sexpdef
lstrm(*a:vt*) = stream_vt(* a:vt *)
#sexpdef
lstrx(*a:vt*) = streax_vt(* a:vt *)
//
#sexpdef
strm_vt(*a:vt*) = stream_vt(* a:vt *)
#sexpdef
strx_vt(*a:vt*) = streax_vt(* a:vt *)
//
(* ****** ****** *)
//
(*
#symload nil with strmcon_nil
#symload cons with strmcon_cons
#symload nil with strmcon_vt_nil
#symload cons with strmcon_vt_cons
#symload lnil with strmcon_vt_nil
#symload lcons with strmcon_vt_cons
#symload nil_vt with strmcon_vt_nil
#symload cons_vt with strmcon_vt_cons
*)
(*
#symload cons with strxcon_cons
#symload cons with strxcon_vt_cons
#symload lcons with strxcon_vt_cons
#symload cons_vt with strxcon_vt_cons
*)
//
(* ****** ****** *)
datatype
strqcon
(a:type+, int) =
|
strqcon_nil
( a, 0(*len*) ) of ((*void*))
|
{n:i0 | n >= 0}
strqcon_cons
( a, n+1(*len*) ) of (a, streaq(a,n))
where
{
#typedef
streaq(a:t0,n:i0) = lazy(strqcon(a,n))}
(* ****** ****** *)
datavwtp
strqcon_vt
(a:vwtp+, int) =
|
strqcon_vt_nil
( a, 0(*len*) ) of ((*void*))
|
{n:i0 | n >= 0}
strqcon_vt_cons
( a, n+1(*len*) ) of (a, streaq_vt(a,n))
where
{
#vwtpdef
streaq_vt
( a:vt,n:i0 ) = lazy_vt(strqcon_vt(a,n))
} (* where *)//end-of-[strqcon_vt(a, n)]
(* ****** ****** *)
//
(*
#symload nil with strqcon_nil
#symload cons with strqcon_cons
#symload nil with strqcon_vt_nil
#symload cons with strqcon_vt_cons
#symload lnil with strqcon_vt_nil
#symload lcons with strqcon_vt_cons
#symload nil_vt with strqcon_vt_nil
#symload cons_vt with strqcon_vt_cons
*)
//
(* ****** ****** *)
//
#sexpdef
strq(*a:vt,n:i0*) = streaq(*(a, n)*)
//
#sexpdef
lstrq(*a:vt,n:i0*) = streaq_vt(*(a, n)*)
#sexpdef
strq_vt(*a:vt,n:i0*) = streaq_vt(*(a, n)*)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_basics0.sats] *)
