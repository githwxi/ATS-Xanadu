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
// Start Time: December, 2018
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
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
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
XATS_VOID_T = symbol("xats_void_t")
//
val
XATS_P1TR_T = symbol("xats_p1tr_t")
val
XATS_P2TR_T = symbol("xats_p2tr_t")
//
val
XATS_SINT_T = symbol("xats_sint_t")
and
XATS_UINT_T = symbol("xats_uint_t")
//
val
XATS_BOOL_T = symbol("xats_bool_t")
and
XATS_CHAR_T = symbol("xats_char_t")
//
val
XATS_SFLT_T = symbol("xats_sflt_t")
and
XATS_DFLT_T = symbol("xats_dflt_t")
and
XATS_LDFLT_T = symbol("xats_ldflt_t")
//
val
XATS_SLINT_T = symbol("xats_slint_t")
and
XATS_ULINT_T = symbol("xats_ulint_t")
val
XATS_SLLINT_T = symbol("xats_sllint_t")
and
XATS_ULLINT_T = symbol("xats_ullint_t")
//
val
XATS_STRING_T = symbol("xats_string_t")
//
val
XATS_LAZY_T = symbol("xats_lazy_t")
val
XATS_LLAZY_VT = symbol("xats_llazy_vt")
//
val
XATS_EXCPTN_VT = symbol("xats_excptn_vt")
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
t2ype_none0
( s2t0 ) =
t2ype_make_node
(s2t0, T2Pnone0(*void*))
implement
t2ype_none1
( s2e0 ) =
t2ype_make_node
(s2e0.sort(), T2Pnone1(s2e0))
//
(* ****** ****** *)
//
implement
the_t2ype_void =
t2ype_make_name
(the_sort2_type, XATS_VOID_T)
//
implement
the_t2ype_p1tr =
t2ype_make_name
(the_sort2_tbox, XATS_P1TR_T)
//
implement
the_t2ype_p2tr =
(
t2ype_make_name(s2t0, XATS_P2TR_T)
) where
{
val s2ts = list_sing(the_sort2_vwtp)
val s2t0 = S2Tfun(s2ts, the_sort2_tbox)
}
//
(* ****** ****** *)
//
implement
the_t2ype_sint =
t2ype_make_name
(the_sort2_type, XATS_SINT_T)
implement
the_t2ype_uint =
t2ype_make_name
(the_sort2_type, XATS_UINT_T)
//
implement
the_t2ype_bool =
t2ype_make_name
(the_sort2_type, XATS_BOOL_T)
//
implement
the_t2ype_char =
t2ype_make_name
(the_sort2_type, XATS_CHAR_T)
//
implement
the_t2ype_sflt =
t2ype_make_name
(the_sort2_type, XATS_SFLT_T)
implement
the_t2ype_dflt =
t2ype_make_name
(the_sort2_type, XATS_DFLT_T)
implement
the_t2ype_ldflt =
t2ype_make_name
(the_sort2_type, XATS_LDFLT_T)
//
(* ****** ****** *)
implement
the_t2ype_slint =
t2ype_make_name
(the_sort2_type, XATS_SLINT_T)
implement
the_t2ype_ulint =
t2ype_make_name
(the_sort2_type, XATS_ULINT_T)
implement
the_t2ype_sllint =
t2ype_make_name
(the_sort2_type, XATS_SLLINT_T)
implement
the_t2ype_ullint =
t2ype_make_name
(the_sort2_type, XATS_ULLINT_T)
(* ****** ****** *)
//
implement
the_t2ype_string =
t2ype_make_name
(the_sort2_tbox, XATS_STRING_T)
//
(* ****** ****** *)

implement
the_t2ype_lazy =
(
t2ype_make_name(s2t0, XATS_LAZY_T)
) where
{
val s2ts = list_sing(the_sort2_type)
val s2t0 = S2Tfun(s2ts, the_sort2_tbox)
}
implement
the_t2ype_llazy =
(
t2ype_make_name(s2t0, XATS_LLAZY_VT)
) where
{
val s2ts = list_sing(the_sort2_vwtp)
val s2t0 = S2Tfun(s2ts, the_sort2_vtbx)
}

(* ****** ****** *)
//
implement
the_t2ype_excptn =
t2ype_make_name
(the_sort2_vtbx, XATS_EXCPTN_VT)
//
(* ****** ****** *)

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
| sym=XATS_VOID_T =>
  the_void_ctype.type()
//
| sym=XATS_P1TR_T =>
  the_p1tr_ctype.type()
| sym=XATS_P2TR_T =>
  the_p2tr_ctype.type()
//
| sym=XATS_SINT_T =>
  the_sint0_ctype.type()
| sym=XATS_UINT_T =>
  the_uint0_ctype.type()
| sym=XATS_BOOL_T =>
  the_bool0_ctype.type()
| sym=XATS_CHAR_T =>
  the_char0_ctype.type()
//
| sym=XATS_SFLT_T =>
  the_sflt_ctype.type()
| sym=XATS_DFLT_T =>
  the_dflt_ctype.type()
| sym=XATS_LDFLT_T =>
  the_ldflt_ctype.type()
//
| sym=XATS_SLINT_T =>
  the_slint_ctype.type()
| sym=XATS_ULINT_T =>
  the_ulint_ctype.type()
| sym=XATS_SLLINT_T =>
  the_sllint_ctype.type()
| sym=XATS_ULLINT_T =>
  the_ullint_ctype.type()
//
| sym=XATS_STRING_T =>
  the_string0_ctype.type()
//
| sym=XATS_LAZY_T =>
  the_lazy_ctype.type((*void*))
| sym=XATS_LLAZY_VT =>
  the_llazy_ctype.type((*void*))
//
| sym=XATS_EXCPTN_VT =>
  the_excptn_ctype.type((*void*))
//
| _(*unrecognized base type*) => t2p0
//
end // end of [t2bas_eval]

(* ****** ****** *)

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
//
| T2Pcst(s2c) => let
    val
    t2p1 = s2c.type()
  in
    case+ t2p1.node() of
    | T2Pnone0() => t2p0
    | _ (*else*) => t2ype_eval(t2p1)
  end
//
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

(* end of [xats_statyp2_init0.dats] *)
