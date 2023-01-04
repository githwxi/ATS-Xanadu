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
Wed 28 Dec 2022 04:11:12 PM EST
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
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
(* ****** ****** *)
#staload _ = "./statyp2_tmplib.dats"
(* ****** ****** *)
//
#implfun
s2typlst_of_d2patlst
( d2ps ) =
(
list_map<x0><y0>(d2ps)) where
{
#typedef x0 = d2pat
#typedef y0 = s2typ
#impltmp
map$fopr<x0><y0>(d2p) = d2p.styp()
}
// end of [ s2typlst_of_d2patlst ]
//
(* ****** ****** *)
//
#implfun
s2typlst_of_d2explst
( d2es ) =
(
list_map<x0><y0>(d2es)) where
{
#typedef x0 = d2exp
#typedef y0 = s2typ
#impltmp
map$fopr<x0><y0>(d2e) = d2e.styp()
}
// end of [ s2typlst_of_d2explst ]
//
(* ****** ****** *)

#implfun
unify2a_s2typ
(env0, t2p1, t2p2) =
let
//
#vwtpdef e1nv = tr2aenv
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
prerrln("unify2a_s2typ: t2p1 = ", t2p1)
val () =
prerrln("unify2a_s2typ: t2p2 = ", t2p2)
//
in//let
unify00_s2typ_e1nv<e1nv>(env0, t2p1, t2p2)
end (*let*) // end of [unify2a_s2typ(env0,...)]

(* ****** ****** *)

#implfun
match2a_s2typ
(env0, t2p1, t2p2) =
let
//
#vwtpdef e1nv = tr2aenv
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
prerrln("match2a_s2typ: t2p1 = ", t2p1)
val () =
prerrln("match2a_s2typ: t2p2 = ", t2p2)
//
in//let
match00_s2typ_e1nv<e1nv>(env0, t2p1, t2p2)
end (*let*) // end of [match2a_s2typ(env0,...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans2a_utils0.dats] *)
