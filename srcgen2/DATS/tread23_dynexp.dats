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
Sun 26 Feb 2023 10:20:07 AM EST
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
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/tread23.sats"
(* ****** ****** *)
//
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload sexp with d2con_get_sexp
#symload sexp with d2cst_get_sexp
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
(* ****** ****** *)
#symload lctn with f3arg_get_lctn
#symload node with f3arg_get_node
(* ****** ****** *)
#symload lctn with d3gua_get_lctn
#symload node with d3gua_get_node
(* ****** ****** *)
#symload lctn with d3gpt_get_lctn
#symload node with d3gpt_get_node
(* ****** ****** *)
#symload lctn with d3cls_get_lctn
#symload node with d3cls_get_node
(* ****** ****** *)
//
(* ****** ****** *)
//
fun
d3pat_errck
(lvl0: sint
,d3p0: d3pat): d3pat =
let
val loc0 = d3p0.lctn()
in//let
d3pat_make_node
(loc0, D3Perrck(lvl0, d3p0))
end (*let*)//end-of(d3pat_errck)
//
(* ****** ****** *)
//
fun
d3exp_errck
(lvl0: sint
,d3e0: d3exp): d3exp =
let
val loc0 = d3e0.lctn()
in//let
d3exp_make_node
(loc0, D3Eerrck(lvl0, d3e0))
end (*let*)//end-of(d3exp_errck)
//
(* ****** ****** *)
//
fun
d3pat_errvl_a1
(d3p0: d3pat): sint =
(
case+ d3p0.node() of
|
D3Perrck
(lvl0, _) => lvl0 | _ => 0
)
#symload
d3pat_errvl with d3pat_errvl_a1
#symload errvl with d3pat_errvl_a1
//
(* ****** ****** *)
//
fun
d3pat_errvl_a2
(d3p1: d3pat
,d3p2: d3pat): sint =
maxs
(errvl(d3p1),errvl(d3p2))
#symload
d3pat_errvl with d3pat_errvl_a2
#symload errvl with d3pat_errvl_a2
//
(* ****** ****** *)
//
#extern
fun
d3pat_errvl_lst
(d3ps: d3patlst): sint
//
#implfun
d3pat_errvl_lst
(  d3ps  ) =
(
case+ d3ps of
|
list_nil((*nil*)) => 0
|
list_cons(d3p1,d3ps) =>
maxs
(
errvl(d3p1),d3pat_errvl_lst(d3ps))
endcas // end of [ case+( d3ps ) ]
)
//
#symload
d3pat_errvl with d3pat_errvl_lst
#symload errvl with d3pat_errvl_lst
//
(* ****** ****** *)
//
#extern
fun
l3d3p_errvl_ldps
(ldps: l3d3plst): sint
//
#implfun
l3d3p_errvl_ldps
(   ldps   ) =
(
case+ ldps of
|
list_nil((*nil*)) => 0
|
list_cons(ldp1,ldps) =>
let
val+
D3LAB(lab, dp1) = ldp1 in
maxs
( errvl(dp1)
, l3d3p_errvl_ldps(ldps)) end
endcas // end of [ case+(ldps) ]
)
//
#symload errvl with l3d3p_errvl_ldps
//
(* ****** ****** *)
//
fun
d3exp_errvl_a1
(d3e0: d3exp): sint =
(
case+ d3e0.node() of
|
D3Eerrck
(lvl0, _) => lvl0 | _ => 0
)
#symload
d3exp_errvl with d3exp_errvl_a1
#symload errvl with d3exp_errvl_a1
//
(* ****** ****** *)
//
fun
d3exp_errvl_a2
(d3e1: d3exp
,d3e2: d3exp): sint =
maxs
(errvl(d3e1),errvl(d3e2))
#symload
d3exp_errvl with d3exp_errvl_a2
#symload errvl with d3exp_errvl_a2
//
(* ****** ****** *)
//
#extern
fun
d3exp_errvl_lst
(d3es: d3explst): sint
//
#implfun
d3exp_errvl_lst
(  d3es  ) =
(
case+ d3es of
|
list_nil((*nil*)) => 0
|
list_cons(d3e1,d3es) =>
maxs
(
errvl(d3e1),d3exp_errvl_lst(d3es))
endcas // end of [ case+( d3es ) ]
)
//
#symload
d3exp_errvl with d3exp_errvl_lst
#symload errvl with d3exp_errvl_lst
//
(* ****** ****** *)
//
#extern
fun
d3exp_errvl_opt
(dopt: d3expopt): sint
//
#implfun
d3exp_errvl_opt
(  dopt  ) =
(
case+ dopt of
| optn_nil() => 0
| optn_cons(d3e1) => errvl(d3e1)
endcas // end of [ case+( d3es ) ]
)
//
#symload
d3exp_errvl with d3exp_errvl_opt
#symload errvl with d3exp_errvl_opt
//
(* ****** ****** *)
//
#extern
fun
l3d3e_errvl_ldes
(ldes: l3d3elst): sint
//
#implfun
l3d3e_errvl_ldes
(   ldes   ) =
(
case+ ldes of
|
list_nil((*nil*)) => 0
|
list_cons(lde1,ldes) =>
let
val+
D3LAB(lab, de1) = lde1 in
maxs
( errvl(de1)
, l3d3e_errvl_ldes(ldes)) end
endcas // end of [ case+(ldes) ]
)
//
#symload errvl with l3d3e_errvl_ldes
//
(* ****** ****** *)
//
fun
d3cls_errvl_a1
(dcl: d3cls): sint =
(
case+ dcl.node() of
|
D3CLSgpt(dgpt) => 0
|
D3CLScls(dgpt,d3e1) => errvl(d3e1)
)
#symload errvl with d3cls_errvl_a1
//
(* ****** ****** *)
//
#extern
fun
d3cls_errvl_lst
(dcls: d3clslst): sint
#symload errvl with d3cls_errvl_lst
//
#implfun
d3cls_errvl_lst(dcls) =
(
case+ dcls of
|
list_nil((*nil*)) => 0
|
list_cons(dcl1,dcls) => maxs
(errvl(dcl1), d3cls_errvl_lst(dcls))
) (*case+*)//end-of-(d3cls_errvl_lst)
//
(* ****** ****** *)
//
(*
HX-2022-11-23:
A placeholder for the moment
but it may actually just be okay!
*)
fun
d3ecl_errvl_lst
(dcs: d3eclist): sint = 0
#symload errvl with d3ecl_errvl_lst
//
(* ****** ****** *)
(*
HX-2023-02-27:
Various 'errck' functions for
constructing d3pat/d3exp-values
*)
(* ****** ****** *)
(*
Various
errck-functions for d3pat-values
*)
(* ****** ****** *)
//
fun
d3pat_bang_errck
(loc0: loc_t
,d3p1: d3pat): d3pat =
let
val lvl0 = errvl(d3p1) in//let
d3pat_errck
(lvl0+1,d3pat(loc0, D3Pbang(d3p1)))
endlet // end of [d3pat_bang_errck(...)]
//
fun
d3pat_flat_errck
(loc0: loc_t
,d3p1: d3pat): d3pat =
let
val lvl0 = errvl(d3p1) in//let
d3pat_errck
(lvl0+1,d3pat(loc0, D3Pflat(d3p1)))
endlet // end of [d3pat_flat_errck(...)]
//
fun
d3pat_free_errck
(loc0: loc_t
,d3p1: d3pat): d3pat =
let
val lvl0 = errvl(d3p1) in//let
d3pat_errck
(lvl0+1,d3pat(loc0, D3Pfree(d3p1)))
endlet // end of [d3pat_free_errck(...)]
//
(* ****** ****** *)
//
fun
d3pat_sapp_errck
(loc0: loc_t
,d3f0: d3pat
,s2vs: s2varlst): d3pat =
let
val lvl0 = errvl(d3f0) in//let
d3pat_errck
(lvl0+1
,d3pat(loc0, D3Psapp( d3f0 , s2vs )))
endlet // end of [d3pat_sapp_errck(...)]
//
(* ****** ****** *)
//
fun
d3pat_tapq_errck
(loc0: loc_t
,d3f0: d3pat
,tjas: t2jaglst): d3pat =
let
val lvl0 = errvl(d3f0) in//let
d3pat_errck
(lvl0+1
,d3pat(loc0, D3Ptapq( d3f0 , tjas )))
endlet // end of [d3pat_tapq_errck(...)]
//
(* ****** ****** *)
//
fun
d3pat_dap1_errck
(loc0: loc_t
,d3f0: d3pat): d3pat =
let
val lvl0 = errvl(d3f0) in//let
d3pat_errck
(lvl0+1, d3pat(loc0, D3Pdap1( d3f0 )))
endlet // end of [d3pat_dap1_errck(...)]
//
(* ****** ****** *)
//
fun
d3pat_dapp_errck
(loc0: loc_t
,d3f0: d3pat
,npf1: (sint)
,d3ps: d3patlst): d3pat =
let
val lvl0 = maxs
(errvl(d3f0), errvl(d3ps)) in//let
d3pat_errck
(lvl0+1
,d3pat(loc0, D3Pdapp(d3f0,npf1,d3ps)))
endlet // end of [d3pat_dapp_errck(...)]
//
(* ****** ****** *)
//
fun
d3pat_tup0_errck
( loc0: loc_t
, npf1: (sint)
, d3ps: d3patlst): d3pat =
let
val lvl0 = errvl(d3ps) in//let
d3pat_errck
( lvl0+1
, d3pat( loc0, D3Ptup0( npf1, d3ps )))
endlet // end of [d3pat_tup0_errck(...)]
//
(* ****** ****** *)
//
fun
d3pat_tup1_errck
( loc0: loc_t
, tknd: token
, npf1: (sint)
, d3ps: d3patlst): d3pat =
let
val lvl0 = errvl(d3ps) in//let
d3pat_errck
( lvl0+1
, d3pat(loc0,D3Ptup1(tknd,npf1,d3ps)))
endlet // end of [d3pat_tup1_errck(...)]
//
(* ****** ****** *)
//
fun
d3pat_rcd2_errck
( loc0: loc_t
, tknd: token
, npf1: (sint)
, ldps: l3d3plst): d3pat =
let
val lvl0 = errvl(ldps) in//let
d3pat_errck
( lvl0+1
, d3pat(loc0,D3Prcd2(tknd,npf1,ldps)))
endlet // end of [d3pat_rcd2_errck(...)]
//
(* ****** ****** *)
//
fun
d3pat_annot_errck
( loc0: loc_t
, d3p1: d3pat
, s1e2: s1exp
, s2e2
: s2exp(*annot*)): d3pat =
let
val lvl0 = errvl(d3p1) in//let
d3pat_errck
( lvl0+1
, d3pat(loc0,D3Pannot(d3p1,s1e2,s2e2)))
endlet // end of [d3pat_annot_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
Various
errck-functions for d3exp-values
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_sapp_errck
(loc0: loc_t
,d3f0: d3exp
,s2es: s2explst): d3exp =
let
val lvl0 = errvl(d3f0) in//let
d3exp_errck
(lvl0+1
,d3exp(loc0, D3Esapp( d3f0 , s2es )))
endlet // end of [d3exp_sapp_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_sapq_errck
(loc0: loc_t
,d3f0: d3exp
,t2ps: s2typlst): d3exp =
let
val lvl0 = errvl(d3f0) in//let
d3exp_errck
(lvl0+1
,d3exp(loc0, D3Esapq( d3f0 , t2ps )))
endlet // end of [d3exp_sapq_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_tapp_errck
(loc0: loc_t
,d3f0: d3exp
,s2es: s2explst): d3exp =
let
val lvl0 = errvl(d3f0) in//let
d3exp_errck
(lvl0+1
,d3exp(loc0, D3Etapp( d3f0 , s2es )))
endlet // end of [d3exp_tapp_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_tapq_errck
(loc0: loc_t
,d3f0: d3exp
,tjas: t2jaglst): d3exp =
let
val lvl0 = errvl(d3f0) in//let
d3exp_errck
(lvl0+1
,d3exp(loc0, D3Etapq( d3f0 , tjas )))
endlet // end of [d3exp_tapq_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_dap0_errck
(loc0: loc_t
,d3f0: d3exp): d3exp =
let
val lvl0 = errvl(d3f0) in//let
d3exp_errck
(lvl0+1, d3exp(loc0, D3Edap0( d3f0 )))
endlet // end of [d3exp_dap0_errck(...)]
//
fun
d3exp_dapp_errck
(loc0: loc_t
,d3f0: d3exp
,npf1: (sint)
,d3es: d3explst): d3exp =
let
val lvl0 = maxs
(errvl(d3f0), errvl(d3es)) in//let
d3exp_errck
(lvl0+1
,d3exp(loc0, D3Edapp(d3f0,npf1,d3es)))
endlet // end of [d3exp_dapp_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_pcon_errck
( loc0: loc_t
, tknd: token
, dlab: label
, dcon: d3exp): d3exp =
let
val lvl0 = errvl(dcon) in//let
d3exp_errck
(lvl0+1
,d3exp(loc0, D3Epcon(tknd,dlab,dcon)))
endlet // end of [d3exp_pcon_errck(...)]
//
fun
d3exp_proj_errck
( loc0: loc_t
, tknd: token
, dlab: label
, dtup: d3exp): d3exp =
let
val lvl0 = errvl(dtup) in//let
d3exp_errck
(lvl0+1
,d3exp(loc0, D3Eproj(tknd,dlab,dtup)))
endlet // end of [d3exp_proj_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_let0_errck
( loc0: loc_t
, dcls: d3eclist
, d3e1
: d3exp(*scope*)): d3exp =
let
val lvl0 = maxs
(errvl(dcls), errvl(d3e1)) in//let
d3exp_errck
(lvl0+1,d3exp(loc0,D3Elet0(dcls,d3e1)))
endlet // end of [d3exp_let0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_ift0_errck
( loc0: loc_t
, d3e1: d3exp
, opt1: d3expopt
, opt2: d3expopt): d3exp =
let
val lvl0 =
maxs
(errvl(d3e1)
,errvl(opt1), errvl(opt2)) in//let
d3exp_errck
( lvl0+1
, d3exp(loc0,D3Eift0(d3e1,opt1,opt2)))
endlet // end of [d3exp_ift0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_cas0_errck
(loc0: loc_t
,tknd: token
,d3e1: d3exp
,d3cs: d3clslst): d3exp =
let
val lvl = maxs
(errvl(d3e1), errvl(d3cs))
in//let
d3exp_errck
( lvl+1
, d3exp(loc0,D3Ecas0(tknd,d3e1,d3cs)))
endlet // end of [d3exp_cas0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_seqn_errck
( loc0: loc_t
, d3es: d3explst
, d3e1
: d3exp(* last *)): d3exp =
let
val lvl0 = maxs
(errvl(d3es), errvl(d3e1)) in//let
d3exp_errck
( lvl0+1
, d3exp( loc0, D3Eseqn( d3es, d3e1 )))
endlet // end of [d3exp_seqn_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_tup0_errck
( loc0: loc_t
, npf1: (sint)
, d3es: d3explst): d3exp =
let
val lvl0 = errvl(d3es) in//let
d3exp_errck
( lvl0+1
, d3exp( loc0, D3Etup0( npf1, d3es )))
endlet // end of [d3exp_tup0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_tup1_errck
( loc0: loc_t
, tknd: token
, npf1: (sint)
, d3es: d3explst): d3exp =
let
val lvl0 = errvl(d3es) in//let
d3exp_errck
( lvl0+1
, d3exp(loc0,D3Etup1(tknd,npf1,d3es)))
endlet // end of [d3exp_tup1_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_rcd2_errck
( loc0: loc_t
, tknd: token
, npf1: (sint)
, ldes: l3d3elst): d3exp =
let
val lvl0 = errvl(ldes) in//let
d3exp_errck
( lvl0+1
, d3exp(loc0,D3Ercd2(tknd,npf1,ldes)))
endlet // end of [d3exp_rcd2_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_lam0_errck
( loc0: loc_t
, tknd: token
, f3as: f3arglst
, sres: s2res
, arrw: f1unarrw
, dexp
: d3exp(*body*)): d3exp =
let
val lvl = d3exp_errvl(dexp)
in//let
d3exp_errck
( lvl+1
, d3exp_make_node
  (loc0
  ,D3Elam0(tknd,f3as,sres,arrw,dexp)))
endlet // end of [d3exp_lam0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_fix0_errck
( loc0: loc_t
, tknd: token
, d2v0: d2var
, f3as: f3arglst
, sres: s2res
, arrw: f1unarrw
, dexp
: d3exp(*body*)): d3exp =
let
val lvl = d3exp_errvl(dexp)
in//let
d3exp_errck
(
lvl+1,
d3exp_make_node
(
loc0,
D3Efix0
(tknd, d2v0, f3as, sres, arrw, dexp)))
endlet // end of [d3exp_fix0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_try0_errck
( loc0: loc_t
, tknd: token
, d3e1: d3exp
, dcls: d3clslst): d3exp =
let
val lvl = maxs
(errvl(d3e1), errvl(dcls))
in//let
d3exp_errck
(lvl+1,
d3exp(loc0, D3Etry0(tknd, d3e1, dcls)))
endlet // end of [d3exp_try0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_addr_errck
( loc0: loc_t
, d3e1: d3exp): d3exp =
let
val lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1, d3exp(loc0, D3Eaddr(d3e1)) )
endlet // end of [d3exp_addr_errck(...)]
//
fun
d3exp_view_errck
( loc0: loc_t
, d3e1: d3exp): d3exp =
let
val lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1, d3exp(loc0, D3Eview(d3e1)) )
endlet // end of [d3exp_view_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_flat_errck
( loc0: loc_t
, d3e1: d3exp): d3exp =
let
val lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1, d3exp(loc0, D3Eflat(d3e1)) )
endlet // end of [d3exp_flat_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_eval_errck
( loc0: loc_t
, d3e1: d3exp): d3exp =
let
val lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1, d3exp(loc0, D3Eeval(d3e1)) )
endlet // end of [d3exp_eval_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_fold_errck
( loc0: loc_t
, d3e1: d3exp): d3exp =
let
val lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1, d3exp(loc0, D3Efold(d3e1)) )
endlet // end of [d3exp_fold_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_free_errck
( loc0: loc_t
, d3e1: d3exp): d3exp =
let
val lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1, d3exp(loc0, D3Efree(d3e1)) )
endlet // end of [d3exp_free_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_dp2tr_errck
( loc0: loc_t
, d3e1: d3exp): d3exp =
let
val lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1, d3exp(loc0, D3Edp2tr(d3e1)) )
endlet // end of [d3exp_dp2tr_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_dl0az_errck
( loc0: loc_t
, d3e1: d3exp): d3exp =
let
val lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1, d3exp(loc0, D3Edl0az(d3e1)) )
endlet // end of [d3exp_dl0az_errck(...)]
//
fun
d3exp_dl1az_errck
( loc0: loc_t
, d3e1: d3exp): d3exp =
let
val lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1, d3exp(loc0, D3Edl1az(d3e1)) )
endlet // end of [d3exp_dl1az_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_where_errck
( loc0: loc_t
, d3e1: d3exp
, dcls: d3eclist): d3exp =
let
val lvl0 = maxs
(errvl(d3e1), errvl(dcls)) in//let
d3exp_errck
( lvl0+1
, d3exp( loc0, D3Ewhere( d3e1, dcls ) ))
endlet // end of [d3exp_where_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_assgn_errck
( loc0: loc_t
, d3el: d3exp
, d3er: d3exp): d3exp =
let
val lvl0 = maxs
(errvl(d3el), errvl(d3er)) in//let
d3exp_errck
( lvl0+1
, d3exp( loc0, D3Eassgn( d3el, d3er ) ))
endlet // end of [d3exp_assgn_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_raise_errck
( loc0: loc_t
, tknd: token
, d3e1: d3exp): d3exp =
let
val lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1
, d3exp( loc0, D3Eraise( tknd, d3e1 ) ))
endlet // end of [d3exp_raise_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_l0azy_errck
( loc0: loc_t
, dsym: d1exp
, d3e1: d3exp): d3exp =
let
val lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1
, d3exp( loc0, D3El0azy( dsym, d3e1 ) ))
endlet // end of [d3exp_l0azy_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_l1azy_errck
( loc0: loc_t
, dsym: d1exp
, d3e1: d3exp
, d3es: d3explst): d3exp =
let
val lvl0 = maxs
(errvl(d3e1), errvl(d3es)) in//let
d3exp_errck
( lvl0+1
, d3exp(loc0,D3El1azy(dsym,d3e1,d3es)))
endlet // end of [d3exp_l1azy_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_labck_errck
( loc0: loc_t
, d3e1: d3exp
, lab2: label): d3exp =
let
val lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1
, d3exp( loc0, D3Elabck( d3e1, lab2 ) ))
endlet // end of [d3exp_labck_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_t2pck_errck
( loc0: loc_t
, d3e1: d3exp
, t2p2: s2typ): d3exp =
let
val lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1
, d3exp( loc0, D3Et2pck( d3e1, t2p2 ) ))
endlet // end of [d3exp_t2pck_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_annot_errck
( loc0: loc_t
, d3e1: d3exp
, s1e2: s1exp
, s2e2
: s2exp(*annot*)): d3exp =
let
val lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1
, d3exp(loc0,D3Eannot(d3e1,s1e2,s2e2)))
endlet // end of [d3exp_annot_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tread23_d3pat
( d3p0, err ) =
(
case+
d3p0.node() of
//
|D3Pvar _ => d3p0
//
|D3Pint _ => d3p0
|D3Pbtf _ => d3p0
|D3Pchr _ => d3p0
|D3Pflt _ => d3p0
|D3Pstr _ => d3p0
//
|D3Pany _ => d3p0
//
|D3Pcon _ => d3p0
//
|D3Pbang _ => f0_bang(d3p0, err)
|D3Pflat _ => f0_flat(d3p0, err)
|D3Pfree _ => f0_free(d3p0, err)
//
|D3Psapp _ => f0_sapp(d3p0, err)
(*
|D3Psapq _ => f0_sapq(d3p0, err)
*)
//
|D3Ptapq _ => f0_tapq(d3p0, err)
//
|D3Pdap1 _ => f0_dap1(d3p0, err)
|D3Pdapp _ => f0_dapp(d3p0, err)
//
|D3Ptup0 _ => f0_tup0(d3p0, err)
|D3Ptup1 _ => f0_tup1(d3p0, err)
|D3Prcd2 _ => f0_rcd2(d3p0, err)
//
|D3Pannot _ => f0_annot(d3p0, err)
//
| _(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; d3pat_errck(lvl0,d3p0))
endlet // end of [ _(* otherwise *) ]
//
) where // end-of-[(*case+(d3p0)-of*)]
{
//
(* ****** ****** *)
//
fun
f0_bang
(d3p: d3pat
,err: &sint >> _): d3pat =
let
//
val e00 = err
//
val-
D3Pbang(d3p1) = d3p.node()
val
d3p1 = tread23_d3pat(d3p1, err)
in//let
if
(err=e00)
then (d3p) else
d3pat_bang_errck(d3p.lctn(), d3p1)
end (*let*) // end of [f0_bang(d3p,err)]
//
fun
f0_flat
(d3p: d3pat
,err: &sint >> _): d3pat =
let
//
val e00 = err
//
val-
D3Pflat(d3p1) = d3p.node()
val
d3p1 = tread23_d3pat(d3p1, err)
in//let
if
(err=e00)
then (d3p) else
d3pat_flat_errck(d3p.lctn(), d3p1)
end (*let*) // end of [f0_flat(d3p,err)]
//
fun
f0_free
(d3p: d3pat
,err: &sint >> _): d3pat =
let
//
val e00 = err
//
val-
D3Pfree(d3p1) = d3p.node()
val
d3p1 = tread23_d3pat(d3p1, err)
in//let
if
(err=e00)
then (d3p) else
d3pat_free_errck(d3p.lctn(), d3p1)
end (*let*) // end of [f0_free(d3p,err)]
//
(* ****** ****** *)
//
fun
f0_sapp
(d3p: d3pat
,err: &sint >> _): d3pat =
let
//
val e00 = err
//
val-
D3Psapp
(d3f0, s2vs) = d3p.node()
val
d3f0 = tread23_d3pat(d3f0, err)
in//let
if
(err=e00)
then (d3p) else
d3pat_sapp_errck(d3p.lctn(),d3f0,s2vs)
end (*let*) // end of [f0_sapp(d3p,err)]
//
(* ****** ****** *)
//
fun
f0_tapq
(d3p: d3pat
,err: &sint >> _): d3pat =
let
//
val e00 = err
//
val-
D3Ptapq
(d3f0, tjas) = d3p.node()
val
d3f0 = tread23_d3pat(d3f0, err)
in//let
if
(err=e00)
then (d3p) else
let
val loc = d3p.lctn() in
d3pat_tapq_errck(loc, d3f0, tjas)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_tapq(d3p,err)]
//
(* ****** ****** *)
//
fun
f0_dap1
(d3p: d3pat
,err: &sint >> _): d3pat =
let
//
val e00 = err
//
val-
D3Pdap1(d3f0) = d3p.node()
//
val
d3f0 = tread23_d3pat(d3f0, err)
//
val () =
(
case+
d3f0.node() of
|D3Pcon _ => ( (*void*) )
|D3Ptapq _ => ( (*void*) )
|_(*non-D3Pcon*) => err := err+1)
//
in//let
if
(err=e00)
then (d3p) else
d3pat_dap1_errck(d3p.lctn(), d3f0)
end (*let*) // end of [f0_dap1(d3p,err)]
//
(* ****** ****** *)
//
fun
f0_dapp
(d3p: d3pat
,err: &sint >> _): d3pat =
let
//
val e00 = err
//
val-
D3Pdapp
(d3f0
,npf1, d3ps) = d3p.node()
val
d3f0 = tread23_d3pat(d3f0, err)
val
d3ps = tread23_d3patlst(d3ps, err)
in//let
if
(err=e00)
then (d3p) else
let
val loc = d3p.lctn() in
d3pat_dapp_errck(loc,d3f0,npf1,d3ps)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_dapp(d3p,err)]
//
(* ****** ****** *)
//
fun
f0_tup0
(d3p: d3pat
,err: &sint >> _): d3pat =
let
//
val e00 = err
//
val-
D3Ptup0
(npf1, d3ps) = d3p.node()
//
val
d3ps =
tread23_d3patlst(d3ps, err)
//
in//let
if
(err=e00)
then (d3p) else
let
val loc = d3p.lctn() in
d3pat_tup0_errck(loc, npf1, d3ps)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_tup0(d3p,err)]
//
(* ****** ****** *)
//
fun
f0_tup1
(d3p: d3pat
,err: &sint >> _): d3pat =
let
//
val e00 = err
//
val-
D3Ptup1
( tknd
, npf1, d3ps) = d3p.node()
//
val
d3ps =
tread23_d3patlst(d3ps, err)
//
in//let
if
(err=e00)
then (d3p) else
let
val loc = d3p.lctn() in//let
d3pat_tup1_errck(loc,tknd,npf1,d3ps)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_tup1(d3p,err)]
//
(* ****** ****** *)
//
fun
f0_rcd2
(d3p: d3pat
,err: &sint >> _): d3pat =
let
//
val e00 = err
//
val-
D3Prcd2
( tknd
, npf1, ldps) = d3p.node()
//
val
ldps =
tread23_l3d3plst(ldps, err)
//
in//let
if
(err=e00)
then (d3p) else
let
val loc = d3p.lctn() in//let
d3pat_rcd2_errck(loc,tknd,npf1,ldps)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_rcd2(d3p,err)]
//
(* ****** ****** *)
//
fun
f0_annot
(d3p: d3pat
,err: &sint >> _): d3pat =
let
//
val e00 = err
//
val-
D3Pannot
(d3p1
,s1e2, s2e2) = d3p.node()
//
val
d3p1 = tread23_d3pat(d3p1, err)
(*
val
s2e2 = tread23_s2exp(s2e2, err)
*)
//
in//let
if
(err=e00)
then (d3p) else
let
val loc = d3p.lctn() in
d3pat_annot_errck(loc,d3p1,s1e2,s2e2)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_annot(d3p,err)]
//
(* ****** ****** *)
(*
  val () =
  prerrsln("tread23_d3pat: d3p0 = ", d3p0)
*)
(* ****** ****** *)
//
} (*where*)//end-[tread23_d3pat(d3p0,err)]
//
(* ****** ****** *)
//
#implfun
tread23_l3d3p
  (ld3p, err) =
let
//
val e00 = err
//
val+
D3LAB(lab0, d3p1) = ld3p
//
val
d3p1 = tread23_d3pat(d3p1, err)
//
in//let
if // if
(err=e00)
then (ld3p) else D3LAB(lab0, d3p1)
end (*let*)//end-(tread23_l3d3p(ld3p,err))
//
(* ****** ****** *)
//
#implfun
tread23_d3exp
( d3e0, err ) =
(
case+
d3e0.node() of
//
|D3Evar _ => d3e0
//
|D3Eint _ => d3e0
|D3Ebtf _ => d3e0
|D3Echr _ => d3e0
|D3Eflt _ => d3e0
|D3Estr _ => d3e0
//
|D3Ei00 _ => d3e0
|D3Eb00 _ => d3e0
|D3Ec00 _ => d3e0
|D3Ef00 _ => d3e0
|D3Es00 _ => d3e0
//
|D3Etop _ => d3e0
//
|D3Econ _ => d3e0
|D3Ecst _ => d3e0
//
|D3Esapp _ => f0_sapp(d3e0, err)
|D3Esapq _ => f0_sapq(d3e0, err)
//
|D3Etapp _ => f0_tapp(d3e0, err)
|D3Etapq _ => f0_tapq(d3e0, err)
//
|D3Edap0 _ => f0_dap0(d3e0, err)
|D3Edapp _ => f0_dapp(d3e0, err)
//
|D3Epcon _ => f0_pcon(d3e0, err)
|D3Eproj _ => f0_proj(d3e0, err)
//
|D3Elet0 _ => f0_let0(d3e0, err)
//
|D3Eift0 _ => f0_ift0(d3e0, err)
|D3Ecas0 _ => f0_cas0(d3e0, err)
//
|D3Eseqn _ => f0_seqn(d3e0, err)
//
|D3Etup0 _ => f0_tup0(d3e0, err)
|D3Etup1 _ => f0_tup1(d3e0, err)
|D3Ercd2 _ => f0_rcd2(d3e0, err)
//
|D3Elam0 _ => f0_lam0(d3e0, err)
|D3Efix0 _ => f0_fix0(d3e0, err)
//
|D3Etry0 _ => f0_try0(d3e0, err)
//
|D3Eaddr _ => f0_addr(d3e0, err)
|D3Eview _ => f0_view(d3e0, err)
|D3Eflat _ => f0_flat(d3e0, err)
//
|D3Eeval _ => f0_eval(d3e0, err)
//
|D3Efold _ => f0_fold(d3e0, err)
|D3Efree _ => f0_free(d3e0, err)
//
(* ****** ****** *)
//
|D3Edp2tr _ => f0_dp2tr(d3e0, err)
//
|D3Edl0az _ => f0_dl0az(d3e0, err)
|D3Edl1az _ => f0_dl1az(d3e0, err)
//
(* ****** ****** *)
//
|D3Ewhere _ => f0_where(d3e0, err)
//
|D3Eassgn _ => f0_assgn(d3e0, err)
//
|D3Eraise _ => f0_raise(d3e0, err)
//
|D3El0azy _ => f0_l0azy(d3e0, err)
|D3El1azy _ => f0_l1azy(d3e0, err)
//
|D3Elabck _ => f0_labck(d3e0, err)
|D3Et2pck _ => f0_t2pck(d3e0, err)
//
|D3Eannot _ => f0_annot(d3e0, err)
//
(* ****** ****** *)
|D3Enone0 _ => f0_none0(d3e0, err)
|D3Enone1 _ => f0_none1(d3e0, err)
|D3Enone2 _ => f0_none2(d3e0, err)
(* ****** ****** *)
(* ****** ****** *)
//
|
D3Eextnam _ => f0_extnam(d3e0, err)
|
D3Esynext _ => f0_synext(d3e0, err)
//
(* ****** ****** *)
(* ****** ****** *)
|
_(*otherwise*) =>
let
val lvl0 = 1 in//let
(
err := err+1; d3exp_errck(lvl0,d3e0))
endlet // end of [ _(* otherwise *) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
) where // end-of-[(*case+(d3e0)-of*)]
{
//
(* ****** ****** *)
//
fun
f0_sapp
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Esapp
(d3f0, s2es) = d3e.node()
val
d3f0 = tread23_d3exp(d3f0, err)
in//let
if
(err=e00)
then (d3e) else
d3exp_sapp_errck(d3e.lctn(),d3f0,s2es)
end (*let*) // end of [f0_sapp(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_sapq
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Esapq
(d3f0, t2ps) = d3e.node()
val
d3f0 = tread23_d3exp(d3f0, err)
in//let
if
(err=e00)
then (d3e) else
d3exp_sapq_errck(d3e.lctn(),d3f0,t2ps)
end (*let*) // end of [f0_sapq(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_tapp
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Etapp
(d3f0, s2es) = d3e.node()
val
d3f0 = tread23_d3exp(d3f0, err)
in//let
if
(err=e00)
then (d3e) else
d3exp_tapp_errck(d3e.lctn(),d3f0,s2es)
end (*let*) // end of [f0_tapp(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_tapq
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Etapq
(d3f0, tjas) = d3e.node()
val
d3f0 = tread23_d3exp(d3f0, err)
in//let
if
(err=e00)
then (d3e) else
d3exp_tapq_errck(d3e.lctn(),d3f0,tjas)
end (*let*) // end of [f0_tapq(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_dap0
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Edap0(d3f0) = d3e.node()
val
d3f0 = tread23_d3exp(d3f0, err)
in//let
if
(err=e00)
then (d3e) else
d3exp_dap0_errck( d3e.lctn(), d3f0 )
end (*let*) // end of [f0_dap0(d3e,err)]
//
fun
f0_dapp
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Edapp
(d3f0
,npf1, d3es) = d3e.node()
val
d3f0 = tread23_d3exp(d3f0, err)
val
d3es = tread23_d3explst(d3es, err)
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_dapp_errck( loc,d3f0,npf1,d3es )
end (*let*) // end-of-[else]
end (*let*) // end of [f0_dapp(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_pcon
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Epcon
(tknd
,dlab, dtup) = d3e.node()
val
dtup = tread23_d3exp(dtup, err)
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_pcon_errck( loc,tknd,dlab,dtup )
end (*let*) // end-of-[else]
end (*let*) // end of [f0_pcon(d3e,err)]
//
fun
f0_proj
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Eproj
(tknd
,dlab, dtup) = d3e.node()
val
dtup = tread23_d3exp(dtup, err)
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_proj_errck( loc,tknd,dlab,dtup )
end (*let*) // end-of-[else]
end (*let*) // end of [f0_proj(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_let0
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Elet0
(dcls, d3e1) = d3e.node()
//
val
dcls =
tread23_d3eclist(dcls, err)
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_let0_errck(loc, dcls, d3e1)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_let0(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_ift0
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Eift0
( d3e1
, dthn, dels) = d3e.node()
//
val d3e1 =
tread23_d3exp(d3e1, err)
val dthn =
tread23_d3expopt(dthn, err)
val dels =
tread23_d3expopt(dels, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in//let
d3exp_ift0_errck(loc,d3e1,dthn,dels)
end
end (*let*) // end of [f0_ift0(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_cas0
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Ecas0
( tknd
, d3e1, d3cs) = d3e.node()
//
val
d3e1 =
tread23_d3exp(d3e1, err)
val
d3cs =
tread23_d3clslst(d3cs, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_cas0_errck(loc,tknd,d3e1,d3cs)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_cas0(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_seqn
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Eseqn
(d3es, d3e1) = d3e.node()
//
val
d3es =
tread23_d3explst(d3es, err)
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_seqn_errck(loc, d3es, d3e1)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_seqn(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_tup0
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Etup0
(npf1, d3es) = d3e.node()
//
val
d3es =
tread23_d3explst(d3es, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in//let
d3exp_tup0_errck( loc, npf1, d3es )
end (*let*) // end-of-[else]
end (*let*) // end of [f0_tup0(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_tup1
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Etup1
( tknd
, npf1, d3es) = d3e.node()
//
val
d3es =
tread23_d3explst(d3es, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in//let
d3exp_tup1_errck(loc,tknd,npf1,d3es)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_tup1(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_rcd2
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Ercd2
( tknd
, npf1, ldes) = d3e.node()
//
val
ldes =
tread23_l3d3elst(ldes, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in//let
d3exp_rcd2_errck(loc,tknd,npf1,ldes)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_rcd2(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_lam0
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Elam0
( tknd
, f3as, sres
, arrw, dexp) = d3e0.node()
//
val f3as =
  tread23_f3arglst(f3as, err)
(*
val sres = tread23_s2res(sres, err)
*)
val dexp = tread23_d3exp(dexp, err)
//
in//let
if
(err=e00)
then (d3e) else
d3exp_lam0_errck
(d3e.lctn(),tknd,f3as,sres,arrw,dexp)
end (*let*) // end of [f0_lam0(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_fix0
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Efix0
( tknd
, d2v0
, f3as, sres
, arrw, dexp) = d3e0.node()
//
val f3as =
  tread23_f3arglst(f3as, err)
(*
val sres = tread23_s2res(sres, err)
*)
val dexp = tread23_d3exp(dexp, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_fix0_errck
(loc, tknd,d2v0,f3as,sres,arrw,dexp)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_fix0(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_try0
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Etry0
( tknd
, d3e1, dcls) = d3e.node()
//
val d3e1 =
  tread23_d3exp(d3e1, err)
val dcls =
  tread23_d3clslst(dcls, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_try0_errck(loc, tknd,d3e1,dcls)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_try0(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_addr
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Eaddr
(   d3e1   ) = d3e.node()
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
d3exp_addr_errck(d3e.lctn(), d3e1)
end (*let*) // end of [f0_addr(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_view
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Eview
(   d3e1   ) = d3e.node()
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
d3exp_view_errck(d3e.lctn(), d3e1)
end (*let*) // end of [f0_view(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_flat
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Eflat
(   d3e1   ) = d3e.node()
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
d3exp_flat_errck(d3e.lctn(), d3e1)
end (*let*) // end of [f0_flat(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_fold
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Efold
(   d3e1   ) = d3e.node()
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
d3exp_fold_errck(d3e.lctn(), d3e1)
end (*let*) // end of [f0_fold(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_free
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Efree
(   d3e1   ) = d3e.node()
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
d3exp_free_errck(d3e.lctn(), d3e1)
end (*let*) // end of [f0_free(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_eval
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Eeval
(   d3e1   ) = d3e.node()
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
d3exp_eval_errck(d3e.lctn(), d3e1)
end (*let*) // end of [f0_eval(d3e,err)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dp2tr
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Edp2tr
(   d3e1   ) = d3e.node()
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
d3exp_dp2tr_errck(d3e.lctn(), d3e1)
end (*let*) // end of [f0_dp2tr(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_dl0az
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Edl0az
(   d3e1   ) = d3e.node()
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
d3exp_dl0az_errck(d3e.lctn(), d3e1)
end (*let*) // end of [f0_dl0az(d3e,err)]
//
fun
f0_dl1az
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Edl1az
(   d3e1   ) = d3e.node()
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
d3exp_dl1az_errck(d3e.lctn(), d3e1)
end (*let*) // end of [f0_dl1az(d3e,err)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_where
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Ewhere
(d3e1, dcls) = d3e.node()
//
val
d3e1 =
tread23_d3exp(d3e1, err)
val
dcls =
tread23_d3eclist(dcls, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_where_errck( loc, d3e1, dcls )
end (*let*) // end-of-[else]
end (*let*) // end of [f0_where(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_assgn
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Eassgn
(d3el, d3er) = d3e.node()
//
val
d3el = tread23_d3exp(d3el, err)
val
d3er = tread23_d3exp(d3er, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_assgn_errck( loc, d3el, d3er )
end (*let*) // end-of-[else]
end (*let*) // end of [f0_assgn(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_raise
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Eraise
(tknd, d3e1) = d3e.node()
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_raise_errck( loc, tknd, d3e1 )
end (*let*) // end-of-[else]
end (*let*) // end of [f0_raise(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_l0azy
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3El0azy
(dsym, d3e1) = d3e.node()
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_l0azy_errck( loc, dsym, d3e1 )
end (*let*) // end-of-[else]
end (*let*) // end of [f0_l0azy(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_l1azy
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3El1azy
(dsym
,d3e1, d3es) = d3e.node()
//
val
d3e1 = tread23_d3exp(d3e1, err)
val
d3es = tread23_d3explst(d3es, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_l1azy_errck(loc,dsym,d3e1,d3es)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_l1azy(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_labck
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
(*
HX-2023-03-04:
[labck] treated as error
*)
val ( ) = err := e00 + 1
//
val-
D3Elabck
(d3e1, lab2) = d3e.node()
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_labck_errck( loc, d3e1, lab2 )
end (*let*) // end-of-[else]
end (*let*) // end of [f0_labck(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_t2pck
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
(*
HX-2023-03-04:
[t2pck] treated as error
*)
val ( ) = err := e00 + 1
//
val-
D3Et2pck
(d3e1, t2p2) = d3e.node()
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_t2pck_errck( loc, d3e1, t2p2 )
end (*let*) // end-of-[else]
end (*let*) // end of [f0_t2pck(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_annot
(d3e: d3exp
,err: &sint >> _): d3exp =
let
//
val e00 = err
//
val-
D3Eannot
(d3e1
,s1e2, s2e2) = d3e.node()
//
val
d3e1 = tread23_d3exp(d3e1, err)
(*
val
s2e2 = tread23_s2exp(s2e2, err)
*)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_annot_errck(loc,d3e1,s1e2,s2e2)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_annot(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_none0
(d3e: d3exp
,err: &sint >> _): d3exp =
let // HX: this is non-error
val-D3Enone0() = d3e.node() in (d3e)
end (*let*) // end of [f0_none0(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_none1
(d3e: d3exp
,err: &sint >> _): d3exp =
let
val-
D3Enone1(d2e1) = d3e.node()
val lvl = 1 // HX: treated as error
val d3e = d3exp_errck(lvl, d3e) in (d3e)
end (*let*) // end of [f0_none1(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_none2
(d3e: d3exp
,err: &sint >> _): d3exp =
let
val-
D3Enone2(d3e1) = d3e.node()
val lvl = 1 // HX: treated as error
val d3e = d3exp_errck(lvl, d3e) in (d3e)
end (*let*) // end of [f0_none2(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_extnam
(d3e: d3exp
,err: &sint >> _): d3exp =
let
val-
D3Eextnam _ = d3e.node() in (d3e) endlet
//
fun
f0_synext
(d3e: d3exp
,err: &sint >> _): d3exp =
let
val-
D3Esynext _ = d3e.node() in (d3e) endlet
//
(* ****** ****** *)
(* ****** ****** *)
(*
  val () =
  prerrsln("tread23_d3exp: d3e0 = ", d3e0)
*)
(* ****** ****** *)
(* ****** ****** *)
//
} (*where*)//end-[tread23_d3exp(d3e0,err)]
//
(* ****** ****** *)
//
#implfun
tread23_l3d3e
  (ld3e, err) =
let
//
val e00 = err
//
val+
D3LAB(lab0, d3e1) = ld3e
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if // if
(err=e00)
then (ld3e) else D3LAB(lab0, d3e1)
end (*let*)//end-(tread23_l3d3e(ld3e,err))
//
(* ****** ****** *)
//
#implfun
tread23_f3arg
  (farg, err) =
(
case+
farg.node() of
//
|
F3ARGdapp
(npf1, d3ps) =>
let
val e00 = err
val d3ps =
tread23_d3patlst(d3ps, err)
in//let
if
(err=e00)
then (farg) else
f3arg
(farg.lctn(), F3ARGdapp(npf1, d3ps))
endlet // end of [F3ARGdapp(npf1,d3ps)]
//
|F3ARGsapp _ => farg|F3ARGmets _ => farg)
//(*case+*)//end-[tread23_f3arg(farg,err)]
//
(* ****** ****** *)
//
#implfun
tread23_d3gua
  (dgua, err) =
(
case+
dgua.node() of
|
D3GUAexp
( d3e1 ) => let
//
val e00 = err
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err = e00)
then (dgua) else
d3gua(dgua.lctn(), D3GUAexp(d3e1))
endlet // end of [ D3GUAexp(d3e1) ]
|
D3GUAmat
(d3e1,d3p2) =>
let
//
val e00 = err
//
val
d3e1 = tread23_d3exp(d3e1, err)
//
val d3p2 = tread23_d3pat(d3p2, err)
//
in//let
if
(err = e00)
then (dgua) else
d3gua(dgua.lctn(), D3GUAmat(d3e1,d3p2))
endlet // end of [ D3GPTgua(_,_,_) ]
) (*case+*)//end-of-[tread23_d3gua(dgua,err)]
//
(* ****** ****** *)
//
#implfun
tread23_d3gpt
  (dgpt, err) =
(
case+
dgpt.node() of
|
D3GPTpat
( d3p1 ) => let
//
val e00 = err
//
val
d3p1 = tread23_d3pat(d3p1, err)
//
in//let
if
(err = e00)
then (dgpt) else
d3gpt(dgpt.lctn(), D3GPTpat(d3p1))
endlet // end of [ D3GPTpat(d3p1) ]
|
D3GPTgua
(d3p1,d3gs) =>
let
//
val e00 = err
//
val d3p1 = tread23_d3pat(d3p1, err)
//
val d3gs = tread23_d3gualst(d3gs, err)
//
in//let
if
(err = e00)
then (dgpt) else
d3gpt(dgpt.lctn(), D3GPTgua(d3p1,d3gs))
endlet // end of [ D3GPTgua(_,_,_) ]
) (*case+*)//end-of-[tread23_d3gpt(dgpt,err)]
//
(* ****** ****** *)
//
#implfun
tread23_d3cls
  (dcls, err) =
(
case+
dcls.node() of
|
D3CLSgpt
( dgpt ) => let
//
val e00 = err
//
val dgpt =
tread23_d3gpt(dgpt, err)
in//let
if
(err=e00)
then (dcls)
else
d3cls(dcls.lctn(), D3CLSgpt(dgpt))
end (*let*)//end-of[D3CLSgpt(dgpt)]
|
D3CLScls
(dgpt,d3e1) =>
let
//
val e00 = err
//
val dgpt = tread23_d3gpt(dgpt, err)
val d3e1 = tread23_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (dcls)
else
d3cls(dcls.lctn(), D3CLScls(dgpt,d3e1))
endlet // end-of-[ D3CLScls(_,_,_) ]
) (*case+*)//end-of-[tread23_d3cls(dcls,err)]
//
(* ****** ****** *)
//
(* ****** ****** *)
//
#implfun
tread23_d3patlst
  (  d3ps, err  ) =
list_tread23_fnp(d3ps, err, tread23_d3pat)
//
#implfun
tread23_d3patopt
  (  dopt, err  ) =
optn_tread23_fnp(dopt, err, tread23_d3pat)
//
(* ****** ****** *)
#implfun
tread23_l3d3plst
  (  ldps, err  ) =
list_tread23_fnp(ldps, err, tread23_l3d3p)
(* ****** ****** *)
//
#implfun
tread23_d3explst
  (  d3es, err  ) =
list_tread23_fnp(d3es, err, tread23_d3exp)
//
#implfun
tread23_d3expopt
  (  dopt, err  ) =
optn_tread23_fnp(dopt, err, tread23_d3exp)
//
(* ****** ****** *)
#implfun
tread23_l3d3elst
  (  ldes, err  ) =
list_tread23_fnp(ldes, err, tread23_l3d3e)
(* ****** ****** *)
//
#implfun
tread23_f3arglst
  (  f3as, err  ) =
list_tread23_fnp(f3as, err, tread23_f3arg)
//
(* ****** ****** *)
//
#implfun
tread23_d3gualst
  (  d3gs, err  ) =
list_tread23_fnp(d3gs, err, tread23_d3gua)
#implfun
tread23_d3clslst
  (  d3cs, err  ) =
list_tread23_fnp(d3cs, err, tread23_d3cls)
//
(* ****** ****** *)
//
#implfun
tread23_d3eclist
  (  dcls, err  ) =
list_tread23_fnp(dcls, err, tread23_d3ecl)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_tread23_dynexp.dats] *)
