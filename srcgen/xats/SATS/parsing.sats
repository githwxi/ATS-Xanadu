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
// Start Time: June, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
SYM = "./symbol.sats"
typedef kword = $SYM.symbol
#staload
LOC = "./location.sats"
typedef loc_t = $LOC.location
//
(* ****** ****** *)
//
#staload
LEXING = "./lexing.sats"
//
  typedef tnode = $LEXING.tnode
  typedef token = $LEXING.token
//
(* ****** ****** *)
//
#staload
STAEXP0 = "./staexp0.sats"
//
  typedef i0nt = $STAEXP0.i0nt
  typedef i0dnt = $STAEXP0.i0dnt
//
  typedef s0rtq = $STAEXP0.s0rtq
//
(* ****** ****** *)
//
abstflat
tokbuf_tflat =
$extype"xats_tokbuf_struct"
//
  typedef tokbuf = tokbuf_tflat
//
(* ****** ****** *)

absvtbox tokbuf_mark = ptr

(* ****** ****** *)
//
fun
tokbuf_getok0
  (buf: &tokbuf >> _): token
fun
tokbuf_getok1
  (buf: &tokbuf >> _): token
//
fun
tokbuf_incby1
  (buf: &tokbuf >> _): (void)
//
overload .get0 with tokbuf_getok0
overload .get1 with tokbuf_getok1
overload .incby1 with tokbuf_incby1
//
(* ****** ****** *)
//
fun
tokbuf_get_mark
  (buf: &tokbuf >> _): tokbuf_mark
fun
tokbuf_set_mark
  (buf: &tokbuf >> _, mk0: tokbuf_mark): void
//
fun
tokbuf_clear_mark
  (buf: &tokbuf >> _, mk0: tokbuf_mark): void
//
(* ****** ****** *)
//
(*
typedef
parser(res:t@ype) =
(&tokbuf >> _) -> res
*)
//
typedef
parser(res:t@ype) =
(&tokbuf >> _, &int >> _) -> res
//
(* ****** ****** *)

fun p_i0nt: parser(i0nt)
fun p_i0dnt: parser(i0dnt)

(* ****** ****** *)
//
(*
s0rtq ::=
(IDENT_dlr DOT)?
*)
fun p_s0rtq: parser(s0rtq)
//
(* ****** ****** *)

datavtype
synent1
(a1:vtype) = SYNENT1 of (a1)
datavtype
synent2
( a1:vtype
, a2:vtype) = SYNENT2 of (a1, a2)
datavtype
synent3
( a1:vtype
, a2:vtype
, a3: vtype) = SYNENT3 of (a1, a2, a3)

(* ****** ****** *)
//
fun{}
synent_null: {a:type}() -> a
fun{}
synent_is_null: {a:type}(a) -> bool
fun{}
synent_isnot_null: {a:type}(a) -> bool
//
(* ****** ****** *)

fun
pstar_sep_fun
  {a:type}
(
  buf: &tokbuf >> _, err: &int >> _
, fsep: (tnode) -> bool, fpar: parser(a)
) : List0_vt(a) // end of [pstar_sep_fun]

(* ****** ****** *)

(* end of [xats_parsing.sats] *)
