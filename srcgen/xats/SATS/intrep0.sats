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
#staload"./basics.sats"
//
#staload"./label0.sats"
#staload"./filpath.sats"
#staload"./locinfo.sats"
//
(* ****** ****** *)
//
#staload
LEX = "./lexing.sats"
//
typedef token = $LEX.token
//
(* ****** ****** *)
//
#staload D1E = "./dynexp1.sats"
//
#staload S2E = "./staexp2.sats"
#staload S2T = "./statyp2.sats"
#staload D2E = "./dynexp2.sats"
//
#staload D3E = "./dynexp3.sats"
//
(* ****** ****** *)

typedef d1exp = $D1E.d1exp

(* ****** ****** *)

typedef s2exp = $S2T.s2exp
typedef t2ype = $S2T.t2ype
typedef t2ypelst = $S2T.t2ypelst

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
typedef d3gua = $D3E.d3gua
typedef d3clau = $D3E.d3clau
typedef d3gpat = $D3E.d3gpat
//
typedef d3patlst = $D3E.d3patlst
typedef f3arglst = $D3E.f3arglst
//
typedef d3expopt = $D3E.d3expopt
typedef d3explst = $D3E.d3explst
//
typedef d3eclist = $D3E.d3eclist
//
typedef d3gualst = $D3E.d3gualst
typedef d3claulst = $D3E.d3claulst
//
(* ****** ****** *)

typedef ti2arg = $D2E.ti2arg
typedef ti3arg = $D3E.ti3arg
typedef ti2arglst = $D2E.ti2arglst

(* ****** ****** *)

abstype ir0pat_tbox = ptr
typedef ir0pat = ir0pat_tbox
typedef ir0patlst = List0(ir0pat)

(* ****** ****** *)
//
abstype ir0dcl_tbox = ptr
typedef ir0dcl = ir0dcl_tbox
typedef ir0dclist = List0(ir0dcl)
//
typedef ir0dclistopt = Option(ir0dclist)
//
(* ****** ****** *)

abstype ir0exp_tbox = ptr
typedef ir0exp = ir0exp_tbox
typedef ir0explst = List0(ir0exp)
typedef ir0expopt = Option(ir0exp)

(* ****** ****** *)

abstype ir0gua_tbox = ptr
typedef ir0gua = ir0gua_tbox
typedef ir0gualst = List0(ir0gua)

abstype ir0clau_tbox = ptr
typedef ir0clau = ir0clau_tbox
typedef ir0claulst = List0(ir0clau)

abstype ir0gpat_tbox = ptr
typedef ir0gpat = ir0gpat_tbox
typedef ir0gpatlst = List0(ir0gpat)

(* ****** ****** *)
//
datatype
ir0pat_node =
//
| IR0Pnil of ()
| IR0Pany of ()
//
| IR0Pint of (token)
| IR0Pbtf of (token)
//
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
| IR0Etcst of
  ( d2cst
  , ti3arg, ti2arglst)
//
| IR0Etimp of
  ( ir0exp, t2ypelst(*targ*)
  , ir0dcl, t2ypelst(*tsub*))
//
| IR0Edapp of
  ( ir0exp
  , int(*npf*), ir0explst)
//
| IR0Eproj of
  ( ir0exp(*rcd*)
  , label(*proj*), int(*index*))
//
| IR0Elet of (ir0dclist, ir0exp)
| IR0Ewhere of (ir0exp, ir0dclist)
//
| IR0Eseqn of
  (ir0explst(*semi*), ir0exp(*last*))
//
| IR0Etuple of
  (int(*knd*), int(*npf*), ir0explst)
//
| IR0Eassgn of
  (ir0exp(*left*), ir0exp(*right*))
//
| IR0Eif0 of
  ( ir0exp(*cond*)
  , ir0exp(*then*), ir0expopt(*else*))
//
| IR0Ecase of
  (int(*knd*), ir0exp, ir0claulst)
//
| IR0Elam of
  (int(*knd*), ir0arglst, ir0exp)
| IR0Efix of
  (int(*knd*), d2var, ir0arglst, ir0exp)
//
| IR0Eaddr of (ir0exp(*l-value*))
//
| IR0Eflat of (ir0exp(*l-value*))
| IR0Etalf of (ir0exp(*IR0Eflat*))
//
| IR0Enone0 of () | IR0Enone1 of d3exp
//
(* ****** ****** *)
//
datatype
ir0gua_node =
| IR0GUAexp of (ir0exp)
| IR0GUAmat of (ir0exp, ir0pat)
//
datatype
ir0clau_node =
| IR0CLAUpat of ir0gpat
| IR0CLAUexp of (ir0gpat, ir0exp)
and
ir0gpat_node =
| IR0GPATpat of (ir0pat)
| IR0GPATgua of (ir0pat, ir0gualst)
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
overload .loc with ir0exp_get_loc
overload .node with ir0exp_get_node
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
fun
ir0gua_get_loc
(x0: ir0gua): loc_t
fun
ir0gua_get_node
(x0: ir0gua): ir0gua_node
//
overload .loc with ir0gua_get_loc
overload .node with ir0gua_get_node
//
(* ****** ****** *)
//
fun
ir0gua_make_node
(loc_t, ir0gua_node): ir0gua
//
(* ****** ****** *)
//
fun
print_ir0gua: print_type(ir0gua)
fun
prerr_ir0gua: prerr_type(ir0gua)
overload print with print_ir0gua
overload prerr with prerr_ir0gua
//
fun
fprint_ir0gua: fprint_type(ir0gua)
overload fprint with fprint_ir0gua
//
(* ****** ****** *)
//
fun
ir0clau_get_loc
(x0: ir0clau): loc_t
fun
ir0clau_get_node
(x0: ir0clau): ir0clau_node
//
overload .loc with ir0clau_get_loc
overload .node with ir0clau_get_node
//
(* ****** ****** *)
//
fun
ir0clau_make_node
(loc_t, ir0clau_node): ir0clau
//
(* ****** ****** *)
//
fun
ir0gpat_get_loc
(x0: ir0gpat): loc_t
fun
ir0gpat_get_node
(x0: ir0gpat): ir0gpat_node
//
overload .loc with ir0gpat_get_loc
overload .node with ir0gpat_get_node
//
(* ****** ****** *)
//
fun
ir0gpat_make_node
(loc_t, ir0gpat_node): ir0gpat
//
(* ****** ****** *)
//
fun
print_ir0clau:print_type(ir0clau)
fun
prerr_ir0clau:prerr_type(ir0clau)
overload print with print_ir0clau
overload prerr with prerr_ir0clau
//
fun
print_ir0gpat:print_type(ir0gpat)
fun
prerr_ir0gpat:prerr_type(ir0gpat)
overload print with print_ir0gpat
overload prerr with prerr_ir0gpat
//
fun
fprint_ir0clau:fprint_type(ir0clau)
overload fprint with fprint_ir0clau
fun
fprint_ir0gpat:fprint_type(ir0gpat)
overload fprint with fprint_ir0gpat
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
ir0vardecl =
IR0VARDECL of @{
  loc= loc_t
, d2v= d2var
, ini= ir0expopt
}
//
typedef
ir0vardeclist = List0(ir0vardecl)
//
fun
print_ir0vardecl(ir0vardecl): void
fun
prerr_ir0vardecl(ir0vardecl): void
fun
fprint_ir0vardecl: fprint_type(ir0vardecl)
//
overload print with print_ir0vardecl
overload prerr with prerr_ir0vardecl
overload fprint with fprint_ir0vardecl
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
| IR0Cinclude of
  ( token
  , d1exp // src
  , int(*knd*) // sta/dyn: 0/1
  , filpathopt
  , ir0dclistopt) // file inclusion
//
| IR0Clocal of
  (ir0dclist, ir0dclist)
//
| IR0Cvaldecl of
  ( token(*knd*)
  , $D1E.decmodopt, ir0valdeclist)
//
| IR0Cvardecl of
  ( token(*knd*)
  , $D1E.decmodopt, ir0vardeclist)
//
| IR0Cfundecl of
  ( token(*knd*)
  , $D1E.decmodopt
  , $D2E.tq2arglst, ir0fundeclist)
//
| IR0Cimpdecl3 of
  ( token(*impkind*)
  , $D1E.decmodopt
  , $D2E.sq2arglst
  , $D2E.tq2arglst
  , $D2E.impld2cst
  , $D3E.ti3arg
  , $D2E.ti2arglst
  , ir0arglst, ir0exp)
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

fun
irerase_dgua(d3gua): ir0gua
fun
irerase_dclau(d3clau): ir0clau
fun
irerase_dgpat(d3gpat): ir0gpat
fun
irerase_dgualst(d3gualst): ir0gualst
fun
irerase_dclaulst(d3claulst): ir0claulst

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
irerase_vardecl
(irvd: $D3E.v3ardecl): ir0vardecl
fun
irerase_vardeclist
(irvds: $D3E.v3ardeclist): ir0vardeclist
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
