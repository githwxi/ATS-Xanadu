(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: August, 2019
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
LAB = "./../SATS/xlabel0.sats"
#staload
STM = "./../SATS/xstamp0.sats"
#staload
SYM = "./../SATS/xsymbol.sats"
//
overload
= with $LAB.eq_label_label
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
#staload "./../SATS/statyp2.sats"
//
(* ****** ****** *)
//
implement
fprint_val<s2var> = fprint_s2var
implement
fprint_val<s2cst> = fprint_s2cst
implement
fprint_val<s2exp> = fprint_s2exp
//
implement
fprint_val<t2ype> = fprint_t2ype
//
(* ****** ****** *)

implement
s2varlst_epred
  (s2vs) =
(
  auxs2vs(s2vs) ) where
{
fun
auxs2vs
( s2vs
: s2varlst
)
: s2varlst =
(
case+ s2vs of
| list_nil() =>
  list_nil()
| list_cons
  (s2v0, s2vs) =>
  (
  if
  ~impred
  then auxs2vs(s2vs)
  else
  list_cons(s2v0, auxs2vs(s2vs))
  ) where
  {
    val s2t0 = s2v0.sort()
    val impred = sort2_is_impred(s2t0)
  }
) (* end of [auxs2vs] *)
} (*where*) // end of [s2varlst_epred]
//
(* ****** ****** *)

implement
s2exp_erase(s2e0) =
let
//
val
s2t0 = s2e0.sort()
val
impred =
sort2_is_impred(s2t0)
//
(*
val () =
println!
("s2exp_erase: s2e0 = ", s2e0)
*)
//
(*
fun
auxs2vs
( s2vs
: s2varlst): s2varlst = s2vs
*)
//
// HX-2020-06-30:
// This version can interfere
// annotated static arguments
// Here is a possible solution:
// 1: Impredicatives precede Predicatives
// 2: Impredicatives and Predicatives do not mix
//
fun
auxmain
(s2e0: s2exp): t2ype =
(
case+
s2e0.node() of
//
| S2Ecst(s2c) => t2ype_cst(s2c)
| S2Evar(s2v) => t2ype_var(s2v)
//
| S2Eexi
  (s2vs, s2ps, body) =>
  let
    val
    s2vs = s2varlst_epred(s2vs)
  in
    t2ype_exi(s2vs, s2exp_erase(body))
  end
| S2Euni
  (s2vs, s2ps, body) =>
  let
    val
    s2vs = s2varlst_epred(s2vs)
  in
    t2ype_uni(s2vs, s2exp_erase(body))
  end
//
| S2Efun
  (fc2, npf, s2es, s2e1) =>
  let
    val fc2 = t2ype_fc2(fc2)
    val t2p1 = s2exp_erase(s2e1)
    val t2ps = s2explst_erase(s2es)
  in
    t2ype_make_node
    (s2t0, T2Pfun(fc2, npf, t2ps, t2p1))
  end
//
| S2Etop(s2e1) =>
  s2exp_erase_sort(s2e1, s2t0)
| S2Etpz(s2e1) =>
  s2exp_erase_sort(s2e1, s2t0)
//
| S2Earg(knd, s2e1) =>
  (
    if
    (knd >= 0)
    then
    s2exp_erase_sort(s2e1, s2t0)
    else
    let
      val t2p1 = s2exp_erase(s2e1)
    in//let
      t2ype_make_node(s2t0, T2Plft(t2p1))
    end
  )
//
| S2Eatx(s2e1, s2e2) =>
  s2exp_erase_sort(s2e1, s2t0)
//
| S2Eapp(s2e1, s2es) =>
  let
    val t2p1 = s2exp_erase(s2e1)
    val t2ps = s2explst_erase(s2es)
  in
    t2ype_make_node(s2t0, T2Papp(t2p1, t2ps))
  end
//
| S2Elam(s2vs, s2e1) =>
  let
    val t2p1 = s2exp_erase(s2e1)
  in
    t2ype_make_node(s2t0, T2Plam(s2vs, t2p1))
  end
//
|
S2Etyext(tnm1, s2es) =>
let
  val t2ps = s2explst_erase(s2es)
in
  t2ype_make_node(s2t0, T2Ptyext(tnm1, t2ps))
end
//
|
S2Etyrec(knd, npf, lses) =>
let
val ltps = labs2explst_erase(lses)
in
t2ype_make_node(s2t0, T2Ptyrec(knd, npf, ltps))
end
//
| _(*rest-of-s2exp*) => t2ype_none1(s2e0)
//
)
//
in
if
impred
then auxmain(s2e0) else t2ype_none0(s2e0.sort())
end // end of [s2exp_erase(s2e0)]

(* ****** ****** *)
//
implement
s2exp_erase_sort
  (s2e0, s2t0) = s2exp_erase(s2e0)
//
(*
//
HX-2022-10-18:
This one does not work!!!
//
implement
s2exp_erase_sort
  (s2e0, s2t0) = let
//
val t2p0 = s2exp_erase(s2e0)
//
in//let
t2ype_set_sort(t2p0, s2t0); t2p0
end (*let*) // end of [s2exp_erase_sort]
*)
//
(* ****** ****** *)
//
implement
t2ype_gnvar
(t2p0, s2v0) =
(
t2ype_revar
(t2p0, s2v0, s2v1)
) where
{
  val
  s2v1 = s2var_copy(s2v0)
}
//
implement
t2ype_gnvars
(t2p0, svs1) = let
//
val svs2 =
(
list_map<s2var><s2var>(svs1)
) where
{
implement
list_map$fopr<s2var><s2var>(x) =
  s2var_make_idst(x.sym(), x.sort())
}
val t2p0 =
(
t2ype_revars(t2p0, svs1, svs2)
) where
{
  val svs2 = $UN.list_vt2t(svs2)
}
in
  let val () = list_vt_free(svs2) in t2p0 end
end
//
(* ****** ****** *)
//
implement
t2ype_revar
(t2p0, s2v0, s2v1) =
(
t2ype_subst_svar
(t2p0, s2v0, tsub)
) where
{
  val tsub = t2ype_var(s2v1)
} (* end of [t2ype_revar] *)
//
implement
t2ype_revars
(t2p0, svs1, svs2) = let
//
val tsub =
(
list_map<s2var><t2ype>(svs2)
) where
{
implement
list_map$fopr<s2var><t2ype>(x) = t2ype_var(x)
}
//
val t2p0 =
let
val
tsub = $UN.list_vt2t(tsub)
in
t2ype_subst_svarlst(t2p0, svs1, tsub)
end // end of [val]
//
in
  let val () = list_vt_free(tsub) in t2p0 end
end // end of [t2ype_revars]
//
(* ****** ****** *)

implement
{}(*tmp*)
t2ype_subst(t2p0) =
(
let
  var flag: int = 0
in
  auxt2p0(t2p0, flag)
end
) where
{
//
fun
auxt2p0
( t2p0
: t2ype
, flag
: &int >> int
) : t2ype = let
//
val fini = flag
val s2t0 = t2p0.sort()
//
in
case+
t2p0.node() of
//
| T2Pbas _ => t2p0
//
|
T2Pcst(s2c1) =>
let
val t2p1 =
s2cst_get_type(s2c1)
in//let
//
case+
t2p1.node() of
| T2Pnone0() => t2p0
| _(*defined*) =>
  (
    auxt2p0(t2p1, flag)
  ) where
  {
  val () = (flag := flag + 1)
  }
//
end // end of [T2Pcst]
//
|
T2Pvar(s2v1) =>
t2ype_subst$var<>(t2p0, flag)
//
|
T2Pxtv(xtv1) =>
let
  val
  t2p1 = xtv1.type()
in
  case+
  t2p1.node() of
  | T2Pnone0() =>
    ( // unsolved
      t2p0 // HX: FIXME?
    )
  | _ (*solved*) =>
    (
      auxt2p0(t2p1, flag)
    ) where
    {
      val () = (flag := flag+1)
    }
end // end of [T2Pxtv]
//
| T2Plft(t2p1) =>
  (
    if
    flag=fini
    then t2p0
    else
    t2ype_make_node
    (s2t0, T2Plft(t2p1))
  ) where
  {
    val t2p1 = auxt2p0(t2p1, flag)
  }
//
|
T2Papp
(t2p1, t2ps) => let
val
t2p1 = auxt2p0(t2p1, flag)
val
t2ps = auxt2ps(t2ps, flag)
in
  if
  flag=fini
  then t2p0
  else
  t2ype_make_node(s2t0, T2Papp(t2p1, t2ps))
end // end of [T2Papp]
|
T2Plam(s2vs, t2p1) => let
val
  t2p1 = auxt2p0(t2p1, flag)
in
  if
  flag=fini
  then t2p0
  else
  t2ype_make_node(s2t0, T2Plam(s2vs, t2p1))
end // end of [T2Plam]
//
|
T2Pfun
(fc2, npf, t2ps, t2p1) =>
let
  val
  t2p1 = auxt2p0(t2p1, flag)
  val
  t2ps = auxt2ps(t2ps, flag)
in
  if
  flag=fini
  then t2p0
  else t2ype_make_node
       (s2t0, T2Pfun(fc2, npf, t2ps, t2p1))
end
//
|
T2Pexi(s2vs, t2p1) => let
  val
  t2p1 = auxt2p0(t2p1, flag)
in
  if
  flag=fini
  then t2p0
  else
  t2ype_make_node(s2t0, T2Pexi(s2vs, t2p1))
end
|
T2Puni(s2vs, t2p1) => let
  val
  t2p1 = auxt2p0(t2p1, flag)
in
  if
  flag=fini
  then t2p0
  else
  t2ype_make_node(s2t0, T2Puni(s2vs, t2p1))
end
//
|
T2Ptyext(name, t2ps) =>
let
  val
  t2ps = auxt2ps(t2ps, flag)
in
  if
  flag=fini
  then t2p0
  else
  t2ype_make_node(s2t0, T2Ptyext(name, t2ps))
end // end of [T2Ptyext]
//
|
T2Ptyrec(knd, npf, ltps) =>
let
  val
  ltps = auxltps(ltps, flag)
(*
  val
  s2t0 =
  (
  ( case+ knd of
    | TYRECflt0() => auxlst(ltps)
    | _(*non-TYRECflt0*) => s2t0): sort2
  ) where
  {
  fun
  auxlst
  ( ltps
  : labt2ypelst): sort2 =
  ( case+ ltps of
    | list_nil() =>
      the_sort2_type
    | list_cons(ltp1, ltps) =>
      let
      val+
      SLABELED(lab, t2p) = ltp1
      in
        if
        sort2_islin( t2p.sort() )
        then the_sort2_vwtp else auxlst(ltps)
      end
  ) (* end of [auxlst] *)
  } (* where *) // end of [val s2t0]
*)
in
  if
  flag=fini
  then t2p0
  else
  t2ype_make_node(s2t0, T2Ptyrec(knd, npf, ltps))
end // end of [T2Ptyrec]
//
| _ (* rest-of-t2ype *) => t2p0 // T2Pfc2,T2Pnone0/1
//
end // end of [auxt2p0]
//
and
auxt2ps
( t2ps
: t2ypelst
, flag
: &int >> int
) : t2ypelst =
(
case+ t2ps of
|
list_nil() =>
list_nil()
|
list_cons
(t2p1, t2ps1) =>
let
  val fini = flag
  val
  t2p1 = auxt2p0(t2p1, flag)
  val
  t2ps1 = auxt2ps(t2ps1, flag)
in
  if
  flag = fini
  then t2ps else list_cons(t2p1, t2ps1)
end
)
//
and
auxltps
( ltps
: labt2ypelst
, flag
: &int >> int
) : labt2ypelst =
(
case+ ltps of
|
list_nil() =>
list_nil()
|
list_cons
(lt2p1, ltps1) =>
let
//
val fini = flag
//
val+
SLABELED
(l1, t2p1) = lt2p1
val t2p1 = auxt2p0(t2p1, flag)
//
val lt2p1 =
(
if
flag = fini
then lt2p1 else SLABELED(l1,t2p1)
) : labt2ype // end of [val]
//
val ltps1 = auxltps( ltps1, flag )
//
in
if
flag = fini
then ltps else list_cons(lt2p1, ltps1)
end
)
//
} (*where*) // end of [t2ype_subst]

(* ****** ****** *)
//
implement
t2ype_subst_svar
(t2p0, s2v1, tsub) =
(
t2ype_subst<>(t2p0)
) where
{
//
implement
t2ype_subst$var<>
  (t2p0, flag) =
let
val-
T2Pvar
(s2v0) = t2p0.node()
in
  if
  s2v0=s2v1
  then t2p0
  else (flag := flag+1; tsub)
end // [t2ype_subst$var]
//
}(*where*)//end-of[t2ype_subst_svar]
//
(* ****** ****** *)
//
implement
t2ype_subst_svarlst
(t2p0, s2vs, tsub) =
(
t2ype_subst<>(t2p0)
) where
{
//
implement
t2ype_subst$var<>
  (t2p0, flag) = let
//
(*
val
s2t0 = t2p0.sort()
*)
//
val-
T2Pvar
(s2v0) = t2p0.node()
//
fun
auxlst
( s2vs
: s2varlst
, t2ps
: t2ypelst
, flag
: &int >> int): t2ype =
(
case+ s2vs of
|
list_nil() => t2p0
|
list_cons(s2v1, s2vs) =>
let
  val-
  list_cons
  (t2p1, t2ps) = t2ps
in
  if
  s2v0 = s2v1
  then (flag := flag+1; t2p1)
  else auxlst(s2vs, t2ps, flag)
end
)
//
in
  auxlst(s2vs, tsub, flag)
end
//
} (* end of [t2ype_subst_svarlst] *)
//
(* ****** ****** *)
//
implement
t2ypelst_subst_svarlst
  (t2ps, s2vs, tsub) =
list_vt2t
(
list_map<t2ype><t2ype>(t2ps)
) where
{
//
implement
list_map$fopr<t2ype><t2ype>
  (t2p) =
  t2ype_subst_svarlst(t2p, s2vs, tsub)
//
} (* end of [t2ypelst_subst_svarlst] *)
//
(* ****** ****** *)

local

fun
auxt2p0
( t2p0
: t2ype
, flag
: &int >> int
) : t2ype = let
//
val fini = flag
val s2t0 = t2p0.sort()
//
in
//
case+
t2p0.node() of
//
|
T2Pbas _ => t2p0
//
|
T2Pcst(s2c) => let
  val
  t2p1 = s2c.type()
in
case+
t2p1.node() of
| T2Pnone0() => t2p0
| _ (*else*) =>
  (
    auxt2p0(t2p1, flag)
  ) where
  {
    val () = flag := fini + 1
  }
end
//
|
T2Pxtv(xtv) => let
  val
  t2p1 = xtv.type()
in
  case+ t2p1.node() of
  | T2Pnone0() => t2p0
  | _ (*else*) =>
    (
    let
    val
    t2p1 =
    auxt2p0(t2p1, flag)
    val () =
    xtv.type(t2p1) in t2p1 end
    ) where
    {
      val () = flag := fini + 1
    }
end
//
|
T2Plft(t2p1) =>
let
  val t2p1 = auxt2p0(t2p1, flag)
in
  if
  flag=fini
  then t2p0
  else t2ype_make_node(s2t0, T2Plft(t2p1))
end // end of [T2Plft]
//
|
T2Papp
  (t2p1, t2ps) => let
  val
  t2p1 = auxt2p0(t2p1, flag)
  val
  t2ps = auxt2ps(t2ps, flag)
in
  if
  flag=fini
  then t2p0
  else
  t2ype_make_node(s2t0, T2Papp(t2p1, t2ps))
end
|
T2Plam(s2vs, t2p1) => let
  val
  t2p1 = auxt2p0(t2p1, flag)
in
  if
  flag=fini
  then t2p0
  else
  t2ype_make_node(s2t0, T2Plam(s2vs, t2p1))
end
//
|
T2Pfun
(fc2, npf, t2ps, t2p1) =>
let
  val
  t2p1 = auxt2p0(t2p1, flag)
  val
  t2ps = auxt2ps(t2ps, flag)
in
  if
  flag=fini
  then t2p0
  else
  t2ype_make_node(s2t0, T2Pfun(fc2, npf, t2ps, t2p1))
end
//
|
T2Pexi(s2vs, t2p1) => let
//
// HX-2021-02-27:
// alpha-renaming is not done here;
// it should be performed before the
// call to the substituion function!!!
//
  val
  t2p1 = auxt2p0(t2p1, flag)
in
  if
  flag=fini
  then t2p0
  else
  t2ype_make_node(s2t0, T2Pexi(s2vs, t2p1))
end
|
T2Puni(s2vs, t2p1) => let
//
// HX-2021-02-27:
// alpha-renaming is not done here;
// it should be performed before the
// call to the substituion function!!!
//
  val
  t2p1 = auxt2p0(t2p1, flag)
in
  if
  flag=fini
  then t2p0
  else
  t2ype_make_node(s2t0, T2Puni(s2vs, t2p1))
end
//
|
T2Ptyext(name, t2ps) =>
let
  val
  t2ps = auxt2ps(t2ps, flag)
in
  if
  flag=fini
  then t2p0
  else
  t2ype_make_node(s2t0, T2Ptyext(name, t2ps))
end
//
|
T2Ptyrec(knd, npf, ltps) =>
let
  val
  ltps = auxltps(ltps, flag)
(*
  val
  s2t0 =
  (
  ( case+ knd of
    | TYRECflt0() => auxlst(ltps)
    | _(*non-TYRECflt0*) => s2t0): sort2
  ) where
  {
  fun
  auxlst
  ( ltps
  : labt2ypelst): sort2 =
  ( case+ ltps of
    | list_nil() =>
      the_sort2_type
    | list_cons(ltp1, ltps) =>
      let
      val+
      SLABELED(lab, t2p) = ltp1
      in
        if
        sort2_islin( t2p.sort() )
        then the_sort2_vwtp else auxlst(ltps)
      end
  ) (* end of [auxlst] *)
  } (* where *) // end of [val s2t0]
*)
in
if
flag=fini
then t2p0
else
t2ype_make_node(s2t0, T2Ptyrec(knd, npf, ltps))
end
//
| _ (* rest-of-t2ype *) => t2p0 // T2Pfc2,T2Pnone0/1
//
end // end of [auxt2p0]

and
auxt2ps
( t2ps
: t2ypelst
, flag
: &int >> int
) : t2ypelst =
(
case+ t2ps of
//
|
list_nil() =>
list_nil(*void*)
//
|
list_cons
(t2p1, t2ps1) => let
  val fini = flag
  val
  t2p1 = auxt2p0(t2p1, flag)
  val
  t2ps1 = auxt2ps(t2ps1, flag)
in
  if
  flag = fini
  then t2ps else list_cons(t2p1, t2ps1)
end
//
) (* end of [auxt2ps] *)

and
auxltps
( ltps
: labt2ypelst
, flag
: &int >> int
) : labt2ypelst =
(
case+ ltps of
|
list_nil() =>
list_nil(*void*)
|
list_cons
(lt2p1, ltps1) =>
let
//
val fini = flag
//
val+
SLABELED(l1,t2p1) = lt2p1
val
t2p1 = auxt2p0(t2p1, flag)
//
val lt2p1 =
(
if
flag = fini
then lt2p1 else SLABELED(l1,t2p1)
) : labt2ype // end of [val]
//
val ltps1 = auxltps( ltps1, flag )
//
in
if
flag = fini
then ltps else list_cons(lt2p1, ltps1)
end
) (* end of [auxltps] *)

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

implement
t2ype_evalrec(t2p0) =
let
  var flag: int = 0 in auxt2p0(t2p0, flag)
end (* t2ype_evalrec *) end // end of [local]

(* ****** ****** *)

implement
t2ype_sortrec(t2p0) =
(
case+
t2p0.node() of
|
T2Pxtv(xtv0) =>
let
val
t2p1 = xtv0.type()
in
case+
t2p1.node() of
//
|
T2Pnone0() => xtv0.sort()
|
_(*solved*) => t2ype_sortrec(t2p1)
//
end // end of [T2Pxtv]
|
T2Ptyrec
(knd, npf, ltps) =>
(
case+ knd of
|
TYRECflt0() =>
auxlst(ltps) where
{
fun
auxlst
( ltps
: labt2ypelst): sort2 =
(
case+ ltps of
|
list_nil
((*void*)) => the_sort2_type
|
list_cons
(ltp1, ltps) =>
let
//
val+
SLABELED(lab, t2p) = ltp1
//
val s2t = t2ype_sortrec(t2p)
in
if
sort2_islin(s2t)
then the_sort2_vwtp else auxlst(ltps)
end // end of [list_cons]
)
} (* end of [T2Ptyrec] *)
|
_(*non-TYRECflt0*) => t2p0.sort()
)
//
| _(*rest-of-t2ype*) => t2p0.sort()
//
) (*case*) // end of [t2ype_sortrec]

(* ****** ****** *)

implement
{}(*tmp*)
t2ype_whnfz
  (t2p0) = let
//
var flag: int = 0
//
(*
val () =
println!
("t2ype_whnfz: t2p0 = ", t2p0)
*)
//
in
//
let
val
t2p0 =
auxt2p0(t2p0, flag)
(*
val () =
println!
("t2ype_whnfz: t2p0(res) = ", t2p0)
*)
in t2p0 end // end of [let]
//
end where
{
(* ****** ****** *)
//
fun
auxbas
( t2p0: t2ype
, flag
: &int >> int): t2ype =
let
//
val
t2p0 = t2bas_eval(t2p0)
//
in(*in-of-let*)
//
case+
t2p0.node() of
|
T2Pbas _ => t2p0
|
_(*non-T2Pbas*) =>
(
  auxt2p0(t2p0, flag)
) where
{
  val () = flag := flag + 1
}
//
end (*let*) // end of [auxbas]
//
(* ****** ****** *)
//
and
auxvar
( t2p0: t2ype
, flag
: &int >> int): t2ype =
let
val-
T2Pvar
(s2v0) = t2p0.node() in t2p0
end (*let*) // end of [auxvar]
//
(* ****** ****** *)
//
and
auxcst
( t2p0: t2ype
, flag
: &int >> int): t2ype =
(
  t2ype_whnfz$cst(t2p0, flag)
) (* end of [auxcst] *)
//
(* ****** ****** *)
//
and
auxxtv
( t2p0: t2ype
, flag
: &int >> int): t2ype =
let
//
val-
T2Pxtv
(xtv0) = t2p0.node()
//
in(*in-of-let*)
//
let
  val
  t2p1 = xtv0.type()
in
case+
t2p1.node() of
| T2Pnone0() => t2p0
| _ (*non-T2Pnone0*) =>
  (
    auxt2p0(t2p1, flag)
  ) where
  {
    val () = flag := flag + 1
  }
end
//
end (*let*) // end of [auxxtv]
//
(* ****** ****** *)
//
and
auxapp
( t2p0: t2ype
, flag
: &int >> int): t2ype =
let
//
val-
T2Papp
(t2p1, t2ps) = t2p0.node()
//
val fini = flag
//
val t2p1 = auxt2p0(t2p1, flag)
val t2ps = auxt2ps(t2ps, flag)
//
in
//
case+
t2p1.node() of
|
T2Plam
(s2vs, t2p2) =>
(
  auxt2p0(t2p0, flag)
) where
{
  val () = flag := flag + 1
  val t2p0 =
  t2ype_subst_svarlst(t2p2, s2vs, t2ps)
} (* auxt2p0 *)
| _ (*non-T2Plam*) =>
let
val s2t0 = t2p0.sort()
in
if
fini=flag
then t2p0
else
t2ype_make_node(s2t0, T2Papp(t2p1, t2ps))
end // end of [non-T2Plam]
//
end (*let*) // end of [auxapp]
//
(* ****** ****** *)
//
and
auxt2p0
( t2p0: t2ype
, flag
: &int >> int): t2ype =
(
case+
t2p0.node() of
//
| T2Pbas _ =>
  auxbas(t2p0, flag)
//
| T2Pvar _ =>
  auxvar(t2p0, flag)
//
| T2Pcst _ =>
  auxcst(t2p0, flag)
//
| T2Pxtv _ =>
  auxxtv(t2p0, flag)
//
| T2Papp _ =>
  auxapp(t2p0, flag)
//
(*
| T2Plft _ =>
  auxlft(t2p0, flag)
*)
//
| _ (*rest-of-t2ype*) => t2p0
//
) (* end of [auxt2p0] *)
//
and
auxt2ps
( t2ps
: t2ypelst
, flag
: &int >> int): t2ypelst =
(
case+ t2ps of
|
list_nil() =>
list_nil()
|
list_cons(t2p1, tps2) =>
let
  val fini = flag
  val t2p1 = auxt2p0(t2p1, flag)
  val tps2 = auxt2ps(tps2, flag)
in
  if
  fini = flag
  then t2ps else list_cons(t2p1, tps2)
end
) (* end of [auxt2ps] *)
//
} (* end of [t2ype_whnfz] *)

(* ****** ****** *)
//
implement
t2ype_whnfize
  (t2p0) =
(
  t2ype_whnfz<>(t2p0)
) where
{
//
implement
t2ype_whnfz$cst<>
  (t2p0, flag) =
let
//
val-
T2Pcst(s2c0) = t2p0.node()
//
val
def0 = s2cst_get_type(s2c0)
//
in
//
case+
def0.node() of
//
|
T2Pnone0() => t2p0
//
| _(* else *) => 
let
val () =
flag := flag + 1 in t2ype_whnfize(def0)
end
//
end // t2ype_whnfz$cst
//
} (* end of [t2ype_whnfize] *)
//
(* ****** ****** *)

implement
t2ype_projize
(t2p0, lab1) =
let
(*
val t2p0 = whnfize(t2p0)
*)
in
//
case+
t2p0.node() of
//
|
T2Ptyrec
(_, _, ltps) => auxlst(0, ltps)
//
|
_(*non-T2Ptyrec*) => None_vt(*void*)
//
end where
{
fun
auxlst
( i0: int
, lxs
: labt2ypelst
) :
Option_vt@(int, t2ype) =
(
case+ lxs of
|
list_nil() => None_vt()
|
list_cons
( lx0, lxs ) =>
let
val
SLABELED(l0, x0) = lx0
in
if
(lab1 = l0)
then Some_vt@(i0, x0) else auxlst(i0+1, lxs)
end // end of [list_cons]
)
} (* end of [t2ype_projize] *)

(* ****** ****** *)

implement
s2explst_erase
  (s2es) =
list_vt2t
(
list_map<s2exp><t2ype>(s2es)
) where
{
implement
list_map$fopr<s2exp><t2ype>(s2e) = s2exp_erase(s2e)
} (* end of [s2explst_erase] *)

(* ****** ****** *)

implement
labs2explst_erase
  (ls2es) =
list_vt2t
(
list_map<labs2exp><labt2ype>(ls2es)
) where
{
implement
list_map$fopr<labs2exp><labt2ype>(ls2e) =
let
val+
SLABELED
(l0, s2e) = ls2e in SLABELED(l0, s2exp_erase(s2e))
end
} (* end of [labs2explst_erase] *)

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxbas
( t2p0: t2ype
, flag
: &int >> int): t2ype =
let
//
val
t2p0 = t2bas_eval(t2p0)
//
in(*in-of-let*)
//
case+
t2p0.node() of
|
T2Pbas _ => t2p0
|
_(*non-T2Pbas*) =>
(
  auxt2p0(t2p0, flag)
) where
{
  val () = flag := flag + 1
}
//
end // end of [auxbas]

(* ****** ****** *)

and
auxvar
( t2p0: t2ype
, flag
: &int >> int): t2ype =
let
val-
T2Pvar
(s2v0) = t2p0.node() in t2p0
end (*let*) // end of [auxvar]

(* ****** ****** *)

and
auxcst
( t2p0: t2ype
, flag
: &int >> int): t2ype =
let
//
val-
T2Pcst(s2c0) = t2p0.node()
val
def0 = s2cst_get_type(s2c0)
//
in(*in-of-let*)
//
case+
def0.node() of
//
|
T2Pnone0() => t2p0
//
|
_(* else *) =>
(
  t2ype_normize(def0)
) where
{
  val () = flag := flag + 1
}
//
end (*let*) // end of [auxcst]

(* ****** ****** *)

and
auxxtv
( t2p0: t2ype
, flag
: &int >> int): t2ype =
let
//
val-
T2Pxtv
(xtv0) = t2p0.node()
//
in(*in-of-let*)
//
let
val
t2p1 = xtv0.type()
in
case+
t2p1.node() of
|
T2Pnone0() => t2p0
|
_ (*non-T2Pnone0*) =>
let
  val
  t2p1 =
  t2ype_normize(t2p1)
in
  xtv0.type(t2p1); t2p1
end where
{
  val () = flag := flag + 1
}
end // end of [let]
//
end (*let*) // end of [auxxtv]

(* ****** ****** *)

and
auxlft
( t2p0: t2ype
, flag
: &int >> int): t2ype =
let
//
val-
T2Plft(t2p1) = t2p0.node()
//
val fini = flag
val t2p1 = auxt2p0(t2p1, flag)
//
in
if
fini = flag
then t2p0 else
let
  val s2t0 = t2p0.sort()
in
t2ype_make_node(s2t0, T2Plft(t2p1))
end
end (*let*) // end of [auxlft]

(* ****** ****** *)

and
auxapp
( t2p0: t2ype
, flag
: &int >> int): t2ype =
let
//
val-
T2Papp
(t2p1, t2ps) = t2p0.node()
//
val fini = flag
//
val t2p1 = auxt2p0(t2p1, flag)
val t2ps = auxt2ps(t2ps, flag)
//
in
//
case+
t2p1.node() of
|
T2Plam
(s2vs, t2p2) =>
let
  val () = flag := flag + 1
in
  t2ype_normize
  (
  t2ype_subst_svarlst(t2p2, s2vs, t2ps)
  ) (* t2ype_whnfize *)
end
|
_ (*non-T2Plam*) =>
if
fini=flag
then t2p0 else
let
  val s2t0 = t2p0.sort()
in
t2ype_make_node(s2t0, T2Papp(t2p1,t2ps))
end
//
end // end of [auxapp]

(* ****** ****** *)

and
auxlam
( t2p0: t2ype
, flag
: &int >> int): t2ype =
let
//
val-
T2Plam
(s2vs, t2p1) = t2p0.node()
//
val fini = flag
val t2p1 = auxt2p0(t2p1, flag)
//
in
if
fini = flag
then t2p0 else
let
  val s2t0 = t2p0.sort()
in
t2ype_make_node(s2t0, T2Plam(s2vs,t2p1))
end
end (*let*) // end of [auxlam]

(* ****** ****** *)

and
auxt2p0
( t2p0: t2ype
, flag
: &int >> int): t2ype =
(
case+
t2p0.node() of
//
| T2Pbas _ =>
  auxbas(t2p0, flag)
//
| T2Pvar _ =>
  auxvar(t2p0, flag)
//
| T2Pcst _ =>
  auxcst(t2p0, flag)
//
| T2Pxtv _ =>
  auxxtv(t2p0, flag)
//
| T2Plft _ =>
  auxlft(t2p0, flag)
//
| T2Papp _ =>
  auxapp(t2p0, flag)
//
| T2Plam _ =>
  auxlam(t2p0, flag)
//
|
T2Pfun
(fc2, npf, t2ps, t2p1) =>
let
  val
  s2t0 = t2p0.sort()
  val
  fc2 = auxt2p0(fc2, flag)
  val
  t2ps = auxt2ps(t2ps, flag)
  val
  t2p1 = auxt2p0(t2p1, flag)
in
  t2ype_make_node
  (s2t0, T2Pfun(fc2, npf, t2ps, t2p1))
end
//
|
T2Puni(s2vs, t2p1) =>
let
  val
  s2t0 = t2p0.sort()
  val
  t2p1 = auxt2p0(t2p1, flag)
in
t2ype_make_node(s2t0, T2Puni(s2vs, t2p1))
end
|
T2Pexi(s2vs, t2p1) =>
let
  val
  s2t0 = t2p0.sort()
  val
  t2p1 = auxt2p0(t2p1, flag)
in
t2ype_make_node(s2t0, T2Pexi(s2vs, t2p1))
end
//
|
T2Ptyext(name, t2ps) =>
let
  val s2t0 = t2p0.sort()
  val t2ps = auxt2ps(t2ps, flag)
in
t2ype_make_node(s2t0, T2Ptyext(name, t2ps))
end
//
|
T2Ptyrec(knd0, npf1, ltps) =>
let
  val s2t0 = t2p0.sort()
  val ltps = auxltps(ltps, flag)
in
t2ype_make_node(s2t0,T2Ptyrec(knd0,npf1,ltps))
end
//
| _ (* rest-of-t2ype *) => t2p0 // HX: FIXME!
//
)

(* ****** ****** *)

and
auxt2ps
( t2ps
: t2ypelst
, flag
: &int >> int): t2ypelst =
(
case+ t2ps of
|
list_nil() =>
list_nil()
|
list_cons(t2p1, tps2) =>
let
  val fini = flag
  val t2p1 = auxt2p0(t2p1, flag)
  val tps2 = auxt2ps(tps2, flag)
in
if
fini = flag
then t2ps else list_cons(t2p1, tps2)
end
)

(* ****** ****** *)

and
auxltps
( ltps
: labt2ypelst
, flag
: &int >> int): labt2ypelst =
(
case+ ltps of
|
list_nil() =>
list_nil()
|
list_cons
(lt2p1, ltps1) =>
let
val fini = flag
val+
SLABELED
(l1, t2p1) = lt2p1
val
t2p1 =
auxt2p0(t2p1, flag)
//
val lt2p1 =
(
if
flag=fini
then lt2p1 else SLABELED(l1,t2p1)
) : labt2ype // end of [val]
val ltps1 = auxltps( ltps1, flag )
in
if
fini = flag
then ltps else list_cons(lt2p1, ltps1)
end
)

(* ****** ****** *)

in(* in-of-local *)

implement
t2ype_normize
  (t2p0) = let
//
(*
val () =
println!
("t2ype_normize: t2p0 = ", t2p0)
*)
//
in
//
let
  var
  flag: int = 0 in auxt2p0(t2p0, flag)
end
//
end (* end of [t2ype_normize] *)

implement
t2ypelst_normize(t2ps) =
let
  var
  flag: int = 0 in auxt2ps(t2ps, flag)
end (* end of [t2ypelst_normize] *) end // end of [local]

(* ****** ****** *)

implement
t2ype_diffize
(t2p1, t2p2) = let
//
vtypedef
dfflst =
List0_vt(t2ypedff)
//
fun
auxins
( x0
: t2ype
, y0
: t2ype
, ps
: synpth
, dffs
: dfflst): dfflst =
(
  list_vt_cons(dff0, dffs)
) where
{
  val
  dff0 = T2Pdff11(ps, x0, y0)
}
//
fun
auxone
( x0
: t2ype
, y0
: t2ype
, ps
: synpth
, dffs
: dfflst): dfflst =
let
val x0 = whnfize(x0)
val y0 = whnfize(y0)
in
case+
( x0.node()
, y0.node()) of
//
|
( T2Pbas(sym1)
, T2Pbas(sym2)) =>
if
(sym1 = sym2)
then dffs else
auxins(x0, y0, ps, dffs)
//
|
( T2Pcst(s2c1)
, T2Pcst(s2c2)) =>
if
(s2c1 = s2c2)
then dffs else
auxins(x0, y0, ps, dffs)
//
|
( T2Pvar(s2v1)
, T2Pvar(s2v2)) =>
if
(s2v1 = s2v2)
then dffs else
auxins(x0, y0, ps, dffs)
//
|
( T2Pfc2(fc21)
, T2Pfc2(fc22)) =>
if
funclo2_equal
(fc21 , fc22)
then dffs else
auxins(x0, y0, ps, dffs)
//
|
(T2Papp _, T2Papp _) =>
(
  auxapp(x0, y0, ps, dffs)
)
//
|
(T2Pfun _, T2Pfun _) =>
(
  auxfun(x0, y0, ps, dffs)
)
//
|
( T2Pnone0()
, T2Pnone0() ) => dffs
//
|
(_(*else*), _(*else*)) =>
(
  auxins(x0, y0, ps, dffs)
)
end // end of [auxone]
//
and
auxlst
( xs
: t2ypelst
, ys
: t2ypelst
, p0: int
, ps: synpth
, dffs
: dfflst): dfflst =
(
case+ xs of
|
list_nil() =>
(
case- ys of
|
list_nil() => dffs
|
list_cons(y0, ys) =>
let
val
dff0 =
T2Pdff01(ps, y0) where
{
val y0 = whnfize(y0)
val ps = list_cons(p0, ps)
}
val
dffs =
list_vt_cons(dff0, dffs)
in
  auxlst(xs, ys, p0+1, ps, dffs)
end
)
|
list_cons(x0, xs) =>
(
case- ys of
|
list_nil() =>
let
val
dff0 =
T2Pdff10(ps, x0) where
{
val x0 = whnfize(x0)
val ps = list_cons(p0, ps)
}
val
dffs =
list_vt_cons(dff0, dffs)
in
  auxlst(xs, ys, p0+1, ps, dffs)
end
|
list_cons(y0, ys) =>
let
val
dffs =
auxone
(x0, y0, ps, dffs) where
{
  val ps = list_cons(p0, ps)
}
in
  auxlst(xs, ys, p0+1, ps, dffs)
end
)
) (* end of [auxlst] *)
//
and
auxapp
( x0
: t2ype
, y0
: t2ype
, ps
: synpth
, dffs
: dfflst): dfflst =
let
val-
T2Papp
(x1, xs) = x0.node()
val-
T2Papp
(y1, ys) = y0.node()
//
val p0 = 0 and p1 = 1
//
val dffs =
let
val ps =
list_cons(p0, ps)
in
  auxone(x1, y1, ps, dffs)
end
in
let
val ps =
list_cons(p1, ps)
in
  auxlst(xs, ys, 0, ps, dffs)
end
end (* end of T2Papp *)
//
and
auxfun
( x0
: t2ype
, y0
: t2ype
, ps
: synpth
, dffs
: dfflst): dfflst =
let
//
val-
T2Pfun
( fc21
, npf1
, xs, x1) = x0.node()
val-
T2Pfun
( fc22
, npf2
, ys, y1) = y0.node()
//
val p0 = 0 and p1 = 1
val p2 = 2 and p3 = 3
//
val dffs =
let
  val ps =
  list_cons(p0, ps)
in
  auxone
  (fc21, fc22, ps, dffs)
end
//
val dffs =
let
  val ps =
  list_cons(p1, ps)
in
  auxnpf
  (npf1, npf2, ps, dffs)
end
//
val dffs =
let
val ps = list_cons(p2, ps)
in
  auxlst(xs, ys, 0, ps, dffs)
end
//
in
  let
  val ps = list_cons(p3, ps)
  in
    auxone( x1, y1, ps, dffs )
  end
end // end of [auxfun]
//
and
auxnpf
( n1: int
, n2: int
, ps: synpth
, dffs: dfflst): dfflst =
(
  if
  (n1 = n2)
  then dffs else
  list_vt_cons(dff0, dffs)
) where
{
val dff0 = T2Pdff11_npf(ps, n1, n2)
} (* end of [val dffs] *)
//
in
list_vt2t
(
list_vt_reverse
(
auxone
(t2p1, t2p2, list_nil(), list_vt_nil())))
end // end of [t2ype_diffize]

(* ****** ****** *)

(* end of [xats_statyp2_util0.dats] *)
