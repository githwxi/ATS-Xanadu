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
#staload "./../SATS/basics.sats"
#staload "./../SATS/stamp0.sats"
#staload "./../SATS/symbol.sats"
#staload "./../SATS/lexing.sats"
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)

local
//
(*
HX-2020-09-13:
The tag of a constructor is
nonnegative if the constructor
is associated with a datatype.
Otherwise, the tag is set to be
-1 to indicate the constructor
is associated with 'exception'.
*)
//
typedef tag_t = int
//
typedef
hdcon_struct = @{
//
  hdcon_loc= loc_t // loc
, hdcon_sym= sym_t // name
, hdcon_tag= tag_t // tag
, hdcon_type= h0typ // type
, hdcon_dvar = hdvar // r-time
, hdcon_stamp= stamp // unicity
//
} (* end of [hdcon_tbox] *)

absimpl
hdcon_tbox = ref(hdcon_struct)

in(* in-of-local *)

implement
hdcon_get_loc
(hdc) = hdc->hdcon_loc
implement
hdcon_get_sym
(hdc) = hdc->hdcon_sym
//
implement
hdcon_get_tag
(hdc) = hdc->hdcon_tag
implement
hdcon_set_tag
(hdc, tag) =
(hdc->hdcon_tag := tag)
//
implement
hdcon_get_dvar
(hdc) = hdc->hdcon_dvar
//
implement
hdcon_get_stamp
(hdc) = hdc->hdcon_stamp

implement
hdcon_make_idtp
(loc, sym, htp) =
(
ref<hdcon_struct>
@{
  hdcon_loc=loc
, hdcon_sym=sym
, hdcon_tag=(~1)
, hdcon_type=htp
, hdcon_dvar=hdv
, hdcon_stamp=stamp
}
) where
{
//
  val knd =
  T_EOF(*void*)
  val hdv =
  hdvar_make_idtp
  (loc, sym, knd, htp)
//
  val
  stamp = hdcon_stamp_new()
//
}

end // end of [local]

(* ****** ****** *)

local

typedef
hdcst_struct = @{
//
  hdcst_loc= loc_t // loc
, hdcst_sym= sym_t // name
, hdcst_kind= tnode // kind
, hdcst_type= h0typ // type
, hdcst_stamp= stamp // unicity
//
} (* end of [hdcon_tbox] *)

absimpl
hdcst_tbox = ref(hdcst_struct)

in(* in-of-local *)

implement
hdcst_get_loc
(hdc) = hdc->hdcst_loc
implement
hdcst_get_sym
(hdc) = hdc->hdcst_sym
//
implement
hdcst_get_kind
(hdc) = hdc->hdcst_kind
implement
hdcst_get_stamp
(hdc) = hdc->hdcst_stamp

implement
hdcst_make_idtp
( loc
, sym, knd, htp) =
(
ref<hdcst_struct>
@{
  hdcst_loc=loc
, hdcst_sym=sym
, hdcst_kind=knd
, hdcst_type=htp
, hdcst_stamp=stamp
}
) where
{
  val stamp = hdcst_stamp_new()
}

end // end of [local]

(* ****** ****** *)

implement
hdcst_fcastq(hdc) =
let
val
knd = hdcst_get_kind(hdc)
in
//
case+ knd of
|
T_FUN(fnk) =>
(
case+ fnk of
| FNKfcast() => true
| _(*non-FNKfcast*) => false
)
(*
  | T_VAL(vlk) => false
*)
| _ (* rest-of-tnode *) => false
//
end // end of [hdcst_iscast]

(* ****** ****** *)

local

typedef
hdvar_struct = @{
//
  hdvar_loc= loc_t // loc
, hdvar_sym= sym_t // name
, hdvar_kind= tnode // kind
, hdvar_type= h0typ // type
, hdvar_stamp= stamp // unicity
//
} (* end of [hdvar_tbox] *)

absimpl
hdvar_tbox = ref(hdvar_struct)

in(* in-of-local *)

implement
hdvar_get_loc
(hdv) = hdv->hdvar_loc
implement
hdvar_get_sym
(hdv) = hdv->hdvar_sym
//
implement
hdvar_get_kind
(hdv) = hdv->hdvar_kind
implement
hdvar_get_stamp
(hdv) = hdv->hdvar_stamp

implement
hdvar_make_idtp
( loc
, sym, knd, htp) =
(
ref<hdvar_struct>
@{
  hdvar_loc=loc
, hdvar_sym=sym
, hdvar_kind=knd
, hdvar_type=htp
, hdvar_stamp=stamp
}
) where
{
  val stamp = hdvar_stamp_new()
}

end // end of [local]

(* ****** ****** *)

local
//
absimpl
h0pat_tbox = $rec
{ h0pat_loc= loc_t
, h0pat_type= h0typ
, h0pat_node= h0pat_node
} (* end of [absimpl] *)
//
in (* in-of-local *)
//
implement
h0pat_get_loc
  (h0p) = h0p.h0pat_loc
//
implement
h0pat_get_type
  (h0p) = h0p.h0pat_type
//
implement
h0pat_get_node
  (h0p) = h0p.h0pat_node
//
implement
h0pat_make_node
(
loc0, h0t0, node
) = $rec
{ h0pat_loc= loc0
, h0pat_type= h0t0, h0pat_node= node
} (* h0pat_make_node *)
//
end // end of [local]

(* ****** ****** *)

local
//
absimpl
hfarg_tbox = $rec
{ hfarg_loc= loc_t
, hfarg_node= hfarg_node
} (* end of [absimpl] *)
//
in (* in-of-local *)
//
implement
hfarg_get_loc
  (hfa) = hfa.hfarg_loc
//
implement
hfarg_get_node
  (hfa) = hfa.hfarg_node
//
implement
hfarg_make_node
(loc0, node) = $rec
{
hfarg_loc= loc0, hfarg_node= node
} (* hfarg_make_node *)
//
end // end of [local]

(* ****** ****** *)

local
//
absimpl
h0exp_tbox = $rec
{ h0exp_loc= loc_t
, h0exp_type= h0typ
, h0exp_node= h0exp_node
} (* end of [absimpl] *)
//
in (* in-of-local *)
//
implement
h0exp_get_loc
  (h0e) = h0e.h0exp_loc
//
implement
h0exp_get_type
  (h0e) = h0e.h0exp_type
//
implement
h0exp_get_node
  (h0e) = h0e.h0exp_node
//
implement
h0exp_make_node
(
loc0, h0t0, node
) = $rec
{ h0exp_loc= loc0
, h0exp_type= h0t0, h0exp_node= node
} (* h0exp_make_node *)
//
end // end of [local]

(* ****** ****** *)

local

absimpl
h0gua_tbox = $rec
{ h0gua_loc= loc_t
, h0gua_node= h0gua_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
h0gua_get_loc(x0) = x0.h0gua_loc
implement
h0gua_get_node(x0) = x0.h0gua_node

implement
h0gua_make_node
  (loc0, node) = $rec
{
  h0gua_loc= loc0, h0gua_node= node
} (* h0gua_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
h0clau_tbox = $rec
{ h0clau_loc= loc_t
, h0clau_node= h0clau_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
h0clau_get_loc(x0) = x0.h0clau_loc
implement
h0clau_get_node(x0) = x0.h0clau_node

implement
h0clau_make_node
  (loc0, node) = $rec
{
  h0clau_loc= loc0, h0clau_node= node
} (* h0clau_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
h0gpat_tbox = $rec
{ h0gpat_loc= loc_t
, h0gpat_node= h0gpat_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
h0gpat_get_loc(x0) = x0.h0gpat_loc
implement
h0gpat_get_node(x0) = x0.h0gpat_node

implement
h0gpat_make_node
  (loc0, node) = $rec
{
  h0gpat_loc= loc0, h0gpat_node= node
} (* h0gpat_make_node *)

end // end of [local]

(* ****** ****** *)

local
//
absimpl
h0dcl_tbox = $rec
{ h0dcl_loc= loc_t
, h0dcl_node= h0dcl_node
} (* end of [absimpl] *)
//
in (* in-of-local *)
//
implement
h0dcl_get_loc
(dcl) = dcl.h0dcl_loc
implement
h0dcl_get_node
(dcl) = dcl.h0dcl_node
//
implement
h0dcl_make_node
(loc0, node) = $rec
{ h0dcl_loc= loc0, h0dcl_node= node
} (* h0dcl_make_node *)
//
end // end of [local]

(* ****** ****** *)

local

absimpl
htqarg_tbox = $rec
{
htqarg_loc= loc_t
,
htqarg_htvs= htvarlst
}

in (* in-of-local *)

implement
htqarg_make
(loc, htvs) = $rec
{
htqarg_loc= loc, htqarg_htvs= htvs
}

implement
htqarg_get_loc(x0) = x0.htqarg_loc
implement
htqarg_get_htvs(x0) = x0.htqarg_htvs

end // end of [local]

(* ****** ****** *)

(* end of [xats_intrep0_dynexp.dats] *)
