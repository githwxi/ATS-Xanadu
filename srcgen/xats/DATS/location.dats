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

#staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

#staload "./../SATS/location.sats"

(* ****** ****** *)

local

(* ****** ****** *)

absimpl
position_tflat =
$extype_struct
"xats_position_struct" of
{
  ntot= int, nrow= int, ncol= int
} // end of [position_tflat]

(* ****** ****** *)

in (* in-of-local *)

(* ****** ****** *)

implement
position_get_ntot(pos) = pos.ntot
implement
position_get_nrow(pos) = pos.nrow
implement
position_get_ncol(pos) = pos.ncol

(* ****** ****** *)
//
implement
position_set_ntot
  (pos, ntot) = (pos.ntot := ntot)
implement
position_set_nrow
  (pos, nrow) = (pos.nrow := nrow)
implement
position_set_ncol
  (pos, ncol) = (pos.ncol := ncol)
//
(* ****** ****** *)
//
implement
print_position
  (pos) = fprint_position(stdout_ref, pos)
implement
prerr_position
  (pos) = fprint_position(stderr_ref, pos)
//
(* ****** ****** *)

implement
fprint_position
  (out, pos) = let
//
val ntot = pos.ntot
val nrow = pos.nrow
val ncol = pos.ncol
//
in
//
$extfcall
(
  void
,
  "fprintf"
,
  out, "%i(line=%i, offs=%i)", ntot+1, nrow+1, ncol+1
) (* end of [val] *)
//
end // end of [fprint_position]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
location_type =
$rec{
//
  filepath=
  filepath // filepath
//
, beg_ntot= int // beginning char position
, beg_nrow= int
, beg_ncol= int
, end_ntot= int // finishing char position
, end_nrow= int
, end_ncol= int
//
(*
, locpragma= locpragma
*)
//
} (* end of [location_type] *)

in (* in-of-local *)

implement
location_make_pos_pos
  (bpos, cpos) = $rec
{
  filepath= fil
//
, beg_ntot=bpos.ntot()
, beg_nrow=bpos.nrow()
, beg_ncol=bpos.ncol()
//
, end_ntot=cpos.ntot()
, end_nrow=cpos.nrow()
, end_ncol=cpos.ncol()
//
} where
{
  val fil =
  $FIL.filepath_get_current()
} (* location_make_pos_pos *)

implement
location_make_fil_pos_pos
  (fil, bpos, cpos) = $rec
{
  filepath= fil
//
, beg_ntot=bpos.ntot()
, beg_nrow=bpos.nrow()
, beg_ncol=bpos.ncol()
//
, end_ntot=cpos.ntot()
, end_nrow=cpos.nrow()
, end_ncol=cpos.ncol()
//
} (* location_make_fil_pos_pos *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_location.dats] *)
