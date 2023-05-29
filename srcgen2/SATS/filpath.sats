(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Start Time: May 28th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
//
fun theDirSep_get(): char
fun theCurDir_get(): strn
fun theParDir_get(): strn
//
(* ****** ****** *)
//
fun
fpath_normq(fpx: strn): bool
fun
fpath_normize(fpx: strn): strn
//
(* ****** ****** *)
//
#abstbox drpth_tbox // ptr
//
#typedef drpth = drpth_tbox
#typedef drpthlst = list(drpth)
#typedef drpthopt = optn(drpth)
//
(* ****** ****** *)
//
#abstbox fpath_tbox // ptr
//
#typedef fpath = fpath_tbox
#typedef fpathlst = list(fpath)
#typedef fpathopt = optn(fpath)
//
(* ****** ****** *)
fun
drpth_get_name
(dpx: drpth): strn
#symload
name with drpth_get_name
fun
drpth_make_name
(name: strn): drpth
#symload
drpth with drpth_make_name
(* ****** ****** *)
//
val
the_drpth_nil: drpth
fun
the_drpth_get(): drpth
fun
the_drpthlst_get(): drpthlst
//
fun
the_drpth_fprint(FILR): void
fun
the_drpthlst_fprint(FILR): void
//
(* ****** ****** *)
fun
fpath_get_gvn0
(fpx: fpath): strn // given
#symload gvn0 with fpath_get_gvn0
fun
fpath_get_fnm1
(fpx: fpath): strn // fname
#symload fnm1 with fpath_get_fnm1
fun
fpath_get_fnm2
(fpx: fpath): symbl // fnorm
#symload fnm2 with fpath_get_fnm2
(* ****** ****** *)
//
fun
fpath_make_absolute
(fnm1: strn): fpath // absolute
fun
fpath_make_relative
( gvn0: strn
, fnm1: strn): fpath // relative
#symload
fpath with fpath_make_absolute of 0
#symload
fpath with fpath_make_relative of 0
//
(* ****** ****** *)
//
fun drpth_fprint(FILR, drpth): void
fun fpath_fprint(FILR, fpath): void
//
(* ****** ****** *)
//
datatype
fname =
| FNMbase of strn
(*
HX: other kinds of fnames?
*)
#typedef
fnameopt = optn(fname)
#vwtpdef
fnameopt_vt = optn_vt(fname)
//
(* ****** ****** *)
fun
fname_fprint(FILR, fname): void
(* ****** ****** *)
fun
fsrch_absolute(base: strn): fpathopt
fun
fsrch_dcurrent(base: strn): fpathopt
(* ****** ****** *)
fun
fsrch_includes(base: strn): fpathopt
(* ****** ****** *)
fun
fsrch_combined(fnm0: fname): fpathopt
(* ****** ****** *)
//
fun
fsrch_dir1base
(dir0: drpth, base: strn): optn(fpath)
fun
fsrch_dirsbase
( dirs
: list(drpth), base: strn): optn(fpath)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_filpath.sats] *)
