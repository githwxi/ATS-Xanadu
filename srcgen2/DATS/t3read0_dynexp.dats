(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Fri Jan 30 11:37:39 AM EST 2026
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
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/t3read0.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload sexp with d2con_get_sexp
#symload sexp with d2cst_get_sexp
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_errck
(lvl0: sint
,d3e0: d3exp): d3exp =
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
d3exp_make_tpnd
(loc0
,t2p0, D3Eerrck(lvl0, d3e0))
end (*let*)//end-of(d3exp_errck)
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
fun
d3cls_errvl_a1
(dcl: d3cls): sint =
(
case+ dcl.node() of
|
D3CLSgpt
(   dgpt   ) => (  0  )
|D3CLScls
(dgpt, d3e1) => errvl(d3e1))
#symload errvl with d3cls_errvl_a1
//
#extern
fun
d3cls_errvl_lst
(dcls: d3clslst): sint
//
#implfun
d3cls_errvl_lst
(  dcls  ) =
(
case+ dcls of
|list_nil
( (*nil*) ) => (  0  )
|list_cons
(dcl1,dcls) => maxs(
errvl(dcl1), d3cls_errvl_lst(dcls))
)(*case+*)//end-of-(d3cls_errvl_lst)
//
#symload errvl with d3cls_errvl_lst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_tapp_errck
(loc0: loc_t
,t2p0: s2typ
,d3f0: d3exp
,s2es: s2explst): d3exp =
let
val
lvl0 =
d3exp_errvl(d3f0) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd
(loc0, t2p0, D3Etapp(d3f0, s2es)) )
endlet//end-of-[d3exp_tapp_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_tapq_errck
(loc0: loc_t
,t2p0: s2typ
,d3f0: d3exp
,t2js: t2jaglst): d3exp =
let
val
lvl0 =
d3exp_errvl(d3f0) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd
(loc0, t2p0, D3Etapq(d3f0, t2js)) )
endlet//end-of-[d3exp_tapq_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_dap0_errck
(loc0: loc_t
,t2p0: s2typ
,d3f0: d3exp): d3exp =
let
val
lvl0 =
d3exp_errvl(d3f0) in//let
d3exp_errck
( lvl0+1
, d3exp(loc0, t2p0, D3Edap0(d3f0)))
endlet//end of [d3exp_dap0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_dapp_errck
(loc0: loc_t
,t2p0: s2typ
,d3f0: d3exp
,npf1: (sint)
,d3es: d3explst): d3exp =
let
val
lvl0 = maxs
(errvl(d3f0), errvl(d3es)) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd
( loc0
, t2p0, D3Edapp(d3f0, npf1, d3es)))
endlet//end of [d3exp_dapp_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_pcon_errck
(loc0: loc_t
,t2p0: s2typ
,tknd: token
,dlab: label
,dcon: d3exp): d3exp =
let
val
lvl0 =
d3exp_errvl(dcon) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd
( loc0
, t2p0, D3Epcon(tknd, dlab, dcon)))
endlet//end-of-[d3exp_pcon_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_proj_errck
(loc0: loc_t
,t2p0: s2typ
,tknd: token
,dlab: label
,dtup: d3exp): d3exp =
let
val
lvl0 =
d3exp_errvl(dtup) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd
( loc0
, t2p0, D3Eproj(tknd, dlab, dtup)))
endlet//end-of-[d3exp_proj_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_let0_errck
( loc0: loc_t
, t2p0: s2typ
, dcls // let
: ( d3eclist )
, d3e1: d3exp): d3exp =
let
val
lvl0 = errvl(d3e1) in//let
d3exp_errck
(lvl0+1
,d3exp_make_tpnd
 (loc0, t2p0, D3Elet0(dcls, d3e1)))
endlet//end-of-[d3exp_let0_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_ift0_errck
(loc0: loc_t
,t2p0: s2typ
,d3e1: d3exp
,dthn: d3expopt
,dels: d3expopt): d3exp =
let
val
lvl0 = maxs
(
errvl(d3e1),
errvl(dthn), errvl(dels))
in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd(
loc0,t2p0,D3Eift0(d3e1,dthn,dels)))
endlet//end-of-[d3exp_ift0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_cas0_errck
(loc0: loc_t
,t2p0: s2typ
,tknd: token
,d3e1: d3exp
,dcls: d3clslst): d3exp =
let
val
lvl0 = maxs
(errvl(d3e1), errvl(dcls))
in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd
(loc0,t2p0,D3Ecas0(tknd,d3e1,dcls)))
endlet//end-of-[d3exp_cas0_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_seqn_errck
(loc0: loc_t
,t2p0: s2typ
,d3es: d3explst
,d3e1
:d3exp (*last*)): d3exp =
let
val
lvl0 = maxs
(errvl(d3es), errvl(d3e1)) in//let
d3exp_errck
( lvl0+1
, d3exp_make_tpnd
  (loc0, t2p0, D3Eseqn(d3es, d3e1)))
endlet//end-of-[d3exp_seqn_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_tup0_errck
(loc0: loc_t
,t2p0: s2typ
,npf1: (sint)
,d3es: d3explst): d3exp =
let
val
lvl0 =
d3exp_errvl(d3es) in//let
d3exp_errck
( lvl0+1
, d3exp_make_tpnd
  (loc0, t2p0, D3Etup0(npf1, d3es)))
endlet//end-of-[d3exp_tup0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_tup1_errck
(loc0: loc_t
,t2p0: s2typ
,knd0: token
,npf1: (sint)
,d3es: d3explst): d3exp =
let
val
lvl0 =
d3exp_errvl(d3es) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd
(loc0,t2p0,D3Etup1(knd0,npf1,d3es)))
endlet//end-of-[d3exp_tup1_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_lam0_errck
(loc0: loc_t
,t2p0: s2typ
,tknd: token
,f3as: f3arglst
,sres: s2res
,arrw: f1unarrw
,dexp
:d3exp (*body*)): d3exp =
let
val
lvl0 =
d3exp_errvl(dexp) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd
(loc0, t2p0
,D3Elam0(tknd,f3as,sres,arrw,dexp)))
endlet//end-of-[d3exp_lam0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_fix0_errck
(loc0: loc_t
,t2p0: s2typ
,tknd: token
,dvar: d2var
,f3as: f3arglst
,sres: s2res
,arrw: f1unarrw
,dexp
:d3exp (*body*)): d3exp =
let
val
lvl0 =
d3exp_errvl(dexp) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd
( loc0
, t2p0,
  D3Efix0
  (tknd,dvar,f3as,sres,arrw,dexp)) )
endlet//end-of-[d3exp_fix0_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_try0_errck
(loc0: loc_t
,t2p0: s2typ
,tknd: token
,d3e1: d3exp
,dcls: d3clslst): d3exp =
let
val
lvl0 = maxs
(errvl(d3e1), errvl(dcls))
in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd
(loc0,t2p0,D3Etry0(tknd,d3e1,dcls)))
endlet//end-of-[d3exp_try0_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_addr_errck
(loc0: loc_t
,t2p0: s2typ
,d3e1: d3exp): d3exp =
let
val
lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1
, d3exp(loc0, t2p0, D3Eaddr(d3e1)) )
endlet//end-of-[d3exp_addr_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_view_errck
(loc0: loc_t
,t2p0: s2typ
,d3e1: d3exp): d3exp =
let
val
lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1
, d3exp(loc0, t2p0, D3Eview(d3e1)) )
endlet//end-of-[d3exp_view_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_flat_errck
(loc0: loc_t
,t2p0: s2typ
,d3e1: d3exp): d3exp =
let
val
lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1
, d3exp(loc0, t2p0, D3Eflat(d3e1)) )
endlet//end-of-[d3exp_flat_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_eval_errck
(loc0: loc_t
,t2p0: s2typ
,d3e1: d3exp): d3exp =
let
val
lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1
, d3exp(loc0, t2p0, D3Eeval(d3e1)) )
endlet//end-of-[d3exp_eval_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_fold_errck
(loc0: loc_t
,t2p0: s2typ
,d3e1: d3exp): d3exp =
let
val
lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1
, d3exp(loc0, t2p0, D3Efold(d3e1)) )
endlet//end-of-[d3exp_fold_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_free_errck
(loc0: loc_t
,t2p0: s2typ
,d3e1: d3exp): d3exp =
let
val
lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1
, d3exp(loc0, t2p0, D3Efree(d3e1)) )
endlet//end-of-[d3exp_free_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_dp2tr_errck
(loc0: loc_t
,t2p0: s2typ
,d3e1: d3exp): d3exp =
let
val
lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1
, d3exp(loc0, t2p0, D3Edp2tr(d3e1)) )
endlet//end-of-[d3exp_dp2tr_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_dl0az_errck
(loc0: loc_t
,t2p0: s2typ
,d3e1: d3exp): d3exp =
let
val
lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1
, d3exp(loc0, t2p0, D3Edl0az(d3e1)) )
endlet//end-of-[d3exp_dl0az_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_dl1az_errck
(loc0: loc_t
,t2p0: s2typ
,d3e1: d3exp): d3exp =
let
val
lvl0 = errvl(d3e1) in//let
d3exp_errck
( lvl0+1
, d3exp(loc0, t2p0, D3Edl1az(d3e1)) )
endlet//end-of-[d3exp_dl1az_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
//
fun
d3exp_where_errck
(loc0: loc_t
,t2p0: s2typ
,d3e1: d3exp
,dcls: d3eclist): d3exp =
let
val
lvl0 = errvl(d3e1) in//let
d3exp_errck
(lvl0+1
,d3exp_make_tpnd
 (loc0, t2p0, D3Ewhere(d3e1, dcls)))
endlet//end-of-[d3exp_where_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_assgn_errck
(loc0: loc_t
,t2p0: s2typ
,d3el: d3exp
,d3er: d3exp): d3exp =
let
val
lvl0 = maxs
(errvl(d3el), errvl(d3er)) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd
(loc0, t2p0, D3Eassgn(d3el, d3er)) )
endlet//end-of-[d3exp_assgn_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_xazgn_errck
(loc0: loc_t
,t2p0: s2typ
,d3el: d3exp
,d3er: d3exp): d3exp =
let
val
lvl0 = maxs
(errvl(d3el), errvl(d3er)) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd
(loc0, t2p0, D3Exazgn(d3el, d3er)) )
endlet//end-of-[d3exp_xazgn_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_xchng_errck
(loc0: loc_t
,t2p0: s2typ
,d3el: d3exp
,d3er: d3exp): d3exp =
let
val
lvl0 = maxs
(errvl(d3el), errvl(d3er)) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd
(loc0, t2p0, D3Exchng(d3el, d3er)) )
endlet//end-of-[d3exp_xchng_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp_annot_errck
( loc0: loc_t
, t2p0: s2typ
, d3e1: d3exp
, s1e2: s1exp
, s2e2
: s2exp(*annot*)): d3exp =
let
val
lvl0 =
d3exp_errvl(d3e1) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd(
loc0,t2p0,D3Eannot(d3e1,s1e2,s2e2)))
endlet//end-of-[d3exp_annot_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_t2ped_errck
( loc0: loc_t
, t2p0: s2typ
, d3e1: d3exp
, t2p2
: s2typ(*given*)): d3exp =
let
val
lvl0 =
d3exp_errvl(d3e1) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd(
  loc0, t2p0, D3Et2ped(d3e1, t2p2)))
endlet//end-of-[d3exp_t2ped_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t3read0_d3pat
(evn0, d3p0, err0) =
(
       d3p0       )
where
{
(*
val () =
prerrsln("t3read0_d3pat: d3p0 = ", d3p0)
*)
}(*where*)//end-of-[t3read0_d3pat(evn0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#implfun
t3read0_d3exp
(evn0, d3e0, err0) = d3e0
*)
#implfun
t3read0_d3exp
(evn0, d3e0, err0) =
let
//
(*
val
loc0 = d3e0.lctn()
val () =
prerrsln
("t3read0_d3exp: loc0 = ", loc0)
val () =
prerrsln
("t3read0_d3exp: d3e0 = ", d3e0)
*)
//
in//let
//
case+
d3e0.node() of
//
(* ****** ****** *)
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
|D3Econ _ => d3e0
|D3Ecst _ => d3e0
//
|D3Etop _ => d3e0
//
(* ****** ****** *)
//
|D3Etimp _ =>
(
  f0_timp(evn0, d3e0, err0))
//
(* ****** ****** *)
//
|D3Etapp _ =>
(
  f0_tapp(evn0, d3e0, err0))
|D3Etapq _ =>
(
  f0_tapq(evn0, d3e0, err0))
//
(* ****** ****** *)
//
|D3Edap0 _ =>
(
  f0_dap0(evn0, d3e0, err0))
|D3Edapp _ =>
(
  f0_dapp(evn0, d3e0, err0))
//
(* ****** ****** *)
//
|D3Epcon _ =>
(
  f0_pcon(evn0, d3e0, err0))
|D3Eproj _ =>
(
  f0_proj(evn0, d3e0, err0))
//
(* ****** ****** *)
//
|D3Elet0 _ =>
(
  f0_let0(evn0, d3e0, err0))
//
(* ****** ****** *)
//
|D3Eift0 _ =>
(
  f0_ift0(evn0, d3e0, err0))
|D3Ecas0 _ =>
(
  f0_cas0(evn0, d3e0, err0))
//
(* ****** ****** *)
//
|D3Eseqn _ =>
(
  f0_seqn(evn0, d3e0, err0))
//
(* ****** ****** *)
//
|D3Etup0 _ =>
(
  f0_tup0(evn0, d3e0, err0))
|D3Etup1 _ =>
(
  f0_tup1(evn0, d3e0, err0))
(*
|D3Ercd2 _ =>
(
  f0_rcd2(evn0, d3e0, err0))
*)
//
(* ****** ****** *)
//
|D3Elam0 _ =>
(
  f0_lam0(evn0, d3e0, err0))
|D3Efix0 _ =>
(
  f0_fix0(evn0, d3e0, err0))
//
(* ****** ****** *)
//
|D3Etry0 _ =>
(
  f0_try0(evn0, d3e0, err0))
//
(* ****** ****** *)
//
|D3Eaddr _ =>
(
  f0_addr(evn0, d3e0, err0))
|D3Eview _ =>
(
  f0_view(evn0, d3e0, err0))
//
(* ****** ****** *)
//
|D3Eflat _ =>
(
  f0_flat(evn0, d3e0, err0))
|D3Eeval _ =>
(
  f0_eval(evn0, d3e0, err0))
|D3Efold _ =>
(
  f0_fold(evn0, d3e0, err0))
|D3Efree _ =>
(
  f0_free(evn0, d3e0, err0))
//
(* ****** ****** *)
//
|D3Edp2tr _ =>
(
  f0_dp2tr(evn0, d3e0, err0))
//
|D3Edl0az _ =>
(
  f0_dl0az(evn0, d3e0, err0))
|D3Edl1az _ =>
(
  f0_dl1az(evn0, d3e0, err0))
//
(* ****** ****** *)
//
|D3Ewhere _ =>
(
  f0_where(evn0, d3e0, err0))
//
(* ****** ****** *)
//
|D3Eassgn _ =>
(
  f0_assgn(evn0, d3e0, err0))
//
|D3Exazgn _ =>
(
  f0_xazgn(evn0, d3e0, err0))
|D3Exchng _ =>
(
  f0_xchng(evn0, d3e0, err0))
//
(* ****** ****** *)
//
|D3Eannot _ =>
(
  f0_annot(evn0, d3e0, err0))
|D3Et2ped _ =>
(
  f0_t2ped(evn0, d3e0, err0))
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
(
let
val
dres = d3exp_none2(d3e0) in dres end)
//
(* ****** ****** *)
(* ****** ****** *)
//
end where
{
//
fun
f0_timp
( evn0:
! t3r0evn
, d3e0: d3exp
, nerr: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Etimp
( d3f0
, timp ) = d3e0.node()
//
val (  ) =
t3r0evn_timp$psh(evn0, timp)
//
val timp =
t3read0_timpl(evn0, timp, err0)
//
val (  ) = t3r0evn_timp$pop(evn0)
//
in//let
//
if // if
(nerr=err0)
then (d3e0) else
let
val lvl0 = (  0  )
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
val tmps = t3r0evn_tmps$get(evn0)
in//let
d3exp_errck
(
lvl0+1,
d3exp_make_tpnd
(loc0, t2p0, D3Etimq(d3f0,timp,tmps)))
end//let
//
end(*let*)//end-of-[f0_timp(env0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_tapp
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Etapp
( d3f0, s2es) = d3e0.node()
//
val
d3f0 =
t3read0_d3exp(evn0, d3f0, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val t2p0 = d3f0.styp()
in//let
(
  d3exp_tapp_errck
  (d3e0.lctn(), t2p0, d3f0, s2es) )
end//let
end(*let*)//end-of-[f0_tapp(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_tapq
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Etapq
( d3f0, t2js) = d3e0.node()
//
val
d3f0 =
t3read0_d3exp(evn0, d3f0, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
  d3exp_tapq_errck
  (d3e0.lctn(), t2p0, d3f0, t2js) )
end//let
end(*let*)//end-of-[f0_tapq(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_dap0
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Edap0(d3f0) = d3e0.node()
//
val
d3f0 =
(
t3read0_d3exp(evn0,d3f0,err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
in//let
(
d3exp_dap0_errck(loc0, t2p0, d3f0))
end//let
//
end(*let*)//end-of-[f0_dap0(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_dapp
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Edapp
( d3f0
, npf1, d3es) = d3e0.node()
//
val
d3f0 =
(
t3read0_d3exp(evn0,d3f0,err0))
val
d3es =
t3read0_d3explst(evn0,d3es,err0)
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
in//let
(
  d3exp_dapp_errck
  ( loc0, t2p0, d3f0, npf1, d3es ))
end//let
//
end(*let*)//end-of-[f0_dapp(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_pcon
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Epcon
( tknd
, dlab, dcon) = d3e0.node()
//
val
dcon =
t3read0_d3exp(evn0, dcon, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
  d3exp_pcon_errck
  ( loc0, t2p0, tknd, dlab, dcon ))
end//let
end(*let*)//end-of-[f0_pcon(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_proj
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Eproj
( tknd
, dlab, dtup) = d3e0.node()
val
dtup =
t3read0_d3exp(evn0, dtup, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
  d3exp_proj_errck
  ( loc0, t2p0, tknd, dlab, dtup ))
end//let
end(*let*)//end-of-[f0_proj(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_let0
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Elet0
( dcls, d3e1) = d3e0.node()
//
val
dcls =
t3read0_d3eclist(evn0,dcls,err0)
val
d3e1 =
(
  t3read0_d3exp(evn0, d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
  d3exp_let0_errck
  (loc0, t2p0, dcls, d3e1(*body*)))
end//let
//
end(*let*)//end of [f0_let0(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_ift0
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Eift0
( d3e1
, dthn, dels) = d3e0.node()
//
val d3e1 =
t3read0_d3exp(evn0,d3e1,err0)
val dthn =
t3read0_d3expopt(evn0,dthn,err0)
val dels =
t3read0_d3expopt(evn0,dels,err0)
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
  d3exp_ift0_errck
  ( loc0, t2p0, d3e1, dthn, dels ))
end//let
//
end(*let*)//end-of-[f0_ift0(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_cas0
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Ecas0
( tknd
, d3e1, dcls) = d3e0.node()
//
val d3e1 =
t3read0_d3exp(evn0,d3e1,err0)
val dcls =
t3read0_d3clslst(evn0,dcls,err0)
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
  d3exp_cas0_errck
  ( loc0, t2p0, tknd, d3e1, dcls ))
//
end//let
//
end(*let*)//end-of-[f0_cas0(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_seqn
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Eseqn
( d3es, d3e1) = d3e0.node()
//
val
d3es =
t3read0_d3explst(evn0,d3es,err0)
val
d3e1 =
(
 t3read0_d3exp(evn0, d3e1, err0))
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val t2p0 = d3e0.styp()
in//let
(
  d3exp_seqn_errck
  ( d3e0.lctn(), t2p0, d3es, d3e1))
end//let
end(*let*)//end-of-[f0_seqn(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_tup0
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Etup0
( npf1, d3es) = d3e0.node()
//
val
d3es =
t3read0_d3explst(evn0,d3es,err0)
//
in//let
if
(err0=nerr)
then (d3e0) else
let
val t2p0 = d3e0.styp()
in//let
(
  d3exp_tup0_errck
  ( d3e0.lctn(), t2p0, npf1, d3es))
end//let
end(*let*)//end-of-[f0_tup0(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_tup1
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Etup1
( knd0
, npf1, d3es) = d3e0.node()
//
val
d3es =
t3read0_d3explst(evn0,d3es,err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
in//let
(
  d3exp_tup1_errck
  ( loc0, t2p0, knd0, npf1, d3es ))
end//let
end(*let*)//end-of-[f0_tup1(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_lam0
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Elam0
( tknd
, f3as, sres
, arrw, dexp) = d3e0.node()
//
val dexp =
t3read0_d3exp(evn0, dexp, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
d3exp_lam0_errck(
loc0,t2p0,tknd,f3as,sres,arrw,dexp))
end//let
end(*let*)//end-of-[f0_lam0(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_fix0
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Efix0
( tknd
, dvar
, f3as, sres
, arrw, dexp) = d3e0.node()
//
val dexp =
t3read0_d3exp(evn0, dexp, err0)
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
in//let
(
d3exp_fix0_errck(loc0,
t2p0,tknd,dvar,f3as,sres,arrw,dexp))
end//let
//
end(*let*)//end-of-[f0_fix0(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_try0
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Etry0
( tknd
, d3e1, dcls) = d3e0.node()
//
val
d3e1 =
t3read0_d3exp(evn0, d3e1, err0)
val
dcls =
t3read0_d3clslst(evn0, dcls, err0)
//
in//let
//
if
(err0=nerr)
then (d3e0) else
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
in//let
(
  d3exp_try0_errck
  ( loc0, t2p0, tknd, d3e1, dcls ))
end//let
end(*let*)//end-of-[f0_try0(evn0,d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_addr
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Eaddr
(  d3e1  ) = d3e0.node()
//
val
d3e1 =
t3read0_d3exp(evn0, d3e1, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
d3exp_addr_errck(loc0, t2p0, d3e1))
end//let
end(*let*)//end-of-[f0_addr(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_view
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Eview
(  d3e1  ) = d3e0.node()
//
val
d3e1 =
t3read0_d3exp(evn0, d3e1, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
d3exp_view_errck(loc0, t2p0, d3e1))
end//let
end(*let*)//end-of-[f0_view(evn0,d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_flat
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Eflat
(  d3e1  ) = d3e0.node()
//
val
d3e1 =
t3read0_d3exp(evn0, d3e1, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
d3exp_flat_errck(loc0, t2p0, d3e1))
end//let
end(*let*)//end-of-[f0_flat(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_eval
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Eeval
(  d3e1  ) = d3e0.node()
//
val
d3e1 =
t3read0_d3exp(evn0, d3e1, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
d3exp_eval_errck(loc0, t2p0, d3e1))
end//let
end(*let*)//end-of-[f0_eval(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_fold
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Efold
(  d3e1  ) = d3e0.node()
//
val
d3e1 =
t3read0_d3exp(evn0, d3e1, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
d3exp_fold_errck(loc0, t2p0, d3e1))
end//let
end(*let*)//end-of-[f0_fold(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_free
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Efree
(  d3e1  ) = d3e0.node()
//
val
d3e1 =
t3read0_d3exp(evn0, d3e1, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
d3exp_free_errck(loc0, t2p0, d3e1))
end//let
end(*let*)//end-of-[f0_free(evn0,d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dp2tr
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Edp2tr
(  d3e1  ) = d3e0.node()
//
val
d3e1 =
t3read0_d3exp(evn0, d3e1, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
  d3exp_dp2tr_errck(loc0, t2p0, d3e1))
end//let
end(*let*)//end-of-[f0_dp2tr(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_dl0az
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Edl0az
(  d3e1  ) = d3e0.node()
//
val
d3e1 =
t3read0_d3exp(evn0, d3e1, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
  d3exp_dl0az_errck(loc0, t2p0, d3e1))
end//let
end(*let*)//end-of-[f0_dl0az(evn0,d3e0,err0)]
//
fun
f0_dl1az
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Edl1az
(  d3e1  ) = d3e0.node()
//
val
d3e1 =
t3read0_d3exp(evn0, d3e1, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
  d3exp_dl1az_errck(loc0, t2p0, d3e1))
end//let
end(*let*)//end-of-[f0_dl1az(evn0,d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_where
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Ewhere
( d3e1, dcls) = d3e0.node()
//
val
dcls =
t3read0_d3eclist(evn0,dcls,err0)
val
d3e1 =
(
  t3read0_d3exp(evn0, d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
  d3exp_where_errck
  ( loc0, t2p0, d3e1(*body*), dcls )
end//let
//
end(*let*)//end-of-[f0_where(evn0,d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_assgn
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Eassgn
( d3el, d3er) = d3e0.node()
//
val
d3el =
t3read0_d3exp(evn0, d3el, err0)
val
d3er =
t3read0_d3exp(evn0, d3er, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val t2p0 = d3e0.styp()
in//let
(
  d3exp_assgn_errck
  ( d3e0.lctn(), t2p0, d3el, d3er ))
end//let
end(*let*)//end-of-[f0_assgn(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_xazgn
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Exazgn
( d3el, d3er) = d3e0.node()
//
val
d3el =
t3read0_d3exp(evn0, d3el, err0)
val
d3er =
t3read0_d3exp(evn0, d3er, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val t2p0 = d3e0.styp()
in//let
(
  d3exp_xazgn_errck
  ( d3e0.lctn(), t2p0, d3el, d3er ))
end//let
end(*let*)//end-of-[f0_xazgn(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_xchng
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Exchng
( d3el, d3er) = d3e0.node()
//
val
d3el =
t3read0_d3exp(evn0, d3el, err0)
val
d3er =
t3read0_d3exp(evn0, d3er, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val t2p0 = d3e0.styp()
in//let
(
  d3exp_xchng_errck
  ( d3e0.lctn(), t2p0, d3el, d3er ))
end//let
end(*let*)//end-of-[f0_xchng(evn0,d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_annot
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Eannot
( d3e1
, s1e2, s2e2) = d3e0.node()
//
val
d3e1 =
t3read0_d3exp(evn0, d3e1, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
in//let
(
  d3exp_annot_errck
  ( loc0, t2p0, d3e1, s1e2, s2e2 ) )
end//let
end(*let*)//end-of-[f0_annot(evn0,d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_t2ped
( evn0:
! t3r0evn
, d3e0: d3exp
, err0: &sint >> _): d3exp =
let
//
val nerr = err0
//
val-
D3Et2ped
( d3e1, t2p2) = d3e0.node()
//
val
d3e1 =
t3read0_d3exp(evn0, d3e1, err0)
//
in//let
if // if
(err0=nerr)
then (d3e0) else
let
val t2p0 = d3e0.styp()
in//let
(
  d3exp_t2ped_errck
  ( d3e0.lctn(), t2p0, d3e1, t2p2 ))
end//let
end(*let*)//end-of-[f0_t2ped(evn0,d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val () =
(
  prerrsln( "t3read0_d3exp: d3e0 = ", d3e0 ))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[t3read0_d3exp(evn0,d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t3read0_d3cls
(evn0, dcls, err0) =
(
case+
dcls.node() of
//
|D3CLSgpt
( dgpt ) => (  dcls )
//
|D3CLScls
(dgpt,d3e1) =>
let
//
val nerr = err0
//
val d3e1 =
t3read0_d3exp(evn0, d3e1, err0)
//
in//let
if // if
(err0=nerr)
then (dcls) else
d3cls(dcls.lctn(), D3CLScls(dgpt,d3e1))
end(*let*)//end-of-[D3CLScls(dgpt,d3e1)]
//
)(*case+*)//end-of-[t3read0_d3cls(evn0,dcls,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#implfun
t3read0_timpl
(evn0, timp, err0) = timp
*)
#implfun
t3read0_timpl
(evn0, timp, err0) =
(
case+
timp.node() of
//
|TIMPLall1
( dcst
, t2js, d3cs) =>
let
val () =
(err0 := err0+1) in timp end
//let//end-of-[|TIMPLall1(...)]
//
|TIMPLallx
( dcst
, t2js, d3cs) =>
(
case+ d3cs of
|list_nil
((*void*)) => 
(*
HX-2026-02-02:
Is this case live?
*)
let
val () =
(err0 := err0+1) in timp end
//end-of-[TIMPLallx(...,nil())]
|list_cons
(dcl1,d3cs) =>
let
val nerr = err0
val dcl1 =
t3read0_d3ecl(evn0,dcl1,err0)
in//let
if // if
(err0 = nerr)
then ( timp ) else
let
//
val stmp = timp.stmp((*void*))
val d3cs = list_cons(dcl1, d3cs)
//
in//let
(
timpl_make_node
(stmp, TIMPLallx(dcst, t2js, d3cs)))
end//let
end//let//end-of-[TIMPLallx(...,cons()]
//
)(*case+*)//end-of-[TIMPLallx(dcst,t2js,d3cs)]
//
)(*case+*)//end-of-[t3read0_timpl(evn0,dcls,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_t3read0_dynexp.dats] *)
(***********************************************************************)
