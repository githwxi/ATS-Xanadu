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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
//
Sat May  9 03:15:00 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
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
#staload ".\
/../../../xats2cc\
/srcgen1/SATS/intrep0.sats"//...
//
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/trxi0i1.sats"
#staload "./../SATS/xats2js.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)
// local
(* ****** ****** *)
//
datavwtp
envx2js =
ENVX2JS of
( FILR(*output*)
, sint(*level0*)
, sint(*indent*))
//
#absimpl envx2js_vtbx = envx2js
//
(* ****** ****** *)
// in//local
(* ****** ****** *)
//
#implfun
envx2js_filr$get
  ( env0 ) =
let
val+
ENVX2JS
(filr
,lvl0, nind) = env0 in filr end
//
#implfun
envx2js_lvl0$get
  ( env0 ) =
let
val+
ENVX2JS
(filr
,lvl0, nind) = env0 in lvl0 end
//
#implfun
envx2js_nind$get
  ( env0 ) =
let
val+
ENVX2JS
(filr
,lvl0, nind) = env0 in nind end
//
(* ****** ****** *)
//
#implfun
envx2js_make_out
  ( filr ) = ENVX2JS(filr, 0, 0)
//
(* ****** ****** *)
//
#implfun
envx2js_free_nil
  (  env0  ) =
(
case+ env0 of
| ~
ENVX2JS
(filr, lvl0, nind) => ((*void*)))
(*case+*)//end-of-(envx2js_free_nil(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envx2js_incnind
(  env0, ninc  ) = let
//
val+
@ENVX2JS
(filr, lvl0, !nind) = env0
//
in//let
//
(
nind := nind + ninc; $fold(env0))
//
end (*let*)//end-of-(envx2js_incnind(env0))
//
#implfun
envx2js_decnind
(  env0, ndec  ) = let
//
val+
@ENVX2JS
(filr, lvl0, !nind) = env0
//
in//let
//
(
nind := nind - ndec; $fold(env0))
//
end (*let*)//end-of-(envx2js_decnind(env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
envx2js_pshlam0
(     env0     ) = let
//
val+
@ENVX2JS
(filr, !lvl0, !nind) = env0
//
in//let
//
(
  lvl0 := lvl0 + 1;
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
@ENVX2JS
(filr, !lvl0, !nind) = env0
//
in//let
//
(
  lvl0 := lvl0 - 1;
  nind := nind - 2; $fold(env0))
//
end (*let*)//end-of-(envx2js_poplam0(env0))
//
(* ****** ****** *)
(* ****** ****** *)
// end (*local*) // end of [local(envx2js_vtbx)]
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen2_DATS_xats2js_myenv0.dats] *)
(***********************************************************************)
