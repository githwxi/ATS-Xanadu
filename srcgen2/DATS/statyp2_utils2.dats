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

#implfun
s2typlst_hnfize_flag
   ( t2ps, flag ) =
(
//
case+ t2ps of
|
list_nil() =>
list_nil()
|
list_cons
(t2p1, tps2) =>
let
//
val fval = flag
//
val t2p1 =
s2typ_hnfize_flag(t2p1, flag)
val tps2 =
s2typlst_hnfize_flag(tps2, flag)
//
in//let
if
flag > fval
then list_cons(t2p1, tps2) else t2ps
end (*let*) // end of [list_cons(...)]
//
) (*case+*) // end of [s2typlst_hnfize_flag(...)]

(* ****** ****** *)

#implfun
l2t2plst_hnfize_flag
   ( ltps, flag ) =
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
l2t2p_hnfize_flag(ltp1, flag)
val lts2 =
l2t2plst_hnfize_flag(lts2, flag)
//
in//let
if
flag > fval
then list_cons(ltp1, lts2) else ltps
end (*let*) // end of [list_cons(...)]
//
) (*case+*) // end of [l2t2plst_hnfize_flag(...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_statyp2_utils2.dats] *)
