(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
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
//
#staload
SYM = "./symbol.sats"
#staload
LOC = "./location.sats"
//
  typedef sym_t = $SYM.sym_t
  typedef loc_t = $LOC.loc_t
//
(* ****** ****** *)
//
#staload
D1E = "./dynexp1.sats"
//
  typedef d1ecl = $D1E.d1ecl
//
  typedef d1eclist = $D1E.d1eclist
//
(* ****** ****** *)
//
abstype d2cst_tbox
typedef d2cst = d2cst_tbox
//
typedef d2cstlst = List0(d2cst)
typedef d2cstopt = Option(d2cst)
//
(*
vtypedef d2cstlst_vt = List0_vt(d2cst)
vtypedef d2cstopt_vt = Option_vt(d2cst)
*)
//
(* ****** ****** *)
//
abstype d2con_tbox
typedef d2con = d2con_tbox
//
typedef d2conlst = List0(d2con)
typedef d2conopt = Option(d2con)
//
(*
vtypedef d2conlst_vt = List0_vt(d2con)
vtypedef d2conopt_vt = Option_vt(d2con)
*)
//
(* ****** ****** *)
//
abstype d2var_tbox
typedef d2var = d2var_tbox
//
typedef d2varlst = List0(d2var)
typedef d2varopt = Option(d2var)
//
(*
vtypedef d2varlst_vt = List0_vt(d2var)
vtypedef d2varopt_vt = Option_vt(d2var)
*)
//
(* ****** ****** *)

abstbox d2exp_tbox = ptr
typedef d2exp = d2exp_tbox
typedef d2explst = List0(d2exp)
typedef d2expopt = Option(d2exp)

(* ****** ****** *)

abstbox d2ecl_tbox = ptr
typedef d2ecl = d2ecl_tbox
typedef d2eclist = List0(d2ecl)
typedef d2eclopt = Option(d2ecl)

(* ****** ****** *)
//
datatype d2itm =
  | D2ITMcst of (d2cst)
  | D2ITMvar of (d2var)
  | D2ITMcon of (d2conlst)
//
(* ****** ****** *)
//
typedef d2itmopt = Option(d2itm)
vtypedef d2itmopt_vt = Option_vt(d2itm)
//
(* ****** ****** *)
//
fun
print_d2itm: print_type(d2itm)
fun
prerr_d2itm: prerr_type(d2itm)
fun
fprint_d2itm: fprint_type(d2itm)
//
overload print with print_d2itm
overload prerr with prerr_d2itm
overload fprint with fprint_d2itm
//
(* ****** ****** *)
//
datatype
d2ecl_node =
//
| D2Cnone of ()
| D2Cnone of (d1ecl)
//
| D2Clist of d2eclist // for list of declarations
//
| D2Cabssort of (d1ecl)
| D2Cstacst0 of (d1ecl)
| D2Csortdef of (d1ecl)
| D2Csexpdef of (d1ecl)
| D2Cabstype of (d1ecl)
| D2Cabsimpl of (d1ecl)
//
| D2Cdatasort of (d1ecl)
//
// end of [d2ecl_node]
//
(* ****** ****** *)
//
fun
d2ecl_get_loc(d2ecl): loc_t
fun
d2ecl_get_node(d2ecl): d2ecl_node
//
overload .loc with d2ecl_get_loc
overload .node with d2ecl_get_node
//
fun
print_d2ecl: print_type(d2ecl)
fun
prerr_d2ecl: prerr_type(d2ecl)
fun
fprint_d2ecl: fprint_type(d2ecl)
//
overload print with print_d2ecl
overload prerr with prerr_d2ecl
overload fprint with fprint_d2ecl
//
(* ****** ****** *)
//
fun
d2ecl_none0(loc: loc_t): d2ecl
fun
d2ecl_none1(d1c: d1ecl): d2ecl
//
fun
d2ecl_make_node
(loc: loc_t, node: d2ecl_node): d2ecl
//
(* ****** ****** *)

(* end of [xats_dynexp2.sats] *)
