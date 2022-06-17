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
Start Time: June 17th, 2022
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
(* ****** ****** *)
#staload "./../SATS/preadx0.sats"
(* ****** ****** *)
//
fun
sort0_errck
(s0t: sort0): sort0 =
sort0(s0t.lctn(), S0Terrck(s0t))
//
(* ****** ****** *)
//
#implfun
prdx0_sort0
(st0, err) =
let
val e00 = err
in//let
case+
s0t.node() of
|
S0Tid0 _ => st0
|
S0Tint _ => st0
|
S0Tqid _ =>
(err := e00+1; sort0_errck(s0t))
|
S0Tapps _ =>
(err := e00+1; sort0_errck(s0t))
//
|
S0Tlist _ =>
(err := e00+1; sort0_errck(s0t))
//
|
S0Ttkerr _ =>
(err := e00+1; sort0_errck(s0t))
//
| S0Terrck _ =>
(err := e00+1; sort0_errck(s0t))
end (* let *) // end of [prdx0_sort0]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_preadx0_staexp.dats] *)
