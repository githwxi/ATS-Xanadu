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
// Start Time: November, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2019-11-02:
// level-1 interpreter for syncheck!
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share\
/atspre_staload_libats_ML.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#define
XATSOPT_targetloc
"./../../.."
//
(* ****** ****** *)
//
#staload
LAB = "{$XATSOPT}/SATS/xlabel0.sats"
#staload
STM = "{$XATSOPT}/SATS/xstamp0.sats"
#staload
SYM = "{$XATSOPT}/SATS/xsymbol.sats"
//
#staload
D2E = "{$XATSOPT}/SATS/dynexp2.sats"
#staload
T12 = "{$XATSOPT}/SATS/trans12.sats"
//
(* ****** ****** *)

overload =
with $D2E.eq_d2cst_d2cst
overload =
with $D2E.eq_d2var_d2var

overload
print with $D2E.print_d2cst

overload
.stamp with $D2E.d2cst_get_stamp
overload
.stamp with $D2E.d2var_get_stamp

(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/xinterp.sats"
//
(* ****** ****** *)

#staload
_(*TMP*) =
"{$XATSOPT}/DATS/dynexp2_print0.dats"

(* ****** ****** *)
//
implement
fprint_val<irval> = fprint_irval
//
(* ****** ****** *)
//
extern
fun
the_d2cstdef_search
(k0: d2cst): Option_vt(irval)
extern
fun
the_d2cstdef_insert
(d2c: d2cst, def: irval): void
//
extern
fun
the_d2vardef_search
(k0: d2var): Option_vt(irval)
extern
fun
the_d2vardef_insert
(d2v: d2var, def: irval): void
//
(* ****** ****** *)
//
datatype
d2key =
| D2Kcst of d2cst // let-fun
| D2Kvar of d2var // arg and let-var
//
(* ****** ****** *)

local
//
absimpl
irenv_tbox =
List0(@(d2key, irval))
//
datavtype
intenv =
|
INTENV of
(int(*level*), intpstk)
//
and
intpstk =
| intpstk_nil of ()
| intpstk_fun of ()
//
| intpstk_let1 of intpstk
| intpstk_try1 of intpstk
(*
| intpstk_loc1 of intpstk
| intpstk_loc2 of intpstk
*)
//
| intpstk_cons of
  (d2key, irval, intpstk)
//
absimpl
intenv_vtbox = intenv
//
in(*in-of-local*)

(* ****** ****** *)

implement
irenv_make_nil
((*void*)) = list_nil()
implement
intenv_make_nil
((*void*)) =
INTENV(0, intpstk_nil())

(* ****** ****** *)

fun
intpstk_make_fenv
(kxs: irenv): intpstk =
(
auxlst
(kxs, intpstk_fun())
) where
{
//
fun
auxlst
( kxs: irenv
, env: intpstk): intpstk =
(
case+ kxs of
| list_nil() => env
| list_cons(kx0, kxs) =>
  (
  auxlst(kxs, env)
  ) where
  {
  val env =
  intpstk_cons(kx0.0, kx0.1, env)
  }
) (* end of [auxlst] *)
//
} (* end of [intpstk_make_fenv] *)

fun
intpstk_take_fenv
(env: !intpstk): irenv =
(
list_vt2t
(
auxenv(env, list_vt_nil())
)
) where
{
vtypedef
res =
List0_vt(@(d2key, irval))
fun
auxenv
(env: !intpstk, res: res): res =
(
case+ env of
//
| intpstk_nil() => res
| intpstk_fun() => res
//
| intpstk_let1
    (env) => auxenv(env, res)
| intpstk_try1
    (env) => auxenv(env, res)
//
(*
| intpstk_loc1
    (env) => auxenv(env, res)
| intpstk_loc2
    (env) => auxenv(env, res)
*)
//
| intpstk_cons(k0, x0, env) =>
  (
    auxenv
    (env, list_vt_cons((k0, x0), res))
  )
)
} (* end of [intpstk_take_fenv] *)

(* ****** ****** *)

implement
intenv_make_fenv
  (kxs) =
INTENV
(
1(*level*)
,
intpstk_make_fenv(kxs)
)
//
implement
intenv_take_fenv(env) =
(
  intpstk_take_fenv(xs)
) where
{
  val+INTENV(l0, xs) = env
}
//
(* ****** ****** *)

implement
intenv_bind_fix
  (env0, irv0) =
let
val-
IRVfix1
( fenv
, d2v0, _, _) = irv0
in
(
  fold@(env0)
) where
{
val+
@INTENV(l0, xs) = env0
val () =
(
xs :=
intpstk_cons
(D2Kvar(d2v0), irv0, xs)
)
} (* end of [where] *)
end // end of [intenv_bind_fix]

(* ****** ****** *)

implement
intenv_bind_fixs
  (env0, irv0) =
(
auxirdfs(env0, irdfs)
) where
{
//
val-
IRVfixs
( fenv
, d2v0, iras
, body, irdfs) = irv0
//
fun
auxirdfs
( env0
: !intenv
, ires
: irexplst): void =
(
case+ ires of
| list_nil
  ((*void*)) => ()
| list_cons
  (ire1, ires) =>
  (
    fold@(env0);
    auxirdfs(env0, ires)
  ) where
  {
  val+
  @INTENV(l0, xs) = env0
  val () =
  (
    xs :=
    intpstk_cons
    (D2Kvar(d2v1), irv1, xs)
  )
  } where
  {
  val-
  IREfix
  ( knd1, d2v1
  , iras, body) = ire1.node()
  val irv1 =
  IRVfixs
  (fenv, d2v1, iras, body, irdfs)
  }
) (* end of [auxirdfs] *)
//
} (* end of [intenv_bind_fixs] *)

(* ****** ****** *)

implement
intenv_pop0_let1
  (env0) =
(
  fold@(env0)
) where
{
//
fun
auxlst
( xs
: intpstk): intpstk =
(
case- xs of
| ~intpstk_let1
   (xs) => xs
| ~intpstk_cons
   (_, _, xs) => auxlst(xs)
)
//
val-
@INTENV(l0, xs) = env0
val () = (xs := auxlst(xs))
} // end of [intenv_push_let1] *)

implement
intenv_push_let1
  (env0) =
(
  fold@(env0)
) where
{
val-
@INTENV(l0, xs) = env0
val () =
(xs := intpstk_let1(xs))
} // end of [intenv_push_let1] *)

(* ****** ****** *)

implement
intenv_pop0_try1
  (env0) =
(
  fold@(env0)
) where
{
//
fun
auxlst
( xs
: intpstk): intpstk =
(
case- xs of
| ~intpstk_try1
   (xs) => xs
| ~intpstk_let1
   (xs) => auxlst(xs)
| ~intpstk_cons
   (_, _, xs) => auxlst(xs)
)
//
val-
@INTENV(l0, xs) = env0
val () = (xs := auxlst(xs))
} // end of [intenv_push_try1] *)

implement
intenv_push_try1
  (env0) =
(
  fold@(env0)
) where
{
val-
@INTENV(l0, xs) = env0
val () =
(xs := intpstk_try1(xs))
} // end of [intenv_push_try1] *)

(* ****** ****** *)

implement
intenv_free_nil
  (env0) =
{
val-0(*top*) = l0
val-~intpstk_nil() = xs
} where
{
val+~INTENV(l0, xs) = env0
} (* intenv_free_nil *)

(* ****** ****** *)
//
implement
intenv_free_fenv
  (env0) =
(
  auxlst(xs)
) where
{
  val-1(*fun*) = l0
} where
{
//
fun
auxlst
(xs: intpstk): void =
(
case- xs of
|
~intpstk_fun() => ()
|
~intpstk_let1(xs) => auxlst(xs)
|
~intpstk_cons(_, _, xs) => auxlst(xs)
)
//
val+~INTENV(l0, xs) = env0
//
} (* end of [intenv_free_fenv] *)
//
(* ****** ****** *)

implement
xinterp_search_d2cst
  (env0, d2c0) =
  (auxlst(xs)) where
{
//
vtypedef
res = Option_vt(irval)
val+INTENV(l0, xs) = env0
//
fun
auxlst
(xs: !intpstk): res =
(
case+ xs of
| intpstk_nil() =>
  the_d2cstdef_search(d2c0)
| intpstk_fun() =>
  the_d2cstdef_search(d2c0)
//
| intpstk_let1(xs) => auxlst(xs)
| intpstk_try1(xs) => auxlst(xs)
//
(*
| intpstk_loc1(xs) => auxlst(xs)
| intpstk_loc2(xs) => auxlst(xs)
*)
| intpstk_cons
  (d2k1, irv1, xs) =>
  (
  case+ d2k1 of
  | D2Kcst(d2c1) =>
    if
    (d2c0 = d2c1)
    then Some_vt(irv1) else auxlst(xs)
  | D2Kvar(d2v1) => auxlst(xs)
  )
) (* end of [auxlst] *)
//
} (* end of [xinterp_search_d2cst] *)

(* ****** ****** *)

implement
xinterp_search_d2var
  (env0, d2v0) =
(
  auxlst(xs)) where
{
//
vtypedef
res = Option_vt(irval)
val+INTENV(l0, xs) = env0
//
fun
auxlst
(xs: !intpstk): res =
(
case+ xs of
| intpstk_nil() =>
  the_d2vardef_search(d2v0)
| intpstk_fun() =>
  the_d2vardef_search(d2v0)
//
| intpstk_let1(xs) => auxlst(xs)
| intpstk_try1(xs) => auxlst(xs)
//
(*
| intpstk_loc1(xs) => auxlst(xs)
| intpstk_loc2(xs) => auxlst(xs)
*)
| intpstk_cons
  (d2k1, irv1, xs) =>
  (
  case+ d2k1 of
  | D2Kcst(d2c1) => auxlst(xs)
  | D2Kvar(d2v1) =>
    if
    (d2v0 = d2v1)
    then Some_vt(irv1) else auxlst(xs)
  )
) (* end of [auxlst] *)
//
} (* end of [xinterp_search_d2var] *)

(* ****** ****** *)

implement
xinterp_insert_d2cst
  (env0, d2c0, irv0) =
let
//
val+
@INTENV(l0, xs) = env0
//
in
//
case xs of
|
intpstk_nil() =>
(
fold@(env0);
the_d2cstdef_insert(d2c0, irv0)
)
|
_(*non-intpstk_nil*) =>
(
fold@(env0)
) where
{
val () =
(
xs :=
intpstk_cons(D2Kcst(d2c0), irv0, xs)
)
} (* non-intpstk_nil *)
//
end // end of [xinterp_insert_d2cst]

(* ****** ****** *)

implement
xinterp_insert_d2var
  (env0, d2v0, irv0) =
let
//
val+
@INTENV(l0, xs) = env0
//
in
//
case xs of
|
intpstk_nil() =>
(
fold@(env0);
the_d2vardef_insert(d2v0, irv0)
)
|
_(*non-intpstk_nil*) =>
(
fold@(env0)
) where
{
val () =
(
xs :=
intpstk_cons(D2Kvar(d2v0), irv0, xs)
)
} (* non-intpstk_nil *)
//
end // end of [xinterp_insert_d2var]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
//
// For
// some functions declared
// in prelude/SATS/bool.sats
//
(* ****** ****** *)

fun
bool_neg
(x: irval): irval =
let
val-
IRVbtf(x)=x in IRVbtf(not(x))
end // end of [bool_neg]

fun
bool_add
( x: irval
, y: irval): irval =
let
val-
IRVbtf(x) = x
val-
IRVbtf(y) = y in IRVbtf(x + y)
end // end of [bool_add]
fun
bool_mul
( x: irval
, y: irval): irval =
let
val-
IRVbtf(x) = x
val-
IRVbtf(y) = y in IRVbtf(x * y)
end // end of [bool_mul]

fun
bool_print
(x: irval): irval =
let
val-IRVbtf(x) = x in
let
val () = print(x) in IRVnil() end
end // end of [bool_print]

fun
bool_fprint
( x: irval
, y: irval): irval =
let
val-IRVptr(x) = x
val-IRVbtf(y) = y
in//let
let
val () =
fprint($UN.cast(x), y) in IRVnil() end
end // end of [bool_fprint]

(* ****** ****** *)
//
// For
// some functions declared
// in prelude/SATS/char.sats
//
(* ****** ****** *)
//
fun
char_code
(x: irval): irval =
let
val-IRVchr(c) = x
in
  IRVint(char2u2int0(c))
end // end of [char_code]
//
fun
char_make_code
(x: irval): irval =
let
val-IRVint(c) = x
in
  IRVchr(int2char0(c))
end // end of [char_make_code]
fun
char_make_sint
(x: irval): irval =
let
val-IRVint(c) = x
in
  IRVchr(int2char0(c))
end // end of [char_make_sint]
fun
char_make_uint
(x: irval): irval =
let
val-IRVuii(u) = x
in
let
  val i = g0u2i(u)
in
  IRVchr(int2char0(i))
end // end of [let]
end // end of [char_make_uint]
//
(* ****** ****** *)

fun
char_eqz
(x: irval): irval =
let
val-IRVchr(c) = x
in
  IRVbtf(char0_iseqz(c))
end // end of [char_eqz]
fun
char_neqz
(x: irval): irval =
let
val-IRVchr(c) = x
in
  IRVbtf(char0_isneqz(c))
end // end of [char_neqz]

(* ****** ****** *)

fun
char_print
(x: irval): irval =
let
val-IRVchr(x) = x in
let
val () = print(x) in IRVnil() end
end // end of [char_print]

fun
char_fprint
( x: irval
, y: irval): irval =
let
val-IRVptr(x) = x
val-IRVchr(y) = y
in//let
let
val () =
fprint($UN.cast(x), y) in IRVnil() end
end // end of [char_fprint]

(* ****** ****** *)

fun
char_cmp
( x: irval
, y: irval): irval =
let
val-IRVchr(x) = x
val-IRVchr(y) = y in IRVint(x - y) end
fun
char_equal
( x: irval
, y: irval): irval =
let
val-IRVchr(x) = x
val-IRVchr(y) = y in IRVbtf(x = y) end
fun
char_noteq
( x: irval
, y: irval): irval =
let
val-IRVchr(x) = x
val-IRVchr(y) = y in IRVbtf(x != y) end

(* ****** ****** *)
//
// For
// some functions declared
// in prelude/SATS/gint.sats
//
(* ****** ****** *)
//
fun
gint_neg_sint
(x: irval): irval =
let
val-IRVint(x) = x in IRVint(~x) end
//
fun
gint_abs_sint
(x: irval): irval =
let
val-IRVint(x) = x in IRVint(abs(x))
end
//
(* ****** ****** *)
//
fun
gint_succ_sint
(x: irval): irval =
let
val-IRVint(x) = x in IRVint(x + 1) end
fun
gint_pred_sint
(x: irval): irval =
let
val-IRVint(x) = x in IRVint(x - 1) end
//
(* ****** ****** *)
//
fun
gint_cmp_sint_sint
( x: irval
, y: irval): irval =
let
  val-IRVint(x) = x
  val-IRVint(y) = y
in
  IRVint(g0int_compare_int(x, y))
end
//
(* ****** ****** *)
//
fun
gint_lt_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVbtf(x < y)
end
fun
gint_gt_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVbtf(x > y)
end
//
fun
gint_eq_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVbtf(x = y)
end
//
fun
gint_lte_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVbtf(x <= y)
end
fun
gint_gte_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVbtf(x >= y)
end
//
fun
gint_neq_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVbtf(x != y)
end
//
(* ****** ****** *)
//
fun
gint_add_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVint(x + y) end
fun
gint_sub_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVint(x - y) end
//
(* ****** ****** *)
//
fun
gint_mul_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVint(x * y) end
fun
gint_div_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVint(x / y) end
fun
gint_mod_sint_sint
( x: irval
, y: irval): irval =
let
val-IRVint(x) = x
val-IRVint(y) = y in IRVint(x % y) end
//
(* ****** ****** *)
//
fun
gint_sint2uint
(x: irval): irval =
let
val-IRVint(x) = x in IRVuii(g0i2u(x))
end
fun
gint_uint2sint
(x: irval): irval =
let
val-IRVuii(x) = x in IRVint(g0u2i(x))
end
//
(* ****** ****** *)
//
fun
gint_print_sint
(x: irval): irval =
let
val-IRVint(x) = x
in
let val () = print(x) in IRVnil() end
end // end of [gint_print_sint]
fun
gint_print_uint
(x: irval): irval =
let
val-IRVuii(x) = x
in
let val () = print(x) in IRVnil() end
end // end of [gint_print_uint]
//
fun
gint_fprint_sint
( x: irval
, y: irval): irval =
let
val-IRVptr(x) = x
val-IRVint(y) = y
in//let
let
val () =
fprint($UN.cast(x), y) in IRVnil() end
end // end of [gint_fprint_sint]
fun
gint_fprint_uint
( x: irval
, y: irval): irval =
let
val-IRVptr(x) = x
val-IRVuii(y) = y
in//let
let
val () =
fprint($UN.cast(x), y) in IRVnil() end
end // end of [gint_fprint_uint]
//
(* ****** ****** *)
//
// For
// some functions declared
// in prelude/SATS/gflt.sats
//
(* ****** ****** *)
//
fun
gflt_si_dflt
(x: irval): irval =
let
val-IRVint(x) = x
in
IRVflt(g0int2float_int_double(x))
end
//
(* ****** ****** *)
//
fun
gflt_neg_dflt
(x: irval): irval =
let
val-IRVflt(x) = x in IRVflt(~x) end
//
fun
gflt_abs_dflt
(x: irval): irval =
let
val-IRVflt(x) = x in IRVflt(abs(x))
end
//
(* ****** ****** *)
//
fun
gflt_succ_dflt
(x: irval): irval =
let
val-IRVflt(x) = x in IRVflt(x + 1) end
fun
gflt_pred_dflt
(x: irval): irval =
let
val-IRVflt(x) = x in IRVflt(x - 1) end
//
(* ****** ****** *)
//
fun
gflt_lt_dflt_dflt
( x: irval
, y: irval): irval =
let
val-IRVflt(x) = x
val-IRVflt(y) = y in IRVbtf(x < y) end
fun
gflt_gt_dflt_dflt
( x: irval
, y: irval): irval =
let
val-IRVflt(x) = x
val-IRVflt(y) = y in IRVbtf(x > y) end
//
fun
gflt_eq_dflt_dflt
( x: irval
, y: irval): irval =
let
val-IRVflt(x) = x
val-IRVflt(y) = y in IRVbtf(x = y) end
//
fun
gflt_lte_dflt_dflt
( x: irval
, y: irval): irval =
let
val-IRVflt(x) = x
val-IRVflt(y) = y in IRVbtf(x <= y) end
fun
gflt_gte_dflt_dflt
( x: irval
, y: irval): irval =
let
val-IRVflt(x) = x
val-IRVflt(y) = y in IRVbtf(x >= y) end
//
fun
gflt_neq_dflt_dflt
( x: irval
, y: irval): irval =
let
val-IRVflt(x) = x
val-IRVflt(y) = y in IRVbtf(x != y) end
//
(* ****** ****** *)
//
fun
gflt_cmp_dflt_dflt
( x: irval
, y: irval): irval =
let
val-IRVflt(x) = x
val-IRVflt(y) = y in IRVint(compare(x, y)) end
//
(* ****** ****** *)

fun
gflt_add_dflt_dflt
( x: irval
, y: irval): irval =
let
val-IRVflt(x) = x
val-IRVflt(y) = y in IRVflt(x + y) end

fun
gflt_sub_dflt_dflt
( x: irval
, y: irval): irval =
let
val-IRVflt(x) = x
val-IRVflt(y) = y in IRVflt(x - y) end

(* ****** ****** *)

fun
gflt_mul_dflt_dflt
( x: irval
, y: irval): irval =
let
val-IRVflt(x) = x
val-IRVflt(y) = y in IRVflt(x * y) end

fun
gflt_div_dflt_dflt
( x: irval
, y: irval): irval =
let
val-IRVflt(x) = x
val-IRVflt(y) = y in IRVflt(x / y) end

(* ****** ****** *)

(*
fun
gflt_mod_dflt_dflt
( x: irval
, y: irval): irval =
let
val-IRVflt(x) = x
val-IRVflt(y) = y in IRVflt(x % y) end
*)

(* ****** ****** *)
//
// For
// some functions declared
// in prelude/SATS/string.sats
//
(* ****** ****** *)
//
fun
strn_head_opt
(x: irval): irval =
let
val-IRVstr(x) = x
val p = string2ptr(x)
in
  IRVchr($UN.ptr0_get<char>(p))
end // end of [strn_head_opt]
fun
strn_head_raw
(x: irval): irval =
let
val-IRVstr(x) = x
val p = string2ptr(x)
in
  IRVchr($UN.ptr0_get<char>(p))
end // end of [strn_head_raw]
//
fun
strn_tail_raw
(x: irval): irval =
let
val-IRVstr(x) = x
val p = string2ptr(x)
in
IRVstr($UN.cast(ptr0_succ<char>(p)))
end // end of [strn_tail_raw]
//
(* ****** ****** *)
//
fun
strn_print
(x: irval): irval =
let
val-IRVstr(x) = x in
let
val () = print(x) in IRVnil() end
end (*let*) // end-of(strn_print)
fun
strn_fprint
( x: irval
, y: irval): irval =
let
val-IRVptr(x) = x
val-IRVstr(y) = y
in//let
let
val () =
fprint($UN.cast(x), y) in IRVnil() end
end (*let*) // end-of(strn_fprint)
//
(* ****** ****** *)
//
fun
strn_get_at
(x: irval
,i: irval): irval =
let
val-IRVstr(x) = x
val-IRVint(i) = i in
let
val p = string2ptr(x)
in
IRVchr($UN.ptr0_get_at<char>(p, i)) end
end (*let*) // end-of(strn_get_at)
//
(* ****** ****** *)

fun
strtmp_vt_alloc
(x: irval): irval =
let
val-IRVint(x) = x in
let
val x0 =
g1ofg0(x)
val () =
assertloc(x0 >= 0)
val p0 =
$UN.castvwtp0{ptr}
(malloc_gc(i2sz(x0+1)))
val c0 = '\000'
val s0 = $UN.cast{string}(p0)
val () =
$UN.ptr0_set_at<char>(p0, x0, c0) in IRVstr(s0)
end
end // end of [strtmp_vt_alloc]
fun
strtmp_vt_set_at
( x: irval
, i: irval
, c: irval): irval =
let
val-IRVstr(x) = x
val-IRVint(i) = i
val-IRVchr(c) = c in
let
val p0 = $UN.cast{ptr}(x)
val () = $UN.ptr0_set_at<char>(p0, i, c) in IRVnil()
end
end // end of [strtmp_vt_set_at]

(* ****** ****** *)
//
fun
a0ptr_alloc
((*void*)): irval =
IRVptr
(
$UN.castvwtp0
(array_ptr_alloc<irval>(i2sz(1)))
)
//
fun
a0ref_get_raw
(A: irval): irval =
let
val-
IRVptr(A) = A
in
  $UN.ptr0_get<irval>(A)
end
fun
a0ref_set_raw
( A: irval
, x: irval): irval =
let
val-IRVptr(A) = A
in
IRVnil() where
{
val () = $UN.ptr0_set<irval>(A, x)
}
end
//
(* ****** ****** *)
//
fun
a1ptr_alloc
(n: irval): irval =
let
val-
IRVint(n) = n
val n = g1ofg0(n)
val () = assert(n >= 0)
in
IRVptr
(
$UN.castvwtp0
(
arrayptr_make_uninitized<irval>(i2sz(n))
)
)
end // end of [a1ptr_alloc]
//
fun
a1ref_head_raw
(A: irval): irval =
let
  val-IRVptr(A) = A
in
  $UN.ptr0_get<irval>(A)
end // end of [a1ref_head_raw]
fun
a1ref_tail_raw
(A: irval): irval =
let
  val-IRVptr(A) = A
in
  IRVptr(ptr_succ<irval>(A))
end // end of [a1ref_tail_raw]
//
fun
a1ref_get_at_raw
( A: irval
, i: irval): irval =
(
  a1ptr_get_at_raw(A, i)
)
and
a1ptr_get_at_raw
( A: irval
, i: irval): irval =
let
  val-IRVptr(A) = A
  val-IRVint(i) = i
in
  $UN.ptr0_get_at<irval>(A, i)
end // end of [a1ref_get_at_raw]
//
fun
a1ref_set_at_raw
( A: irval
, i: irval
, x: irval): irval =
(
  a1ptr_set_at_raw(A, i, x)
)
and
a1ptr_set_at_raw
( A: irval
, i: irval
, x: irval): irval =
let
  val-IRVptr(A) = A
  val-IRVint(i) = i
in
  IRVnil where
  {
  val () =
  $UN.ptr0_set_at<irval>(A, i, x)
  }
end // end of [a1ref_set_at_raw]
//
(* ****** ****** *)

local
//
#staload
STDIO =
"libats/libc/SATS/stdio.sats"
#staload
STDLIB =
"libats/libc/SATS/stdlib.sats"
//
in(*in-of-local*)
//
fun
g_stdin() =
IRVptr($UN.cast(stdin_ref))
fun
g_stdout() =
IRVptr($UN.cast(stdout_ref))
fun
g_stderr() =
IRVptr($UN.cast(stderr_ref))
//
fun
fgetc_ref
(fr: irval): irval =
let
val-IRVptr(fr) = fr
in
IRVint($STDIO.fgetc0($UN.cast(fr)))
end
//
fun
fputc_ref
( c0: irval
, fr: irval): irval =
let
val-IRVint(c0) = c0
val-IRVptr(fr) = fr
in
IRVint
($STDIO.fputc0_int(c0, $UN.cast(fr)))
end
//
(* ****** ****** *)
//
fun
nint_rand_limit
( x0 : irval ): irval  =
let
//
val-IRVint(x0) = x0
//
val x0 = g1ofg0(x0)
val () = assert(x0 > 0)
val r0 = $STDLIB.random()
//
val x0 = $UN.cast{uint}(x0)
val r0 = $UN.cast{uint}(r0)
//
in
IRVint
($UN.cast{int}(g0uint_mod_uint(r0, x0)))
end
//
end // end of [local]

(* ****** ****** *)

local
//
typedef key = d2cst
typedef itm = irval
//
#define D2CSTMAPSZ 1024
//
implement
hash_key<key>(k0) =
let
fun
fhash
( k0
: uint): ulint = hash_key<uint>(k0)
in
$effmask_all
(fhash($STM.stamp2uint(k0.stamp())))
end
implement
equal_key_key<key>(k1, k2) =
$effmask_all
(
$STM.eq_stamp_stamp(k1.stamp(), k2.stamp())
)
//
val
the_d2cstdef_map =
hashtbl_make_nil<key,itm>(i2sz(D2CSTMAPSZ))
//
in (*in-of-local*)

implement
xinterp_fprint_d2cstmap
  (out) =
(
  fprint_hashtbl(out, the_d2cstdef_map)
)

(* ****** ****** *)

implement
the_d2cstdef_search
  (k0) =
hashtbl_search<key,itm>(the_d2cstdef_map, k0)

implement
the_d2cstdef_insert
  (k0, x0) =
{
//
(*
val () =
println!
("the_d2cstdef_insert: k0 = ", k0)
val () =
println!
("the_d2cstdef_insert: x0 = ", x0)
*)
//
val-
~None_vt() =
hashtbl_insert<key,itm>(the_d2cstdef_map, k0, x0)
} (* end of [the_d2cstdef_insert] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local
//
typedef key = d2var
typedef itm = irval
//
#define D2VARMAPSZ 1024
//
implement
hash_key<key>(k0) =
let
fun
fhash
( k0
: uint): ulint = hash_key<uint>(k0)
in
$effmask_all
(fhash($STM.stamp2uint(k0.stamp())))
end
implement
equal_key_key<key>(k1, k2) =
$effmask_all
(
$STM.eq_stamp_stamp(k1.stamp(), k2.stamp())
)
//
val
the_d2vardef_map =
hashtbl_make_nil<key,itm>(i2sz(D2VARMAPSZ))
//
in (*in-of-local*)

implement
xinterp_fprint_d2varmap
  (out) =
(
  fprint_hashtbl(out, the_d2vardef_map)
)

(* ****** ****** *)

implement
the_d2vardef_search
  (k0) =
hashtbl_search<key,itm>(the_d2vardef_map, k0)

implement
the_d2vardef_insert
  (k0, x0) =
{
val-
~None_vt() =
hashtbl_insert<key,itm>(the_d2vardef_map, k0, x0)
} (* end of [the_d2vardef_insert] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

val
the_flag = ref<int>(0)

in(*in-of-local*)

implement
xinterp_initize() =
let
val n0 = the_flag[]
val () = the_flag[] := n0+1
in
if
(n0 = 0)
then
{
val () = xinterp_initize_gint()
}
end // end of [xinterp_initize]

end // end of [local]

(* ****** ****** *)

local

(* ****** ****** *)

fun
firfun0
(
f0: () -> irval
)
: irvalist -<cloref1> irval =
lam(vs) =>
let
val-list_nil() = vs in f0((*void*))
end

fun
firfun1
(
f1:
(irval) -> irval
)
: irvalist -<cloref1> irval =
lam(vs) =>
let
val-list_cons(v1, vs) = vs in f1(v1)
end

fun
firfun2
(
f2:
( irval
, irval) -> irval
)
: irvalist -<cloref1> irval =
lam(vs) =>
let
val-list_cons(v1, vs) = vs
val-list_cons(v2, vs) = vs in f2(v1, v2)
end

fun
firfun3
(
f3:
( irval
, irval
, irval) -> irval
)
: irvalist -<cloref1> irval =
lam(vs) =>
let
val-list_cons(v1, vs) = vs
val-list_cons(v2, vs) = vs
val-list_cons(v3, vs) = vs in f3(v1, v2, v3)
end

(* ****** ****** *)

fun
d2cst
(nam: string): d2cst =
(
let
//
// (*
val () =
println!
("d2cst: nam = ", nam)
// *)
//
val
sym = $SYM.symbol_make(nam)
val
opt = $T12.the_dexpenv_find(sym)
//
in
//
case- opt of
|
~Some_vt(d2i) =>
(
case- d2i of
| $D2E.D2ITMcst(d2cs) =>
  let
  val-list_cons(d2c0, _) = d2cs in d2c0
  end (* end of [D2ITMcst] *)
)
//
end // end of [let]
) (* end of [d2cst] *)

(* ****** ****** *)

in(* in-of-local *)

(* ****** ****** *)

local

val
the_flag = ref<int>(0)

in(*in-of-local*)

implement
xinterp_initize_gint() =
let
//
val n0 = the_flag[]
val () = the_flag[] := n0+1
//
in//let
//
if
(n0 = 0)
then//then
{
//
(* ****** ****** *)
//
(*
For 3 common FILEref-values
*)
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_g_stdin"),IRVfun(firfun0(g_stdin)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_g_stdout"),IRVfun(firfun0(g_stdout)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_g_stderr"),IRVfun(firfun0(g_stderr)))
//
(* ****** ****** *)
//
(*
For
some functions declared
in prelude/SATS/bool000.sats
*)
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_bool_neg"),IRVfun(firfun1(bool_neg)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_bool_add"),IRVfun(firfun2(bool_add)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_bool_mul"),IRVfun(firfun2(bool_mul)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_bool_print"),IRVfun(firfun1(bool_print)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_bool_fprint"),IRVfun(firfun2(bool_fprint)))
//
(* ****** ****** *)
//
// For
// some functions declared
// in prelude/SATS/char.sats
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_char_cmp"),IRVfun(firfun2(char_cmp)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_char_eqz"),IRVfun(firfun1(char_eqz)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_char_neqz"),IRVfun(firfun1(char_neqz)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_char_equal"),IRVfun(firfun2(char_equal)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_char_noteq"),IRVfun(firfun2(char_noteq)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_char_print"),IRVfun(firfun1(char_print)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_char_fprint"),IRVfun(firfun2(char_fprint)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_char_code"),IRVfun(firfun1(char_code)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_char_make_code"),IRVfun(firfun1(char_make_code)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_char_make_sint"),IRVfun(firfun1(char_make_sint)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_char_make_uint"),IRVfun(firfun1(char_make_uint)))
//
(* ****** ****** *)
//
// For
// some functions declared
// in prelude/SATS/gint.sats
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_neg_sint"),IRVfun(firfun1(gint_neg_sint)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_abs_sint"),IRVfun(firfun1(gint_abs_sint)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_succ_sint"),IRVfun(firfun1(gint_succ_sint)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_pred_sint"),IRVfun(firfun1(gint_pred_sint)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_sint2uint"),IRVfun(firfun1(gint_sint2uint)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_uint2sint"),IRVfun(firfun1(gint_uint2sint)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_print_sint"),IRVfun(firfun1(gint_print_sint)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_print_uint"),IRVfun(firfun1(gint_print_uint)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_fprint_sint"),IRVfun(firfun2(gint_fprint_sint)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_fprint_uint"),IRVfun(firfun2(gint_fprint_uint)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_lt_sint_sint"),IRVfun(firfun2(gint_lt_sint_sint)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_gt_sint_sint"),IRVfun(firfun2(gint_gt_sint_sint)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_eq_sint_sint"),IRVfun(firfun2(gint_eq_sint_sint)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_lte_sint_sint"),IRVfun(firfun2(gint_lte_sint_sint)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_gte_sint_sint"),IRVfun(firfun2(gint_gte_sint_sint)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_neq_sint_sint"),IRVfun(firfun2(gint_neq_sint_sint)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_cmp_sint_sint"),IRVfun(firfun2(gint_cmp_sint_sint)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_add_sint_sint"),IRVfun(firfun2(gint_add_sint_sint)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_sub_sint_sint"),IRVfun(firfun2(gint_sub_sint_sint)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_mul_sint_sint"),IRVfun(firfun2(gint_mul_sint_sint)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_div_sint_sint"),IRVfun(firfun2(gint_div_sint_sint)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gint_mod_sint_sint"),IRVfun(firfun2(gint_mod_sint_sint)))
//
(* ****** ****** *)
//
// For
// some functions declared
// in prelude/SATS/gflt.sats
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_si_dflt"),IRVfun(firfun1(gflt_si_dflt)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_neg_dflt"),IRVfun(firfun1(gflt_neg_dflt)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_abs_dflt"),IRVfun(firfun1(gflt_abs_dflt)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_succ_dflt"),IRVfun(firfun1(gflt_succ_dflt)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_pred_dflt"),IRVfun(firfun1(gflt_pred_dflt)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_lt_dflt_dflt"),IRVfun(firfun2(gflt_lt_dflt_dflt)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_gt_dflt_dflt"),IRVfun(firfun2(gflt_gt_dflt_dflt)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_eq_dflt_dflt"),IRVfun(firfun2(gflt_eq_dflt_dflt)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_lte_dflt_dflt"),IRVfun(firfun2(gflt_lte_dflt_dflt)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_gte_dflt_dflt"),IRVfun(firfun2(gflt_gte_dflt_dflt)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_neq_dflt_dflt"),IRVfun(firfun2(gflt_neq_dflt_dflt)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_cmp_dflt_dflt"),IRVfun(firfun2(gflt_cmp_dflt_dflt)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_add_dflt_dflt"),IRVfun(firfun2(gflt_add_dflt_dflt)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_sub_dflt_dflt"),IRVfun(firfun2(gflt_sub_dflt_dflt)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_mul_dflt_dflt"),IRVfun(firfun2(gflt_mul_dflt_dflt)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_div_dflt_dflt"),IRVfun(firfun2(gflt_div_dflt_dflt)))
(*
val () =
the_d2cstdef_insert
(d2cst("XINTERP_gflt_mod_dflt_dflt"),IRVfun(firfun2(gflt_mod_dflt_dflt)))
*)
//
(* ****** ****** *)
//
// For
// some functions declared
// in prelude/SATS/string.sats
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(
d2cst
("XINTERP_strn_head_opt"),IRVfun(firfun1(strn_head_opt)))
val () =
the_d2cstdef_insert
(
d2cst
("XINTERP_strn_head_raw"),IRVfun(firfun1(strn_head_raw)))
val () =
the_d2cstdef_insert
(
d2cst
("XINTERP_strn_tail_raw"),IRVfun(firfun1(strn_tail_raw)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_strn_print"),IRVfun(firfun1(strn_print)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_strn_fprint"),IRVfun(firfun2(strn_fprint)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_strn_get_at"),IRVfun(firfun2(strn_get_at)))
//
(* ****** ****** *)

val () =
the_d2cstdef_insert
(d2cst("XINTERP_strtmp_vt_alloc"),IRVfun(firfun1(strtmp_vt_alloc)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_strtmp_vt_set_at"),IRVfun(firfun3(strtmp_vt_set_at)))

(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_a0ptr_alloc"),IRVfun(firfun0(a0ptr_alloc)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_a1ptr_alloc"),IRVfun(firfun1(a1ptr_alloc)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_a0ref_get_raw"),IRVfun(firfun1(a0ref_get_raw)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_a0ref_set_raw"),IRVfun(firfun2(a0ref_set_raw)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_a1ref_head_raw"),IRVfun(firfun1(a1ref_head_raw)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_a1ref_tail_raw"),IRVfun(firfun1(a1ref_tail_raw)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_a1ref_get_at_raw"),IRVfun(firfun2(a1ref_get_at_raw)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_a1ptr_get_at_raw"),IRVfun(firfun2(a1ptr_get_at_raw)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_a1ref_set_at_raw"),IRVfun(firfun3(a1ref_set_at_raw)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_a1ptr_set_at_raw"),IRVfun(firfun3(a1ptr_set_at_raw)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_fgetc_ref"),IRVfun(firfun1(fgetc_ref)))
val () =
the_d2cstdef_insert
(d2cst("XINTERP_fputc_ref"),IRVfun(firfun2(fputc_ref)))
//
val () =
the_d2cstdef_insert
(d2cst("XINTERP_nint_rand_limit"),IRVfun(firfun1(nint_rand_limit)))
//
} (*then*) // end of [if] 
//
end (* end of [xinterp_initize_gint] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xint_xinterp_envmap.dats] *)
