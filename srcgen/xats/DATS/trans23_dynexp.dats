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

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/staexp0.sats"

(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans23.sats"

(* ****** ****** *)

implement
fprint_val<t2ype> = fprint_t2ype

(* ****** ****** *)

implement
fprint_val<d2pat> = fprint_d2pat
implement
fprint_val<f2arg> = fprint_f2arg
implement
fprint_val<f3arg> = fprint_f3arg

(* ****** ****** *)
//
fun
d23exp_make_node
( loc0: loc_t
, t2p0: t2ype
, d3en: d3exp_node) =
d3exp_make_node(loc0, t2p0, d3en)
//
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
auxsym0
( d2p0
: d2pat): d3pat = let
//
val
loc0 = d2p0.loc()
val-
D2Psym0(d1p, dpis) = d2p0.node()
//
val
t2p0 = t2ype_new(loc0)
//
in
  d3pat_make_node
  (loc0, t2p0, D3Psym0(d1p, dpis))
end // end of [auxsym0]

fun
auxdapp
( d2p0
: d2pat): d3pat = let
//
val
loc0 = d2p0.loc()
val-
D2Pdapp
( d2p1
, npf2, d2ps) = d2p0.node()
//
val d3p1 = trans23_dpat(d2p1)
val d3ps = trans23_dpatlst(d2ps)
//
in
d3pat_dapp_up(loc0, d3p1, npf2, d3ps)
end (* end of [auxdapp] *)

(* ****** ****** *)

fun
aux_tuple
( d2p0
: d2pat): d3pat = let
//
val
loc0 = d2p0.loc()
val-
D2Ptuple
( knd1
, npf2, d2ps) = d2p0.node()
//
val
d3ps = trans23_dpatlst(d2ps)
//
in
d3pat_tuple_up(loc0, knd1, npf2, d3ps)
end // end of [aux_tuple]

(* ****** ****** *)

fun
aux_anno
(d2p0: d2pat): d3pat =
(
  d3pat_anno(d3p1, s2e2)
) where
{
//
  val-
  D2Panno
  (d2p1, s2e2) = d2p0.node()
//
  val t2p2 = s2exp_erase(s2e2)
  val d3p1 = trans23_dpat_dn(d2p1, t2p2)
} (* end of [aux_anno] *)

(* ****** ****** *)

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
| D2Pnil() =>
  d3pat_nil(loc0)
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
| D2Pint(tok0) =>
  (
    d3pat_int(loc0, tok0)
  )
| D2Pbtf(tok0) =>
  (
    d3pat_btf(loc0, tok0)
  )
//
| D2Pcon1(d2c0) =>
  (
    d3pat_con(loc0, d2c0)
  )
//
| D2Psym0 _ => auxsym0(d2p0)
| D2Pdapp _ => auxdapp(d2p0)
//
| D2Ptuple _ => aux_tuple(d2p0)
//
| D2Panno(d2e1, s2e2) => aux_anno(d2p0)
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
//
implement
trans23_dpatlst_dn
  (d2ps, t2ps) =
(
  auxlst(d2ps, t2ps)
) where
{
//
fun
auxlst
( d2ps: d2patlst
, t2ps: t2ypelst): d3patlst =
(
case+ d2ps of
| list_nil() =>
  list_nil()
| list_cons
  (d2p0, d2ps) =>
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
      trans23_dpat_dn(d2p0, t2p0)
      val d3ps = auxlst(d2ps, t2ps)
    }
  | list_cons
    (t2p0, t2ps) =>
    (
      list_cons(d3p0, d3ps)
    ) where
    {
      val d3p0 =
      trans23_dpat_dn(d2p0, t2p0)
      val d3ps = auxlst(d2ps, t2ps)
    }    
  )
) (* end of [auxlst] *)
} (* end of [trans23_dpatlst_dn] *)
//
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
//
| _ (* dead *) => the_t2ype_sint
//
) : t2ype // end of [val]
//
in
let
val node = D3Eint(tok)
in
d23exp_make_node(loc0, t2p0, node)
end
end (* end of [auxint] *)

fun
auxbtf
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Ebtf(tok) = d2e0.node()
//
val node = D3Ebtf(tok)
val t2p0 = the_t2ype_bool
//
in
d23exp_make_node(loc0, t2p0, node)
end (* end of [auxbtf] *)

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
d23exp_make_node(loc0, t2p0, node)
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
| T_FLOAT1 _ => the_t2ype_dfloat
| T_FLOAT2 _ => the_t2ype_dfloat
| T_FLOAT3 _ => the_t2ype_dfloat
| _ (* dead *) => the_t2ype_dfloat
) : t2ype // end of [val]
//
in
//
let
val node = D3Eflt(tok)
in
d23exp_make_node(loc0, t2p0, node)
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
d23exp_make_node(loc0, t2p0, node)
end (* end of [auxstr] *)

(* ****** ****** *)

fun
auxtop
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Etop(tok) = d2e0.node()
//
val node = D3Etop(tok)
val t2p0 = t2ype_new(loc0)
//
in
d23exp_make_node(loc0, t2p0, node)
end (* end of [auxtop] *)

(* ****** ****** *)

local

fun
utplft
( t2p0
: t2ype): t2ype =
let
val
t2p0 = t2ype_eval(t2p0)
in
case+
t2p0.node() of
| T2Plft(t2p1) => t2p1 | _ => t2p0
end // end-of-let // end-of-fun

in(*in-of-local*)

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
//
val t2p0 =
utplft(d2var_get_type(d2v))
//
in
d23exp_make_node(loc0, t2p0, node)
end (* end of [auxvar] *)

end // end of [local]

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
val node = D3Econ1(d2c0)
val t2p0 = d2c0.type((*void*))
//
in
d23exp_make_node(loc0, t2p0, node)
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
(ti3a, t2p0) =
t2ype_tq2as_elim2
(loc0, d2c0.type(), d2c0.tqas())
//
val
tias = list_nil()
//
in
//
case+ ti3a of
|
TI3ARGnone _ =>
d23exp_make_node
(loc0, t2p0, D3Efcst(d2c0))
|
TI3ARGsome _ => 
d23exp_make_node
(loc0, t2p0, D3Etcst(d2c0, ti3a, tias))
//
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
val node = D3Econ2(d2cs)
val t2p0 = t2ype_new(loc0)
//
in
d23exp_make_node(loc0, t2p0, node)
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
val node = D3Ecst2(d2cs)
val t2p0 = t2ype_new(loc0)
//
in
d23exp_make_node(loc0, t2p0, node)
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
val t2p0 = t2ype_new(loc0)
//
in
d23exp_make_node
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
val d3e1 = trans23_dexp(d2e1)
//
in
  d23exp_sapp_up(loc0, d3e1, s2es)
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
in
  d23exp_tapp_up(loc0, d2e1, s2es)
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
( d2f0
, npf1
, d2es) = d2e0.node()
//
val
d3f0 = trans23_dexp(d2f0)
val
d3es = trans23_dexplst(d2es)
//
in
  d23exp_dapp_up(loc0, d3f0, npf1, d3es)
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
  d23exp_seqn_up(loc0, d3es, d3e2)
end
//
end // end of [aux_seqn]
//
(* ****** ****** *)

fun
aux_none0
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Enone0() = d2e0.node()
//
val
t2p0 =
the_t2ype_void(*void*)
//
in
d23exp_make_node(loc0, t2p0, D3Enone0())
end // end of [aux_none0]

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
  d23exp_tuple_up(loc0, knd1, npf2, d3es)
end // end of [aux_tuple]

(* ****** ****** *)

fun
aux_assgn
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Eassgn
( d2e1
, d2e2) = d2e0.node()
//
val d3e1 = trans23_dexp(d2e1)
val d3e2 = trans23_dexp(d2e2)
//
in
  d23exp_assgn_up(loc0, d3e1, d3e2)
end // end of [aux_assgn]

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
( lab0
, dpis
, npf2
, arg3) = d2e0.node()
//
val
arg3 =
(
case+ arg3 of
| None() =>
  None()
| Some(d3es) =>
  Some(trans23_dexplst(d3es))
) : d3explstopt // end of [val]
//
in
  d23exp_dtsel_up(loc0, lab0, dpis, npf2, arg3)
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
  d23exp_let_up(loc0, d3cs, d3e2)
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
  d23exp_where_up(loc0, d3e1, d3cs)
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
  d23exp_if0_up(loc0, d3e1, d3e2, opt3)
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
d23exp_make_node
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
( knd0
, f2as
, res0
, arrw, body) = d2e0.node()
//
val
f3as =
trans23_farglst(f2as)
//
val
body =
(
case+ res0 of
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
in
d23exp_lam_up
(loc0, knd0, f3as, res0, arrw, body)
end // end of [aux_lam]

(* ****** ****** *)

fun
aux_fix
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Efix
( knd0
, d2v0
, f2as
, res0
, arrw, body) = d2e0.node()
//
val
f3as =
trans23_farglst(f2as)
//
val
tres =
(
case+ res0 of
| EFFS2EXPnone() =>
  let
  val
  loc = body.loc() in t2ype_new(loc)
  end
| EFFS2EXPsome(s2e0) => s2exp_erase(s2e0)
) : t2ype // end-of-val
//
val () =
(
  d2var_set_type(d2v0, tfun)
) where
{
val
tfun = aux_fix_f3as(f3as, tres, 0)
}
//
val body = trans23_dexp_dn(body, tres)
//
in
d23exp_fix_up
(loc0, knd0, d2v0, f3as, res0, arrw, body)
end // end of [aux_fix]

and
aux_fix_f3as
( f3as
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
  (npf, d3ps) =>
  let
  val fc2 =
  ( if
    flag = 0
    then
    FC2fun(*void*)
    else
    FC2cloref(*void*)
  ) : funclo2 // end-of-val
  val t2ps =
  d3patlst_get_type(d3ps)
  val tres =
  aux_fix_f3as(xs, tres, flag+1)
  in
  t2ype_fun2(fc2, npf, t2ps, tres)
  end
| F3ARGsome_sta
  (s2vs, s2ps) =>
  let
  val
  tres =
  aux_fix_f3as
  (xs,tres,flag) in t2ype_uni(s2vs, tres)
  end
| F3ARGsome_met(s2es) => aux_fix_f3as(xs, tres, flag)
) (* end of [list_cons] *)
) (* end of [aux_fix_f3as] *)

(* ****** ****** *)

(*
fun
aux_flat
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Eflat(d2e1) = d2e0.node()
//
(*
val t2p0 = t2ype_new(loc0)
val t2p1 = t2ype_lft(t2p0)
val d3e1 = trans23_dexp_dn(d2e1, t2p1)
*)
//
val d3e1 = trans23_dexp(d2e1)
//
in
let
val t2p1 = d3e1.type((*void*))
in
d23exp_make_node(loc0, t2p1, D3Eflat(d3e1))
end
end // end of [aux_flat]
*)

(* ****** ****** *)

fun
aux_addr
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Eaddr(d2e1) = d2e0.node()
//
val d3e1 = trans23_dexp(d2e1)
//
val t2p0 =
t2ype_app1(the_t2ype_p2tr, d3e1.type())
//
in
d23exp_make_node(loc0, t2p0, D3Eaddr(d3e1))
end // end of [aux_addr]

(* ****** ****** *)

fun
aux_eval
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Eeval
(d2e1) = d2e0.node()
//
val
d3e1 = trans23_dexp(d2e1)
//
val t2p0 =
let
val t2p1 = d3e1.type()
val t2p1 = hnfize(t2p1)
in
//
let
val
opt2 =
t2ype_un_lazy(t2p1)
in
case+ opt2 of
|
~Some_vt(t2p2) => t2p2
|
~None_vt((*void*)) =>
let
val
opt2 =
t2ype_un_p2tr(t2p1)
in
case+ opt2 of
|
~Some_vt(t2p2) => t2p2
|
~None_vt((*void*)) => t2ype_new(loc0)
end // end of [let]
end // end of [let]
//
end // end of [val]
//
in
  d23exp_make_node
  (loc0, t2p0, D3Eeval(0(*knd*), d3e1))
end // end of [aux_eval]

(* ****** ****** *)

fun
aux_fold
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Efold(d2e1) = d2e0.node()
//
val d3e1 = trans23_dexp(d2e1)
//
val t2p0 = the_t2ype_void(*void*)
//
in
d23exp_make_node(loc0, t2p0, D3Efold(d3e1))
end // end of [aux_fold]

(* ****** ****** *)

fun
aux_lazy
( d2e0
: d2exp): d3exp = let
//
val
loc0 = d2e0.loc()
val-
D2Elazy(d2e1) = d2e0.node()
//
val d3e1 = trans23_dexp(d2e1)
//
val t2p0 =
t2ype_app1(the_t2ype_lazy, d3e1.type())
//
in
d23exp_make_node(loc0, t2p0, D3Elazy(d3e1))
end // end of [aux_lazy]

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
val t2p2 = s2exp_erase(s2e2)
val d3e1 = trans23_dexp_dn(d2e1, t2p2)
//
in
d23exp_make_node
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
(*
val () =
println!
("trans23_dexp: d2e0 = ", d2e0)
*)
//
in
//
case+
d2e0.node() of
//
| D2Eint _ => auxint(d2e0)
| D2Ebtf _ => auxbtf(d2e0)
| D2Echr _ => auxchr(d2e0)
| D2Eflt _ => auxflt(d2e0)
| D2Estr _ => auxstr(d2e0)
//
| D2Etop _ => auxtop(d2e0)
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
| D2Enone0 _ => aux_none0(d2e0)
| D2Etuple _ => aux_tuple(d2e0)
//
| D2Eassgn _ => aux_assgn(d2e0)
//
| D2Edtsel _ => aux_dtsel(d2e0)
//
| D2Eif0
    (_, _, _) => aux_if0(d2e0)
  // D2Eif0
//
| D2Ecase
    (_, _, _) => aux_case(d2e0)
  // D2Ecase
//
| D2Elam
  (_, _, _, _, _) => aux_lam(d2e0)
| D2Efix
  (_, _, _, _, _, _) => aux_fix(d2e0)
//
(*
| D2Eflat(d2e1) => aux_flat(d2e0)
*)
//
| D2Eaddr(d2e1) => aux_addr(d2e0)
| D2Eeval(d2e1) => aux_eval(d2e0)
| D2Efold(d2e1) => aux_fold(d2e0)
//
| D2Elazy(d2e1) => aux_lazy(d2e0)
//
| D2Eanno
    (d2e1, s2e2) => aux_anno(d2e0)
//
| _ (*rest-of-d2exp*) => d3exp_none1_0(d2e0)
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
  d23exp_dn(trans23_dexp(d2e0), t2p0)
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
list_map$fopr<d2exp><d3exp>(d2e) = trans23_dexp(d2e)
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
//
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
  list_map$fopr<d2gua><d3gua>(d2g) = trans23_dgua(d2g)
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
| D2CLAUpat(dgpt) =>
  let
  val
  dgpt =
  trans23_dgpat_dn(dgpt, targ)
  in
    d3clau_make_node(loc0, D3CLAUpat(dgpt))
  end
| D2CLAUexp(dgpt, d2e1) =>
  let
  val
  dgpt =
  trans23_dgpat_dn(dgpt, targ)
  val
  d3e1 = trans23_dexp_dn(d2e1, tres)
  in
    d3clau_make_node(loc0, D3CLAUexp(dgpt, d3e1))
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
| D2GPATpat(d2p0) =>
  let
  val
  d3p0 = trans23_dpat_dn(d2p0, targ)
  in
    d3gpat_make_node(loc0, D3GPATpat(d3p0))
  end
| D2GPATgua(d2p0, d2gs) =>
  let
  val
  d3p0 =
  trans23_dpat_dn(d2p0, targ)
  val
  d3gs = trans23_dgualst(d2gs)
  in
    d3gpat_make_node(loc0, D3GPATgua(d3p0, d3gs))
  end
//
end // end of [trans23_dgpat_dn]

(* ****** ****** *)
//
implement
trans23_dclaulst_dn
(d2cls, targ, tres) =
list_vt2t
(
  list_map<d2clau><d3clau>(d2cls)
) where
{
  implement
  list_map$fopr<d2clau><d3clau>
    (d2cl) = trans23_dclau_dn( d2cl, targ, tres )
} (* end of [trans23_dclaulst_dn] *)
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_include
( d2cl
: d2ecl): d3ecl = let
//
val
loc0 = d2cl.loc()
val-
D2Cinclude
( tok
, src, knd
, fopt, dopt) = d2cl.node()
//
val dopt =
(
case+ dopt of
| None() =>
  None((*void*))
| Some(d2cs) =>
  Some(trans23_declist(d2cs))
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
( d2cl
: d2ecl): d3ecl = let
//
val
loc0 = d2cl.loc()
val-
D2Cvaldecl
( knd
, mopt
, v2ds) = d2cl.node()
//
val
v3ds = auxv2ds(d2cl, v2ds)
//
in
  d3ecl_make_node
  (loc0, D3Cvaldecl(knd, mopt, v3ds))
end where
{
//
fun
auxv2d0
( d2cl
: d2ecl
, v2d0
: v2aldecl
) : v3aldecl = let
//
val
loc0 = d2cl.loc()
val+
V2ALDECL(rcd) = v2d0
//
val loc = rcd.loc
val pat = rcd.pat
val def = rcd.def
val wtp = rcd.wtp
//
val pat =
(
case+ wtp of
| None() =>
  trans23_dpat(pat)
| Some(s2e) =>
  (
  trans23_dpat_dn(pat, t2p)
  ) where
  {
    val t2p = s2exp_erase(s2e)
  }
) : d3pat // end of [val]
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
( d2cl: d2ecl
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
  (auxv2d0(d2cl, x0), auxv2ds(d2cl, xs))
)
//
} (* end of [aux_valdecl] *)

(* ****** ****** *)

fun
aux_vardecl
( d2cl
: d2ecl): d3ecl = let
//
val
loc0 = d2cl.loc()
val-
D2Cvardecl
( knd
, mopt
, v2ds) = d2cl.node()
//
val
v3ds = auxv2ds(d2cl, v2ds)
//
in
//
d3ecl_make_node
(loc0, D3Cvardecl(knd, mopt, v3ds))
//
end where
{
//
fun
auxv2d0
( d2cl
: d2ecl
, v2d0
: v2ardecl
) : v3ardecl = let
//
val
loc0 = d2cl.loc()
val+
V2ARDECL(rcd) = v2d0
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
(trans23_dexp_dn(d3e, tres))
) where // end of [val]
{
val
tres =
(
case+ res of
|
Some(s2e) => s2exp_erase(s2e)
|
None((*void*)) => t2ype_new(loc0)
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
end // end of [auxv2d0]
//
fun
auxv2ds
( d2cl: d2ecl
, v2ds
: v2ardeclist
)
: v3ardeclist =
(
case+ v2ds of
| list_nil() =>
  list_nil()
| list_cons(x0, xs) =>
  list_cons
  (auxv2d0(d2cl, x0), auxv2ds(d2cl, xs))
)
//
} (* end of [aux_vardecl] *)

(* ****** ****** *)

fun
aux_fundecl
( d2cl
: d2ecl): d3ecl = let
//
val
loc0 = d2cl.loc()
val-
D2Cfundecl
( knd
, mopt
, tqas
, f2ds) = d2cl.node()
//
val
agtp = aux1_f2ds(d2cl, f2ds)
val
f3ds = aux2_f2ds(d2cl, f2ds, agtp)
//
in
d3ecl_make_node
( loc0
, D3Cfundecl(knd, mopt, tqas, f3ds))
end where
{
//
typedef
a3gt2p =
(f3arglstopt,t2ype)
//
//
fun
ishdr
( f2d0
: f2undecl): bool =
let
val+
F2UNDECL(rcd) = f2d0
in
  case+ rcd.def of
  | None() => true | Some(d2e) => false
end
//
fun
aux0_tfun
( f3as
: f3arglstopt
, tres
: t2ype): t2ype =
(
case+ f3as of
| None() =>
  the_t2ype_none0
| Some(f3as) =>
  aux0_f3as(f3as, tres, 0)
)
and
aux0_f3as
( f3as
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
    (npf, d3ps) =>
    let
    val fc2 =
    ( if
      flag = 0
      then
      FC2fun(*void*)
      else
      FC2cloref(*void*)
    ) : funclo2 // end-of-val
    val t2ps =
    d3patlst_get_type(d3ps)
    val tres =
    aux0_f3as(xs, tres, flag+1)
    in
    t2ype_fun2(fc2, npf, t2ps, tres)
    end
  | F3ARGsome_sta
    (s2vs, s2ps) =>
    let
      val
      tres =
      aux0_f3as
      (xs,tres,flag) in t2ype_uni(s2vs, tres)
    end
  | F3ARGsome_met(s2es) => aux0_f3as(xs, tres, flag)
  )
)
and
aux0_d2ps
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
aux1_f2d0
( d2cl
: d2ecl
, f2d0
: f2undecl
) : a3gt2p = let
//
val
loc0 = d2cl.loc()
//
val+
F2UNDECL(rcd) = f2d0
//
val loc = rcd.loc
val nam = rcd.nam
val a2g = rcd.arg
val res = rcd.res
//
//
val a3g =
(
if
ishdr(f2d0)
then None(*void*)
else
Some(trans23_farglst(a2g))
) : f3arglstopt // end-of-val
//
val tres =
(
case+ res of
| EFFS2EXPnone
  () => t2ype_new(loc0)
| EFFS2EXPsome
  (s2e0) => s2exp_erase(s2e0)
) : t2ype // end-of-val
//
in (*in-of-let*)
//
case+ a3g of
| None _ => (a3g, tres)
| Some _ =>
  let
    val
    tfun =
    aux0_tfun(a3g, tres)
  in
    d2var_set_type(nam, tfun); (a3g, tres)
  end
//
end
and
aux1_f2ds
( d2cl: d2ecl
, f2ds
: f2undeclist): List0(a3gt2p) =
(
case+ f2ds of
| list_nil() =>
  list_nil()
| list_cons(x0, xs) =>
  list_cons
  (aux1_f2d0(d2cl, x0), aux1_f2ds(d2cl, xs))
)
//
fun
aux2_f2d0
( d2cl
: d2ecl
, f2d0
: f2undecl
, agtp: a3gt2p
) : f3undecl = let
//
val
loc0 = d2cl.loc()
//
val+
F2UNDECL(rcd) = f2d0
//
val loc = rcd.loc
val nam = rcd.nam
val d2c = rcd.d2c
val a2g = rcd.arg
val res = rcd.res
val def = rcd.def
val wtp = rcd.wtp
//
val a3g = (agtp.0)
//
val tfn1 = nam.type()
//
val ctp =
(
case+ a3g of
|
None _ =>
(
  T2PCASTnone(*void*)
)
|
Some _ =>
(
case+ wtp of
| None _ =>
  (
  T2PCASTnone(*void*)
  ) where
  {
    val () = d2c.type(tfn1)
  }
| Some(s2e0) =>
  let
    val
    tfn2 =
    s2exp_erase(s2e0)
    val () = d2c.type(tfn2)
  in
    if
    unify2(loc0, tfn1, tfn2)
    then T2PCASTnone(*void*)
    else
    T2PCASTsome
    (tfn1(*infer*), tfn2(*given*))
  end
) (* Some *)
) : t2pcast // end-of-val
//
val def =
(
case+ def of
| None() =>
  None()
| Some(d2e0) =>
  Some(trans23_dexp_dn(d2e0, agtp.1))
) : d3expopt // end-of-val
//
in
F3UNDECL(
@{
 loc=loc
,nam=nam,d2c=d2c
,a2g=a2g,a3g=a3g,res=res,def=def,wtp=wtp,ctp=ctp}
) (* F3UNDECL *)
end // end of [let]
and
aux2_f2ds
( d2cl: d2ecl
, f2ds
: f2undeclist
, agtp
: List0(a3gt2p)
)
: f3undeclist =
(
case+ f2ds of
| list_nil() =>
  list_nil()
| list_cons(x0, xs) =>
  let
  val-
  list_cons(y0, ys) = agtp
  in
  list_cons
  (aux2_f2d0(d2cl, x0, y0), aux2_f2ds(d2cl, xs, ys))
  end
)
//
} (* end of [aux_fundecl] *)

(* ****** ****** *)

fun
aux_impdecl1
( d2cl
: d2ecl): d3ecl = let
//
val-
D2Cimpdecl1
( knd
, mopt
, sqas, tqas
, id2c, tias
, f2as, res0
, d2e0(*body*)) = d2cl.node()
//
val-
IMPLD2CST1
(dqid, d2cs) = id2c
val-
list_cons(d2c0, _) = d2cs
//
val
loc0 =
(
case- id2c of
| IMPLD2CST1
  (dqid, _) =>
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
val
tias =
join_ti2as_tq2as(tias, tqas)
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
//
case+ s2vs of
| list_nil _ => tfun
| list_cons _ =>
  (
  case+ ti3a of
  | TI3ARGnone() => tfun
  | TI3ARGsome(t2ps) =>
    t2ype_substs(tfun, s2vs, t2ps)
  )
//
end
) : t2ype
//
(*
val () =
println!
("aux_impdecl1: tfun = ", tfun)
*)
//
val
(f3as
,tres) =
t2ype_f2arg_elim(loc0, tfun, f2as)
//
(*
val () =
println!
("aux_impdecl1: f3as = ", f3as)
val () =
println!
("aux_impdecl1: tres = ", tres)
*)
//
val
d3e0 =
(
case+ res0 of
| EFFS2EXPnone() =>
  (
    trans23_dexp_dn(d2e0, tres)
  )
| EFFS2EXPsome(s2e0) =>
  (
    d23exp_dn(d3e0, tres)
  ) where
  {
    val
    t2p0 = s2exp_erase(s2e0)
    val
    d3e0 = trans23_dexp_dn(d2e0, t2p0)
  }
) : d3exp // end of [val]
//
in
d3ecl_make_node
(
d2cl.loc()
,
D3Cimpdecl1
  ( knd, mopt
  , sqas, tqas
  , id2c, ti3a, tias, f3as, res0, d3e0)
) (* d3ecl_make_node *)
end // end of [aux_impdecl1]

(* ****** ****** *)

fun
aux_impdecl2
( d2cl
: d2ecl): d3ecl = let
//
val
loc0 = d2cl.loc()
val-
D2Cimpdecl2
( knd
, mopt
, sqas, tqas
, id2c, tias
, f2as, res0
, d2e0(*body*)) = d2cl.node()
//
// HX: [ti3a] is to be
val // computed in trans33
ti3a = TI3ARGnone((*void*))
val
tias =
join_ti2as_tq2as(tias, tqas)
//
val
f3as = trans23_farglst(f2as)
//
val
tres =
(
case+ res0 of
| EFFS2EXPnone
  () => t2ype_new(loc0)
| EFFS2EXPsome
  (s2e0) => s2exp_erase(s2e0)
) : t2ype (* end-of-val *)
//
val
d3e0 = trans23_dexp_dn(d2e0, tres)
//
(*
val () =
println!
("aux_impdecl2: tres = ", tres)
val () =
println!
("aux_impdecl2: d3e0 = ", d3e0)
*)
//
in
//
(
  d3ecl_make_node(loc0, node)
) where
{
  val node =
  D3Cimpdecl2
  ( knd, mopt
  , sqas, tqas
  , id2c, ti3a, tias, f3as, res0, d3e0)
}
//
end // end of [aux_impdecl2]

in (* in-of-local *)

implement
trans23_decl
  (d2cl) = let
//
val
loc0 = d2cl.loc()
//
(*
val () =
println!
("trans23_decl: d2cl = ", d2cl)
*)
//
in
//
case+
d2cl.node() of
//
| D2Cstatic
  (tok, d2c) =>
  let
    val
    d3c = trans23_decl(d2c)
  in
    d3ecl_make_node
    (loc0, D3Cstatic(tok, d3c))
  end
| D2Cextern
  (tok, d2c) =>
  let
    val
    d3c = trans23_decl(d2c)
  in
    d3ecl_make_node
    (loc0, D3Cextern(tok, d3c))
  end
//
| D2Cstaload _ =>
  let
    val node = D3Cd2ecl(d2cl)
  in
    d3ecl_make_node(loc0, node)
  end
//
| D2Cinclude _ => aux_include(d2cl)
//
| D2Clocal
  (d2cs1, d2cs2) => let
    val
    d3cs1 = trans23_declist(d2cs1)
    val
    d3cs2 = trans23_declist(d2cs2)
  in
    d3ecl_make_node
      (loc0, D3Clocal(d3cs1, d3cs2))
    // d3ecl_make_node
  end
//
| D2Csexpdef _ =>
  let
    val node = D3Cd2ecl(d2cl)
  in
    d3ecl_make_node(loc0, node)
  end
//
| D2Csymload _ =>
  let
    val node = D3Cd2ecl(d2cl)
  in
    d3ecl_make_node(loc0, node)
  end
//
| D2Cvaldecl _ => aux_valdecl(d2cl)
| D2Cvardecl _ => aux_vardecl(d2cl)
//
| D2Cfundecl _ => aux_fundecl(d2cl)
//
| D2Cimpdecl1 _ => aux_impdecl1(d2cl)
| D2Cimpdecl2 _ => aux_impdecl2(d2cl)
//
| _ (* rest-of-d2ecl *) => d3ecl_none1(d2cl)
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
  list_map$fopr<d2ecl><d3ecl>(d2c) = trans23_decl(d2c)
}
} (* end of [trans23_declist] *)

(* ****** ****** *)

(* end of [xats_trans23_dynexp.dats] *)
