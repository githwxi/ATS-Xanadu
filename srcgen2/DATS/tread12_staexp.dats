(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Fri 11 Nov 2022 03:23:24 PM EST
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
#staload "./../SATS/tread12.sats"
(* ****** ****** *)
//
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload node with s2exp_get_node
#symload sort with s2exp_get_sort
(* ****** ****** *)
//
(* ****** ****** *)
//
#implfun
tread12_sort2lst
  (  s2ts, err0  ) =
list_tread12_fnp(s2ts, err0, tread12_sort2)
//
(* ****** ****** *)
//
#implfun
tread12_s2explst
  (  s2es, err0  ) =
list_tread12_fnp(s2es, err0, tread12_s2exp)
//
(* ****** ****** *)
//
#implfun
tread12_l2s2elst
  (  lses, err0  ) =
list_tread12_fnp(lses, err0, tread12_l2s2e)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread12_staexp.dats] *)
