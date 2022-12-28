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
Sat 24 Dec 2022 12:34:55 PM EST
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
#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)

#impltmp
< e1nv >
l2t2p_hnfizx_e1nv
(e1nv, lt2p, flag) =
(
//
case+ lt2p of
|
S2LAB(l0, t2p1) =>
let
val fval = flag
val t2p1 =
s2typ_hnfizx_e1nv(e1nv, t2p1, flag)
in//let
if // if
flag > fval then S2LAB(l0, t2p1) else lt2p
end (*let*) // end of [S2LAB(...)]
//
) (*case+*) // end-of-[l2t2p_hnfizx(e1nv,...)]

(* ****** ****** *)

#impltmp
< e1nv >
s2typlst_hnfizx_e1nv
( e1nv, t2ps, flag ) =
(
//
case+ t2ps of
|
list_nil() => list_nil()
|
list_cons
(t2p1, tps2) =>
let
//
val fval = flag
//
val t2p1 =
s2typ_hnfizx_e1nv(e1nv, t2p1, flag)
val tps2 =
s2typlst_hnfizx_e1nv(e1nv, tps2, flag)
//
in//let
if // if
flag > fval then list_cons(t2p1, tps2) else t2ps
end (*let*) // end of [list_cons(...)]
//
) (*case+*) // end of [s2typlst_hnfizx(e1nv,...)]

(* ****** ****** *)

#impltmp
< e1nv >
l2t2plst_hnfizx_e1nv
( e1nv, ltps, flag ) =
(
//
case+ ltps of
|
list_nil() => list_nil()
|
list_cons
(ltp1, lts2) =>
let
//
val fval = flag
//
val ltp1 =
l2t2p_hnfizx_e1nv(e1nv, ltp1, flag)
val lts2 =
l2t2plst_hnfizx_e1nv(e1nv, lts2, flag)
//
in//let
if // if
flag > fval then list_cons(ltp1, lts2) else ltps
end (*let*) // end of [list_cons(...)]
//
) (*case+*) // end of [l2t2plst_hnfizx(e1nv,...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_statyp2_utils2.dats] *)
