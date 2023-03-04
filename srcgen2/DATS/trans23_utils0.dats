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

fun
d2cst_t2qag_t2jag
( dcst: d2cst
, loc0: loc_t
, t2qa: t2qag): t2jag =
let
//
#typedef x0 = s2var
#typedef y0 = s2typ
//
#impltmp
map$fopr<x0><y0>(s2v) =
s2typ_xtv
(x2t2p_make_lctn(loc0))
in
let
val s2vs = t2qa.s2vs()
val t2ps =
list_map<x0><y0>(s2vs)
in
  t2jag_make_t2ps(loc0, t2ps)
end
end(*let*)//end-of-[d2cst-t2qag-t2jag]

(* ****** ****** *)

#implfun
unify23_s2typ
(env0, t2p1, t2p2) =
let
//
#vwtpdef e1nv = tr23env
//
#impltmp
s2typ_eval$s2cst
<e1nv>(env0,s2c0) =
s2cst_get_styp(s2c0)
#impltmp
s2typ_eval$s2var
<e1nv>(env0,s2v0) = optn_vt_nil()
//
val () =
prerrln("unify23_s2typ: t2p1 = ", t2p1)
val () =
prerrln("unify23_s2typ: t2p2 = ", t2p2)
//
in//let
unify00_s2typ_e1nv<e1nv>(env0, t2p1, t2p2)
end (*let*) // end of [unify23_s2typ(env0,...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans23_utils0.dats] *)
