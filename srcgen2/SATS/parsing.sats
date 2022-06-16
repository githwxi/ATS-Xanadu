(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
Start Time: June 13th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
LEX = "./lexing0.sats"
#typedef tnode = $LEX.tnode
#typedef token = $LEX.token
(* ****** ****** *)
//
#absvwtp tkbf0_vtbx
#vwtpdef tkbf0 = tkbf0_vtbx
//
(* ****** ****** *)
//
#typedef
p1_fun(r0:type) =
(!tkbf0, &int >> _)->(r0)
#typedef
pq_fun(r0:type) =
(!tkbf0, &int >> _)->optn(r0)
//
(* ****** ****** *)
//
fun
tokbuf_free(~tkbf0): void
#symload free with tokbuf_free
//
(* ****** ****** *)
//
fun
tokbuf_getk0(!tkbf0): token
fun
tokbuf_getk1(!tkbf0): token
fun
tokbuf_skip1(!tkbf0): (void)
//
#symload getk0 with tokbuf_getk0
#symload getk1 with tokbuf_getk1
#symload skip1 with tokbuf_skip1
//
fun
tokbuf_make_list_vt
  (tks: list_vt(token)): tkbf0
#symload tokbuf with tokbuf_make_list_vt
//
(* ****** ****** *)
//
fun p1_EQ0: p1_fun(token)
fun pq_EQ0: pq_fun(token)
//
fun p1_GT0: p1_fun(token)
//
fun p1_BAR: p1_fun(token)
fun pq_BAR: pq_fun(token)
//
fun p1_CLN: p1_fun(token)
//
fun p1_EQGT: p1_fun(token)
//
fun p1_GTDOT: p1_fun(token)
//
(* ****** ****** *)
//
fun pq_SMCLN: pq_fun(token)
//
(* ****** ****** *)
//
fun p1_LPAREN: p1_fun(token)
fun p1_RPAREN: p1_fun(token)
fun p1_LBRCKT: p1_fun(token)
fun p1_RBRCKT: p1_fun(token)
fun p1_LBRACE: p1_fun(token)
fun pq_LBRACE: pq_fun(token)
fun p1_RBRACE: p1_fun(token)
//
(* ****** ****** *)
//
fun p1_OF0: p1_fun(token)
//
fun p1_IN0: p1_fun(token)
fun pq_IN0: pq_fun(token)
//
fun p1_WITH: p1_fun(token)
//
(* ****** ****** *)
//
fun p1_END: p1_fun(token)
//
fun pq_ENDLAM: pq_fun(token)
fun pq_ENDFIX: pq_fun(token)
//
fun p1_ENDLET: p1_fun(token)
fun p1_ENDTRY: p1_fun(token)
fun p1_ENDLOC: p1_fun(token)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_parsing.sats] *)
