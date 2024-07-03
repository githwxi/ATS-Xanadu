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
(*
HX: Implementation in ATS2
Sun Nov 12 12:16:50 EST 2023
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: August, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share\
/atspre_staload.hats"
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
//
#staload "./../SATS/xats2js.sats"
//
(* ****** ****** *)
//
#dynload "./../DATS/intrep1.dats"
#dynload "./../DATS/intrep1_print0.dats"
//
#dynload "./../DATS/js1emit_dynexp.dats"
//
#dynload "./../DATS/xats2js_mymain.dats"
//
#dynload "./../DATS/js1comp_utils0.dats"
#dynload "./../DATS/js1comp_envmap.dats"
#dynload "./../DATS/js1comp_dynexp.dats"
//
(* ****** ****** *)
//
implement
main0(argc, argv) =
(
//
if
(argc >= 2)
then
(
  xats2js_main0(argc, argv)
)
) where
{
val () =
prerrln!
("Hello from ATS3(xats2js)!")
//
val
XATSHOME = the_XATSHOME_get()
val
((*void*)) =
prerrln!
("xats2js: XATSHOME=", XATSHOME)
//
} where
{
// (*
val out = stderr_ref
val ( ) =
$XATSOPT.echo_argc_argv(out, argc, argv)
// *)
} (*where*) // end of [main0]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xats2js_srcgen1_xats2js.dats] *)
