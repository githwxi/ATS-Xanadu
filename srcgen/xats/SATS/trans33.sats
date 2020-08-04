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

#staload "./label0.sats"
#staload "./locinfo.sats"

(* ****** ****** *)
//
#staload S2E = "./staexp2.sats"
#staload S2T = "./statyp2.sats"
#staload D2E = "./dynexp2.sats"
//
#staload D3E = "./dynexp3.sats"
//
(* ****** ****** *)

typedef s2var = $S2E.s2var
typedef s2cst = $S2E.s2cst
typedef s2exp = $S2E.s2exp
typedef t2ype = $S2T.t2ype
typedef t2xtv = $S2T.t2xtv

(* ****** ****** *)

typedef d2var = $D2E.d2var
typedef d2con = $D2E.d2con
typedef d2cst = $D2E.d2cst
typedef d2itm = $D2E.d2itm
typedef d2pitm = $D2E.d2pitm

typedef d2pat = $D2E.d2pat
typedef d3pat = $D3E.d3pat

typedef d2exp = $D2E.d2exp
typedef d3exp = $D3E.d3exp
typedef d3gua = $D3E.d3gua
typedef d3clau = $D3E.d3clau
typedef d3gpat = $D3E.d3gpat

typedef f3arg = $D3E.f3arg

typedef d2ecl = $D2E.d2ecl
typedef d3ecl = $D3E.d3ecl

(* ****** ****** *)
//
typedef d2conlst = $D2E.d2conlst
typedef d2cstlst = $D2E.d2cstlst
//
typedef d2itmopt = $D2E.d2itmopt
typedef d2itmlst = $D2E.d2itmlst
typedef d2pitmlst = $D2E.d2pitmlst
//
(* ****** ****** *)

typedef s2varlst = $S2E.s2varlst
typedef s2explst = $S2E.s2explst
typedef t2ypelst = $S2T.t2ypelst
typedef t2xtvlst = $S2T.t2xtvlst

(* ****** ****** *)

typedef d3patlst = $D3E.d3patlst
typedef d3patopt = $D3E.d3patopt
typedef d3explst = $D3E.d3explst
typedef d3expopt = $D3E.d3expopt

typedef d3gualst = $D3E.d3gualst
typedef d3claulst = $D3E.d3claulst

typedef f3arglst = $D3E.f3arglst

typedef d3eclist = $D3E.d3eclist

(* ****** ****** *)

vtypedef d2conopt_vt = $D2E.d2conopt_vt
vtypedef d2cstopt_vt = $D2E.d2cstopt_vt
vtypedef d2varopt_vt = $D2E.d2varopt_vt
vtypedef d2itmopt_vt = $D2E.d2itmopt_vt

(* ****** ****** *)
//
absvtype abstenv_vtype = ptr
vtypedef abstenv = abstenv_vtype
//
(* ****** ****** *)
//
fun
abstenv_add_let1
  (env0: !abstenv): void
fun
abstenv_pop_let1
  (env0: !abstenv): void
//
fun
abstenv_add_loc1
  (env0: !abstenv): void
fun
abstenv_add_loc2
  (env0: !abstenv): void
fun
abstenv_pop_loc12
  (env0: !abstenv): void
//
(* ****** ****** *)
//
fun
abstenv_make_nil(): abstenv
fun
abstenv_free_top(abstenv): void
//
(* ****** ****** *)
//
fun
abstenv_push_open
( env0:
! abstenv, d3cl: d3ecl): void
fun
abstenv_push_impl
( env0:
! abstenv, d3cl: d3ecl): void
//
(* ****** ****** *)
//
fun
abstenv_find
( env0:
! abstenv
, s2c0: s2cst): Option_vt(t2ype)
//
(* ****** ****** *)
//
fun
t2ype_whnfize_env
( env0:
! abstenv, t2p0: t2ype): t2ype
//
overload
whnfize_env with t2ype_whnfize_env
//
(* ****** ****** *)
//
fun
trans33_program
  (dcls: d3eclist): d3eclist
//
(* ****** ****** *)
//
fun
trans33_dpat
( env0
: !abstenv, d3p0: d3pat): d3pat
fun
trans33_dpat_dntp
( env0
: !abstenv
, d3p0: d3pat, t2p0: t2ype): d3pat
//
fun
trans33_dpatlst
( env0
: !abstenv, d3ps: d3patlst): d3patlst
fun
trans33_dpatlst_dnts
( env0
: !abstenv
, d3ps: d3patlst, t2ps: t2ypelst): d3patlst
//
(* ****** ****** *)
//
fun
trans33_dexp
( env0
: !abstenv, d3e0: d3exp): d3exp
//
fun
trans33_dexpopt
( env0
: !abstenv, opt0: d3expopt): d3expopt
fun
trans33_dexplst
( env0
: !abstenv, d3es: d3explst): d3explst
//
(* ****** ****** *)
//
fun
trans33_dexp_dntp
( env0
: !abstenv
, d3e0: d3exp, t2p0: t2ype): d3exp
fun
trans33_dexpopt_dntp
( env0
: !abstenv
, opt0: d3expopt, t2p0: t2ype): d3expopt
fun
trans33_dexplst_dntp
( env0
: !abstenv
, d3es: d3explst, t2p0: t2ype): d3explst
//
(* ****** ****** *)
//
fun
trans33_dgua
( env0
: !abstenv, d3g0: d3gua): d3gua
fun
trans33_dgualst
( env0
: !abstenv, d3gs: d3gualst): d3gualst
//
(* ****** ****** *)
//
fun
trans33_dgpat
( env0
: !abstenv, d3gp: d3gpat): d3gpat
//
fun
trans33_dclau_dntp
( env0
: !abstenv
, d3cl: d3clau, tres: t2ype): d3clau
fun
trans33_dclaulst_dntp
( env0
: !abstenv
, dcls: d3claulst, tres: t2ype): d3claulst
//
(* ****** ****** *)
//
fun
trans33_farg
( env0
: !abstenv, f3a0: f3arg): f3arg
fun
trans33_farglst
( env0
: !abstenv, f3as: f3arglst): f3arglst
//
(* ****** ****** *)
//
fun
trans33_decl
( env0
: !abstenv, d3cl: d3ecl): d3ecl 
fun
trans33_declist
( env0
: !abstenv, dcls: d3eclist): d3eclist
//
(* ****** ****** *)
//
fun
match3_t2ype_t2ype
(t2p1: t2ype, t2p2: t2ype): bool
fun
match3_t2ypelst_t2ypelst
(tps1: t2ypelst, tps2: t2ypelst): bool
//
overload
match3 with match3_t2ype_t2ype
overload
match3 with match3_t2ypelst_t2ypelst
//
(* ****** ****** *)
//
fun
unify3_t2ype_t2ype
( loc0: loc_t
, t2p1: t2ype, t2p2: t2ype): bool
fun
unify3_t2ypelst_t2ypelst
( loc0: loc_t
, tps1: t2ypelst, tps2: t2ypelst): bool
//
overload
unify3 with unify3_t2ype_t2ype
overload
unify3 with unify3_t2ypelst_t2ypelst
//
(* ****** ****** *)
//
fun
unify3_env_t2ype_t2ype
( loc0: loc_t
, env0: !abstenv
, t2p1: t2ype, t2p2: t2ype): bool
fun
unify3_env_t2ypelst_t2ypelst
( loc0: loc_t
, env0: !abstenv
, tps1: t2ypelst, tps2: t2ypelst): bool
//
overload
unify3_env with unify3_env_t2ype_t2ype
overload
unify3_env with unify3_env_t2ypelst_t2ypelst
//
(* ****** ****** *)
//
fun
t2ype_f3arg_elim
( loc0: loc_t
, env0: !abstenv
, t2p0: t2ype
, f3as: f3arglst): (f3arglst, t2ype)
//
(* ****** ****** *)
//
// HX: for processing dynexpressions
//
(* ****** ****** *)
//
fun
d33exp_dntp
( env0: !abstenv
, d3e0: d3exp, t2p0: t2ype): d3exp
//
fun
d33explst_dntp
( loc0: loc_t
, env0: !abstenv
, d3es: d3explst, t2ps: t2ypelst): d3explst
//
(* ****** ****** *)
//
fun
d33exp_sapp_up
( loc0: loc_t
, env0: !abstenv
, d3f0: d3exp, s2es: s2explst): d3exp
fun
d33exp_tapp_up
( loc0: loc_t
, env0: !abstenv
, d2f0: d2exp, s2es: s2explst): d3exp
//
(* ****** ****** *)
//
fun
d33exp_dapp_up
( loc0
: loc_t
, env0
: !abstenv
, d3f0: d3exp(*fun*)
, npf0: int
, d3es: d3explst(*args*)): d3exp
//
(* ****** ****** *)
//
fun
d33exp_proj_up
( loc0: loc_t
, env0: !abstenv
, d3e1: d3exp, lab2: label): d3exp
fun
d33exp_proj0_up
( loc0: loc_t
, env0: !abstenv
, d3e1: d3exp
, t2p1: t2ype, lab2: label): d3exp
fun
d33exp_proj1_up
( loc0: loc_t
, env0: !abstenv
, d3e1: d3exp
, t2p1: t2ype, lab2: label): d3exp
//
(* ****** ****** *)
//
fun
d33exp_assgn_up
( loc0: loc_t
, env0: !abstenv
, d3el: d3exp, d3er: d3exp): d3exp
//
(* ****** ****** *)
//
fun
d33exp_if0_up
( loc0: loc_t
, env0: !abstenv
, d3e1: d3exp(*cond*)
, d3e2: d3exp(*then*)
, opt3: d3expopt(*else*)): d3exp
//
(* ****** ****** *)
//
fun
d33exp_tcastize
( env0: !abstenv
, d3e1: d3exp, t2p2: t2ype): d3exp
//
(* ****** ****** *)
//
datatype
ti3env =
|
TI3ENV of
( s2varlst(*tmpvars*)
, t2xtvlst, t2ypelst)
//
(* ****** ****** *)
//
fun
ti3env_reset(ti3env): void
//
fun
ti3env_get_s2vs(ti3env): s2varlst
fun
ti3env_get_targ(ti3env): t2ypelst
fun
ti3env_get_tsub(ti3env): t2ypelst
//
overload .s2vs with ti3env_get_s2vs
overload .targ with ti3env_get_targ
overload .tsub with ti3env_get_tsub
//
(* ****** ****** *)
//
abstype t3imptbl = ptr
//
typedef
t3imptblopt = Option(t3imptbl)
//
(* ****** ****** *)
//
datatype implist =
| implist_nil of ()
| implist_cons of (d3ecl, ti3env, implist)
//
(* ****** ****** *)
//
fun
fmodenv_get_t3imptbl
  (menv: $S2E.fmodenv): t3imptblopt
//
fun
t3imptbl_find_implist
(htbl: t3imptbl, d2c0: d2cst): implist
fun
t3imptbl_make_d3eclist(d3cs: d3eclist): t3imptbl
//
(* ****** ****** *)

(* end of [xats_trans33.sats] *)
