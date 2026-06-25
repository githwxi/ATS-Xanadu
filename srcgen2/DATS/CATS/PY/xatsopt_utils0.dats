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
//
#staload XATSOPT =
  "./../../../SATS/xatsopt.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
PYDEV_xatsopt_args_filsats_d2parsed
(
farg:
(strn->void)->void, fpth: strn): d2parsed = $extnam()
#extern
fun
PYDEV_xatsopt_args_fildats_d2parsed
(
farg:
(strn->void)->void, fpth: strn): d2parsed = $extnam()
//
(* ****** ****** *)
//
#implfun
PYDEV_xatsopt_args_filsats_d2parsed
  (farg, fpth) =
let
val xats = 0(*sats*)
val args = strnlst_make_fwork(farg)
in//let
$XATSOPT.xatsopt_args$filxats_d2parsed(args, xats, fpth)
end(*let*)//end-of-[PYDEV_xatsopt_args_filsats_d2parsed(farg,fpth)]
//
#implfun
PYDEV_xatsopt_args_fildats_d2parsed
  (farg, fpth) =
let
val xats = 1(*dats*)
val args = strnlst_make_fwork(farg)
in//let
$XATSOPT.xatsopt_args$filxats_d2parsed(args, xats, fpth)
end(*let*)//end-of-[PYDEV_xatsopt_args_fildats_d2parsed(farg,fpth)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
PYDEV_xatsopt_args_filsats_d3parsed
(
farg:
(strn->void)->void, fpth: strn): d3parsed = $extnam()
#extern
fun
PYDEV_xatsopt_args_fildats_d3parsed
(
farg:
(strn->void)->void, fpth: strn): d3parsed = $extnam()
//
(* ****** ****** *)
//
#implfun
PYDEV_xatsopt_args_filsats_d3parsed
  (farg, fpth) =
let
val xats = 0(*sats*)
val args = strnlst_make_fwork(farg)
in//let
$XATSOPT.xatsopt_args$filxats_d3parsed(args, xats, fpth)
end(*let*)//end-of-[PYDEV_xatsopt_args_filsats_d3parsed(farg,fpth)]
//
#implfun
PYDEV_xatsopt_args_fildats_d3parsed
  (farg, fpth) =
let
val xats = 1(*dats*)
val args = strnlst_make_fwork(farg)
in//let
$XATSOPT.xatsopt_args$filxats_d3parsed(args, xats, fpth)
end(*let*)//end-of-[PYDEV_xatsopt_args_fildats_d3parsed(farg,fpth)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_CATS_PY_xatsopt_utils0.dats] *)
(***********************************************************************)
