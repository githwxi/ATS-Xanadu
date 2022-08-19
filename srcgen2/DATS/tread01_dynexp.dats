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
Mon Aug 15 17:35:46 EDT 2022
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
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/tread01.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d1pat_get_lctn
#symload node with d1pat_get_node
(* ****** ****** *)
#symload lctn with d1exp_get_lctn
#symload node with d1exp_get_node
(* ****** ****** *)
//
fun
d1pat_errck
(lvl: sint
,d1p: d1pat): d1pat =
(
d1pat
(d1p.lctn(), D1Perrck(lvl, d1p))
) (*case+*) //end-of-[d1pat_errck(_,_)]
//
(* ****** ****** *)
//
fun
d1pat_errvl_a1
(d1p: d1pat): sint =
(
case+ d1p.node() of
|
D1Perrck
(lvl, _) => lvl | _ => 0
)
#symload
d1pat_errvl with d1pat_errvl_a1
#symload errvl with d1pat_errvl_a1
//
(* ****** ****** *)
//
fun
d1pat_errvl_a2
(dp1: d1pat
,dp2: d1pat): sint =
gmax
(errvl(dp1),errvl(dp2))
#symload
d1pat_errvl with d1pat_errvl_a2
#symload errvl with d1pat_errvl_a2
//
(* ****** ****** *)

#implfun
tread01_d1pat
  (d1p0, err) =
(
case+
d1p0.node() of
//
| D1Pid0 _ => d1p0
//
| D1Pint _ => d1p0
| D1Pchr _ => d1p0
| D1Pflt _ => d1p0
| D1Pstr _ => d1p0
//
|
_(*otherwise*) =>
(err := err+1; d1pat_errck(1, d1p0))
//
) where
{
//
val loc0 = d1p0.lctn()
//
val (  ) =
prerrln("tread01_d1pat: d1p0 = ", d1p0)
//
} (*where*)//end(tread01_d1pat(d1p0,err))

(* ****** ****** *)
//
fun
d1exp_errck
(lvl: sint
,d1e: d1exp): d1exp =
(
d1exp
(d1e.lctn(), D1Eerrck(lvl, d1e))
) (*case+*) // end-of-[d1exp_errck(_,_)]
//
(* ****** ****** *)
//
fun
d1exp_errvl_a1
(d1e: d1exp): sint =
(
case+ d1e.node() of
|
D1Eerrck
(lvl, _) => lvl | _ => 0
)
#symload
d1exp_errvl with d1exp_errvl_a1
#symload errvl with d1exp_errvl_a1
//
(* ****** ****** *)
//
fun
d1exp_errvl_a2
(de1: d1exp
,de2: d1exp): sint =
gmax
(errvl(de1),errvl(de2))
#symload
d1exp_errvl with d1exp_errvl_a2
#symload errvl with d1exp_errvl_a2
//
(* ****** ****** *)

#implfun
tread01_d1exp
  (d1e0, err) =
(
case+
d1e0.node() of
//
| D1Eid0 _ => d1e0
//
| D1Eint _ => d1e0
| D1Echr _ => d1e0
| D1Eflt _ => d1e0
| D1Estr _ => d1e0
//
|
_(*otherwise*) =>
(err := err+1; d1exp_errck(1, d1e0))
//
) where
{
//
val loc0 = d1e0.lctn()
//
val (  ) =
prerrln("tread01_d1exp: loc0 = ", loc0)
val (  ) =
prerrln("tread01_d1exp: d1e0 = ", d1e0)
//
} (*where*)//end(tread01_d1exp(d1e0,err))

(* ****** ****** *)

#implfun
tread01_d1patlst
  (  d1ps, err  ) =
list_tread01_fnp(d1ps, err, tread01_d1pat)

(* ****** ****** *)

#implfun
tread01_d1explst
  (  d1es, err  ) =
list_tread01_fnp(d1es, err, tread01_d1exp)

(* ****** ****** *)

(* end of [ATS3/XATSOPT_tread01_dynexp.dats] *)