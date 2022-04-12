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

%{#
#include "CATS/locinfo.cats"
%} // end of [%{#]

(* ****** ****** *)

abstbox location_type = ptr
typedef loc_t = location_type
typedef location = location_type

(* ****** ****** *)
//
(*
HX: atstflt = atst@ype
*)
abstflt
position_tflt =
$extype"xats_position_struct"
typedef pos_t = position_tflt
typedef position = position_tflt
//
(* ****** ****** *)
//
#staload
FIL = "./filpath.sats"
  typedef fil_t = $FIL.filpath
  typedef filpath = $FIL.filpath
//
(* ****** ****** *)
//
fun{}
position_initize
( pos0: &pos_t? >> _
, ntot: int, nrow: int, ncol: int): void
//
fun{}
position_copyfrom
  (pos0: &pos_t? >> _, pos1: &pos_t): void
//
(* ****** ****** *)
//
fun{}
position_get_ntot : (&pos_t) -> int
fun{}
position_get_nrow : (&pos_t) -> int
fun{}
position_get_ncol : (&pos_t) -> int
//
overload .ntot with position_get_ntot
overload .nrow with position_get_nrow
overload .ncol with position_get_ncol
//
(* ****** ****** *)
//
fun{}
position_set_ntot
  (pos: &pos_t >> _, ntot: int): void
fun{}
position_set_nrow
  (pos: &pos_t >> _, nrow: int): void
fun{}
position_set_ncol
  (pos: &pos_t >> _, ncol: int): void
//
overload .ntot with position_set_ntot
overload .nrow with position_set_nrow
overload .ncol with position_set_ncol
//
(* ****** ****** *)
//
fun
print_position(pos: position): void
fun
prerr_position(pos: position): void
fun
fprint_position(out: FILEref, pos: position): void
//
overload print with print_position
overload prerr with prerr_position
overload fprint with fprint_position
//
(* ****** ****** *)
//
fun
position_incby_1
  (pos: &pos_t >> _): void
//
fun
position_incby_eol
  (pos: &pos_t >> _): void
//
fun
position_incby_char
  (pos: &pos_t >> _, uc: int): void
//
fun
position_incby_text
  (pos: &pos_t >> _, cs: string): void
fun
position_incby_neol
  (pos: &pos_t >> _, cs: string): void
//
(* ****** ****** *)
//
fun
location_filpath
  (loc: loc_t): fil_t
//
overload
.filpath with location_filpath
//
fun
location_beg_ntot(loc: loc_t): int
fun
location_beg_nrow(loc: loc_t): int
fun
location_beg_ncol(loc: loc_t): int
//
fun
location_end_ntot(loc: loc_t): int
fun
location_end_nrow(loc: loc_t): int
fun
location_end_ncol(loc: loc_t): int
//
overload .beg_ntot with location_beg_ntot
overload .beg_nrow with location_beg_nrow
overload .beg_ncol with location_beg_ncol
overload .end_ntot with location_end_ntot
overload .end_nrow with location_end_nrow
overload .end_ncol with location_end_ncol
//
(* ****** ****** *)
//
val
the_location_dummy: loc_t
//
fun
location_make_pos_pos
  (bpos: &pos_t, cpos: &pos_t): loc_t
fun
location_make_fil_pos_pos
  (fil: fil_t, bpos: &pos_t, cpos: &pos_t): loc_t
//
(* ****** ****** *)
//
fun
location_combine
  (loc1: loc_t, loc2: loc_t): loc_t
//
fun
location_leftmost(loc: loc_t): loc_t
fun
location_rightmost(loc: loc_t): loc_t
//
overload + with location_combine
overload leftmost with location_leftmost
overload rightmost with location_rightmost
//
(* ****** ****** *)
//
fun
print_location(loc: location): void
fun
prerr_location(loc: location): void
fun
fprint_locrange(out: FILEref, loc: location): void
fun
fprint_location(out: FILEref, loc: location): void
//
overload print with print_location
overload prerr with prerr_location
overload fprint with fprint_location
//
(* ****** ****** *)

(* end of [xats_locinfo.sats] *)
