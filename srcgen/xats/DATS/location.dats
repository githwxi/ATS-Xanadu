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
//
implement
{}(*tmp*)
position_initize
( pos0
, ntot, nrow, ncol) =
{
  val () = pos0.ntot := ntot
  val () = pos0.nrow := nrow
  val () = pos0.ncol := ncol
}
//
implement
{}(*tmp*)
position_copyfrom
  (pos0, pos1) =
{
  val () = pos0.ntot := pos1.ntot()
  val () = pos0.nrow := pos1.nrow()
  val () = pos0.ncol := pos1.ncol()
}
//
(* ****** ****** *)

implement
{}(*tmp*)
position_get_ntot(pos) = pos.ntot
implement
{}(*tmp*)
position_get_nrow(pos) = pos.nrow
implement
{}(*tmp*)
position_get_ncol(pos) = pos.ncol

(* ****** ****** *)
//
implement
{}(*tmp*)
position_set_ntot
  (pos, ntot) = (pos.ntot := ntot)
implement
{}(*tmp*)
position_set_nrow
  (pos, nrow) = (pos.nrow := nrow)
implement
{}(*tmp*)
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
//
implement
position_incby_1
  (pos) =
(
pos.ntot(pos.ntot()+1);
pos.ncol(pos.ncol()+1);
) (* end of [else] *)
//
implement
position_incby_eol
  (pos) =
(
pos.ntot(pos.ntot()+1);
pos.nrow(pos.nrow()+1); pos.ncol(0);
) (* end of [else] *)
//
implement
position_incby_char
  (pos, uc) =
(
if
(uc > 0)
then
(
pos.ntot(pos.ntot()+1);
if
(uc != '\n')
then
(
  pos.ncol(pos.ncol()+1)
) (* end of [then] *)
else
(
pos.nrow(pos.nrow()+1); pos.ncol(0);
) (* end of [else] *)
)
// end of [if]
) (* end of [position_incby_char] *)
//
implement
position_incby_text
  (pos, cs) = let
//
fun
loop
( pos
: &pos_t >> _
, p0: ptr
, nt: int
, nr: int, nc: int): void =
(
if
isneqz(c0)
then
(
if
(c0 != '\n')
then
loop(pos, p1, nt+1, nr, nc+1)
else
loop(pos, p1, nt+1, nr+1, 0(*nc*))
)
else
(
  pos.ntot(nt);
  pos.nrow(nr); pos.ncol(nc);
)
) where
{
  val p1 = ptr_succ<char>(p0)
  val c0 = $UN.ptr0_get<char>(p0)
}
//
in
//
loop
( pos
, string2ptr(cs)
, pos.ntot(), pos.nrow(), pos.ncol())
//
end // end of [position_incby_text]
//
implement
position_incby_neol
  (pos, cs) = let
  val n0 = length(cs)
in
  pos.ntot(pos.ntot()+sz2i(n0));
  pos.ncol(pos.ncol()+sz2i(n0));
end // end of [position_incby_neol]
//
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
//
implement
print_location
  (loc) = fprint_location(stdout_ref, loc)
implement
prerr_location
  (loc) = fprint_location(stderr_ref, loc)
//
(* ****** ****** *)

local

absreimpl
location_type

in (* in-of-local *)

implement
fprint_locrange
  (out, loc) = () where {
//
val () =
fprint!
( out
, loc.beg_ntot+1, "(line=", loc.beg_nrow+1, ", offs=", loc.beg_ncol+1, ")"
)
//
val () = fprint_string (out, " -- ")
//
val () =
fprint!
( out
, loc.end_ntot+1, "(line=", loc.end_nrow+1, ", offs=", loc.end_ncol+1, ")"
)
//
} (* end of [fprint_locrange] *)

end // end of [local]

(* ****** ****** *)

implement
fprint_location(out, loc) = fprint_locrange(out, loc)

(* ****** ****** *)

(* end of [xats_location.dats] *)
