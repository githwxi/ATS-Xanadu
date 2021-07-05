(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: January, 2021
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./xlabel0.sats"
#staload "./locinfo.sats"

(* ****** ****** *)
//
#staload S2E = "./staexp2.sats"
#staload S2T = "./statyp2.sats"
#staload D2E = "./dynexp2.sats"
//
#staload D3E = "./dynexp3.sats"
//
#staload D4E = "./dynexp4.sats"
//
(* ****** ****** *)

typedef s2var = $S2E.s2var
typedef s2xtv = $S2E.s2xtv
typedef s2exp = $S2E.s2exp
typedef t2xtv = $S2T.t2xtv
typedef t2ype = $S2T.t2ype

(* ****** ****** *)

typedef s2varopt = $S2E.s2varopt
typedef s2varlst = $S2E.s2varlst
typedef s2expopt = $S2E.s2expopt
typedef s2explst = $S2E.s2explst

(* ****** ****** *)

typedef t2xtvlst = $S2T.t2xtvlst
typedef t2ypelst = $S2T.t2ypelst

(* ****** ****** *)
//
typedef d2con = $D2E.d2con
typedef d2var = $D2E.d2var
//
typedef d2cst = $D2E.d2cst
//
(* ****** ****** *)
//
typedef tq2arg = $D2E.tq2arg
typedef tq2arglst = $D2E.tq2arglst
//
(* ****** ****** *)
//
typedef d3pat = $D3E.d3pat
typedef f3arg = $D3E.f3arg
//
(* ****** ****** *)
//
typedef d3exp = $D3E.d3exp
typedef d3ecl = $D3E.d3ecl
//
typedef d3gua = $D3E.d3gua
typedef d3gpat = $D3E.d3gpat
typedef d3clau = $D3E.d3clau
//
typedef d3patlst = $D3E.d3patlst
typedef f3arglst = $D3E.f3arglst
//
typedef d3expopt = $D3E.d3expopt
typedef d3explst = $D3E.d3explst
typedef d3eclopt = $D3E.d3eclopt
typedef d3eclist = $D3E.d3eclist
//
typedef d3gualst = $D3E.d3gualst
typedef d3claulst = $D3E.d3claulst
//
(* ****** ****** *)
//
typedef d4pat = $D4E.d4pat
typedef f4arg = $D4E.f4arg
//
typedef d4exp = $D4E.d4exp
typedef d4ecl = $D4E.d4ecl
//
(* ****** ****** *)
typedef dlocs = $D4E.dlocs
typedef stmap = $D4E.stmap
(* ****** ****** *)
typedef d4gua = $D4E.d4gua
typedef d4gpat = $D4E.d4gpat
typedef d4clau = $D4E.d4clau
(* ****** ****** *)
typedef d4patlst = $D4E.d4patlst
typedef f4arglst = $D4E.f4arglst
(* ****** ****** *)
typedef d4expopt = $D4E.d4expopt
typedef d4explst = $D4E.d4explst
(* ****** ****** *)
typedef d4eclopt = $D4E.d4eclopt
typedef d4eclist = $D4E.d4eclist
(* ****** ****** *)
typedef d4gualst = $D4E.d4gualst
typedef d4claulst = $D4E.d4claulst
(* ****** ****** *)
//
absvtype
tr34env_vtype = ptr
vtypedef
tr34env = tr34env_vtype
//
(* ****** ****** *)
//
fun
tr34env_make_nil
  ((*void*)): tr34env
//
(* ****** ****** *)
//
fun
tr34env_free_nil
  (env0: tr34env): void
fun
tr34env_free_top
  (env0: tr34env): void
//
(* ****** ****** *)
//
fun
tr34env_add_fun0
  ( env0: !tr34env ) : void
fun
tr34env_pop_fun0
  ( env0 : !tr34env ) : void
//
(* ****** ****** *)
//
fun
tr34env_add_let1
  ( env0: !tr34env ) : void
//
fun
tr34env_add_loc1
  ( env0 : !tr34env ) : void
fun
tr34env_add_loc2
  ( env0 : !tr34env ) : void
//
fun
tr34env_pop_let1
  ( env0 : !tr34env ) : void
fun
tr34env_pop_loc12
  ( env0 : !tr34env ) : void
//
(* ****** ****** *)
//
fun
tr34env_add_fix1
( env0:
! tr34env, d2f1: d2var): void
fun
tr34env_add_lams
( env0
: !tr34env, f3as: f3arglst): void
//
fun
tr34env_pop_fix1
  ( env0 : !tr34env ) : void
fun
tr34env_pop_lams
  ( env0 : !tr34env ) : void
//
(* ****** ****** *)
fun
tr34env_stmap_fun0
  ( env0 : !tr34env ) : stmap
(* ****** ****** *)
fun
tr34env_dlocs_let1
  ( env0 : !tr34env ) : dlocs
fun
tr34env_stmap_let1
  ( env0 : !tr34env ) : stmap
(* ****** ****** *)
fun
tr34env_stmap_clau
  ( env0 : !tr34env ) : stmap
(* ****** ****** *)
fun
tr34env_add_dvar
( env0:
! tr34env, d2v0: d2var): void
fun
tr34env_add_dvar_sexp
( env0:
! tr34env
, d2v0: d2var, s2e0: s2exp): void
(* ****** ****** *)
fun
tr34env_add_denvs_let1
( env0:
! tr34env
, d2vs: dlocs, stmp: stmap): stmap
(* ****** ****** *)
fun
s2exp_tq2as_elim
( loc0: loc_t
, s2e0: s2exp, tqas: tq2arglst): s2exp
(* ****** ****** *)
//
fun
t2ype_sexpize_env
( env0:
! tr34env, t2p0: t2ype): s2exp
//
fun
s2exp_whnfize_env
( env0:
! tr34env, s2e0: s2exp): s2exp
//
overload
sexpize_env with t2ype_sexpize_env
overload
whnfize_env with s2exp_whnfize_env
//
(* ****** ****** *)
//
fun
s2exp_eqeqize_env
( env0:
! tr34env
, s2e1: s2exp, s2e2: s2exp): void
fun
s2exp_tpeqize_env
( env0:
! tr34env
, s2e1: s2exp, s2e2: s2exp): void
fun
s2exp_tsubize_env
( env0:
! tr34env
, s2e1: s2exp, s2e2: s2exp): void
//
(* ****** ****** *)
//
(*
fun
s2exp_opnx_env
( loc0: loc_t
, s2e0: s2exp): s2xtv
*)
fun
s2exp_opny_env
( env0:
! tr34env
, s2e0: s2exp)
: (s2varlst, s2explst, s2exp)
//
(* ****** ****** *)
fun
d4exp_open_env
( env0:
! tr34env, d4e0: d4exp): d4exp
fun
d4exp_opny_env
( env0:
! tr34env, d4e0: d4exp): d4exp
(* ****** ****** *)
//
fun
trans34_envless
( dcls: d3eclist ) : d4eclist
//
(* ****** ****** *)
//
(*
fun
trans34_s2eopn
( env0:
! tr34env, s2e0: s2exp): s2exp
*)
//
(*
//
HX-2021-05-10:
[trans34_d4popn] should
only be applied to var-likes!
//
fun
trans34_d4popn
( env0:
! tr34env, d4p0: d4pat): d4pat
//
*)
//
(*
fun
trans34_d4eopn
( env0:
! tr34env, d4e0: d4exp): d4exp
*)
//
(* ****** ****** *)
//
fun
trans34_dpat
( env0:
! tr34env, d3p0: d3pat): d4pat
fun
trans34_dpatlst
( env0:
! tr34env, d3ps: d3patlst): d4patlst
//
(* ****** ****** *)
fun
trans34_dpat_dntp
( env0:
! tr34env
, d3p0: d3pat, s2e0: s2exp): d4pat
(* ****** ****** *)
fun
trans34_dpatlst_dnts
( env0:
! tr34env
, d3ps
: d3patlst, s2e0: s2explst): d4patlst
(* ****** ****** *)
//
fun
trans34_dexp
( env0:
! tr34env, d3e0: d3exp): d4exp
//
(* ****** ****** *)
fun
trans34_dexplst
( env0:
! tr34env, d3es: d3explst): d4explst
fun
trans34_dexpopt
( env0:
! tr34env, opt0: d3expopt): d4expopt
(* ****** ****** *)
fun
trans34_dexp_dntp
( env0:
! tr34env
, d3e0: d3exp, s2e0: s2exp): d4exp
fun
trans34_dexplst_dnts
( env0:
! tr34env
, d3es
: d3explst, s2es: s2explst): d4explst
(* ****** ****** *)
//
fun
trans34_farg
( env0
: !tr34env, f3a0: f3arg): f4arg
fun
trans34_farglst
( env0
: !tr34env, f3as: f3arglst): f4arglst
//
(* ****** ****** *)
//
typedef
effs2expopt =
$S2E.effs2expopt
fun
trans34_farglst_s2exp
( env0
: !tr34env
, f3as
: f3arglst, s2f0: s2exp
, sres: &effs2expopt >> _ ): f4arglst
//
(* ****** ****** *)
//
fun
trans34_dgpat_dntp
( env0
: !tr34env
, d3gp
: d3gpat, tmat: s2exp): d4gpat
//
fun
trans34_dclau_dntp
( env0
: !tr34env
, d3cl
: d3clau, tmat: s2exp, tres: s2exp): d4clau
fun
trans34_dclaulst_dntp
( env0
: !tr34env
, dcls
: d3claulst, tmat: s2exp, tres: s2exp): d4claulst
//
(* ****** ****** *)
//
fun
trans34_decl
( env0:
! tr34env, d3c0: d3ecl): d4ecl
//
(* ****** ****** *)
fun
trans34_declist
( env0:
! tr34env, d3cs: d3eclist): d4eclist
fun
trans34_declopt
( env0:
! tr34env, opt0: d3eclopt): d4eclopt
(* ****** ****** *)

typedef
f3undecl = $D3E.f3undecl
typedef
f3undeclist = $D3E.f3undeclist

(* ****** ****** *)

typedef
v3aldecl = $D3E.v3aldecl
typedef
v3ardecl = $D3E.v3ardecl
typedef
v3aldeclist = $D3E.v3aldeclist
typedef
v3ardeclist = $D3E.v3ardeclist

(* ****** ****** *)

typedef
f4undecl = $D4E.f4undecl
typedef
f4undeclist = $D4E.f4undeclist

(* ****** ****** *)
//
typedef
v4aldecl = $D4E.v4aldecl
typedef
v4ardecl = $D4E.v4ardecl
typedef
v4aldeclist = $D4E.v4aldeclist
typedef
v4ardeclist = $D4E.v4ardeclist
//
(* ****** ****** *)
//
fun
f3undecl_get_s2expopt
  ( fdcl: f3undecl ) : s2expopt
//
(* ****** ****** *)

fun
trans34_fundecl
( env0:
! tr34env, f3d0: f3undecl): f4undecl
fun
trans34_fundeclist
( env0:
! tr34env, f3ds: f3undeclist): f4undeclist

(* ****** ****** *)
//
fun
trans34_valdecl
( env0:
! tr34env, v3d0: v3aldecl): v4aldecl
fun
trans34_valdeclist
( env0:
! tr34env, v3ds: v3aldeclist): v4aldeclist
//
fun
trans34_vardecl
( env0:
! tr34env, v3d0: v3ardecl): v4ardecl
fun
trans34_vardeclist
( env0:
! tr34env, v3ds: v3ardeclist): v4ardeclist
//
(* ****** ****** *)
//
// HX-2021-02-20:
// Some helper functions for trans34
//
(* ****** ****** *)
fun
trans34_d4pat_deunis(d4p0: d4pat): d4pat
(* ****** ****** *)
//
fun
trans34_d4exp_deuni1(d4e0: d4exp): d4exp
fun
trans34_d4exp_deunis(d4e0: d4exp): d4exp
//
(* ****** ****** *)
//
fun
tr34env_d2var_get_sexp
( env0:
! tr34env, d2v0: d2var): s2exp
(*
fun
tr34env_d2var_set_sexp
( env0:
! tr34env, d2v0: d2var, s2e0: s2exp): void
*)
//
(* ****** ****** *)
fun
trans34_d3pat_get_sexp
(env0: !tr34env, d3p0: d3pat): s2exp
fun
trans34_d3patlst_get_s2es
(env0: !tr34env, d3ps: d3patlst): s2explst
(* ****** ****** *)
fun
trans34_f3undecl_set_sexp
(env0: !tr34env, f3d0: f3undecl): void
(* ****** ****** *)

(* end of [xats_trans34.sats] *)
