(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
#staload "./../SATS/lexbuf.sats"
//
(* ****** ****** *)
//
assume
lexbuf_tflat =
$extype_struct
"xats_lexbuf_struct" of
{
  ntot= int
, nrow= int
, ncol= int
, nspc= int
, cbuf= stropt
, cptr0= ptr, cptr1= ptr
, cbhead= arrayref(uchar,0), cbtail= cblist
} (* end of [lexbuf] *)
//
(* ****** ****** *)

implement
lexbuf_initize_cblist
  (buf, cbs) = let
//
val () = buf.ntot := 0
val () = buf.nrow := 0
val () = buf.ncol := 0
//
val () = buf.nspc := 0
//
val () = buf.cbuf := stropt_none()
//
val () = buf.cptr0 := the_null_ptr
val () = buf.cptr1 := the_null_ptr
//
val () = buf.cbtail := cbs//char-block-list
val () = buf.cbhead := $UN.cast(the_null_ptr)
//
in
  // nothing
end // end of [lexbuf_initize_cblist]

(* ****** ****** *)

(* end of [xats_lexbuf.dats] *)
