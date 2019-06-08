(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: April, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload "./basics.sats"
//
(* ****** ****** *)
//
#staload S2E = "./staexp2.sats"
#staload D2E = "./dynexp2.sats"
//
#staload D3E = "./dynexp3.sats"
//
(* ****** ****** *)

typedef s2exp = $S2E.s2exp

(* ****** ****** *)

typedef d2exp = $D2E.d2exp
typedef d2expopt = $D2E.d2expopt
typedef d2explst = $D2E.d2explst

(* ****** ****** *)

typedef d3exp = $D3E.d3exp
typedef d3expopt = $D3E.d3expopt
typedef d3explst = $D3E.d3explst

(* ****** ****** *)
//
fun
trans23_dexp: d2exp -> d3exp 
fun
trans23_dexpopt: d2expopt -> d3expopt
fun
trans23_dexplst: d2explst -> d3explst
//
(* ****** ****** *)
//
fun
trans23_dexp_dn
  (d2e0: d2exp, s2e0: s2exp): (d3exp)
//
(* ****** ****** *)

(* end of [xats_trans23.sats] *)
