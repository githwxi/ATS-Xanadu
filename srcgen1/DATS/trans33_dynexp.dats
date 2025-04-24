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
// Start Time: September, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#include
"./../HATS/xatsopt.hats"
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/xbasics.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp0.sats"

(* ****** ****** *)

#staload "./../SATS/trans12.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"

(* ****** ****** *)

#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans23.sats"
#staload "./../SATS/trans33.sats"

(* ****** ****** *)
//
implement
fprint_val<sort2> = fprint_sort2
implement
fprint_val<t2ype> = fprint_t2ype
//
implement
fprint_val<d3exp> = fprint_d3exp
//
(* ****** ****** *)
//
implement
fprint_val<tq2arg> = fprint_tq2arg
implement
fprint_val<ti2arg> = fprint_ti2arg
//
(* ****** ****** *)
//
extern
fun
list_npf_cons
{a:type}
( n0: int
, x0: a, xs: List(a)): List0(a)
//
implement
list_npf_cons
(n0, x0, xs) =
if
(n0 <= 0)
then
let
prval () =
lemma_list_param(xs) in list_cons(x0, xs)
end
else
(
case+ xs of
|
list_nil() =>
list_sing(x0)
|
list_cons(x1, xs) =>
list_cons(x1, list_npf_cons(n0-1, x0, xs))
) (* end of [else] *)
//
(* ****** ****** *)

implement
trans33_envless
  (prog) =
  (prog) where
{
//
val
env0 = abstenv_make_nil()
//
val
prog =
trans33_declist(env0, prog)
//
val () = abstenv_free_top(env0)
//
} (* end of [trans33_envless] *)

(* ****** ****** *)

local
//
fun
auxd3p1
( d3p1
: d3pat): void =
(
case+
d3p1.node() of
|
D3Pvar(d2v1) =>
let
  val
  t2p1 = d2v1.type()
in
  d2v1.type(t2ype_lft(t2p1))
end
|
_(*non-D3Pvar*) => ((*void*))
)
and
auxd3ps
( npf1
: int
, d3ps
: d3patlst): void =
(
case+ d3ps of
|
list_nil() => ()
|
list_cons(d3p1, d3ps) =>
(
  if
  (npf1 > 0)
  then
  auxd3ps(npf1-1, d3ps)
  else
  (
  auxd3ps(npf1-1, d3ps)
  ) where
  {
    val () = auxd3p1(d3p1)
  }
) (* end of [list_cons] *)
)
//
in
//
fun
d3pat_leftize
(d3p0: d3pat): void =
(
case+
d3p0.node() of
|
D3Pdapp
( d3f0
, npf1, d3ps) =>
let
  val () =
  d3pat_leftize(d3f0)
in
  auxd3ps(npf1, d3ps)
end // end of [D3Pdapp]
|
D3Panno(d3p1, _, _) =>
(
  d3pat_leftize(d3p1)
)
|
_(* rest-of-d3pat *) => ()
)
//
end (* end of [d3pat_leftize] *)

(* ****** ****** *)

local

fun
auxbang
( env0:
! abstenv
, d3p0: d3pat): d3pat = let
//
val
loc0 = d3p0.loc()
val-
D3Pbang(d3p1) = d3p0.node()
//
val
d3p1 = trans33_dpat(env0, d3p1)
//
val () =
(
case+
d3p1.node() of
| D3Pvar(d2v1) =>
  let
    val t2p1 = d2v1.type()
  in
    d2v1.type(t2ype_lft(t2p1))
  end
| _ (*non-D3Pvar*) => ((*void*))
)
//
in
  d3pat_make_node
  (loc0, d3p1.type(), D3Pbang(d3p1))
end // end of [auxbang]

(* ****** ****** *)

fun
auxflat
( env0:
! abstenv
, d3p0: d3pat): d3pat = let
//
val
loc0 = d3p0.loc()
val-
D3Pflat(d3p1) = d3p0.node()
//
val
d3p1 = trans33_dpat(env0, d3p1)
//
(*
(*
HX-2020-07-10:
Lefitization needs to
be annotated explicitly;
in the following patterns,
[x0] is a val but [xs] is a var:
//
@list_cons(x0, !xs) // xs: read-only
@list_vt_cons(x0, !xs) // xs: writable
//
*)
val
((*void*)) = d3pat_leftize(d3p1)
*)
//
in
  d3pat_make_node
  (loc0, d3p1.type(), D3Pflat(d3p1))
end // end of [auxflat]

(* ****** ****** *)

fun
auxfree
( env0:
! abstenv
, d3p0: d3pat): d3pat = let
//
val
loc0 = d3p0.loc()
val-
D3Pfree(d3p1) = d3p0.node()
//
val d3p1 = trans33_dpat(env0, d3p1)
//
in
  d3pat_make_node
  (loc0, d3p1.type(), D3Pfree(d3p1))
end // end of [auxfree]

(* ****** ****** *)

fun
auxsym0
( env0:
! abstenv
, d3p0: d3pat): d3pat =
let
//
val
loc0 = d3p0.loc()
val-
D3Psym0
(d1p1, dpis) = d3p0.node()
//
val t2p0 = d3p0.type()
(*
val () =
println!
("auxsym0: t2p0 = ", t2p0)
*)
//
val opt0 =
match2_d2pconlst_t2ype(dpis, t2p0)
//
in
case+ opt0 of
|
~None_vt() => d3p0
|
~Some_vt(d2i0) =>
(
case- d2i0 of
| D2ITMcon(d2cs) =>
  (
  d3pat_make_node
  (loc0, t2p0, D3Pcon1(d2c1))
  ) where
  {
    val-
    list_cons(d2c1, _) = d2cs
    val-true =
    unify2_d2con_t2ype(loc0, d2c1, t2p0)
  }
) (*end of [Some_vt]*)
end // end of [auxsym0]

(* ****** ****** *)

fun
auxdapp
( env0:
! abstenv
, d3p0: d3pat): d3pat =
let
//
val
loc0 = d3p0.loc()
//
val-
D3Pdapp
(d3f0, npf1, d3ps) = d3p0.node()
//
val
d3f0 = trans33_dpat(env0, d3f0)
val
d3ps = trans33_dpatlst(env0, d3ps)
//
in
  d3pat_dapp_up(loc0, d3f0, npf1, d3ps)
end // end of [auxdapp]

(* ****** ****** *)

fun
aux_trcd1
( env0:
! abstenv
, d3p0: d3pat): d3pat =
let
//
val
loc0 = d3p0.loc()
//
val-
D3Ptrcd1
( knd0
, npf1
, d3ps) = d3p0.node()
//
val d3ps =
trans33_dpatlst(env0, d3ps)
//
in
  d3pat_trcd1_up(loc0, knd0, npf1, d3ps)
end // end of [aux_trcd1]

(* ****** ****** *)

in (* in-of-local *)

(* ****** ****** *)

implement
trans33_dpat
(env0, d3p0) = let
(*
val loc0 = d3p0.loc()
*)
(*
val ((*void*)) =
println!
("trans33_dpat: d3p0 = ", d3p0)
*)
//
in
//
case+
d3p0.node() of
//
| D3Pnil _ => d3p0
| D3Pany _ => d3p0
//
| D3Pvar _ => d3p0
//
| D3Pi00 _ => d3p0
| D3Pb00 _ => d3p0
| D3Pc00 _ => d3p0
| D3Ps00 _ => d3p0
//
| D3Pint _ => d3p0
| D3Pbtf _ => d3p0
| D3Pchr _ => d3p0
| D3Pflt _ => d3p0
| D3Pstr _ => d3p0
//
| D3Pcon1 _ => d3p0
| D3Pcon2 _ => d3p0
//
| D3Pbang _ =>
  auxbang(env0, d3p0)
| D3Pflat _ =>
  auxflat(env0, d3p0)
| D3Pfree _ =>
  auxfree(env0, d3p0)
//
| D3Psym0 _ =>
  auxsym0(env0, d3p0)
//
| D3Psap0 _ => (d3p0)
| D3Psap1 _ => (d3p0)
//
| D3Pdap1 _ => (d3p0)
//
| D3Pdapp _ =>
  auxdapp(env0, d3p0)
//
| D3Ptrcd1 _ =>
  aux_trcd1(env0, d3p0)
//
|
D3Panno
(d3p1, s1e2, s2e2) =>
let
val
d3p1 = 
trans33_dpat(env0, d3p1)
in
d3pat_anno(d3p1, s1e2, s2e2)
end // end of [D3Panno]
//
|
D3Ptcast(d3p1, t2p2) =>
let
val
d3p1 =
// HX: for handling
trans33_dpat // abstypes!!!
(env0, d3p1) in d3p1 end where
{
val
loc1 = d3p1.loc()
val
t2p1 = d3p1.type()
(*
val () =
println!
("\
trans33_dpat: \
D3Ptcast: loc1 = ", loc1)
val () =
println!
("\
trans33_dpat: \
D3Ptcast: d3p1 = ", d3p1)
val () =
println!
("\
trans33_dpat: D3Ptcast: t2p1 = ", t2p1)
val () =
println!
("\
trans33_dpat: D3Ptcast: t2p2 = ", t2p2)
*)
} (*where*) // end of [D3Ptcast]
//
|
D3Pnone0 _ => d3p0 // HX: interp
|
D3Pnone1 _ => d3p0 // HX: errmsg
|
D3Pnone2 _ => d3p0 // HX: errmsg
//
(*
| _ (* rest-of-d3pat *) => (d3p0)
*)
//
end (*end*) // end of [trans33_dpat]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
trans33_dpatlst
  (env0, d3ps) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3pat><d3pat>(d3ps)
) where
{
implement
list_map$fopr<d3pat><d3pat>(d3p0) =
let
val env0 =
$UN.castvwtp0{abstenv}(env0)
val d3p0 = trans33_dpat(env0, d3p0)
in
let
prval () = $UN.cast2void(env0) in d3p0
end
end // end of [let]
}
end (*let*) // end of [trans33_dpatlst]

(* ****** ****** *)
//
implement
trans33_dpat_dntp
(env0, d3p0, t2p0) =
(
  d3pat_dntp(d3p0, t2p0)
) where
{
  val
  d3p0 = trans33_dpat(env0, d3p0)
} (* end of [trans33_dpat_dntp] *)
//
(* ****** ****** *)
//
implement
trans33_dpatlst_dnts
( env0, d3ps, t2ps ) =
(
auxlst(env0, d3ps, t2ps)
) where
{
fun
auxlst
( env0:
! abstenv
, d3ps
: d3patlst
, t2ps
: t2ypelst): d3patlst =
(
case+ d3ps of
|
list_nil() =>
list_nil((*void*))
|
list_cons
(d3p0, d3ps) =>
(
case+ t2ps of
|
list_nil() =>
(
  list_cons(d3p0, d3ps)
) where
{
  val t2p0 =
  the_t2ype_none0
  val d3p0 =
  trans33_dpat_dntp(env0, d3p0, t2p0)
  val d3ps = auxlst(env0, d3ps, t2ps)
}
|
list_cons
(t2p0, t2ps) =>
(
  list_cons(d3p0, d3ps)
) where
{
  val d3p0 =
  trans33_dpat_dntp(env0, d3p0, t2p0)
  val d3ps = auxlst(env0, d3ps, t2ps)
}
) (* list_cons *)
) (* end of [auxlst] *)
} (* end of [trans33_dpatlst_dnts] *)
//
(* ****** ****** *)
//
fun
d33exp_make_node
( loc0
: loc_t
, t2p0
: t2ype
, dend
: d3exp_node): d3exp =
let
//
val t2p0 = whnfize(t2p0)
//
val d3e0 =
d3exp_make_node(loc0, t2p0, dend)
in
case+
t2p0.node() of
|
T2Plft(t2p1) =>
d3exp_make_node
(loc0, t2p1, D3Eflat(d3e0)) | _ => d3e0
end // end of [d33exp_make_node]
//
(* ****** ****** *)
//
implement
d33exp_if0_up
( loc0
, env0
, d3e1, d3e2, opt3) =
let
//
val tres =
(
case+ opt3 of
|
None _ =>
the_t2ype_void
|
Some _ =>
t2ype_new(loc0)): t2ype
//
val d3e2 =
d33exp_dntp(env0, d3e2, tres)
//
val opt3 =
(
case+ opt3 of
|
None() => None()
|
Some(d3e3) =>
Some
(d33exp_dntp(env0, d3e3, tres))
) : d3expopt // end of [val]
//
in
d33exp_make_node
( loc0
, tres, D3Eif0(d3e1, d3e2, opt3))
end // end of [d33exp_if0_up]
//
(* ****** ****** *)
//
implement
d33exp_if1_up
( loc0
, env0
, d3e1
, d3e2, opt3, tinv) =
let
//
val tres =
(
case+ opt3 of
|
None _ =>
the_t2ype_void
|
Some _ =>
t2ype_new(loc0)): t2ype
//
val d3e2 =
d33exp_dntp(env0, d3e2, tres)
//
val opt3 =
(
case+ opt3 of
|
None() => None()
|
Some(d3e3) =>
Some
(d33exp_dntp(env0, d3e3, tres))
) : d3expopt // end of [val]
//
in
d33exp_make_node
( loc0
, tres
, D3Eif1(d3e1, d3e2, opt3, tinv))
end // end of [d33exp_if1_up]
//
(* ****** ****** *)
//
fun
d33exp_seqn_up
( loc0
: loc_t
, env0:
! abstenv
, d3es
: d3explst, d3e2: d3exp): d3exp =
(
  d23exp_seqn_up(loc0, d3es, d3e2)
)
//
(* ****** ****** *)
//
fun
d33exp_trcd1_up
( loc0
: loc_t
, env0:
! abstenv
, knd1: int
, npf2: int, d3es: d3explst): d3exp =
(
d23exp_trcd1_up(loc0, knd1, npf2, d3es)
)
//
(* ****** ****** *)
//
fun
d33exp_lam_up
( loc0
: loc_t
, env0:
! abstenv
, knd0: token
, f3as: f3arglst
, res0: effs2expopt
, arrw: f1unarrow, body: d3exp): d3exp =
(
  d23exp_lam_up
  (loc0, knd0, f3as, res0, arrw, body)
)
//
fun
d33exp_fix_up
( loc0
: loc_t
, env0:
! abstenv
, knd0: token
, d2v0: d2var
, f3as: f3arglst
, res0: effs2expopt
, arrw: f1unarrow, body: d3exp): d3exp =
(
d23exp_fix_up
(loc0, knd0, d2v0, f3as, res0, arrw, body)
)
//
(* ****** ****** *)

local

(* ****** ****** *)
//
fun
d2var_up
( loc0: loc_t
, d2v1: d2var): d3exp =
(
  d33exp_make_node
  (loc0, t2p1, D3Evar(d2v1))
) where
{
val t2p1 = d2v1.type((*void*))
}
(*
fun
d2con_up
( loc0: loc_t
, d2c1: d2con): d3exp =
(
  d33exp_make_node
  (loc0, t2p1, D3Econ1(d2c1))
) where
{
val t2p1 = d2c1.type((*void*))
}
*)
fun
d2con_up
( loc0: loc_t
, d2c1: d2con): d3exp =
let
val
ti2s = list_nil()
val
(ti3a, t2p1) =
t2ype_tq2as_elim2
(loc0, d2c1.type(), d2c1.tqas())
in
case+ ti3a of
|
TI3ARGnone _ =>
d33exp_make_node
(loc0, t2p1, D3Efcon(d2c1))
|
TI3ARGsome _ =>
d33exp_make_node
(loc0, t2p1, D3Etcon(d2c1, ti3a, ti2s))
end // end of [d2con_up]
//
fun
d2cst_up
( loc0: loc_t
, d2c1: d2cst): d3exp =
let
val
ti2s = list_nil()
val
(ti3a, t2p1) =
t2ype_tq2as_elim2
(loc0, d2c1.type(), d2c1.tqas())
in
case+ ti3a of
|
TI3ARGnone _ =>
d33exp_make_node
(loc0, t2p1, D3Efcst(d2c1))
|
TI3ARGsome _ =>
d33exp_make_node
(loc0, t2p1, D3Etcst(d2c1, ti3a, ti2s))
end // end of [d2cst_up]
//
(* ****** ****** *)

fun
auxvar
( d3e0
: d3exp): d3exp =
let
//
val
loc0 = d3e0.loc()
val-
D3Evar(d2v1) = d3e0.node()
//
in
  d2var_up(loc0, d2v1)
end // end of [auxvar]

(* ****** ****** *)

fun
auxcon1
( d3e0
: d3exp): d3exp =
let
//
val
loc0 = d3e0.loc()
val-
D3Econ1(d2c1) = d3e0.node()
//
val
t2p0 = d3e0.type()
(*
val () =
println!
("auxcon1: t2p0 = ", t2p0)
*)
//
in
//
(
if
opt0
then d3e0
else d2con_up(loc0, d2c1)
) where
{
  val opt0 =
  match2_d2con_t2ype(d2c1, t2p0)
}
//
end // end of [auxcon1]

fun
auxcst1
( d3e0
: d3exp): d3exp =
let
//
val
loc0 = d3e0.loc()
val-
D3Ecst1(d2c1) = d3e0.node()
//
(*
val () =
println!
("auxcst1: d3e0 = ", d3e0)
*)
val
t2p0 = d3e0.type((*void*))
//
(*
val () =
println!
("auxcst1: d2e0.t2p0 = ", t2p0)
val () =
println!
("auxcst1: d2c1.type = ", d2c1.type())
*)
//
in
//
(
if
opt0
then d3e0
else d2cst_up(loc0, d2c1)
) where
{
  val opt0 =
  match2_d2cst_t2ype(d2c1, t2p0)
}
//
end // end of [auxcst1]

(* ****** ****** *)

fun
auxcon2
( d3e0
: d3exp): d3exp =
let
//
val
loc0 = d3e0.loc()
val-
D3Econ2(d2cs) = d3e0.node()
//
val
t2p0 = d3e0.type()
(*
val () =
println!
("auxcon2: t2p0 = ", t2p0)
*)
//
in
//
(
case+ opt0 of
| ~None_vt() => d3e0
| ~Some_vt(d2c1) =>
   d2con_up(loc0, d2c1)
) where
{
  val opt0 =
  match2_d2conlst_t2ype(d2cs, t2p0)
}
//
end // end of [auxcon2]

fun
auxcst2
( d3e0
: d3exp): d3exp =
let
//
val
loc0 = d3e0.loc()
val-
D3Ecst2(d2cs) = d3e0.node()
//
val
t2p0 = d3e0.type()
(*
val () =
println!
("auxcst2: t2p0 = ", t2p0)
*)
//
in
//
(
case+ opt0 of
| ~None_vt() => d3e0
| ~Some_vt(d2c1) =>
   d2cst_up(loc0, d2c1)
) where
{
  val opt0 =
  match2_d2cstlst_t2ype(d2cs, t2p0)
}
//
end // end of [auxcst2]

(* ****** ****** *)

fun
auxsym0
( d3e0
: d3exp): d3exp =
let
//
val
loc0 = d3e0.loc()
val-
D3Esym0
(d1e1, dpis) = d3e0.node()
//
val
t2p0 = d3e0.type()
(*
val () =
println!
("auxsym0: d3e0 = ", d3e0)
val () =
println!
("auxsym0: t2p0 = ", t2p0)
*)
//
val
opt0 =
match2_d2pitmlst_t2ype(dpis, t2p0)
//
in(* in-of-let *)
//
case+ opt0 of
|
~None_vt() => d3e0
|
~Some_vt(d2i0) =>
(
case- d2i0 of
| D2ITMvar(d2v1) =>
  (
    d2var_up(loc0, d2v1)
  )
| D2ITMcon(d2cs) =>
  (
    d2con_up(loc0, d2c1)
  ) where
  {
    val-list_cons(d2c1, _) = d2cs
  }
| D2ITMcst(d2cs) =>
  (
    d2cst_up(loc0, d2c1)
  ) where
  {
    val-list_cons(d2c1, _) = d2cs
  }
) (* end of [Some] *)
//
end // end of [auxsym0]

(* ****** ****** *)

fun
auxsap0
( env0:
! abstenv
, d3e0: d3exp): d3exp =
let
//
val
loc0 = d3e0.loc()
//
val-
D3Esap0
( d3f0
, s2es) = d3e0.node()
//
val
d3f0 =
trans33_dexp(env0, d3f0)
//
in
d33exp_sapp_up(loc0, env0, d3f0, s2es)
end // end of [auxsap0]

fun
auxsap1
( env0:
! abstenv
, d3e0: d3exp): d3exp =
let
//
val
loc0 = d3e0.loc()
//
val-
D3Esap1
( d3f0
, s2es) = d3e0.node()
//
val
d3f0 = trans33_dexp(env0, d3f0)
//
in
d33exp_sapp_up(loc0, env0, d3f0, s2es)
end // end of [auxsap1]

(* ****** ****** *)

fun
auxtapp
( env0:
! abstenv
, d3e0: d3exp): d3exp =
let
//
val
loc0 = d3e0.loc()
//
val-
D3Etapp
( d2f0
, s2es) = d3e0.node()
//
in
d33exp_tapp_up(loc0, env0, d2f0, s2es)
end // end of [auxtapp]

(* ****** ****** *)

fun
auxdapp
( env0:
! abstenv
, d3e0: d3exp): d3exp =
let
//
val
loc0 = d3e0.loc()
val-
D3Edapp
( d3f0
, npf1, d3es) = d3e0.node()
//
in
//
case+
d3f0.node() of
|
D3Esym0 _ => let
//
val
d3es =
trans33_dexplst(env0, d3es)
//
val
d3f0 =
let
val tres =
t2ype_new(loc0)
val targ =
d3explst_get_type(d3es)
val tfun =
t2ype_fun0
(loc0, npf1, targ, tres)
in
  d23exp_dntp(d3f0, tfun)
end // end of [val]
val
d3f0 = trans33_dexp(env0, d3f0)
//
in
  d33exp_dapp_up
  (loc0, env0, d3f0, npf1, d3es)
end
//
|
D3Ebrack _ =>
(
  auxdapp1(env0, d3e0))//D3Ebrack
//
|
D3Edtsel _ =>
(
  auxdapp2(env0, d3e0))//D3Edtsel
//
|
_(* else *) => let
val
d3f0 = trans33_dexp(env0, d3f0)
val
d3es = trans33_dexplst(env0, d3es)
in
d33exp_dapp_up(loc0, env0, d3f0, npf1, d3es)
end
//
end // end of [auxdapp]

(* ****** ****** *)

and
auxdapp1
( env0:
! abstenv
, d3e0: d3exp): d3exp =
let
//
val
loc0 = d3e0.loc()
val-
D3Edapp
( d3f0
, npf1, d3es) = d3e0.node()
(*
// HX: npf1 = ~1
*)
val-
D3Ebrack
( dpis, arg2) = d3f0.node()
//
val-
list_cons
(d3e1, _) = d3es
val
d3e1 =
trans33_dexp(env0, d3e1)
val
arg2 =
trans33_dexplst(env0, arg2)
//
val
tres = d3e0.type()
val
targ =
list_cons(t2p1, t2ps) where
{
val t2p1 = d3e1.type()
val t2ps = d3explst_get_type(arg2)
}
//
val tfun =
t2ype_fun0(loc0, npf1, targ, tres)
//
val opt1 =
match2_d2pitmlst_t2ype(dpis, tfun)
//
in
//
case+ opt1 of
| ~
None_vt() =>
let
val
d3es =
list_sing(d3e1)
val
d3f0 =
d3exp_make_node
( d3f0.loc()
, d3f0.type()
, D3Ebrack(dpis, arg2))
in
  d3exp_make_node
  ( loc0
  , tres, D3Edapp(d3f0, npf1, d3es))
end // end of [None_vt]
| ~
Some_vt(d2i0) => let
//
val d3f0 =
(
  case- d2i0 of
  | D2ITMvar(d2v1) =>
  (
    d2var_up(loc0, d2v1)
  )
  | D2ITMcon(d2cs) =>
  (
    d2con_up(loc0, d2c1)
  ) where
  {
    val-list_cons(d2c1, _) = d2cs
  }
  | D2ITMcst(d2cs) =>
  (
    d2cst_up(loc0, d2c1)
  ) where
  {
    val-list_cons(d2c1, _) = d2cs
  }
) : d3exp // end of [val d3f0]
//
in
//
let
val darg = list_cons(d3e1, arg2)
in
d33exp_dapp_up(loc0, env0, d3f0, npf1, darg)
end
//
end // end of [Some_vt]
//
end (* end of [ auxdapp1 ] *)

(* ****** ****** *)

and
auxdapp2
( env0:
! abstenv
, d3e0: d3exp): d3exp =
let
//
val
loc0 = d3e0.loc()
val-
D3Edapp
( d3f0
, npf1, d3es) = d3e0.node()
(*
// HX: npf1 = ~1
*)
val-
D3Edtsel
( lab0
, dpis
, npf2, opt3) = d3f0.node()
//
in
//
case+ opt3 of
|
None() =>
let
val-
list_cons(d3e1, _) = d3es
val
d3e1 = trans33_dexp(env0, d3e1)
in
d33exp_proj_up(loc0, env0, d3e1, lab0)
end // end of [None]
|
Some(arg3) =>
let
//
val
tres = d3e0.type()
//
val-
list_cons
(d3e1, _) = (d3es)
val
d3e1 =
trans33_dexp(env0, d3e1)
val
arg3 =
trans33_dexplst(env0, arg3)
//
val
t2p1 = d3e1.type()
val
s2t1 = t2p1.sort()
val
prf1 = sort2_is_proof(s2t1)
//
val
targ =
(
if
prf1 then
list_cons
(t2p1, t2ps) else
list_npf_cons
(npf2, t2p1, t2ps)) where
{
val
t2ps = d3explst_get_type(arg3)
}
//
val npf3 =
(
if
not(prf1)
then npf2 else
(
if npf2 <= 0
then (1) else npf2+1))
//
val tfun =
t2ype_fun0
(loc0, npf3, targ, tres): t2ype
//
val opt1 =
match2_d2pitmlst_t2ype(dpis, tfun)
//
in//let
//
case+ opt1 of
| ~
None_vt() =>
let
//
(*
HX: unresolved sym!
*)
val opt3 = Some(arg3)
val d3es = list_sing(d3e1)
//
val d3f0 =
(
d3exp_make_node
( d3f0.loc()
, d3f0.type()
, D3Edtsel
  (lab0, dpis, npf2, opt3)))
//
in//let
//
d3exp_make_node
( loc0
, tres, D3Edapp(d3f0, npf2, d3es))
//
end // end of [None_vt]
| ~
Some_vt(d2i0) =>
let
//
(*
HX: resolved symbol!
*)
//
val d3f0 =
(
case- d2i0 of
| D2ITMvar(d2v1) =>
(
  d2var_up(loc0, d2v1)
)
| D2ITMcon(d2cs) =>
(
  d2con_up(loc0, d2c1)
) where
{
  val-
  list_cons(d2c1, _) = d2cs
}
| D2ITMcst(d2cs) =>
(
  d2cst_up(loc0, d2c1)
) where
{
  val-
  list_cons(d2c1, _) = d2cs
}
) : d3exp // end of [val(d3f0)]
//
in//let
//
let
//
val darg =
(
if
prf1 then
list_cons
(d3e1, arg3) else
list_npf_cons
(npf2, d3e1, arg3)): d3explst
//
in//let
d33exp_dapp_up(loc0, env0, d3f0, npf3, darg)
end//let
//
end // end of [Some_vt]
//
end // end of [Some(arg3)]
//
end (* end of [ auxdapp2 ] *)

(* ****** ****** *)

fun
aux_seqn
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Eseqn
( d3es
, d3e1) = d3e0.node()
//
val
d3e1 = trans33_dexp(env0, d3e1)
val
d3es = trans33_dexplst(env0, d3es)
//
in
d33exp_seqn_up(loc0, env0, d3es, d3e1)
end // end of [aux_seqn]

(* ****** ****** *)

fun
aux_trcd1
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Etrcd1
( knd1
, npf2
, d3es) = d3e0.node()
//
val
d3es = trans33_dexplst(env0, d3es)
//
in
d33exp_trcd1_up(loc0, env0, knd1, npf2, d3es)
end // end of [aux_trcd1]

(* ****** ****** *)

fun
aux_let
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Elet
( d3cs
, d3e1) = d3e0.node()
//
val () =
abstenv_add_let1(env0)
val d3cs =
trans33_declist(env0, d3cs)
//
in
let
val
d3e1 =
trans33_dexp(env0, d3e1)
val
t2p1 = d3e1.type((*void*))
//
val () = abstenv_pop_let1(env0)
//
in
d33exp_make_node
  (loc0, t2p1, D3Elet(d3cs, d3e1))
end
end (* end of [aux_let] *)

(* ****** ****** *)

fun
aux_where
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Ewhere
( d3e1
, d3cs) = d3e0.node()
//
val () =
abstenv_add_let1(env0)
val d3cs =
trans33_declist(env0, d3cs)
//
in
let
val
d3e1 =
trans33_dexp(env0, d3e1)
val
t2p1 = d3e1.type((*void*))
val () = abstenv_pop_let1(env0)
in
d33exp_make_node
(loc0, t2p1, D3Ewhere(d3e1, d3cs))
end
end (* end of [aux_where] *)

(* ****** ****** *)

fun
aux_assgn
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Eassgn
( d3e1
, d3e2) = d3e0.node()
//
val d3e1 = trans33_dexp(env0, d3e1)
val d3e2 = trans33_dexp(env0, d3e2)
//
in
d33exp_assgn_up(loc0, env0, d3e1, d3e2)
end // end of [aux_assgn]

(* ****** ****** *)
//
fun
aux_if0
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Eif0
( d3e1
, d3e2, opt3) = d3e0.node()
//
val
d3e1 =
trans33_dexp_dntp
(env0, d3e1, the_t2ype_bool)
//
val
d3e2 = trans33_dexp(env0, d3e2)
val
opt3 = trans33_dexpopt(env0, opt3)
//
in
  d33exp_if0_up
  ( loc0, env0, d3e1, d3e2, opt3 )
end (* end of [aux_if0] *)
//
fun
aux_if1
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Eif1
( d3e1
, d3e2
, opt3, tinv) = d3e0.node()
//
val
d3e1 =
trans33_dexp_dntp
(env0, d3e1, the_t2ype_bool)
//
val
d3e2 = trans33_dexp(env0, d3e2)
val
opt3 = trans33_dexpopt(env0, opt3)
//
in
d33exp_if1_up
(loc0, env0, d3e1, d3e2, opt3, tinv)
end (* end of [aux_if1] *)
//
(* ****** ****** *)
//
fun
aux_cas0
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Ecas0
( knd0
, d3e1, dcls) = d3e0.node()
//
val tres = t2ype_new(loc0)
val d3e1 = trans33_dexp(env0, d3e1)
val dcls =
trans33_dclaulst_dntp(env0, dcls, tres)
//
in
d33exp_make_node
(loc0, tres, D3Ecas0(knd0, d3e1, dcls))
end (* end of [aux_cas0] *)
//
fun
aux_cas1
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Ecas1
( knd0
, d3e1
, dcls, tinv) = d3e0.node()
//
val tres = t2ype_new(loc0)
val d3e1 = trans33_dexp(env0, d3e1)
val dcls =
trans33_dclaulst_dntp(env0, dcls, tres)
//
in
d33exp_make_node
( loc0
, tres, D3Ecas1(knd0, d3e1, dcls, tinv))
end (* end of [aux_cas1] *)
//
(* ****** ****** *)

fun
aux_lam
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Elam
( knd0
, f3as
, tres
, arrw, body) = d3e0.node()
//
val
f3as =
trans33_farglst(env0, f3as)
val
body = trans33_dexp(env0, body)
//
in
d33exp_lam_up
(loc0, env0, knd0, f3as, tres, arrw, body)
end // end of [aux_lam]

(* ****** ****** *)

fun
aux_fix
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Efix
( knd0
, d2v0
, f3as
, tres
, arrw, body) = d3e0.node()
//
val
f3as =
trans33_farglst(env0, f3as)
val
body = trans33_dexp(env0, body)
//
in
d33exp_fix_up
( loc0, env0
, knd0, d2v0, f3as, tres, arrw, body)
end // end of [aux_fix]

(* ****** ****** *)

fun
aux_try0
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Etry0
( tok0
, d3e1, dcls) = d3e0.node()
//
val d3e1 =
trans33_dexp(env0, d3e1)
//
val tres = d3e1.type()
val dcls =
trans33_dclaulst_dntp(env0, dcls, tres)
//
in
//
  d33exp_make_node
  (loc0, tres, D3Etry0(tok0, d3e1, dcls))
//
end (* end of [aux_try0] *)

(* ****** ****** *)

fun
aux_addr
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Eaddr(d3e1) = d3e0.node()
//
val d3e1 = trans33_dexp(env0, d3e1)
//
val t2p0 =
t2ype_app1(the_t2ype_p2tr, d3e1.type())
//
in
d33exp_make_node(loc0, t2p0, D3Eaddr(d3e1))
end // end of [aux_addr]

(* ****** ****** *)

fun
aux_flat
( env0:
! abstenv
, d3e0: d3exp): d3exp = d3e0
fun
aux_talf
( env0:
! abstenv
, d3e0: d3exp): d3exp = d3e0

(* ****** ****** *)

fun
aux_fold
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Efold(d3e1) = d3e0.node()
//
val d3e1 =
trans33_dexp(env0, d3e1)
//
val t2p0 = the_t2ype_void(*void*)
//
in
d33exp_make_node(loc0, t2p0, D3Efold(d3e1))
end // end of [aux_fold]

(* ****** ****** *)

fun
aux_eval
( env0:
! abstenv
, d3e0
: d3exp ): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Eeval
(k0, d3e1) = d3e0.node()
//
var
knd0: int = k0
val
d3e1 =
trans33_dexp(env0, d3e1)
//
val t2p0 =
let
//
val
t2p1 = d3e1.type()
val
t2p1 =
whnfize_env( env0, t2p1 )
//
in(* in-of-let *)
//
let
val
opt2 =
t2ype_un_p2tr(t2p1)
in
case+ opt2 of
| ~
Some_vt(t2p2) => (knd0 := 1; t2p2)
| ~
None_vt((*void*)) =>
let
val
opt2 =
t2ype_un_lazy(t2p1)
in
case+ opt2 of
| ~
Some_vt(t2p2) => (knd0 := 2; t2p2)
| ~
None_vt((*void*)) =>
let
val
opt2 =
t2ype_un_llazy(t2p1)
in
case+ opt2 of
|
~Some_vt(t2p2) => (knd0 := 3; t2p2)
|
~None_vt((*void*)) => t2ype_new(loc0)
end // end of [let]
end // end of [let]
end // end of [let]
//
end // end of [val]
//
in
d33exp_make_node
(loc0, t2p0, D3Eeval(knd0, d3e1(*eval*)))
end // end of [aux_eval]

(* ****** ****** *)

fun
aux_free
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Efree
(k0, d3e1) = d3e0.node()
//
val
d3e1 =
trans33_dexp(env0, d3e1)
//
val
t2p0 = the_t2ype_void(*void*)
//
val
knd0 =
let
//
val
t2p1 = d3e1.type()
val
t2p1 =
whnfize_env( env0, t2p1 )
//
val
opt2 = t2ype_un_p2tr(t2p1)
//
in
case+ opt2 of
| ~Some_vt _ => 1 | ~None_vt _ =>
let
val
opt2 =
t2ype_un_data(t2p1)
in
case+ opt2 of
| ~Some_vt _ => 2 | ~None_vt _ =>
let
val
opt2 =
t2ype_un_llazy(t2p1)
in
case+ opt2 of
| ~Some_vt _ => 3 | ~None_vt _ => k0
end // end of [let]
end // end of [let]
end : int // end of [let]
//
in
d33exp_make_node
(loc0, t2p0, D3Efree(knd0, d3e1(*free*)))
end // end of [aux_free]

(* ****** ****** *)

fun
aux_raise
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Eraise(d3e1) = d3e0.node()
//
val t2p0 = t2ype_new(loc0)
//
val d3e1 = trans33_dexp(env0, d3e1)
//
in
d33exp_make_node(loc0, t2p0, D3Eraise(d3e1))
end // end of [aux_raise]

(* ****** ****** *)

fun
aux_lazy
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Elazy(d3e1) = d3e0.node()
//
val
d3e1 = trans33_dexp(env0, d3e1)
//
val
t2p0 =
t2ype_app1
(the_t2ype_lazy, d3e1.type())
//
in
d33exp_make_node(loc0, t2p0, D3Elazy(d3e1))
end // end of [aux_lazy]

fun
aux_llazy
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Ellazy
( d3e1
, d3es ) = d3e0.node()
//
val
d3e1 = trans33_dexp(env0, d3e1)
val
d3es =
let
  val t2p2 = the_t2ype_void
in
  trans33_dexplst_dntp(env0, d3es, t2p2)
end
//
val
t2p0 =
t2ype_app1
(the_t2ype_llazy, d3e1.type())
//
in
d33exp_make_node(loc0, t2p0, D3Ellazy(d3e1, d3es))
end // end of [aux_llazy]

(* ****** ****** *)

fun
aux_anno
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
#if(__XATSOPT_DEBUG__)
(*
val () =
println!
("aux_anno: d3e0 = ", d3e0)
val () =
println!
("aux_anno: t2p0 = ", t2p0)
*)
#endif//__XATSOPT_DEBUG__
//
val-
D3Eanno
( d3e1
, s1e2, s2e2) = d3e0.node()
(*
val t2p2 = s2exp_erase(s2e2)
*)
//
val d3e1 =
trans33_dexp_dntp(env0, d3e1, t2p0)
//
in
d33exp_make_node
(loc0, t2p0, D3Eanno(d3e1, s1e2, s2e2))
end // end of [aux_anno]

(* ****** ****** *)

fun
aux_exist1
( env0:
! abstenv
, d3e0: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
#if(__XATSOPT_DEBUG__)
// (*
val () =
println!
("aux_exist1: d3e0 = ", d3e0)
val () =
println!
("aux_exist1: t2p0 = ", t2p0)
// *)
#endif//__XATSOPT_DEBUG__
//
val-
D3Eexist1
(s2es, d3e1) = d3e0.node()
//
val d3e1 =
trans33_dexp_dntp(env0, d3e1, t2p0)
//
in
d33exp_make_node(loc0, t2p0, D3Eexist1(s2es, d3e1))
end // end of [aux_exist1]

(* ****** ****** *)

(*
fun
aux_tcast
( env0:
! abstenv
, d3e0
: d3exp ): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Elcast
(d3e1, lab2) = d3e0.node()
in
  ... ...
end // end of [aux_lcast]
*)

(* ****** ****** *)

(*
fun
aux_tcast
( env0:
! abstenv
, d3e0
: d3exp ): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Etcast
(d3e1, t2p2) = d3e0.node()
//
in
let
val
d3e1 =
trans33_dexp(env0, d3e1)
//
in
d33exp_tcastize(env0, d3e1, t2p2)
end
end // end of [aux_tcast]
*)

(* ****** ****** *)

in (* in-of-local *)

implement
trans33_dexp
(env0, d3e0) = let
//
val loc0 = d3e0.loc()
val t2p0 = d3e0.type()
//
#if(__XATSOPT_DEBUG__)
(*
val () =
println!
("trans33_dexp: loc0 = ", loc0)
val () =
println!
("trans33_dexp: d3e0 = ", d3e0)
val () =
println!
("trans33_dexp: t2p0 = ", t2p0)
*)
#endif//__XATSOPT_DEBUG__
//
in
//
case+
d3e0.node() of
//
| D3Ei00 _ => d3e0
| D3Eb00 _ => d3e0
| D3Ec00 _ => d3e0
| D3Es00 _ => d3e0
//
| D3Eint _ => d3e0
| D3Ebtf _ => d3e0
| D3Echr _ => d3e0
| D3Eflt _ => d3e0
| D3Estr _ => d3e0
//
| D3Evar _ => auxvar(d3e0)
//
| D3Econ1 _ => auxcon1(d3e0)
| D3Ecst1 _ => auxcst1(d3e0)
//
| D3Econ2 _ => auxcon2(d3e0)
| D3Ecst2 _ => auxcst2(d3e0)
//
| D3Esym0 _ => auxsym0(d3e0)
//
(*
| D3Etcst _ => d3e0
*)
//
|
D3Esap0 _ => auxsap0(env0, d3e0)
|
D3Esap1 _ => auxsap1(env0, d3e0)
//
|
D3Etapp _ => auxtapp(env0, d3e0)
//
|
D3Edapp _ => auxdapp(env0, d3e0)
//
(*
|
D3Epcon _ => auxpcon(env0, d3e0)
|
D3Epbox _ => auxpbox(env0, d3e0)
|
D3Eproj _ => auxproj(env0, d3e0)
|
D3Epflt _ => auxpflt(env0, d3e0)
|
D3Epptr _ => auxpptr(env0, d3e0)
*)
//
|
D3Eseqn _ => aux_seqn(env0, d3e0)
//
|
D3Etrcd1 _ => aux_trcd1(env0, d3e0)
//
| D3Elet _ => aux_let(env0, d3e0)
|
D3Ewhere _ => aux_where(env0, d3e0)
//
|
D3Eassgn _ => aux_assgn(env0, d3e0)
//
| D3Eif0 _ => aux_if0(env0, d3e0)
| D3Eif1 _ => aux_if1(env0, d3e0)
//
| D3Ecas0 _ => aux_cas0(env0, d3e0)
| D3Ecas1 _ => aux_cas1(env0, d3e0)
//
| D3Elam _ => aux_lam(env0, d3e0)
| D3Efix _ => aux_fix(env0, d3e0)
//
| D3Etry0 _ => aux_try0(env0, d3e0)
//
| D3Eaddr _ => aux_addr(env0, d3e0)
//
| D3Eflat _ => aux_flat(env0, d3e0)
| D3Etalf _ => aux_talf(env0, d3e0)
//
| D3Efold _ => aux_fold(env0, d3e0)
//
| D3Eeval _ => aux_eval(env0, d3e0)
//
| D3Efree _ => aux_free(env0, d3e0)
//
| D3Eraise _ => aux_raise(env0, d3e0)
//
| D3Elazy _ => aux_lazy(env0, d3e0)
| D3Ellazy _ => aux_llazy(env0, d3e0)
//
| D3Eanno _ => aux_anno(env0, d3e0)
//
| D3Eexist1 _ => aux_exist1(env0, d3e0)
//
|
D3Elcast
(d3e1, lab2) =>
let // HX: for abstype-handling!
  val
  d3e1 =
  trans33_dexp(env0, d3e1)
  val
  de30 =
  d33exp_proj_up
  (loc0, env0, d3e1, lab2) in d3e0
end // end of [D3Elcast]
//
|
D3Etcast
(d3e1, t2p2) =>
let
val
d3e1 =
// HX: for handling
trans33_dexp // abstypes!!!
(env0, d3e1) in d3e1 end where
{
val
loc1 = d3e1.loc()
val
t2p1 = d3e1.type()
(*
val () =
println!
("\
trans33_dexp: \
D3Etcast: loc1 = ", loc1)
val () =
println!
("\
trans33_dexp: \
D3Etcast: d3e1 = ", d3e1)
val () =
println!
("\
trans33_dexp: D3Etcast: t2p1 = ", t2p1)
val () =
println!
("trans33_dexp: D3Etcast: t2p2 = ", t2p2)
*)
} (*where*) // end of [D3Etcast]
//
| D3Enone0 _ => d3e0 // HX: interp
| D3Enone1 _ => d3e0 // HX: errmsg
//
| _ (*else*) => d3e0 // HX: yet-to-be-done
//
end (* trans33_dexp *) end // end of [local]

(* ****** ****** *)
//
implement
trans33_dexp_dntp
(env0, d3e0, t2p0) =
(
d33exp_dntp(env0, d3e0, t2p0)
) where
{
val
d3e0 = trans33_dexp(env0, d3e0)
(*
val () =
println!
("trans33_dexp_dntp: d3e0 = ", d3e0)
val () =
println!
("trans33_dexp_dntp: t2p0 = ", t2p0)
*)
}
//
(* ****** ****** *)
//
implement
trans33_dexpopt
(  env0, opt0  ) =
(
case+ opt0 of
| None() =>
  None((*void*))
| Some(d3e0) =>
  Some(trans33_dexp(env0, d3e0))
) (* end of [trans33_dexpopt] *)
//
implement
trans33_dexplst
(  env0, d3es  ) =
(
list_vt2t
(
list_map<d3exp><d3exp>(d3es)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<d3exp><d3exp>
  (d3e0) = let
//
val
env0 =
$UN.castvwtp0{abstenv}(env0)
val
d3e0 = trans33_dexp(env0, d3e0)
//
in
let
prval () = $UN.cast2void(env0) in d3e0
end
end // list_map$fopr
} (* end of [trans33_dexplst] *)
//
(* ****** ****** *)

implement
trans33_dexpopt_dntp
( env0, opt0, t2p0 ) =
(
case+ opt0 of
| None() =>
  None(*void*)
| Some(d3e0) => Some
  (trans33_dexp_dntp(env0, d3e0, t2p0))
) (* end of [trans33_dexpopt_dntp] *)

(* ****** ****** *)
//
implement
trans33_dexplst_dntp
( env0, d3es, t2p0 ) =
(
list_vt2t
(
list_map<d3exp><d3exp>(d3es)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<d3exp><d3exp>
  (d3e0) =
let
//
val
env0 =
$UN.castvwtp0{abstenv}(env0)
val
d3e0 =
trans33_dexp_dntp(env0, d3e0, t2p0)
//
in
let
prval () = $UN.cast2void(env0) in d3e0
end
end // list_map$fopr
} (* end of [trans33_dexplst_dntp] *)
//
(* ****** ****** *)
//
implement
trans33_dgua
(env0, d3g0) =
let
val loc0 = d3g0.loc()
in
case+
d3g0.node() of
| D3GUAexp(d3e1) =>
  let
    val
    d3e1 = trans33_dexp(env0, d3e1)
  in
    d3gua_make_node(loc0, D3GUAexp(d3e1))
  end
| D3GUAmat(d3e1, d3p2) =>
  let
    val d3e1 = trans33_dexp(env0, d3e1)
    val d3p2 = trans33_dpat(env0, d3p2)
  in
    d3gua_make_node(loc0, D3GUAmat(d3e1, d3p2))
  end
end
//
implement
trans33_dgualst
  (env0, d3gs) =
(
list_vt2t
(
list_map<d3gua><d3gua>(d3gs)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<d3gua><d3gua>
  (d3g0) = let
//
val
env0 =
$UN.castvwtp0{abstenv}(env0)
//
val
d3g0 = trans33_dgua(env0, d3g0)
//
in
let
prval () = $UN.cast2void(env0) in d3g0
end
end
} (* end of [trans33_dgualst] *)
//
(* ****** ****** *)
//
implement
trans33_dgpat
  (env0, d3gp) =
let
val loc0 = d3gp.loc()
in
//
case+
d3gp.node() of
|
D3GPATpat(d3p1) =>
(
  d3gpat_make_node
  (loc0, D3GPATpat(d3p1))
) where
{
  val
  d3p1 = trans33_dpat(env0, d3p1)
}
|
D3GPATgua(d3p1, d3gs) =>
(
  d3gpat_make_node
  (loc0, D3GPATgua(d3p1, d3gs))
) where
{
  val
  d3p1 = trans33_dpat(env0, d3p1)
  val
  d3gs = trans33_dgualst(env0, d3gs)
}
//
end // end of [trans33_d3gpat]

(* ****** ****** *)

implement
trans33_dclau_dntp
(env0, d3cl, tres) =
let
val loc0 = d3cl.loc()
in
case+
d3cl.node() of
|
D3CLAUpat(d3gp) =>
(
  d3clau_make_node
  (loc0, D3CLAUpat(d3gp))
) where
{
  val
  d3gp =
  trans33_dgpat(env0, d3gp)
}
|
D3CLAUexp(d3gp, d3e2) =>
(
  d3clau_make_node
  (loc0, D3CLAUexp(d3gp, d3e2))
) where
{
  val
  d3gp =
  trans33_dgpat(env0, d3gp)
  val
  d3e2 =
  trans33_dexp_dntp(env0, d3e2, tres)
}
end // end of [trans33_dclau_dntp]

(* ****** ****** *)
//
implement
trans33_dclaulst_dntp
( env0, dcls, tres ) =
(
list_vt2t
(
list_map<d3clau><d3clau>(dcls)
)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<d3clau><d3clau>
  (d3cl) = let
//
val
env0 =
$UN.castvwtp0{abstenv}(env0)
//
val
d3cl =
trans33_dclau_dntp(env0, d3cl, tres)
//
in
let
prval () = $UN.cast2void(env0) in d3cl
end
end
} (* end of [trans33_dclaulst] *)
//
(* ****** ****** *)
//
implement
trans33_farg
  (env0, f3a0) =
(
case+
f3a0.node() of
|
F3ARGsome_dyn
(npf, d3ps) =>
(
f3arg_make_node
( f3a0.loc()
, F3ARGsome_dyn(npf, d3ps))
) where
{
  val
  d3ps =
  trans33_dpatlst(env0, d3ps)
} (* F3ARGsome_dyn *)
//
| _(*non-F3ARGsome_dyn*) => f3a0
)
//
implement
trans33_farglst
  (env0, f3as) =
list_vt2t
(
list_map<f3arg><f3arg>(f3as)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<f3arg><f3arg>
  (f3a0) = let
//
val
env0 =
$UN.castvwtp0{abstenv}(env0)
//
val
f3a0 = trans33_farg(env0, f3a0)
//
in
let
prval () = $UN.cast2void(env0) in f3a0
end
end
} (* end of [trans33_farglst] *)
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_include
( env0:
! abstenv
, d3cl: d3ecl): d3ecl = let
//
val
loc0 = d3cl.loc()
val-
D3Cinclude
( tok
, src, knd
, fopt, dopt) = d3cl.node()
//
val dopt =
(
case+ dopt of
| None() =>
  None((*void*))
| Some(d3cs) =>
  Some(trans33_declist(env0, d3cs))
) : d3eclistopt // end-of-val
//
in
//
d3ecl_make_node
( loc0
, D3Cinclude(tok, src, knd, fopt, dopt))
//
end // end of [aux_include]

(* ****** ****** *)

fun
aux_staload
( env0:
! abstenv
, d3cl: d3ecl): d3ecl = let
//
val
loc0 = d3cl.loc()
val-
D3Cstaload
( tok, src
, knd, flag
, fopt, mopt) = d3cl.node()
//
val () =
(
case+ mopt of
|
None() => ()
|
Some(menv) =>
let
val dopt =
fmodenv_get_d3eclist(menv)
in
case- dopt of
|
Some(d3cs) =>
let
val
d3cs = $UN.cast(d3cs)
val
d3cs = trans33_declist(env0, d3cs)
val
htbl = t3imptbl_make_d3eclist(d3cs)
in
fmodenv_set_d3eclist(menv, $UN.cast(d3cs));
fmodenv_set_t3imptbl(menv, $UN.cast(htbl));
end
end // end of [Some]
)
//
in
//
d3ecl_make_node
( loc0
, D3Cstaload(tok, src, knd, flag, fopt, mopt))
//
end // end of [aux_staload]

(* ****** ****** *)

local

in(*in-of-local*)

(* ****** ****** *)

fun
aux_absopen
( env0:
! abstenv
, d3cl: d3ecl): d3ecl =
(
  d3cl
) where
{
val () =
abstenv_push_open(env0, d3cl)
} // end of [aux_absopen]

(* ****** ****** *)

fun
aux_absimpl
( env0:
! abstenv
, d3cl: d3ecl): d3ecl =
(
  d3cl
) where
{
val () =
abstenv_push_impl(env0, d3cl)
} // end of [aux_absimpl]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

fun
aux_fundclst
( env0:
! abstenv
, d3cl: d3ecl): d3ecl =
let
//
fun
auxf3d0
( env0:
! abstenv
, f3d0
: d3fundecl
) : d3fundecl =
let
val+
D3FUNDECL(rcd) = f3d0
//
val loc = rcd.loc
val nam = rcd.nam
val d2c = rcd.d2c
val f2g = rcd.f2g
val f3g = rcd.f3g
val res = rcd.res
val def = rcd.def
val rtp = rcd.rtp
val wtp = rcd.wtp
val ctp = rcd.ctp
//
val
f3g =
(
case+ f3g of
|
None() => None()
|
Some(f3as) =>
Some
(trans33_farglst(env0, f3as))
) : f3arglstopt
val
def =
trans33_dexpopt_dntp(env0, def, rtp)
//
in
D3FUNDECL(
@{
 loc=loc
,nam=nam,d2c=d2c
,f2g=f2g,f3g=f3g
,res=res,def=def,rtp=rtp,wtp=wtp,ctp=ctp}
) (* D3FUNDECL *)
end // end of [auxf3d0]
and
auxf3ds
( env0:
! abstenv
, f3ds
: d3fundeclist
) : d3fundeclist =
list_vt2t
(
list_map<d3fundecl><d3fundecl>(f3ds)
) where
{
val
env0 =
$UN.castvwtp1{ptr}(env0)
implement
list_map$fopr<d3fundecl><d3fundecl>
  (f3d0) =
let
val env0 =
$UN.castvwtp0{abstenv}(env0)
val f3d0 = auxf3d0(env0, f3d0)
in
let prval () = $UN.cast2void(env0) in f3d0
end
end
}
//
in
let
val
loc0 = d3cl.loc()
val-
D3Cfundclst
( knd
, mopt
, tqas, f3ds) = d3cl.node()
//
val f3ds = auxf3ds(env0, f3ds)
//
in
d3ecl_make_node
(loc0, D3Cfundclst(knd, mopt, tqas, f3ds))
end
end // end of [aux_fundclst]

(* ****** ****** *)

fun
aux_valdclst
( env0:
! abstenv
, d3cl: d3ecl): d3ecl =
let
//
fun
auxv3d0
( env0:
! abstenv
, v3d0
: d3valdecl
)
: d3valdecl =
let
//
val+
D3VALDECL(rcd) = v3d0
//
val loc = rcd.loc
val pat = rcd.pat
val def = rcd.def
val wtp = rcd.wtp
//
val pat =
trans33_dpat(env0, pat)
val def =
(
case+ def of
|
None() => None()
|
Some(d3e0) =>
let
val tres = pat.type()
in
Some
(
trans33_dexp_dntp(env0, d3e0, tres)
)
end
) : d3expopt // end-of-val
//
in
D3VALDECL
(@{loc=loc,pat=pat,def=def,wtp=wtp})
end // end of [auxv3d0]
and
auxv3ds
( env0:
! abstenv
, v3ds
: d3valdeclist
)
: d3valdeclist =
list_vt2t
(
list_map<d3valdecl><d3valdecl>(v3ds)
) where
{
val
env0 =
$UN.castvwtp1{ptr}(env0)
implement
list_map$fopr<d3valdecl><d3valdecl>
  (v3d0) =
let
val env0 =
$UN.castvwtp0{abstenv}(env0)
val v3d0 = auxv3d0(env0, v3d0)
in
let
prval() = $UN.cast2void(env0) in v3d0
end
end
} (* end of [auxv3ds] *)
//
in
let
val
loc0 = d3cl.loc()
//
val-
D3Cvaldclst
( knd
, mopt
, v3ds) = d3cl.node()
//
val
v3ds = auxv3ds(env0, v3ds)
in
d3ecl_make_node
( loc0, D3Cvaldclst(knd, mopt, v3ds) )
end
end (*let*) // end of [aux_valdclst]

(* ****** ****** *)

fun
aux_vardclst
( env0:
! abstenv
, d3cl: d3ecl): d3ecl =
let
//
in
let
val
loc0 = d3cl.loc()
val-
D3Cvardclst
( knd
, mopt
, v3ds) = d3cl.node()
val
v3ds = auxv3ds(env0, d3cl, v3ds)
in
  d3ecl_make_node
  (loc0, D3Cvardclst(knd, mopt, v3ds))
end
end where
{
//
fun
auxv3d0
( env0:
! abstenv
, d3cl
: d3ecl
, v3d0
: d3vardecl
) : d3vardecl = let
//
val
loc0 = d3cl.loc()
val+
D3VARDECL(rcd) = v3d0
//
val loc = rcd.loc
val d2v = rcd.d2v
val wth = rcd.wth
val res = rcd.res
val ini = rcd.ini
//
val
ini =
(
case+ ini of
|
None() =>
None((*void*))
|
Some(d3e) => Some
(
trans33_dexp_dntp(env0, d3e, tres)
)
) where // end of [val]
{
val
tres =
(
case+ res of
| Some(s2e) => s2exp_erase(s2e)
| None((*void*)) => t2ype_new(loc0)
) : t2ype (* end-of-val: tres *)
//
val () =
d2var_set_type(d2v, t2ype_lft(tres))
//
}
//
in
D3VARDECL(
@{
loc=loc,d2v=d2v,wth=wth,res=res,ini=ini}
) (* D3VARDECL *)
end // end of [auxv3d0]
//
fun
auxv3ds
( env0:
! abstenv
, d3cl: d3ecl
, v3ds
: d3vardeclist
)
: d3vardeclist =
(
case+ v3ds of
|
list_nil() =>
list_nil()
|
list_cons(x0, xs) =>
list_cons
(auxv3d0(env0, d3cl, x0), auxv3ds(env0, d3cl, xs))
)
//
} (*where*) // end of [aux_vardclst]

(* ****** ****** *)

local

fun
auxid2c
( id2c
: impld2cst
, tfun
: t2ype): impld2cst =
let
//
(*
val () =
println!
("auxid2c: id2c = ", id2c)
*)
//
val-
IMPLD2CST1(dqid, d2cs) = id2c
//
in
//
(
case+ opt0 of
| ~
None_vt() =>
IMPLD2CST2(dqid, d2cs, None())
| ~
Some_vt(x0) =>
IMPLD2CST2(dqid, d2cs, Some(x0))
) where
{
val
opt0 =
match2_d2cstlst_t2ype(d2cs, tfun)
}
//
end // end of [auxid2c]

fun
auxtfun
( d3cl
: d3ecl
, f3as
: f3arglst
, tres
: t2ype
, flag: int): t2ype =
(
case+ f3as of
|
list_nil() => tres
|
list_cons(x0, xs) =>
(
  case-
  x0.node() of
  | F3ARGsome_dyn
    (npf1, d3ps) =>
    let
(*
      val fc2 =
      ( if
        flag = 0
        then
        FC2fun(*void*)
        else
        FC2cloref(*void*)
      ) : funclo2 // end-of-val
*)
      val loc0 = d3cl.loc()
      val t2ps =
      d3patlst_get_type(d3ps)
      val tres =
      auxtfun(d3cl, xs, tres, flag+1)
    in
      t2ype_fun0(loc0, npf1, t2ps, tres)
    end
  | F3ARGsome_sta
    (s2vs, s2ps) =>
    let
      val
      tres =
      auxtfun
      (d3cl,xs,tres,flag) in t2ype_uni(s2vs,tres)
    end
  | F3ARGsome_met(s2es) => auxtfun(d3cl, xs, tres, flag)
)
) (* end of [auxtfun] *)

in (* in-of-local *)

fun
aux_implmnt1
( env0:
! abstenv
, d3cl: d3ecl): d3ecl =
let
//
val-
D3Cimplmnt1
( knd
, stmp, mopt
, sqas, tqas
, idc1
, ti3a, tias
, f3as
, res0, d3e0) = d3cl.node()
//
(*
val () =
println!
("aux_implmnt1: idc1 = ", idc1)
*)
//
val
tres = d3e0.type()
val
f3as =
trans33_farglst(env0, f3as)
val
d3e0 =
trans33_dexp_dntp(env0, d3e0, tres)
//
in
d3ecl_make_node
(
d3cl.loc()
,
D3Cimplmnt3
( knd
, stmp, mopt
, sqas, tqas
, idc1, ti3a, tias, f3as, res0, d3e0))
end // end of [aux_implmnt1]

(* ****** ****** *)

fun
aux_implmnt2
( env0:
! abstenv
, d3cl: d3ecl): d3ecl =
let
//
val-
D3Cimplmnt2
( knd
, stmp, mopt
, sqas, tqas
, idc1
, ti3a, tias
, f3as
, res0, d3e0) = d3cl.node()
//
(*
val () =
println!
("aux_implmnt2: d3cl = ", d3cl)
val () =
println!
("aux_implmnt2: idc1 = ", idc1)
*)
//
val
tres = d3e0.type()
val
f3as =
trans33_farglst(env0, f3as)
val
tfun =
auxtfun(d3cl, f3as, tres, 0)
//
val
id2c = auxid2c(idc1, tfun)
val-
IMPLD2CST2(dqid, d2cs, d2ct) = id2c
//
in
//
case+
d2ct of
|
None() =>
d3ecl_make_node
( d3cl.loc()
,
  D3Cimplmnt2
  ( knd
  , stmp, mopt
  , sqas, tqas
  , idc1, ti3a, tias, f3as, res0, d3e0
  ) (* d3ecl_make_node *)
)
//
|
Some(d2c0) =>
let
//
val
loc0 =
(
case- id2c of
|
IMPLD2CST2
(dqid, _, _) =>
let
val
loc1 = dqid.loc()
in
case+ tias of
|
list_nil
((*void*)) => loc1
|
list_cons _ =>
(
  loc1 + ti2a.loc()
) where
{
  val ti2a = list_last(tias)
} (* list_cons *)
end
) : loc_t // end of [val]
//
(*
//
// HX: [tias] is already
val // computed in trans23
tias =
join_ti2as_tq2as(tias, tqas)
*)
val
tias =
d2cst_ti2as_dnst(d2c0, tias)
val
ti3a =
d2cst_ti2as_ti3a(loc0,d2c0,tias)
val
tfun =
(
let
//
val
tfun = d2c0.type()
val
s2vs = d2cst_get_s2vs(d2c0)
//
in
case+ s2vs of
|
list_nil() => tfun
|
list_cons(_, _) =>
(
case+ ti3a of
|
TI3ARGnone() => tfun
|
TI3ARGsome(t2ps) =>
t2ype_subst_svarlst(tfun, s2vs, t2ps)
)
end
) : t2ype // end-of-val
//
val
(
f3as
,
tres) =
t2ype_f3arg_elim
(loc0, env0, tfun, f3as)
//
val
d3e0 =
trans33_dexp_dntp(env0, d3e0, tres)
//
in
d3ecl_make_node
( d3cl.loc()
,
  D3Cimplmnt3
  ( knd
  , stmp, mopt
  , sqas, tqas
  , id2c, ti3a, tias, f3as, res0, d3e0)
) (* d3ecl_make_node *)
end (* IMPLD3CSTsome *)
//
end // end of [aux_implmnt2]

end (*local*) // end of [local]

(* ****** ****** *)

in (* in-of-local *)

implement
trans33_decl
(env0, d3cl) = let
//
val loc0 = d3cl.loc()
//
(*
val ((*void*)) =
println!
("trans33_decl: loc0 = ", loc0)
val ((*void*)) =
println!
("trans33_decl: d3cl = ", d3cl)
*)
//
in
//
case+
d3cl.node() of
//
| D3Cd2ecl _ => d3cl
//
|
D3Cstatic
(tok0, d3c1) =>
(
  d3ecl_make_node
  (loc0, D3Cstatic(tok0, d3c1))
) where
{
  val
  d3c1 = trans33_decl(env0, d3c1)
}
|
D3Cextern
(tok0, d3c1) =>
(
  d3ecl_make_node
  (loc0, D3Cextern(tok0, d3c1))
) where
{
  val
  d3c1 = trans33_decl(env0, d3c1)
}
//
(* ****** ****** *)
//
| D3Cdclst
(   dcls   ) => let
//
  overload
  d3ecl
  with d3ecl_make_node
//
  val
  dcls =
  trans33_declist(env0, dcls)
//
in//let
(
  d3ecl(loc0, D3Cdclst(dcls)) )
end//let//end-of-[D3Cdclst(dcls)]
//
(* ****** ****** *)
//
| D3Clocal
( head, body ) => let
//
  overload
  d3ecl
  with d3ecl_make_node
//
  val () =
  abstenv_add_loc1(env0)
  val
  head =
  trans33_declist(env0, head)
//
  val () =
  abstenv_add_loc2(env0)
  val
  body =
  trans33_declist(env0, body)
//
in//let
//
let
  val () =
  abstenv_pop_loc12(env0)
in//let
  d3ecl(loc0, D3Clocal(head, body))
end//let
//
end // let // end-of-[D3Clocal(head,body)]
//
(* ****** ****** *)
//
| D3Cinclude _ =>
  let
  val d3cl =
  aux_include(env0, d3cl) in d3cl
  end
| D3Cstaload _ => let
  val d3cl =
  aux_staload(env0, d3cl) in d3cl
  end
//
(* ****** ****** *)
//
| D3Cabstype _ => d3cl
| D3Cabsopen _ => aux_absopen(env0, d3cl)
| D3Cabsimpl _ => aux_absimpl(env0, d3cl)
//
| D3Cfundclst _ => aux_fundclst(env0, d3cl)
//
| D3Cvaldclst _ => aux_valdclst(env0, d3cl)
| D3Cvardclst _ => aux_vardclst(env0, d3cl)
//
| D3Cimplmnt1 _ => aux_implmnt1(env0, d3cl)
| D3Cimplmnt2 _ => aux_implmnt2(env0, d3cl)
//
| D3Cnone0 _(*...*) => d3cl
| D3Cnone1 _(*...*) => d3cl
//
| _ (* rest-of-d3ecl *) => d3cl // HX: YTBI
//
end // end of [trans33_decl]

end // end of [local]

(* ****** ****** *)

implement
trans33_declist
  (env0, dcls) =
list_vt2t
(
list_map<d3ecl><d3ecl>(dcls)
) where
{
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
implement
list_map$fopr<d3ecl><d3ecl>
  (dcl0) =
let
val env0 =
$UN.castvwtp0{abstenv}(env0)
val dcl0 = trans33_decl(env0, dcl0)
in
let prval () = $UN.cast2void(env0) in dcl0
end
end
} (* end of [trans33_declist] *)

(* ****** ****** *)

(* end of [xats_trans33_dynexp.dats] *)
