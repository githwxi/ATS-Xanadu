(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Fri 15 Mar 2024 06:07:38 AM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/trxd3i0.sats"
//
(* ****** ****** *)

local
//
datavwtp
envd3i0 =
ENVD3I0 of ()
#absimpl envd3i0_vtbx = envd3i0
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
envd3i0_make_nil
  ((*void*)) = ENVD3I0( (*void*) )
//
(* ****** ****** *)
//
#implfun
envd3i0_free_top
  (  env0  ) =
(
case+ env0 of ~ENVD3I0( (*0*) ) => ()
)
(*case+*)//end-of-(envd3i0_free_top(env0))
//
(* ****** ****** *)
end (*local*) // end of [ local(envd3i0) ]
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trxd3i0_myenv0.dats] *)
(***********************************************************************)
