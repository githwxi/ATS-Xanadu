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
"share\
/atspre_staload.hats"
#include
"share\
/atspre_staload_libats_ML.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)

overload =
with $D2E.eq_d2cst_d2cst
overload =
with $D2E.eq_d2var_d2var

(* ****** ****** *)
//
#staload "./../SATS/interp0.sats"
//
implement
fprint_val<ir0val> = fprint_ir0val
//
(* ****** ****** *)
//
extern
fun
the_d2cstdef_search
(k0: d2cst): Option_vt(ir0val)
extern
fun
the_d2cstdef_insert
(d2c: d2cst, def: ir0val): void
//
extern
fun
the_d2vardef_search
(k0: d2var): Option_vt(ir0val)
extern
fun
the_d2vardef_insert
(d2v: d2var, def: ir0val): void
//
(* ****** ****** *)

local
//
absimpl
ir0env_tbox =
List0(@(d2var, ir0val))
//
datavtype
intpenv =
| INTPENV of
  (int(*level*), intplst)
//
and
intplst =
| intplst_nil of ()
| intplst_fun of ()
//
| intplst_let1 of intplst
| intplst_loc1 of intplst
| intplst_loc2 of intplst
//
| intplst_cons of
  (d2var, ir0val, intplst)
//
absimpl
intpenv_vtbox = intpenv
//
in(*in-of-local*)

implement
ir0env_make_nil
((*void*)) = list_nil()
implement
intpenv_make_nil
((*void*)) =
INTPENV(0, intplst_nil())

(* ****** ****** *)

fun
intplst_make_fun
(kxs: ir0env): intplst =
(
auxlst
(kxs, intplst_fun())
) where
{
//
fun
auxlst
( kxs: ir0env
, env: intplst): intplst =
(
case+ kxs of
| list_nil() => env
| list_cons(kx0, kxs) =>
  (
  auxlst(kxs, env)
  ) where
  {
  val env =
  intplst_cons(kx0.0, kx0.1, env)
  }
) (* end of [auxlst] *)
//
} (* end of [intplst_make_env] *)

fun
intplst_take_env
(env: !intplst): ir0env =
(
list_vt2t
(
auxenv(env, list_vt_nil())
)
) where
{
vtypedef
res =
List0_vt(@(d2var, ir0val))
fun
auxenv
(env: !intplst, res: res): res =
(
case+ env of
//
| intplst_nil() => res
| intplst_fun() => res
//
| intplst_let1
    (env) => auxenv(env, res)
| intplst_loc1
    (env) => auxenv(env, res)
| intplst_loc2
    (env) => auxenv(env, res)
//
| intplst_cons(k0, x0, env) =>
  auxenv(env, list_vt_cons((k0, x0), res))
)
} (* end of [intplst_take_env] *)

(* ****** ****** *)

implement
intpenv_make_fun(kxs) =
INTPENV
(
1(*level*)
,
intplst_make_fun(kxs)
)
//
implement
intpenv_take_env(env) =
(
  intplst_take_env(xs)
) where
{
  val+INTPENV(l0, xs) = env
}
//
(* ****** ****** *)

implement
intpenv_bind_fix
  (env0, irv0) =
let
val-
IR0Vfix
(fenv, d2v0, _, _) = irv0
in
(
  fold@(env0)
) where
{
val+
@INTPENV(l0, xs) = env0
val () =
(
  xs :=
  intplst_cons(d2v0, irv0, xs)
)
} (* end of [where] *)
end // end of [intpenv_bind_fix]

implement
intpenv_bind_fixs
  (env0, irv0) =
(
  auxirdfs(env0, irdfs)
) where
{
//
val-
IR0Vfixs
( fenv
, d2v0, iras
, body, irdfs) = irv0
//
fun
auxirdfs
( env0
: !intpenv
, ires
: ir0explst): void =
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
  @INTPENV(l0, xs) = env0
  val () =
  (
    xs :=
    intplst_cons(d2v1, irv1, xs)
  )
  } where
  {
  val-
  IR0Efix
  ( knd1, d2v1
  , iras, body) = ire1.node()
  val irv1 =
  IR0Vfixs
  (fenv, d2v1, iras, body, irdfs)
  }
) (* end of [auxirdfs] *)
//
} (* end of [intpenv_bind_fixs] *)

(* ****** ****** *)

implement
intpenv_pop0_let1
  (env0) =
(
  fold@(env0)
) where
{
//
fun
auxlst
( xs
: intplst): intplst =
(
case- xs of
| ~intplst_let1
   (xs) => xs
| ~intplst_cons
   (_, _, xs) => auxlst(xs)
)
//
val-
@INTPENV(l0, xs) = env0
val () = (xs := auxlst(xs))
} // end of [intpenv_push_let1] *)

implement
intpenv_push_let1
  (env0) =
(
  fold@(env0)
) where
{
val-
@INTPENV(l0, xs) = env0
val () =
(xs := intplst_let1(xs))
} // end of [intpenv_push_let1] *)

(* ****** ****** *)

implement
intpenv_free_nil
  (env0) =
{
val-~intplst_nil() = xs
} where
{
val+~INTPENV(l0, xs) = env0
} (* intpenv_free_nil *)

(* ****** ****** *)
//
implement
intpenv_free_fun
  (env) =
( auxlst(xs) ) where
{
//
fun
auxlst
(xs: intplst): void =
(
case- xs of
|
~intplst_fun() => ()
|
~intplst_cons(_, _, xs) => auxlst(xs)
)
//
val+~INTPENV(l0, xs) = env
//
} (* end of [intpenv_free_fun] *)
//
(* ****** ****** *)

implement
interp0_search_d2cst
  (d2c0) =
(
the_d2cstdef_search(d2c0)
)

(* ****** ****** *)

implement
interp0_search_d2var
  (env0, d2v0) =
  (auxlst(xs)) where
{
//
  vtypedef
  res = Option_vt(ir0val)
  val+INTPENV(l0, xs) = env0
//
  fun
  auxlst
  (xs: !intplst): res =
  (
  case+ xs of
  | intplst_nil() =>
    the_d2vardef_search(d2v0)
  | intplst_fun() =>
    the_d2vardef_search(d2v0)
  | intplst_let1(xs) => auxlst(xs)
  | intplst_loc1(xs) => auxlst(xs)
  | intplst_loc2(xs) => auxlst(xs)
  | intplst_cons
    (d2v1, irv1, xs) =>
    if (d2v0 = d2v1) then Some_vt(irv1) else auxlst(xs)
  ) (* end of [auxlst] *)
//
} (* end of [interp0_search_d2var] *)

(* ****** ****** *)

implement
interp0_insert_d2cst
  (d2c0, irv0) =
(
the_d2cstdef_insert(d2c0, irv0)
)

(* ****** ****** *)

implement
interp0_insert_d2var
  (env0, d2v0, irv0) =
let
//
val+
@INTPENV(l0, xs) = env0
//
in
//
case xs of
|
intplst_nil() =>
(
fold@(env0);
the_d2vardef_insert(d2v0, irv0)
)
|
_(*non-intplst_nil*) =>
(
fold@(env0)
) where
{
  val () =
  (
  xs :=
  intplst_cons(d2v0, irv0, xs)
  )
} (* non-intplst_nil *)
//
end // end of [interp0_insert_d2var]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

fun
gint_lt_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vbtf(x < y) end
fun
gint_gt_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vbtf(x > y) end

fun
gint_lte_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vbtf(x <= y) end
fun
gint_gte_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vbtf(x >= y) end

fun
gint_eq_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vbtf(x = y) end
fun
gint_neq_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vbtf(x != y) end

(* ****** ****** *)

fun
gint_add_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vint(x + y) end

fun
gint_sub_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vint(x - y) end

(* ****** ****** *)

fun
gint_mul_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vint(x * y) end

fun
gint_div_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vint(x / y) end

fun
gint_mod_sint_sint
( x: ir0val
, y: ir0val): ir0val =
let
val-IR0Vint(x) = x
val-IR0Vint(y) = y in IR0Vint(x % y) end

(* ****** ****** *)

local
//
typedef key = d2cst
typedef itm = ir0val
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
interp0_fprint_d2cstmap
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
typedef itm = ir0val
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
interp0_fprint_d2varmap
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

in

implement
interp0_initize() =
let
val n0 = the_flag[]
val () = the_flag[] := n0+1
in
if
(n0 = 0)
then
{
val () = interp0_initize_gint()
}
end // end of [interp0_initize]

end // end of [local]

(* ****** ****** *)

local

fun
firfun1
(
f1:
(ir0val) -> ir0val
)
: ir0valist -<cloref1> ir0val =
lam(vs) =>
let
val-list_cons(v1, vs) = vs in f1(v1)
end

fun
firfun2
(
f2:
( ir0val
, ir0val) -> ir0val
)
: ir0valist -<cloref1> ir0val =
lam(vs) =>
let
val-list_cons(v1, vs) = vs
val-list_cons(v2, vs) = vs in f2(v1, v2)
end

fun
d2cst
(nam: string): d2cst =
(
let
//
val () =
println!
("d2cst: nam = ", nam)
//
val
sym = $SYM.symbol_make(nam)
val
opt = the_dexpenv_find(sym)
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

in(*in-of-local*)

(* ****** ****** *)

local

val
the_flag = ref<int>(0)

in

implement
interp0_initize_gint() =
let
val n0 = the_flag[]
val () = the_flag[] := n0+1
in
if
(n0 = 0)
then
{
//
val () =
the_d2cstdef_insert
(
d2cst("gint_lt_sint_sint")
,
IR0Vfun(firfun2(gint_lt_sint_sint)))
val () =
the_d2cstdef_insert
(
d2cst("gint_gt_sint_sint")
,
IR0Vfun(firfun2(gint_gt_sint_sint)))
//
val () =
the_d2cstdef_insert
(
d2cst("gint_eq_sint_sint")
,
IR0Vfun(firfun2(gint_eq_sint_sint)))
//
val () =
the_d2cstdef_insert
(
d2cst("gint_lte_sint_sint")
,
IR0Vfun(firfun2(gint_lte_sint_sint)))
val () =
the_d2cstdef_insert
(
d2cst("gint_gte_sint_sint")
,
IR0Vfun(firfun2(gint_gte_sint_sint)))
//
val () =
the_d2cstdef_insert
(
d2cst("gint_neq_sint_sint")
,
IR0Vfun(firfun2(gint_neq_sint_sint)))
//
(* ****** ****** *)
//
val () =
the_d2cstdef_insert
(
d2cst("gint_add_sint_sint")
,
IR0Vfun(firfun2(gint_add_sint_sint)))
val () =
the_d2cstdef_insert
(
d2cst("gint_sub_sint_sint")
,
IR0Vfun(firfun2(gint_sub_sint_sint)))
val () =
the_d2cstdef_insert
(
d2cst("gint_mul_sint_sint")
,
IR0Vfun(firfun2(gint_mul_sint_sint)))
val () =
the_d2cstdef_insert
(
d2cst("gint_div_sint_sint")
,
IR0Vfun(firfun2(gint_div_sint_sint)))
val () =
the_d2cstdef_insert
(
d2cst("gint_mod_sint_sint")
,
IR0Vfun(firfun2(gint_mod_sint_sint)))
//
} (* end of [then] *) 
end (* end of [interp0_initize_gint] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xint_interp0_envmap.dats] *)
