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
UN="prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/basics.sats"
#staload "./../SATS/stamp0.sats"
#staload "./../SATS/symbol.sats"
#staload "./../SATS/locinfo.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
//
(* ****** ****** *)

local

absimpl
t2ype_tbox = $rec
{ 
  t2ype_sort= sort2
, t2ype_node= t2ype_node
} (* absimpl *)

in (* in-of-local *)
//
implement
t2ype_get_sort
  (t2p) = t2p.t2ype_sort
implement
t2ype_get_node
  (t2p) = t2p.t2ype_node
//
implement
t2ype_make_node
  (s2t0, node) = $rec
{
  t2ype_sort= s2t0, t2ype_node= node
}
//
end // end of [local]

(* ****** ****** *)
//
implement
the_t2ype_none0 =
t2ype_make_node
(S2Tnone0, T2Pnone0)
//
implement
t2ype_none0() =
the_t2ype_none0(*void*)
//
implement
t2ype_none1(s2e) =
t2ype_make_node
(S2Tnone0(), T2Pnone1(s2e))
//
(* ****** ****** *)
//
implement
t2ype_make_name
  (s2t0, name) =
(
  t2ype_make_node(s2t0, T2Pbas(name))
)
//
(* ****** ****** *)

local
//
macdef
symbol =
symbol_make
//
in(*in-of-local*)
//
val
XATS_SINT_T = symbol("xats_sint_t")
and
XATS_UINT_T = symbol("xats_uint_t")
and
XATS_BOOL_T = symbol("xats_bool_t")
and
XATS_CHAR_T = symbol("xats_char_t")
//
val
XATS_VOID_T = symbol("xats_void_t")
//
val
XATS_SFLOAT_T = symbol("xats_sfloat_t")
and
XATS_DFLOAT_T = symbol("xats_dfloat_t")
//
val
XATS_STRING_T = symbol("xats_string_t")
//
end // end of [local]

(* ****** ****** *)

implement
the_t2ype_sint =
t2ype_make_name(the_sort2_tflt, XATS_SINT_T)
implement
the_t2ype_uint =
t2ype_make_name(the_sort2_tflt, XATS_UINT_T)
//
implement
the_t2ype_bool =
t2ype_make_name(the_sort2_tflt, XATS_BOOL_T)
//
implement
the_t2ype_char =
t2ype_make_name(the_sort2_tflt, XATS_CHAR_T)
//
implement
the_t2ype_void =
t2ype_make_name(the_sort2_tflt, XATS_VOID_T)
//
implement
the_t2ype_sfloat =
t2ype_make_name(the_sort2_tflt, XATS_SFLOAT_T)
implement
the_t2ype_dfloat =
t2ype_make_name(the_sort2_tflt, XATS_DFLOAT_T)
//
implement
the_t2ype_string =
t2ype_make_name(the_sort2_tbox, XATS_STRING_T)

(* ****** ****** *)

implement
t2ype_cst
(s2c0) = let
//
val s2t0 = s2c0.sort()
val node = T2Pcst(s2c0)
//
in
  t2ype_make_node(s2t0, node)
end

implement
t2ype_var
(s2v0) = let
//
val s2t0 = s2v0.sort()
val node = T2Pvar(s2v0)
//
in
  t2ype_make_node(s2t0, node)
end

(* ****** ****** *)
//
local
//
typedef
t2xtv_struct = @{
  t2xtv_loc= loc_t
,
  t2xtv_type= t2ype
,
  t2xtv_stamp= stamp
}
//
absimpl
t2xtv_tbox=ref(t2xtv_struct)
//
in (*in-of-local*)
//
implement
t2xtv_new(loc0) =
(
ref<t2xtv_struct>
@{
  t2xtv_loc= loc0
,
  t2xtv_type= t2p0
,
  t2xtv_stamp=stamp
}
) where
{
val t2p0 = the_t2ype_none0
val stamp = t2xtv_stamp_new()
} (* end of [t2xtv_new0] *)
//
implement
t2xtv_get_loc
  (xtv) = xtv->t2xtv_loc
implement
t2xtv_get_type
  (xtv) = xtv->t2xtv_type
implement
t2xtv_set_type
  (xtv, t2p) =
  (xtv->t2xtv_type := t2p)
//
implement
t2xtv_get_stamp
  (xtv) = xtv->t2xtv_stamp
//
implement
eq_t2xtv_t2xtv
  (xtv1, xtv2) =
$STM.eq_stamp_stamp
(
  xtv1->t2xtv_stamp, xtv2->t2xtv_stamp
) (*eq_t2xtv_t2xtv*)
//
end // end of [local]
//
(* ****** ****** *)
//
implement
t2ype_new(loc0) =
t2ype_xtv(t2xtv_new(loc0))
//
implement
t2ype_xtv(xtv0) = let
//
val node = T2Pxtv(xtv0)
val s2t0 = the_sort2_none
//
in
  t2ype_make_node(s2t0, node)
end // end of [t2ype_xtv]
//
implement
t2ype_srt_xtv
  (s2t0, xtv0) = let
//
val node = T2Pxtv(xtv0)
//
in
  t2ype_make_node(s2t0, node)
end // end of [t2ype_srt_xtv]
//
(* ****** ****** *)
//
implement
t2bas_eval
  (t2p0) = let
//
val-
T2Pbas(sym) = t2p0.node()
//
in
//
ifcase
//
| sym=XATS_SINT_T =>
  the_sint_ctype.type()
| sym=XATS_UINT_T =>
  the_uint_ctype.type()
| sym=XATS_BOOL_T =>
  the_bool_ctype.type()
| sym=XATS_CHAR_T =>
  the_char_ctype.type()
//
| sym=XATS_VOID_T =>
  the_void_ctype.type()
//
| sym=XATS_SFLOAT_T =>
  the_sfloat_ctype.type()
| sym=XATS_DFLOAT_T =>
  the_dfloat_ctype.type()
//
| sym=XATS_STRING_T =>
  the_string_ctype.type()
//
| _(*unrecognized base type*) => t2p0
//
end // end of [t2bas_eval]
//
implement
t2ype_eval
  (t2p0) =
(
case+
t2p0.node() of
| T2Pbas _ =>
  (
    t2bas_eval(t2p0)
  )
| T2Pxtv(xtv) => let
    val
    t2p1 = xtv.type()
  in
    case+ t2p1.node() of
    | T2Pnone0() => t2p0
    | _ (*else*) => t2ype_eval(t2p1)
  end
| _(* non-T2Pxtv *) => (t2p0)
)
//
(* ****** ****** *)
//
implement
t2ype_exi
(s2vs, body) =
(
case+ s2vs of
| list_nil() => body
| list_cons _ => let
  val s2t0 = body.sort()
  in
    t2ype_make_node(s2t0, T2Pexi(s2vs, body))
  end // end of [list_cons]
)
implement
t2ype_uni
(s2vs, body) =
(
case+ s2vs of
| list_nil() => body
| list_cons _ => let
  val s2t0 = body.sort()
  in
    t2ype_make_node(s2t0, T2Puni(s2vs, body))
  end // end of [list_cons]
)
//
(* ****** ****** *)

local
//
absimpl
fcr_tbox =
ref(funclo2)
//
in
implement
fcr_new0() =
fcr_new1(FC2fun())
implement
fcr_new1(fc2) = ref(fc2)
end // end of [local]

(* ****** ****** *)
//
implement
t2ype_fun0
(npf, arg, res) =
(
t2ype_fun1
(fc2, npf, arg, res)
) where
{
val fc2 = FC2fun(*void*)
} // end of [t2ype_fun0]
//
implement
t2ype_fun1
(fc2, npf, arg, res) = let
//
val fcr = fcr_new1(fc2)
//
val node = T2Pfun(fcr, npf, arg, res)
//
in
  t2ype_make_node(the_sort2_none, node)
end // end of [t2ype_fun1]
//
(* ****** ****** *)

local
val
stamper =
$STM.stamper_new()
in (* in-of-local *)
implement
t2xtv_stamp_new() = $STM.stamper_getinc(stamper)
end // end of [local]

(* ****** ****** *)

(* end of [xats_statyp2.dats] *)
