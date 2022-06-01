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
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt"
(* ****** ****** *)
//
%{#
#include "CATS/lexbuf0.cats"
%} // end of [%{#]
//
(* ****** ****** *)
//
#staload CBS =
"./../UTIL/SATS/cblist0.sats"
//
typedef cblist = $CBS.cblist
//
(* ****** ****** *)
//
#staload LOC = "./locinfo.sats"
//
typedef pos_t = $LOC.pos_t
typedef loc_t = $LOC.loc_t
typedef position = $LOC.position
typedef location = $LOC.location
//
(* ****** ****** *)
//
abstflt
lexbuf_tflt =
$extype"xats_lexbuf_struct"
//
typedef lexbuf = lexbuf_tflt
//
(* ****** ****** *)

fun
lexbuf_initize_cblist
(
  buf: &lexbuf? >> _, cbs: cblist
) : void // end of [lexbuf_initize_cblist]

(* ****** ****** *)
//
(*
fun
lexbuf_get_ntot(buf: &lexbuf): int
fun
lexbuf_get_nspc(buf: &lexbuf): int
*)
//
(* ****** ****** *)
//
fun
lexbuf_get_none
  (buf: &lexbuf >> _): void
fun
lexbuf_get_fullseg
  (buf: &lexbuf >> _): string
//
(* ****** ****** *)
//
// HX-2018-05-27:
// [lexbuf_getc] is like getc
// [lexbuf_unget] can be safely
// applied only once at a given
// position!
//
fun
lexbuf_getc(buf: &lexbuf >> _): int
fun
lexbuf_unget
  (buf: &lexbuf >> _, i0: int): void
//
(* ****** ****** *)
//
(*
fun
lexbuf_get_pos
(
  buf: &lexbuf, pos: &pos_t? >> _
) : void // end-of-fun
*)
//
(*
fun
lexbuf_set_pos
(buf: &lexbuf >> _, pos: &pos_t): void
*)
//
(* ****** ****** *)
(*
//
fun
lexbufpos_get_loc
  (buf: &lexbuf, pos: &pos_t): loc_t
//
*)
(* ****** ****** *)

(* end of [xats_lexbuf0.sats] *)
