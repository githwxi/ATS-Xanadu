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
// Start Time: November, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2019-11-02: level-1 interpreter
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
#staload "./../SATS/interp0.sats"
//
(* ****** ****** *)
//
#dynload "./../DATS/intrep0.dats"
#dynload "./../DATS/intrep0_print.dats"
#dynload "./../DATS/intrep0_dynexp.dats"
//
#dynload "./../DATS/interp0.dats"
#dynload "./../DATS/interp0_print.dats"
#dynload "./../DATS/interp0_envmap.dats"
#dynload "./../DATS/interp0_dynexp.dats"
//
(* ****** ****** *)
//
implement
main0(argc, argv) =
(
//
if
(argc >= 2)
then interp0_main0(argc, argv)
else prerrln! ("Hello from ATS3(xinterp)!")
// end of [if]
) (* end of [main] *)
//
(* ****** ****** *)

(* end of [xint_xinterp.dats] *)
