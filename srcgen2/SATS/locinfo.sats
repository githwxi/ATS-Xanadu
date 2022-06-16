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
#staload FP0 = "./filpath.sats"
(* ****** ****** *)
(*
HX-2022-06-10:
A postn-value [pos] refers to a point
in a char sequence; it minimally contains
the total offset (ntot), the line number (nrow)
and the line offset (ncol).
A loctn-value [loc] refers to a range
in a char sequence; it minimally contains
certain info on the source of the sequence
(e.g., the name of the file containing the
char sequence), the starting position (loc.pbeg)
of the range, and the ending position (loc.pend).
*)
(* ****** ****** *)
#typedef
fpath = $FP0.fpath
(* ****** ****** *)
//
datatype
lcsrc =
| LCSRCnone0 of ()
| LCSRCsome1 of strn
| LCSRCfpath of fpath
//
(* ****** ****** *)
fun
lcsrc_fprint
(out:FILR,src:lcsrc): void
(* ****** ****** *)
//
#abstbox postn_tbox
#typedef postn = postn_tbox
#typedef pos_t = postn_tbox
//
(* ****** ****** *)
//
#abstbox loctn_tbox
#typedef loctn = loctn_tbox
#typedef loc_t = loctn_tbox
//
(* ****** ****** *)
fun
postn_cmp(postn, postn): sint
fun
loctn_cmp(loctn, loctn): sint
(* ****** ****** *)
//
fun postn_get_ntot(postn): sint
fun postn_get_nrow(postn): sint
fun postn_get_ncol(postn): sint
//
#symload ntot with postn_get_ntot
#symload nrow with postn_get_nrow
#symload ncol with postn_get_ncol
//
(* ****** ****** *)
//
fun
postn_make_int3
( ntot: sint
, nrow: sint, ncol: sint): postn
#symload postn with postn_make_int3
//
(* ****** ****** *)
fun
postn_fprint: (FILR, postn) -> void
(* ****** ****** *)
//
fun loctn_get_lsrc(loctn): lcsrc
fun loctn_get_pbeg(loctn): postn
fun loctn_get_pend(loctn): postn
//
#symload lsrc with loctn_get_lsrc
#symload pbeg with loctn_get_pbeg
#symload pend with loctn_get_pend
//
(* ****** ****** *)
fun
loctn_fprint: (FILR, loctn) -> void
(* ****** ****** *)
fun
loctn_make_arg3
(lcsrc, postn, postn): loctn
fun
loctn_make_fpath
(fpath, postn, postn): loctn
#symload loctn with loctn_make_arg3
#symload loctn with loctn_make_fpath
(* ****** ****** *)
//
fun
add_loctn_loctn
(loc1: loctn, loc2: loctn): loctn
//
#symload + with add_loctn_loctn of 1000
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_locinfo.sats] *)
