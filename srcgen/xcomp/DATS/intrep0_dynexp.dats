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
#staload "./../SATS/xbasics.sats"
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/lexing0.sats"
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)

#staload "./../SATS/staexp1.sats"
#staload "./../SATS/staexp2.sats"

(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)

implement
eq_hdcon_hdcon(x1, x2) =
(x1.stamp() = x2.stamp())
implement
eq_hdcst_hdcst(x1, x2) =
(x1.stamp() = x2.stamp())
implement
eq_hdvar_hdvar(x1, x2) =
(x1.stamp() = x2.stamp())

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
{
  h0dcl_loc= loc0, h0dcl_node= node
} (* h0dcl_make_node *)
//
end // end of [local]

(* ****** ****** *)

(*
(*
HX-2022-01-30:
This code is moved to
[intrep0_staexp.dats]
*)
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
*)

(* ****** ****** *)

(* end of [xats_intrep0_dynexp.dats] *)
