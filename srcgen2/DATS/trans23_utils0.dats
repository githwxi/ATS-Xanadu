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
#symload styp with d3exp_set_styp
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
( env0 
, loc0, d3es , t2p0 ) =
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
trans23_d3explst_tpck1(env0, loc0, d3es, t2p0)
}
) (*case+*) // end of [trans23_d3explst_tpck1(...)]

(* ****** ****** *)

#implfun
trans23_d3explst_tpcks
( env0
, loc0, d3es , t2ps ) =
(
case+ d3es of
|
list_nil() =>
(
case+ t2ps of
|
list_nil() =>
list_nil((*void*))
|
list_cons(t2p1, t2ps) =>
list_cons(d3e1, d3es) where
{
//
val
d3e1 = d3exp_none0(loc0)
//
val d3e1 =
trans23_d3exp_tpck(env0, d3e1, t2p1)
val d3es =
trans23_d3explst_tpcks(env0, loc0, d3es, t2ps)
}
)
|
list_cons(d3e1, d3es) =>
(
case+ t2ps of
|
list_nil() =>
list_cons(d3e1, d3es) where
{
//
val
t2p1 = s2typ_none0((*void*))
//
val d3e1 =
trans23_d3exp_tpck(env0, d3e1, t2p1)
val d3es =
trans23_d3explst_tpcks(env0, loc0, d3es, t2ps)
}
|
list_cons(t2p1, t2ps) =>
list_cons(d3e1, d3es) where
{
val d3e1 =
trans23_d3exp_tpck(env0, d3e1, t2p1)
val d3es =
trans23_d3explst_tpcks(env0, loc0, d3es, t2ps)
}
)
) (*case+*) // end of [trans23_d3explst_tpcks(...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans23_utils0.dats] *)
