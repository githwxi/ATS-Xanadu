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
//
Mon Nov  2 09:29:13 AM EST 2026
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
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/cc1emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datavwtp
envxcc1 =
ENVXCC1 of
( FILR(*output*)
, sint(*indent*))
//
#absimpl envxcc1_vtbx = envxcc1
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
envxcc1_filr$get
  ( env0 ) =
let
val+
ENVXCC1
(filr, nind) = env0 in filr end
//
#implfun
envxcc1_nind$get
  ( env0 ) =
let
val+
ENVXCC1
(filr, nind) = env0 in nind end
//
(* ****** ****** *)
//
#implfun
envxcc1_make_out
  (out: FILR) = ENVXCC1(out, 0)
//
(* ****** ****** *)
//
#implfun
envxcc1_free_nil
  (  env0  ) =
(
case+ env0 of
| ~
ENVXCC1(filr, nind) => ((*void*)))
(*case+*)//end-of-(envxcc1_free_nil(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envxcc1_incnind
(  env0, ninc  ) = let
//
val+
@ENVXCC1(filr, !nind) = env0
//
in//let
//
(
  nind :=
  nind + ninc; $fold(env0))
//
end (*let*)//end-of-(envxcc1_incnind(env0))
//
#implfun
envxcc1_decnind
(  env0, ndec  ) = let
//
val+
@ENVXCC1(filr, !nind) = env0
//
in//let
//
(
  nind :=
  nind - ndec; $fold(env0))
//
end (*let*)//end-of-(envxcc1_decnind(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
end (*local*) // end of [local(envxcc1_vtbx)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_cc1emit_myenv0.dats] *)
(***********************************************************************)
(***********************************************************************)
