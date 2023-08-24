(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Wed Aug 23 19:51:02 EDT 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trtmp3b.sats"
(* ****** ****** *)

local

(* ****** ****** *)
//
datatype
tmpstk =
//
| tmpstk_nil of ()
//
| tmpstk_cons of
  (stamp, d3ecl, tmpstk)
//
| tmpstk_let0 of (tmpstk)
| tmpstk_loc0 of (tmpstk)
//
(* ****** ****** *)
#absimpl tmpstk_vtbx = tmpstk
(* ****** ****** *)
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
tmpstk_nilq
(   map   ) =
(
case+ map of
| !
tmpstk_nil() => true | _ => false
) (* end of [tmpstk_nilq(map)] *)
//
(* ****** ****** *)

endloc (*local*) // end of [local(tr3benv...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3b_myenv0.dats] *)
