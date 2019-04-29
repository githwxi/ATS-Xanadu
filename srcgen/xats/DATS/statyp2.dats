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
#staload
UN =
"prelude/SATS/unsafe.sats"
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
#staload "./../SATS/statyp2.sats"

(* ****** ****** *)

local

absimpl
t2ype_tbox = $rec
{ t2ype_sort= t2srt
, t2ype_node= t2ype_node
}

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
  (t2s0, node) = $rec
{
  t2ype_sort= t2s0, t2ype_node= node
}
//
end // end of [local]

(* ****** ****** *)
//
implement
t2ype_none() =
t2ype_make_node(T2Snul(), T2Pnone())
//
(* ****** ****** *)
//
implement
t2ype_make_name
  (t2s0, name) =
(
  t2ype_make_node(t2s0, T2Pbas(name))
)
//
(* ****** ****** *)

local

macdef
symbol =
$SYM.symbol_make

val
XATS_SINT_T =
symbol("xats_sint_t")
val
XATS_UINT_T =
symbol("xats_uint_t")

val
the_t2srt_type =
T2Simp(0, $SYM.TYPE_symbol)
val
the_t2ype_sint =
t2ype_make_name
(the_t2srt_type, XATS_SINT_T)
val
the_t2ype_uint =
t2ype_make_name
(the_t2srt_type, XATS_UINT_T)

in(*in-of-local*)

implement
t2ype_sint() = the_t2ype_sint
implement
t2ype_uint() = the_t2ype_uint

end // end of [local]

(* ****** ****** *)

local
//
typedef t2ypenul = ptr
//
datavtype
t2xtv_vt =
T2XTV of (loc_t, t2ypenul)
//
in(*in-of-local*)

implement
t2xtv_new(loc) =
$UN.castvwtp0{t2xtv}
(
  T2XTV(loc, the_null_ptr)
)

end // end of [local]

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
