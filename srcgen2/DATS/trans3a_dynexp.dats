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
Tue 25 Jul 2023 05:33:23 PM EDT
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
#staload
_(*TRANS3a*) = "./trans3a.dats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trans3a.sats"
(* ****** ****** *)
//
#implfun
trans3a_d3patlst
  (env0, d3ps) =
(
  list_trans3a_fnp(env0, d3ps, trans3a_d3pat))
//
(* ****** ****** *)
//
#implfun
trans3a_d3expopt
( env0, dopt ) =
(
  optn_trans3a_fnp(env0, dopt, trans3a_d3exp))
//
#implfun
trans3a_d3explst
  (env0, d3es) =
(
  list_trans3a_fnp(env0, d3es, trans3a_d3exp))
//
(* ****** ****** *)
//
#implfun
trans3a_l3d3plst
( env0, ldps ) =
(
  list_trans3a_fnp(env0, ldps, trans3a_l3d3p))
//
#implfun
trans3a_l3d3elst
( env0, ldes ) =
(
  list_trans3a_fnp(env0, ldes, trans3a_l3d3e))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans3a_dynexp.dats] *)
