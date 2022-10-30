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
Sun 30 Oct 2022 03:56:27 PM EDT
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
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
//
#implfun
s2exp_revar
(s2e0, s2v0, s2v1) =
let
var flag: sint = 0
in//let
s2exp_revar_flag(s2e0, s2v0, s2v1, flag)
end (*let*) // end of [s2exp_revar(...)]
//
#implfun
l2s2e_revar
(ls2e, s2v0, s2v1) =
let
var flag: sint = 0
in//let
l2s2e_revar_flag(ls2e, s2v0, s2v1, flag)
end (*let*) // end of [l2s2e_revar(...)]
//
(* ****** ****** *)
//
#implfun
s2explst_revar
(s2es, s2v0, s2v1) =
let
var flag: sint = 0
in//let
s2explst_revar_flag(s2es, s2v0, s2v1, flag)
end (*let*) // end of [s2explst_revar(...)]
//
#implfun
l2s2elst_revar
(lses, s2v0, s2v1) =
let
var flag: sint = 0
in//let
l2s2elst_revar_flag(lses, s2v0, s2v1, flag)
end (*let*) // end of [l2s2elst_revar(...)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_staexp2_utils2.dats] *)
