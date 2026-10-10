(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                             3rd edition                             *)
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

(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)
//
#define
XATSPACK="ATS-Xanadu@20220500"
(*
#define // HX: first start
XATSPACK="ATS-Xanadu@20180400"
#define // HX: more explicit
XATSPACK="ATS3-Xanadu@20220500"
*)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
//
// This one was
// there at the very beginning of ATS
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)
//
// sort for true
//
(*
#abssort true
// [true] is built-in
*)
//
(* ****** ****** *)(* ****** ****** *)
//
// predicative sorts
//
(*
#abssort int0
// [int0] is built-in
#abssort addr
// [addr] is built-in
#abssort bool//tt,ff
// [bool] is built-in
#abssort char//[0,256)
// [char] is built-in
#abssort float
// [float] is built-in
#abssort string
// [string] is built-in
*)
//
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
//
#sortdef i0 = int0
//
#sortdef a0 = addr
#sortdef b0 = bool
#sortdef c0 = char
//
#sortdef p0 = prop
#sortdef pp = prop
#sortdef v0 = view
#sortdef vw = view
#sortdef t0 = type
#sortdef tp = type
#sortdef tx = tbox
#sortdef vt = vwtp
#sortdef vx = vtbx
//
(* ****** ****** *)(* ****** ****** *)
#sortdef int = int0
(* ****** ****** *)(* ****** ****** *)
//
datasort
ints_sort =
|
ints_nil//of()
|
ints_cons of
(int, ints_sort)
//
#sortdef
ints = ints_sort // int-seqs
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
//
#stacst0
tt_b0 : b0 // true
#stacst0
ff_b0 : b0 // false
//
#sexpdef tt = tt_b0 // overloading
#sexpdef ff = ff_b0 // overloading
//
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
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
#stacst0
max_i0_i0: (i0, i0) -> i0
#stacst0
min_i0_i0: (i0, i0) -> i0
//
#sexpdef < = lt_i0_i0 // overloading
#sexpdef > = gt_i0_i0 // overloading
#sexpdef = = eq_i0_i0 // overloading
//
#sexpdef <= = lte_i0_i0 // overloading
#sexpdef >= = gte_i0_i0 // overloading
#sexpdef != = neq_i0_i0 // overloading
//
#sexpdef max = max_i0_i0 // overloading
#sexpdef min = min_i0_i0 // overloading
//
(* ****** ****** *)(* ****** ****** *)
//
#sortdef n0 = {i:i0 | i >= 0}
//
(* ****** ****** *)(* ****** ****** *)
//
#sortdef neg = {i:i0 | i < 0}
#sortdef nat = {i:i0 | i >= 0}
#sortdef pos = {i:i0 | i >= 1}
//
(* ****** ****** *)(* ****** ****** *)
//
#sortdef agtz = {a:a0 | a > 0}
#sortdef agez = {a:a0 | a >= 0}
//
(* ****** ****** *)(* ****** ****** *)
//
#stacst0
sizeof_vt_i0: (vt) -> i0
#sexpdef
sz(vt:vt) = sizeof_vt_i0(vt)
#sexpdef
size(vt:vt) = sizeof_vt_i0(vt)
//
(* ****** ****** *)(* ****** ****** *)
//
(*
#stacst0
offset_vt_cs: (vt,cs) -> i0
#sexpdef
ofs(t:vt,l:cs) = offset_vt_cs(t,l)
*)
//
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
//
#absvwtp
cbv0_v0_vt(v0: v0)//(v0)
#absvwtp
cbv1_v0_vt(v0: v0)//(v0)
//
#absvwtp
cbrf_vt_vt(vt: vt) <= vt
//
#sexpdef ~ = cbv0_v0_vt(*0*)
#sexpdef ! = cbv1_v0_vt(*0*)
#sexpdef & = cbrf_vt_vt(*0*)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)
//
#abstype
top0_vt_t0(vt: vt)//(?vt)
#abstype
top1_vt_t0(vt: vt)//(?!vt)
//
#sexpdef ?  = top0_vt_t0(*0*)
#sexpdef ?! = top1_vt_t0(*0*)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)
(*
//
HX-2023-07-18:
This is not working due
to the special use of (_)
//
#absvwtp
atx2_vt_vt_vt(ta:vt,tb:vt)<=ta
#sexpdef >> = atx2_vt_vt_vt(*0*)
*)
(* ****** ****** *)(* ****** ****** *)
//
#typedef
void =
$extype("xats_void_t")
//
(* ****** ****** *)(* ****** ****** *)
//
#typedef
p0tr =
$extbox("xats_p0tr_t")
//
(* ****** ****** *)(* ****** ****** *)
//
#typedef
p1tr_k =
$extype("xats_p1tr_t")
#typedef
p2tr_k =
$extype("xats_p2tr_t")
//
(* ****** ****** *)(* ****** ****** *)
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
(t: vt) = [l:a0] p2tr_tbox(t, l)
#typedef
p2tr1
(t: vt, l: a0) = p2tr_tbox(t, l)
//
#typedef p1tr = p1tr0
#typedef p1tr(l:a0) = p1tr1(l)
#typedef p2tr(t:vt) = p2tr0(t)
#typedef p2tr(t:vt, l:a0) = p2tr1(t, l)
//
(* ****** ****** *)(* ****** ****** *)
//
#absview
p2at_view(vt,a0) // linprop
#viewdef
p2at0
(t: vt) = [l:a0] p2at_view(t, l)
#viewdef
p2at1
(t: vt, l: a0) = p2at_view(t, l)
//
#viewdef p2at(t:vt) = p2tr0(t)
#viewdef p2at(t:vt, l:a0) = p2tr1(t, l)
//
(* ****** ****** *)(* ****** ****** *)
//
#abstype
cp1tr_tbox
(l:a0) <= p1tr_k
#abstype
cp2tr_tbox
(t:vt, l:a0) <= p2tr_k
//
#typedef
cp1tr0 = [l:a0] cp1tr_tbox(l)
#typedef
cp1tr1(l: a0) = cp1tr_tbox(l)
//
#typedef
cp2tr0
(t: vt) = [l:a0] cp2tr_tbox(t, l)
#typedef
cp2tr1
(t: vt, l: a0) = cp2tr_tbox(t, l)
//
#typedef cp1tr = cp1tr0
#typedef cp1tr(l:a0) = cp1tr1(l)
#typedef cp2tr(t:vt) = cp2tr0(t)
#typedef cp2tr(t:vt, l:a0) = cp2tr1(t, l)
//
(* ****** ****** *)(* ****** ****** *)

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

(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
//
#typedef
tbool = bool1(tt) // singleton
#typedef
fbool = bool1(ff) // singleton
//
#typedef bool = bool0
#typedef bool(b:b0) = bool1(b)
//
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
//
#abstype
gint_type(t:t0,i:i0) <= (t)
//
#typedef
gint0(t:t0)=
[i:i0] gint_type(t(*k*), i)
//
#typedef
gint1 // HX: indexed int-type
(t:t0,i:i0) = gint_type(t, i)
//
(* ****** ****** *)(* ****** ****** *)
//
#typedef
sint0 = gint0(sint_k)
#typedef
uint0 = gint0(uint_k)
//
#typedef
sint1(i:i0) = gint1(sint_k, i)
#typedef
uint1(i:i0) = gint1(uint_k, i)
//
(* ****** ****** *)(* ****** ****** *)
//
#typedef
slint0 = gint0(slint_k)
#typedef
ulint0 = gint0(ulint_k)
//
#typedef
slint1(i:i0) = gint1(slint_k, i)
#typedef
ulint1(i:i0) = gint1(ulint_k, i)
//
(* ****** ****** *)(* ****** ****** *)
//
#typedef
ssize0 = gint0(ssize_k)
#typedef
usize0 = gint0(usize_k)
//
#typedef
ssize1(i:i0) = gint1(ssize_k, i)
#typedef
usize1(i:i0) = gint1(usize_k, i)
//
(* ****** ****** *)(* ****** ****** *)
//
#typedef sllint0 = gint0(sllint_k)
#typedef ullint0 = gint0(ullint_k)
//
#typedef
sllint1(i:i0) = gint1(sllint_k, i)
#typedef
ullint1(i:i0) = gint1(ullint_k, i)
//
(* ****** ****** *)(* ****** ****** *)
//
#typedef
gint(t:t0) = gint0(t)
#typedef
gint(t:t0,i:i0) = gint1(t, i)
//
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
#typedef
nint(n:i0) = [ n >= 0 ] sint(n)
#typedef
nlint(n:i0) = [ n >= 0 ] slint(n)
#typedef
nsize(n:i0) = [ n >= 0 ] ssize(n)
#typedef
nllint(n:i0) = [ n >= 0 ] sllint(n)
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
//
datatype
unit = unit of ()
datavwtp
unit_vt = unit_vt of ()
//
(* ****** ****** *)(* ****** ****** *)
//
datatype
optn_t0_i0_tx
(
  t:type+, bool ) =
| optn_nil(t, ff) of ()
| optn_cons(t, tt) of (t)  
//
// end-of-[optn_t0_i0_tbox()]
//
datavwtp
optn_vt_i0_vx
(
  t:vwtp+, bool ) =
| optn_vt_nil(t, ff) of ()
| optn_vt_cons(t, tt) of (t)
//
// end-of-[optn_vt_i0_vtbx()]
//
(* ****** ****** *)(* ****** ****** *)
//
#sexpdef optn = optn_t0_i0_tx
//
#sexpdef loptn = optn_vt_i0_vx
#sexpdef optn_vt = optn_vt_i0_vx
//
(* ****** ****** *)(* ****** ****** *)
//
fcast
optn_vt2t
{t:t0}{b:b0}
(xs: optn_vt(t, b)): optn(t, b)
//
#symload vt2t with optn_vt2t of 1000
//
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
//
#typedef
optn
(t:t0) = [b:b0] optn(t, b)
#typedef
optn0
(t:t0) = [b:b0] optn(t, b)
#typedef
optn1(t:t0,b:b0) = optn(t, b)
//
#vwtpdef
loptn
(t:vt) = [b:b0] loptn(t, b)
#vwtpdef
loptn0
(t:vt) = [b:b0] loptn(t, b)
#vwtpdef
loptn1(t:vt,b:b0) = loptn(t, b)
//
#vwtpdef
optn_vt
(t:vt) = [b:b0] optn_vt(t, b)
#vwtpdef
optn0_vt
(t:vt) = [b:b0] optn_vt(t, b)
#vwtpdef
optn1_vt(t:vt,b:b0) = optn_vt(t, b)
//
(* ****** ****** *)(* ****** ****** *)
//
// HX-2018-10-01:
//
datatype
list_t0_i0_tx
(
  t:type+, int(*len*) ) =
//
|
list_nil
(t, 0(*len*)) of ((*0*))//nil
//
|
{n:i0 | n >= 0}
list_cons
(t, n+1(*len*)) of
(t, list_t0_i0_tx(t, n))//cons
//
// end-of-[ list_t0_i0_tx(t,n) ]
//
datavwtp
list_vt_i0_vx
(
  t:vwtp+, int(*len*) ) =
//
|
list_vt_nil
(t, 0(*len*)) of ((*0*))//nil
//
|
{n:i0 | n >= 0}
list_vt_cons
(t, n+1(*len*)) of
(t, list_vt_i0_vx(t, n))//cons
//
// end-of-[ list_vt_i0_vx(t,n) ]
//
(* ****** ****** *)(* ****** ****** *)
//
#sexpdef list = list_t0_i0_tx
//
#sexpdef llist = list_vt_i0_vx
#sexpdef list_vt = list_vt_i0_vx
//
(* ****** ****** *)(* ****** ****** *)
//
fcast
list_vt2t
{t:t0}{n:i0}
(xs: list_vt(t, n)): list(t, n)
//
#symload vt2t with list_vt2t of 1000
//
(* ****** ****** *)(* ****** ****** *)
//
(*
#symload nil with list_nil
#symload cons with list_cons
*)
//
(*
#symload nil with list_vt_nil
#symload cons with list_vt_cons
#symload lnil with list_vt_nil
#symload lcons with list_vt_cons
#symload nil_vt with list_vt_nil
#symload cons_vt with list_vt_cons
*)
//
(* ****** ****** *)(* ****** ****** *)
//
#typedef
list(t:t0) = [n:i0] list(t, n)
//
#typedef
list0(t:t0) = [n:i0 | n >= 0] list(t, n)
#typedef
list1(t:t0) = [n:i0 | n >= 1] list(t, n)
//
#typedef
listlt
(t:t0, n:i0) = [i:nat | i < n] list(t, i)
#typedef
listgt
(t:t0, n:i0) = [k:int | k > n] list(t, k)
//
#typedef
listlte
(t:t0, n:i0) = [i:nat | i <= n] list(t, i)
#typedef
listgte
(t:t0, n:i0) = [k:int | k >= n] list(t, k)
//
#typedef
listbtw
( t:t0
, m:i0, n:i0) = [i:nat | m <= i; i < n] list(t, i)
#typedef
listbtwe
( t:t0
, m:i0, n:i0) = [i:nat | m <= i; i <= n] list(t, i)
//
(* ****** ****** *)(* ****** ****** *)
//
//
#vwtpdef
llist(t:vt) =
[n:i0] llist(t, n)
//
#vwtpdef
llist0(t:vt) =
[n:i0 | n >= 0] llist(t, n)
#vwtpdef
llist1(t:vt) =
[n:i0 | n >= 1] llist(t, n)
//
#vwtpdef
llistlt
(t:vt, n:i0) = [i:nat | i < n] llist(t, i)
#vwtpdef
llistgt
(t:vt, n:i0) = [k:int | k > n] llist(t, k)
#vwtpdef
llistlte
(t:vt, n:i0) = [i:nat | i <= n] llist(t, i)
#vwtpdef
llistgte
(t:vt, n:i0) = [k:int | k >= n] llist(t, k)
//
#vwtpdef
llistbtw
( t:vt
, m:i0, n:i0) = [i:i0 | m <= i; i < n] llist(t, i)
#vwtpdef
llistbtwe
( t:vt
, m:i0, n:i0) = [i:i0 | m <= i; i <= n] llist(t, i)
//
(* ****** ****** *)(* ****** ****** *)
//
#vwtpdef
list_vt(t:vt) =
[n:i0] list_vt(t, n)
//
#vwtpdef
list0_vt(t:vt) =
[n:i0 | n >= 0] list_vt(t, n)
#vwtpdef
list1_vt(t:vt) =
[n:i0 | n >= 1] list_vt(t, n)
//
#vwtpdef
listlt_vt
(t:vt, n:i0) = [i:nat | i < n] list_vt(t, i)
#vwtpdef
listgt_vt
(t:vt, n:i0) = [k:int | k > n] list_vt(t, k)
#vwtpdef
listlte_vt
(t:vt, n:i0) = [i:nat | i <= n] list_vt(t, i)
#vwtpdef
listgte_vt
(t:vt, n:i0) = [k:int | k >= n] list_vt(t, k)
//
#vwtpdef
listbtw_vt
( t:vt
, m:i0, n:i0) = [i:i0 | m <= i; i < n] list_vt(t, i)
#vwtpdef
listbtwe_vt
( t:vt
, m:i0, n:i0) = [i:i0 | m <= i; i <= n] list_vt(t, i)
//
(* ****** ****** *)(* ****** ****** *)
//
#typedef
sflt_k = $extype("xats_sflt_t")
#typedef
dflt_k = $extype("xats_dflt_t")
#typedef
ldflt_k = $extype("xats_ldflt_t")
//
(* ****** ****** *)(* ****** ****** *)
//
#abstype
gflt_type(t:t0) <= (t)
//
#typedef
sflt = gflt_type(sflt_k)
#typedef
dflt = gflt_type(dflt_k)
#typedef
ldflt = gflt_type(ldflt_k)
//
#typedef
gflt(t:t0) = gflt_type( t )
//
#typedef
float = sflt // single precision
#typedef
double = dflt // double precision
#typedef
ldouble = ldflt // double precision
//
(* ****** ****** *)(* ****** ****** *)
//
#abstype
string_i0_tx(n:i0) <= p0tr
#abstype
stropt_i0_tx(n:i0) <= p0tr
//
#typedef
string0 = [n:i0] string_i0_tx(n)
#typedef
string1(n:i0) = string_i0_tx( n )
//
#typedef
stropt0 = [n:i0] stropt_i0_tx(n)
#typedef
stropt1(n:i0) = stropt_i0_tx( n )
//
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)
//
#absvwtp
string_i0_vx(n:i0) <= p0tr
#absvwtp
stropt_i0_vx(n:i0) <= p0tr
#absvwtp
strtmp_i0_vx(n:i0) <= p0tr
//
#vwtpdef
string0_vt = [n:i0] string_i0_vx(n)
#vwtpdef
string1_vt(n:i0) = string_i0_vx( n )
//
#vwtpdef
stropt0_vt = [n:i0] stropt_i0_vx(n)
#vwtpdef
stropt1_vt(n:i0) = stropt_i0_vx( n )
//
#vwtpdef
strtmp0_vt = [n: i0] strtmp_i0_vx(n)
#vwtpdef
strtmp1_vt(n: i0) = strtmp_i0_vx( n )
//
(* ****** ****** *)(* ****** ****** *)
//
#sexpdef
lstrn = string0_vt
#sexpdef
lstrn = string1_vt
//
#sexpdef strn_vt = string0_vt
#sexpdef strn_vt = string1_vt
//
#vwtpdef
string_vt = string0_vt
#vwtpdef
string_vt(n:i0) = string1_vt(n)
//
(* ****** ****** *)(* ****** ****** *)
//
#vwtpdef
lstropt = stropt0_vt
#vwtpdef
lstropt(n:i0) = stropt1_vt(n)
//
#vwtpdef
stropt_vt = stropt0_vt
#vwtpdef
stropt_vt(n:i0) = stropt1_vt(n)
//
(* ****** ****** *)(* ****** ****** *)
//
#vwtpdef
strtmp_vt = strtmp0_vt
#vwtpdef
strtmp_vt(n:i0) = strtmp1_vt(n)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)
(*
//
// HX:
// For exceptions:
//
#absvwtp excptn_vt <= p0tr
//
*)
(* ****** ****** *)(* ****** ****** *)
//
#abstbox
lazy_t0_tx
(elt:type+) <= p0tr
#typedef
lazy(t:t0) = lazy_t0_tx(t)
//
#absvtbx
lazy_vt_vx
(elt:vwtp+) <= p0tr
#vwtpdef
llazy(t:vt) = lazy_vt_vx(t)
#vwtpdef
lazy_vt(t:vt) = lazy_vt_vx(t)
//
(* ****** ****** *)(* ****** ****** *)
//
(*
fun
<t1:t0>
<t2:vt>
assign
(x1: &t1 >> t2, x2: t2): void
//
#symload := with assign of 00
//
fun
<v1:v0>
<v2:v0>
pfexch
(pf1: !v0>>v1, pf2: !v2>>v1): void
*)
//
(* ****** ****** *)(* ****** ****** *)
//
#absview
a0ptr_view(t:vt,l:a0)
#sexpdef @ = a0ptr_view
//
#absview
a1ptr_view(t:vt,l:a0,n:i0)
#sexpdef arrvw = a1ptr_view
//
(* ****** ****** *)(* ****** ****** *)
//
datatype
strmcon(t:type+) =
|strmcon_nil of ((*void*))
|strmcon_cons of (t, stream(t))
and//datatype
strxcon(t:type+) =
|strxcon_cons of (t, streax(t))
//
where
{
#typedef
stream(t:t0) = lazy(strmcon(t))
#typedef
streax(t:t0) = lazy(strxcon(t)) }
//(* where *) // [strmcon/strxcon]
//
(* ****** ****** *)(* ****** ****** *)
#sexpdef
strm(* (t,n) *) = stream(*(t,n)*)
#sexpdef
strx(* (t,n) *) = streax(*(t,n)*)
(* ****** ****** *)(* ****** ****** *)
//
datavwtp
strmcon_vt(t:vwtp+) =
|
strmcon_vt_nil of ((*void*))
|
strmcon_vt_cons of (t, stream_vt(t))
//
and//datavwtp
strxcon_vt(t:vwtp+) =
|
strxcon_vt_cons of (t, streax_vt(t))
//
where
{
//
#vwtpdef
stream_vt
( t: vt ) = lazy_vt( strmcon_vt(t) )
#vwtpdef
streax_vt
( t: vt ) = lazy_vt( strxcon_vt(t) )
//
} (*where*)//end-of-[strmcon/strxcon]
//
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
//
datatype
strqcon
(t:type+, int) =
|
strqcon_nil
(t, 0(*len*)) of ((*void*))
|
{n:i0 | n >= 0}
strqcon_cons
(t, n+1(*len*)) of (t, streaq(t,n))
where
{
#typedef
streaq(t:t0,n:i0) = lazy(strqcon(t,n))
}(*where*)//end-of-[strqcon(t:t0,i:i0)]
//
(* ****** ****** *)(* ****** ****** *)
//
datavwtp
strqcon_vt
(t:vwtp+, int) =
|
strqcon_vt_nil
(t, 0(*len*)) of ((*void*))
|
{n:i0 | n >= 0}
strqcon_vt_cons
(
t, n+1(*len*)) of (t, streaq_vt(t,n))
where
{
#vwtpdef
streaq_vt
(
t:vt,n:i0) = lazy_vt(strqcon_vt(t,n))
}(*where*)//endof[strqcon_vt(t:vt,i:i0)]
//
(* ****** ****** *)(* ****** ****** *)
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
(* ****** ****** *)(* ****** ****** *)
//
#sexpdef
strq(*t:t0,n:i0*) = streaq(*(t,n)*)
//
#sexpdef
lstrq(*t:vt,n:i0*) = streaq_vt(*(t,n)*)
#sexpdef
strq_vt(*t:vt,n:i0*) = streaq_vt(*(t,n)*)
//
(* ****** ****** *)(* ****** ****** *)
//
#typedef
strq(t:t0) = [n:i0] strq(t, n)
#typedef
strqcon(t:t0) = [n:i0] strqcon(t, n)
//
#vwtpdef
strq_vt(t:vt) = [n:i0] strq_vt(t, n)
#vwtpdef
strqcon_vt(t:vt) = [n:i0] strqcon_vt(t, n)
//
(* ****** ****** *)(* ****** ****** *)
//
#vwtpdef
strqlt
(t:t0, n:i0) = [i:nat | i < n] strq(t, i)
#vwtpdef
strqgt
(t:t0, n:i0) = [k:int | k > n] strq(t, k)
#vwtpdef
strqlte
(t:t0, n:i0) = [i:nat | i <= n] strq(t, i)
#vwtpdef
strqgte
(t:t0, n:i0) = [k:int | k >= n] strq(t, k)
//
(* ****** ****** *)(* ****** ****** *)
//
#vwtpdef
strqlt_vt
(t:vt, n:i0) = [i:nat | i < n] strq_vt(t, i)
#vwtpdef
strqgt_vt
(t:vt, n:i0) = [k:int | k > n] strq_vt(t, k)
#vwtpdef
strqlte_vt
(t:vt, n:i0) = [i:nat | i <= n] strq_vt(t, i)
#vwtpdef
strqgte_vt
(t:vt, n:i0) = [k:int | k >= n] strq_vt(t, k)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)
//
(*
HX-2024-07-13
*)
#typedef
ilist(t:t0) = list@(nint, t)
#typedef
istrm(t:t0) = strm@(nint, t)
#typedef
istrq(t:t0) = strq@(nint, t)
#typedef
ilist(t:t0,n:i0) = list(@(nintlt(n), t), n)
#typedef
istrq(t:t0,n:i0) = strq(@(nintlt(n), t), n)
//
#vwtpdef
ilist_vt(t:vt) = list_vt@(nint, t)
#vwtpdef
istrm_vt(t:vt) = strm_vt@(nint, t)
#vwtpdef
istrq_vt(t:vt) = strq_vt@(nint, t)
#vwtpdef
ilist_vt(t:vt,n:i0) = list_vt(@(nintlt(n), t), n)
#vwtpdef
istrq_vt(t:vt,n:i0) = strq_vt(@(nintlt(n), t), n)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)
//
(*
HX-2024-07-27:
Sat 27 Jul 2024 07:45:40 PM EDT
*)
//
#absview
owed_view(vt) // linprop
#sexpdef owed = owed_view
//
prfun
owed_t0_make
{t:t0}((*void*)): owed(t)
prfun
owed_t0_elim0
{t:t0}(pf: ~owed(t)): void
prfun
owed_vt_return0
{t:vt}(pf: ~owed(t), x0: t): void
//
#symload return0 with owed_vt_return0
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)
//
(*
HX-2026-04-06:
[estream]: stream
carrying an environment
*)
#absvtbx
elazy_vt_vt_vx
(elt:vwtp+,env:vwtp)<=p0tr
(*
Mon Apr  6 08:49:03 PM EDT 2026
*)
//
(* ****** ****** *)
//
#vwtpdef
ellazy
(elt:vt,env:vt) =
elazy_vt_vt_vx( elt , env )
#vwtpdef
elazy_vt
(elt:vt,env:vt) =
elazy_vt_vt_vx( elt , env )
//
(* ****** ****** *)
(* ****** ****** *)
//
datavwtp
estrmcon_vt
( elt: vwtp+
, env: vwtp) =
|
estrmcon_vt_nil of
(     env     )
|
estrmcon_vt_cons of
( elt
, env, estream_vt(elt, env))
//endof(estrmcon_vt(elt,env))
where
{
#vwtpdef
estream_vt
(elt: vt, env: vt) =
elazy_vt(
  estrmcon_vt(elt, env), env) }
//
(* ****** ****** *)
#sexpdef estrm_vt = estream_vt(*0*)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)
//
(*
HX-2024-07-29:
For type annotation?
Mon 29 Jul 2024 04:56:14 PM EDT
*)
//
fcast
t0_{t:t0}(t): ( t )
fcast
tx_{t:tx}(t): ( t )
fcast
vt_{t:vt}(t): ( t )
fcast
vx_{t:vx}(t): ( t )
//
fcast
fc_sflt(sflt): sflt
fcast
fc_dflt(dflt): dflt
fcast
fc_ldflt(ldflt): ldflt
//
fcast
fc_bool
{b:b0}(bool(b)): bool(b)
fcast
fc_char
{c:c0}(char(c)): char(c)
fcast
fc_sint
{i:i0}(sint(i)): sint(i)
//
fcast
fc_strn
{n:i0}(strn(n)): strn(n)
fcast
fc_strn_vt
{n:i0}(strn_vt(n)): strn_vt(n)
//
fcast
fc_list
{t:t0}
{n:i0}(list(t, n)): list(t, n)
fcast
fc_list_vt
{t:vt}
{n:i0}(list_vt(t, n)): list_vt(t, n)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
//
(*
HX-2025-05-16:
Achtung!Achtung!Achtung!
Fri May 16 07:49:11 PM EDT 2025
The following declarations should NOT be used.
The very purpose of having them here is for bootstrapping ATS3!
*)
//
(***********************************************************************)
(***********************************************************************)
//
(* ****** ****** *)(* ****** ****** *)
//
// HX: singleton
// HX: 1-dimensional
// HX: 2-dimensional
//
(* ****** ****** *)(* ****** ****** *)
//
#abstbox
a0ref_vt_tx(elem:vwtp)
#typedef
a0ref(vt:vt) = a0ref_vt_tx(vt)
//
(* ****** ****** *)(* ****** ****** *)
//
#abstbox
a1ref_vt_i0_tx(elem:vt,ntot:i0)
#abstbox
a1rsz_vt_i0_x0(elem:vt, ntot:i0)
//
#typedef
a1ref(t:vt,n:i0) = a1ref_vt_i0_tx(t, n)
#typedef
a1rsz(t:vt,n:i0) = a1rsz_vt_i0_x0(t, n)
//
(* ****** ****** *)(* ****** ****** *)
//
#abstbox
a2ref_vt_i0_i0_tx(elem:vt,nrow:i0,ncol:i0)
#abstbox
a2rsz_vt_i0_i0_x0(elem:vt,nrow:i0,ncol:i0)
//
#typedef
a2ref
(t:vt,m:i0,n:i0) = a2ref_vt_i0_i0_tx(t, m, n)
#typedef
a2rsz
(t:vt,m:i0,n:i0) = a2rsz_vt_i0_i0_x0(t, m, n)
//
(* ****** ****** *)(* ****** ****** *)
//
#typedef
a1rsz(t:vt) = [n:i0] a1rsz(t, n)
#typedef
a2rsz(t:vt) = [m:i0;n:i0] a2rsz(t, m, n)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)
//
// HX: singleton
// HX: 1-dimensional
// HX: 2-dimensional
//
(* ****** ****** *)(* ****** ****** *)
//
#absvtbx
a0ptr_vt_vx(elem:vwtp)
//
#vwtpdef
a0ptr(vt:vt) = a0ptr_vt_vx(vt)
//
(* ****** ****** *)(* ****** ****** *)
//
#absvtbx
a1ptr_vt_i0_vx(elem:vt,ntot:i0)
#absvtbx
a1psz_vt_i0_vx(elem:vt,ntot:i0)
//
#vwtpdef
a1ptr(t:vt,n:i0) = a1ptr_vt_i0_vx(t, n)
#vwtpdef
a1psz(t:vt,n:i0) = a1psz_vt_i0_vx(t, n)
//
(* ****** ****** *)(* ****** ****** *)
//
#absvtbx
a2ptr_vt_i0_i0_vx(elem:vt,nrow:i0,ncol:i0)
#absvtbx
a2psz_vt_i0_i0_vx(elem:vt,nrow:i0,ncol:i0)
//
#vwtpdef a2ptr
(t:vt,m:i0,n:i0) = a2ptr_vt_i0_i0_vx(t,m,n)
#vwtpdef a2psz
(t:vt,m:i0,n:i0) = a2psz_vt_i0_i0_vx(t,m,n)
//
(* ****** ****** *)(* ****** ****** *)
//
#vwtpdef a1psz(t:vt) = [n:i0] a1psz(t, n)
#vwtpdef a2psz(t:vt) = [m:i0;n:i0] a2psz(t,m,n)
//
(* ****** ****** *)(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_basics0.sats] *)
(***********************************************************************)
(***********************************************************************)
