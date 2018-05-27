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
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

%{#
#include "CATS/location.cats"
%} // end of [%{#]

(* ****** ****** *)

abstbox location_type
typedef loc_t = location_type
typedef location = location_type

(* ****** ****** *)
//
(*
HX: atstflat = atst@ype
*)
abstflat
position_tflat =
$extype"xats_position_struct"
  typedef pos_t = position_tflat
  typedef position = position_tflat
//
(* ****** ****** *)
//
#staload
FIL = "./filepath.sats"
  typedef fil_t = $FIL.filepath
  typedef filepath = $FIL.filepath
//
(* ****** ****** *)
//
fun
position_get_ntot : position -> int
fun
position_get_nrow : position -> int
fun
position_get_ncol : position -> int
//
overload .ntot with position_get_ntot
overload .nrow with position_get_nrow
overload .ncol with position_get_ncol
//
(* ****** ****** *)
//
fun
position_set_ntot : (position, int) -> void
fun
position_set_nrow : (position, int) -> void
fun
position_set_ncol : (position, int) -> void
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
location_make_pos_pos
  (bpos: pos_t, cpos: pos_t): loc_t
fun
location_make_fil_pos_pos
  (fil: fil_t, bpos: pos_t, cpos: pos_t): loc_t
//
(* ****** ****** *)

(* end of [xats_location.sats] *)
