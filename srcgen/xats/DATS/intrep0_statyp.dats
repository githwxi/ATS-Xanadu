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
#staload "./../SATS/stamp0.sats"
#staload "./../SATS/symbol.sats"
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)

#staload "./../SATS/intrep0.sats"

(* ****** ****** *)

local

typedef
htcst_struct = @{
//
  htcst_loc= loc_t
, htcst_sym= sym_t // name
, htcst_sort= h0srt // type
, htcst_stamp= stamp // unicity
//
} (* end of [htcst_tbox] *)

absimpl
htcst_tbox = ref(htcst_struct)

in(* in-of-local *)

implement
htcst_get_sym
(htc) = htc->htcst_sym
implement
htcst_get_stamp
(htc) = htc->htcst_stamp

implement
htcst_make_idst
(loc, sym, hst) =
(
ref<htcst_struct>
@{
  htcst_loc=loc
, htcst_sym=sym
, htcst_sort=hst
, htcst_stamp=stamp
}
) where
{
  val stamp = htcst_stamp_new()
}

end // end of [local]

(* ****** ****** *)

local

typedef
htvar_struct = @{
//
  htvar_sym= sym_t // name
, htvar_sort= h0srt // type
, htvar_stamp= stamp // unicity
//
} (* end of [htvar_tbox] *)

absimpl
htvar_tbox = ref(htvar_struct)

in(* in-of-local *)

implement
htvar_get_sym
(htv) = htv->htvar_sym
implement
htvar_get_stamp
(htv) = htv->htvar_stamp

implement
htvar_make_idst
(sym, hst) =
(
ref<htvar_struct>
@{
  htvar_sym=sym
, htvar_sort=hst
, htvar_stamp=stamp
}
) where
{
  val stamp = htvar_stamp_new()
}

end // end of [local]

(* ****** ****** *)

local

absimpl
h0typ_tbox = $rec
{ 
  h0typ_sort= h0srt
, h0typ_node= h0typ_node
} (* absimpl *)

in (* in-of-local *)
//
implement
h0typ_get_sort
  (h2t) = h2t.h0typ_sort
implement
h0typ_get_node
  (h2t) = h2t.h0typ_node
//
implement
h0typ_make_node
  (s2t0, node) = $rec
{
  h0typ_sort= s2t0, h0typ_node= node
}
//
end // end of [local]

(* ****** ****** *)

(* end of [xats_intrep0_statyp.dats] *)
