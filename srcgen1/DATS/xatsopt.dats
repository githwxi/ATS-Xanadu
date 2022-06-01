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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#dynload
"./xatsopt_mymain.dats"
(* ****** ****** *)
#staload
"./../SATS/xatsopt.sats"
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
#staload
GLO = "./../SATS/xglobal.sats"
(* ****** ****** *)
//
// HX-2019-11-14:
//
#ifdef
__LIBXATSOPT__
#then
(* ****** ****** *)
#define
ATS_MAINATSFLAG 1
#define
ATS_DYNLOADNAME "libxatsopt_dynloadall"
(* ****** ****** *)
#else
(* ****** ****** *)
implement
main0(argc, argv) =
(
//
if
(argc >= 2)
then
{
  val () =
  xatsopt_main0(argc, argv)
} (* end of [if] *)
) where
{
//
val () =
prerrln!
("Hello from ATS3(xatsopt)!")
//
val
XATSHOME =
$GLO.the_XATSHOME_get((*void*))
val
((*void*)) =
prerrln!
("xatsopt: XATSHOME=", XATSHOME)
//
} where
{
// (*
val out = stderr_ref
val ( ) =
echo_argc_argv(out, argc, argv)
// *)
} (* where *) // end of [main0]
(* ****** ****** *)
#endif // #ifdef(__LIBXATSOPT__)
(* ****** ****** *)
(* end of [xats_xatsopt.dats] *)
