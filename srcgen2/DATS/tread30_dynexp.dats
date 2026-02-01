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
#staload "./../SATS/tread30.sats"
(* ****** ****** *)
//
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
in//let
d3exp_make_node
(loc0, D3Eerrck(lvl0, d3e0))
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
(* ****** ****** *)
//
#implfun
tread30_d3pat
(evn0, d3p0, err0) =
(
       d3p0       )
where
{
(*
val () =
prerrsln("tread30_d3pat: d3p0 = ", d3p0)
*)
}(*where*)//end-of-[tread30_d3pat(evn0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#implfun
tread30_d3exp
(evn0, d3e0, err0) = d3e0
*)
#implfun
tread30_d3exp
(evn0, d3e0, err0) =
let
//
(*
val
loc0 = d3e0.lctn()
val () =
prerrsln
("tread30_d3exp: loc0 = ", loc0)
val () =
prerrsln
("tread30_d3exp: d3e0 = ", d3e0)
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
|
D3Etimp _ =>
(
f0_timp(evn0, d3e0, err0))
//
(* ****** ****** *)
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
! tr30evn
, d3e0: d3exp
, nerr: &sint >> _): d3exp =
let
//
val nerr = err0
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Etimp
( d3f0
, timp ) = d3e0.node()
//
val (  ) =
tr30evn_timp$psh(evn0, timp)
//
val timp =
tread30_timpl(evn0, timp, err0)
//
val (  ) = tr30evn_timp$pop(evn0)
val tmps = tr30evn_tmps$get(evn0)
//
in//let
if // if
(nerr=err0)
then (d3e0) else
(
d3exp_make_tpnd
(loc0, t2p0, D3Etimq(d3f0,timp,tmps)))
end(*let*)//end-of-[ f0_timp(env0,d3e0) ]
//
}(*where*)//end-of-[tread30_d3exp(evn0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_tread30_dynexp.dats] *)
(***********************************************************************)
