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
Sun 31 Mar 2024 04:15:28 PM EDT
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
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
//
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
//
#include
"./../HATS/xats2js_dats.hats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
//
#staload "./../SATS/xats2js.sats"
//
(* ****** ****** *)
(* ****** ****** *)

local
//
datavwtp
envx2js =
ENVX2JS of
( FILR(*output*)
, sint(*indent*))
//
#absimpl envx2js_vtbx = envx2js
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
envx2js_get_filr
  ( env0 ) =
let
val+
ENVX2JS
(filr, nind) = env0 in filr end
//
#implfun
envx2js_get_nind
  ( env0 ) =
let
val+
ENVX2JS
(filr, nind) = env0 in nind end
//
(* ****** ****** *)
//
#implfun
envx2js_make_nil
  ((*void*)) =
(
  ENVX2JS(filr, 0)) where
{
val filr = g_stdout<>((*void*)) }
//
(* ****** ****** *)
//
#implfun
envx2js_free_top
  (  env0  ) =
(
case+ env0 of
| ~ENVX2JS(filr, nind) => ((*void*)))
(*case+*)//end-of-(envx2js_free_top(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envx2js_pshlam0
(     env0     ) = let
//
val+
@ENVX2JS(filr, nind) = env0
//
in//let
//
(
  nind := nind + 2; $fold(env0))
//
end (*let*)//end-of-(envx2js_pshlam0(env0))
//
(* ****** ****** *)
//
#implfun
envx2js_poplam0
(     env0     ) = let
//
val+
@ENVX2JS(filr, nind) = env0
//
in//let
//
(
  nind := nind - 2; $fold(env0))
//
end (*let*)//end-of-(envx2js_poplam0(env0))
//
(* ****** ****** *)
(* ****** ****** *)

end (*local*) // end of [ local(envx2js) ]

(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_xats2js_myenv0.dats] *)
(***********************************************************************)
