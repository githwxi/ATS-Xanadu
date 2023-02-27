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
Sun 26 Feb 2023 10:20:07 AM EST
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
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
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
} (*where*)//end[tread23_d3pat(d3p0,err)]
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
(e00=err)
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
//
| _(*otherwise*) =>
let
val lvl0 = 1
in//let
(
err := err+1; d3exp_errck(lvl0,d3e0))
endlet // end of [ _(* otherwise *) ]
//
) where // end-of-[(*case+(d3e0)-of*)]
{
} (*where*)//end[tread23_d3exp(d3e0,err)]
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
(e00=err)
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
|F3ARGsta0 _ => farg
|F3ARGmet0 _ => farg
//
|
F3ARGdyn0
(npf1, d3ps) =>
let
val e00 = err
val d3ps =
tread23_d3patlst(d3ps, err)
in//let
if
(e00=err)
then (farg) else
f3arg
(farg.lctn(), F3ARGdyn0(npf1, d3ps))
endlet // end of [F3ARGdyn0(npf1,d3ps)]
//
) (*case+*)//end-[tread23_f3arg(farg,err)]
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
#implfun
tread23_f3arglst
  (  f3as, err  ) =
list_tread23_fnp(f3as, err, tread23_f3arg)
(* ****** ****** *)
#implfun
tread23_d3eclist
  (  dcls, err  ) =
list_tread23_fnp(dcls, err, tread23_d3ecl)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread23_dynexp.dats] *)
