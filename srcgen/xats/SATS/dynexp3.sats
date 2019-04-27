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
#staload "./dynexp2.sats"

(* ****** ****** *)
//
abstbox t2ype_tbox = ptr
typedef t2ype = t2ype_tbox
typedef t2ypelst = List0(t2ype)
//
(* ****** ****** *)
//
fun
print_t2ype: print_type(t2ype)
fun
prerr_t2ype: prerr_type(t2ype)
fun
fprint_t2ype: fprint_type(t2ype)
//
overload print with print_t2ype
overload prerr with prerr_t2ype
overload fprint with fprint_t2ype
//
(* ****** ****** *)
//
abstbox t2xtv_tbox
typedef t2xtv = t2xtv_tbox
//
abstype fc2ref_tbox
typedef fc2ref = fc2ref_tbox
//
(* ****** ****** *)

datatype
labt2ype =
| TLABELED of (label, t2ype)
where
labt2ypelst = List0(labt2ype)

(* ****** ****** *)
//
datatype
t2ype_node =
//
| T2Pnone of (sort2)
//
| T2Pcst of s2cst // constant
| T2Pvar of s2var // variable
//
| T2Extv of t2xtv // ext-variable
//
| T2Pfun of
  ( fc2ref(*funclo2*)
  , int(*npf*), t2ypelst(*arg*), t2ype(*res*)
  ) (* end of T2Pfun *)
//
| T2Ptuple of (tyrec, int(*npf*), labt2ypelst)
//
(* ****** ****** *)

abstbox d3exp_tbox = ptr

(* ****** ****** *)

typedef d3exp = d3exp_tbox
typedef d3explst = List0(d3exp)
typedef d3expopt = Option(d3exp)

(* ****** ****** *)

datatype
d3exp_node =
| D3Eint of token
| D3Enone0 of () | D3Enone1 of (d2exp)

(* ****** ****** *)
//
fun
d3exp_get_loc(d3exp): loc_t
fun
d3exp_get_type(d3exp): t2ype
fun
d3exp_get_node(d3exp): d3exp_node
//
overload .loc with d3exp_get_loc
overload .type with d3exp_get_type
overload .node with d3exp_get_node
//
(* ****** ****** *)

fun d3exp_none0(loc_t): d3exp
fun d3exp_none1(d2exp): d3exp

(* ****** ****** *)
//
fun
d3exp_make_node
(loc: loc_t, node: d3exp_node): d3exp
//
(* ****** ****** *)

(* end of [xats_dynexp3.sats] *)
