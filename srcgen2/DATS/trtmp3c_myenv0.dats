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
Thu Nov  9 13:21:16 EST 2023
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
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trtmp3c.sats"
(* ****** ****** *)
(* ****** ****** *)
//
local
val
stamper =
stamper_new((*0*))
in//local
fun
the_tmqstk_stamp_new
  ((*void*)): stamp =
  stamper.getinc((*void*))
endloc // the_tmqstk_stamp_new
//
(* ****** ****** *)
(* ****** ****** *)
(*
local
*)
(* ****** ****** *)
//
datavwtp
tmqstk =
//
| tmqstk_nil of ()
//
| tmqstk_svts of
  ( s2vts, tmqstk )
| tmqstk_timp of
  ( timpl, tmqstk )
//
| tmqstk_decl of
  (stamp, d3ecl, tmqstk)
//
| tmqstk_dexp of
  (stamp, d3exp, tmqstk)
//
| tmqstk_let0 of (tmqstk)
| tmqstk_loc1 of (tmqstk)
| tmqstk_loc2 of (tmqstk)
//
(* ****** ****** *)
//
datavwtp
tr3cenv =
TR3CENV of
(
topmap
(d3eclist), tmqstk(*void*))
//
(* ****** ****** *)
#absimpl tmqstk_vtbx = tmqstk
(* ****** ****** *)
#absimpl tr3cenv_vtbx = tr3cenv
(* ****** ****** *)
//
fun
tmqstk_free_nil
(stk0: ~tmqstk): void =
(
case- stk0 of
| ~tmqstk_nil() => ((*void*)))
//
(* ****** ****** *)
(*
in//local
*)
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tmqstk_nilq
(   stk0   ) =
(
case+ stk0 of
| !
tmqstk_nil() => true
| _(*non-nil*) => false
) (* end of [tmqstk_nilq(stk0)] *)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tmqstk_getstmp
  (  stk0  ) =
(
case+ stk0 of
//
| !
tmqstk_svts
(svts, stk1) =>
(
  tmqstk_getstmp(stk1))
| !
tmqstk_timp
(timp, stk1) =>
(
  tmqstk_getstmp(stk1))
//
| !
tmqstk_decl
(stmp, _, _) => ( stmp )
//
| !
tmqstk_let0
(   stk1   ) =>
(
  tmqstk_getstmp(stk1))
//
| !
tmqstk_loc1
(   stk1   ) =>
(
  tmqstk_getstmp(stk1))
| !
tmqstk_loc2
(   stk1   ) =>
(
  tmqstk_getstmp(stk1))
//
| !
tmqstk_nil() => the_stamp_nil
//
) (*case+*) // end of [tmqstk_getstmp(stk0)]
//
(* ****** ****** *)
//
#implfun
tmqstk_getsvts
  (  stk0  ) =
(
case+ stk0 of
//
| !
tmqstk_svts
(svts, stk1) => (svts)
//
| !
tmqstk_timp
(timp, stk1) =>
(
  tmqstk_getsvts(stk1))
//
| !
tmqstk_decl
(_, _, stk1) =>
(
  tmqstk_getsvts(stk1))
//
| !
tmqstk_let0
(   stk1   ) =>
(
  tmqstk_getsvts(stk1))
//
| !
tmqstk_loc1
(   stk1   ) =>
(
  tmqstk_getsvts(stk1))
| !
tmqstk_loc2
(   stk1   ) =>
(
  tmqstk_getsvts(stk1))
//
| !
tmqstk_nil() => list_nil(*void*)
//
) (*case+*) // end of [tmqstk_getsvts(stk0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
endloc (*local*) // end of [local(tr3cenv...)]
*)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3c_myenv0.dats] *)
