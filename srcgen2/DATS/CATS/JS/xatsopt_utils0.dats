(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
(*
Sat Jun 13 03:52:49 PM EDT 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
#staload D2E =
  "./../../../SATS/dynexp2.sats"
#staload D3E =
  "./../../../SATS/dynexp3.sats"
(* ****** ****** *)
#staload XATSOPT =
  "./../../../SATS/xatsopt.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef d2parsed = $D2E.d2parsed
#typedef d3parsed = $D3E.d3parsed
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
JSDEV_xatsopt_args_filsats_d2parsed
(
farg:
(strn->void)->void, fpth: strn): d2parsed = $extnam()
#extern
fun
JSDEV_xatsopt_args_fildats_d2parsed
(
farg:
(strn->void)->void, fpth: strn): d2parsed = $extnam()
//
#implfun
JSDEV_xatsopt_args_filsats_d2parsed
  (farg, fpth) =
let
val xats = 0(*sats*)
val args = list_make_fwork<strn>(farg)
in//let
$XATSOPT.xatsopt_args$filxats_d2parsed(args, xats, fpth)
end//let
#implfun
JSDEV_xatsopt_args_fildats_d2parsed
  (farg, fpth) =
let
val xats = 1(*dats*)
val args = list_make_fwork<strn>(farg)
in//let
$XATSOPT.xatsopt_args$filxats_d2parsed(args, xats, fpth)
end//let
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_CATS_JS_xatsopt_utils0.dats] *)
(***********************************************************************)
