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
abstbox i0dnt_tbox
//
(*
typedef i0dnt = $rec
{
  i0dnt_loc= loc_t, i0dnt_sym= symbol
} (* end of [i0dnt] *)
*)
//
typedef i0dnt = i0dnt_tbox
typedef i0dntlst = List(i0dnt)
typedef i0dntopt = Option(i0dnt)
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
//
datatype
s0rtq_node =
  | S0RTQnone
  | S0RTQsymdot of symbol (* fileid *)
/*
  | S0RTQfiledot of string (* filename *)
*/
// end of [s0rtq_node]
//
typedef s0rtq = $rec
{
  s0rtq_loc= loc_t, s0rtq_node= s0rtq_node
} (* end of [s0rtq] *)
//
(* ****** ****** *)

fun s0rtq_none(loc: loc_t): s0rtq
fun s0rtq_symdot(ent1: i0dnt, tok2: token): s0rtq

(* ****** ****** *)

(* end of [xats_staexp0.sats] *)
