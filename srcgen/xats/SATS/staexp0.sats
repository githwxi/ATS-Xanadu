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
//
#staload
LOC = "./location.sats"
//
typedef loc_t = $LOC.location
//
staload LEX = "./lexing.sats"
staload SYM = "./symbol.sats"
//
typedef token = $LEX.token
typedef tokenopt = $LEX.tokenopt
//
typedef symbol = $SYM.symbol
typedef symbolist = $SYM.symbolist
typedef symbolopt = $SYM.symbolopt
//
(* ****** ****** *)
//
typedef tkint = token // int
typedef tkchr = token // char
typedef tkflt = token // float
typedef tkstr = token // string
//
typedef tkintopt = Option(tkint)
typedef tkstropt = Option(tkstr)
//
(* ****** ****** *)
//
abstbox i0nt_tbox = ptr
abstbox i0dnt_tbox = ptr
//
(* ****** ****** *)
//
typedef s0tid = i0dnt_tbox
typedef s0eid = i0dnt_tbox
//
(* ****** ****** *)
//
datatype
i0nt_node =
  | I0NTnone of token
  | I0NTsome of token
//
datatype
i0dnt_node =
  | I0DNTnone of token
  | I0DNTsome of token
//
(* ****** ****** *)
(*
typedef i0nt = $rec
{
  i0nt_loc= loc_t, i0nt_node= symbol
} (* end of [i0dnt] *)
typedef i0dnt = $rec
{
  i0dnt_loc= loc_t, i0dnt_node= symbol
} (* end of [i0dnt] *)
*)
//
typedef i0nt = i0nt_tbox
//
fun
i0nt_get_loc
  : (i0nt) -> loc_t
fun
i0nt_get_node
  : (i0nt) -> i0nt_node
//
overload .loc with i0nt_get_loc
overload .node with i0nt_get_node
//
fun i0nt_none : token -> i0nt
fun i0nt_some : token -> i0nt
//
fun print_i0nt : (i0nt) -> void
fun prerr_i0nt : (i0nt) -> void
fun fprint_i0nt : fprint_type(i0nt)
//
overload print with print_i0nt
overload prerr with prerr_i0nt
overload fprint with fprint_i0nt
//
(* ****** ****** *)
//
typedef i0dnt = i0dnt_tbox
typedef i0dntlst = List(i0dnt)
typedef i0dntopt = Option(i0dnt)
//
fun
i0dnt_get_loc
  : (i0dnt) -> loc_t
fun
i0dnt_get_node
  : (i0dnt) -> i0dnt_node
//
overload .loc with i0dnt_get_loc
overload .node with i0dnt_get_node
//
fun i0dnt_none : token -> i0dnt
fun i0dnt_some : token -> i0dnt
//
(* ****** ****** *)
//
fun print_i0dnt : i0dnt -> void
fun prerr_i0dnt : i0dnt -> void
fun fprint_i0dnt : fprint_type(i0dnt)
//
overload print with print_i0dnt
overload prerr with prerr_i0dnt
overload fprint with fprint_i0dnt
//
(* ****** ****** *)

abstbox sort0_tbox = ptr
typedef sort0 = sort0_tbox

datatype
sort0_node =
//
| S0Tid of (s0tid)
//
| S0Tapp of (sort0lst) // HX: unsupported
//
| S0Tlist of (token, sort0lst, token) (* for temporary use *)
//
| S0Tqual of (token, sort0) // HX: qualified
(*
| S0Ttype of int (* prop/view/type/t0ype/viewtype/viewt0ype *)
*)
| S0Tnone of (token)
// end of [sort0_node]

where sort0lst = List0(sort0)

(* ****** ****** *)
//
fun
sort0_get_loc(sort0): loc_t
fun
sort0_get_node(sort0): sort0_node
//
overload .loc with sort0_get_loc
overload .node with sort0_get_node
//
fun print_sort0 : (sort0) -> void
fun prerr_sort0 : (sort0) -> void
fun fprint_sort0 : fprint_type(sort0)
//
overload print with print_sort0
overload prerr with prerr_sort0
overload fprint with fprint_sort0
//
fun
sort0_make_node
(loc: loc_t, node: sort0_node): sort0
//
(* ****** ****** *)

abstbox s0exp_tbox = ptr
typedef s0exp = s0exp_tbox
typedef s0explst = List0(s0exp)
typedef s0expopt = Option(s0exp)

datatype
s0exp_node =
//
| S0Eid of (s0eid)
// end of [s0exp_node]

(* ****** ****** *)
//
fun
s0exp_get_loc(s0exp): loc_t
fun
s0exp_get_node(s0exp): s0exp_node
//
overload .loc with s0exp_get_loc
overload .node with s0exp_get_node
//
fun print_s0exp : (s0exp) -> void
fun prerr_s0exp : (s0exp) -> void
fun fprint_s0exp : fprint_type(s0exp)
//
overload print with print_s0exp
overload prerr with prerr_s0exp
overload fprint with fprint_s0exp
//
fun
s0exp_make_node
(loc: loc_t, node: s0exp_node): s0exp
//
(* ****** ****** *)

(* end of [xats_staexp0.sats] *)
