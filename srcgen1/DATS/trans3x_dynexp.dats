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
// Start Time: October, 2019
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

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans3x.sats"

(* ****** ****** *)

implement
fprint_val<s2var> = fprint_s2var
implement
fprint_val<t2ype> = fprint_t2ype

(* ****** ****** *)
//
implement
trans3x_envless
  (prog) =
  (prog) where
{
//
val
env0 = tr3xenv_make_nil()
//
val
prog =
trans3x_declist(env0, prog)
//
val () = tr3xenv_free_nil(env0)
//
} (* end of [trans3x_envless] *)
//
(* ****** ****** *)

fun
d2var_typenfz
(d2v: d2var): void =
let
val t2p = d2v.type()
in
d2v.type(t2ype_normize(t2p))
end // end [d2var_typenfz

(* ****** ****** *)

fun
trans3x_ti3a
( env0:
! tr3xenv,
  ti3a: ti3arg): ti3arg =
(
case+ ti3a of
|
TI3ARGnone() => TI3ARGnone()
|
TI3ARGsome(t2ps) =>
TI3ARGsome(t2ypelst_normize(t2ps))
)

(* ****** ****** *)

local

(* ****** ****** *)

typedef
d3end = d3pat_node

(* ****** ****** *)

fun
auxvar
( env0:
! tr3xenv
, dend: d3end): d3end =
let
val-
D3Pvar(d2v0) = dend
val () =
d2var_typenfz(d2v0) in dend
end // end of [auxvar]

(* ****** ****** *)

fun
auxdapp
( env0:
! tr3xenv
, dend: d3end): d3end =
(
D3Pdapp
(d3f0, npf1, d3ps)) where
{
//
val-
D3Pdapp
( d3f0
, npf1, d3ps) = dend
//
val d3f0 =
trans3x_dpat(env0, d3f0)
val d3ps = 
trans3x_dpatlst(env0, d3ps)
//
} (*where*) // end of [auxdapp]

(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)

implement
trans3x_dpat
(env0, d3p0) = let
//
val
loc0 = d3p0.loc()
//
val
t2p0 = d3p0.type()
val
dend = d3p0.node()
//
val
t2p0 =
t2ype_normize(t2p0)
//
#if(__XATSOPT_DEBUG__)
// (*
val () =
println!
("trans3x_dpat: d3p0 = ", d3p0)
val () =
println!
("trans3x_dpat: t2p0 = ", t2p0)
// *)
#endif//__XATSOPT_DEBUG__
//
in
//
case+ dend of
//
|
D3Pvar _ =>
let
val dend = auxvar(env0, dend)
in
d3pat_make_node(loc0, t2p0, dend)
end
//
|
D3Pdapp _ =>
let
val dend = auxdapp(env0, dend)
in
d3pat_make_node(loc0, t2p0, dend)
end
//
|
D3Panno
( d3p1
, s2e2, s1e2) =>
let
val d3p1 =
trans3x_dpat(env0, d3p1)
val dend =
D3Panno(d3p1, s2e2, s1e2)
in
d3pat_make_node(loc0, t2p0, dend)
end // end of [D3Panno]
//
|
dend(*else*) =>
(
d3pat_make_node(loc0, t2p0, dend)
) (* end of [D3P...] *)
//
end // end of [trans3x_dpat]

(* ****** ****** *)

implement
trans3x_dpatlst
( env0, d3ps ) =
(
case+ d3ps of
|
list_nil() => list_nil()
|
list_cons(d3p1, d3ps) =>
list_cons(d3p1, d3ps) where
{
  val d3p1 =
  trans3x_dpat(env0, d3p1)
  val d3ps =
  trans3x_dpatlst(env0, d3ps)
}
) (*case*) // end of [trans3x_dpatlst]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
//
implement
trans3x_farg
( env0, f3a0 ) =
(
case+
f3a0.node() of
//
|
F3ARGnone2 _ => f3a0
|
F3ARGnone3 _ => f3a0
//
|
F3ARGsome_dyn
( npf1, d3ps ) =>
let
val loc0 = f3a0.loc()
val d3ps =
trans3x_dpatlst(env0, d3ps)
in
f3arg_make_node
(loc0, F3ARGsome_dyn(npf1, d3ps))
end // end of [F3ARGsome_dyn]
//
| F3ARGsome_sta _ => f3a0 // NF-ize?
| F3ARGsome_met _ => f3a0 // NF-ize?
) (*case*) // end of [trans3x_farg]
//
implement
trans3x_farglst
( env0, f3as ) =
(
  case+ f3as of
  |
  list_nil() => list_nil()
  |
  list_cons(f3a1, f3as) =>
  list_cons(f3a1, f3as) where
  {
  val
  f3a1 = trans3x_farg(env0, f3a1)
  val
  f3as = trans3x_farglst(env0, f3as)
  }
) (*case*) // end of [trans3x_farglst]
//
(* ****** ****** *)

local

(* ****** ****** *)

typedef
d3end = d3exp_node

(* ****** ****** *)

fun
auxvar
( env0:
! tr3xenv
, dend: d3end): d3end =
let
val-
D3Evar(d2v0) = dend
in
D3Ekvar(knd, d2v0) where
{
val
knd =
tr3xenv_dvar_kind(env0, d2v0)
}
end

fun
aux_lam
( env0:
! tr3xenv
, dend: d3end): d3end =
let
val-
D3Elam
( knd
, f3as
, res1, arrw, body) = dend
//
val body =
aux_f3as_body(env0, f3as, body)
//
in
  D3Elam
  (knd, f3as, res1, arrw, body)
end // end of [aux_lam]
//
and
aux_fix
( env0:
! tr3xenv
, dend: d3end): d3end =
let
val-
D3Efix
( knd
, d2v0
, f3as
, res1, arrw, body) = dend
//
val () =
tr3xenv_add_fix1(env0, d2v0)
val body =
aux_f3as_body(env0, f3as, body)
//
in
let
val () = tr3xenv_pop_fix1(env0)
in
D3Efix
( knd
, d2v0, f3as, res1, arrw, body)
end
end // end of [aux_fix]
and
aux_f3as_body
( env0
: !tr3xenv
, f3as
: f3arglst, body: d3exp): d3exp =
(
let
val () =
tr3xenv_add_lams(env0, f3as)
//
val
body = trans3x_dexp(env0, body)
//
in
let
val () = tr3xenv_pop_lams(env0) in body
end
end // end of [aux_f3as_body]
)

(* ****** ****** *)

in(*in-of-local*)

(* ****** ****** *)

implement
trans3x_dexp
(env0, d3e0) = let
//
val
loc0 = d3e0.loc()
//
val
t2p0 = d3e0.type()
val
dend = d3e0.node()
//
val
t2p0 =
t2ype_normize(t2p0)
//
#if(__XATSOPT_DEBUG__)
// (*
val () =
println!
("trans3x_dexp: d3e0 = ", d3e0)
val () =
println!
("trans3x_dexp: t2p0 = ", t2p0)
// *)
#endif//__XATSOPT_DEBUG__
//
in(*in-of-let*)
//
case+ dend of
//
|
D3Ei00(int) =>
d3exp_make_node
(loc0, t2p0, D3Ei00(int))
|
D3Eb00(btf) =>
d3exp_make_node
(loc0, t2p0, D3Eb00(btf))
|
D3Ec00(str) =>
d3exp_make_node
(loc0, t2p0, D3Ec00(str))
|
D3Es00(str) =>
d3exp_make_node
(loc0, t2p0, D3Es00(str))
//
|
D3Eint(int) =>
d3exp_make_node
(loc0, t2p0, D3Eint(int))
|
D3Ebtf(btf) =>
d3exp_make_node
(loc0, t2p0, D3Ebtf(btf))
|
D3Echr(chr) =>
d3exp_make_node
(loc0, t2p0, D3Echr(chr))
|
D3Eflt(flt) =>
d3exp_make_node
(loc0, t2p0, D3Eflt(flt))
|
D3Estr(str) =>
d3exp_make_node
(loc0, t2p0, D3Estr(str))
//
|
D3Evar _ =>
let
val
dend = auxvar(env0, dend)
in
d3exp_make_node(loc0, t2p0, dend)
end
//
(*
|
D3Ekvar _ =>
let
val
dend = auxkvar(env0, dend)
in
d3exp_make_node(loc0, t2p0, dend)
end
*)
//
|
D3Etcon
( d2c0
, ti3a, ti2s) =>
let
//
val
ti3a =
trans3x_ti3a(env0, ti3a)
//
in
d3exp_make_node
( loc0
, t2p0
, D3Etcon(d2c0, ti3a, ti2s))
end
//
|
D3Etcst
( d2c0
, ti3a, ti2s) =>
let
//
val
ti3a =
trans3x_ti3a(env0, ti3a)
//
in
d3exp_make_node
( loc0
, t2p0
, D3Etcst(d2c0, ti3a, ti2s))
end
//
|
D3Etimp
( stmp
, tcst, targ
, d3cl, tsub) =>
let
val tcst =
trans3x_dexp(env0, tcst)
val d3cl =
trans3x_decl(env0, d3cl)
val targ = t2ypelst_normize(targ)
val tsub = t2ypelst_normize(tsub)
in
d3exp_make_node
( loc0
, t2p0
, D3Etimp
  (stmp, tcst, targ, d3cl, tsub))
end // end of [D3Etimp]
//
|
D3Esap0
(d3f1, s2es) =>
let
val
d3f1 = trans3x_dexp(env0, d3f1)
in
d3exp_make_node
(loc0, t2p0, D3Esap0(d3f1, s2es))
end
|
D3Esap1
(d3f1, s2es) =>
let
val
d3f1 = trans3x_dexp(env0, d3f1)
in
d3exp_make_node
(loc0, t2p0, D3Esap1(d3f1, s2es))
end
//
|
D3Etapp
(d2f1, s2es) =>
(
d3exp_make_node
(loc0, t2p0, D3Etapp(d2f1, s2es))
)
|
D3Edapp
(d3f1, npf2, d3es) =>
let
val
d3f1 =
trans3x_dexp(env0, d3f1)
val
d3es =
trans3x_dexplst(env0, d3es)
in
d3exp_make_node
( loc0
, t2p0, D3Edapp(d3f1, npf2, d3es)
)
end
|
D3Epcon
(d3e1(*con*), lab2) =>
let
val
d3e1 =
trans3x_dexp(env0, d3e1)
in
d3exp_make_node
(loc0, t2p0, D3Epcon(d3e1, lab2))
end
|
D3Epbox
( d3e1, lab2, idx2 ) =>
let
val
d3e1 =
trans3x_dexp(env0, d3e1)
in
d3exp_make_node
( loc0
, t2p0, D3Epbox(d3e1, lab2, idx2)
)
end
//
|
D3Eproj
( d3e1, lab2, idx2 ) =>
let
val
d3e1 =
trans3x_dexp(env0, d3e1)
in
d3exp_make_node
( loc0
, t2p0, D3Eproj(d3e1, lab2, idx2)
)
end
|
D3Eplft
( d3e1, lab2, idx2 ) =>
let
val
d3e1 =
trans3x_dexp(env0, d3e1)
in
d3exp_make_node
( loc0
, t2p0, D3Eplft(d3e1, lab2, idx2)
)
end
|
D3Epptr
( d3e1, lab2, idx2 ) =>
let
val
d3e1 =
trans3x_dexp(env0, d3e1)
in
d3exp_make_node
( loc0
, t2p0, D3Epptr(d3e1, lab2, idx2)
)
end
//
|
D3Elet
(d3cs, d3e1(*seqn*)) =>
let
val () =
tr3xenv_add_let1(env0)
val
d3cs =
trans3x_declist(env0, d3cs)
val
d3e1 = trans3x_dexp(env0, d3e1)
val () = tr3xenv_pop_let1(env0)
in
  d3exp_make_node
  (loc0, t2p0, D3Elet(d3cs, d3e1))
end
|
D3Ewhere(d3e1, d3cs) =>
let
val () =
tr3xenv_add_let1(env0)
val
d3cs =
trans3x_declist(env0, d3cs)
val
d3e1 = trans3x_dexp(env0, d3e1)
val () = tr3xenv_pop_let1(env0)
in
  d3exp_make_node
  (loc0, t2p0, D3Ewhere(d3e1, d3cs))
end
//
|
D3Eif0
(d3e1, d3e2, opt3) =>
let
val d3e1 =
trans3x_dexp(env0, d3e1)
val d3e2 =
trans3x_dexp(env0, d3e2)
val opt3 =
trans3x_dexpopt(env0, opt3)
in
d3exp_make_node
( loc0
, t2p0, D3Eif0(d3e1, d3e2, opt3))
end
|
D3Eif1
( d3e1
, d3e2, opt3, tinv) =>
let
val d3e1 =
trans3x_dexp(env0, d3e1)
val d3e2 =
trans3x_dexp(env0, d3e2)
val opt3 =
trans3x_dexpopt(env0, opt3)
in
d3exp_make_node
( loc0
, t2p0
, D3Eif1(d3e1, d3e2, opt3, tinv))
end
//
|
D3Ecas0
(knd0, d3e1, dcls) =>
let
val d3e1 =
trans3x_dexp(env0, d3e1)
val dcls =
trans3x_dclaulst(env0, dcls)
in
  d3exp_make_node
  ( loc0
  , t2p0
  , D3Ecas0(knd0, d3e1, dcls))
end // end of [D3Ecase0]
//
|
D3Elam _ =>
let
val dend = aux_lam(env0, dend)
in
  d3exp_make_node(loc0, t2p0, dend)
end
|
D3Efix _ =>
let
val dend = aux_fix(env0, dend)
in
  d3exp_make_node(loc0, t2p0, dend)
end
//
|
D3Eaddr(d3e1) =>
let
val d3e1 =
trans3x_dexp(env0, d3e1)
val dend = D3Eaddr(d3e1)
in
  d3exp_make_node(loc0, t2p0, dend)
end
|
D3Eeval
(knd0, d3e1) =>
let
val d3e1 =
trans3x_dexp(env0, d3e1)
val dend = D3Eeval(knd0, d3e1)
in
  d3exp_make_node(loc0, t2p0, dend)
end
|
D3Efree
(knd0, d3e1) =>
let
val d3e1 =
trans3x_dexp(env0, d3e1)
val dend = D3Efree(knd0, d3e1)
in
  d3exp_make_node(loc0, t2p0, dend)
end
//
|
D3Eraise(d3e1) =>
let
val d3e1 =
trans3x_dexp(env0, d3e1)
in
let
  val dend = D3Eraise( d3e1 )
in
  d3exp_make_node(loc0, t2p0, dend)
end
end // end of [D3Eraise]
//
|
D3Elazy( d3e1 ) =>
let
//
val d3e1 =
trans3x_dexp(env0, d3e1)
//
in
let
  val dend = D3Elazy(  d3e1  )
in
  d3exp_make_node(loc0, t2p0, dend)
end
end // end of [ D3Elazy ]
|
D3Ellazy
(d3e1, d3es(*free*)) =>
let
//
val d3e1 =
trans3x_dexp(env0, d3e1)
val d3es =
trans3x_dexplst(env0, d3es)
//
val dend = D3Ellazy(d3e1, d3es)
//
in
  d3exp_make_node(loc0, t2p0, dend)
end // end of [D3Ellazy]
//
|
D3Eanno
( d3e1
, s1e2, s2e2(*anno*)) =>
let
//
val d3e1 =
trans3x_dexp(env0, d3e1)
//
val dend =
D3Eanno(d3e1, s1e2, s2e2)
//
in
  d3exp_make_node(loc0, t2p0, dend)
end // end of [ D3Eanno ]
//
|
D3Eexist1
( s2es(*wits*)
, d3e1(*packed*)) =>
let
//
val d3e1 =
trans3x_dexp(env0, d3e1)
//
val dend = D3Eexist1(s2es, d3e1)
//
in
  d3exp_make_node(loc0, t2p0, dend)
end // end of [ D3Eexist1 ]
//
|
dend(*else*) =>
let
val d3e0 =
d3exp_make_node(loc0, t2p0, dend) in d3e0
end
//
end // end of [trans3x_dexp]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
trans3x_dexpopt
(env0, opt) =
(
case+ opt of
| None() => None()
| Some(d3e) =>
  Some(trans3x_dexp(env0, d3e))
) (* end of [trans3x_dexpopt] *)

(* ****** ****** *)

implement
trans3x_dexplst
  (env0, d3es) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3exp><d3exp>(d3es)
) where
{
implement
list_map$fopr<d3exp><d3exp>(d3e0) =
let
val env0 =
$UN.castvwtp0{tr3xenv}(env0)
val d3e0 = trans3x_dexp(env0, d3e0)
in
let
prval () = $UN.cast2void(env0) in d3e0
end
end
}
end (*let*) // end of [trans3x_dexplst]

(* ****** ****** *)

implement
trans3x_dgua
  (env0, d3g0) =
let
val loc0 = d3g0.loc()
in
case+
d3g0.node() of
|
D3GUAexp(d3e1) =>
let
val
d3e1 =
trans3x_dexp(env0, d3e1)
in
d3gua_make_node(loc0, D3GUAexp(d3e1))
end
|
D3GUAmat(d3e1, d3p2) =>
let
val
d3e1 =
trans3x_dexp(env0, d3e1)
in
d3gua_make_node(loc0, D3GUAmat(d3e1, d3p2))
end
end (* end of [trans3x_dgua] *)

(* ****** ****** *)
//
implement
trans3x_dgpat
  (env0, d3gp) = let
//
val loc0 = d3gp.loc()
//
in
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
d3p1 = trans3x_dpat(env0, d3p1)
}
|
D3GPATgua(d3p1, d3gs) =>
(
d3gpat_make_node
(loc0, D3GPATgua(d3p1, d3gs))
) where
{
val
d3p1 = trans3x_dpat(env0, d3p1)
val
d3gs = trans3x_dgualst(env0, d3gs)
}
end (*let*) // end of [trans3x_dgpat]
//
implement
trans3x_dgualst
  (env0, d3gs) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3gua><d3gua>(d3gs)
) where
{
implement
list_map$fopr<d3gua><d3gua>(d3g0) =
let
val env0 =
$UN.castvwtp0{tr3xenv}(env0)
val d3g0 = trans3x_dgua(env0, d3g0)
in
let
prval () = $UN.cast2void(env0) in d3g0
end
end
}
end (*let*) // end of [trans3x_dgualst]
//
(* ****** ****** *)
//
implement
trans3x_dclau
  (env0, d3cl) =
let
val loc0 = d3cl.loc()
in
case+
d3cl.node() of
|
D3CLAUpat(d3gp) =>
let
  val
  d3gp =
  trans3x_dgpat(env0, d3gp)
in
d3clau_make_node(loc0, D3CLAUpat(d3gp))
end
|
D3CLAUexp(d3gp, d3e1) =>
let
  val
  d3e1 = trans3x_dexp(env0, d3e1)
  val
  d3gp = trans3x_dgpat(env0, d3gp)
in
d3clau_make_node(loc0, D3CLAUexp(d3gp, d3e1))
end
end (* end of [trans3x_dclau] *)
//
implement
trans3x_dclaulst
  (env0, dcls) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3clau><d3clau>(dcls)
) where
{
implement
list_map$fopr<d3clau><d3clau>(d3cl) =
let
val env0 =
$UN.castvwtp0{tr3xenv}(env0)
val d3cl = trans3x_dclau(env0, d3cl)
in
let prval () = $UN.cast2void(env0) in d3cl end
end
}
end // end of [trans3x_dclaulst]
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
aux_include
( env0:
! tr3xenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.loc()
//
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
  Some(trans3x_declist(env0, d3cs))
) : d3eclistopt // end-of-val
//
in
//
d3ecl_make_node
( loc0
, D3Cinclude(tok, src, knd, fopt, dopt))
end // end of [aux_include]

(* ****** ****** *)

fun
aux_staload
( env0:
! tr3xenv
, d3cl: d3ecl): d3ecl = d3cl

(* ****** ****** *)

fun
aux_fundclst
( env0:
! tr3xenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.loc()
val-
D3Cfundclst
( knd
, mopt
, tqas, f3ds) = d3cl.node()
//
fun
auxf3d0
( env0:
! tr3xenv
, f3d0
: d3fundecl
)
: d3fundecl =
let
val+
D3FUNDECL(rcd) = f3d0
//
val loc = rcd.loc
val nam = rcd.nam
val f2g = rcd.f2g
val f3g = rcd.f3g
val res = rcd.res
val d2c = rcd.d2c
val def = rcd.def
val rtp = rcd.rtp
val wtp = rcd.wtp
val ctp = rcd.ctp
//
(*
//
(*
HX-2021-06-06:
It is bound to d2c!
*)
//
val () =
tr3xenv_add_fix1(env0, nam)
*)
//
val f3g =
(
case+ f3g of
|
None() =>
None()
|
Some(f3as) =>
Some(trans3x_farglst(env0, f3as))
) : f3arglstopt//end-of [val f3g]
//
val def =
(
case+ f3g of
|
None() => def
|
Some(f3as) =>
(
case+ def of
|
None() => None()
|
Some(body) =>
Some
(aux_f3as_body(env0, f3as, body))
)
) : d3expopt // val
//
(*
val () =
tr3xenv_pop_fix1(env0)
*)
//
val rtp = t2ype_normize(rtp) 
//
in
D3FUNDECL
@{
 loc=loc
,nam=nam,d2c=d2c
,f2g=f2g,f3g=f3g
,res=res,def=def,rtp=rtp,wtp=wtp,ctp=ctp}
end // end of [auxf3d0]
//
and
auxf3ds
( env0:
! tr3xenv
, f3ds
: d3fundeclist
)
: d3fundeclist =
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
$UN.castvwtp0{tr3xenv}(env0)
val f3d0 = auxf3d0(env0, f3d0)
in
let
prval () = $UN.cast2void(env0) in f3d0
end
end
} (* end of [auxf3ds] *)
//
and
aux_f3as_body
( env0
: !tr3xenv
, f3as
: f3arglst, body: d3exp): d3exp =
let
val () =
tr3xenv_add_lams(env0, f3as)
//
val
body = trans3x_dexp(env0, body)
//
in
let
val () = tr3xenv_pop_lams(env0) in body
end
end // end of [aux_f3as_body]
//
val f3ds = auxf3ds(env0, f3ds)
//
in
d3ecl_make_node
(loc0, D3Cfundclst(knd, mopt, tqas, f3ds))
end // end of [aux_fundclst]

(* ****** ****** *)

fun
aux_valdclst
( env0:
! tr3xenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.loc()
val-
D3Cvaldclst
( knd
, mopt
, v3ds) = d3cl.node()
//
fun
auxv3d0
( env0:
! tr3xenv
, v3d0
: d3valdecl
)
: d3valdecl =
let
val+
D3VALDECL(rcd) = v3d0
//
val loc = rcd.loc
val pat = rcd.pat
val def = rcd.def
val wtp = rcd.wtp
//
val pat =
trans3x_dpat(env0, pat)
val () =
tr3xenv_add_dpat(env0, pat)
//
val def =
(
case+ def of
|
None() => None()
|
Some(d3e0) =>
Some(trans3x_dexp(env0, d3e0))
) : d3expopt // end-of-val
//
in
D3VALDECL
(@{loc=loc,pat=pat,def=def,wtp=wtp})
end // end of [auxv3d0]
and
auxv3ds
( env0:
! tr3xenv
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
  $UN.castvwtp0{tr3xenv}(env0)
  val v3d0 = auxv3d0(env0, v3d0)
in
let
prval () = $UN.cast2void(env0) in v3d0
end
end
} (* end of [auxv3ds] *)
//
val v3ds = auxv3ds(env0, v3ds)
//
in
  d3ecl_make_node
  (loc0, D3Cvaldclst(knd, mopt, v3ds))
end (*let*) // end of [aux_valdclst]

(* ****** ****** *)

fun
aux_vardclst
( env0:
! tr3xenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.loc()
val-
D3Cvardclst
( knd
, mopt
, v3ds) = d3cl.node()
//
fun
auxv3d0
( env0:
! tr3xenv
, v3d0
: d3vardecl
)
: d3vardecl =
let
val+
D3VARDECL(rcd) = v3d0
//
val loc = rcd.loc
val d2v = rcd.d2v
val wth = rcd.wth
val res = rcd.res
val ini = rcd.ini
//
val () =
tr3xenv_add_dvar(env0, d2v)
val () =
(
case+ wth of
|
None() => ()
|
Some(d2v) =>
tr3xenv_add_dvar(env0, d2v)
)
//
val ini =
(
case+ ini of
|
None() => None()
|
Some(d3e0) =>
Some(trans3x_dexp(env0, d3e0))
) : d3expopt // end-of-val
//
in
D3VARDECL
@{
 loc=loc
,d2v=d2v,wth=wth,res=res,ini=ini}
end // end of [auxv3d0]
and
auxv3ds
( env0:
! tr3xenv
, v3ds
: d3vardeclist
)
: d3vardeclist =
list_vt2t
(
list_map<d3vardecl><d3vardecl>(v3ds)
) where
{
val
env0 =
$UN.castvwtp1{ptr}(env0)
implement
list_map$fopr<d3vardecl><d3vardecl>
  (v3d0) =
let
  val env0 =
  $UN.castvwtp0{tr3xenv}(env0)
  val v3d0 = auxv3d0(env0, v3d0)
in
let
prval () = $UN.cast2void(env0) in v3d0
end
end
} (* end of [auxv3ds] *)
//
val v3ds = auxv3ds(env0, v3ds)
//
in
  d3ecl_make_node
  (loc0, D3Cvardclst(knd, mopt, v3ds))
end // end-of-let // end of [aux_vardclst]

(* ****** ****** *)

fun
aux_implmnt3
( env0:
! tr3xenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cimplmnt3
( tok0
, stmp, mopt
, sqas, tqas
, id2c
, ti3a, ti2s
, f3as
, res1, body) = d3cl.node()
//
local
//
fun
aux_f3as_body
( env0:
! tr3xenv
, f3as
: f3arglst
, body: d3exp): d3exp =
let
val () =
tr3xenv_add_lams(env0, f3as)
//
val
body = trans3x_dexp(env0, body)
//
in
let
  val () =
  tr3xenv_pop_lams(env0) in body
end
end // end of [aux_f3as_body]
//
in(*in-of-local*)
//
val
f3as = trans3x_farglst(env0,f3as)
val
body = aux_f3as_body(env0,f3as,body)
//
end // end of [local]
//
in
d3ecl_make_node
( loc0
, D3Cimplmnt3
  ( tok0
  , stmp, mopt
  , sqas, tqas
  , id2c, ti3a, ti2s, f3as, res1, body))
end // end of [aux_implmnt3]

(* ****** ****** *)

in(*in-of-local*)

implement
trans3x_decl
(env0, d3cl) = let
//
val loc0 = d3cl.loc()
//
in(* in-of-let *)
//
case+
d3cl.node() of
//
D3Clocal
(head, body) => let
  val () =
  tr3xenv_add_loc1(env0)
  val
  head =
  trans3x_declist(env0, head)
//
  val () =
  tr3xenv_add_loc2(env0)
  val
  body =
  trans3x_declist(env0, body)
//
in
let
val () = tr3xenv_pop_loc12(env0)
in
d3ecl_make_node(loc0, D3Clocal(head, body))
end
end
//
|
D3Cinclude _ => aux_include(env0, d3cl)
|
D3Cstaload _ => aux_staload(env0, d3cl)
//
|
D3Cfundclst _ => aux_fundclst(env0, d3cl)
//
|
D3Cvaldclst _ => aux_valdclst(env0, d3cl)
|
D3Cvardclst _ => aux_vardclst(env0, d3cl)
//
|
D3Cimplmnt3 _ => aux_implmnt3(env0, d3cl)
//
| _(*rest-of-d3ecl*) => d3cl // yet-to-be-handled
//
end // end of [trans3x_decl]

end // end of [local]
//
(* ****** ****** *)
//
implement
trans3x_declist
  (env0, dcls) = let
//
val
env0 =
$UN.castvwtp1{ptr}(env0)
//
in
list_vt2t
(
list_map<d3ecl><d3ecl>(dcls)
) where
{
implement
list_map$fopr<d3ecl><d3ecl>(d3cl) =
let
val env0 =
$UN.castvwtp0{tr3xenv}(env0)
val d3cl = trans3x_decl(env0, d3cl)
in
  let prval() = $UN.cast2void(env0) in d3cl end
end
}
end // end of [trans3x_declist]
//
(* ****** ****** *)

(* end of [xats_trans3x_dynexp.dats] *)
