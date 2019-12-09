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
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload "./../SATS/basics.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp0.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans23.sats"
#staload "./../SATS/trans33.sats"

(* ****** ****** *)

implement
fprint_val<tq2arg> = fprint_tq2arg
implement
fprint_val<ti2arg> = fprint_ti2arg

(* ****** ****** *)

local

fun
auxsym0
( d3p0
: d3pat): d3pat =
let
//
val
loc0 = d3p0.loc()
val-
D3Psym0
(d1p1, dpis) = d3p0.node()
//
val
t2p0 = d3p0.type()
(*
val () =
println!
("auxsym0: t2p0 = ", t2p0)
*)
//
val opt0 =
match_d2pconlst_t2ype(dpis, t2p0)
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
    unify_d2con_t2ype(loc0, d2c1, t2p0)
  }
)
end // end of [auxsym0]

(* ****** ****** *)

fun
auxdapp
( d3p0
: d3pat): d3pat =
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
d3f0 = trans33_dpat(d3f0)
val
d3ps = trans33_dpatlst(d3ps)
//
in
d3pat_dapp_up(loc0, d3f0, npf1, d3ps)
end // end of [auxdapp]

(* ****** ****** *)

fun
aux_tuple
( d3p0
: d3pat): d3pat =
let
//
val
loc0 = d3p0.loc()
//
val-
D3Ptuple
( knd0
, npf1
, d3ps) = d3p0.node()
//
val d3ps = trans33_dpatlst(d3ps)
//
in
d3pat_tuple_up(loc0, knd0, npf1, d3ps)
end // end of [aux_tuple]

in (* in-of-local *)

implement
trans33_dpat
  (d3p0) = let
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
| D3Psym0 _ => auxsym0(d3p0)
//
| D3Pdapp _ => auxdapp(d3p0)
//
| D3Ptuple _ => aux_tuple(d3p0)
//
| D3Pnone0 _ => d3p0
| D3Pnone1 _ => d3p0
//
| _ (* rest-of-d3pat *) => d3p0
//
end // end of [trans33_dpat]

end // end of [local]

(* ****** ****** *)

implement
trans33_dpatlst
  (d3ps) =
list_vt2t(d3ps) where
{
val
d3ps =
list_map<d3pat><d3pat>
  (d3ps) where
{
implement
list_map$fopr<d3pat><d3pat>(d3p) = trans33_dpat(d3p)
}
} (* end of [trans33_dpatlst] *)

(* ****** ****** *)
//
implement
trans33_dpat_dn
  (d3p0, t2p0) =
(
d3pat_dn(d3p0, t2p0)
) where
{
  val d3p0 = trans33_dpat(d3p0)
}
//
(* ****** ****** *)
//
implement
trans33_dpatlst_dn
  (d3ps, t2ps) =
(
  auxlst(d3ps, t2ps)
) where
{
fun
auxlst
( d3ps: d3patlst
, t2ps: t2ypelst): d3patlst =
(
case+ d3ps of
| list_nil() =>
  list_nil()
| list_cons
  (d3p0, d3ps) =>
  (
  case+ t2ps of
  | list_nil() =>
    (
      list_cons(d3p0, d3ps)
    ) where
    {
      val t2p0 =
      the_t2ype_none0
      val d3p0 =
      trans33_dpat_dn(d3p0, t2p0)
      val d3ps = auxlst(d3ps, t2ps)
    }
  | list_cons
    (t2p0, t3ps) =>
    (
      list_cons(d3p0, d3ps)
    ) where
    {
      val d3p0 =
      trans33_dpat_dn(d3p0, t2p0)
      val d3ps = auxlst(d3ps, t2ps)
    }    
  )
) (* end of [auxlst] *)
} (* end of [trans33_dpatlst_dn] *)
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
  d3exp_make_node
  (loc0, t2p1, D3Evar(d2v1))
) where
{
val t2p1 = d2v1.type((*void*))
}
fun
d2con_up
( loc0: loc_t
, d2c1: d2con): d3exp =
(
  d3exp_make_node
  (loc0, t2p1, D3Econ1(d2c1))
) where
{
val t2p1 = d2c1.type((*void*))
}
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
d3exp_make_node
(loc0, t2p1, D3Efcst(d2c1))
|
TI3ARGsome _ =>
d3exp_make_node
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
match_d2con_t2ype(d2c1, t2p0)
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
val
t2p0 = d3e0.type()
(*
val () =
println!
("auxcst1: t2p0 = ", t2p0)
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
match_d2cst_t2ype(d2c1, t2p0)
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
match_d2conlst_t2ype(d2cs, t2p0)
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
match_d2cstlst_t2ype(d2cs, t2p0)
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
val opt0 =
match_d2pitmlst_t2ype(dpis, t2p0)
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
( d3e0
: d3exp): d3exp =
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
d3f0 = trans33_dexp(d3f0)
//
in
d3exp_sapp_up(loc0, d3f0, s2es)
end // end of [auxsap0]

fun
auxsap1
( d3e0
: d3exp): d3exp =
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
d3f0 = trans33_dexp(d3f0)
//
in
d3exp_sapp_up(loc0, d3f0, s2es)
end // end of [auxsap1]

(* ****** ****** *)

fun
auxtapp
( d3e0
: d3exp): d3exp =
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
d3exp_tapp_up(loc0, d2f0, s2es)
end // end of [auxtapp]

(* ****** ****** *)

fun
auxdapp
( d3e0
: d3exp): d3exp =
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
D3Edtsel _ =>
(
  auxdapp2(d3e0)
)
|
_(* else *) =>
let
val
d3f0 = trans33_dexp(d3f0)
val
d3es = trans33_dexplst(d3es)
in
d3exp_dapp_up(loc0, d3f0, npf1, d3es)
end
//
end // end of [auxdapp]

and
auxdapp2
( d3e0
: d3exp): d3exp =
let
//
val
loc0 = d3e0.loc()
val-
D3Edapp
( d3f0
, npf1, d3es) = d3e0.node()
val-
D3Edtsel
( lab0
, dpis
, npf2, opt3) = d3f0.node()
//
in
//
case- opt3 of
|
None() =>
let
val-
list_cons(d3e1, _) = d3es
in
  d3exp_proj_up(loc0, d3e1, lab0)
end // end of [None]
(*
|
Some(arg3) =>
*)
//
end // end of [auxdapp2]

(* ****** ****** *)

fun
aux_tuple
( d3e0
: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Etuple
( knd1
, npf2
, d3es) = d3e0.node()
//
val
d3es = trans33_dexplst(d3es)
//
in
d3exp_tuple_up(loc0, knd1, npf2, d3es)
end // end of [aux_tuple]

(* ****** ****** *)

fun
aux_let
( d3e0
: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Elet
( d3cs
, d3e1) = d3e0.node()
//
val
d3cs = trans33_declist(d3cs)
//
in
let
val
d3e1 =
trans33_dexp(d3e1)
val
t2p1 = d3e1.type((*void*))
in
  d3exp_make_node
  (loc0, t2p1, D3Elet(d3cs, d3e1))
end
end (* end of [aux_let] *)

(* ****** ****** *)

fun
aux_where
( d3e0
: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Ewhere
( d3e1
, d3cs) = d3e0.node()
//
val
d3cs = trans33_declist(d3cs)
//
in
let
val
d3e1 =
trans33_dexp(d3e1)
val
t2p1 = d3e1.type()
in
  d3exp_make_node
  (loc0, t2p1, D3Ewhere(d3e1, d3cs))
end
end (* end of [aux_where] *)

(* ****** ****** *)

fun
aux_assgn
( d3e0
: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Eassgn
( d3e1
, d3e2) = d3e0.node()
//
val d3e1 = trans33_dexp(d3e1)
val d3e2 = trans33_dexp(d3e2)
//
in
  d3exp_a33gn_up(loc0, d3e1, d3e2)
end // end of [aux_assgn]

(* ****** ****** *)

fun
aux_if0
( d3e0
: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Eif0
( d3e1
, d3e2, opt3) = d3e0.node()
//
val d3e1 = trans33_dexp(d3e1)
val d3e2 = trans33_dexp(d3e2)
val opt3 = trans33_dexpopt(opt3)
//
in
d3exp_if0_up(loc0, d3e1, d3e2, opt3)
end (* end of [aux_if0] *)

(* ****** ****** *)

fun
aux_case
( d3e0
: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Ecase
( knd0
, d3e1, dcls) = d3e0.node()
//
val tres = t2ype_new(loc0)
val d3e1 = trans33_dexp(d3e1)
val dcls =
  trans33_dclaulst_dn(dcls, tres)
//
in
d3exp_make_node
(loc0, tres, D3Ecase(knd0, d3e1, dcls))
end (* end of [aux_case] *)

(* ****** ****** *)

fun
aux_lam
( d3e0
: d3exp): d3exp = let
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
trans33_farglst(f3as)
val
body = trans33_dexp(body)
//
in
d3exp_lam_up
(loc0, knd0, f3as, tres, arrw, body)
end // end of [aux_lam]

(* ****** ****** *)

fun
aux_fix
( d3e0
: d3exp): d3exp = let
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
trans33_farglst(f3as)
val
body = trans33_dexp(body)
//
in
d3exp_fix_up
(loc0, knd0, d2v0, f3as, tres, arrw, body)
end // end of [aux_fix]

(* ****** ****** *)

fun
aux_addr
( d3e0
: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Eaddr(d3e1) = d3e0.node()
//
val d3e1 = trans33_dexp(d3e1)
//
val t2p0 =
t2ype_app1(the_t2ype_p2tr, d3e1.type())
//
in
d3exp_make_node(loc0, t2p0, D3Eaddr(d3e1))
end // end of [aux_addr]

(* ****** ****** *)

fun
aux_fold
( d3e0
: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Efold(d3e1) = d3e0.node()
//
val d3e1 = trans33_dexp(d3e1)
//
val t2p0 = the_t2ype_void(*void*)
//
in
d3exp_make_node(loc0, t2p0, D3Efold(d3e1))
end // end of [aux_fold]

(* ****** ****** *)

fun
aux_anno
( d3e0
: d3exp): d3exp = let
//
val
loc0 = d3e0.loc()
val-
D3Eanno
(d3e1, s2e2) = d3e0.node()
//
val t2p2 = d3e0.type()
(*
val t2p2 = s2exp_erase(s2e2)
*)
val d3e1 = trans33_dexp_dn(d3e1, t2p2)
//
in
d3exp_make_node
(loc0, d3e1.type(), D3Eanno(d3e1, s2e2))
end // end of [aux_anno]

(* ****** ****** *)

in (* in-of-local *)

implement
trans33_dexp
  (d3e0) = let
//
(*
val loc0 = d3e0.loc()
*)
(*
val ((*void*)) =
println!
("trans33_dexp: d3e0 = ", d3e0)
*)
//
in
//
case+
d3e0.node() of
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
| D3Esap0 _ => auxsap0(d3e0)
| D3Esap1 _ => auxsap1(d3e0)
//
| D3Etapp _ => auxtapp(d3e0)
//
| D3Edapp _ => auxdapp(d3e0)
//
| D3Etuple _ => aux_tuple(d3e0)
//
| D3Elet _ => aux_let(d3e0)
| D3Ewhere _ => aux_where(d3e0)
//
(*
| D3Eseqn _ => aux_seqn(d3e0)
*)
//
| D3Eassgn _ => aux_assgn(d3e0)
//
| D3Eif0
    (_, _, _) => aux_if0(d3e0)
  // D3Eif0
//
| D3Ecase
    (_, _, _) => aux_case(d3e0)
  // D3Ecase
//
| D3Elam
  (_, _, _, _, _) => aux_lam(d3e0)
  // D3Elam
| D3Efix
  (_, _, _, _, _, _) => aux_fix(d3e0)
  // D3Efix
//
| D3Eaddr(d3e1) => aux_addr(d3e0)
| D3Efold(d3e1) => aux_fold(d3e0)
//
| D3Eanno
    (d3e1, s2e2) => aux_anno(d3e0)
//
| D3Enone0 _ => d3e0
| D3Enone1 _ => d3e0
//
| _ (* rest-of-d3exp *) => d3e0
//
end // end of [trans33_dexp]

end // end of [local]

(* ****** ****** *)
//
implement
trans33_dexp_dn
  (d3e0, t2p0) =
(
  d3exp_dn(d3e0, t2p0)
) where
{
  val d3e0 = trans33_dexp(d3e0)
}
//
(* ****** ****** *)

implement
trans33_dexpopt
  (opt) =
(
case+ opt of
| None() => None()
| Some(d3e) => Some(trans33_dexp(d3e))
) (* end of [trans33_dexpopt] *)

implement
trans33_dexplst
  (d3es) =
list_vt2t(d3es) where
{
val
d3es =
list_map<d3exp><d3exp>
  (d3es) where
{
implement
list_map$fopr<d3exp><d3exp>(d3e) = trans33_dexp(d3e)
}
} (* end of [trans33_dexplst] *)

(* ****** ****** *)
//
implement
trans33_dgua
  (d3g0) =
let
val loc0 = d3g0.loc()
in
case+
d3g0.node() of
| D3GUAexp(d3e1) =>
  let
    val
    d3e1 = trans33_dexp(d3e1)
  in
    d3gua_make_node(loc0, D3GUAexp(d3e1))
  end
| D3GUAmat(d3e1, d3p2) =>
  let
    val d3e1 = trans33_dexp(d3e1)
    val d3p2 = trans33_dpat(d3p2)
  in
    d3gua_make_node(loc0, D3GUAmat(d3e1, d3p2))
  end
end
//
implement
trans33_dgualst
  (d3gs) =
list_vt2t(d3gs) where
{
val
d3gs =
list_map<d3gua><d3gua>
  (d3gs) where
{
  implement
  list_map$fopr<d3gua><d3gua>(d3g) = trans33_dgua(d3g)
}
} (* end of [trans33_dgualst] *)
//
(* ****** ****** *)
//
implement
trans33_dgpat
  (d3gp) =
let
val loc0 = d3gp.loc()
in
//
case+
d3gp.node() of
| D3GPATpat(d3p1) =>
  (
  d3gpat_make_node
  (loc0, D3GPATpat(d3p1))
  ) where
  {
    val
    d3p1 = trans33_dpat(d3p1)
  }
| D3GPATgua(d3p1, d3gs) =>
  (
  d3gpat_make_node
  (loc0, D3GPATgua(d3p1, d3gs))
  ) where
  {
    val
    d3p1 = trans33_dpat(d3p1)
    val
    d3gs = trans33_dgualst(d3gs)
  }
//
end // end of [trans33_d3gpat]
//
implement
trans33_dclau_dn
  (d3cl, tres) =
let
val loc0 = d3cl.loc()
in
case+
d3cl.node() of
| D3CLAUpat(d3gp) =>
  (
  d3clau_make_node
  (loc0, D3CLAUpat(d3gp))
  ) where
  {
    val
    d3gp = trans33_dgpat(d3gp)
  }
| D3CLAUexp(d3gp, d3e2) =>
  (
  d3clau_make_node
  (loc0, D3CLAUexp(d3gp, d3e2))
  ) where
  {
    val
    d3gp = trans33_dgpat(d3gp)
    val
    d3e2 = trans33_dexp_dn(d3e2, tres)
  }
end // end of [trans33_dclau_dn]
//
implement
trans33_dclaulst_dn
  (d3cs, tres) =
list_vt2t(d3cs) where
{
val
d3cs =
list_map<d3clau><d3clau>
  (d3cs) where
{
implement
list_map$fopr<d3clau><d3clau>(d3cl) = trans33_dclau_dn(d3cl, tres)
}
} (* end of [trans33_dclaulst] *)
//
(* ****** ****** *)
//
implement
trans33_farg
  (f3a0) =
(
case+
f3a0.node() of
| F3ARGsome_dyn
  (npf, d3ps) =>
  (
  f3arg_make_node
  ( f3a0.loc()
  , F3ARGsome_dyn(npf, d3ps))
  ) where
  {
    val
    d3ps = trans33_dpatlst(d3ps)
  }
//
| _(*non-F3ARGsome_dyn*) => f3a0
)
//
implement
trans33_farglst
  (f3as) =
list_vt2t(f3as) where
{
val
f3as =
list_map<f3arg><f3arg>
  (f3as) where
{
  implement
  list_map$fopr<f3arg><f3arg>(f3a) = trans33_farg(f3a)
}
} (* end of [trans33_farglst] *)
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_include
( d3cl
: d3ecl): d3ecl = let
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
  Some(trans33_declist(d3cs))
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
aux_valdecl
( d3cl
: d3ecl): d3ecl =
let
//
val-
D3Cvaldecl
( knd
, mopt
, v3ds) = d3cl.node()
//
fun
auxv3d0
( v3d0
: v3aldecl
)
: v3aldecl =
let
val+
V3ALDECL(rcd) = v3d0
//
val loc = rcd.loc
val pat = rcd.pat
val def = rcd.def
val wtp = rcd.wtp
//
val pat =
trans33_dpat(pat)
val def =
(
case+ def of
| None() =>
  None()
| Some(d3e0) =>
  let
  val tres = pat.type()
  in
  Some(trans33_dexp_dn(d3e0, tres))
  end
) : d3expopt // end-of-val
//
in
V3ALDECL(@{loc=loc,pat=pat,def=def,wtp=wtp})
end // end of [auxv3d0]
and
auxv3ds
( v3ds
: v3aldeclist
)
: v3aldeclist =
list_vt2t
(
list_map<v3aldecl><v3aldecl>(v3ds)
) where
{
implement
list_map$fopr<v3aldecl><v3aldecl>(x0) = auxv3d0(x0)
}
//
val v3ds = auxv3ds(v3ds)
//
in
d3ecl_make_node
( d3cl.loc()
, D3Cvaldecl(knd, mopt, v3ds))
end // end of [aux_valdecl]

(* ****** ****** *)

fun
aux_vardecl
( d3cl
: d3ecl): d3ecl = let
//
val
loc0 = d3cl.loc()
val-
D3Cvardecl
( knd
, mopt
, v3ds) = d3cl.node()
//
val
v3ds = auxv3ds(d3cl, v3ds)
//
in
  d3ecl_make_node
  (loc0, D3Cvardecl(knd, mopt, v3ds))
end where
{
//
fun
auxv3d0
( d3cl
: d3ecl
, v3d0
: v3ardecl
) : v3ardecl = let
//
val
loc0 = d3cl.loc()
val+
V3ARDECL(rcd) = v3d0
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
Some(d3e) =>
Some
(trans33_dexp_dn(d3e, tres))
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
V3ARDECL(
@{
loc=loc,d2v=d2v,wth=wth,res=res,ini=ini}
) (* V3ARDECL *)
end // end of [auxv3d0]
//
fun
auxv3ds
( d3cl: d3ecl
, v3ds
: v3ardeclist
)
: v3ardeclist =
(
case+ v3ds of
| list_nil() =>
  list_nil()
| list_cons(x0, xs) =>
  list_cons
  (auxv3d0(d3cl, x0), auxv3ds(d3cl, xs))
)
//
} (* end of [aux_vardecl] *)

(* ****** ****** *)

fun
aux_fundecl
( d3cl
: d3ecl): d3ecl =
let
//
val-
D3Cfundecl
( knd
, mopt
, tqas, f3ds) = d3cl.node()
//
fun
auxf3d0
( f3d0
: f3undecl
)
: f3undecl =
let
val+
F3UNDECL(rcd) = f3d0
//
val loc = rcd.loc
val nam = rcd.nam
val a2g = rcd.a2g
val a3g = rcd.a3g
val res = rcd.res
val d2c = rcd.d2c
val def = rcd.def
val wtp = rcd.wtp
val ctp = rcd.ctp
//
val a3g =
(
case+ a3g of
| None() => None()
| Some(f3as) =>
  Some(trans33_farglst(f3as))
) : f3arglstopt
val def =
trans33_dexpopt(def)
//
in
F3UNDECL(
@{
 loc=loc
,nam=nam,d2c=d2c
,a2g=a2g,a3g=a3g
,res=res,def=def,wtp=wtp,ctp=ctp}
) (* F3UNDECL *)
end // end of [auxf3d0]
and
auxf3ds
( f3ds
: f3undeclist
)
: f3undeclist =
list_vt2t
(
list_map<f3undecl><f3undecl>(f3ds)
) where
{
implement
list_map$fopr<f3undecl><f3undecl>(x0) = auxf3d0(x0)
}
//
val f3ds = auxf3ds(f3ds)
//
in
d3ecl_make_node
( d3cl.loc()
, D3Cfundecl(knd, mopt, tqas, f3ds))
end // end of [aux_fundecl]

(* ****** ****** *)

fun
aux_impdecl1
( d3cl
: d3ecl): d3ecl =
let
val-
D3Cimpdecl1
( knd
, mopt
, sqas, tqas
, id2c, ti3a, tias
, f3as, res0, d3e0) = d3cl.node()
//
val
f3as = trans33_farglst(f3as)
//
val d3e0 = trans33_dexp(d3e0)
//
in
d3ecl_make_node
( d3cl.loc()
, D3Cimpdecl3
  ( knd, mopt
  , sqas, tqas
  , id2c, ti3a, tias, f3as, res0, d3e0))
end // end of [aux_impdecl1]

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
val-
IMPLD2CST1(dqid, d2cs) = id2c
//
in
//
(
case+ opt0 of
|
~None_vt() =>
 IMPLD2CST2(dqid, d2cs, None())
|
~Some_vt(x0) =>
 IMPLD2CST2(dqid, d2cs, Some(x0))
) where
{
  val
  opt0 =
  match_d2cstlst_t2ype(d2cs, tfun)
}
//
end // end of [auxid3c]

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
| list_nil() => tres
| list_cons(x0, xs) =>
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
aux_impdecl2
( d3cl
: d3ecl): d3ecl =
let
val-
D3Cimpdecl2
( knd
, mopt
, sqas, tqas
, id2c, ti3a, tias
, f3as, res0, d3e0) = d3cl.node()
//
val
tres = d3e0.type()
val
f3as =
trans33_farglst(f3as)
val
tfun =
auxtfun
(d3cl, f3as, tres, 0)
//
val
id2c =
auxid2c(id2c, tfun)
val-
IMPLD2CST2
(dqid, d2cs, d2ct) = id2c
//
in
//
case+
d2ct of
|
None() =>
let
val
d3e0 = trans33_dexp(d3e0)
in
d3ecl_make_node
( d3cl.loc()
, D3Cimpdecl2
  ( knd, mopt
  , sqas, tqas
  , id2c, ti3a, tias, f3as, res0, d3e0))
end // IMPLD3CSTnone
//
|
Some(d2c0) =>
let
//
val
loc0 =
(
case- id2c of
| IMPLD2CST2
  (dqid, _, _) =>
  let
  val loc1 = dqid.loc()
  in
  case+ tias of
  | list_nil
    ((*void*)) => loc1
  | list_cons _ =>
    (
      loc1 + ti2a.loc()
    ) where
    {
      val
      ti2a = list_last(tias)
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
ti3a =
d2cst_ti2as_ti3a(loc0,d2c0,tias)
val
tfun =
(
let
//
val tfun = d2c0.type()
val s2vs = d2cst_get_s2vs(d2c0)
//
in
case+ s2vs of
| list_nil _ => tfun
| list_cons _ =>
  (
  case+ ti3a of
  | TI3ARGnone() => tfun
  | TI3ARGsome(t2ps) =>
    t2ype_substs(tfun, s2vs, t2ps)
  )
end
) : t2ype // end-of-val
//
val
(f3as
,tres) =
t2ype_f3arg_elim(loc0, tfun, f3as)
//
val
d3e0 = trans33_dexp_dn(d3e0, tres)
//
in
d3ecl_make_node
( d3cl.loc()
, D3Cimpdecl3
  ( knd, mopt
  , sqas, tqas
  , id2c, ti3a, tias, f3as, res0, d3e0))
end (* IMPLD3CSTsome *)
//
end // end of [aux_impdecl2]

end // end of [local]

(* ****** ****** *)

in (* in-of-local *)

implement
trans33_decl
  (d3cl) = let
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
| D3Cstatic
  (tok0, d3c1) =>
  (
  d3ecl_make_node
  (loc0, D3Cstatic(tok0, d3c1))
  ) where
  {
    val d3c1 = trans33_decl(d3c1)
  }
| D3Cextern
  (tok0, d3c1) =>
  (
  d3ecl_make_node
  (loc0, D3Cextern(tok0, d3c1))
  ) where
  {
    val d3c1 = trans33_decl(d3c1)
  }
//
| D3Cinclude _ => aux_include(d3cl)
//
| D3Clocal
  (d3cs1, d3cs2) => let
    val
    d3cs1 = trans33_declist(d3cs1)
    val
    d3cs2 = trans33_declist(d3cs2)
  in
    d3ecl_make_node
      (loc0, D3Clocal(d3cs1, d3cs2))
    // d3ecl_make_node
  end
//
| D3Cvaldecl _ => aux_valdecl(d3cl)
//
| D3Cvardecl _ => aux_vardecl(d3cl)
//
| D3Cfundecl _ => aux_fundecl(d3cl)
//
| D3Cimpdecl1 _ => aux_impdecl1(d3cl)
| D3Cimpdecl2 _ => aux_impdecl2(d3cl)
//
| D3Cnone0 _ => d3cl
| D3Cnone1 _ => d3cl
//
| _ (* rest-of-d3ecl *) => d3cl // HX: yet-to-be-handled
//
end // end of [trans33_decl]

end // end of [local]

(* ****** ****** *)

implement
trans33_declist
  (d3cs) =
list_vt2t(d3cs) where
{
val
d3cs =
list_map<d3ecl><d3ecl>
  (d3cs) where
{
implement
list_map$fopr<d3ecl><d3ecl>(d3c) = trans33_decl(d3c)
}
} (* end of [trans33_declist] *)

(* ****** ****** *)

(* end of [xats_trans33_dynexp.dats] *)
