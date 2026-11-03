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
Fri Sep 25 11:43:17 AM EDT 2026
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
#staload "./../SATS/xats2cc.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datavwtp
envx2cc =
ENVX2CC of
( FILR(*output*)
, sint(*indent*))
//
#absimpl envx2cc_vtbx = envx2cc
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
envx2cc_filr$get
  ( env0 ) =
let
val+
ENVX2CC
(filr, nind) = env0 in filr end
//
#implfun
envx2cc_nind$get
  ( env0 ) =
let
val+
ENVX2CC
(filr, nind) = env0 in nind end
//
(* ****** ****** *)
//
#implfun
envx2cc_make_out
  (out: FILR) = ENVX2CC(out, 0)
//
(* ****** ****** *)
//
#implfun
envx2cc_free_nil
  (  env0  ) =
(
case+ env0 of
| ~
ENVX2CC(filr, nind) => ((*void*)))
(*case+*)//end-of-(envx2cc_free_nil(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envx2cc_incnind
(  env0, ninc  ) = let
//
val+
@ENVX2CC(filr, !nind) = env0
//
in//let
//
(
  nind :=
  nind + ninc; $fold(env0))
//
end (*let*)//end-of-(envx2cc_incnind(env0))
//
#implfun
envx2cc_decnind
(  env0, ndec  ) = let
//
val+
@ENVX2CC(filr, !nind) = env0
//
in//let
//
(
  nind :=
  nind - ndec; $fold(env0))
//
end (*let*)//end-of-(envx2cc_decnind(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
end (*local*) // end of [local(envx2cc_vtbx)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_xats2cc_myenv0.dats] *)
(***********************************************************************)
(***********************************************************************)
