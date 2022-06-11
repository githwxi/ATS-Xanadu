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

(* end of [ATS3/XATSOPT_locinfo.dats] *)
