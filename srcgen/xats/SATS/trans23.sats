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
#staload S2T = "./statyp2.sats"
#staload D2E = "./dynexp2.sats"
//
#staload D3E = "./dynexp3.sats"
//
(* ****** ****** *)

typedef s2exp = $S2E.s2exp
typedef t2ype = $S2T.t2ype

typedef s2explst = $S2E.s2explst
typedef t2ypelst = $S2T.t2ypelst

(* ****** ****** *)

typedef d2pat = $D2E.d2pat
typedef d2exp = $D2E.d2exp
typedef d2ecl = $D2E.d2ecl

typedef d2patlst = $D2E.d2patlst
typedef d2expopt = $D2E.d2expopt
typedef d2explst = $D2E.d2explst

typedef d2eclist = $D2E.d2eclist

(* ****** ****** *)

typedef d3exp = $D3E.d3exp
typedef d3ecl = $D3E.d3ecl

typedef d3expopt = $D3E.d3expopt
typedef d3explst = $D3E.d3explst
typedef d3eclist = $D3E.d3eclist

(* ****** ****** *)

typedef f2undecl = $D2E.f2undecl
typedef v2aldecl = $D2E.v2aldecl
typedef v2ardecl = $D2E.v2ardecl

(* ****** ****** *)
//
fun
s2exp_of_d2pat(d2pat): s2exp
fun
t2ype_of_d2pat(d2pat): t2ype
//
fun
s2explst_of_d2patlst(d2patlst): s2explst
fun
t2ypelst_of_d2patlst(d2patlst): t2ypelst
//
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
  (d2e0: d2exp, t2p0: t2ype): (d3exp)
//
(* ****** ****** *)
//
fun
s2exp_of_f2undecl(f2undecl): s2exp
fun
s2exp_of_v2aldecl(v2aldecl): s2exp
fun
s2exp_of_v2ardecl(v2ardecl): s2exp
//
(* ****** ****** *)

fun
trans23_decl: d2ecl -> d3ecl 
fun
trans23_declist: d2eclist -> d3eclist

(* ****** ****** *)

(* end of [xats_trans23.sats] *)
