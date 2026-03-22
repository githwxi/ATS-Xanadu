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
Sat Mar 14 01:16:57 PM EDT 2026
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
#include
"./../HATS/libxatsopt.hats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/trxd3i0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#vwtpdef
d2vstk = (*$MAP*)stkmap( i0var )
(* ****** ****** *)
(* ****** ****** *)
//
local
//
(* ****** ****** *)
//
datavwtp
envstk =
//
|envstk_nil of ((*0*)) 
//
|envstk_lam0 of
( sint(*lvl0*), envstk ) 
|envstk_let0 of ( envstk ) 
//
|envstk_cons of
( i0var(*denv*), envstk )
|envstk_ufld of
( d2var(*lvrt*), i0typ, envstk)
//
(* ****** ****** *)
#absimpl envstk_vtbx = (envstk)
(* ****** ****** *)
//
datavwtp
envd3i0 =
ENVD3I0 of
(d2vstk, envstk)
#absimpl envd3i0_vtbx = envd3i0
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
envd3i0_make_nil
  ((*void*)) =
(
ENVD3I0
(d2vstk, envstk)) where
{
  val envstk = envstk_nil()
  val d2vstk = stkmap_make_nil()
}(*where*) // end of [envd3i0_make_nil]
//
(* ****** ****** *)
//
#implfun
envd3i0_free_top
  (  env0  ) =
(
stkmap_free_nil(d2vstk)
;
envstk_free$top(envstk)) where
{
val+
~ENVD3I0(d2vstk, envstk) = env0 }
(*where*)//end-of-(envd3i0_free_top(env0))
//
(* ****** ****** *)
//
endloc (*local*) // end-of-[ local(envd3i0) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen1_DATS_trxd3i0_myenv0.dats] *)
(***********************************************************************)
