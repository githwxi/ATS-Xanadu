(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: April, 2019
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
#staload
SYM = "./../SATS/symbol.sats"
#staload
LOC = "./../SATS/locinfo.sats"
//
  typedef sym_t = $SYM.sym_t
  typedef loc_t = $LOC.loc_t
//
(* ****** ****** *)

#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

local
//
absimpl
d3pat_tbox = $rec
{ d3pat_loc= loc_t
, d3pat_type= t2ype
, d3pat_node= d3pat_node
} (* end of [absimpl] *)
//
in
//
implement
d3pat_get_loc
  (d3p) = d3p.d3pat_loc
implement
d3pat_get_node
  (d3p) = d3p.d3pat_node
//
implement
d3pat_get_type
  (d3p) = d3p.d3pat_type
//
implement
d3pat_make_node
(
loc0, t2p0, node
) = $rec
{ d3pat_loc= loc0
, d3pat_type= t2p0, d3pat_node= node
} (* d3pat_make_node *)
//
end // end of [local]

(* ****** ****** *)

implement
d3patlst_get_type
  (d3ps) =
list_vt2t
(
list_map<d3pat><t2ype>(d3ps)
) where
{
implement
list_map$fopr<d3pat><t2ype>(d3p) = d3p.type()
} (* end of [d3patlst_get_type] *)

(* ****** ****** *)

implement
d3pat_nil
(loc0) =
let
val
t2p0 = the_t2ype_void
in
d3pat_make_node
(loc0, t2p0, D3Pnil())
end // [d3pat_nil]

(* ****** ****** *)

implement
d3pat_any
(loc0, t2p0) =
d3pat_make_node
(loc0, t2p0, D3Pany())

(* ****** ****** *)

implement
d3pat_var
(loc0, d2v0) =
let
val t2p0 = d2v0.type()
in
d3pat_make_node
(loc0, t2p0, D3Pvar(d2v0))
end // end of [let]

(* ****** ****** *)

implement
d3pat_int
(loc0, tok0) =
let
val
t2p0 = the_t2ype_sint
in
d3pat_make_node
(loc0, t2p0, D3Pint(tok0))
end // end of [let]
implement
d3pat_btf
(loc0, tok0) =
let
val
t2p0 = the_t2ype_bool
in
d3pat_make_node
(loc0, t2p0, D3Pbtf(tok0))
end // end of [let]
implement
d3pat_chr
(loc0, tok0) =
let
val
t2p0 = the_t2ype_char
in
d3pat_make_node
(loc0, t2p0, D3Pchr(tok0))
end // end of [let]

(* ****** ****** *)

implement
d3pat_tcast
(d3p0, t2p0) =
(
d3pat_make_node
( loc0
, t2p0, D3Ptcast(d3p0, t2p0))
) where
{
  val loc0 = d3p0.loc((*void*))
}

(* ****** ****** *)

implement
d3pat_anno
(d3p0, s2e0) =
(
d3pat_make_node
( loc0
, t2p0, D3Panno(d3p0, s2e0))
) where
{
  val loc0 = d3p0.loc((*void*))
  val t2p0 = d3p0.type((*void*))
}

(* ****** ****** *)

local

val
stamper =
$STM.stamper_new()

in (* in-of-local *)

implement
d3timp_stamp_new
(
// argless
) = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

absimpl
f3arg_tbox = $rec{
  f3arg_loc= loc_t
, f3arg_node= f3arg_node
} (* f3arg_tbox *)

in (* in-of-local *)

implement
f3arg_get_loc(x0) = x0.f3arg_loc
implement
f3arg_get_node(x0) = x0.f3arg_node

(* ****** ****** *)

implement
f3arg_make_node
(loc, node) = $rec
{
  f3arg_loc= loc, f3arg_node= node
} (* end of [f3arg_make_node] *)

end // end of [local]

(* ****** ****** *)

local
//
absimpl
d3exp_tbox = $rec
{ d3exp_loc= loc_t
, d3exp_type= t2ype
, d3exp_node= d3exp_node
} (* end of [absimpl] *)
//
in (* in-of-local *)
//
implement
d3exp_get_loc
  (d3e) = d3e.d3exp_loc
implement
d3exp_get_node
  (d3e) = d3e.d3exp_node
//
implement
d3exp_get_type
  (d3e) = d3e.d3exp_type
//
implement
d3exp_make_node
(
loc0, t2p0, node
) = $rec
{ d3exp_loc= loc0
, d3exp_type= t2p0, d3exp_node= node
} (* d3exp_make_node *)
//
end // end of [local]

(* ****** ****** *)
//
implement
d3expopt_get_type
  (opt) =
(
case+ opt of
| None() => None()
| Some(d3e) => Some(d3e.type())
)
implement
d3explst_get_type
  (d3es) =
list_vt2t
(
list_map<d3exp><t2ype>(d3es)
) where
{
implement
list_map$fopr<d3exp><t2ype>(d3e) = d3e.type()
} (* end of [d3explst_get_type] *)
//
(* ****** ****** *)
//
implement
d3exp_none0_0(d2e0) =
d3exp_none0_1
(d2e0, the_t2ype_none0)
implement
d3exp_none0_1(loc0, t2p0) =
d3exp_make_node
(loc0, t2p0, D3Enone0(*void*))
//
implement
d3exp_none1_0(d2e0) =
d3exp_none1_1
(d2e0, the_t2ype_none0)
implement
d3exp_none1_1(d2e0, t2p0) =
(
d3exp_make_node
(loc0, t2p0, D3Enone1(d2e0))
) where
{
  val loc0 = d2e0.loc((*void*))
}
//
(* ****** ****** *)
//
implement
d3exp_none2_0(d3e0) =
(
d3exp_make_node
(loc0, t2p0, D3Enone2(d3e0))
) where
{
  val loc0 = d3e0.loc((*void*))
  val t2p0 = d3e0.type((*void*))
}
//
(* ****** ****** *)

implement
d3exp_talf
  (d3e0) =
let
val
loc0 = d3e0.loc()
val
t2p0 =
t2ype_lft(d3e0.type())
in
d3exp_make_node
  (loc0, t2p0, D3Etalf(d3e0))
end

(* ****** ****** *)
//
implement
d3exp_tcast
  (d3e0, t2p0) =
(
d3exp_make_node
( loc0
, t2p0, D3Etcast(d3e0, t2p0))
) where
{
  val loc0 = d3e0.loc((*void*))
}
//
(* ****** ****** *)

local

absimpl
d3gua_tbox = $rec
{ d3gua_loc= loc_t
, d3gua_node= d3gua_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d3gua_get_loc(x0) = x0.d3gua_loc
implement
d3gua_get_node(x0) = x0.d3gua_node

implement
d3gua_make_node
  (loc0, node) = $rec
{
  d3gua_loc= loc0, d3gua_node= node
} (* d3gua_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d3clau_tbox = $rec
{ d3clau_loc= loc_t
, d3clau_node= d3clau_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d3clau_get_loc(x0) = x0.d3clau_loc
implement
d3clau_get_node(x0) = x0.d3clau_node

implement
d3clau_make_node
  (loc0, node) = $rec
{
  d3clau_loc= loc0, d3clau_node= node
} (* d3clau_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d3gpat_tbox = $rec
{ d3gpat_loc= loc_t
, d3gpat_node= d3gpat_node
} (* end of [absimpl] *)

in (* in-of-local *)

implement
d3gpat_get_loc(x0) = x0.d3gpat_loc
implement
d3gpat_get_node(x0) = x0.d3gpat_node

implement
d3gpat_make_node
  (loc0, node) = $rec
{
  d3gpat_loc= loc0, d3gpat_node= node
} (* d3gpat_make_node *)

end // end of [local]

(* ****** ****** *)

local

absimpl
d3ecl_tbox = $rec
{
  d3ecl_loc= loc_t
, d3ecl_node= d3ecl_node
} (* end of [absimpl] *)

in (* in-of-local *)

(* ****** ****** *)

implement
d3ecl_get_loc(x0) = x0.d3ecl_loc
implement
d3ecl_get_node(x0) = x0.d3ecl_node

(* ****** ****** *)

implement
d3ecl_make_node
(loc, node) = $rec
{
  d3ecl_loc= loc, d3ecl_node= node
} (* end of [d3ecl_make_node] *)

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
//
implement
d3ecl_none1(d2c0) =
(
d3ecl_make_node
(loc0, D3Cnone1(d2c0))
) where
{
  val loc0 = d2c0.loc((*void*))
}
//
(* ****** ****** *)

implement
v3aldecl_get_loc(v3d0) =
let
val+V3ALDECL(rcd) = v3d0 in rcd.loc end

(* ****** ****** *)

implement
v3ardecl_get_loc(v3d0) =
let
val+V3ARDECL(rcd) = v3d0 in rcd.loc end

(* ****** ****** *)
//
implement
f3undecl_get_loc(f3d0) =
let
val+F3UNDECL(rcd) = f3d0 in rcd.loc end
//
implement
f3undecl_get_d2c(f3d0) =
let
val+F3UNDECL(rcd) = f3d0 in rcd.d2c end
//
(* ****** ****** *)

(* end of [xats_dynexp3.dats] *)
