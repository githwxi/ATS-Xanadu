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
// Start Time: June, 2018
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

#staload "./../SATS/lexing.sats"
#staload "./../SATS/parsing.sats"

(* ****** ****** *)
//
absimpl
tokbuf_tflt =
$extype_struct
"xats_tokbuf_struct" of
{
  begp= ptr, endp= ptr, curp= ptr
} (* end of [tokbuf] *)
//
(* ****** ****** *)

implement
tokbuf_initize_list
  (buf, xs) = let
//
val n0 =
length(xs)
//
val A0 =
arrayptr_make_list<token>
  (n0, xs)
//
val p0 =
  $UN.castvwtp0{ptr}( A0 )
//
in
//
buf.begp := p0;
buf.curp := p0;
buf.endp :=
ptr0_add_gint<token>(p0, n0);
//
end // end of [tokbuf_make_list]

(* ****** ****** *)
//
implement
tokbuf_getok0
  (buf) =
(
  $UN.ptr0_get<token>(buf.curp)
)
//
(*
HX-2018-06-24:
This function is only safe
if the current token is not EOF
*)
implement
tokbuf_incby1
  (buf) = let
//
  val p0 = buf.curp
//
in
  buf.curp := ptr0_succ<token>(p0)
end // end of [tokbuf_incby1]
//
(* ****** ****** *)

implement
tokbuf_getok1
  (buf) = let
//
  val p0 = buf.curp
//
  val tok =
  $UN.ptr0_get<token>(p0)
//
in
//
case+
tok.node() of
| T_EOF() => tok
| _ (* non-EOF *) => tok where
  {
    val () =
    buf.curp := ptr0_succ<token>(p0)
  }
//
end // end of [tokbuf_getok1]

(* ****** ****** *)

local

absimpl
tokbuf_mark_vtbox = ptr

in (* in-of-local *)

implement
tokbuf_get_mark(buf) = buf.curp
implement
tokbuf_set_mark(buf, mk0) = buf.curp := mk0
implement
tokbuf_clear_mark(buf, mk0) = () // discard

end // end of [local]

(* ****** ****** *)

(* end of [xats_parsing_tokbuf.dats] *)
