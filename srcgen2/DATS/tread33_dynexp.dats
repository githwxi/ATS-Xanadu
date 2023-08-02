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
//
(*
Author: Hongwei Xi
(*
Wed 26 Jul 2023 04:00:12 PM EDT
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
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/tread33.sats"
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
#symload styp with d3pat_get_styp
#symload styp with d3pat_set_styp
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
#symload styp with d3exp_get_styp
#symload styp with d3exp_set_styp
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
(loc0, D3Perrck(lvl0,d3p0))
end//let//end-of(d3pat_errck)
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
(loc0, D3Eerrck(lvl0,d3e0))
end//let//end-of(d3exp_errck)
//
(* ****** ****** *)
(*
HX-2023-08-01: For d3pat-handling
*)
(* ****** ****** *)
//
fun
d3pat_errvl_a1
(d3p0: d3pat): sint =
(
case+ d3p0.node() of
|
D3Perrck
(lvl0, _) => lvl0 | _ => 0)
//
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
gmax
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
gmax
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
gmax
( errvl(dp1)
, l3d3p_errvl_ldps(ldps)) end
endcas // end of [ case+(ldps) ]
)
//
#symload errvl with l3d3p_errvl_ldps
//
(* ****** ****** *)
(*
HX-2023-08-01:
Various d3pat-errck functions
*)
(* ****** ****** *)
//
fun
d3pat_var_errck
(loc0: loc_t
,t2p0: s2typ
,d3v1: d2var): d3pat =
let
val
lvl0 = 0 in//let
d3pat_errck
( lvl0+1
, d3pat(loc0, t2p0, D3Pvar(d3v1)))
endlet//end of [d3pat_var_errck(...)]
//
(* ****** ****** *)
//
fun
d3pat_annot_errck
( loc0: loc_t
, t2p0: s2typ
, d3p1: d3pat
, s1e2: s1exp
, s2e2
: s2exp(*annot*)): d3pat =
let
val
lvl0 = errvl(d3p1) in//let
d3pat_errck
(
lvl0+1,
d3pat_make_styp_node
(loc0,t2p0,D3Pannot(d3p1,s1e2,s2e2)))
endlet//end of [d3pat_annot_errck(...)]
//
(* ****** ****** *)
(*
HX-2023-08-01: For d3exp-handling
*)
(* ****** ****** *)
//
fun
d3exp_errvl_a1
(d3e0: d3exp): sint =
(
case+ d3e0.node() of
|
D3Eerrck
(lvl0, _) => lvl0 | _ => 0)
//
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
gmax
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
gmax
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
gmax
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
d3ecl_errvl_lst
(dcls: d3eclist): sint = 0
#symload errvl with d3ecl_errvl_lst
//
(* ****** ****** *)
(*
HX-2023-08-01:
Various d3exp-errck functions
*)
(* ****** ****** *)
//
fun
d3exp_var_errck
(loc0: loc_t
,t2p0: s2typ
,d3v1: d2var): d3exp =
let
val
lvl0 = 0 in//let
d3exp_errck
( lvl0+1
, d3exp(loc0, t2p0, D3Evar(d3v1)) )
endlet//end of [d3exp_var_errck(...)]
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
lvl0 = 0 in//let
d3exp_errck
(
lvl0+1,
d3exp_make_styp_node
(loc0, t2p0, D3Etapq(d3f0, t2js)) )
endlet//end of [d3exp_dap0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_dap0_errck
(loc0: loc_t
,t2p0: s2typ
,d3f0: d3exp): d3exp =
let
val
lvl0 = errvl(d3f0) in//let
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
lvl0 = gmax
(errvl(d3f0), errvl(d3es)) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_styp_node
( loc0
, t2p0, D3Edapp(d3f0, npf1, d3es)))
endlet//end of [d3exp_dapp_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp_let0_errck
(loc0: loc_t
,t2p0: s2typ
,dcls: d3eclist
,d3e1
:d3exp(*scope*)): d3exp =
let
val
lvl0 = gmax
(errvl(dcls), errvl(d3e1)) in//let
d3exp_errck
(lvl0+1
,d3exp_make_styp_node
 (loc0, t2p0, D3Elet0(dcls, d3e1)))
endlet//end of [d3exp_let0_errck(...)]
//
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
lvl0 = gmax
(errvl(d3es), errvl(d3e1)) in//let
d3exp_errck
( lvl0+1
, d3exp_make_styp_node
  (loc0, t2p0, D3Eseqn(d3es, d3e1)))
endlet//end of [d3exp_seqn_errck(...)]
//
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
lvl0 = errvl(d3es) in//let
d3exp_errck
( lvl0+1
, d3exp_make_styp_node
  (loc0, t2p0, D3Etup0(npf1, d3es)))
endlet//end of [d3exp_tup0_errck(...)]
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
lvl0 = errvl(d3es) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_styp_node
(loc0,t2p0,D3Etup1(knd0,npf1,d3es)))
endlet//end of [d3exp_tup1_errck(...)]
//
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
lvl0 = errvl(dexp) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_styp_node
(loc0, t2p0
,D3Elam0(tknd,f3as,sres,arrw,dexp)))
endlet//end of [d3exp_lam0_errck(...)]
//
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
endlet//end of [d3exp_addr_errck(...)]
//
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
endlet//end of [d3exp_flat_errck(...)]
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
endlet//end of [d3exp_eval_errck(...)]
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
endlet//end of [d3exp_fold_errck(...)]
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
endlet//end of [d3exp_free_errck(...)]
//
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
lvl0 = gmax
(errvl(d3el), errvl(d3er)) in//let
d3exp_errck
(
lvl0+1,
d3exp_make_styp_node
(loc0, t2p0, D3Eassgn(d3el, d3er)) )
endlet//end of [d3exp_assgn_errck(...)]
//
(* ****** ****** *)
(*
HX-2023-07-30:
for handling [d3pat] and [d3exp]
*)
(* ****** ****** *)
//
#implfun
tread33_d3pat
( d3p0, err ) =
(
case+
d3p0.node() of
//
|
D3Pvar _ =>
f0_var(d3p0, err)
//
|D3Pint _ => d3p0
|D3Pbtf _ => d3p0
|D3Pchr _ => d3p0
|D3Pflt _ => d3p0
|D3Pstr _ => d3p0
//
|D3Pcon _ => d3p0
//
|
D3Pannot _ => f0_annot(d3p0, err)
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
f0_var
( d3p: d3pat
, err: &sint >> _): d3pat =
let
//
val e00 = err
//
val t2p = d3p.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3p.styp(t2p)
//
val-
D3Pvar(d2v1) = d3p.node()
//
in//let
if
(err=e00)
then (d3p) else
d3pat_var_errck(d3p.lctn(),t2p,d2v1)
end (*let*) // end of [f0_var(d3p,err)]
//
(* ****** ****** *)
//
fun
f0_annot
( d3p: d3pat
, err: &sint >> _): d3pat =
let
//
val e00 = err
//
val t2p = d3p.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3p.styp(t2p)
//
val-
D3Pannot
( d3p1
, s1e2, s2e2) = d3p.node()
//
val
d3p1 = tread33_d3pat(d3p1, err)
//
in//let
if
(err=e00)
then (d3p) else
(
  d3pat_annot_errck
  (d3p.lctn(), t2p, d3p1, s1e2, s2e2) )
end (*let*) // end of [f0_annot(d3p,err)]
//
(* ****** ****** *)
//
val () =
prerrln("tread33_d3pat: d3p0 = ", d3p0)
//
(* ****** ****** *)
//
} (*where*)//end[tread33_d3pat(d3p0,err)]

(* ****** ****** *)
//
#implfun
tread33_d3exp
( d3e0, err ) =
(
case+
d3e0.node() of
//
|
D3Evar _ =>
f0_var(d3e0, err)
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
|D3Etapq _ => f0_tapq(d3e0, err)
//
|D3Edap0 _ => f0_dap0(d3e0, err)
|D3Edapp _ => f0_dapp(d3e0, err)
//
|D3Elet0 _ => f0_let0(d3e0, err)
//
|D3Eseqn _ => f0_seqn(d3e0, err)
//
|D3Etup0 _ => f0_tup0(d3e0, err)
|D3Etup1 _ => f0_tup1(d3e0, err)
//
|D3Elam0 _ => f0_lam0(d3e0, err)
//
|D3Eaddr _ => f0_addr(d3e0, err)
|D3Eflat _ => f0_flat(d3e0, err)
//
|D3Eeval _ => f0_eval(d3e0, err)
//
|D3Efold _ => f0_fold(d3e0, err)
|D3Efree _ => f0_free(d3e0, err)
//
|
D3Eassgn _ => f0_assgn(d3e0, err)
//
|
_(* otherwise *) =>
let
val lvl0 = 1 in//let
(
err := err+1; d3exp_errck(lvl0,d3e0))
endlet // end of [ _(* otherwise *) ]
//
) where // end-of-[(*case+(d3e0)-of*)]
{
//
(* ****** ****** *)
//
fun
f0_var
( d3e: d3exp
, err: &sint >> _): d3exp =
let
//
val e00 = err
//
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3e.styp(t2p)
//
val-
D3Evar(d2v1) = d3e.node()
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_var_errck(loc, t2p, d2v1) endlet
end (*let*) // end of [f0_var(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_tapq
( d3e: d3exp
, err: &sint >> _): d3exp =
let
//
val e00 = err
//
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3e.styp(t2p)
//
val-
D3Etapq
( d3f0, t2js) = d3e.node()
//
val
t2js =
tread33_t2jaglst(t2js, err)
val
d3f0 = tread33_d3exp(d3f0, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_tapq_errck(loc, t2p, d3f0, t2js)
end (*let*)
end (*let*) // end of [f0_tapq(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_dap0
( d3e: d3exp
, err: &sint >> _): d3exp =
let
//
val e00 = err
//
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3e.styp(t2p)
//
val-
D3Edap0(d3f0) = d3e.node()
val
d3f0 = tread33_d3exp(d3f0, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_dap0_errck(loc, t2p, d3f0) endlet
end (*let*) // end of [f0_dap0(d3e,err)]
//
(* ****** ****** *)
//
fun
f0_dapp
( d3e: d3exp
, err: &sint >> _): d3exp =
let
//
val e00 = err
//
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3e.styp(t2p)
//
val-
D3Edapp
( d3f0
, npf1, d3ps) = d3e.node()
val
d3f0 = tread33_d3exp(d3f0, err)
val
d3ps = tread33_d3explst(d3ps, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_dapp_errck(loc,t2p,d3f0,npf1,d3ps)
end (*let*)
end (*let*) // end of [ f0_dapp(d3e,err) ]
//
(* ****** ****** *)
//
fun
f0_let0
( d3e: d3exp
, err: &sint >> _): d3exp =
let
//
val e00 = err
//
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3e.styp(t2p)
//
val-
D3Elet0
( dcls, d3e1) = d3e.node()
val
dcls =
tread33_d3eclist(dcls, err)
val
d3e1 = tread33_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_let0_errck(loc, t2p, dcls, d3e1)
end (*let*)
end (*let*) // end of [ f0_let0(d3e,err) ]
//
(* ****** ****** *)
//
fun
f0_seqn
( d3e: d3exp
, err: &sint >> _): d3exp =
let
//
val e00 = err
//
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3e.styp(t2p)
//
val-
D3Eseqn
( d3es, d3e1) = d3e.node()
val
d3es =
tread33_d3explst(d3es, err)
val
d3e1 = tread33_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_seqn_errck(loc, t2p, d3es, d3e1)
end (*let*)
end (*let*) // end of [ f0_seqn(d3e,err) ]
//
(* ****** ****** *)
//
fun
f0_tup0
( d3e: d3exp
, err: &sint >> _): d3exp =
let
//
val e00 = err
//
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3e.styp(t2p)
//
val-
D3Etup0
( npf1, d3es) = d3e.node()
val
d3es = tread33_d3explst(d3es, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_tup0_errck(loc, t2p, npf1, d3es)
end (*let*)
end (*let*) // end of [ f0_tup0(d3e,err) ]
//
(* ****** ****** *)
//
fun
f0_tup1
( d3e: d3exp
, err: &sint >> _): d3exp =
let
//
val e00 = err
//
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3e.styp(t2p)
//
val-
D3Etup1
( knd0
, npf1, d3es) = d3e.node()
val
d3es = tread33_d3explst(d3es, err)
//
in//let
if
(err=e00)
then (d3e) else
(
  d3exp_tup1_errck
  (d3e.lctn(), t2p, knd0, npf1, d3es) )
end (*let*) // end of [ f0_tup1(d3e,err) ]
//
(* ****** ****** *)
//
fun
f0_lam0
( d3e: d3exp
, err: &sint >> _): d3exp =
let
//
val e00 = err
//
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3e.styp(t2p)
//
val-
D3Elam0
( tknd
, f3as, sres
, arrw, dexp) = d3e.node()
//
val f3as =
tread33_f3arglst(f3as, err)
(*
val sres = tread33_s2res(sres, err)
*)
val dexp = tread33_d3exp(dexp, err)
//
in
if
(err=e00)
then (d3e) else
d3exp_lam0_errck
(d3e.lctn(),t2p,tknd,f3as,sres,arrw,dexp)
end (*let*) // end of [ f0_lam0(d3e,err) ]
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
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3e.styp(t2p)
//
val-
D3Eaddr
(  d3e1  ) = d3e.node()
//
val
d3e1 =
tread33_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
d3exp_addr_errck(d3e.lctn(),t2p,d3e1)
end (*let*) // end of [f0_addr(d3e,err)]
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
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3e.styp(t2p)
//
val-
D3Eflat
(  d3e1  ) = d3e.node()
//
val
d3e1 =
tread33_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
d3exp_flat_errck(d3e.lctn(),t2p,d3e1)
end (*let*) // end of [f0_flat(d3e,err)]
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
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3e.styp(t2p)
//
val-
D3Eeval
(  d3e1  ) = d3e.node()
//
val
d3e1 =
tread33_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
d3exp_eval_errck(d3e.lctn(),t2p,d3e1)
end (*let*) // end of [f0_eval(d3e,err)]
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
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3e.styp(t2p)
//
val-
D3Efold
(  d3e1  ) = d3e.node()
//
val
d3e1 =
tread33_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
d3exp_fold_errck(d3e.lctn(),t2p,d3e1)
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
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3e.styp(t2p)
//
val-
D3Efree
(  d3e1  ) = d3e.node()
//
val
d3e1 =
tread33_d3exp(d3e1, err)
//
in//let
if
(err=e00)
then (d3e) else
d3exp_free_errck(d3e.lctn(),t2p,d3e1)
end (*let*) // end of [f0_free(d3e,err)]
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
val t2p = d3e.styp()
val t2p =
tread33_s2typ(t2p, err)
val ( ) = d3e.styp(t2p)
//
val-
D3Eassgn
( d3el, d3er) = d3e.node()
//
val
d3el = tread33_d3exp(d3el, err)
val
d3er = tread33_d3exp(d3er, err)
//
in//let
if
(err=e00)
then (d3e) else
let
val loc = d3e.lctn() in
d3exp_assgn_errck(loc, t2p, d3el, d3er)
end (*let*)
end (*let*) // end of [f0_assgn(d3e,err)]
//
(* ****** ****** *)
//
(*
  val () =
  prerrln("tread33_d3exp: d3e0 = ", d3e0)
*)
//
(* ****** ****** *)
//
} (*where*)//end-[tread33_d3exp(d3e0,err)]

(* ****** ****** *)
//
#implfun
tread33_f3arg
  (farg, err) =
(
case+
farg.node() of
//
|
F3ARGdyn0
(npf1, d3ps) =>
let
val e00 = err
val d3ps =
tread33_d3patlst(d3ps, err)
in//let
if
(err=e00)
then (farg) else
f3arg
(farg.lctn(), F3ARGdyn0(npf1, d3ps))
endlet // end of [F3ARGdyn0(npf1,d3ps)]
//
| _ (*otherwise*) => (     farg     )
//
) (*case+*)//end-[tread33_f3arg(farg,err)]
//
(* ****** ****** *)
//
#implfun
tread33_d3patlst
  (  d3ps, err  ) =
(
  list_tread33_fnp(d3ps, err, tread33_d3pat))
//
(* ****** ****** *)
//
#implfun
tread33_d3explst
  (  d3es, err  ) =
(
  list_tread33_fnp(d3es, err, tread33_d3exp))
//
(* ****** ****** *)
//
#implfun
tread33_f3arglst
  (  f3as, err  ) =
(
  list_tread33_fnp(f3as, err, tread33_f3arg))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread33_dynexp.dats] *)
