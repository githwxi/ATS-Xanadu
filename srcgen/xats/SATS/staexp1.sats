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
// Start Time: August, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
LAB = "./label0.sats"
#staload
LOC = "./location.sats"
//
typedef label = $LAB.label
typedef loc_t = $LOC.location
//
#staload
LEX = "./lexing.sats"
typedef token = $LEX.token
//
#staload
SYM = "./symbol.sats"
typedef symbol = $SYM.symbol
//
(* ****** ****** *)
//
abstbox sort1_tbox = ptr
abstbox s1exp_tbox = ptr
//
(* ****** ****** *)
//
typedef sort1 = sort1_tbox
typedef sort1lst = List0(sort1)
typedef sort1opt = Option(sort1)
//
typedef s1exp = s1exp_tbox
typedef s1explst = List0(s1exp)
typedef s1expopt = Option(s1exp)
//
(* ****** ****** *)

datatype
sort1_node =
//
  | S1Tid of token
//
// HX-2018-08: operators
//
  | S1Tapp of () // application
  | S1Tinf of sort1 // backslash
//
  | S1Ttype of int(*kind*)
    (*prop/view/type/t0ype/viewtype/viewt0ype*)
//
  | S1Tapps of (sort1, sort1lst)
  | S1Tlist of sort1lst // temporary
  | S1Tqual of (token, sort1)
  | S1Tnone of ((*error indication*))
// end of [sort1_node]

(* ****** ****** *)
//
fun
sort1_get_loc(sort1): loc_t
fun
sort1_get_node(sort1): sort1_node
//
overload .loc with sort1_get_loc
overload .node with sort1_get_node
//
fun print_sort1 : print_type(sort1)
fun prerr_sort1 : prerr_type(sort1)
fun fprint_sort1 : fprint_type(sort1)
//
overload print with print_sort1
overload prerr with prerr_sort1
overload fprint with fprint_sort1
//
fun
sort1_none(loc: loc_t): sort1
fun
sort1_make_node
(loc: loc_t, node: sort1_node): sort1
//
(* ****** ****** *)
//
abstbox s1arg_tbox = ptr
typedef s1arg = s1arg_tbox
typedef s1arglst = List0(s1arg)
//
datatype
s1arg_node =
//
| S1ARGsome of (token, sort1opt)
//
fun
s1arg_get_loc(s1arg): loc_t
fun
s1arg_get_node(s1arg): s1arg_node
//
overload .loc with s1arg_get_loc
overload .node with s1arg_get_node
//
fun print_s1arg : print_type(s1arg)
fun prerr_s1arg : prerr_type(s1arg)
fun fprint_s1arg : fprint_type(s1arg)
//
overload print with print_s1arg
overload prerr with prerr_s1arg
overload fprint with fprint_s1arg
//
fun
s1arg_make_node
(loc: loc_t, node: s1arg_node): s1arg
//
(* ****** ****** *)
//
abstbox s1marg_tbox = ptr
typedef s1marg = s1marg_tbox
typedef s1marglst = List0(s1marg)
//
datatype
s1marg_node = S1MARGlist of (s1arglst)
//
fun
s1marg_get_loc(s1marg): loc_t
fun
s1marg_get_node(s1marg): s1marg_node
//
overload .loc with s1marg_get_loc
overload .node with s1marg_get_node
//
fun print_s1marg : print_type(s1marg)
fun prerr_s1marg : prerr_type(s1marg)
fun fprint_s1marg : fprint_type(s1marg)
//
overload print with print_s1marg
overload prerr with prerr_s1marg
overload fprint with fprint_s1marg
//
fun
s1marg_make_node
(loc: loc_t, node: s1marg_node): s1marg
//
(* ****** ****** *)
//
abstbox
s1rtdef_tbox = ptr
typedef
s1rtdef = s1rtdef_tbox
//
datatype
s1rtdef_node =
| S1RTDEFsort of sort1
| S1RTDEFsubset of (s1arg, s1explst)
//
fun
s1rtdef_get_loc(s1rtdef): loc_t
fun
s1rtdef_get_node(s1rtdef): s1rtdef_node
//
overload .loc with s1rtdef_get_loc
overload .node with s1rtdef_get_node
//
fun print_s1rtdef : print_type(s1rtdef)
fun prerr_s1rtdef : prerr_type(s1rtdef)
fun fprint_s1rtdef : fprint_type(s1rtdef)
//
overload print with print_s1rtdef
overload prerr with prerr_s1rtdef
overload fprint with fprint_s1rtdef
//
fun
s1rtdef_make_node
(loc: loc_t, node: s1rtdef_node): s1rtdef
//
(* ****** ****** *)

datatype
s1exp_node =
//
  | S1Eid of token
//
  | S1Eint of token
//
// HX-2018-08: operators:
//
  | S1Eapp of () // application
  | S1Einf of s1exp // backslash
//
  | S1Eapps of (s1exp, s1explst)
  | S1Elist of s1explst // temporary
  | S1Equal of (token, s1exp)
  | S1Enone of ((*error indication*))
// end of [s1exp_node]

(* ****** ****** *)
//
fun
s1exp_get_loc(s1exp): loc_t
fun
s1exp_get_node(s1exp): s1exp_node
//
overload .loc with s1exp_get_loc
overload .node with s1exp_get_node
//
fun print_s1exp : print_type(s1exp)
fun prerr_s1exp : prerr_type(s1exp)
fun fprint_s1exp : fprint_type(s1exp)
//
overload print with print_s1exp
overload prerr with prerr_s1exp
overload fprint with fprint_s1exp
//
fun
s1exp_none(loc: loc_t): s1exp
fun
s1exp_make_node
(loc: loc_t, node: s1exp_node): s1exp
//
(* ****** ****** *)

(* end of [xats_staexp1.sats] *)
