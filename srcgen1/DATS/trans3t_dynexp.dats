(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: March, 2020
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

#staload "./../SATS/trans33.sats"
#staload "./../SATS/trans3t.sats"

(* ****** ****** *)

implement
fprint_val<s2var> = fprint_s2var
implement
fprint_val<t2ype> = fprint_t2ype

(* ****** ****** *)
//
fn//HX:non-rec
t2ype_subst_svarlst
( t2p0: t2ype
, s2vs: s2varlst
, tsub: t2ypelst): t2ype =
(
case+ s2vs of
| list_nil _ => t2p0
| list_cons _ =>
  t2ype_subst_svarlst(t2p0, s2vs, tsub)
)
fn//HX:non-rec
t2ypelst_subst_svarlst
( t2ps: t2ypelst
, s2vs: s2varlst
, tsub: t2ypelst): t2ypelst =
(
case+ s2vs of
| list_nil _ => t2ps
| list_cons _ =>
  t2ypelst_subst_svarlst(t2ps, s2vs, tsub)
)
//
(* ****** ****** *)

implement
trans3t_envless
  (prog) =
  (prog) where
{
//
val
env0 =
implenv_make_nil()
//
val () =
implenv_push_init(env0)
//
val
prog =
trans3t_declist(env0, prog)
//
val () =
(
  implenv_pop0_init( env0 )
)
//
val () = implenv_free_nil(env0)
//
} (* end of [trans3t_envless] *)

(* ****** ****** *)

local

fun
auxtcst
( env0:
! implenv
, d3e0: d3exp): d3exp =
let
//
val
loc0 = d3e0.loc()
val
t2p0 = d3e0.type()
//
val-
D3Etcst
( d2c0
, ti3a
, ti2s) = d3e0.node()
//
(*
val () =
println!
("auxtcst: d2c0 = ", d2c0)
*)
//
val-
TI3ARGsome(targ) = ti3a
//
(*
val () =
println!
("auxtcst: ti3a = ", ti3a)
val () =
println!
("auxtcst: targ = ", targ)
*)
//
val
t2p0 =
t2ype_subst_implenv(t2p0, env0)
val
targ =
t2ypelst_subst_implenv(targ, env0)
//
(*
val () =
println!
("auxtcst: targ(1) = ", targ)
*)
//
val
d3e0 =
d3exp_make_node
( loc0
, t2p0
, D3Etcst
  ( d2c0
  , TI3ARGsome(targ), ti2s)
) (* end of [val] *)
//
(*
val
recq =
implenv_path_recq(env0, d3e0)
*)
//
in
//
(*
if
recq // && false
then
let
  val tpth = env0.path()
in
d3exp_make_node
( loc0
, t2p0, D3Etrec(d3e0, tpth) )
end // end of [then]
else
*)
let
//
val
opt0 =
implenv_find_timp
(env0, d2c0, targ)
//
in
//
case+ opt0 of
|
~None_vt() =>
let
  val tpth = env0.path()
in
d3exp_make_node
( loc0
, t2p0
, D3Eterr
  (d3e0, TI3ERRnfd(), tpth) )
end
|
~Some_vt
@(d3cl, s2vs, tsub) =>
let
//
val
stmp = d3timp_stamp_new()
val
d3e0_ =
d3exp_make_node
( loc0
, t2p0
, D3Etimp
  ( stmp
  , d3e0, targ, d3cl, tsub)
)
//
val
recq_ =
implenv_path_recq(env0, d3e0_)
//
in
if
recq_
then
let
  val tpth = env0.path()
in
d3exp_make_node
( loc0
, t2p0
, D3Eterr
  (d3e0_, TI3ERRrec(), tpth) )
end // end of [then]
else
let
val () =
implenv_push_timp
(env0, d3e0_(*new*), s2vs, tsub)
val
d3cl_ = trans3t_timp(env0, d3cl)
val () = implenv_pop0_timp(env0)
//
in
  d3exp_make_node
  ( loc0
  , t2p0
  , D3Etimp
    (stmp, d3e0, targ, d3cl_, tsub)
 )
end // end of [else]
end // end of [Some_vt]
//
end // end of [else]
//
end // end of [auxtcst]

in(*in-of-local*)

implement
trans3t_dexp
  (env0, d3e0) = let
//
val loc0 = d3e0.loc()
val t2p0 = d3e0.type()
//
#if(__XATSOPT_DEBUG__)
(*
val () =
println!
("trans3t_dexp: loc0 = ", loc0)
val () =
println!
("trans3t_dexp: d3e0 = ", d3e0)
val () =
println!
("trans3t_dexp: t2p0 = ", t2p0)
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
| D3Etop _ => d3e0
//
| D3Evar _ => d3e0
| D3Ekvar _ => d3e0
//
| D3Econ1 _ => d3e0
| D3Ecst1 _ => d3e0
//
| D3Esym0 _ => d3e0
//
| D3Efcon _ => d3e0
| D3Efcst _ => d3e0
//
| D3Etapp _ => d3e0
//
| D3Etcon _ => d3e0
| D3Etcst _ =>
  auxtcst(env0, d3e0)
//
| D3Etimp _ => (d3e0)
//
| D3Esap0
  (d3e1, s2es) =>
  let
  val d3e1 =
  trans3t_dexp(env0, d3e1)
  in
  d3exp_make_node
  ( loc0
  , t2p0, D3Esap0(d3e1, s2es))
  end // end of [D3Esap0]
| D3Esap1
  (d3e1, s2es) =>
  let
  val d3e1 =
  trans3t_dexp(env0, d3e1)
  in
  d3exp_make_node
  ( loc0
  , t2p0, D3Esap1(d3e1, s2es))
  end // end of [D3Esap1]
//
| D3Edapp
  (d3f0, npf1, d3es) =>
  let
  val d3f0 =
  trans3t_dexp(env0, d3f0)
  val d3es =
  trans3t_dexplst(env0, d3es)
  in
  d3exp_make_node
  ( loc0, t2p0
  , D3Edapp(d3f0, npf1, d3es))
  end // end of [D3Edapp]
//
| D3Epcon
  (d3e1, lab2) =>
  let
  val d3e1 =
  trans3t_dexp(env0, d3e1)
  in
  d3exp_make_node
  ( loc0
  , t2p0, D3Epcon(d3e1, lab2))
  end
| D3Epbox
  (d3e1, lab2, idx2) =>
  let
  val d3e1 =
  trans3t_dexp(env0, d3e1)
  in
  d3exp_make_node
  ( loc0, t2p0
  , D3Epbox(d3e1, lab2, idx2))
  end
//
| D3Eproj
  (d3e1, lab2, idx2) =>
  let
  val d3e1 =
  trans3t_dexp(env0, d3e1)
  in
  d3exp_make_node
  ( loc0, t2p0
  , D3Eproj(d3e1, lab2, idx2))
  end // end of [D3Eproj]
| D3Eplft
  (d3e1, lab2, idx2) =>
  let
  val d3e1 =
  trans3t_dexp(env0, d3e1)
  in
  d3exp_make_node
  ( loc0, t2p0
  , D3Eplft(d3e1, lab2, idx2))
  end // end of [D3Eplft]
| D3Epptr
  (d3e1, lab2, idx2) =>
  let
  val d3e1 =
  trans3t_dexp(env0, d3e1)
  in
  d3exp_make_node
  ( loc0, t2p0
  , D3Epptr(d3e1, lab2, idx2))
  end // end of [D3Epptr]
//
| D3Elet(d3cs, d3e1) =>
  let
    val () =
    implenv_add_let1(env0)
    val
    d3cs =
    trans3t_declist(env0, d3cs)
    val
    d3e1 = trans3t_dexp(env0, d3e1)
    val () =
    implenv_pop_let1(env0)
  in
    d3exp_make_node
    (loc0, t2p0, D3Elet(d3cs, d3e1))
  end
//
| D3Ewhere(d3e1, d3cs) =>
  let
    val () =
    implenv_add_let1(env0)
    val
    d3cs =
    trans3t_declist(env0, d3cs)
    val
    d3e1 = trans3t_dexp(env0, d3e1)
    val () =
    implenv_pop_let1(env0)
  in
    d3exp_make_node
    (loc0, t2p0, D3Ewhere(d3e1, d3cs))
  end
//
| D3Eseqn(d3es, d3e1) =>
  let
    val
    d3es =
    trans3t_dexplst(env0, d3es)
    val
    d3e1 = trans3t_dexp(env0, d3e1)
  in
    d3exp_make_node
    (loc0, t2p0, D3Eseqn(d3es, d3e1))
  end
//
| D3Etrcd1
  (knd, npf, d3es) =>
  let
    val
    d3es =
    trans3t_dexplst(env0, d3es)
  in
    d3exp_make_node
    (loc0, t2p0, D3Etrcd1(knd, npf, d3es))
  end
//
| D3Eassgn(d3el, d3er) =>
  let
    val
    d3el = trans3t_dexp(env0, d3el)
    val
    d3er = trans3t_dexp(env0, d3er)
  in
    d3exp_make_node
    (loc0, t2p0, D3Eassgn(d3el, d3er))
  end
//
| D3Eif0
  (d3e1, d3e2, opt3) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
    val d3e2 =
    trans3t_dexp(env0, d3e2)
    val opt3 =
    trans3t_dexpopt(env0, opt3)
  in
    d3exp_make_node
    (loc0, t2p0, D3Eif0(d3e1, d3e2, opt3))
  end
| D3Eif1
  (d3e1, d3e2, opt3, tinv) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
    val d3e2 =
    trans3t_dexp(env0, d3e2)
    val opt3 =
    trans3t_dexpopt(env0, opt3)
  in
    d3exp_make_node
    (loc0, t2p0, D3Eif1(d3e1, d3e2, opt3, tinv))
  end
//
| D3Ecas0
  (knd0, d3e1, dcls) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
    val dcls =
    trans3t_dclaulst(env0, dcls)
  in
    d3exp_make_node
    (loc0, t2p0, D3Ecas0(knd0, d3e1, dcls))
  end
| D3Ecas1
  (knd0, d3e1, dcls, tinv) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
    val dcls =
    trans3t_dclaulst(env0, dcls)
  in
    d3exp_make_node
    (loc0, t2p0, D3Ecas1(knd0, d3e1, dcls, tinv))
  end
//
| D3Elam
  ( knd0
  , arg1, res2, arrw, body) =>
  let
    val body =
    trans3t_dexp(env0, body)
  in
    d3exp_make_node
    ( loc0
    , t2p0
    , D3Elam(knd0, arg1, res2, arrw, body))
  end // D3Elam
| D3Efix
  ( knd0
  , d2v0, arg1, res2, arrw, body) =>
  let
    val body =
    trans3t_dexp(env0, body)
  in
    d3exp_make_node
    ( loc0
    , t2p0
    , D3Efix
      (knd0, d2v0, arg1, res2, arrw, body))
  end // D3Efix
//
| D3Etry0
  (tok0, d3e1, d3cls) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
    val dcls =
    trans3t_dclaulst(env0, d3cls)
  in
    d3exp_make_node
    (loc0, t2p0, D3Etry0(tok0, d3e1, d3cls))
  end
//
| D3Eaddr(d3e1) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
  in
    d3exp_make_node(loc0, t2p0, D3Eaddr(d3e1))
  end // end of [D3Eaddr]
//
| D3Eflat(d3e1) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
  in
    d3exp_make_node(loc0, t2p0, D3Eflat(d3e1))
  end // end of [D3Eflat]
| D3Etalf(d3e1) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
  in
    d3exp_make_node(loc0, t2p0, D3Etalf(d3e1))
  end // end of [D3Eflat]
//
| D3Efold(d3e1) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
  in
    d3exp_make_node(loc0, t2p0, D3Efold(d3e1))
  end // end of [D3Efold]
//
| D3Eeval
  ( knd0, d3e1 ) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
    val node = D3Eeval(knd0, d3e1)
  in
    d3exp_make_node(loc0, t2p0, node(*eval*))
  end // end of [D3Eeval]
//
| D3Efree
  ( knd0, d3e1 ) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
    val node = D3Efree(knd0, d3e1)
  in
    d3exp_make_node(loc0, t2p0, node(*free*))
  end // end of [D3Efree]
//
| D3Eraise(d3e1) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
  in
    d3exp_make_node(loc0, t2p0, D3Eraise(d3e1))
  end // end of [D3Eraise]
//
| D3Elazy(d3e1) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
  in
    d3exp_make_node(loc0, t2p0, D3Elazy(d3e1))
  end // end of [D3Elazy]
| D3Ellazy(d3e1, d3es) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
    val d3es =
    trans3t_dexplst(env0, d3es)
  in
    d3exp_make_node(loc0, t2p0, D3Ellazy(d3e1, d3es))
  end // end of [D3Ellazy]
//
| D3Eanno
  (d3e1, s1e2, s2e2) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
  in
    d3exp_make_node
      (loc0, t2p0, D3Eanno(d3e1, s1e2, s2e2))
    // d3exp_make_node
  end
//
| D3Eexist1(s2es, d3e1) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
  in
    d3exp_make_node(loc0, t2p0, D3Eexist1(s2es, d3e1))
  end
//
| D3Ebrack _ =>
  d3exp_make_node(loc0, t2p0, D3Enone2(d3e0))
| D3Edtsel _ =>
  d3exp_make_node(loc0, t2p0, D3Enone2(d3e0))
//
| D3Elcast(d3e1, lab2) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
  in
    d3exp_make_node(loc0, t2p0, D3Elcast(d3e1, lab2))
  end
(*
| D3Elcast(d3e1, lab2) => d3e0 (* HX: lab2: missing label *)
*)
//
| D3Etcast(d3e1, t2p2) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
  in
    d3exp_make_node(loc0, t2p0, D3Etcast(d3e1, t2p2))
  end
(*
| D3Etcast(d3e1, t2p2) => d3e0 (* HX: t2p2: expected type *)
*)
//
| D3Econ2 _ => d3e0 | D3Ecst2 _ => d3e0 |  D3Eterr _ => d3e0
//
| D3Enone0() => d3e0 | D3Enone1(d2e2) => d3e0 | D3Enone2(d3e2) => d3e0
//
end // end of [trans3t_dexp]

end (*local*) // end of [local]

(* ****** ****** *)
//
implement
trans3t_dexpopt
  (env0, opt0) =
(
case+ opt0 of
| None() => None()
| Some(d3e1) =>
  Some(trans3t_dexp(env0, d3e1))
)
//
(* ****** ****** *)

implement
trans3t_dexplst
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
$UN.castvwtp0{implenv}(env0)
val d3e0 = trans3t_dexp(env0, d3e0)
in
let prval () = $UN.cast2void(env0) in d3e0 end
end
}
end // end of [trans3t_dexplst]

(* ****** ****** *)

implement
trans3t_dgua
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
trans3t_dexp(env0, d3e1)
in
d3gua_make_node(loc0, D3GUAexp(d3e1))
end
|
D3GUAmat(d3e1, d3p2) =>
let
val
d3e1 =
trans3t_dexp(env0, d3e1)
in
d3gua_make_node(loc0, D3GUAmat(d3e1, d3p2))
end
end (* end of [trans3t_dgua] *)

(* ****** ****** *)
//
implement
trans3t_dgpat
  (env0, d3gp) = let
//
val loc0 = d3gp.loc()
//
in
case+
d3gp.node() of
|
D3GPATpat(d3p1) => d3gp
|
D3GPATgua(d3p1, d3gs) =>
(
  d3gpat_make_node
  (loc0, D3GPATgua(d3p1, d3gs))
) where
{
  val d3gs =
  trans3t_dgualst(env0, d3gs)
}
end (*let*) // end of [trans3t_dgpat]
//
implement
trans3t_dgualst
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
$UN.castvwtp0{implenv}(env0)
val d3g0 = trans3t_dgua(env0, d3g0)
in
let
prval () = $UN.cast2void(env0) in d3g0
end
end
}
end (*let*) // end of [trans3t_dgualst]

(* ****** ****** *)
//
implement
trans3t_dclau
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
  trans3t_dgpat(env0, d3gp)
in
  d3clau_make_node(loc0, D3CLAUpat(d3gp))
end
|
D3CLAUexp(d3gp, d3e1) =>
let
  val
  d3e1 = trans3t_dexp(env0, d3e1)
  val
  d3gp = trans3t_dgpat(env0, d3gp)
in
d3clau_make_node(loc0, D3CLAUexp(d3gp, d3e1))
end
end (* end of [trans3t_dclau] *)
//
implement
trans3t_dclaulst
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
$UN.castvwtp0{implenv}(env0)
val d3cl = trans3t_dclau(env0, d3cl)
in
let prval () = $UN.cast2void(env0) in d3cl end
end
}
end // end of [trans3t_dclaulst]
//
(* ****** ****** *)

local

(* ****** ****** *)

fun
auxtsub_make
( s2vs
: s2varlst
, xtvs
: t2xtvlst): t2ypelst_vt =
(
case+ s2vs of
| list_nil() =>
  list_vt_nil()
| list_cons(s2v0, s2vs) =>
  let
//
  val-
  list_cons
  (xtv0, xtvs) = xtvs
//
  val s2t0 = s2v0.sort()
  val t2p0 =
  t2ype_new_srt_xtv(s2t0, xtv0)
//
  in
    list_vt_cons
    (t2p0, auxtsub_make(s2vs, xtvs))
  end
) (* end of [auxtsub_make] *)

(* ****** ****** *)

fun
aux_include
( env0:
! implenv
, d3cl: d3ecl): d3ecl =
let
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
  Some(trans3t_declist(env0, d3cs))
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
! implenv
, d3cl: d3ecl): d3ecl =
let
val () =
implenv_add_staload(env0, d3cl) in d3cl
end // end of [aux_staload]

(* ****** ****** *)

fun
aux_fundclst
( env0:
! implenv
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
in
//
case+ tqas of
|
list_nil _ =>
(
trans3t_fundclst(env0, d3cl)
)
|
list_cons _ =>
let
val s2vs = tqas.s2vs()
val xtvs =
list_vt2t
(
list_map<s2var><t2xtv>(s2vs)
) where
{
implement
list_map$fopr<
  s2var><t2xtv>(s2v) =
  t2xtv_new_srt( loc0, s2v.sort() )
} (* end of [val xtvs] *)
val tsub =
(
  auxtsub_make(s2vs, xtvs)
)
val t2ps = list_vt2t(tsub)
//
val ti3e = TI3ENV(s2vs, xtvs, t2ps)
//
in
let
val () =
implenv_add_implmnt3(env0, d3cl, ti3e) in d3cl
end
end // end of [list_cons]
//
end (*let*) // end of [aux_fundclst]

(* ****** ****** *)

fun
aux_valdclst
( env0:
! implenv
, d3cl: d3ecl): d3ecl =
let
//
val-
D3Cvaldclst
( knd
, mopt
, v3ds) = d3cl.node()
//
val v3ds = auxv3ds(env0, v3ds)
//
in
d3ecl_make_node
(d3cl.loc(), D3Cvaldclst(knd, mopt, v3ds))
end where
{
//
fun
auxv3d0
( env0:
! implenv
, v3d0
: d3valdecl): d3valdecl =
let
//
val+D3VALDECL(rcd) = v3d0
//
val loc = rcd.loc
val pat = rcd.pat
val def = rcd.def
val wtp = rcd.wtp
//
val def = trans3t_dexpopt(env0, def)
//
in
D3VALDECL
@{loc=loc, pat=pat, def=def, wtp=wtp}
end // end of [auxv3d0]
//
fun
auxv3ds
( env0:
! implenv
, v3ds
: d3valdeclist): d3valdeclist =
(
case+ v3ds of
| list_nil() =>
  list_nil()
| list_cons(x0, xs) =>
  list_cons(auxv3d0(env0, x0), auxv3ds(env0, xs))
)
//
} (*where*) // end of [aux_valdclst]

(* ****** ****** *)
//
fun
aux_vardclst
( env0:
! implenv
, d3cl: d3ecl): d3ecl =
let
//
val-
D3Cvardclst
( knd
, mopt
, v3ds) = d3cl.node()
//
val v3ds = auxv3ds(env0, v3ds)
//
in
d3ecl_make_node
(d3cl.loc(), D3Cvardclst(knd, mopt, v3ds))
end where
{
//
fun
auxv3d0
( env0:
! implenv
, v3d0
: d3vardecl): d3vardecl =
let
//
val+D3VARDECL(rcd) = v3d0
//
val loc = rcd.loc
val d2v = rcd.d2v
val wth = rcd.wth
val res = rcd.res
val ini = rcd.ini
//
val ini = trans3t_dexpopt(env0, ini)
//
in
D3VARDECL
@{loc=loc
, d2v=d2v, wth=wth, res=res, ini=ini}
end // end of [auxv3d0]
//
fun
auxv3ds
( env0:
! implenv
, v3ds
: d3vardeclist): d3vardeclist =
(
case+ v3ds of
| list_nil() =>
  list_nil()
| list_cons(x0, xs) =>
  list_cons(auxv3d0(env0, x0), auxv3ds(env0, xs))
)
//
} (*where*) // end of [aux_vardclst]

(* ****** ****** *)
//
fun
aux_implmnt3
( env0:
! implenv
, d3cl: d3ecl): d3ecl = let
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
in
//
(*
if
iseqz(ti2s)
then
aux_implmnt3_fun(env0, d3cl)
else
aux_implmnt3_tmp(env0, d3cl)
*)
//
case+ ti3a of
| TI3ARGnone _ =>
  aux_implmnt3_fun(env0, d3cl)
| TI3ARGsome _ =>
  aux_implmnt3_tmp(env0, d3cl)
//
end // end of [aux_implmnt3]
//
and
aux_implmnt3_fun
( env0:
! implenv
, d3cl: d3ecl): d3ecl = let
//
val-
D3Cimplmnt3
( tok0
, stmp, mopt
, sqas, tqas
, id2c, ti3a, ti2s
, f3as, res1, body) = d3cl.node()
//
val body = trans3t_dexp(env0, body)
//
in(*in-of-let*)
//
d3ecl_make_node
(
d3cl.loc()
,
D3Cimplmnt3
( tok0
, stmp, mopt
, sqas, tqas
, id2c, ti3a, ti2s, f3as, res1, body)
)
//
end // end of [aux_implmnt3_fun]
and
aux_implmnt3_tmp
( env0:
! implenv
, d3cl: d3ecl): d3ecl = let
//
val
loc0 = d3cl.loc()
val-
D3Cimplmnt3
( tok0
, stmp, mopt
, sqas, tqas
, id2c, ti3a, ti2s
, f3as, res1, body) = d3cl.node()
//
val t2ps =
(
case- ti3a of
|
TI3ARGsome(t2ps) =>
t2ypelst_subst_implenv(t2ps, env0)
) : t2ypelst // end-of-val
//
val s2vs =
(
auxs2vs
(sqas, tqas)) where
{
fun
auxs2vs
( sqas
: sq2arglst
, tqas
: tq2arglst): s2varlst =
let
  val s2vs = sqas.s2vs()
in
  case s2vs of
  | list_nil _ => tqas.s2vs()
  | list_cons _ => s2vs + tqas.s2vs()
end // end of [auxs2vs]
}
//
val xtvs =
list_vt2t
(
  list_map<s2var><t2xtv>(s2vs)
) where
{
implement
list_map$fopr<
  s2var><t2xtv>(s2v) =
  t2xtv_new_srt( loc0, s2v.sort() )
} (* end of [val xtvs] *)
val tsub =
(
  auxtsub_make(s2vs, xtvs)
)
//
val t2ps =
let
val tsub = $UN.list_vt2t(tsub)
in
t2ypelst_subst_svarlst(t2ps, s2vs, tsub)
end // end of [val]
//
val
((*freed*)) = list_vt_free(tsub)
//
val ti3e = TI3ENV(s2vs, xtvs, t2ps)
//
in
//
let
val () =
implenv_add_implmnt3(env0, d3cl, ti3e) in d3cl
end
//
end // end of [aux_implmnt3_tmp]
//
(* ****** ****** *)

in(*in-of-local*)

implement
trans3t_decl
  (env0, d3cl) = let
//
val
loc0 = d3cl.loc()
//
(*
val () =
println!
("trans3t_decl: d3cl = ", d3cl)
*)
//
in(* in-of-let *)
//
case+
d3cl.node() of
//
| D3Cd2ecl _ => d3cl
//
| D3Cstatic
  (tok(*STATIC*), d3c1) =>
  (
  d3ecl_make_node
  ( loc0
  , D3Cstatic(tok, d3c1))
  ) where
  { val
    d3c1 = trans3t_decl(env0, d3c1)
  }
| D3Cextern
  (tok(*EXTERN*), d3c1) =>
  (
  d3ecl_make_node
  ( loc0
  , D3Cextern(tok, d3c1))
  ) where
  { val
    d3c1 = trans3t_decl(env0, d3c1)
  }
//
| D3Clocal
  (head, body) =>
  let
//
    val () =
    implenv_add_loc1(env0)
    val
    head =
    trans3t_declist(env0, head)
//
    val () =
    implenv_add_loc2(env0)
    val
    body =
    trans3t_declist(env0, body)
//
  in
    let
    val () =
    implenv_pop_loc12(env0) in
    d3ecl_make_node(loc0, D3Clocal(head, body))
    end
  end
//
| D3Cinclude _ =>
  let
    val d3cl =
    aux_include(env0, d3cl) in d3cl
  end // end of [D3Cinclude]
| D3Cstaload _ =>
  let
    val d3cl =
    aux_staload(env0, d3cl) in d3cl
  end // end of [D3Cstaload]
//
| D3Cfundclst _ => aux_fundclst(env0, d3cl)
//
| D3Cvaldclst _ => aux_valdclst(env0, d3cl)
| D3Cvardclst _ => aux_vardclst(env0, d3cl)
//
| D3Cimplmnt1 _ => d3cl
| D3Cimplmnt2 _ => d3cl
| D3Cimplmnt3 _ => aux_implmnt3(env0, d3cl)
//
| _ (* rest-of-d3ecl *) => d3cl // HX: yet-to-be-handled
//
end // end of [trans3t_decl]

end // end of [local]

(* ****** ****** *)

implement
trans3t_declist
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
$UN.castvwtp0{implenv}(env0)
val d3cl = trans3t_decl(env0, d3cl)
in
let prval () = $UN.cast2void(env0) in d3cl end
end
}
end // end of [trans3t_declist]

(* ****** ****** *)

implement
trans3t_fundclst
  (env0, d3cl) = let
//
val-
D3Cfundclst
( tok0
, mopt
, tqas, f3ds) = d3cl.node()
//
fun
auxf3d0
( env0:
! implenv
, f3d0
: d3fundecl
)
: d3fundecl =
let
//
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
(*
val ( ) =
println!
("trans3t_fundecl: d2c = ", d2c)
*)
//
val def =
(
case+ def of
| None() =>
  None()
| Some(d3e0) =>
  Some(trans3t_dexp(env0, d3e0))
) : d3expopt // end-of-val
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
//
fun
auxf3ds
( env0:
! implenv
, f3ds
: d3fundeclist
)
: d3fundeclist =
(
case+ f3ds of
| list_nil() =>
  list_nil(*void*)
|
list_cons(f3d0, f3ds) =>
(
  list_cons(f3d0, f3ds)
) where
{
val f3d0 = auxf3d0(env0, f3d0)
val f3ds = auxf3ds(env0, f3ds)
}
) (*case*) // end of [auxf3ds]
//
val f3ds = auxf3ds(env0, f3ds)
//
in
d3ecl_make_node
( d3cl.loc()
, D3Cfundclst(tok0, mopt, tqas, f3ds)
)
end // end of [trans3t_d3fundecl]

(* ****** ****** *)

local

fun
aux_fundclst
( env0:
! implenv
, d3cl: d3ecl): d3ecl =
(
trans3t_fundclst(env0, d3cl)
) (* end of [aux_fundclst] *)

(* ****** ****** *)

fun
aux_implmnt3
( env0:
! implenv
, d3cl: d3ecl): d3ecl =
let
val-
D3Cimplmnt3
( knd
, stmp, mopt
, sqas, tqas
, id2c, ti3a, ti2s
, f3as, res0, body) = d3cl.node()
//
val body = trans3t_dexp(env0, body)
//
in
//
d3ecl_make_node
( d3cl.loc()
, D3Cimplmnt3
  ( knd
  , stmp, mopt
  , sqas, tqas
  , id2c, ti3a, ti2s, f3as, res0, body))
//
end // end of [aux_implmnt3]

in (*in-of-local*)

implement
trans3t_timp
  (env0, d3cl) =
(
case+
d3cl.node() of
| D3Cfundclst _ =>
  aux_fundclst(env0, d3cl)
| D3Cimplmnt3 _ =>
  aux_implmnt3(env0, d3cl)
| _ (* rest-of-d3ecl *) => d3cl
)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans3t_dynexp.dats] *)
