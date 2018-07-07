(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: April, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./staexp0.sats"

(* ****** ****** *)

typedef d0eid = i0dnt_tbox

(* ****** ****** *)

abstype d0exp_tbox = ptr
typedef d0exp = d0exp_tbox
typedef d0explst = List0(d0exp)
typedef d0expopt = Option(d0exp)

datatype
d0exp_node =
//
| D0Eid of d0eid
// end of [d0exp_node]

(* ****** ****** *)
//
fun
d0exp_get_loc(d0exp): loc_t
fun
d0exp_get_node(d0exp): d0exp_node
//
overload .loc with d0exp_get_loc
overload .node with d0exp_get_node
//
fun print_d0exp : (d0exp) -> void
fun prerr_d0exp : (d0exp) -> void
fun fprint_d0exp : fprint_type(d0exp)
//
overload print with print_d0exp
overload prerr with prerr_d0exp
overload fprint with fprint_d0exp
//
fun
d0exp_make_node
(loc: loc_t, node: d0exp_node): d0exp
//
(* ****** ****** *)

(* end of [xats_dynexp0.sats] *)
