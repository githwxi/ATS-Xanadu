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
#staload "./basics.sats"
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
fun
t2ype_get_xtvs
(t2p0: t2ype): List0_vt(t2xtv)
fun
t2ypelst_get_xtvs
(t2ps: t2ypelst): List0_vt(t2xtv)
//
(* ****** ****** *)
//
fun
unify2_d2con_t2ype
(loc0: loc_t,
 d2c1: d2con, t2p2: t2ype): bool
//
fun
unify2_d2var_t2ype
(loc0: loc_t,
 d2v1: d2var, t2p2: t2ype): bool
//
fun
unify2_d2cst_t2ype
(loc0: loc_t,
 d2c1: d2cst, t2p2: t2ype): bool
//
(* ****** ****** *)
//
fun
match2_t2ype_t2ype
(t2p1: t2ype, t2p2: t2ype): bool
//
(* ****** ****** *)
//
fun
match2_d2con_t2ype
(d2c1: d2con, t2p2: t2ype): bool
fun
match2_d2var_t2ype
(d2v1: d2var, t2p2: t2ype): bool
//
(* ****** ****** *)
//
(*
fun
tplft_elim(t2p0: t2ype): t2ype
*)
fun
match2_d2cst_t2ype
(d2c1: d2cst, t2p2: t2ype): bool
//
(* ****** ****** *)
//
overload match2 with match2_d2var_t2ype
overload match2 with match2_d2con_t2ype
overload match2 with match2_d2cst_t2ype
//
(* ****** ****** *)
//
fun
match2_d2itm_t2ype
( d2i1
: d2itm, t2p2: t2ype): d2itmopt_vt
//
overload match2 with match2_d2itm_t2ype
//
(* ****** ****** *)
//
fun
match2_d2conlst_t2ype
( d2cs
: d2conlst, t2p2: t2ype): d2conopt_vt
fun
match2_d2cstlst_t2ype
( d2cs
: d2cstlst, t2p2: t2ype): d2cstopt_vt
//
overload match2 with match2_d2conlst_t2ype
overload match2 with match2_d2cstlst_t2ype
//
(* ****** ****** *)
//
fun
match2_d2pconlst_t2ype
( dpis
: d2pitmlst, t2p2: t2ype): d2itmopt_vt
fun
match2_d2pitmlst_t2ype
( dpis
: d2pitmlst, t2p2: t2ype): d2itmopt_vt
//
(* ****** ****** *)
//
fun
trans33_dpat: d3pat -> d3pat
fun
trans33_dpat_dn
(d3p0: d3pat, t2p0: t2ype): d3pat
//
fun
trans33_dpatlst: d3patlst -> d3patlst
fun
trans33_dpatlst_dn
(ps: d3patlst, ts: t2ypelst): d3patlst
//
(* ****** ****** *)
//
fun
trans33_dexp: d3exp -> d3exp 
fun
trans33_dexp_dn
(d3e0: d3exp, t2p0: t2ype): d3exp 
//
fun
trans33_dexpopt: d3expopt -> d3expopt
fun
trans33_dexplst: d3explst -> d3explst
//
(* ****** ****** *)
//
fun
trans33_dgua: d3gua -> d3gua
fun
trans33_dgualst: d3gualst -> d3gualst
//
(* ****** ****** *)
//
fun
trans33_dgpat: d3gpat -> d3gpat
//
fun
trans33_dclau_dn
(d3cl: d3clau, tres: t2ype): d3clau
fun
trans33_dclaulst_dn
(dcls: d3claulst, tres: t2ype): d3claulst
//
(* ****** ****** *)

fun
trans33_farg: f3arg -> f3arg
fun
trans33_farglst: f3arglst -> f3arglst

(* ****** ****** *)
//
fun
trans33_decl: d3ecl -> d3ecl 
fun
trans33_declist: d3eclist -> d3eclist
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
overload unify3 with unify3_t2ype_t2ype
overload unify3 with unify3_t2ypelst_t2ypelst
//
(* ****** ****** *)
//
fun
t2ype_f3arg_elim
( loc0: loc_t
, t2p0: t2ype, f3as: f3arglst): (f3arglst, t2ype)
//
(* ****** ****** *)
//
fun
d33exp_dn
(d3e0: d3exp, t2p0: t2ype): d3exp
fun
d33explst_dn
( loc0: loc_t
, d3es: d3explst, t2ps: t2ypelst): d3explst
//
(* ****** ****** *)
(*
fun
d33exp_sapp_up
( loc0: loc_t
, d3f0: d3exp, s2es: s2explst): d3exp
fun
d33exp_tapp_up
( loc0: loc_t
, d2f0: d2exp, s2es: s2explst): d3exp
*)
(* ****** ****** *)
//
fun
d33exp_dapp_up
( loc0: loc_t
, d3f0: d3exp
, npf0: int, d3es: d3explst): d3exp
//
(* ****** ****** *)
//
fun
d33exp_proj_up
( loc0: loc_t
, d3e1: d3exp, label: label): d3exp
//
(* ****** ****** *)
//
fun
d33exp_assgn_up
( loc0: loc_t
, d3el: d3exp(*l-value*), d3er: d3exp): d3exp
//
(* ****** ****** *)
//
datatype
ti3env =
| TI3ENV of
  (s2varlst, t2xtvlst, t2ypelst)
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
t3imptbl_make_d3eclist(d3cs: d3eclist): t3imptbl
//
(* ****** ****** *)

(* end of [xats_trans33.sats] *)
