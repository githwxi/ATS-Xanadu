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
// Start Time: September, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload "./basics.sats"
//
(* ****** ****** *)

#staload "./label0.sats"
#staload "./locinfo.sats"

(* ****** ****** *)
//
#staload S2E = "./staexp2.sats"
#staload S2T = "./statyp2.sats"
#staload D2E = "./dynexp2.sats"
//
#staload D3E = "./dynexp3.sats"
//
(* ****** ****** *)

typedef d2pat = $D2E.d2pat
typedef d3pat = $D3E.d3pat

typedef d2exp = $D2E.d2exp
typedef d3exp = $D3E.d3exp

typedef d3patlst = $D3E.d3patlst
typedef d3patopt = $D3E.d3patopt
typedef d3explst = $D3E.d3explst
typedef d3expopt = $D3E.d3expopt

typedef f3arglst = $D3E.f3arglst

(* ****** ****** *)
//
fun
trans33_dpat: d3pat -> d3pat
fun
trans33_dpatlst: d3patlst -> d3patlst
//
(* ****** ****** *)

fun
trans33_farglst: f3arglst -> f3arglst

(* ****** ****** *)
//
fun
trans33_dexp: d3exp -> d3exp 
fun
trans33_dexpopt: d3expopt -> d3expopt
fun
trans33_dexplst: d3explst -> d3explst
//
(* ****** ****** *)

(* end of [xats_trans33.sats] *)
