(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: June, 2020
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
//
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

implement
h0typ_none0() =
let
val s0t0 = HSTnone0()
val node = H0Tnone0()
in
h0typ_make_node(s0t0, node)
end

(* ****** ****** *)

local

absimpl
h0typ_tbox = $rec
{ 
  h0typ_sort= h0srt
, h0typ_node= h0typ_node
} (* absimpl *)

in (* in-of-local *)

(* ****** ****** *)

implement
h0typ_get_sort
  (htp) = htp.h0typ_sort
implement
h0typ_get_node
  (htp) = htp.h0typ_node

(* ****** ****** *)

implement
h0typ_make_node
  (s2t0, node) = $rec
{
  h0typ_sort= s2t0, h0typ_node= node
}

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

local

absimpl
htqarg_tbox = $rec
{ 
  htqarg_loc= loc_t
, htqarg_htvs= htvarlst
} (* absimpl *)

in (* in-of-local *)

(* ****** ****** *)

implement
htqarg_get_loc
  (htqa) = htqa.htqarg_loc
implement
htqarg_get_htvs
  (htqa) = htqa.htqarg_htvs

(* ****** ****** *)

implement
htqarg_make
  (loc0, htvs) = $rec
{
  htqarg_loc= loc0, htqarg_htvs= htvs
}

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_intrep0_statyp.dats] *)
