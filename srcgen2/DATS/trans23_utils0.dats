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
Fri 24 Feb 2023 04:49:55 PM EST
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
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trans23.sats"
(* ****** ****** *)
#staload _ = "./statyp2_tmplib.dats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
#symload styp with d3exp_get_styp
(* ****** ****** *)
//
fun
d3pat_make_styp_node
( loc0: loc_t
, t2p0: s2typ
, node: d3pat_node): d3pat =
let
val
d3p0 = d3pat(loc0, node)
in
  (d3p0.styp(t2p0); d3p0) end
//
fun
d3exp_make_styp_node
( loc0: loc_t
, t2p0: s2typ
, node: d3exp_node): d3exp =
let
val
d3e0 = d3exp(loc0, node)
in
  (d3e0.styp(t2p0); d3e0) end
//
#symload
d3pat with d3pat_make_styp_node
#symload
d3exp with d3exp_make_styp_node
//
(* ****** ****** *)

#implfun
trans23_d3exp_tpck
(env0, d3e0, t2p0) =
let
val loc0 = d3e0.lctn()
in//let
d3exp_make_styp_node
( loc0, t2p0, D3Et2pck(d3e0, t2p0))
end (*let*) // end of [trans23_d3exp_tpck(...)]

(* ****** ****** *)

#implfun
trans23_d3explst_tpck1
( env0 , d3es , t2p0 ) =
(
case+ d3es of
|
list_nil() => list_nil()
|
list_cons(d3e1, d3es) =>
list_cons(d3e1, d3es) where
{
val d3e1 =
trans23_d3exp_tpck(env0, d3e1, t2p0)
val d3es =
trans23_d3explst_tpck1(env0, d3es, t2p0)
}
) (*case+) // end of [trans23_d3explst_tpck1(...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans23_utils0.dats] *)
