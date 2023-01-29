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
} (*where*)//end[tread22_d2pat(d2p0,err)]
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
|D2Esym0 _ => d2e0
//
|D2Etup0 _ => f0_tup0(d2e0, err)
(*
|D2Etup1 _ => f0_tup1(d2e0, err)
|D2Ercd2 _ => f0_rcd2(d2e0, err)
*)
//
|
D2Eassgn _ => f0_assgn(d2e0, err)
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
#implfun
tread22_l2d2elst
  (  ldes, err  ) =
list_tread22_fnp(ldes, err, tread22_l2d2e)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread22_dynexp.dats] *)
