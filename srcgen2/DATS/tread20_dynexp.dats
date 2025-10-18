(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sat 28 Jan 2023 04:13:08 PM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/tread20.sats"
(* ****** ****** *)
//
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload sexp with d2con_get_sexp
#symload sexp with d2cst_get_sexp
(* ****** ****** *)
#symload lctn with d2pat_get_lctn
#symload node with d2pat_get_node
(* ****** ****** *)
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
(* ****** ****** *)
#symload lctn with f2arg_get_lctn
#symload node with f2arg_get_node
(* ****** ****** *)
#symload dpat with d2rpt_get_dpat
#symload dpat with d2rpt_set_dpat
(* ****** ****** *)
#symload dexp with d2rxp_get_dexp
#symload dexp with d2rxp_set_dexp
(* ****** ****** *)
//
(* ****** ****** *)
//
fun
d2pat_errck
(lvl0: sint
,d2p0: d2pat): d2pat =
let
val loc0 = d2p0.lctn()
in//let
d2pat_make_node
(loc0, D2Perrck(lvl0, d2p0))
end (*let*)//end-of(d2pat_errck)
//
(* ****** ****** *)
//
fun
d2exp_errck
(lvl0: sint
,d2e0: d2exp): d2exp =
let
val loc0 = d2e0.lctn()
in//let
d2exp_make_node
(loc0, D2Eerrck(lvl0, d2e0))
end (*let*)//end-of(d2exp_errck)
//
(* ****** ****** *)
(*
HX-2023-02-03: For d2pat-handling
*)
(* ****** ****** *)
//
fun
d2pat_errvl_a1
(d2p0: d2pat): sint =
(
case+ d2p0.node() of
|
D2Perrck
(lvl0, _) => lvl0 | _ => 0)
//
#symload
d2pat_errvl with d2pat_errvl_a1
#symload errvl with d2pat_errvl_a1
//
(* ****** ****** *)
//
fun
d2pat_errvl_a2
(d2p1: d2pat
,d2p2: d2pat): sint =
maxs(errvl(d2p1),errvl(d2p2))
#symload
d2pat_errvl with d2pat_errvl_a2
#symload errvl with d2pat_errvl_a2
//
(* ****** ****** *)
//
#extern
fun
d2pat_errvl_lst
(d2ps: d2patlst): sint
//
#implfun
d2pat_errvl_lst
(  d2ps  ) =
(
case+ d2ps of
|
list_nil((*nil*)) => 0
|
list_cons(d2p1,d2ps) =>
maxs
(
errvl(d2p1),d2pat_errvl_lst(d2ps))
endcas // end of [ case+( d2ps ) ]
)
//
#symload
d2pat_errvl with d2pat_errvl_lst
#symload errvl with d2pat_errvl_lst
//
(* ****** ****** *)
//
#extern
fun
l2d2p_errvl_ldps
(ldps: l2d2plst): sint
//
#implfun
l2d2p_errvl_ldps
(   ldps   ) =
(
case+ ldps of
|
list_nil((*nil*)) => 0
|
list_cons(ldp1,ldps) =>
let
val+
D2LAB(lab, dp1) = ldp1 in
maxs
( errvl(dp1)
, l2d2p_errvl_ldps(ldps)) end
endcas // end of [ case+(ldps) ]
)
//
#symload
l2d2p_errvl with l2d2p_errvl_ldps
#symload errvl with l2d2p_errvl_ldps
//
(* ****** ****** *)
(*
HX-2022:
Various d2pat-errck functions
*)
(* ****** ****** *)
//
fun
d2pat_bang_errck
(loc0: loc_t
,d2p1: d2pat): d2pat =
let
val
lvl0 =
d2pat_errvl(d2p1) in//let
d2pat_errck
(lvl0+1, d2pat(loc0, D2Pbang(d2p1)))
endlet // end of [d2pat_bang_errck(...)]
//
fun
d2pat_flat_errck
(loc0: loc_t
,d2p1: d2pat): d2pat =
let
val
lvl0 =
d2pat_errvl(d2p1) in//let
d2pat_errck
(lvl0+1, d2pat(loc0, D2Pflat(d2p1)))
endlet // end of [d2pat_flat_errck(...)]
//
fun
d2pat_free_errck
(loc0: loc_t
,d2p1: d2pat): d2pat =
let
val
lvl0 =
d2pat_errvl(d2p1) in//let
d2pat_errck
(lvl0+1, d2pat(loc0, D2Pfree(d2p1)))
endlet // end of [d2pat_free_errck(...)]
//
(* ****** ****** *)
//
fun
d2pat_dap1_errck
( loc0: loc_t
, d2f0: d2pat): d2pat =
let
val
lvl0 =
d2pat_errvl(d2f0) in//let
d2pat_errck
(lvl0+1, d2pat(loc0, D2Pdap1(d2f0)))
endlet // end of [d2pat_dap1_errck(...)]
//
(* ****** ****** *)
//
fun
d2pat_dapp_errck
( loc0: loc_t
, d2f0: d2pat
, npf1: (sint)
, d2ps: d2patlst): d2pat =
let
val
lvl0 = maxs
(errvl(d2f0), errvl(d2ps)) in//let
d2pat_errck
(lvl0+1
,d2pat(loc0, D2Pdapp(d2f0,npf1,d2ps)))
endlet // end of [d2pat_dapp_errck(...)]
//
(* ****** ****** *)
//
fun
d2pat_rfpt_errck
( loc0: loc_t
, d2p1: d2pat
, tkas: token
, d2p2:
  d2pat(*rfdpt*)): d2pat =
let
val
lvl0 = maxs
(errvl(d2p1), errvl(d2p2)) in//let
d2pat_errck
(lvl0+1
,d2pat(loc0, D2Prfpt(d2p1,tkas,d2p2)))
endlet // end of [d2pat_rfpt_errck(...)]
//
(* ****** ****** *)
//
fun
d2pat_tup0_errck
( loc0: loc_t
, npf1: (sint)
, d2ps: d2patlst): d2pat =
let
val
lvl0 =
d2pat_errvl(d2ps) in//let
d2pat_errck
( lvl0+1
, d2pat( loc0, D2Ptup0( npf1, d2ps )))
endlet // end of [d2pat_tup0_errck(...)]
//
(* ****** ****** *)
//
fun
d2pat_tup1_errck
( loc0: loc_t
, tknd: token
, npf1: (sint)
, d2ps: d2patlst): d2pat =
let
val
lvl0 =
d2pat_errvl(d2ps) in//let
d2pat_errck
( lvl0+1
, d2pat(loc0,D2Ptup1(tknd,npf1,d2ps)))
endlet // end of [d2pat_tup1_errck(...)]
//
(* ****** ****** *)
//
fun
d2pat_rcd2_errck
( loc0: loc_t
, tknd: token
, npf1: (sint)
, ldps: l2d2plst): d2pat =
let
val
lvl0 =
l2d2p_errvl(ldps) in//let
d2pat_errck
( lvl0+1
, d2pat(loc0, D2Prcd2(tknd,npf1,ldps)))
endlet // end of [d2pat_rcd2_errck(...)]
//
(* ****** ****** *)
//
fun
d2pat_annot_errck
( loc0: loc_t
, d2p1: d2pat
, s1e2: s1exp
, s2e2
: s2exp(*annot*)): d2pat =
let
val
lvl0 =
d2pat_errvl(d2p1) in//let
d2pat_errck
( lvl0+1
, d2pat(loc0,D2Pannot(d2p1,s1e2,s2e2)))
endlet // end of [d2pat_annot_errck(...)]
//
(* ****** ****** *)
(*
HX-2023-02-03: For d2exp-handling
*)
(* ****** ****** *)
//
fun
d2exp_errvl_a1
(d2e0: d2exp): sint =
(
case+ d2e0.node() of
|
D2Eerrck
(lvl0, _) => lvl0 | _ => 0)
//
#symload
d2exp_errvl with d2exp_errvl_a1
#symload errvl with d2exp_errvl_a1
//
(* ****** ****** *)
//
fun
d2exp_errvl_a2
(d2e1: d2exp
,d2e2: d2exp): sint =
maxs(errvl(d2e1),errvl(d2e2))
#symload
d2exp_errvl with d2exp_errvl_a2
#symload errvl with d2exp_errvl_a2
//
(* ****** ****** *)
//
#extern
fun
d2exp_errvl_lst
(d2es: d2explst): sint
//
#implfun
d2exp_errvl_lst
(  d2es  ) =
(
case+ d2es of
|
list_nil((*nil*)) => 0
|
list_cons(d2e1,d2es) =>
maxs
(
errvl(d2e1),d2exp_errvl_lst(d2es))
endcas // end of [ case+( d2es ) ]
)
//
#symload
d2exp_errvl with d2exp_errvl_lst
#symload errvl with d2exp_errvl_lst
//
(* ****** ****** *)
//
#extern
fun
d2exp_errvl_opt
(dopt: d2expopt): sint
//
#implfun
d2exp_errvl_opt
(  dopt  ) =
(
case+ dopt of
| optn_nil() => 0
| optn_cons(d2e1) => errvl(d2e1)
endcas // end of [ case+( d2es ) ]
)
//
#symload
d2exp_errvl with d2exp_errvl_opt
#symload errvl with d2exp_errvl_opt
//
(* ****** ****** *)
//
#extern
fun
l2d2e_errvl_ldes
(ldes: l2d2elst): sint
//
#implfun
l2d2e_errvl_ldes
(   ldes   ) =
(
case+ ldes of
|
list_nil((*nil*)) => 0
|
list_cons(lde1,ldes) =>
let
val+
D2LAB(lab, de1) = lde1 in
maxs
( errvl(de1)
, l2d2e_errvl_ldes(ldes)) end
endcas // end of [ case+(ldes) ]
)
//
#symload
l2d2e_errvl with l2d2e_errvl_ldes
#symload errvl with l2d2e_errvl_ldes
//
(* ****** ****** *)
//
fun
d2cls_errvl_a1
(dcl: d2cls): sint =
(
case+ dcl.node() of
|
D2CLSgpt(dgpt) => 0
|
D2CLScls(dgpt,d2e1) => errvl(d2e1)
)
#symload errvl with d2cls_errvl_a1
//
(* ****** ****** *)
//
#extern
fun
d2cls_errvl_lst
(dcls: d2clslst): sint
#symload errvl with d2cls_errvl_lst
//
#implfun
d2cls_errvl_lst(dcls) =
(
case+ dcls of
|
list_nil((*nil*)) => 0
|
list_cons(dcl1,dcls) => maxs
(errvl(dcl1), d2cls_errvl_lst(dcls))
) (*case+*)//end-of-(d2cls_errvl_lst)
//
(* ****** ****** *)
//
fun
d2ecl_errvl_lst
(dcls: d2eclist): sint = 0
#symload errvl with d2ecl_errvl_lst
//
(* ****** ****** *)
(*
HX-2022:
Various d2exp-errck functions
*)
(* ****** ****** *)
//
fun
d2exp_sapp_errck
(loc0: loc_t
,d2f0: d2exp
,s2es: s2explst): d2exp =
let
val
lvl0 =
d2exp_errvl(d2f0) in//let
d2exp_errck
(lvl0+1
,d2exp(loc0, D2Esapp( d2f0 , s2es )))
endlet // end of [d2exp_sapp_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_tapp_errck
(loc0: loc_t
,d2f0: d2exp
,s2es: s2explst): d2exp =
let
val
lvl0 =
d2exp_errvl(d2f0) in//let
d2exp_errck
(lvl0+1
,d2exp(loc0, D2Etapp( d2f0 , s2es )))
endlet // end of [d2exp_tapp_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_dap0_errck
(loc0: loc_t
,d2e1: d2exp): d2exp =
let
val
lvl0 =
d2exp_errvl(d2e1) in//let
d2exp_errck
(lvl0+1, d2exp(loc0, D2Edap0( d2e1 )))
endlet // end of [d2exp_dap0_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_dapp_errck
(loc0: loc_t
,d2f0: d2exp
,npf1: (sint)
,d2es: d2explst): d2exp =
let
val
lvl0 = maxs
(errvl(d2f0), errvl(d2es)) in//let
d2exp_errck
(lvl0+1
,d2exp(loc0,D2Edapp(d2f0,npf1,d2es)))
endlet // end of [d2exp_dapp_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_proj_errck
( loc0: loc_t
, tknd: token
, drxp: d2rxp
, dlab: label
, dtup: d2exp): d2exp =
let
val
lvl0 =
d2exp_errvl(dtup) in//let
d2exp_errck
(lvl0+1
,d2exp
 (loc0,D2Eproj(tknd,drxp,dlab,dtup)))
endlet // end of [d2exp_proj_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_let0_errck
( loc0: loc_t
, dcls: d2eclist
, d2e1
: d2exp(*scope*)): d2exp =
let
val
lvl0 = maxs
(errvl(dcls), errvl(d2e1)) in//let
d2exp_errck
(lvl0+1,d2exp(loc0,D2Elet0(dcls,d2e1)))
endlet // end of [d2exp_let0_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_ift0_errck
( loc0: loc_t
, d2e1: d2exp
, opt1: d2expopt
, opt2: d2expopt): d2exp =
let
val
lvl0 = maxs
(errvl(d2e1)
,errvl(opt1), errvl(opt2)) in//let
d2exp_errck
( lvl0+1
, d2exp(loc0,D2Eift0(d2e1,opt1,opt2)))
endlet // end of [d2exp_ift0_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_cas0_errck
(loc0: loc_t
,tknd: token
,d2e1: d2exp
,d2cs: d2clslst): d2exp =
let
val
lvl0 = maxs
(errvl(d2e1), errvl(d2cs))
in//let
d2exp_errck
( lvl0+1
, d2exp(loc0,D2Ecas0(tknd,d2e1,d2cs)))
endlet // end of [d2exp_cas0_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_seqn_errck
( loc0: loc_t
, d2es: d2explst
, d2e1
: d2exp(* last *)): d2exp =
let
val
lvl0 = maxs
(errvl(d2es), errvl(d2e1)) in//let
d2exp_errck
( lvl0+1
, d2exp( loc0, D2Eseqn( d2es, d2e1 )))
endlet // end of [d2exp_seqn_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_tup0_errck
( loc0: loc_t
, npf1: (sint)
, d2es: d2explst): d2exp =
let
val
lvl0 =
d2exp_errvl(d2es) in//let
d2exp_errck
( lvl0+1
, d2exp( loc0, D2Etup0( npf1, d2es )))
endlet // end of [d2exp_tup0_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_tup1_errck
( loc0: loc_t
, tknd: token
, npf1: (sint)
, d2es: d2explst): d2exp =
let
val
lvl0 =
d2exp_errvl(d2es) in//let
d2exp_errck
( lvl0+1
, d2exp(loc0,D2Etup1(tknd,npf1,d2es)))
endlet // end of [d2exp_tup1_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_rcd2_errck
( loc0: loc_t
, tknd: token
, npf1: (sint)
, ldes: l2d2elst): d2exp =
let
val
lvl0 =
l2d2e_errvl(ldes) in//let
d2exp_errck
( lvl0+1
, d2exp(loc0,D2Ercd2(tknd,npf1,ldes)))
endlet // end of [d2exp_rcd2_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_lam0_errck
( loc0: loc_t
, tknd: token
, f2as: f2arglst
, sres: s2res
, arrw: f1unarrw
, dexp
: d2exp(*body*)): d2exp =
let
val
lvl0 =
d2exp_errvl(dexp) in//let
d2exp_errck
(
lvl0+1,
d2exp_make_node
( loc0
, D2Elam0(tknd,f2as,sres,arrw,dexp) ))
endlet // end of [d2exp_lam0_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_fix0_errck
( loc0: loc_t
, tknd: token
, d2v0: d2var
, f2as: f2arglst
, sres: s2res
, arrw: f1unarrw
, dexp
: d2exp (*body*)): d2exp =
let
val
lvl0 =
d2exp_errvl(dexp) in//let
d2exp_errck
(
lvl0+1,
d2exp_make_node
(
loc0,
D2Efix0
(tknd, d2v0, f2as, sres, arrw, dexp)))
endlet // end of [d2exp_fix0_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_try0_errck
( loc0: loc_t
, tknd: token
, d2e1: d2exp
, dcls: d2clslst): d2exp =
let
val
lvl0 = maxs
(errvl(d2e1), errvl(dcls))
in//let
d2exp_errck
(lvl0+1
,d2exp(loc0, D2Etry0(tknd,d2e1,dcls)))
endlet // end of [d2exp_try0_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_addr_errck
( loc0: loc_t
, d2e1: d2exp): d2exp =
let
val
lvl0 = errvl(d2e1) in//let
d2exp_errck
(lvl0+1, d2exp(loc0, D2Eaddr( d2e1 )))
endlet // end of [d2exp_addr_errck(...)]
//
fun
d2exp_view_errck
( loc0: loc_t
, d2e1: d2exp): d2exp =
let
val
lvl0 = errvl(d2e1) in//let
d2exp_errck
(lvl0+1, d2exp(loc0, D2Eview( d2e1 )))
endlet // end of [d2exp_view_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_eval_errck
( loc0: loc_t
, d2e1: d2exp): d2exp =
let
val
lvl0 = errvl(d2e1) in//let
d2exp_errck
(lvl0+1, d2exp(loc0, D2Eeval( d2e1 )))
endlet // end of [d2exp_eval_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_fold_errck
( loc0: loc_t
, d2e1: d2exp): d2exp =
let
val
lvl0 = errvl(d2e1) in//let
d2exp_errck
(lvl0+1, d2exp(loc0, D2Efold( d2e1 )))
endlet // end of [d2exp_fold_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_free_errck
( loc0: loc_t
, d2e1: d2exp): d2exp =
let
val
lvl0 = errvl(d2e1) in//let
d2exp_errck
(lvl0+1, d2exp(loc0, D2Efree( d2e1 )))
endlet // end of [d2exp_free_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_where_errck
( loc0: loc_t
, d2e1: d2exp
, dcls: d2eclist): d2exp =
let
val
lvl0 = maxs
(errvl(d2e1), errvl(dcls)) in//let
d2exp_errck
(lvl0+1
,d2exp( loc0, D2Ewhere( d2e1, dcls ) ))
endlet // end of [d2exp_where_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_assgn_errck
( loc0: loc_t
, d2el: d2exp
, d2er: d2exp): d2exp =
let
val
lvl0 = maxs
(errvl(d2el), errvl(d2er)) in//let
d2exp_errck
(lvl0+1
,d2exp( loc0, D2Eassgn( d2el, d2er ) ))
endlet // end of [d2exp_assgn_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_raise_errck
( loc0: loc_t
, tknd: token
, d2e1: d2exp): d2exp =
let
val
lvl0 = errvl(d2e1) in//let
d2exp_errck
(lvl0+1
,d2exp( loc0, D2Eraise( tknd, d2e1 ) ))
endlet // end of [d2exp_raise_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_l0azy_errck
( loc0: loc_t
, dsym: d1exp
, d2e1: d2exp): d2exp =
let
val
lvl0 = errvl(d2e1) in//let
d2exp_errck
( lvl0+1
, d2exp( loc0, D2El0azy( dsym, d2e1 ) ))
endlet // end of [d2exp_l0azy_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_l1azy_errck
( loc0: loc_t
, dsym: d1exp
, d2e1: d2exp
, d2es: d2explst): d2exp =
let
val
lvl0 = maxs
(errvl(d2e1), errvl(d2es)) in//let
d2exp_errck
( lvl0+1
, d2exp(loc0,D2El1azy(dsym,d2e1,d2es)))
endlet // end of [d2exp_l1azy_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_annot_errck
( loc0: loc_t
, d2e1: d2exp
, s1e2: s1exp
, s2e2
: s2exp(*annot*)): d2exp =
let
val
lvl0 = errvl(d2e1) in//let
d2exp_errck
( lvl0+1
, d2exp(loc0,D2Eannot(d2e1,s1e2,s2e2)))
endlet // end of [d2exp_annot_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_labck_errck
( loc0: loc_t
, d2e1: d2exp
, lab2: label): d2exp =
let
val
lvl0 = errvl(d2e1) in//let
d2exp_errck
( lvl0+1
, d2exp( loc0, D2Elabck( d2e1, lab2 ) ))
endlet // end of [d2exp_labck_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_t2pck_errck
( loc0: loc_t
, d2e1: d2exp
, t2p2: s2typ): d2exp =
let
val
lvl0 = errvl(d2e1) in//let
d2exp_errck
( lvl0+1
, d2exp( loc0, D2Et2pck( d2e1, t2p2 ) ))
endlet // end of [d2exp_t2pck_errck(...)]
//
fun
d2exp_t2ped_errck
( loc0: loc_t
, d2e1: d2exp
, t2p2: s2typ): d2exp =
let
val
lvl0 = errvl(d2e1) in//let
d2exp_errck
( lvl0+1
, d2exp( loc0, D2Et2ped( d2e1, t2p2 ) ))
endlet // end of [d2exp_t2ped_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tread20_d2pat
( d2p0, err ) =
(
case+
d2p0.node() of
//
|D2Pvar _ => d2p0
|D2Pany _ => d2p0
//
|D2Pint _ => d2p0
|D2Pbtf _ => d2p0
|D2Pchr _ => d2p0
|D2Pflt _ => d2p0
|D2Pstr _ => d2p0
//
|D2Pi00 _ => d2p0
|D2Pb00 _ => d2p0
|D2Pc00 _ => d2p0
|D2Ps00 _ => d2p0
//
|D2Pcon _ => d2p0
|D2Pcons _ => d2p0
//
|D2Pbang _ => f0_bang(d2p0, err)
|D2Pflat _ => f0_flat(d2p0, err)
|D2Pfree _ => f0_free(d2p0, err)
//
(*
|D2Psym0 _ => f0_sym0(d2p0, err)
*)
//
|D2Pdap1 _ => f0_dap1(d2p0, err)
|D2Pdapp _ => f0_dapp(d2p0, err)
//
|D2Prfpt _ => f0_rfpt(d2p0, err)
//
|D2Ptup0 _ => f0_tup0(d2p0, err)
|D2Ptup1 _ => f0_tup1(d2p0, err)
|D2Prcd2 _ => f0_rcd2(d2p0, err)
//
|
D2Pannot _ => f0_annot(d2p0, err)
//
| _(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; d2pat_errck(lvl0,d2p0))
endlet // end of [ _(* otherwise *) ]
//
) where // end-of-[(*case+(d2p0)-of*)]
{
//
(* ****** ****** *)
//
fun
f0_bang
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Pbang(d2p1) = d2p.node()
val
d2p1 = tread20_d2pat(d2p1, err)
in//let
if
(err=e00)
then (d2p) else
d2pat_bang_errck(d2p.lctn(), d2p1)
end (*let*) // end of [f0_bang(d2p,err)]
//
fun
f0_flat
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Pflat(d2p1) = d2p.node()
val
d2p1 = tread20_d2pat(d2p1, err)
in//let
if
(err=e00)
then (d2p) else
d2pat_flat_errck(d2p.lctn(), d2p1)
end (*let*) // end of [f0_flat(d2p,err)]
//
fun
f0_free
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Pfree(d2p1) = d2p.node()
val
d2p1 = tread20_d2pat(d2p1, err)
in//let
if
(err=e00)
then (d2p) else
d2pat_free_errck(d2p.lctn(), d2p1)
end (*let*) // end of [f0_free(d2p,err)]
//
(* ****** ****** *)
//
(*
fun
f0_sym0
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Psym0
( drpt
, d1e1, dpis) = d2p.node()
//
val d2p1 = drpt.dpat((*void*))
//
in//let
//
case+
d2p1.node() of
|
D2Pnone0() =>
let
val lvl0 = 1
in // HX: left-error
err := err+1;d2pat_errck(lvl0,d2p)
end (*let*) // end of [ D2Pnone0 ]
| _(*non-D2Pnone0*) =>
let
val d2p1 = tread20_d2pat(d2p1, err)
in//let
if
(err=e00)
then (d2p) else
let
val lvl0 = errvl(d2p1) in
drpt.dpat(d2p1);d2pat_errck(lvl0+1,d2p)
end (*let*) // end of [else]
end (*let*) // end of [non-D2Pnone0]
//
end (*let*) // end of [f0_sym0(d2p,err)]
*)
//
(* ****** ****** *)
//
fun
f0_dap1
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Pdap1(d2f0) = d2p.node()
val
d2f0 = tread20_d2pat(d2f0, err)
//
in//let
if
(err=e00)
then (d2p) else
d2pat_dap1_errck(d2p.lctn(), d2f0)
end (*let*) // end of [f0_dap1(d2p,err)]
//
(* ****** ****** *)
//
fun
f0_dapp
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Pdapp
(d2f0
,npf1, d2ps) = d2p.node()
val
d2f0 =
(
  tread20_d2pat(d2f0, err))
val
d2ps =
(
  tread20_d2patlst(d2ps, err))
in//let
if
(err=e00)
then (d2p) else
let
val loc = d2p.lctn() in
d2pat_dapp_errck(loc,d2f0,npf1,d2ps)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_dapp(d2p,err)]
//
(* ****** ****** *)
//
fun
f0_rfpt
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Prfpt
(d2p1
,tkas, d2p2) = d2p.node()
val
d2p1 = tread20_d2pat(d2p1, err)
val
d2p2 = tread20_d2pat(d2p2, err)
in//let
if
(err=e00)
then (d2p) else
let
val loc = d2p.lctn() in
d2pat_rfpt_errck(loc,d2p1,tkas,d2p2)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_rfpt(d2p,err)]
//
(* ****** ****** *)
//
fun
f0_tup0
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Ptup0
(npf1, d2ps) = d2p.node()
//
val
d2ps =
(
  tread20_d2patlst(d2ps, err))
//
in//let
if
(err=e00)
then (d2p) else
let
val loc = d2p.lctn() in
d2pat_tup0_errck(loc, npf1, d2ps)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_tup0(d2p,err)]
//
(* ****** ****** *)
//
fun
f0_tup1
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Ptup1
( tknd
, npf1, d2ps) = d2p.node()
//
val
d2ps =
tread20_d2patlst(d2ps, err)
//
in//let
if
(err=e00)
then (d2p) else
d2pat_tup1_errck
(d2p.lctn() , tknd , npf1 , d2ps)
end (*let*) // end of [f0_tup1(d2p,err)]
//
(* ****** ****** *)
//
fun
f0_rcd2
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Prcd2
( tknd
, npf1, ldps) = d2p.node()
//
val
ldps =
tread20_l2d2plst(ldps, err)
//
in//let
if
(err=e00)
then (d2p) else
d2pat_rcd2_errck
(d2p.lctn() , tknd , npf1 , ldps)
end (*let*) // end of [f0_rcd2(d2p,err)]
//
(* ****** ****** *)
//
fun
f0_annot
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Pannot
(d2p1
,s1e2, s2e2) = d2p.node()
//
val
d2p1 = tread20_d2pat(d2p1, err)
(*
val
s2e2 = tread20_s2exp(s2e2, err)
*)
//
in//let
if
(err=e00)
then (d2p) else
let
val loc = d2p.lctn() in
d2pat_annot_errck(loc,d2p1,s1e2,s2e2)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_annot(d2p,err)]
//
(* ****** ****** *)
//
} (*where*)//end[tread20_d2pat(d2p0,err)]
//
(* ****** ****** *)
//
#implfun
tread20_l2d2p
  (ld2p, err) =
let
//
val e00 = err
//
val+
D2LAB(lab0, d2p1) = ld2p
//
val
d2p1 = tread20_d2pat(d2p1, err)
//
in//let
if // if
(err=e00)
then (ld2p) else D2LAB(lab0, d2p1)
end (*let*)//end-(tread20_l2d2p(ld2p,err))
//
(* ****** ****** *)
//
#implfun
tread20_d2exp
( d2e0, err ) =
(
case+
d2e0.node() of
//
|D2Evar _ => d2e0
//
|D2Eint _ => d2e0
|D2Ebtf _ => d2e0
|D2Echr _ => d2e0
|D2Eflt _ => d2e0
|D2Estr _ => d2e0
//
|D2Ei00 _ => d2e0
|D2Eb00 _ => d2e0
|D2Ec00 _ => d2e0
|D2Ef00 _ => d2e0
|D2Es00 _ => d2e0
//
|D2Econ _ => d2e0
|D2Ecst _ => d2e0
//
|D2Etop _ => d2e0
//
|D2Econs _ => d2e0
|D2Ecsts _ => d2e0
//
|D2Esym0 _ => f0_sym0(d2e0, err)
//
|D2Esapp _ => f0_sapp(d2e0, err)
|D2Etapp _ => f0_tapp(d2e0, err)
//
|D2Edap0 _ => f0_dap0(d2e0, err)
|D2Edapp _ => f0_dapp(d2e0, err)
//
|D2Eproj _ => f0_proj(d2e0, err)
//
|D2Elet0 _ => f0_let0(d2e0, err)
//
|D2Eift0 _ => f0_ift0(d2e0, err)
|D2Ecas0 _ => f0_cas0(d2e0, err)
//
|D2Eseqn _ => f0_seqn(d2e0, err)
//
|D2Etup0 _ => f0_tup0(d2e0, err)
|D2Etup1 _ => f0_tup1(d2e0, err)
|D2Ercd2 _ => f0_rcd2(d2e0, err)
//
|D2Elam0 _ => f0_lam0(d2e0, err)
|D2Efix0 _ => f0_fix0(d2e0, err)
//
|D2Etry0 _ => f0_try0(d2e0, err)
//
|D2Eaddr _ => f0_addr(d2e0, err)
|D2Eview _ => f0_view(d2e0, err)
//
|D2Eeval _ => f0_eval(d2e0, err)
//
|D2Efold _ => f0_fold(d2e0, err)
|D2Efree _ => f0_free(d2e0, err)
//
|D2Ewhere _ => f0_where(d2e0, err)
//
|D2Eassgn _ => f0_assgn(d2e0, err)
//
|D2Eraise _ => f0_raise(d2e0, err)
//
|D2El0azy _ => f0_l0azy(d2e0, err)
|D2El1azy _ => f0_l1azy(d2e0, err)
//
|D2Eannot _ => f0_annot(d2e0, err)
//
|D2Elabck _ => f0_labck(d2e0, err)
|D2Et2pck _ => f0_t2pck(d2e0, err)
|D2Et2ped _ => f0_t2ped(d2e0, err)
//
|D2Enone0 _ => f0_none0(d2e0, err)
//
(* ****** ****** *)
//
|
D2Eextnam _ => f0_extnam(d2e0, err)
//
|
D2Esynext _ => f0_synext(d2e0, err)
//
(* ****** ****** *)
//
| _(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; d2exp_errck(lvl0,d2e0))
endlet // end of [ _(* otherwise *) ]
//
(* ****** ****** *)
//
) where // end-of-[(*case+(d2e0)-of*)]
{
//
(* ****** ****** *)
//
fun
f0_sym0
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Esym0
( drxp
, d1e1, dpis) = d2e.node()
//
val d2e1 = drxp.dexp((*void*))
//
in//let
//
case+
d2e1.node() of
|
D2Enone0() =>
let
val lvl0 = 1
in // HX: left-error
err := err+1;d2exp_errck(lvl0,d2e)
end (*let*) // end of [D2Enone0()]
| _(*non-D2Enone0*) =>
let
val d2e1 = tread20_d2exp(d2e1, err)
in//let
if
(err=e00)
then (d2e) else
let
val lvl0 = errvl(d2e1) in
drxp.dexp(d2e1);d2exp_errck(lvl0+1,d2e)
end (*let*) // end of [else]
end (*let*) // end of [non-D2Enone0]
//
end (*let*) // end of [f0_sym0(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_sapp
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Esapp
(d2f0, s2es) = d2e.node()
val
d2f0 = tread20_d2exp(d2f0, err)
(*
val
s2es = tread20_s2explst(d2es, err)
*)
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_sapp_errck( loc, d2f0, s2es )
end (*let*) // end-of-[else]
end (*let*) // end of [f0_sapp(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_tapp
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Etapp
(d2f0, s2es) = d2e.node()
val
d2f0 = tread20_d2exp(d2f0, err)
(*
val
s2es = tread20_s2explst(d2es, err)
*)
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_tapp_errck( loc, d2f0, s2es )
end (*let*) // end-of-[else]
end (*let*) // end of [f0_tapp(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_dap0
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Edap0(d2e1) = d2e.node()
val
d2e1 = tread20_d2exp(d2e1, err)
in//let
if
(err=e00)
then (d2e) else
d2exp_dap0_errck(d2e.lctn(), d2e1)
end (*let*) // end of [f0_dap0(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_dapp
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Edapp
(d2f0
,npf1, d2es) = d2e.node()
val
d2f0 = tread20_d2exp(d2f0, err)
val
d2es = tread20_d2explst(d2es, err)
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_dapp_errck(loc,d2f0,npf1,d2es)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_dapp(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_proj
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Eproj
(tknd
,drxp
,dlab, dtup) = d2e.node()
val
dtup = tread20_d2exp(dtup, err)
in//let
if
(err=e00)
then (d2e) else
d2exp_proj_errck
(d2e.lctn(), tknd, drxp, dlab, dtup)
end (*let*) // end of [f0_proj(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_let0
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Elet0
(dcls, d2e1) = d2e.node()
//
val
dcls =
tread20_d2eclist(dcls, err)
val
d2e1 = tread20_d2exp(d2e1, err)
//
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_let0_errck(loc, dcls, d2e1)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_let0(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_ift0
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Eift0
( d2e1
, dthn, dels) = d2e.node()
//
val d2e1 =
tread20_d2exp(d2e1, err)
val dthn =
tread20_d2expopt(dthn, err)
val dels =
tread20_d2expopt(dels, err)
//
in//let
if
(err=e00)
then (d2e) else
d2exp_ift0_errck
(d2e0.lctn(), d2e1, dthn, dels)
end (*let*) // end of [f0_ift0(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_cas0
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Ecas0
( tknd
, d2e1, d2cs) = d2e.node()
//
val
d2e1 =
tread20_d2exp(d2e1, err)
val
d2cs =
tread20_d2clslst(d2cs, err)
//
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_cas0_errck(loc,tknd,d2e1,d2cs)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_cas0(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_seqn
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Eseqn
(d2es, d2e1) = d2e.node()
//
val
d2es =
tread20_d2explst(d2es, err)
val
d2e1 = tread20_d2exp(d2e1, err)
//
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_seqn_errck(loc, d2es, d2e1)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_seqn(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_tup0
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Etup0
(npf1, d2es) = d2e.node()
//
val
d2es =
tread20_d2explst(d2es, err)
//
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_tup0_errck(loc, npf1, d2es)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_tup0(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_tup1
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Etup1
( tknd
, npf1, d2es) = d2e.node()
//
val
d2es =
tread20_d2explst(d2es, err)
//
in//let
if
(err=e00)
then (d2e) else
d2exp_tup1_errck
(d2e.lctn() , tknd , npf1 , d2es)
end (*let*) // end of [f0_tup1(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_rcd2
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Ercd2
( tknd
, npf1, ldes) = d2e.node()
//
val
ldes =
tread20_l2d2elst(ldes, err)
//
in//let
if
(err=e00)
then (d2e) else
d2exp_rcd2_errck
(d2e.lctn() , tknd , npf1 , ldes)
end (*let*) // end of [f0_rcd2(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_lam0
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Elam0
( tknd
, f2as, sres
, arrw, dexp) = d2e0.node()
//
val f2as =
  tread20_f2arglst(f2as, err)
(*
val sres = tread20_s2res(sres, err)
*)
val dexp = tread20_d2exp(dexp, err)
//
in//let
if
(err=e00)
then (d2e) else
d2exp_lam0_errck
(d2e.lctn(),tknd,f2as,sres,arrw,dexp)
end (*let*) // end of [f0_lam0(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_fix0
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Efix0
( tknd
, d2v0
, f2as, sres
, arrw, dexp) = d2e0.node()
//
val f2as =
  tread20_f2arglst(f2as, err)
(*
val sres = tread20_s2res(sres, err)
*)
val
dexp = tread20_d2exp(dexp, err)
//
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_fix0_errck
( loc,tknd,d2v0,f2as,sres,arrw,dexp )
end (*let*) // end-of-[else]
end (*let*) // end of [f0_fix0(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_try0
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Etry0
( tknd
, d2e1, dcls) = d2e.node()
//
val d2e1 =
  tread20_d2exp(d2e1, err)
val dcls =
  tread20_d2clslst(dcls, err)
//
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_try0_errck(loc, tknd,d2e1,dcls)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_try0(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_addr
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Eaddr
(  d2e1  ) = d2e.node()
//
val
d2e1 =
tread20_d2exp(d2e1, err)
//
in//let
if
(err=e00)
then (d2e) else
d2exp_addr_errck( d2e.lctn(), d2e1 )
end (*let*) // end of [f0_addr(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_view
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Eview
(  d2e1  ) = d2e.node()
//
val
d2e1 =
tread20_d2exp(d2e1, err)
//
in//let
if
(err=e00)
then (d2e) else
d2exp_view_errck( d2e.lctn(), d2e1 )
end (*let*) // end of [f0_view(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_eval
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Eeval
(  d2e1  ) = d2e.node()
//
val
d2e1 =
tread20_d2exp(d2e1, err)
//
in//let
if
(err=e00)
then (d2e) else
d2exp_eval_errck( d2e.lctn(), d2e1 )
end (*let*) // end of [f0_eval(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_fold
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Efold
(  d2e1  ) = d2e.node()
//
val
d2e1 =
tread20_d2exp(d2e1, err)
//
in//let
if
(err=e00)
then (d2e) else
d2exp_fold_errck( d2e.lctn(), d2e1 )
end (*let*) // end of [f0_fold(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_free
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Efree
(  d2e1  ) = d2e.node()
//
val
d2e1 =
tread20_d2exp(d2e1, err)
//
in//let
if
(err=e00)
then (d2e) else
d2exp_free_errck( d2e.lctn(), d2e1 )
end (*let*) // end of [f0_free(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_where
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Ewhere
(d2e1, dcls) = d2e.node()
//
val
d2e1 =
tread20_d2exp(d2e1, err)
val
dcls =
tread20_d2eclist(dcls, err)
//
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_where_errck(loc, d2e1, dcls)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_where(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_assgn
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Eassgn
(d2el, d2er) = d2e.node()
//
val
d2el = tread20_d2exp(d2el, err)
val
d2er = tread20_d2exp(d2er, err)
//
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_assgn_errck(loc, d2el, d2er)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_assgn(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_raise
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Eraise
(tknd, d2e1) = d2e.node()
//
val
d2e1 = tread20_d2exp(d2e1, err)
//
in//let
if
(err=e00)
then (d2e) else
d2exp_raise_errck(d2e.lctn(),tknd,d2e1)
end (*let*) // end of [f0_raise(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_l0azy
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2El0azy
(dsym, d2e1) = d2e.node()
//
val
d2e1 = tread20_d2exp(d2e1, err)
//
in//let
if
(err=e00)
then (d2e) else
d2exp_l0azy_errck(d2e.lctn(),dsym,d2e1)
end (*let*) // end of [f0_l0azy(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_l1azy
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2El1azy
(dsym
,d2e1,d2es) = d2e.node()
//
val
d2e1 = tread20_d2exp(d2e1, err)
val
d2es = tread20_d2explst(d2es, err)
//
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_l1azy_errck(loc,dsym,d2e1,d2es)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_l1azy(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_annot
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Eannot
(d2e1
,s1e2, s2e2) = d2e.node()
//
val
d2e1 = tread20_d2exp(d2e1, err)
(*
val
s2e2 = tread20_s2exp(s2e2, err)
*)
//
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_annot_errck(loc,d2e1,s1e2,s2e2)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_annot(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_labck
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Elabck
(d2e1, lab2) = d2e.node()
//
val
d2e1 = tread20_d2exp(d2e1, err)
//
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_labck_errck(loc, d2e1, lab2)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_labck(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_t2pck
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Et2pck
(d2e1, t2p2) = d2e.node()
//
val
d2e1 = tread20_d2exp(d2e1, err)
//
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_t2pck_errck(loc, d2e1, t2p2)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_t2pck(d2e,err)]
//
fun
f0_t2ped
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Et2ped
(d2e1, t2p2) = d2e.node()
//
val
d2e1 = tread20_d2exp(d2e1, err)
//
in//let
if
(err=e00)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_t2ped_errck(loc, d2e1, t2p2)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_t2ped(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_none0
(d2e: d2exp
,err: &sint >> _): d2exp =
let
val-D2Enone0() = d2e.node() in (d2e) end
//
(* ****** ****** *)
//
fun
f0_extnam
(d2e: d2exp
,err: &sint >> _): d2exp =
let
val-D2Eextnam _ = d2e.node() in (d2e) end
//
(*
HX-2024-07-20:
Sat 20 Jul 2024 11:44:50 AM EDT
*)
fun
f0_synext
(d2e: d2exp
,err: &sint >> _): d2exp =
let
val-D2Esynext _ = d2e.node() in (d2e) end
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val (  ) =
(
prerrsln("tread20_d2exp: d2e0 = ", d2e0))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
} (*where*)//end-[tread20_d2exp(d2e0,err)]
//
(* ****** ****** *)
//
#implfun
tread20_l2d2e
  (ld2e, err) =
let
//
val e00 = err
//
val+
D2LAB(lab0, d2e1) = ld2e
//
val
d2e1 = tread20_d2exp(d2e1, err)
//
in//let
if // if
(err=e00)
then (ld2e) else D2LAB(lab0, d2e1)
end (*let*)//end-(tread20_l2d2e(ld2e,err))
//
(* ****** ****** *)
//
(* ****** ****** *)
//
#implfun
tread20_f2arg
  (farg, err) =
(
case+
farg.node() of
//
(*
|F2ARGnone of (token)
*)
//
|
F2ARGdapp
(npf1, d2ps) =>
let
val e00 = err
val d2ps =
tread20_d2patlst(d2ps, err)
in//let
if
(err=e00)
then (farg) else
f2arg
(farg.lctn(), F2ARGdapp(npf1, d2ps))
endlet // end of [F2ARGdapp(npf1,d2ps)]
//
|
F2ARGsapp
(s2vs, s2es) =>
let
val e00 = err
(*
val s2es =
tread20_s2explst(s2es, err)
*)
in//let
if
(err=e00)
then (farg) else
f2arg
(farg.lctn(), F2ARGsapp(s2vs, s2es))
endlet // end of [F2ARGsapp(s2vs,s2es)]
//
|
F2ARGmets
(   s2es   ) =>
let
//
val e00 = err
//
(*
val s2es =
tread20_s2explst(s2es, err)
*)
//
in//let
if
(err=e00)
then (farg) else
f2arg(farg.lctn(), F2ARGmets( s2es ))
endlet // end of [ F2ARGmets(  s2es  ) ]
//
) (*case+*)//end-[tread20_f2arg(farg,err)]
//
(* ****** ****** *)
//
#implfun
tread20_d2gua
  (dgua, err) =
(
case+
dgua.node() of
|
D2GUAexp
( d2e1 ) => let
//
val e00 = err
//
val
d2e1 = tread20_d2exp(d2e1, err)
//
in//let
if
(err=e00)
then (dgua) else
d2gua(dgua.lctn(), D2GUAexp(d2e1))
endlet // end of [ D2GUAexp(d2e1) ]
|
D2GUAmat
(d2e1,d2p2) =>
let
//
val e00 = err
//
val d2e1 = tread20_d2exp(d2e1, err)
val d2p2 = tread20_d2pat(d2p2, err)
//
in//let
if
(err=e00)
then (dgua) else
d2gua(dgua.lctn(), D2GUAmat(d2e1,d2p2))
endlet // end of [ D2GPTgua(_,_,_) ]
) (*case+*)//end-of-[tread20_d2gua(dgua,err)]
//
(* ****** ****** *)
//
#implfun
tread20_d2gpt
  (dgpt, err) =
(
case+
dgpt.node() of
|
D2GPTpat
( d2p1 ) => let
//
val e00 = err
//
val
d2p1 = tread20_d2pat(d2p1, err)
//
in//let
if
(err=e00)
then (dgpt) else
d2gpt(dgpt.lctn(), D2GPTpat(d2p1))
endlet // end of [ D2GPTpat(d2p1) ]
|
D2GPTgua
(d2p1,d2gs) =>
let
//
val e00 = err
//
val d2p1 = tread20_d2pat(d2p1, err)
//
val d2gs = tread20_d2gualst(d2gs, err)
//
in//let
if
(err=e00)
then (dgpt) else
d2gpt(dgpt.lctn(), D2GPTgua(d2p1,d2gs))
endlet // end of [ D2GPTgua(_,_,_) ]
) (*case+*)//end-of-[tread20_d2gpt(dgpt,err)]
//
(* ****** ****** *)
//
#implfun
tread20_d2cls
  (dcls, err) =
(
case+
dcls.node() of
|
D2CLSgpt
( dgpt ) => let
//
val e00 = err
//
val dgpt =
tread20_d2gpt(dgpt, err)
in//let
if
(err=e00)
then (dcls)
else
d2cls(dcls.lctn(), D2CLSgpt(dgpt))
end (*let*)//end-of[D2CLSgpt(dgpt)]
|
D2CLScls
(dgpt,d2e1) =>
let
//
val e00 = err
//
val dgpt = tread20_d2gpt(dgpt, err)
val d2e1 = tread20_d2exp(d2e1, err)
//
in//let
if
(err=e00)
then (dcls)
else
d2cls(dcls.lctn(), D2CLScls(dgpt,d2e1))
endlet // end-of-[ D2CLScls(_,_,_) ]
) (*case+*)//end-of-[tread20_d2cls(dcls,err)]
//
(* ****** ****** *)
//
#implfun
tread20_d2patlst
  (  d2ps, err  ) =
list_tread20_fnp(d2ps, err, tread20_d2pat)
//
(* ****** ****** *)
//
#implfun
tread20_d2explst
  (  d2es, err  ) =
list_tread20_fnp(d2es, err, tread20_d2exp)
//
#implfun
tread20_d2expopt
  (  dopt, err  ) =
optn_tread20_fnp(dopt, err, tread20_d2exp)
//
(* ****** ****** *)
//
#implfun
tread20_l2d2plst
  (  ldps, err  ) =
list_tread20_fnp(ldps, err, tread20_l2d2p)
#implfun
tread20_l2d2elst
  (  ldes, err  ) =
list_tread20_fnp(ldes, err, tread20_l2d2e)
//
(* ****** ****** *)
//
#implfun
tread20_f2arglst
  (  f2as, err  ) =
list_tread20_fnp(f2as, err, tread20_f2arg)
//
(* ****** ****** *)
//
#implfun
tread20_d2gualst
  (  d2gs, err  ) =
list_tread20_fnp(d2gs, err, tread20_d2gua)
//
(* ****** ****** *)
//
#implfun
tread20_d2clslst
  (  d2cs, err  ) =
list_tread20_fnp(d2cs, err, tread20_d2cls)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_tread20_dynexp.dats] *)
