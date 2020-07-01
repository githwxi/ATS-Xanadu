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
// Start Time: December, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload
STM = "./../SATS/stamp0.sats"
#staload
SYM = "./../SATS/symbol.sats"
//
macdef
VIEW = $SYM.VIEW_symbol
macdef
VTBX = $SYM.VTBX_symbol
macdef
VWTP = $SYM.VWTP_symbol
//
overload
= with $STM.eq_stamp_stamp
overload
= with $SYM.eq_symbol_symbol
//
(* ****** ****** *)
//
#staload "./../SATS/basics.sats"
//
#staload "./../SATS/staexp2.sats"
//
(* ****** ****** *)

implement
sort2_polpos
  (s2t) =
(
case+ s2t of
| S2Tbas(s2tb) =>
  (
  case+ s2tb of
  | T2BASimp(knd, sym) =>
    (
    S2Tbas(T2BASimp(knd, sym))
    ) where
    {
      val knd = sortpolpos(knd)
    }
  | _ (* non-T2BASimp *) => s2t
  )
| _(* non-S2Tbas *) => s2t
)

implement
sort2_polneg
  (s2t) =
(
case+ s2t of
| S2Tbas(s2tb) =>
  (
  case+ s2tb of
  | T2BASimp(knd, sym) =>
    (
    S2Tbas(T2BASimp(knd, sym))
    ) where
    {
      val knd = sortpolneg(knd)
    }
  | _ (* non-T2BASimp *) => s2t
  )
| _(* non-S2Tbas *) => s2t
)

(* ****** ****** *)
//
implement
s2var_is_nil
  (s2v) = let
  val sym = s2v.sym()
in
  $SYM.symbol_is_nil(sym)
end // s2var_is_nil
//
(* ****** ****** *)
//
implement
eq_s2cst_s2cst
(x1, x2) =
(x1.stamp() = x2.stamp())
//
(* ****** ****** *)
//
implement
eq_s2var_s2var
(x1, x2) =
(x1.stamp() = x2.stamp())
//
(* ****** ****** *)
//
implement
eq_t2dat_t2dat
(x1, x2) =
(x1.stamp() = x2.stamp())
//
(* ****** ****** *)

implement
eq_t2bas_t2bas
(x1, x2) =
(
case+
(x1, x2) of
| ( T2BASpre(s1)
  , T2BASpre(s2)) => (s1 = s2)
| ( T2BASdat(t1)
  , T2BASdat(t2)) => (t1 = t2)
| ( T2BASimp(_, s1)
  , T2BASimp(_, s2)) => (s1 = s2)
//
| (_(*rest*), _(*rest*)) => false
//
) (* end of [eq_t2bas_t2bas] *)
//
(* ****** ****** *)

implement
lte_t2bas_t2bas
(x1, x2) =
(
case+
(x1, x2) of
| ( T2BASpre(s1)
  , T2BASpre(s2)) => (s1 = s2)
| ( T2BASdat(t1)
  , T2BASdat(t2)) => (t1 = t2)
| ( T2BASimp(k1, s1)
  , T2BASimp(k2, s2)) => subsort(k1, k2)
//
| (_(*rest*), _(*rest*)) => false
//
) (* end of [eq_t2bas_t2bas] *)
//
(* ****** ****** *)

implement
lte_sort2_sort2
  (x1, x2) =
(
case+ x1 of
//
|
S2Tid0(id1) =>
(
case+ x2 of
| S2Tid0(id2) => id1 = id2 | _ => false
)
//
|
S2Tint(int1) =>
(
case+ x2 of
| S2Tint(int2) => int1 = int2 | _ => false
)
//
|
S2Tbas(stb1) =>
(
case+ x2 of
| S2Tbas(stb2) => stb1 <= stb2 | _ => false
)
//
|
S2Ttup(sts1) =>
(
case+ x2 of
| S2Ttup(sts2) => sts1 <= sts2 | _ => false
)
//
|
S2Tfun(arg1, res1) =>
(
case+ x2 of
| S2Tfun(arg2, res2) =>
  if (arg1 <= arg2) then (res1 <= res2) else false
| _ (* non-S2Tfun *) => false
)
//
|
S2Tapp(fun1, arg1) =>
(
case+ x2 of
| S2Tapp(fun2, arg2) =>
  if (fun1 <= fun2) then (arg1 <= arg2) else false
| _ (* non-S2Tfun *) => false
)
//
| _ (* rest-of-sort2 *) => false
(*
| S2Ttup() => false | S2Tfun() => false
| S2Tnone(s1t1) => false | S2Tnone((*void*)) => false
*)
//
) (* end of [lte_sort2_sort2] *)

(* ****** ****** *)

implement
lte_sort2lst_sort2lst
  (xs1, xs2) =
(
  auxlst(xs1, xs2)
) where
{
fun
auxlst
(xs1: sort2lst, xs2: sort2lst): bool =
(
case+ xs1 of
| list_nil() =>
  (case+ xs2 of
   | list_nil() => true | list_cons _ => false
  )
| list_cons(x1, xs1) =>
  (case+ xs2 of
  | list_nil() => false
  | list_cons(x2, xs2) => (x1 <= x2) && (xs1 <= xs2)
  )
)
} (* end of [lte_sort2lst_sort2lst] *)

(* ****** ****** *)

implement
sort2lst_get_at
  (s2ts, n) =
(
case+ s2ts of
//
| list_nil() => S2Tnone0()
//
| list_cons(s2t0, s2ts) =>
  if n = 0
  then s2t0
  else sort2lst_get_at(s2ts, n-1)
) (* end of [sort2lst_get_at] *)

(* ****** ****** *)

implement
sort2_isimp
  (s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
  (
  case+ s2tb of
  | T2BASimp(knd, _) => true
  | _(*non-T2BASimp*) => false
  )
| _(*non-S2Tbas*) => false
)
implement
sort2_islin
  (s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
  (
  case+ s2tb of
  | T2BASimp
    (knd, _) =>
    sortlin(knd) > 0
  | _(*non-T2BASimp*) => false
  )
| _(*non-S2Tbas*) => false
)

(* ****** ****** *)

implement
sort2_topize
  (s2t0) =
(
case+ s2t0 of
| S2Tbas(s2tb) =>
  (
  case+ s2tb of
  | T2BASimp
    (knd, sym) =>
    (
    if
    lin = 0
    then s2t0 else
    (
    ifcase
    | sym=VIEW =>
      the_sort2_prop
    | sym=VTBX =>
      the_sort2_tbox
    | sym=VWTP =>
      the_sort2_type
    | _ (* else *) => s2t0
    )
    ) where
    {
      val lin = sortlin(knd)
    }
  | _(* else *) => s2t0
  )
| _(*non-S2Tbas*) => s2t0
)  

(* ****** ****** *)
//
implement
s2exp_isimp
  (s2e0) =
  sort2_isimp(s2e0.sort())
implement
s2exp_islin
  (s2e0) =
  sort2_islin(s2e0.sort())
//
implement
s2explst_islin
  (s2es) =
(
list_exists<s2exp>(s2es)
) where
{
implement
list_exists$pred<s2exp>
  (s2e) =
  $effmask_all(s2exp_islin(s2e))
} (* s2explst_islin *)
//
implement
labs2explst_islin
  (ls2es) =
(
list_exists<labs2exp>(ls2es)
) where
{
implement
list_exists$pred<labs2exp>
  (ls2e) =
let
  val+SLABELED(l, s2e) = ls2e
in
  $effmask_all(s2exp_islin(s2e))
end // end of [let]
} (* labs2explst_islin *)
//
(* ****** ****** *)

implement
s2varlst_ismem
  (s2vs, s2v0) =
(
list_exists<s2var>(s2vs)
) where
{
implement
list_exists$pred<s2var>
  (s2v) = $effmask_all(s2v0 = s2v)
} (* end of [s2varlst_ismem] *)

(* ****** ****** *)

implement
s2exp_revar
( s2e0
, s2v1, s2v2) =
let
//
val
s2t0 = s2e0.sort()
//
fun
auxsexp
( s2e0: s2exp
, flag_: &int >> _): s2exp =
let
  val flag = flag_
in
//
case+
s2e0.node() of
//
(*
| S2Eint _ => s2e0
| S2Echr _ => s2e0
| S2Eflt _ => s2e0
| S2Estr _ => s2e0
*)
//
(*
//
// HX: please note that
// [sexpdef] cannot appear under
| S2Ecst _ => s2e0 // a static lam
*)
//
| S2Evar(s2v0) =>
  if
  (s2v0 = s2v1)
  then
  (flag_ := flag+1; s2exp_var(s2v2))
  else s2e0 // end-of-else
//
| S2Eapp(s2e1, s2es2) =>
  let
    val
    s2e1 = auxsexp(s2e1, flag_)
    val
    s2es2 = auxsexplst(s2es2, flag_)
  in
    if
    flag = flag_ then s2e0
    else
    s2exp_make_node
    (s2t0, S2Eapp(s2e1, s2es2))
  end
//
(*
| S2Elist(s2es) =>
  let
    val
    s2es = auxsexplst(s2es, flag_)
  in
    if
    flag = flag_ then s2e0
    else
    s2exp_make_node(s2t0, S2Elist(s2es))
  end
*)
//
| S2Elam(s2vs, body) =>
  if
  s2varlst_ismem(s2vs, s2v1)
  then s2e0 else let
    val body = auxsexp(body, flag_)
  in
    if
    flag = flag_ then s2e0
    else
    s2exp_make_node(s2t0, S2Elam(s2vs, body))
  end // end of [else]
//
| S2Eexi(s2vs, s2ps, body) =>
  if
  s2varlst_ismem(s2vs, s2v1)
  then s2e0 else let
    val body = auxsexp(body, flag_)
    val s2ps = auxsexplst(s2ps, flag_)
  in
    if
    flag = flag_ then s2e0
    else
    s2exp_make_node(s2t0, S2Eexi(s2vs, s2ps, body))
  end // end of [else]
| S2Euni(s2vs, s2ps, body) =>
  if
  s2varlst_ismem(s2vs, s2v1)
  then s2e0 else let
    val body = auxsexp(body, flag_)
    val s2ps = auxsexplst(s2ps, flag_)
  in
    if
    flag = flag_ then s2e0
    else
    s2exp_make_node(s2t0, S2Euni(s2vs, s2ps, body))
  end // end of [else]
//
| _(* rest-of-s2exp *) => s2e0
//
end // end of [let]
//
and
auxsexplst
( s2es: s2explst
, flag_: &int >> _): s2explst =
(
case+ s2es of
| list_nil() =>
  list_nil()
| list_cons(s2e1, s2es2) =>
  let
    val flag = flag_
    val s2e1 = auxsexp(s2e1, flag_)
    val s2es2 = auxsexplst(s2es2, flag_)
  in
    if
    flag = flag_
    then s2es else list_cons(s2e1, s2es2)
  end // end of [let]
)
//
in
//
let
  var flag: int = 0 in auxsexp(s2e0, flag)
end
//
end // end of [s2exp_revar]

(* ****** ****** *)
//
implement
s2explst_revar
(s2es, s2v1, s2v2) =
list_vt2t
(
s2explst_revar_vt
(s2es, s2v1, s2v2)
)
//
implement
s2explst_revar_vt
(s2es, s2v1, s2v2) =
(
list_map<s2exp><s2exp>(s2es)
) where
{
implement
list_map$fopr<s2exp><s2exp>
  (s2e0) =
(
  s2exp_revar(s2e0, s2v1, s2v2)
)
} (* end of [s2explst_revar_vt] *)
//
(* ****** ****** *)
//
// HX-2020-05-10:
// It is yet to be implemented!!!
//
implement s2exp_whnfize(s2e0) = s2e0
//
(* ****** ****** *)

(* end of [xats_staexp2_util1.dats] *)
