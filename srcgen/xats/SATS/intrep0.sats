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
// Start Time: October, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2019-10-30:
// level-1 intermediate representation
//
(* ****** ****** *)
//
#staload
"./basics.sats"
#staload
"./locinfo.sats"
//
(* ****** ****** *)
//
#staload
LEX = "./lexing.sats"
//
typedef token = $LEX.token
//
(* ****** ****** *)

#staload
D1E = "./dynexp1.sats"
#staload
D2E = "./dynexp2.sats"
#staload
D3E = "./dynexp3.sats"

(* ****** ****** *)

typedef d2con = $D2E.d2con
typedef d2cst = $D2E.d2cst
typedef d2var = $D2E.d2var
typedef f2arg = $D2E.f2arg

typedef f2arglst = $D2E.f2arglst

(* ****** ****** *)
//
typedef d3pat = $D3E.d3pat
typedef f3arg = $D3E.f3arg
typedef d3exp = $D3E.d3exp
typedef d3ecl = $D3E.d3ecl
//
typedef d3patlst = $D3E.d3patlst
typedef f3arglst = $D3E.f3arglst
//
typedef d3expopt = $D3E.d3expopt
typedef d3explst = $D3E.d3explst
//
typedef d3eclist = $D3E.d3eclist
//
(* ****** ****** *)

abstype ir0pat_tbox = ptr
typedef ir0pat = ir0pat_tbox
typedef ir0patlst = List0(ir0pat)

(* ****** ****** *)

abstype ir0dcl_tbox = ptr
typedef ir0dcl = ir0dcl_tbox
typedef ir0dclist = List0(ir0dcl)

abstype ir0exp_tbox = ptr
typedef ir0exp = ir0exp_tbox
typedef ir0explst = List0(ir0exp)
typedef ir0expopt = Option(ir0exp)

(* ****** ****** *)
//
datatype
ir0pat_node =
//
| IR0Pint of (token)
| IR0Pbtf of (token)
//
| IR0Pany of ()
| IR0Pvar of (d2var)
//
| IR0Pcapp of (d2con, ir0patlst)
//
| IR0Ptuple of (int(*knd*), ir0patlst)
//
| IR0Pnone0 of () | IR0Pnone1 of (d3pat)
//
(* ****** ****** *)
//
fun
ir0pat_get_loc
(x0: ir0pat): loc_t
fun
ir0pat_get_node
(x0: ir0pat): ir0pat_node
//
overload
.loc with ir0pat_get_loc
overload
.node with ir0pat_get_node
//
(* ****** ****** *)
//
fun
ir0pat_make_node
(loc_t, ir0pat_node): ir0pat
//
(* ****** ****** *)
//
fun
print_ir0pat: print_type(ir0pat)
fun
prerr_ir0pat: prerr_type(ir0pat)
overload print with print_ir0pat
overload prerr with prerr_ir0pat
//
fun
fprint_ir0pat: fprint_type(ir0pat)
overload fprint with fprint_ir0pat
//
(* ****** ****** *)
//
datatype
ir0arg =
| IR0ARGsome of
  (int(*npf*), ir0patlst)
//
typedef
ir0arglst = List0(ir0arg)
typedef
ir0arglstopt = Option(ir0arglst)
//
(* ****** ****** *)
//
fun
print_ir0arg: print_type(ir0arg)
fun
prerr_ir0arg: prerr_type(ir0arg)
overload print with print_ir0arg
overload prerr with prerr_ir0arg
//
fun
fprint_ir0arg: fprint_type(ir0arg)
overload fprint with fprint_ir0arg
//
(* ****** ****** *)
//
datatype
ir0exp_node =
//
| IR0Eint of (token)
| IR0Ebtf of (token)
| IR0Estr of (token)
//
| IR0Evar of (d2var)
//
| IR0Econ1 of (d2con)
| IR0Ecst1 of (d2cst)
//
| IR0Efcst of (d2cst)
//
| IR0Edapp of
  ( ir0exp
  , int(*npf*), ir0explst)
//
| IR0Elet of (ir0dclist, ir0exp)
| IR0Ewhere of (ir0exp, ir0dclist)
//
| IR0Eif0 of
  ( ir0exp(*cond*)
  , ir0exp(*then*), ir0expopt(*else*))
//
| IR0Elam of
  (token(*knd*), ir0arglst, ir0exp)
| IR0Efix of
  (token(*knd*), d2var, ir0arglst, ir0exp)
//
| IR0Enone0 of () | IR0Enone1 of d3exp
//
(* ****** ****** *)
//
fun
ir0exp_get_loc
(x0: ir0exp): loc_t
fun
ir0exp_get_node
(x0: ir0exp): ir0exp_node
//
overload
.loc with ir0exp_get_loc
overload
.node with ir0exp_get_node
//
(* ****** ****** *)
//
fun
ir0exp_make_node
(loc_t, ir0exp_node): ir0exp
//
(* ****** ****** *)
//
fun
print_ir0exp: print_type(ir0exp)
fun
prerr_ir0exp: prerr_type(ir0exp)
overload print with print_ir0exp
overload prerr with prerr_ir0exp
//
fun
fprint_ir0exp: fprint_type(ir0exp)
overload fprint with fprint_ir0exp
//
(* ****** ****** *)
//
datatype
ir0valdecl =
IR0VALDECL of @{
  loc= loc_t
, pat= ir0pat
, def= ir0expopt
}
//
typedef
ir0valdeclist = List0(ir0valdecl)
//
fun
print_ir0valdecl(ir0valdecl): void
fun
prerr_ir0valdecl(ir0valdecl): void
fun
fprint_ir0valdecl: fprint_type(ir0valdecl)
//
overload print with print_ir0valdecl
overload prerr with prerr_ir0valdecl
overload fprint with fprint_ir0valdecl
//
(* ****** ****** *)
//
datatype
ir0fundecl =
IR0FUNDECL of @{
  loc= loc_t
//
, nam= d2var
, d2c= d2cst
//
, a2g=
  f2arglst
, a3g=
  ir0arglstopt
//
, def= ir0expopt
}
//
typedef
ir0fundeclist = List0(ir0fundecl)
//
fun
print_ir0fundecl(ir0fundecl): void
fun
prerr_ir0fundecl(ir0fundecl): void
fun
fprint_ir0fundecl: fprint_type(ir0fundecl)
//
overload print with print_ir0fundecl
overload prerr with prerr_ir0fundecl
overload fprint with fprint_ir0fundecl
//
(* ****** ****** *)
//
datatype
ir0dcl_node =
//
| IR0Cstatic of
  (token(*STATIC*), ir0dcl)
| IR0Cextern of
  (token(*EXTERN*), ir0dcl)
//
| IR0Clocal of
  (ir0dclist, ir0dclist)
//
| IR0Cvaldecl of
  ( token(*knd*)
  , $D1E.decmodopt, ir0valdeclist)
//
| IR0Cfundecl of
  ( token(*knd*)
  , $D1E.decmodopt
  , $D2E.tq2arglst, ir0fundeclist)
//
| IR0Cnone0 of () | IR0Cnone1 of (d3ecl)
//
(* ****** ****** *)
//
fun
ir0dcl_get_loc
(x0: ir0dcl): loc_t
fun
ir0dcl_get_node
(x0: ir0dcl): ir0dcl_node
//
overload
.loc with ir0dcl_get_loc
overload
.node with ir0dcl_get_node
//
(* ****** ****** *)
//
fun
ir0dcl_make_node
(loc_t, ir0dcl_node): ir0dcl
//
(* ****** ****** *)
//
fun
print_ir0dcl: print_type(ir0dcl)
fun
prerr_ir0dcl: prerr_type(ir0dcl)
overload print with print_ir0dcl
overload prerr with prerr_ir0dcl
//
fun
fprint_ir0dcl: fprint_type(ir0dcl)
overload fprint with fprint_ir0dcl
//
(* ****** ****** *)
//
fun
irerase_dpat(d3pat): ir0pat
fun
irerase_dpatlst(d3patlst): ir0patlst
//
(* ****** ****** *)
//
fun
irerase_farglst(f3arglst): ir0arglst
//
(* ****** ****** *)
//
fun
irerase_dexp(d3exp): ir0exp
fun
irerase_dexpopt(d3expopt): ir0expopt
fun
irerase_dexplst(d3explst): ir0explst
//
(* ****** ****** *)
//
fun
irerase_decl(d3ecl): ir0dcl
fun
irerase_declist(d3eclist): ir0dclist
//
(* ****** ****** *)
//
fun
irerase_valdecl
(irvd: $D3E.v3aldecl): ir0valdecl
fun
irerase_valdeclist
(irvds: $D3E.v3aldeclist): ir0valdeclist
//
(* ****** ****** *)
//
fun
irerase_fundecl
(irfd: $D3E.f3undecl): ir0fundecl
fun
irerase_fundeclist
(irfds: $D3E.f3undeclist): ir0fundeclist
//
(* ****** ****** *)

(* end of [intrep0.sats] *)
