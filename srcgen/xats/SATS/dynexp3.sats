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
//
abstbox d3exp_tbox = ptr
//
typedef d3exp = d3exp_tbox
typedef d3explst = List0(d3exp)
typedef d3expopt = Option(d3exp)
//
(* ****** ****** *)
//
abstbox d3ecl_tbox = ptr
//
typedef d3ecl = d3ecl_tbox
typedef d3eclist = List0(d3ecl)
typedef d3eclopt = Option(d3ecl)
//
(* ****** ****** *)

datatype
d3exp_node =
//
| D3Eint of (token)
| D3Echr of (token)
| D3Eflt of (token)
| D3Estr of (token)
//
| D3Evar of (d2var)
//
| D3Edapp of
  (d3exp, int(*npf*), d3explst)
//
| D3Etuple of
  (int(*knd*), int(*npf*), d3explst)
//
| D3Ecast of (d3exp, t2ype)
//
| D3Enone0 of ()
| D3Enone1 of (d2exp) | D3Enone2 of (d3exp)

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
d3exp_get_type
(d3e0: d3exp): t2ype
fun
d3explst_get_type
(d3es: d3explst): t2ypelst
fun
d3expopt_get_type
(opt0: d3expopt): t2ypeopt
//
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
//
fun
d3exp_none0_0
(loc0: loc_t): d3exp
fun
d3exp_none0_1
(loc0: loc_t, t2p0: t2ype): d3exp
//
fun
d3exp_none1_0
(d2e0: d2exp): d3exp
fun
d3exp_none1_1
(d2e0: d2exp, t2p0: t2ype): d3exp
//
fun
d3exp_none2_0(d3e0: d3exp): d3exp
//
(* ****** ****** *)
//
fun
d3exp_make_node
( loc0: loc_t
, t2p0: t2ype
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

fun
d3exp_cast
(d3e0: d3exp, t2p0: t2ype): d3exp

(* ****** ****** *)
//
datatype
f3undecl =
F3UNDECL of @{
  loc= loc_t
, nam= d2var
, arg= f2arglst
, res= effs2expopt
, def= d3expopt, wtp= s2expopt
}
//
typedef
f3undeclist = List0(f3undecl)
//
(* ****** ****** *)
//
fun
f3undecl_get_loc(f3undecl): loc_t
//
overload .loc with f3undecl_get_loc
//
(* ****** ****** *)
//
fun
print_f3undecl: print_type(f3undecl)
fun
prerr_f3undecl: prerr_type(f3undecl)
fun
fprint_f3undecl: fprint_type(f3undecl)
//
overload print with print_f3undecl
overload prerr with prerr_f3undecl
overload fprint with fprint_f3undecl
//
(* ****** ****** *)
//
datatype
d3ecl_node =
//
| D3Cnone0 of ()
| D3Cnone1 of (d2ecl)
//
| D3Cfundecl of
  ( token(*funkind*)
  , declmodopt, tq2arglst(*tmpargs*), f3undeclist)
//
// end of [d3ecl_node]
//
(* ****** ****** *)
//
fun
d3ecl_get_loc(d3ecl): loc_t
fun
d3ecl_get_node(d3ecl): d3ecl_node
//
overload .loc with d3ecl_get_loc
overload .node with d3ecl_get_node
//
(* ****** ****** *)
//
fun
print_d3ecl: print_type(d3ecl)
fun
prerr_d3ecl: prerr_type(d3ecl)
fun
fprint_d3ecl: fprint_type(d3ecl)
//
overload print with print_d3ecl
overload prerr with prerr_d3ecl
overload fprint with fprint_d3ecl
//
(* ****** ****** *)
//
fun d3ecl_none0(loc_t): d3ecl
fun d3ecl_none1(d2ecl): d3ecl
//
fun
d3ecl_make_node
(loc: loc_t, node: d3ecl_node): d3ecl
//
(* ****** ****** *)

(* end of [xats_dynexp3.sats] *)
