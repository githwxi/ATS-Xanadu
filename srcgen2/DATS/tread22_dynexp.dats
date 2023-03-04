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
Sat 28 Jan 2023 04:13:08 PM EST
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
#staload "./../SATS/tread22.sats"
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
fun
d2exp_t2pck_errck
( loc0: loc_t
, d2e1: d2exp
, t2p2: s2typ): d2exp =
let
val lvl0 = errvl(d2e1) in//let
d2exp_errck
( lvl0+1
, d2exp( loc0, D2Et2pck( d2e1, t2p2 ) ))
endlet // end of [d2exp_t2pck_errck(...)]
//
(* ****** ****** *)
//
#implfun
tread22_d2pat
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
|D2Ptup0 _ => f0_tup0(d2p0, err)
(*
|D2Ptup1 _ => f0_tup1(d2p0, err)
|D2Prcd2 _ => f0_rcd2(d2p0, err)
*)
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
tread22_d2patlst(d2ps, err)
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
d2p1 = tread22_d2pat(d2p1, err)
(*
val
s2e2 = tread22_s2exp(s2e2, err)
*)
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
} (*where*)//end[tread22_d2pat(d2p0,err)]
//
(* ****** ****** *)
//
#implfun
tread22_l2d2p
  (ld2p, err) =
let
//
val e00 = err
//
val+
D2LAB(lab0, d2p1) = ld2p
//
val
d2p1 = tread22_d2pat(d2p1, err)
//
in//let
if // if
(e00=err)
then (ld2p) else D2LAB(lab0, d2p1)
end (*let*)//end-(tread22_l2d2p(ld2p,err))
//
(* ****** ****** *)
//
//
#implfun
tread22_d2exp
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
|D2Esym0 _ => f0_sym0(d2e0, err)
//
|D2Edap0 _ => f0_dap0(d2e0, err)
|D2Edapp _ => f0_dapp(d2e0, err)
//
|D2Etup0 _ => f0_tup0(d2e0, err)
(*
|D2Etup1 _ => f0_tup1(d2e0, err)
|D2Ercd2 _ => f0_rcd2(d2e0, err)
*)
//
|
D2Eift0
(
d2e1,
dthn,dels) =>
let
//
val e00 = err
//
val d2e1 =
tread22_d2exp(d2e1, err)
val dthn =
tread22_d2expopt(dthn, err)
val dels =
tread22_d2expopt(dels, err)
//
in//let
if
(e00=err)
then (d2e0) else
d2exp_ift0_errck
(d2e0.lctn(), d2e1, dthn, dels)
endlet // [ D1Eift0(d1e1,dthn,dels) ]
//
|
D2Eassgn _ => f0_assgn(d2e0, err)
//
|
D2Eannot _ => f0_annot(d2e0, err)
//
|
D2Et2pck _ => f0_t2pck(d2e0, err)
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
err := err+1; d2exp_errck(lvl0,d2e)
end (*let*) // end of [D2Enone0]
| _(*non-D2Enone0*) =>
let
val d2e1 =
tread22_d2exp(d2e1, err)
in//let
if
(e00=err)
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
d2e1 = tread22_d2exp(d2e1, err)
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
d2f0 = tread22_d2exp(d2f0, err)
val
d2es = tread22_d2explst(d2es, err)
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
tread22_d2explst(d2es, err)
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
d2el = tread22_d2exp(d2el, err)
val
d2er = tread22_d2exp(d2er, err)
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
d2e1 = tread22_d2exp(d2e1, err)
(*
val
s2e2 = tread22_s2exp(s2e2, err)
*)
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
d2e1 = tread22_d2exp(d2e1, err)
//
in//let
if
(e00=err)
then (d2e) else
let
val loc = d2e.lctn() in
d2exp_t2pck_errck(loc, d2e1, t2p2)
end (*let*) // end-of-[else]
end (*let*) // end of [f0_t2pck(d2e,err)]
//
(* ****** ****** *)
//
(*
val (  ) =
prerrln("tread22_d2exp: d2e0 = ", d2e0)
*)
//
(* ****** ****** *)
//
} (*where*)//end-[tread22_d2exp(d2e0,err)]
//
(* ****** ****** *)
//
#implfun
tread22_l2d2e
  (ld2e, err) =
let
//
val e00 = err
//
val+
D2LAB(lab0, d2e1) = ld2e
//
val
d2e1 = tread22_d2exp(d2e1, err)
//
in//let
if // if
(e00=err)
then (ld2e) else D2LAB(lab0, d2e1)
end (*let*)//end-(tread22_l2d2e(ld2e,err))
//
(* ****** ****** *)
//
(* ****** ****** *)
//
#implfun
tread22_f2arg
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
(*
val s2es =
tread22_s2explst(s2es, err)
*)
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
tread22_d2patlst(d2ps, err)
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
(*
val s2es =
tread22_s2explst(s2es, err)
*)
in//let
if
(e00=err)
then (farg) else
f2arg( farg.lctn(), F2ARGmet0(s2es) )
endlet // end of [ F2ARGmet0(  s2es  ) ]
//
) (*case+*)//end-[tread22_f2arg(farg,err)]
//
(* ****** ****** *)
//
#implfun
tread22_d2patlst
  (  d2ps, err  ) =
list_tread22_fnp(d2ps, err, tread22_d2pat)
//
(* ****** ****** *)
//
#implfun
tread22_d2explst
  (  d2es, err  ) =
list_tread22_fnp(d2es, err, tread22_d2exp)
//
#implfun
tread22_d2expopt
  (  dopt, err  ) =
optn_tread22_fnp(dopt, err, tread22_d2exp)
//
(* ****** ****** *)
//
#implfun
tread22_l2d2plst
  (  ldps, err  ) =
list_tread22_fnp(ldps, err, tread22_l2d2p)
#implfun
tread22_l2d2elst
  (  ldes, err  ) =
list_tread22_fnp(ldes, err, tread22_l2d2e)
//
(* ****** ****** *)
//
#implfun
tread22_f2arglst
  (  f2as, err  ) =
list_tread22_fnp(f2as, err, tread22_f2arg)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread22_dynexp.dats] *)
