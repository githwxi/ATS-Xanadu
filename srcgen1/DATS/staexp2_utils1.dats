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
STM = "./../SATS/xstamp0.sats"
#staload
SYM = "./../SATS/xsymbol.sats"
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
#staload "./../SATS/xbasics.sats"
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
) (* end of [lte_t2bas_t2bas] *)
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
  if (arg2 <= arg1) then (res1 <= res2) else false
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
, flag: &int >> _): s2exp =
let
  val fini = flag
in
//
case+
s2e0.node() of
//
| S2Eint _ => s2e0
| S2Ebtf _ => s2e0
| S2Echr _ => s2e0
| S2Estr _ => s2e0
//
//
(*
HX:
please note that
[sexpdef] cannot appear under
*)
|
S2Ecst _ => s2e0 // a static lam
//
|
S2Evar(s2v0) =>
if
not
(s2v0 = s2v1)
then s2e0 else
(flag := fini+1; s2exp_var(s2v2))
//
|
S2Eapp(s2e1, s2es) =>
let
  val
  s2e1 = auxsexp(s2e1, flag)
  val
  s2es = auxs2es(s2es, flag)
in
if
fini = flag
then s2e0 else
s2exp_make_node(s2t0, S2Eapp(s2e1, s2es))
end
//
(*
|
S2Elist(s2es) =>
let
val
s2es = auxs2es(s2es, flag)
in
if
fini = flag
then s2e0 else
s2exp_make_node(s2t0, S2Elist(s2es))
end
*)
//
|
S2Elam(s2vs, body) =>
if
s2varlst_ismem
( s2vs, s2v1 )
then s2e0 else let
val
body = auxsexp(body, flag)
in
if
fini = flag
then s2e0 else
s2exp_make_node(s2t0, S2Elam(s2vs, body))
end // end of [else]
//
|
S2Earg(knd, s2e1) =>
let
val
s2e1 =
auxsexp(s2e1, flag)
in
  if
  fini = flag
  then s2e0 else
  s2exp_make_node(s2t0, S2Earg(knd, s2e1))
end
|
S2Eatx(s2e1, s2e2) =>
let
val
s2e1 =
auxsexp(s2e1, flag)
val
s2e2 =
auxsexp(s2e2, flag)
in
  if
  fini = flag
  then s2e0 else
  s2exp_make_node(s2t0, S2Eatx(s2e1, s2e2))
end
|
S2Efun
(fc2, npf, s2es, s2e1) =>
let
val
s2es =
auxs2es(s2es, flag)
val
s2e1 =
auxsexp(s2e1, flag)
in
  if
  fini = flag
  then s2e0 else
  s2exp_make_node
  ( s2t0, S2Efun( fc2, npf, s2es, s2e1 ) )
end
//
|
S2Eexi(s2vs, s2ps, body) =>
if
s2varlst_ismem
( s2vs, s2v1 )
then s2e0 else let
val
body = auxsexp(body, flag)
val
s2ps = auxs2es(s2ps, flag)
in
if
fini = flag
then s2e0 else
s2exp_make_node(s2t0, S2Eexi(s2vs, s2ps, body))
end // end of [else]
|
S2Euni(s2vs, s2ps, body) =>
if
s2varlst_ismem
( s2vs, s2v1 )
then s2e0 else let
val
body = auxsexp(body, flag)
val
s2ps = auxs2es(s2ps, flag)
in
if
fini = flag
then s2e0 else
s2exp_make_node(s2t0, S2Euni(s2vs, s2ps, body))
end // end of [else]
//
|
S2Et2ype _ => s2e0
//
|
S2Etyext(name, s2es) =>
let
val
s2es = auxs2es(s2es, flag)
in
  if
  fini = flag
  then s2e0 else
  s2exp_make_node(s2t0, S2Etyext(name, s2es))
end
//
|
S2Etyrec
(knd0, npf1, ls2es) =>
let
val
ls2es = auxls2es(ls2es, flag)
in
if
fini = flag
then s2e0 else
s2exp_make_node(s2t0, S2Etyrec(knd0, npf1, ls2es))
end
//
|
_(* rest-of-s2exp *) =>
(
let
val () =
println!
("s2exp_revar: s2e0 = ", s2e0)
in
  let
    val ((*void*)) = assertloc(false) in s2e0
  end
end
)
//
end // end of [let]
//
and
auxs2es
( s2es: s2explst
, flag: &int >> _): s2explst =
(
case+ s2es of
|
list_nil() => list_nil()
|
list_cons(s2e1, ses2) =>
let
  val fini = flag
  val s2e1 = auxsexp(s2e1, flag)
  val ses2 = auxs2es(ses2, flag)
in
  if
  fini = flag
  then s2es else list_cons(s2e1, ses2)
end // end of [let]
)
//
and
auxls2es
( ls2es
: labs2explst
, flag: &int >> _): labs2explst =
(
case+ ls2es of
|
list_nil() => list_nil()
|
list_cons(ls2e1, lses2) =>
let
  val fini = flag
  val+
  SLABELED(l1, x1) = ls2e1
  val x1 = auxsexp(x1, flag)
  val lses2 = auxls2es(lses2, flag)
in
if
fini = flag
then ls2es else
let
val
ls2e1 =
SLABELED(l1, x1) in list_cons(ls2e1, lses2)
end
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
s2explst_revar_vt(s2es, s2v1, s2v2)
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
list_map$fopr<s2exp><s2exp>(s2e0) = s2exp_revar(s2e0, s2v1, s2v2)
} (* end of [s2explst_revar_vt] *)
//
(* ****** ****** *)
//
implement
s2exp_revars
(s2e0, svs1, svs2) =
(
case+ svs1 of
|
list_nil
((*void*)) => s2e0
|
list_cons
(s2v1, svs1) =>
let
val-
list_cons
(s2v2, svs2) = svs2
val
s2e0 =
s2exp_revars
(s2e0, svs1, svs2)
in
s2exp_revar(s2e0, s2v1, s2v2)
end
) (* end of [s2exp_revars] *)
//
(* ****** ****** *)
//
implement
s2explst_revars
(s2es, svs1, svs2) =
list_vt2t
(
s2explst_revars_vt(s2es, svs1, svs2)
)
//
implement
s2explst_revars_vt
(s2es, svs1, svs2) =
(
list_map<s2exp><s2exp>(s2es)
) where
{
implement
list_map$fopr<s2exp><s2exp>(s2e0) = s2exp_revars(s2e0, svs1, svs2)
} (* end of [s2explst_revars_vt] *)
//
(* ****** ****** *)

(* end of [xats_staexp2_util1.dats] *)
