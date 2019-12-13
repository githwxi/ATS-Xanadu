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

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trans3t.sats"

(* ****** ****** *)

implement
fprint_val<s2var> = fprint_s2var
implement
fprint_val<t2ype> = fprint_t2ype

(* ****** ****** *)
//
fn
t2ype_substs
( t2p0: t2ype
, s2vs: s2varlst
, tsub: t2ypelst): t2ype =
(
case+ s2vs of
| list_nil _ => t2p0
| list_cons _ =>
  t2ype_substs(t2p0, s2vs, tsub)
)
fn
t2ypelst_substs
( t2ps: t2ypelst
, s2vs: s2varlst
, tsub: t2ypelst): t2ypelst =
(
case+ s2vs of
| list_nil _ => t2ps
| list_cons _ =>
  t2ypelst_substs(t2ps, s2vs, tsub)
)
//
(* ****** ****** *)

implement
trans3t_program
  (d3cls) =
  (d3cls) where
{
val
env0 =
implenv_make_nil()
val () =
implenv_push_tsub
( env0
, list_nil(), list_nil())
//
val
d3cls =
trans3t_declist(env0, d3cls)
//
val () =
  implenv_pop0_tsub(env0)
//
val () = implenv_free_nil(env0)
//
} (* end of [trans3t_program] *)

(* ****** ****** *)

local

fun
auxtcst
( env0
: !implenv
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
val () =
println!
("auxtcst: d2c0 = ", d2c0)
//
val-
TI3ARGsome(targ) = ti3a
//
val () =
println!
("auxtcst: ti3a = ", ti3a)
val () =
println!
("auxtcst: targ = ", targ)
//
local
//
val s2vs = env0.s2vs()
val t2ps = env0.t2ps()
//
val () =
println!
("auxtcst: s2vs = ", s2vs)
val () =
println!
("auxtcst: t2ps = ", t2ps)
//
in
val
t2p0 =
t2ype_substs(t2p0, s2vs, t2ps)
val
targ =
t2ypelst_substs(targ, s2vs, t2ps)
end
//
val () =
println!
("auxtcst: targ(1) = ", targ)
//
val d3e0 =
d3exp_make_node
( loc0
, t2p0
, D3Etcst
  (d2c0, TI3ARGsome(targ), ti2s))
//
val opt0 =
implenv_find_timp(env0, d2c0, targ)
//
in
//
case+ opt0 of
|
~None_vt() => d3e0
|
~Some_vt
@(d3cl, s2vs, tsub) =>
let
//
val () =
implenv_push_tsub
(env0, s2vs, tsub)
val d3cl =
trans3t_timp(env0, d3cl)
val () =
implenv_pop0_tsub(env0)
//
in
  d3exp_make_node
  ( loc0, t2p0
  , D3Etimp(d3e0, targ, d3cl, tsub)
 )
end
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
val () =
println!
("trans3t_dexp: d3e0 = ", d3e0)
val () =
println!
("trans3t_dexp: t2p0 = ", t2p0)
//
in
//
case-
d3e0.node() of
//
| D3Eint _ => d3e0
| D3Ebtf _ => d3e0
| D3Echr _ => d3e0
| D3Eflt _ => d3e0
| D3Estr _ => d3e0
//
| D3Evar _ => d3e0
//
| D3Econ1 _ => d3e0
//
| D3Efcst _ => d3e0
//
| D3Etcst _ =>
  auxtcst(env0, d3e0)
| D3Etimp _ => (d3e0)
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
| D3Eproj
  (d3e1, lab2, idx2) =>
  let
  val d3e1 =
  trans3t_dexp(env0, d3e1)
  in
  d3exp_make_node
  ( loc0, t2p0
  , D3Eproj(d3e1, lab2, idx2))
  end
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
| D3Etuple
  (knd, npf, d3es) =>
  let
    val
    d3es =
    trans3t_dexplst(env0, d3es)
  in
    d3exp_make_node
    (loc0, t2p0, D3Etuple(knd, npf, d3es))
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
//
| D3Ecase
  (knd0, d3e1, dcls) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
    val dcls =
    trans3t_dclaulst(env0, dcls)
  in
    d3exp_make_node
    (loc0, t2p0, D3Ecase(knd0, d3e1, dcls))
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
    , D3Efix(knd0, d2v0, arg1, res2, arrw, body))
  end // D3Efix
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
| D3Eaddr(d3e1) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
  in
    d3exp_make_node(loc0, t2p0, D3Eaddr(d3e1))
  end // end of [D3Eaddr]
| D3Efold(d3e1) =>
  let
    val d3e1 =
    trans3t_dexp(env0, d3e1)
  in
    d3exp_make_node(loc0, t2p0, D3Efold(d3e1))
  end // end of [D3Efold]
//
end // end of [trans3t_dexp]

end // end of [local]

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
| D3GUAexp(d3e1) =>
  let
  val
  d3e1 =
  trans3t_dexp(env0, d3e1)
  in
  d3gua_make_node(loc0, D3GUAexp(d3e1))
  end
| D3GUAmat(d3e1, d3p2) =>
  let
  val
  d3e1 =
  trans3t_dexp(env0, d3e1)
  in
  d3gua_make_node(loc0, D3GUAmat(d3e1, d3p2))
  end
end (* end of [trans3t_dgua] *)

(* ****** ****** *)

implement
trans3t_dgpat
  (env0, d3gp) = let
//
val loc0 = d3gp.loc()
//
in
case+
d3gp.node() of
| D3GPATpat(d3p1) => d3gp
| D3GPATgua(d3p1, d3gs) =>
  (
  d3gpat_make_node
  (loc0, D3GPATgua(d3p1, d3gs))
  ) where
  {
    val d3gs =
    trans3t_dgualst(env0, d3gs)
  }
end // end of [trans3t_dgpat]

(* ****** ****** *)

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
let prval () = $UN.cast2void(env0) in d3g0 end
end
}
end // end of [trans3t_dgualst]

(* ****** ****** *)

implement
trans3t_dclau
  (env0, d3cl) =
let
val loc0 = d3cl.loc()
in
case+
d3cl.node() of
| D3CLAUpat(d3gp) =>
  let
  val d3gp = trans3t_dgpat(env0, d3gp)
  in
  d3clau_make_node(loc0, D3CLAUpat(d3gp))
  end
| D3CLAUexp(d3gp, d3e1) =>
  let
  val d3e1 = trans3t_dexp(env0, d3e1)
  val d3gp = trans3t_dgpat(env0, d3gp)
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
  val-
  list_cons(xtv0, xtvs) = xtvs
  val s2t0 = s2v0.sort()
  val t2p0 =
  t2ype_srt_xtv(s2t0, xtv0)
  in
    list_vt_cons
    (t2p0, auxtsub_make(s2vs, xtvs))
  end
) (* end of [auxtsub_make] *)

(* ****** ****** *)

fun
auxs2vs_make
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
end // end of [auxs2vs_make]

(* ****** ****** *)

fun
aux_include
( env0
: !implenv
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
aux_valdecl
( env0
: !implenv
, d3cl: d3ecl): d3ecl =
let
//
val-
D3Cvaldecl
( knd
, mopt
, v3ds) = d3cl.node()
//
val v3ds = auxv3ds(env0, v3ds)
//
in
d3ecl_make_node
(d3cl.loc(), D3Cvaldecl(knd, mopt, v3ds))
end where
{
//
fun
auxv3d0
( env0
: !implenv
, v3d0
: v3aldecl): v3aldecl =
let
//
val+V3ALDECL(rcd) = v3d0
//
val loc = rcd.loc
val pat = rcd.pat
val def = rcd.def
val wtp = rcd.wtp
//
val def = trans3t_dexpopt(env0, def)
//
in
V3ALDECL
@{loc=loc, pat=pat, def=def, wtp=wtp}
end // end of [auxv3d0]
//
fun
auxv3ds
( env0
: !implenv
, v3ds
: v3aldeclist): v3aldeclist =
(
case+ v3ds of
| list_nil() =>
  list_nil()
| list_cons(x0, xs) =>
  list_cons(auxv3d0(env0, x0), auxv3ds(env0, xs))
)
//
} (* end of [aux_valdecl] *)

(* ****** ****** *)

fun
aux_vardecl
( env0
: !implenv
, d3cl: d3ecl): d3ecl =
(
  d3cl
) where
{
 // HX: yet-to-be-done
}

(* ****** ****** *)

local

fun
auxd3cl
( env0
: !implenv
, d3cl: d3ecl): d3ecl =
(
  d3cl
) where
{
 // HX: yet-to-be-done
}

in(*in-of-local*)

fun
aux_fundecl
( env0
: !implenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.loc()
//
val-
D3Cfundecl
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
  auxd3cl(env0, d3cl)
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
list_map$fopr<s2var><t2xtv>(s2v) = t2xtv_new(loc0)
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
implenv_add_d3ecl(env0, d3cl, ti3e) in d3cl
end
end // end of [list_cons]
//
end // end of [aux_fundecl]

end // end of [local]

(* ****** ****** *)
//
fun
aux_impdecl3
( env0
: !implenv
, d3cl: d3ecl): d3ecl = let
//
val-
D3Cimpdecl3
( tok0, mopt
, sqas, tqas
, id2c, ti3a, ti2s
, f3as, res1, body) = d3cl.node()
//
in
//
if
iseqz(ti2s)
then aux_impdecl3_fun(env0, d3cl)
else aux_impdecl3_tmp(env0, d3cl)
(*
//
// HX:
// It cannot tell by inspecting ti3a
// whether the implemented dynamic constant
// is a function or a function template!
//
case+ ti3a of
| TI3ARGnone _ => aux_impdecl3_fun(env0, d3cl)
| TI3ARGsome _ => aux_impdecl3_tmp(env0, d3cl)
*)
//
end // end of [aux_impdecl3]
//
and
aux_impdecl3_fun
( env0
: !implenv
, d3cl: d3ecl): d3ecl = let
//
val-
D3Cimpdecl3
( tok0, mopt
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
D3Cimpdecl3
( tok0, mopt
, sqas, tqas
, id2c, ti3a, ti2s, f3as, res1, body)
)
//
end // end of [aux_impdecl3_fun]
and
aux_impdecl3_tmp
( env0
: !implenv
, d3cl: d3ecl): d3ecl = let
//
val
loc0 = d3cl.loc()
val-
D3Cimpdecl3
( tok0, mopt
, sqas, tqas
, id2c, ti3a, ti2s
, f3as, res1, body) = d3cl.node()
//
val t2ps =
(
case- ti3a of 
|
TI3ARGsome(t2ps) =>
t2ypelst_substs
( t2ps
, env0.s2vs()
, env0.t2ps())): t2ypelst
//
val s2vs =
(
  auxs2vs_make(sqas, tqas)
)
val xtvs =
list_vt2t
(
  list_map<s2var><t2xtv>(s2vs)
) where
{
implement
list_map$fopr<s2var><t2xtv>(s2v) = t2xtv_new(loc0)
} (* end of [val xtvs] *)
val tsub =
(
  auxtsub_make(s2vs, xtvs)
)
//
val t2ps =
(
t2ypelst_substs(t2ps, s2vs, tsub)
) where
{
  val tsub = $UN.list_vt2t(tsub)
}
val ((*freed*)) = list_vt_free(tsub)
//
val ti3e = TI3ENV(s2vs, xtvs, t2ps)
//
in
//
let
val () =
implenv_add_d3ecl(env0, d3cl, ti3e) in d3cl
end
//
end // end of [aux_impdecl3_tmp]
//
(* ****** ****** *)

in(*in-of-local*)

implement
trans3t_decl
  (env0, d3cl) = let
//
val loc0 = d3cl.loc()
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
| D3Cinclude _ =>
  let
    val d3cl =
    aux_include(env0, d3cl) in d3cl
  end // end of [D3Cinclude]
//
| D3Clocal
  (d3cs1, d3cs2) =>
  let
    val () =
    implenv_add_loc1(env0)
    val
    d3cs1 =
    trans3t_declist(env0, d3cs1)
    val () =
    implenv_add_loc2(env0)
    val
    d3cs1 =
    trans3t_declist(env0, d3cs2)
    val () =
    implenv_pop_loc12(env0)
  in
    d3ecl_make_node(loc0, D3Clocal(d3cs1, d3cs2))
  end
//
| D3Cvaldecl _ => aux_valdecl(env0, d3cl)
| D3Cvardecl _ => aux_vardecl(env0, d3cl)
| D3Cfundecl _ => aux_fundecl(env0, d3cl)
//
| D3Cimpdecl1 _ => d3cl
| D3Cimpdecl2 _ => d3cl
| D3Cimpdecl3 _ => aux_impdecl3(env0, d3cl)
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

local

fun
aux_fundecl
( env0
: !implenv
, d3cl: d3ecl): d3ecl =
let
//
val-
D3Cfundecl
( tok0
, mopt
, tqas, f3ds) = d3cl.node()
//
fun
auxf3d0
( env0
: !implenv
, f3d0
: f3undecl
)
: f3undecl =
let
//
val+
F3UNDECL(rcd) = f3d0
//
val loc = rcd.loc
val nam = rcd.nam
val d2c = rcd.d2c
val a2g = rcd.a2g
val a3g = rcd.a3g
val res = rcd.res
val def = rcd.def
val wtp = rcd.wtp
val ctp = rcd.ctp
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
//
fun
auxf3ds
( env0
: !implenv
, f3ds
: f3undeclist
)
: f3undeclist =
(
case+ f3ds of
| list_nil() =>
  list_nil(*void*)
| list_cons(f3d0, f3ds) =>
  (
  list_cons(f3d0, f3ds) 
  ) where
  {
    val
    f3d0 = auxf3d0(env0, f3d0)
    val
    f3ds = auxf3ds(env0, f3ds)
  }
)
//
val f3ds = auxf3ds(env0, f3ds)
//
in
d3ecl_make_node
( d3cl.loc()
, D3Cfundecl(tok0, mopt, tqas, f3ds)
)
end // end of [aux_fundecl]

(* ****** ****** *)

fun
aux_impdecl3
( env0
: !implenv
, d3cl: d3ecl): d3ecl =
let
val-
D3Cimpdecl3
( knd
, mopt
, sqas, tqas
, id2c, ti3a, ti2s
, f3as, res0, body) = d3cl.node()
//
val body = trans3t_dexp(env0, body)
//
in
d3ecl_make_node
( d3cl.loc()
, D3Cimpdecl3
  ( knd, mopt
  , sqas, tqas
  , id2c, ti3a, ti2s, f3as, res0, body))
end // end of [aux_impdecl3]

in (*in-of-local*)

implement
trans3t_timp
  (env0, d3cl) =
(
case+
d3cl.node() of
| D3Cfundecl _ =>
  aux_fundecl(env0, d3cl)
| D3Cimpdecl3 _ =>
  aux_impdecl3(env0, d3cl)
| _ (* rest-of-d3ecl *) => d3cl
)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans3t_dynexp.dats] *)
