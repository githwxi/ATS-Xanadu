(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Fri Jun  6 06:40:30 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"xatslib\
/libcats\
/HATS/libcats_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/trx3cpy.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/xsymmap.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#typedef s2varlst = list(s2var)
#typedef s2cstlst = list(s2cst)
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datavwtp
env3cpy =
ENV3CPY of
(stkmap(s2varlst))
//
#absimpl env3cpy_vtbx = env3cpy
//
in//local
//
(* ****** ****** *)
//
#implfun
env3cpy_make_nil
  ( (*void*) ) = let
//
val
stkmap =
stkmap_make_nil() in ENV3CPY(stkmap)
//
end(*let*)//end-of-[env3cpy_make_nil()]
//
(* ****** ****** *)
//
#implfun
env3cpy_free_nil
  (  env0  ) =
(
case+ env0 of
~ENV3CPY(stkmap) =>
let
//
var
stkmap = stkmap
//
val nerr =
stkmap_poptop0(stkmap)
//
val (  ) =
stkmap_free_nil(stkmap) in () end//let
)(*case+*)//end-of-(env3cpy_free_nil(env0))
//
(* ****** ****** *)
//
end(*local*)//end-of-[absimpl(env3cpy_vtbx)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trx3cpy_myenv0.dats] *)
(***********************************************************************)
