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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sat 06 Jul 2024 07:34:54 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/xdpndcy.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/libxatsopt.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload
_(*XDPNDCY*) = "./xdpndcy.dats"
(* ****** ****** *)
(* ****** ****** *)
//
local
//
datavwtp
xd2penv =
XD2PENV of (d2eclist)
//
#absimpl xd2penv_vtbx = xd2penv
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
#implfun
xd2penv_make_nil
  ( (*void*) ) =
(
  XD2PENV(list_nil(*void*)))
//
(* ****** ****** *)
//
#implfun
xd2penv_free_top
  (   env0   ) =
let
val ~
XD2PENV(dcls) = env0 in dcls end//let
//
(* ****** ****** *)
//
#implfun
xd2penv_insert$d2ecl
  (env0, d2cl) =
let
val XD2PENV(!dcls) = env0
in//let
  dcls := list_cons(d2cl, dcls) end//let
//
(* ****** ****** *)
//
endloc (*local*) // end of [ local(xd2penv...) ]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xdpndcy_srcgen1_xdpndcy_myenv0.dats] *)
