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
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
#staload "./xlabel0.sats"
#staload "./locinfo.sats"
//
(* ****** ****** *)
//
#staload LEX = "./lexing0.sats"
#staload S1E = "./staexp1.sats"
#staload D1E = "./dynexp1.sats"
//
(* ****** ****** *)
//
typedef token = $LEX.token
//
(* ****** ****** *)
//
#staload S2E = "./staexp2.sats"
#staload S2T = "./statyp2.sats"
#staload D2E = "./dynexp2.sats"
//
#staload D3E = "./dynexp3.sats"
//
(* ****** ****** *)
//
typedef s2var = $S2E.s2var
typedef s2exp = $S2E.s2exp
typedef t2ype = $S2T.t2ype
typedef t2xtv = $S2T.t2xtv
//
typedef s2varlst = $S2E.s2varlst
typedef s2explst = $S2E.s2explst
typedef t2ypelst = $S2T.t2ypelst
//
typedef labt2ype = $S2T.labt2ype
typedef labt2ypelst = $S2T.labt2ypelst
//
typedef f1unarrow = $S1E.f1unarrow
typedef effs2expopt = $S2E.effs2expopt
//
(* ****** ****** *)
//
typedef d2var = $D2E.d2var
typedef d2con = $D2E.d2con
typedef d2cst = $D2E.d2cst
typedef d2itm = $D2E.d2itm
//
typedef d2conlst = $D2E.d2conlst
typedef d2cstlst = $D2E.d2cstlst
typedef d2itmlst = $D2E.d2itmlst
//
(* ****** ****** *)
//
typedef d2pat = $D2E.d2pat
typedef d2exp = $D2E.d2exp
typedef d2ecl = $D2E.d2ecl
//
typedef d2patlst = $D2E.d2patlst
typedef f2arglst = $D2E.f2arglst
typedef d2expopt = $D2E.d2expopt
typedef d2explst = $D2E.d2explst
//
typedef d2eclist = $D2E.d2eclist
//
(* ****** ****** *)

typedef d2pitm = $D2E.d2pitm
typedef d2pitmlst = $D2E.d2pitmlst

(* ****** ****** *)

typedef tq2arg = $D2E.tq2arg
typedef ti2arg = $D2E.ti2arg
typedef ti3arg = $D3E.ti3arg
typedef tq2arglst = $D2E.tq2arglst
typedef ti2arglst = $D2E.ti2arglst

(* ****** ****** *)

typedef st2inv = $D2E.st2inv

(* ****** ****** *)
//
typedef d3pat = $D3E.d3pat
typedef f3arg = $D3E.f3arg
typedef d3exp = $D3E.d3exp
typedef d3ecl = $D3E.d3ecl
//
typedef d3patlst = $D3E.d3patlst
typedef f3arglst = $D3E.f3arglst
//
typedef d3expopt = $D3E.d3expopt
typedef d3explst = $D3E.d3explst
typedef d3eclist = $D3E.d3eclist
//
typedef d3explstopt = $D3E.d3explstopt
//
(* ****** ****** *)

typedef d2gua = $D2E.d2gua
typedef d3gua = $D3E.d3gua

typedef d2gpat = $D2E.d2gpat
typedef d3gpat = $D3E.d3gpat

typedef d2clau = $D2E.d2clau
typedef d3clau = $D3E.d3clau

typedef d2gualst = $D2E.d2gualst
typedef d3gualst = $D3E.d3gualst
typedef d2claulst = $D2E.d2claulst
typedef d3claulst = $D3E.d3claulst

(* ****** ****** *)

vtypedef d2conopt_vt = $D2E.d2conopt_vt
vtypedef d2cstopt_vt = $D2E.d2cstopt_vt
vtypedef d2itmopt_vt = $D2E.d2itmopt_vt

(* ****** ****** *)
//
fun
trenv23_dvar: d2var -> void
fun
trenv23_dvar_dntp
(d2v0: d2var, t2p0: t2ype): void
//
(* ****** ****** *)
//
fun
trans23_dpat: d2pat -> d3pat
fun
trans23_dpat_dntp
(d2p0: d2pat, t2p0: t2ype): d3pat
//
fun
trans23_dpatlst: d2patlst -> d3patlst
fun
trans23_dpatlst_dntp
( d2ps
: d2patlst, t2ps: t2ypelst): d3patlst
//
(* ****** ****** *)

fun
trans23_farglst: f2arglst -> f3arglst

(* ****** ****** *)
//
fun
trans23_dexp: d2exp -> d3exp 
fun
trans23_dexpopt: d2expopt -> d3expopt
fun
trans23_dexplst: d2explst -> d3explst
fun
trans23_dexpseq: d2explst -> d3explst
//
fun
trans23_dexp_dntp
(d2e0: d2exp, t2p0: t2ype): d3exp
fun
trans23_dexplst_dntp
(d2es: d2explst, t2p0: t2ype): d3explst
//
(* ****** ****** *)
//
fun
trans23_dexp_dntp
  (d2e0: d2exp, t2p0: t2ype): (d3exp)
//
(* ****** ****** *)
//
fun
trans23_dgua: d2gua -> d3gua
fun
trans23_dgualst: d2gualst -> d3gualst
//
(* ****** ****** *)
//
fun
trans23_dgpat_dntp
( dgpt
: d2gpat
, targ: t2ype(*guard*)): d3gpat
fun
trans23_dclau_dntp
( d2c0
: d2clau
, targ: t2ype(*guard*), tres: t2ype): d3clau
fun
trans23_dclaulst_dntp
( d2cs
: d2claulst
, targ: t2ype(*guard*), tres: t2ype): d3claulst
//
(* ****** ****** *)

fun
trans23_decl: d2ecl -> d3ecl 
fun
trans23_declist: d2eclist -> d3eclist

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
t2ype_tq2as_elim
( loc0: loc_t
, t2p0: t2ype
, tqas: tq2arglst): t2ype
fun
t2ype_tq2as_elim2
( loc0: loc_t
, t2p0: t2ype
, tqas: tq2arglst): (ti3arg, t2ype)
//
(* ****** ****** *)
//
fun
unify2_t2ype_t2ype
( loc0: loc_t
, t2p1: t2ype, t2p2: t2ype): bool
//
(* ****** ****** *)
//
fun
unify2_d2var_t2ype
( loc0: loc_t
, d2v1: d2var, t2p2: t2ype): bool
//
fun
unify2_d2con_t2ype
( loc0: loc_t
, d2c1: d2con, t2p2: t2ype): bool
//
fun
unify2_d2cst_t2ype
( loc0: loc_t
, d2c1: d2cst, t2p2: t2ype): bool
//
(* ****** ****** *)
//
overload unify2 with unify2_t2ype_t2ype
overload unify2 with unify2_d2var_t2ype
overload unify2 with unify2_d2con_t2ype
overload unify2 with unify2_d2cst_t2ype
//
(* ****** ****** *)
//
fun
match2_t2ype_t2ype
( t2p1: t2ype, t2p2: t2ype ): bool
//
(* ****** ****** *)
//
fun
match2_d2con_t2ype
( d2c1: d2con, t2p2: t2ype ): bool
fun
match2_d2var_t2ype
( d2v1: d2var, t2p2: t2ype ): bool
//
(* ****** ****** *)
//
(*
fun
tplft_elim(t2p0: t2ype): t2ype
*)
fun
match2_d2cst_t2ype
( d2c1: d2cst, t2p2: t2ype ): bool
//
(* ****** ****** *)
//
fun
match2_d2itm_t2ype
( d2i1
: d2itm, t2p2: t2ype): d2itmopt_vt
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
overload match2 with match2_t2ype_t2ype
overload match2 with match2_d2var_t2ype
overload match2 with match2_d2con_t2ype
overload match2 with match2_d2cst_t2ype
overload match2 with match2_d2itm_t2ype
//
(* ****** ****** *)
//
fun
d3pat_dntp
( d3p0: d3pat, t2p0: t2ype ): d3pat
//
(* ****** ****** *)
//
fun
d3pat_dap0_up
( loc0: loc_t, d3f0: d3pat ): d3pat
fun
d3pat_dap1_up
( loc0: loc_t, d3f0: d3pat ): d3pat
//
fun
d3pat_dapp_up
( loc0: loc_t
, d3f0: d3pat
, npf0: int, d3ps: d3patlst): d3pat
//
(* ****** ****** *)
//
fun
d3pat_trcd1_up
( loc0: loc_t
, knd1: int // 0/1
, npf2: int, d3ps: d3patlst): d3pat
//
(* ****** ****** *)
//
fun
d23pat_sapp_up
( loc0: loc_t
, d3f0: d3pat, s2es: s2explst): d3pat
//
(* ****** ****** *)
//
// HX:
// for processing dynamic expressions
//
(* ****** ****** *)
//
(*
fun
d23exp_anno
( d3e0: d3exp
, t2p0: t2ype ) : d3exp
*)
//
fun
d23exp_dntp
( d3e0: d3exp
, t2p0: t2ype ) : d3exp
fun
d23explst_dntp
( loc0: loc_t
, d3es: d3explst
, t2ps: t2ypelst ) : d3explst
//
(* ****** ****** *)
//
fun
d23exp_sapp_up
( loc0: loc_t
, d3f0: d3exp
, s2es: s2explst(*sargs*)): d3exp
fun
d23exp_tapp_up
( loc0: loc_t
, d2f0: d2exp
, s2es: s2explst(*targs*)): d3exp
//
(* ****** ****** *)
//
fun
d23exp_dapp_up
( loc0: loc_t
, d3f0: d3exp
, npf0: int, d3es: d3explst): d3exp
//
(* ****** ****** *)
//
fun
d23exp_proj_up
( loc0: loc_t
, d3e1: d3exp, label: label): d3exp
//
(* ****** ****** *)
//
fun
d23exp_seqn_up
( loc0: loc_t
, d3es: d3explst, d3e2: d3exp): d3exp
//
(* ****** ****** *)
//
fun
d23exp_trcd1_up
( loc0: loc_t
, knd1: int // 0/1
, npf2: int, d3es: d3explst): d3exp
//
(* ****** ****** *)
//
fun
d23exp_assgn_up
( loc0
: loc_t
, d3e1
: d3exp(*l-val*), d3e2: d3exp): d3exp
//
(* ****** ****** *)
//
fun
d23exp_brack_up
( loc0
: loc_t
, dpis
: d2pitmlst, d2es: d3explst): d3exp
fun
d23exp_dtsel_up
( loc0: loc_t
, lab0: label
, dpis: d2pitmlst
, npf2: int, arg3: d3explstopt): d3exp
//
(* ****** ****** *)
//
fun
d23exp_if0_up
( loc0: loc_t
, d3e1: d3exp
, d3e2: d3exp, opt3: d3expopt): d3exp
fun
d23exp_if1_up
( loc0: loc_t
, d3e1: d3exp
, d3e2: d3exp, opt3: d3expopt, tinv: st2inv): d3exp
//
(* ****** ****** *)
//
fun
d23exp_let_up
( loc0: loc_t
, d3cs: d3eclist
, d3es: d3exp(*sequence*)): d3exp
//
fun
d23exp_where_up
( loc0: loc_t
, d3e1: d3exp, d3cs: d3eclist): d3exp
//
(* ****** ****** *)

fun
d23exp_lam_up
( loc0: loc_t
, knd0: token
, f3as: f3arglst
, res0: effs2expopt
, arrw: f1unarrow, body: d3exp): d3exp
fun
d23exp_fix_up
( loc0: loc_t
, knd0: token
, d2v0: d2var
, f3as: f3arglst
, res0: effs2expopt
, arrw: f1unarrow, body: d3exp): d3exp

(* ****** ****** *)
//
fun
join_tq2as_tias
( tqas: tq2arglst
, tias: ti2arglst): ti2arglst
fun
d2cst_ti2as_dnst
( d2c0: d2cst
, tias: ti2arglst): ti2arglst
//
fun
d2cst_ti2as_ti3a
( loc0: loc_t
, d2c0: d2cst, tias: ti2arglst): ti3arg(*t2ype*)
//
(* ****** ****** *)
//
fun
t2ype_f2arg_elim
( loc0: loc_t
, t2p0: t2ype, f2as: f2arglst): (f3arglst, t2ype)
//
(* ****** ****** *)

(* end of [xats_trans23.sats] *)
