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
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload
FIL = "./../SATS/filpath.sats"

(* ****** ****** *)

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

local

(* ****** ****** *)

absimpl
position_tflt =
$extype_struct
"xats_position_struct" of
{
  ntot= int, nrow= int, ncol= int
} // end of [position_tflt]

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
  (pos) =
  fprint_position(stdout_ref, pos)
implement
prerr_position
  (pos) =
  fprint_position(stderr_ref, pos)
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
  out, "%i(line=%i,offs=%i)", ntot+1, nrow+1, ncol+1
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
  filpath=
  filpath // filpath
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
  filpath= fil
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
  $FIL.the_filpath_get()
} (* location_make_pos_pos *)

implement
location_make_fil_pos_pos
  (fil, bpos, cpos) = $rec
{
  filpath= fil
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

implement
location_filpath(loc) = loc.filpath
implement
location_beg_ntot(loc) = loc.beg_ntot
implement
location_beg_nrow(loc) = loc.beg_nrow
implement
location_beg_ncol(loc) = loc.beg_ncol
implement
location_end_ntot(loc) = loc.end_ntot
implement
location_end_nrow(loc) = loc.end_nrow
implement
location_end_ncol(loc) = loc.end_ncol

end // end of [local]

(* ****** ****** *)

implement
the_location_dummy =
let
//
  var
  bpos: pos_t
  var
  cpos: pos_t
//
  val () =
  position_initize(bpos, 0, 0, 0)
  val () =
  position_initize(cpos, 0, 0, 0)
//
in
  location_make_fil_pos_pos
    ($FIL.the_filpath_dummy, bpos, cpos)
end // end of [the_location_dummy]

(* ****** ****** *)

implement
location_combine
  (loc1, loc2) = let
//
  val fil1 = loc1.filpath()
  val fil2 = loc2.filpath()
//
local
  val ntot1 = loc1.beg_ntot()
  val nrow1 = loc1.beg_nrow()
  val ncol1 = loc1.beg_ncol()
  val ntot2 = loc2.beg_ntot()
  val nrow2 = loc2.beg_nrow()
  val ncol2 = loc2.beg_ncol()
in
  var bpos0: pos_t
  val ((*void*)) =
  position_initize
  ( bpos0
  , min(ntot1, ntot2)
  , min(nrow1, nrow2), min(ncol1, ncol2))
  // end of [val]
end // end of [local]
//
local
  val ntot1 = loc1.end_ntot()
  val nrow1 = loc1.end_nrow()
  val ncol1 = loc1.end_ncol()
  val ntot2 = loc2.end_ntot()
  val nrow2 = loc2.end_nrow()
  val ncol2 = loc2.end_ncol()
in
  var cpos0: pos_t
  val ((*void*)) =
  position_initize
  ( cpos0
  , max(ntot1, ntot2)
  , max(nrow1, nrow2), max(ncol1, ncol2))
  // end of [val]
end // end of [local]
//
in
  location_make_fil_pos_pos(fil1, bpos0, cpos0)
end // end of [location_combine]

(* ****** ****** *)

implement
location_leftmost
  (loc) = let
//
  val fil = loc.filpath()
//
  val ntot = loc.beg_ntot()
  val nrow = loc.beg_nrow()
  val ncol = loc.beg_ncol()
//
  var pos0: pos_t
  val ((*void*)) =
  position_initize
    (pos0, ntot, nrow, ncol)
  // end of [val]
in
  location_make_fil_pos_pos(fil, pos0, pos0)
end // end of [location_leftmost]

implement
location_rightmost
  (loc) = let
//
  val fil = loc.filpath()
//
  val ntot = loc.end_ntot()
  val nrow = loc.end_nrow()
  val ncol = loc.end_ncol()
//
  var pos0: pos_t
  val ((*void*)) =
  position_initize
    (pos0, ntot, nrow, ncol)
  // end of [val]
in
  location_make_fil_pos_pos(fil, pos0, pos0)
end // end of [location_rightmost]

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

in (*in-of-local*)

implement
fprint_locrange
( out, loc ) = () where
{
//
val () =
fprint!
( out
, loc.beg_ntot+1
, "(line=", loc.beg_nrow+1
, ",offs=", loc.beg_ncol+1, ")"
)
//
val () =
fprint_string(out, "--")
//
val () =
fprint!
( out
, loc.end_ntot+1
, "(line=", loc.end_nrow+1
, ",offs=", loc.end_ncol+1, ")"
)
//
} (* end of [fprint_locrange] *)

end // end of [local]

(* ****** ****** *)
//
implement
fprint_location
( out, loc ) =
(
fprint!(out, "@");
fprint!(out, "(");
fprint_locrange(out, loc);
fprint!(out, ")");
) where
{
//
  val fp0 = 
  location_filpath(loc)
  val ((*void*)) =
  $FIL.fprint_filpath_full1(out, fp0)
//
} (* end of [fprint_location] *)
//
(* ****** ****** *)

(* end of [xats_locinfo.dats] *)
