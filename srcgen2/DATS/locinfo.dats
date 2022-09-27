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
Start Time: June 10th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#implfun
postn_cmp(ps1, ps2) =
(ps1.ntot() \cmp ps2.ntot())
#implfun
loctn_cmp(lc1, lc2) =
(lc1.pbeg() \cmp lc2.pbeg())
(* ****** ****** *)

local

datatype
postn =
POSTN of
( sint(*ntot*)
, sint(*nrow*)
, sint(*ncol*))
#absimpl postn_tbox = postn

in//local

#implfun
postn_get_ntot
  (pos) = let
//
val+
POSTN
(ntot, nrow, ncol) = pos in ntot
//
end (*let*) // end of [postn_get_ntot]

(* ****** ****** *)

#implfun
postn_get_nrow
  (pos) = let
//
val+
POSTN
(ntot, nrow, ncol) = pos in nrow
//
end (*let*) // end of [postn_get_nrow]

(* ****** ****** *)

#implfun
postn_get_ncol
  (pos) = let
//
val+
POSTN
(ntot, nrow, ncol) = pos in ncol
//
end (*let*) // end of [postn_get_ncol]

(* ****** ****** *)
//
#implfun
postn_make_int3
( ntot
, nrow, ncol) = POSTN(ntot, nrow, ncol)
//
(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

local

datatype
loctn =
LOCTN of
( lcsrc(*ntot*)
, postn(*pbeg*)
, postn(*pend*))
#absimpl loctn_tbox = loctn

in//local

#implfun
loctn_get_lsrc
  (loc) = let
//
val+
LOCTN
(lsrc, pbeg, pend) = loc in lsrc
//
end (*let*) // end of [loctn_get_lsrc]

#implfun
loctn_get_pbeg
  (loc) = let
//
val+
LOCTN
(lsrc, pbeg, pend) = loc in pbeg
//
end (*let*) // end of [loctn_get_pbeg]

#implfun
loctn_get_pend
  (loc) = let
//
val+
LOCTN
(lsrc, pbeg, pend) = loc in pend
//
end (*let*) // end of [loctn_get_pend]

#implfun
loctn_make_arg3
(src,ps1,ps2) = LOCTN(src,ps1,ps2)

end (*local*) // end of [local]

(* ****** ****** *)
//
#implfun
loctn_make_fpath
(fp0, ps1, ps2) =
let
  val src = LCSRCfpath(fp0)
in
  loctn_make_arg3( src, ps1, ps2 )
end(*let*)//end-of(loctn_make_fpath)
//
(* ****** ****** *)

#implfun
add_loctn_loctn(lc1, lc2) =
let
val
lcs = lc1.lsrc()
val
pb1 = lc1.pbeg() and pb2 = lc2.pbeg()
val
pe1 = lc1.pend() and pe2 = lc2.pend()
in
loctn_make_arg3
(lcs, g_min(pb1, pb2), g_max(pe1, pe2))
end (*let*) // end of [add_loctn_loctn]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_locinfo.dats] *)
