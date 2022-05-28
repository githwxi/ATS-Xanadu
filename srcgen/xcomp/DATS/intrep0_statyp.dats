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

local
//
typedef
htcst_struct = @{
//
  htcst_loc= loc_t
, htcst_sym= sym_t // name
, htcst_sort= h0srt // type
, htcst_stamp= stamp // unicity
//
, htcst_abstdf2= h0typopt
//
, htcst_hconlst= Option(h0conlst)
//
} (* end of [htcst_tbox] *)
//
absimpl
htcst_tbox = ref(htcst_struct)
//
in(* in-of-local *)

(* ****** ****** *)
//
implement
htcst_get_sym
(htc) = htc->htcst_sym
implement
htcst_get_sort
(htc) = htc->htcst_sort
implement
htcst_get_stamp
(htc) = htc->htcst_stamp
//
(* ****** ****** *)
//
implement
htcst_get_abstdf2
(htc) = htc->htcst_abstdf2
implement
htcst_set_abstdf2
(htc, h0t) =
(htc->htcst_abstdf2 := Some(h0t))
//
(* ****** ****** *)
//
implement
htcst_get_hconlst
(htc) = htc->htcst_hconlst
implement
htcst_set_hconlst
(htc, h0cs) =
(htc->htcst_hconlst := Some(h0cs))
//
(* ****** ****** *)

implement
htcst_make_idst
(loc, sym, hst) =
(
ref<htcst_struct>
@{
  htcst_loc=loc
, htcst_sym=sym
, htcst_sort=hst
, htcst_stamp=stmp
//
, htcst_abstdf2= None()
//
, htcst_hconlst= None()
//
}
) where
{
val stmp = htcst_stamp_new()
}

end // end of [local]

(* ****** ****** *)
implement
eq_htcst_htcst
  ( x1, x2 ) =
( x1.stamp() = x2.stamp() )
(* ****** ****** *)
implement
htcst_isdat(x0) =
(
case+
x0.hconlst() of
Some _ => true | None _ => false
)
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
//
absimpl
htvar_tbox = ref(htvar_struct)

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

(* ****** ****** *)

implement
htvar_get_sym
(htv) = htv->htvar_sym
implement
htvar_get_sort
(htv) = htv->htvar_sort
implement
htvar_get_stamp
(htv) = htv->htvar_stamp

(* ****** ****** *)

implement
htvar_make_idst
  (sym, hst) =
(
ref<htvar_struct>
@{
  htvar_sym=sym
, htvar_sort=hst
, htvar_stamp=stmp
}
) where
{
val stmp = htvar_stamp_new()
}

(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)
implement
eq_htvar_htvar(x1, x2) =
( x1.stamp() = x2.stamp() )
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

(* ****** ****** *)
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

end (*local*) // end of [local]

(* ****** ****** *)

local

absimpl
htqarg_tbox = $rec
{ 
  htqarg_loc= loc_t
, htqarg_htvs= htvarlst
} (* absimpl *)

(* ****** ****** *)
in (* in-of-local *)
(* ****** ****** *)

(* ****** ****** *)
//
implement
htqarg_get_loc
  (htqa) = htqa.htqarg_loc
implement
htqarg_get_htvs
  (htqa) = htqa.htqarg_htvs
//
(* ****** ****** *)

implement
htqarg_make_htvarlst
  (loc0, htvs) = $rec
{
  htqarg_loc= loc0, htqarg_htvs= htvs
} (* end of [htqarg_make_htvarlst] *)

(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

(* end of [xats_intrep0_statyp.dats] *)
