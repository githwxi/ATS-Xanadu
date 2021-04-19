(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: March 27, 2021
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#staload "./xbasics.sats"
(* ****** ****** *)
#staload "./locinfo.sats"
(* ****** ****** *)

#staload S2E = "./staexp2.sats"
#staload S2T = "./statyp2.sats"

(* ****** ****** *)
//
typedef s2exp = $S2E.s2exp
typedef t2ype = $S2T.t2ype
//
(* ****** ****** *)
//
abstbox c0str_tbox = ptr
typedef c0str = c0str_tbox
typedef c0strlst = List0(c0str)
typedef c0stropt = Option(c0str)
typedef c0strlstopt = Option(c0strlst)
//
(* ****** ****** *)
//
datatype
c0str_node =
//
| C0Seqeq of (s2exp, s2exp)
//
| C0Stsub of (s2exp, s2exp) // sub
| C0Stequ of (s2exp, s2exp) // sub and sup
//
(* ****** ****** *)
//
fun
c0str_get_loc
( c0s: c0str ): loc_t
fun
c0str_get_node
( c0s: c0str ): c0str_node
//
overload .loc with c0str_get_loc
overload .node with c0str_get_node
//
fun
print_c0str : print_type(c0str)
fun
prerr_c0str : prerr_type(c0str)
fun
fprint_c0str : fprint_type(c0str)
//
overload print with print_c0str
overload prerr with prerr_c0str
overload fprint with fprint_c0str
//
fun
c0str_get_store
( c0s: c0str ): c0strlstopt
fun
c0str_make_node
( loc0
: loc_t, node: c0str_node): c0str
//
(* ****** ****** *)
//
fun
c0str_make_tasmp
( loc0: loc_t
, s2e1: s2exp, s2e2: s2exp): c0str
fun
c0str_make_tcast
( loc0: loc_t
, s2e1: s2exp, s2e2: s2exp): c0str
//
(* ****** ****** *)

(* end of [xats_cstrnt0.sats] *)
