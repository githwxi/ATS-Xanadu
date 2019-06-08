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

#staload "./basics.sats"

(* ****** ****** *)

#staload "./staexp2.sats"
#staload "./statyp2.sats"
#staload "./dynexp2.sats"

(* ****** ****** *)

abstbox d3exp_tbox = ptr

(* ****** ****** *)

typedef d3exp = d3exp_tbox
typedef d3explst = List0(d3exp)
typedef d3expopt = Option(d3exp)

(* ****** ****** *)

datatype
d3exp_node =
//
| D3Eint of (token)
| D3Estr of (token)
//
| D2Evar of (d2var)
//
| D3Etuple of
  (int(*knd*), int(*npf*), d3explst)
//
| D3Enone0 of () | D3Enone1 of (d2exp)

(* ****** ****** *)
//
fun
d3exp_get_loc(d3exp): loc_t
fun
d3exp_get_node(d3exp): d3exp_node
//
overload .loc with d3exp_get_loc
overload .node with d3exp_get_node
//
(* ****** ****** *)
//
fun
d3exp_get_type(d3exp): t2ype
overload .type with d3exp_get_type
//
(*
fun
d3exp_set_type0
(d3e: d3exp, t2p: t2ype): void
fun
d3exp_set_type1
(d3e: d3exp, t2p: t2ype): d3exp
overload .type0 with d3exp_set_type0
overload .type1 with d3exp_set_type1
*)
//
(* ****** ****** *)

fun d3exp_none0(loc_t): d3exp
fun d3exp_none1(d2exp): d3exp

(* ****** ****** *)
//
fun
d3exp_make_node
( loc: loc_t
, t2p: t2ype
, node: d3exp_node): d3exp
//
(* ****** ****** *)
//
fun
print_d3exp: print_type(d3exp)
fun
prerr_d3exp: prerr_type(d3exp)
fun
fprint_d3exp: fprint_type(d3exp)
//
overload print with print_d3exp
overload prerr with prerr_d3exp
overload fprint with fprint_d3exp
//
(* ****** ****** *)

(* end of [xats_dynexp3.sats] *)
