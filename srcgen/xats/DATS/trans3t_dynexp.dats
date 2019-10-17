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

local

fun
auxtcst
( d3e0
: d3exp): d3exp =
let
//
val
loc0 = d3e0.loc()
//
val-
D3Etcst
( d2c0
, ti2s
, ti3a) = d3e0.node()
//
in
  d3e0
end // end of [auxtcst]

in(*in-of-local*)

implement
trans3t_dexp
  (env, d3e0) = let
//
val loc0 = d3e0.loc()
val t2p0 = d3e0.type()
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
//
| D3Evar _ => d3e0
//
| D3Etcst _ => auxtcst(d3e0)
//
| D3Elet(d3cs, d3e1) =>
  let
    val () =
    implenv_add_let1(env)
    val
    d3cs =
    trans3t_declist(env, d3cs)
    val
    d3e1 = trans3t_dexp(env, d3e1)
    val () =
    implenv_pop_let1(env)
  in
    d3exp_make_node
    (loc0, t2p0, D3Elet(d3cs, d3e1))
  end
//
| D3Ewhere(d3e1, d3cs) =>
  let
    val () =
    implenv_add_let1(env)
    val
    d3cs =
    trans3t_declist(env, d3cs)
    val
    d3e1 = trans3t_dexp(env, d3e1)
    val () =
    implenv_pop_let1(env)
  in
    d3exp_make_node
    (loc0, t2p0, D3Ewhere(d3e1, d3cs))
  end
//
| D3Eseqn(d3es, d3e1) =>
  let
    val
    d3es =
    trans3t_dexplst(env, d3es)
    val
    d3e1 = trans3t_dexp(env, d3e1)
  in
    d3exp_make_node
    (loc0, t2p0, D3Eseqn(d3es, d3e1))
  end
//
| D3Etuple(knd, npf, d3es) =>
  let
    val
    d3es =
    trans3t_dexplst(env, d3es)
  in
    d3exp_make_node
    (loc0, t2p0, D3Etuple(knd, npf, d3es))
  end
//
| D3Eif0
  (d3e1, d3e2, opt3) =>
  let
    val d3e1 =
    trans3t_dexp(env, d3e1)
    val d3e2 =
    trans3t_dexp(env, d3e2)
    val opt3 =
    trans3t_dexpopt(env, opt3)
  in
    d3exp_make_node
    (loc0, t2p0, D3Eif0(d3e1, d3e2, opt3))
  end
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
trans3t_decl
  (env0, d3cl) = let
//
val loc0 = d3cl.loc()
//
in
//
case-
d3cl.node() of
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
(*
| D3Cimpdecl1
  ( tok0,
  , mopt
  , sqas
  , tqas
  , id2c
  , ti3a, ti2s, f3as, res1, body) =>
  let
    val ti3a =
    ti3arg_subst(ti3a, env0.tsub())
    val xtvs = ...(sqas/tqas)...
    val ti3a =
    ti3arg_subst(ti3a, xtvs.tsub())
  in
  end
*)
//
end // end of [trans3t_decl]

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

(* end of [xats_trans3t_dynexp.dats] *)
