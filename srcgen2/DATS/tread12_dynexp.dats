(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
(*
Fri 11 Nov 2022 03:46:50 PM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
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
#staload "./../SATS/tread12.sats"
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
//
fun
d2pat_errvl_a1
(d2p0: d2pat): sint =
(
case+ d2p0.node() of
|
D2Perrck
(lvl0, _) => lvl0 | _ => 0
)
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
gmax
(errvl(d2p1),errvl(d2p2))
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
gmax
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
gmax
( errvl(dp1)
, l2d2p_errvl_ldps(ldps)) end
endcas // end of [ case+(ldps) ]
)
//
#symload errvl with l2d2p_errvl_ldps
//
(* ****** ****** *)
//
fun
d2exp_errvl_a1
(d2e0: d2exp): sint =
(
case+ d2e0.node() of
|
D2Eerrck
(lvl0, _) => lvl0 | _ => 0
)
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
gmax
(errvl(d2e1),errvl(d2e2))
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
gmax
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
gmax
( errvl(de1)
, l2d2e_errvl_ldes(ldes)) end
endcas // end of [ case+(ldes) ]
)
//
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
list_cons(dcl1,dcls) => gmax
(errvl(dcl1), d2cls_errvl_lst(dcls))
) (*case+*)//end-of-(d2cls_errvl_lst)
//
(* ****** ****** *)
//
(*
HX-2022-11-23:
A placeholder for the moment
but it may actually just be okay!
*)
fun
d2ecl_errvl_lst
(dcs: d2eclist): sint = 0
#symload errvl with d2ecl_errvl_lst
//
(* ****** ****** *)
(*
HX-2022-11-23:
Various 'errck' functions for
constructing d2pat/d2exp-values
*)
(* ****** ****** *)
//
(* ****** ****** *)
(*
Various
errck-functions for d2pat-values
*)
//
fun
d2pat_bang_errck
(loc0: loc_t
,d2p1: d2pat): d2pat =
let
val lvl0 = errvl(d2p1) in//let
d2pat_errck
(lvl0+1,d2pat(loc0, D2Pbang(d2p1)))
endlet // end of [d2pat_bang_errck(...)]
//
fun
d2pat_flat_errck
(loc0: loc_t
,d2p1: d2pat): d2pat =
let
val lvl0 = errvl(d2p1) in//let
d2pat_errck
(lvl0+1,d2pat(loc0, D2Pflat(d2p1)))
endlet // end of [d2pat_flat_errck(...)]
//
fun
d2pat_free_errck
(loc0: loc_t
,d2p1: d2pat): d2pat =
let
val lvl0 = errvl(d2p1) in//let
d2pat_errck
(lvl0+1,d2pat(loc0, D2Pfree(d2p1)))
endlet // end of [d2pat_free_errck(...)]
//
(* ****** ****** *)
//
fun
d2pat_sapp_errck
(loc0: loc_t
,d2f0: d2pat
,s2vs: s2varlst): d2pat =
let
val lvl0 = errvl(d2f0) in//let
d2pat_errck
(lvl0+1,d2pat(loc0,D2Psapp(d2f0,s2vs)))
endlet // end of [d2pat_sapp_errck(...)]
//
(* ****** ****** *)
//
fun
d2pat_dap0_errck
(loc0: loc_t
,d2p1: d2pat): d2pat =
let
val lvl0 = errvl(d2p1) in//let
d2pat_errck
(lvl0+1,d2pat(loc0, D2Pdap0(d2p1)))
endlet // end of [d2pat_dap0_errck(...)]
//
fun
d2pat_dap1_errck
(loc0: loc_t
,d2p1: d2pat): d2pat =
let
val lvl0 = errvl(d2p1) in//let
d2pat_errck
(lvl0+1,d2pat(loc0, D2Pdap1(d2p1)))
endlet // end of [d2pat_dap1_errck(...)]
//
(* ****** ****** *)
//
fun
d2pat_dapp_errck
(loc0: loc_t
,d2f0: d2pat
,npf1: (sint)
,d2ps: d2patlst): d2pat =
let
val lvl0 = gmax
(errvl(d2f0), errvl(d2ps)) in//let
d2pat_errck
(lvl0+1
,d2pat(loc0, D2Pdapp(d2f0,npf1,d2ps)))
endlet // end of [d2pat_dapp_errck(...)]
//
(* ****** ****** *)
//
fun
d2pat_tup0_errck
( loc0: loc_t
, npf1: (sint)
, d2ps: d2patlst): d2pat =
let
val lvl0 = errvl(d2ps) in//let
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
, knd0: token
, npf1: (sint)
, d2ps: d2patlst): d2pat =
let
val lvl0 = errvl(d2ps) in//let
d2pat_errck
( lvl0+1
, d2pat(loc0,D2Ptup1(knd0,npf1,d2ps)))
endlet // end of [d2pat_tup1_errck(...)]
//
(* ****** ****** *)
//
fun
d2pat_rcd2_errck
( loc0: loc_t
, knd0: token
, npf1: (sint)
, ldps: l2d2plst): d2pat =
let
val lvl0 = errvl(ldps) in//let
d2pat_errck
( lvl0+1
, d2pat(loc0,D2Prcd2(knd0,npf1,ldps)))
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
val lvl0 = errvl(d2p1) in//let
d2pat_errck
( lvl0+1
, d2pat(loc0,D2Pannot(d2p1,s1e2,s2e2)))
endlet // end of [d2pat_annot_errck(...)]
//
(* ****** ****** *)
//
(* ****** ****** *)
(*
Various
errck-functions for d2exp-values
*)
(* ****** ****** *)
//
fun
d2exp_sapp_errck
(loc0: loc_t
,d2f0: d2exp
,s2es: s2explst): d2exp =
let
val lvl0 = errvl(d2f0) in//let
d2exp_errck
(lvl0+1,d2exp(loc0,D2Esapp(d2f0,s2es)))
endlet // end of [d2exp_sapp_errck(...)]
//
fun
d2exp_tapp_errck
(loc0: loc_t
,d2f0: d2exp
,s2es: s2explst): d2exp =
let
val lvl0 = errvl(d2f0) in//let
d2exp_errck
(lvl0+1,d2exp(loc0,D2Etapp(d2f0,s2es)))
endlet // end of [d2exp_tapp_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_dap0_errck
(loc0: loc_t
,d2e1: d2exp): d2exp =
let
val lvl0 = errvl(d2e1) in//let
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
val lvl0 = gmax
(errvl(d2f0), errvl(d2es)) in//let
d2exp_errck
(lvl0+1
,d2exp(loc0, D2Edapp(d2f0,npf1,d2es)))
endlet // end of [d2exp_dapp_errck(...)]
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
val lvl0 = gmax
(errvl(dcls), errvl(d2e1)) in//let
d2exp_errck
(lvl0+1,d2exp(loc0,D2Elet0(dcls,d2e1)))
endlet // end of [d2exp_let0_errck(...)]
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
val lvl0 = gmax
(errvl(d2es), errvl(d2e1)) in//let
d2exp_errck
( lvl0+1
, d2exp( loc0, D2Eseqn( d2es, d2e1 )))
endlet // end of [d2exp_seqn_errck(...)]
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
val lvl0 =
gmax
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
val lvl = gmax
(errvl(d2e1), errvl(d2cs))
in//let
d2exp_errck
( lvl+1
, d2exp(loc0,D2Ecas0(tknd,d2e1,d2cs)))
endlet // end of [d2exp_cas0_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_tup0_errck
( loc0: loc_t
, npf1: (sint)
, d2es: d2explst): d2exp =
let
val lvl0 = errvl(d2es) in//let
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
, knd0: token
, npf1: (sint)
, d2es: d2explst): d2exp =
let
val lvl0 = errvl(d2es) in//let
d2exp_errck
( lvl0+1
, d2exp(loc0,D2Etup1(knd0,npf1,d2es)))
endlet // end of [d2exp_tup1_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_rcd2_errck
( loc0: loc_t
, knd0: token
, npf1: (sint)
, ldes: l2d2elst): d2exp =
let
val lvl0 = errvl(ldes) in//let
d2exp_errck
( lvl0+1
, d2exp(loc0,D2Ercd2(knd0,npf1,ldes)))
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
, d2e1
: d2exp(*body*)): d2exp =
let
val lvl = d2exp_errvl(d2e1)
in//let
d2exp_errck
( lvl+1
, d2exp
  (loc0
  ,D2Elam0(tknd,f2as,sres,arrw,d2e1)))
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
, d2e1
: d2exp(*body*)): d2exp =
let
val lvl = d2exp_errvl(d2e1)
in//let
d2exp_errck
(
lvl+1,
d2exp
(
loc0,
D2Efix0
(tknd, d2v0, f2as, sres, arrw, d2e1)))
endlet // end of [d2exp_fix0_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_try0_errck
(loc0: loc_t
,tknd: token
,d2e1: d2exp
,d2cs: d2clslst): d2exp =
let
val lvl = gmax
(errvl(d2e1), errvl(d2cs))
in//let
d2exp_errck
( lvl+1
, d2exp(loc0,D2Etry0(tknd,d2e1,d2cs)))
endlet // end of [d2exp_try0_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_addr_errck
(loc0: loc_t
,d2e1: d2exp): d2exp =
let
val lvl0 = errvl(d2e1) in//let
d2exp_errck
(lvl0+1, d2exp(loc0, D2Eaddr(d2e1)))
endlet // end of [d2exp_addr_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_fold_errck
(loc0: loc_t
,d2e1: d2exp): d2exp =
let
val lvl0 = errvl(d2e1) in//let
d2exp_errck
(lvl0+1, d2exp(loc0, D2Efold(d2e1)))
endlet // end of [d2exp_fold_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_eval_errck
(loc0: loc_t
,d2e1: d2exp): d2exp =
let
val lvl0 = errvl(d2e1) in//let
d2exp_errck
(lvl0+1, d2exp(loc0, D2Eeval(d2e1)))
endlet // end of [d2exp_eval_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_free_errck
(loc0: loc_t
,d2e1: d2exp): d2exp =
let
val lvl0 = errvl(d2e1) in//let
d2exp_errck
(lvl0+1, d2exp(loc0, D2Efree(d2e1)))
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
val lvl0 = gmax
(errvl(d2e1), errvl(dcls)) in//let
d2exp_errck
( lvl0+1
, d2exp( loc0, D2Ewhere( d2e1, dcls ) ))
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
val lvl0 = gmax
(errvl(d2el), errvl(d2er)) in//let
d2exp_errck
( lvl0+1
, d2exp( loc0, D2Eassgn( d2el, d2er ) ))
endlet // end of [d2exp_assgn_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_brckt_errck
( loc0: loc_t
, dpis: d2ptmlst
, d2es: d2explst): d2exp =
let
val lvl0 = d2exp_errvl(d2es)
in//let
d2exp_errck
(
lvl0+1,d2exp(loc0,D2Ebrckt(dpis,d2es)))
endlet // end of [d2exp_brckt_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_dtsel_errck
( loc0: loc_t
, tknd: token
, lab1: label
, dpis: d2ptmlst
, npf1: (sint)
, dopt: d2explstopt): d2exp =
let
val lvl0 =
(
case+ dopt of
|
optn_nil() => 0
|
optn_cons(d2es) => errvl(d2es))
in//let
d2exp_errck
(
lvl0+1,
d2exp_make_node
(loc0
,D2Edtsel(tknd,lab1,dpis,npf1,dopt)))
endlet // end of [d2exp_dtsel_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_raise_errck
(loc0: loc_t
,d2e1: d2exp): d2exp =
let
val lvl0 = errvl(d2e1) in//let
d2exp_errck
(lvl0+1, d2exp(loc0, D2Eraise(d2e1)))
endlet // end of [d2exp_raise_errck(...)]
//
(* ****** ****** *)
//
fun
d2exp_lazy0_errck
(loc0: loc_t
,d2e1: d2exp): d2exp =
let
val lvl0 = errvl(d2e1) in//let
d2exp_errck
(lvl0+1, d2exp(loc0, D2Elazy0(d2e1)))
endlet // end of [d2exp_lazy0_errck(...)]
//
fun
d2exp_lazy1_errck
(loc0: loc_t
,d2e1: d2exp
,d2es: d2explst): d2exp =
let
val lvl0 = errvl(d2e1) in//let
d2exp_errck
(lvl0+1,d2exp(loc0,D2Elazy1(d2e1,d2es)))
endlet // end of [d2exp_llazy1_errck(...)]
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
val lvl0 = errvl(d2e1) in//let
d2exp_errck
( lvl0+1
, d2exp(loc0,D2Eannot(d2e1,s1e2,s2e2)))
endlet // end of [d2exp_annot_errck(...)]
//
(* ****** ****** *)
//
(* ****** ****** *)
(*
HX-2022-11-23:
Various tread12-functions for gleaning
errors of unboundness (that is, names that
are used but not declared)
*)
(* ****** ****** *)
//
#implfun
tread12_d2con
( d2c0, err ) =
(
if
(e00 = err)
then d2c0 else
(d2con_set_sexp(d2c0, s2e0); d2c0)
) where
{
//
val e00 = err
//
val s2e0 = d2c0.sexp()
//
// (*
val (  ) =
prerrln("tread12_d2con: s2e0 = ", s2e0)
// *)
//
val s2e0 = tread12_s2exp(d2c0.sexp(), err)
} (*where*) // end of [tread12_d2con(d2c0,err)]
//
(* ****** ****** *)
//
#implfun
tread12_d2pat
( d2p0, err ) =
(
case+
d2p0.node() of
//
|D2Pvar _ => d2p0
|D2Pany _ => d2p0
//
|D2Pi00 _ => d2p0
|D2Pb00 _ => d2p0
|D2Pc00 _ => d2p0
|D2Ps00 _ => d2p0
//
|D2Pint _ => d2p0
|D2Pbtf _ => d2p0
|D2Pchr _ => d2p0
|D2Pflt _ => d2p0
|D2Pstr _ => d2p0
//
|D2Pcon _ => d2p0
|D2Pcons _ => d2p0
//
|D2Pbang _ => f0_bang(d2p0, err)
|D2Pflat _ => f0_flat(d2p0, err)
|D2Pfree _ => f0_free(d2p0, err)
//
|D2Psapp _ => f0_sapp(d2p0, err)
//
|D2Pdap0 _ => f0_dap0(d2p0, err)
|D2Pdap1 _ => f0_dap1(d2p0, err)
|D2Pdapp _ => f0_dapp(d2p0, err)
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
d2p1 = tread12_d2pat(d2p1, err)
in//let
if
(e00=err)
then (d2p) else
d2pat_bang_errck(d2p.lctn(), d2p1)
end (*let*) // end of [f0_bang(d2p,err)]
//
(* ****** ****** *)
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
d2p1 = tread12_d2pat(d2p1, err)
in//let
if
(e00=err)
then (d2p) else
d2pat_flat_errck(d2p.lctn(), d2p1)
end (*let*) // end of [f0_flat(d2p,err)]
//
(* ****** ****** *)
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
d2p1 = tread12_d2pat(d2p1, err)
in//let
if
(e00=err)
then (d2p) else
d2pat_free_errck(d2p.lctn(), d2p1)
end (*let*) // end of [f0_free(d2p,err)]
//
(* ****** ****** *)
//
fun
f0_sapp
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Psapp
(d2f0, s2vs) = d2p.node()
val
d2f0 = tread12_d2pat(d2f0, err)
in//let
if
(e00=err)
then (d2p) else
d2pat_sapp_errck(d2p.lctn(),d2f0,s2vs)
end (*let*) // end of [f0_sapp(d2p,err)]
//
(* ****** ****** *)
//
fun
f0_dap0
(d2p: d2pat
,err: &sint >> _): d2pat =
let
//
val e00 = err
//
val-
D2Pdap0(d2p1) = d2p.node()
val
d2p1 = tread12_d2pat(d2p1, err)
in//let
if
(e00=err)
then (d2p) else
d2pat_dap0_errck(d2p.lctn(), d2p1)
end (*let*) // end of [f0_dap0(d2p,err)]
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
D2Pdap1(d2p1) = d2p.node()
val
d2p1 = tread12_d2pat(d2p1, err)
in//let
if
(e00=err)
then (d2p) else
d2pat_dap1_errck(d2p.lctn(), d2p1)
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
d2f0 = tread12_d2pat(d2f0, err)
val
d2ps = tread12_d2patlst(d2ps, err)
in//let
if
(e00=err)
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
tread12_d2patlst(d2ps, err)
//
in//let
if
(e00=err)
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
(knd0
,npf1, d2ps) = d2p.node()
//
val
d2ps =
tread12_d2patlst(d2ps, err)
//
in//let
if
(e00=err)
then (d2p) else
let
val loc = d2p.lctn() in
d2pat_tup1_errck(loc,knd0,npf1,d2ps)
end (*let*) // end-of-[else]
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
(knd0
,npf1, ldps) = d2p.node()
//
val
ldps =
tread12_l2d2plst(ldps, err)
//
in//let
if
(e00=err)
then (d2p) else
let
val loc = d2p.lctn() in
d2pat_rcd2_errck(loc,knd0,npf1,ldps)
end (*let*) // end-of-[else]
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
d2p1 = tread12_d2pat(d2p1, err)
val
s2e2 = tread12_s2exp(s2e2, err)
//
in//let
if
(e00=err)
then (d2p) else
let
val loc = d2p.lctn() in
d2pat_annot_errck(loc,d2p1,s1e2,s2e2)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_annot(d2p,err)]
//
(* ****** ****** *)
//
(*
val (  ) =
prerrln("tread12_d2pat: d2p0 = ", d2p0)
*)
//
} (*where*)//end[tread12_d2pat(d2p0,err)]
//
(* ****** ****** *)
//
#implfun
tread12_l2d2p
  (ld2p, err) =
let
//
val e00 = err
//
val+
D2LAB(lab0, d2p1) = ld2p
//
val
d2p1 = tread12_d2pat(d2p1, err)
//
in//let
if // if
(e00=err)
then (ld2p) else D2LAB(lab0, d2p1)
end (*let*)//end-(tread12_l2d2p(ld2p,err))
//
(* ****** ****** *)
//
#implfun
tread12_d2exp
( d2e0, err ) =
(
case+
d2e0.node() of
//
|D2Evar _ => d2e0
//
|D2Ei00 _ => d2e0
|D2Eb00 _ => d2e0
|D2Ec00 _ => d2e0
|D2Es00 _ => d2e0
//
|D2Eint _ => d2e0
|D2Ebtf _ => d2e0
|D2Echr _ => d2e0
|D2Eflt _ => d2e0
|D2Estr _ => d2e0
//
|D2Econ _ => d2e0
|D2Ecst _ => d2e0
//
|D2Econs _ => d2e0
|D2Ecsts _ => d2e0
//
|D2Esym0 _ => d2e0
//
|D2Esapp _ => f0_sapp(d2e0, err)
|D2Etapp _ => f0_tapp(d2e0, err)
//
|D2Edap0 _ => f0_dap0(d2e0, err)
|D2Edapp _ => f0_dapp(d2e0, err)
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
|D2Efold _ => f0_fold(d2e0, err)
|D2Eeval _ => f0_eval(d2e0, err)
|D2Efree _ => f0_free(d2e0, err)
//
|
D2Ewhere _ => f0_where(d2e0, err)
//
|
D2Eassgn _ => f0_assgn(d2e0, err)
|
D2Ebrckt _ => f0_brckt(d2e0, err)
|
D2Edtsel _ => f0_dtsel(d2e0, err)
//
|D2Eraise _ => f0_raise(d2e0, err)
//
|D2Elazy0 _ => f0_lazy0(d2e0, err)
|D2Elazy1 _ => f0_lazy1(d2e0, err)
//
|D2Eannot _ => f0_annot(d2e0, err)
//
| _(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; d2exp_errck(lvl0,d2e0))
endlet // end of [ _(* otherwise *) ]
//
) where // end-of-[(*case+(d2e0)-of*)]
{
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
d2f0 = tread12_d2exp(d2f0, err)
val
s2es = tread12_s2explst(s2es, err)
in//let
if
(e00=err)
then (d2e) else
d2exp_sapp_errck(d2e.lctn(),d2f0,s2es)
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
d2f0 = tread12_d2exp(d2f0, err)
val
s2es = tread12_s2explst(s2es, err)
in//let
if
(e00=err)
then (d2e) else
d2exp_tapp_errck(d2e.lctn(),d2f0,s2es)
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
d2e1 = tread12_d2exp(d2e1, err)
in//let
if
(e00=err)
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
d2f0 = tread12_d2exp(d2f0, err)
val
d2es = tread12_d2explst(d2es, err)
in//let
if
(e00=err)
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
tread12_d2eclist(dcls, err)
val
d2e1 = tread12_d2exp(d2e1, err)
//
in//let
if
(e00=err)
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
tread12_d2explst(d2es, err)
val
d2e1 = tread12_d2exp(d2e1, err)
//
in//let
if
(e00=err)
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
tread12_d2exp(d2e1, err)
val dthn =
tread12_d2expopt(dthn, err)
val dels =
tread12_d2expopt(dels, err)
//
in//let
if
(e00=err)
then (d2e0) else
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
tread12_d2exp(d2e1, err)
val
d2cs =
tread12_d2clslst(d2cs, err)
//
in//let
if
(e00=err)
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
tread12_d2explst(d2es, err)
//
in//let
if
(e00=err)
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
(knd0
,npf1, d2es) = d2e.node()
//
val
d2es =
tread12_d2explst(d2es, err)
//
in//let
if
(e00=err)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_tup1_errck(loc,knd0,npf1,d2es)
end (*let*) // end-of-[else]
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
(knd0
,npf1, ldes) = d2e.node()
//
val
ldes =
tread12_l2d2elst(ldes, err)
//
in//let
if
(e00=err)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_rcd2_errck(loc,knd0,npf1,ldes)
end (*let*) // end-of-[else]
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
, arrw, d2e1) = d2e.node()
//
val
f2as =
tread12_f2arglst(f2as, err)
val
sres = tread12_s2res(sres, err)
val
d2e1 = tread12_d2exp(d2e1, err)
//
in//let
if
(e00=err)
then (d2e) else
d2exp_lam0_errck
(d2e.lctn(),tknd,f2as,sres,arrw,d2e1)
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
, arrw, d2e1) = d2e.node()
//
val
f2as =
tread12_f2arglst(f2as, err)
val
sres = tread12_s2res(sres, err)
val
d2e1 = tread12_d2exp(d2e1, err)
//
in//let
if
(e00=err)
then (d2e) else
d2exp_fix0_errck
( d2e.lctn()
, tknd, d2v0, f2as, sres, arrw, d2e1)
end (*let*) // end of [f0_lam0(d2e,err)]
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
, d2e1, d2cs) = d2e.node()
//
val
d2e1 =
tread12_d2exp(d2e1, err)
val
d2cs =
tread12_d2clslst(d2cs, err)
//
in//let
if
(e00=err)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_try0_errck(loc,tknd,d2e1,d2cs)
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
D2Eaddr(d2e1) = d2e.node()
val
d2e1 = tread12_d2exp(d2e1, err)
in//let
if
(e00=err)
then (d2e) else
d2exp_addr_errck(d2e.lctn(), d2e1)
end (*let*) // end of [f0_addr(d2e,err)]
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
D2Efold(d2e1) = d2e.node()
val
d2e1 = tread12_d2exp(d2e1, err)
in//let
if
(e00=err)
then (d2e) else
d2exp_fold_errck(d2e.lctn(), d2e1)
end (*let*) // end of [f0_fold(d2e,err)]
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
D2Eeval(d2e1) = d2e.node()
val
d2e1 = tread12_d2exp(d2e1, err)
in//let
if
(e00=err)
then (d2e) else
d2exp_eval_errck(d2e.lctn(), d2e1)
end (*let*) // end of [f0_eval(d2e,err)]
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
D2Efree(d2e1) = d2e.node()
val
d2e1 = tread12_d2exp(d2e1, err)
in//let
if
(e00=err)
then (d2e) else
d2exp_free_errck(d2e.lctn(), d2e1)
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
tread12_d2exp(d2e1, err)
val
dcls =
tread12_d2eclist(dcls, err)
//
in//let
if
(e00=err)
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
d2el = tread12_d2exp(d2el, err)
val
d2er = tread12_d2exp(d2er, err)
//
in//let
if
(e00=err)
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
f0_brckt
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
val-
D2Ebrckt
(dpis, d2es) = d2e.node()
//
val
d2es =
tread12_d2explst(d2es, err)
//
in//let
if
(e00=err)
then (d2e) else
let
val
loc = d2e.lctn()
in//let
d2exp_brckt_errck(loc, dpis, d2es)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_brckt(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_dtsel
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
val-
D2Edtsel
(tknd
,lab1, dpis
,npf1, darg) = d2e.node()
//
val
darg =
tread12_d2explstopt(darg, err)
//
in//let
if
(e00=err)
then (d2e) else
let
val
loc = d2e.lctn()
in//let
d2exp_dtsel_errck
(loc, tknd, lab1, dpis, npf1, darg)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_dtsel(d2e,err)]
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
D2Eraise(d2e1) = d2e.node()
val
d2e1 = tread12_d2exp(d2e1, err)
in//let
if
(e00=err)
then (d2e) else
d2exp_raise_errck(d2e.lctn(), d2e1)
end (*let*) // end of [f0_raise(d2e,err)]
//
(* ****** ****** *)
//
fun
f0_lazy0
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Elazy0(d2e1) = d2e.node()
val
d2e1 = tread12_d2exp(d2e1, err)
in//let
if
(e00=err)
then (d2e) else
d2exp_lazy0_errck(d2e.lctn(), d2e1)
end (*let*) // end of [f0_lazy0(d2e,err)]
//
fun
f0_lazy1
(d2e: d2exp
,err: &sint >> _): d2exp =
let
//
val e00 = err
//
val-
D2Elazy1
(d2e1, d2es) = d2e.node()
val
d2e1 = tread12_d2exp(d2e1, err)
val
d2es = tread12_d2explst(d2es, err)
in//let
if
(e00=err)
then (d2e) else
d2exp_lazy1_errck(d2e.lctn(),d2e1,d2es)
end (*let*) // end of [f0_lazy1(d2e,err)]
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
d2e1 = tread12_d2exp(d2e1, err)
val
s2e2 = tread12_s2exp(s2e2, err)
//
in//let
if
(e00=err)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_annot_errck(loc,d2e1,s1e2,s2e2)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_annot(d2e,err)]
//
(* ****** ****** *)
//
(*
val (  ) =
prerrln("tread12_d2exp: d2e0 = ", d2e0)
*)
//
(* ****** ****** *)
//
} (*where*)//end-[tread12_d2exp(d2e0,err)]
//
(* ****** ****** *)
//
#implfun
tread12_l2d2e
  (ld2e, err) =
let
//
val e00 = err
//
val+
D2LAB(lab0, d2e1) = ld2e
//
val
d2e1 = tread12_d2exp(d2e1, err)
//
in//let
if // if
(e00=err)
then (ld2e) else D2LAB(lab0, d2e1)
end (*let*)//end-(tread12_l2d2e(ld2e,err))
//
(* ****** ****** *)
//
(* ****** ****** *)
//
#implfun
tread12_f2arg
  (farg, err) =
(
case+
farg.node() of
//
(*
| F2ARGnone of (token)
*)
//
|
F2ARGsta0
(s2vs, s2es) =>
let
val e00 = err
val s2es =
tread12_s2explst(s2es, err)
in//let
if
(e00=err)
then (farg) else
f2arg
(farg.lctn(), F2ARGsta0(s2vs, s2es))
endlet // end of [F2ARGsta0(s2vs,s2es)]
//
|
F2ARGdyn0
(npf1, d2ps) =>
let
val e00 = err
val d2ps =
tread12_d2patlst(d2ps, err)
in//let
if
(e00=err)
then (farg) else
f2arg
(farg.lctn(), F2ARGdyn0(npf1, d2ps))
endlet // end of [F2ARGdyn0(npf1,d2ps)]
//
|
F2ARGmet0(s2es) =>
let
//
val e00 = err
//
val s2es =
tread12_s2explst(s2es, err)
in//let
if
(e00=err)
then (farg) else
f2arg( farg.lctn(), F2ARGmet0(s2es) )
endlet // end of [ F2ARGmet0(  s2es  ) ]
//
) (*case+*)//end-[tread12_f2arg(farg,err)]
//
(* ****** ****** *)
//
#implfun
tread12_d2gua
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
d2e1 = tread12_d2exp(d2e1, err)
//
in//let
if
(err = e00)
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
val
d2e1 = tread12_d2exp(d2e1, err)
//
val d2p2 = tread12_d2pat(d2p2, err)
//
in//let
if
(err = e00)
then (dgua) else
d2gua(dgua.lctn(), D2GUAmat(d2e1,d2p2))
endlet // end of [ D2GPTgua(_,_,_) ]
) (*case+*)//end-of-[tread12_d2gua(dgua,err)]
//
(* ****** ****** *)
//
#implfun
tread12_d2gpt
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
d2p1 = tread12_d2pat(d2p1, err)
//
in//let
if
(err = e00)
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
val d2p1 = tread12_d2pat(d2p1, err)
//
val d2gs = tread12_d2gualst(d2gs, err)
//
in//let
if
(err = e00)
then (dgpt) else
d2gpt(dgpt.lctn(), D2GPTgua(d2p1,d2gs))
endlet // end of [ D2GPTgua(_,_,_) ]
) (*case+*)//end-of-[tread12_d2gpt(dgpt,err)]
//
(* ****** ****** *)
//
#implfun
tread12_d2cls
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
tread12_d2gpt(dgpt, err)
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
val dgpt = tread12_d2gpt(dgpt, err)
val d2e1 = tread12_d2exp(d2e1, err)
//
in//let
if
(err=e00)
then (dcls)
else
d2cls(dcls.lctn(), D2CLScls(dgpt,d2e1))
endlet // end-of-[ D2CLScls(_,_,_) ]
) (*case+*)//end-of-[tread12_d2cls(dcls,err)]
//
(* ****** ****** *)
//
#implfun
tread12_d2arg
  (darg, err) =
(
case+
darg.node() of
|
D2ARGsta0
(s2vs, s2es) =>
let
//
val e00 = err
//
val s2es =
tread12_s2explst(s2es, err)
//
in//let
if
(e00=err)
then darg else
d2arg_make_node
(darg.lctn(),D2ARGsta0(s2vs,s2es))
end (*let*) // end of [D2ARGsta0(...)]
|
D2ARGdyn1(s2e1) =>
let
//
val e00 = err
//
val
s2e1 =
tread12_s2exp(s2e1, err)
//
in//let
if
(e00=err)
then darg else
d2arg(darg.lctn(), D2ARGdyn1(s2e1))
end (*let*) // end of [D2ARGdyn1(...)]
|
D2ARGdyn2(npf1, s2es) =>
let
//
val e00 = err
//
val s2es =
tread12_s2explst(s2es, err)
//
in//let
if
(e00=err)
then darg else
d2arg_make_node
(darg.lctn(), D2ARGdyn2(npf1,s2es))
end (*let*) // end of [D2ARGdyn2(...)]
) (*case+*)//end-of-[tread12_d2arg(darg,err)]
//
(* ****** ****** *)
//
#implfun
tread12_s2res
  (sres, err) =
(
case+ sres of
|
S2RESnone() => sres
|
S2RESsome(seff,s2e1) =>
let
//
val e00 = err
//
(*
val seff =
tread12_s2eff(seff, err)
*)
val s2e1 =
tread12_s2exp(s2e1, err)
in
if
(e00=err)
then (sres) else S2RESsome(seff, s2e1)
endlet // end of [S2RESsome(seff,s2e1)]
) (*case+*)//end-of[tread12_s2res(sres,err)]
//
(* ****** ****** *)
//
#implfun
tread12_d2conlst
  (  d2cs, err  ) =
list_tread12_fnp(d2cs, err, tread12_d2con)
#implfun
tread12_d2cstlst
  (  d2cs, err  ) =
list_tread12_fnp(d2cs, err, tread12_d2cst)
//
(* ****** ****** *)
//
#implfun
tread12_d2varlst
  (  d2vs, err  ) =
list_tread12_fnp(d2vs, err, tread12_d2var)
//
(* ****** ****** *)
//
#implfun
tread12_d2patlst
  (  d2ps, err  ) =
list_tread12_fnp(d2ps, err, tread12_d2pat)
//
(* ****** ****** *)
//
#implfun
tread12_d2explst
  (  d2es, err  ) =
list_tread12_fnp(d2es, err, tread12_d2exp)
//
#implfun
tread12_d2expopt
  (  d2es, err  ) =
optn_tread12_fnp(d2es, err, tread12_d2exp)
//
(* ****** ****** *)
//
#implfun
tread12_l2d2plst
  (  ldes, err  ) =
list_tread12_fnp(ldes, err, tread12_l2d2p)
//
#implfun
tread12_l2d2elst
  (  ldes, err  ) =
list_tread12_fnp(ldes, err, tread12_l2d2e)
//
(* ****** ****** *)
//
#implfun
tread12_f2arglst
  (  f2as, err  ) =
list_tread12_fnp(f2as, err, tread12_f2arg)
//
(* ****** ****** *)
//
#implfun
tread12_d2gualst
  (  d2gs, err  ) =
list_tread12_fnp(d2gs, err, tread12_d2gua)
//
(* ****** ****** *)
//
#implfun
tread12_d2clslst
  (  dcls, err  ) =
list_tread12_fnp(dcls, err, tread12_d2cls)
//
(* ****** ****** *)
//
#implfun
tread12_d2arglst
  (  d2as, err  ) =
list_tread12_fnp(d2as, err, tread12_d2arg)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread12_dynexp.dats] *)
