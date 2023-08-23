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
Wed Aug 23 13:53:22 EDT 2023
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
_(*Trtmp3b*) = "./trtmp3b.dats"
(* ****** ****** *)
#staload "./../SATS/trtmp3b.sats"
(* ****** ****** *)
//
#implfun
trtmp3b_d3patlst
( env0, d3ps ) =
(
  list_trtmp3b_fnp(env0, d3ps, trtmp3b_d3pat))
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3explst
( env0, d3es ) =
(
  list_trtmp3b_fnp(env0, d3es, trtmp3b_d3exp))
//
#implfun
trtmp3b_d3expopt
( env0, dopt ) =
(
  optn_trtmp3b_fnp(env0, dopt, trtmp3b_d3exp))
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3gualst
( env0, d3gs ) =
(
  list_trtmp3b_fnp(env0, d3gs, trtmp3b_d3gua))
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3clslst
( env0, dcls ) =
(
  list_trtmp3b_fnp(env0, dcls, trtmp3b_d3cls))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3b_dynexp.dats] *)
