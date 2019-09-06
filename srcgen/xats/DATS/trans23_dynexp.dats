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
// Start Time: April, 2019
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

#staload "./../SATS/lexing.sats"

(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"

(* ****** ****** *)

#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans23.sats"

(* ****** ****** *)
//
implement
trenv23_dvar
  (d2v0) =
(
let
val loc0 = d2v0.loc()
in
  d2v0.type(t2ype_new(loc0))
end
)
implement
trenv23_dvar_dn
  (d2v0, t2p0) =
(
  d2var_set_type(d2v0, t2p0)
) where
{
(*
  val t2p1 = d2v0.type()
  val-T2Pnone0() = t2p1.node()
*)
(*
  val () =
  println!
  ("trenv23_dvar_dn: d2v0 = ", d2v0)
  val () =
  println!
  ("trenv23_dvar_dn: t2p0 = ", t2p0)
*)
} (* end of [trenv23_dvar_dn] *)
//
(* ****** ****** *)
//
local

fun
auxdapp
( d2p0
: d2pat): d3pat = let
//
val
loc0 = d2p0.loc()
val-
D2Pdapp
(d2p1, npf, d2ps) = d2p0.node()
//
val d3p1 = trans23_dpat(d2p1)
val d3ps = trans23_dpatlst(d2ps)
//
in
d3pat_dapp_up(loc0, d3p1, npf, d3ps)
end (* end of [auxdapp] *)

in (* in-of-local *)

implement
trans23_dpat
  (d2p0) = let
//
val loc0 = d2p0.loc()
//
in
//
case+
d2p0.node() of
//
| D2Pany() =>
  (
    d3pat_any(loc0, t2p0)
  ) where
  {
    val
    t2p0 = the_t2ype_none0
  }
//
| D2Pvar(d2v0) =>
  let
    val () =
    trenv23_dvar(d2v0)
  in
    d3pat_var(loc0, d2v0)
  end
//
| D2Pcon1(d2c0) =>
  (
    d3pat_con(loc0, d2c0)
  )
//
| D2Panno(d2p1, s2e2) =>
  let
    val
    t2p2 = s2exp_erase(s2e2)
    val
    d3p1 =
    trans23_dpat_dn(d2p1, t2p2)
  in
    d3pat_anno(d3p1, s2e2)
  end
//
| D2Pdapp _ => auxdapp(d2p0)
//
| _(* else *) =>
  let
    val t2p0 = the_t2ype_none0
  in
    d3pat_make_node(loc0, t2p0, D3Pnone1(d2p0))
  end
//
end (* end of [trans23_dpat] *)

end // end of [local]
//
(* ****** ****** *)
//
implement
trans23_dpatlst
  (d2ps) =
list_vt2t(d3ps) where
{
val
d3ps =
list_map<d2pat><d3pat>
  (d2ps) where
{
implement
list_map$fopr<d2pat><d3pat> = trans23_dpat
}
} (* end of [trans23_dpatlst] *)
//
(* ****** ****** *)

implement
trans23_dpat_dn
  (d2p0, t2p0) =
(
case+
d2p0.node() of
| D2Pany() =>
  d3pat_any(loc0, t2p0)
| D2Pvar(d2v0) =>
  (
  d3pat_var(loc0, d2v0)
  ) where
  {
    val () =
    trenv23_dvar_dn(d2v0, t2p0)
  }
| D2Panno
  (d2p1, s2e2) =>
  (
    d3pat_dn(d3p1, t2p2)
  ) where
  {
    val t2p2 =
    s2exp_erase(s2e2)
    val d3p1 =
    trans23_dpat_dn(d2p1, t2p0)
  }
| _(* else *) =>
  (
    d3pat_dn(d3p0, t2p0)
  ) where
  {
    val d3p0 = trans23_dpat(d2p0)
  }
) where
{
//
  val loc0 = d2p0.loc((*void*))
//
(*
  val ((*void*)) =
  println!("trans23_dpat_dn: d2p0 = ", d2p0)
  val ((*void*)) =
  println!("trans23_dpat_dn: t2p0 = ", t2p0)
*)
//
} // end-of-where // end of [trans23_dpat_dn]

(* ****** ****** *)

implement
trans23_farglst
  (f2as) =
(
  auxlst(f2as)
) where
{
fun
auxlst
( f2as
: f2arglst): f3arglst =
(
case+ f2as of
//
| list_nil() => list_nil()
//
| list_cons
  (f2a0, f2as) =>
  let
  val loc0 = f2a0.loc()
  in
  case+
  f2a0.node() of
  | F2ARGsome_dyn
    (npf, d2ps) =>
    list_cons
    (f3a0, auxlst(f2as)) where
    {
      val
      d3ps = trans23_dpatlst(d2ps)
      val
      f3a0 =
      f3arg_make_node
      (loc0, F3ARGsome_dyn(npf, d3ps))
    }
  | F2ARGsome_sta
    (s2vs, s2ps) =>
    list_cons
    (f3a0, auxlst(f2as)) where
    {
      val f3a0 =
      f3arg_make_node
      (loc0, F3ARGsome_sta(s2vs, s2ps))
    }
  | F2ARGsome_met(s2es) =>
    list_cons
    (f3a0, auxlst(f2as)) where
    {
      val f3a0 =
      f3arg_make_node(loc0, F3ARGsome_met(s2es))
    }
  end
)
} (* end of [trans23_farglst] *)

(* ****** ****** *)

local

(* ****** ****** *)

fun
auxint
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Eint(tok) = d2e0.node()
//
val
t2p0 =
(
case+
tok.node() of
| T_INT1 _ => the_t2ype_sint
| T_INT2 _ => the_t2ype_sint
| T_INT3 _ => the_t2ype_sint
| _ (* dead *) => the_t2ype_sint
) : t2ype // end of [val]
//
in
let
val node = D3Eint(tok)
in
d3exp_make_node(loc0, t2p0, node)
end
end (* end of [auxint] *)

fun
auxchr
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Echr(tok) = d2e0.node()
//
val node = D3Echr(tok)
val t2p0 = the_t2ype_char
//
in
  d3exp_make_node(loc0, t2p0, node)
end (* end of [auxchr] *)

fun
auxflt
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Eflt(tok) = d2e0.node()
//
val
t2p0 =
(
case+
tok.node() of
| T_FLOAT1 _ => the_t2ype_double
| T_FLOAT2 _ => the_t2ype_double
| T_FLOAT3 _ => the_t2ype_double
| _ (* dead *) => the_t2ype_double
) : t2ype // end of [val]
//
in
//
let
  val node = D3Eflt(tok)
in
  d3exp_make_node(loc0, t2p0, node)
end
//
end (* end of [auxflt] *)

fun
auxstr
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Estr(tok) = d2e0.node()
//
val node = D3Estr(tok)
val t2p0 = the_t2ype_string
//
in
  d3exp_make_node(loc0, t2p0, node)
end (* end of [auxstr] *)

(* ****** ****** *)

fun
auxvar
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Evar(d2v) = d2e0.node()
//
val node = D3Evar(d2v)
val t2p0 = d2var_get_type(d2v)
//
in
  d3exp_make_node(loc0, t2p0, node)
end (* end of [auxvar] *)

(* ****** ****** *)

fun
auxcon1
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Econ1(d2c0) = d2e0.node()
//
val
node = D3Econ1(d2c0)
val
t2p0 = d2c0.type((*void*))
//
in
  d3exp_make_node(loc0, t2p0, node)
end // end of [auxcon1]

fun
auxcst1
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Ecst1(d2c0) = d2e0.node()
//
val
node = D3Ecst1(d2c0)
val
t2p0 = d2c0.type((*void*))
//
in
d3exp_make_node(loc0, t2p0, node)
end // end of [auxcst1]

(* ****** ****** *)

fun
auxcon2
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Econ2(d2cs) = d2e0.node()
//
val
node = D3Econ2(d2cs)
val
t2p0 = t2ype_new(loc0)
//
in
  d3exp_make_node(loc0, t2p0, node)
end // end of [auxcon2]

(* ****** ****** *)

fun
auxcst2
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Ecst2(d2cs) = d2e0.node()
//
val
node = D3Ecst2(d2cs)
val
t2p0 = t2ype_new(loc0)
//
in
  d3exp_make_node(loc0, t2p0, node)
end // end of [auxcst2]

(* ****** ****** *)

fun
auxsym0
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Esym0(d1e, dpis) = d2e0.node()
//
val
t2p0 = t2ype_new(loc0)
//
in
  d3exp_make_node
  (loc0, t2p0, D3Esym0(d1e, dpis))
end // end of [auxsym0]

(* ****** ****** *)

fun
auxsapp
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Esapp
( d2e1
, s2es) = d2e0.node()
//
val
d3e1 = trans23_dexp(d2e1)
//
in
  d3exp_sapp_up(loc0, d3e1, s2es)
end // end of [auxsapp]

(* ****** ****** *)

fun
auxtapp
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Etapp
( d2e1
, s2es) = d2e0.node()
//
val
d3e1 = trans23_dexp(d2e1)
//
in
  d3exp_tapp_up(loc0, d3e1, s2es)
end // end of [auxtapp]

(* ****** ****** *)

fun
auxdapp
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Edapp
( d2e1
, npf2
, d2es) = d2e0.node()
//
val
d3e1 = trans23_dexp(d2e1)
val
d3es = trans23_dexplst(d2es)
//
in
  d3exp_dapp_up(loc0, d3e1, npf2, d3es)
end (* end of [auxdapp] *)

(* ****** ****** *)
//
fun
aux_seqn
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Eseqn
( d2es
, d2e2) = d2e0.node()
//
val
d3es = trans23_dexpseq(d2es)
//
in
//
let
  val d3e2 = trans23_dexp(d2e2)
in
  d3exp_seqn_up(loc0, d3es, d3e2)
end
//
end // end of [aux_seqn]
//
(* ****** ****** *)

fun
aux_tuple
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Etuple
( knd1
, npf2
, d2es) = d2e0.node()
//
val
d3es = trans23_dexplst(d2es)
//
in
  d3exp_tuple_up(loc0, knd1, npf2, d3es)
end // end of [aux_tuple]

(* ****** ****** *)

fun
aux_dtsel
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Edtsel
( lab1
, dpis
, arg3) = d2e0.node()
//
val
arg3 = trans23_dexpopt(arg3)
//
in
  d3exp_dtsel_up(loc0, lab1, dpis, arg3)
end // end of [aux_dtsel]

(* ****** ****** *)

fun
aux_let
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Elet
( d2cs
, d2e2) = d2e0.node()
//
val
d3cs = trans23_declist(d2cs)
//
in
//
let
  val d3e2 = trans23_dexp(d2e2)
in
  d3exp_let_up(loc0, d3cs, d3e2)
end
//
end (* end of [aux_let] *)

(* ****** ****** *)

fun
aux_where
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Ewhere
( d2e1
, d2cs) = d2e0.node()
//
val
d3cs = trans23_declist(d2cs)
//
in
let
val d3e1 = trans23_dexp(d2e1)
in
  d3exp_where_up(loc0, d3e1, d3cs)
end
end (* end of [aux_where] *)

(* ****** ****** *)

fun
aux_if0
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Eif0
( d2e1
, d2e2, opt3) = d2e0.node()
//
val d3e1 = trans23_dexp(d2e1)
val d3e2 = trans23_dexp(d2e2)
val opt3 = trans23_dexpopt(opt3)
//
in
  d3exp_if0_up(loc0, d3e1, d3e2, opt3)
end (* end of [aux_if0] *)

(* ****** ****** *)

fun
aux_case
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Ecase
( knd1
, d2e2, d2cs) = d2e0.node()
//
val d3e2 = trans23_dexp(d2e2)
//
val targ = d3e2.type()
val tres = t2ype_new(loc0)
val d3cs =
  trans23_dclaulst_dn(d2cs, targ, tres)
//
in
  d3exp_make_node
  (loc0, tres, D3Ecase(knd1, d3e2, d3cs))
end (* end of [aux_case] *)

(* ****** ****** *)

fun
aux_lam
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Elam
( f2as
, tres
, arrw, body) = d2e0.node()
//
val
f3as =
trans23_farglst(f2as)
//
val
body =
(
case+ tres of
| EFFS2EXPnone() =>
  (
    trans23_dexp(body)
  )
| EFFS2EXPsome(s2e0) =>
  let
    val
    t2p0 = s2exp_erase(s2e0)
  in
    trans23_dexp_dn(body, t2p0)
  end
) : d3exp // end-of-val
//
val
tfun = let
val
fc2 =
(
  auxfc2(arrw)
) where
{
fun
auxfc2
( arrw
: f1unarrow
) : funclo2 =
(
case arrw of
| F1UNARROWdflt
  () => FC2fun(*void*)
| F1UNARROWlist
  (s1es) => FC2fun(*void*)
)
}
fun
auxfa3g
( fa3g
: f3arglst
, tres
: t2ype
, flag: int): t2ype =
(
case+ fa3g of
| list_nil() => tres
| list_cons(x0, xs) =>
  (
  case+ x0.node() of
  | F3ARGsome_dyn
    (npf, d3ps) =>
    let
    val fc2 =
    (
    if flag = 0
    then fc2(*funarrow*)
    else FC2cloref(*void*)
    ) : funclo2 // end-of-val
    val t2ps =
    d3patlst_get_type(d3ps)
    val tres =
    auxfa3g(xs, tres, flag+1)
    in
    t2ype_fun1(fc2, npf, t2ps, tres)
    end
  | F3ARGsome_sta
    (s2vs, s2ps) =>
    let
    val tres =
    auxfa3g(xs,tres,flag) in t2ype_uni(s2vs, tres)
    end
  | F3ARGsome_met(s2es) => auxfa3g(xs, tres, flag)
  )
)
in
  auxfa3g(f3as, body.type(), 0)
end // end-of-val
//
val () =
println!
("trans23_dexp: aux_lam: tfun = ", tfun)
//
in
  d3exp_make_node
  (loc0, tfun, D3Elam(f3as, tres, arrw, body))
end // end of [aux_lam]

(* ****** ****** *)

fun
aux_anno
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Eanno
(d2e1, s2e2) = d2e0.node()
//
val d3e1 = trans23_dexp(d2e1)
//
in
d3exp_make_node
(loc0, d3e1.type(), D3Eanno(d3e1, s2e2))
end // end of [aux_anno]

(* ****** ****** *)

in (* in-of-local *)

implement
trans23_dexp
  (d2e0) = let
//
val
loc0 = d2e0.loc()
//
val () =
println!
("trans23_dexp: d2e0 = ", d2e0)
//
in
//
case+
d2e0.node() of
//
| D2Eint _ => auxint(d2e0)
| D2Echr _ => auxchr(d2e0)
| D2Eflt _ => auxflt(d2e0)
| D2Estr _ => auxstr(d2e0)
//
| D2Evar _ => auxvar(d2e0)
//
| D2Econ1 _ => auxcon1(d2e0)
| D2Ecst1 _ => auxcst1(d2e0)
//
| D2Econ2 _ => auxcon2(d2e0)
| D2Ecst2 _ => auxcst2(d2e0)
//
| D2Esym0 _ => auxsym0(d2e0)
//
| D2Esapp _ => auxsapp(d2e0)
| D2Etapp _ => auxtapp(d2e0)
| D2Edapp _ => auxdapp(d2e0)
//
| D2Elet _ => aux_let(d2e0)
| D2Ewhere _ => aux_where(d2e0)
//
| D2Eseqn _ => aux_seqn(d2e0)
//
| D2Etuple _ => aux_tuple(d2e0)
//
| D2Edtsel _ => aux_dtsel(d2e0)
//
| D2Eif0(_, _, _) => aux_if0(d2e0)
//
| D2Ecase(_, _, _) => aux_case(d2e0)
//
| D2Elam(_, _, _, _) => aux_lam(d2e0)
//
| D2Eanno _ => aux_anno(d2e0)
//
| _ (*else*) => d3exp_none1_0(d2e0)
//
end // end of [trans23_dexp]

end // end of [local]

(* ****** ****** *)
//
implement
trans23_dexp_dn
  (d2e0, t2p0) = let
//
(*
val () =
println!
("trans23_dexp_dn: d2e0 = ", d2e0)
val () =
println!
("trans23_dexp_dn: t2p0 = ", t2p0)
*)
//
in
  d3exp_dn(trans23_dexp(d2e0), t2p0)
end // end of [trans23_dexp_dn]
//
(* ****** ****** *)

implement
trans23_dexpopt
  (opt) =
(
case+ opt of
| None() => None()
| Some(d2e) => Some(trans23_dexp(d2e))
) (* end of [trans23_dexpopt] *)

implement
trans23_dexplst
  (d2es) =
list_vt2t(d3es) where
{
val
d3es =
list_map<d2exp><d3exp>
  (d2es) where
{
implement
list_map$fopr<d2exp><d3exp> = trans23_dexp
}
} (* end of [trans23_dexplst] *)

(* ****** ****** *)
//
implement
trans23_dexpseq
  (d2es) =
list_vt2t
(
list_map<d2exp><d3exp>(d2es)
) where
{
implement
list_map$fopr<d2exp><d3exp>(d2e) =
trans23_dexp_dn(d2e, the_t2ype_void(*void*))
} (* end of [trans23_dexpseq] *)
//
(* ****** ****** *)

implement
trans23_dgua
  (d2g0) =
let
val loc0 = d2g0.loc()
in
case+
d2g0.node() of
| D2GUAexp(d2e1) =>
  let
    val d3e1 =
    trans23_dexp_dn
    (d2e1, the_t2ype_bool)
  in
    d3gua_make_node(loc0, D3GUAexp(d3e1))
  end
| D2GUAmat(d2e1, d2p2) =>
  let
    val d3e1 =
    trans23_dexp(d2e1)
    val d3p2 =
    trans23_dpat_dn(d2p2, d3e1.type())
  in
    d3gua_make_node(loc0, D3GUAmat(d3e1, d3p2))
  end
end // end of [trans23_dgua]

(* ****** ****** *)
//
implement
trans23_dgualst
  (d2gs) =
list_vt2t(d3gs) where
{
val
d3gs =
list_map<d2gua><d3gua>
  (d2gs) where
{
  implement
  list_map$fopr<d2gua><d3gua> = trans23_dgua
}
} (* end of [trans23_dgualst] *)
//
(* ****** ****** *)

implement
trans23_dclau_dn
( d2cl
, targ, tres) = let
//
val loc0 = d2cl.loc()
//
in
//
case+
d2cl.node() of
| D2CLAUgpat(dgpt) =>
  let
  val
  dgpt =
  trans23_dgpat_dn(dgpt, targ)
  in
    d3clau_make_node(loc0, D3CLAUgpat(dgpt))
  end
| D2CLAUclau(dgpt, d2e1) =>
  let
  val
  dgpt =
  trans23_dgpat_dn(dgpt, targ)
  val
  d3e1 = trans23_dexp_dn(d2e1, tres)
  in
    d3clau_make_node(loc0, D3CLAUclau(dgpt, d3e1))
  end
//
end // end of [trans23_dclau_dn]

(* ****** ****** *)

implement
trans23_dgpat_dn
  (dgpt, targ) = let
//
val loc0 = dgpt.loc()
//
in
//
case+
dgpt.node() of
| DG2PATpat(d2p0) =>
  let
  val
  d3p0 = trans23_dpat_dn(d2p0, targ)
  in
    dg3pat_make_node(loc0, DG3PATpat(d3p0))
  end
| DG2PATgua(d2p0, d2gs) =>
  let
  val
  d3p0 =
  trans23_dpat_dn(d2p0, targ)
  val
  d3gs = trans23_dgualst(d2gs)
  in
    dg3pat_make_node(loc0, DG3PATgua(d3p0, d3gs))
  end
//
end // end of [trans23_dgpat_dn]

(* ****** ****** *)
//
implement
trans23_dclaulst_dn
(d2cs, targ, tres) =
list_vt2t
(
list_map<d2clau><d3clau>(d2cs)
) where
{
  implement
  list_map$fopr<d2clau><d3clau>
  (d2c) =
  trans23_dclau_dn(d2c, targ, tres)
} (* end of [trans23_dclaulst_dn] *)
//
(* ****** ****** *)

local

fun
aux_valdecl
( d2c0
: d2ecl): d3ecl = let
//
val
loc0 = d2c0.loc()
val-
D2Cvaldecl
( knd
, mopt
, v2ds) = d2c0.node()
//
val
v3ds = auxv2ds(d2c0, v2ds)
//
in
  d3ecl_make_node
  (loc0, D3Cvaldecl(knd, mopt, v3ds))
end where
{
//
fun
auxv2d0
( d2c0
: d2ecl
, v2d0
: v2aldecl
) : v3aldecl = let
//
val
loc0 = d2c0.loc()
val+
V2ALDECL(rcd) = v2d0
//
val loc = rcd.loc
val pat = rcd.pat
val def = rcd.def
val wtp = rcd.wtp
//
val pat = trans23_dpat(pat)
//
val def =
(
case+ def of
| None() =>
  None()
| Some(d2e0) =>
  let
  val tres = pat.type()
  in
  Some(trans23_dexp_dn(d2e0, tres))
  end
) : d3expopt // end-of-val
//
in
V3ALDECL
(@{
loc=loc,pat=pat,def=def,wtp=wtp})
end // end of [auxv2d0]
//
fun
auxv2ds
( d2c0: d2ecl
, v2ds
: v2aldeclist
)
: v3aldeclist =
(
case+ v2ds of
| list_nil() =>
  list_nil()
| list_cons(x0, xs) =>
  list_cons
  (auxv2d0(d2c0, x0), auxv2ds(d2c0, xs))
)
//
} (* end of [aux_valdecl] *)

(* ****** ****** *)

fun
aux_fundecl
( d2c0
: d2ecl): d3ecl = let
//
val
loc0 = d2c0.loc()
val-
D2Cfundecl
( knd
, mopt
, tqas
, f2ds) = d2c0.node()
//
val
f3ds = auxf2ds(d2c0, f2ds)
//
in
d3ecl_make_node
( loc0
, D3Cfundecl(knd, mopt, tqas, f3ds))
end where
{
//
fun
ishdr
( f2d0
: f2undecl): bool =
let
val+
F2UNDECL(rcd) = f2d0
in
  case+ rcd.dct of
  | Some(d2c) => true | None() => false 
end
//
fun
auxtfun
( fa2g
: f2arglst
, fa3g
: f3arglstopt
, tres
: t2ype): t2ype =
(
case+ fa3g of
| None() =>
  auxfa2g(fa2g, tres, 0)
| Some(fa3g) =>
  auxfa3g(fa3g, tres, 0)
)
and
auxfa2g
( fa2g
: f2arglst
, tres
: t2ype
, flag: int): t2ype =
(
case+ fa2g of
| list_nil() => tres
| list_cons(x0, xs) =>
  (
  case+ x0.node() of
  | F2ARGsome_dyn
    (npf, d2ps) =>
    let
//
    val fc2 =
    (
    if flag = 0
    then FC2fun(*void*)
    else FC2cloref(*void*)
    ) : funclo2 // end-of-val
//
    val t2ps = auxd2ps(d2ps)
    val tres =
    auxfa2g(xs, tres, flag+1)
//
    in
      t2ype_fun1(fc2, npf, t2ps, tres)
    end
  | F2ARGsome_sta
    (s2vs, s2ps) =>
    let
    val tres =
    auxfa2g(xs,tres,flag) in t2ype_uni(s2vs, tres)
    end
  | F2ARGsome_met(s2es) => auxfa2g(xs, tres, flag)
  )
)
and
auxfa3g
( fa3g
: f3arglst
, tres
: t2ype
, flag: int): t2ype =
(
case+ fa3g of
| list_nil() => tres
| list_cons(x0, xs) =>
  (
  case+ x0.node() of
  | F3ARGsome_dyn
    (npf, d3ps) =>
    let
    val fc2 =
    (
    if flag = 0
    then FC2fun(*void*)
    else FC2cloref(*void*)
    ) : funclo2 // end-of-val
    val t2ps =
    d3patlst_get_type(d3ps)
    val tres =
    auxfa3g(xs, tres, flag+1)
    in
    t2ype_fun1(fc2, npf, t2ps, tres)
    end
  | F3ARGsome_sta
    (s2vs, s2ps) =>
    let
    val tres =
    auxfa3g(xs,tres,flag) in t2ype_uni(s2vs, tres)
    end
  | F3ARGsome_met(s2es) => auxfa3g(xs, tres, flag)
  )
)
and
auxd2ps
( d2ps
: d2patlst): t2ypelst =
list_vt2t
(
  list_map<d2pat><t2ype>(d2ps)
) where
{
  implement
  list_map$fopr<d2pat><t2ype>(d2p) =
  (
  case+ d2p.node() of
  | D2Panno(_, s2e) => s2exp_erase(s2e) | _ => the_t2ype_none0
  )
} (* end of [auxd2ps] *)
//
fun
auxf2d0
( d2c0
: d2ecl
, f2d0
: f2undecl
) : f3undecl = let
//
val
loc0 = d2c0.loc()
//
val+
F2UNDECL(rcd) = f2d0
//
val loc = rcd.loc
val nam = rcd.nam
val a2g = rcd.arg
val res = rcd.res
val dct = rcd.dct
val def = rcd.def
val wtp = rcd.wtp
//
(*
val () =
if
ishdr(f2d0)
then () else auxarg(arg)
*)
val a3g =
(
if
ishdr(f2d0)
then
None(*void*)
else
Some
(trans23_farglst(a2g))): f3arglstopt
//
val tres =
(
case+ res of
| EFFS2EXPnone() => t2ype_new(loc0)
| EFFS2EXPsome(s2e0) => s2exp_erase(s2e0)
) : t2ype // end-of-val
//
val () =
(
d2var_set_type(nam, tfun)
) where
{
val
tfun = auxtfun(a2g, a3g, tres)
} (* end of [where] *)
//
val () =
(
case+ dct of
| None() => ()
| Some(d2c) => d2c.type(nam.type())
)
//
val () =
println!
("trans23_decl: aux_fundecl:")
val () =
println!
("auxf2d0: nam = ", nam)
val () =
println!
("auxf2d0: nam.type = ", nam.type())
//
val def =
(
case+ def of
| None() =>
  None()
| Some(d2e0) =>
  Some(trans23_dexp_dn(d2e0, tres))
) : d3expopt // end-of-val
//
in
F3UNDECL
(@{
loc=loc,nam=nam,
a2g=a2g,a3g=a3g,res=res,def=def,wtp=wtp})
end // end of [let]
fun
auxf2ds
( d2c0: d2ecl
, f2ds
: f2undeclist
)
: f3undeclist =
(
case+ f2ds of
| list_nil() =>
  list_nil()
| list_cons(x0, xs) =>
  list_cons
  (auxf2d0(d2c0, x0), auxf2ds(d2c0, xs))
)
//
} (* end of [aux_fundecl] *)

in (* in-of-local *)

implement
trans23_decl
  (d2c0) = let
//
val
loc0 = d2c0.loc()
// (*
val () =
println!
("trans23_decl: d2c0 = ", d2c0)
// *)
//
in
//
case+
d2c0.node() of
//
| D2Cstatic
  (tok, d2c1) =>
  let
    val
    d3c1 = trans23_decl(d2c1)
  in
    d3ecl_make_node
    (loc0, D3Cstatic(tok, d3c1))
  end
| D2Cextern
  (tok, d2c1) =>
  let
    val
    d3c1 = trans23_decl(d2c1)
  in
    d3ecl_make_node
    (loc0, D3Cextern(tok, d3c1))
  end
//
| D2Cvaldecl _ => aux_valdecl(d2c0)
| D2Cfundecl _ => aux_fundecl(d2c0)
//
| _ (* rest-of-d2ecl *) => d3ecl_none1(d2c0)
//
end // end of [trans23_decl]

end // end of [local]

(* ****** ****** *)

implement
trans23_declist
  (d2cs) =
list_vt2t(d3cs) where
{
val
d3cs =
list_map<d2ecl><d3ecl>
  (d2cs) where
{
  implement
  list_map$fopr<d2ecl><d3ecl> = trans23_decl
}
} (* end of [trans23_declist] *)

(* ****** ****** *)

(* end of [xats_trans23_dynexp.dats] *)
