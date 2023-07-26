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
Sat 15 Jul 2023 10:26:59 AM EDT
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
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/parsing.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
#staload "./../SATS/tread01.sats"
(* ****** ****** *)
#staload "./../SATS/trans12.sats"
#staload "./../SATS/tread12.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
#staload "./../SATS/trsym2a.sats"
#staload "./../SATS/tread22.sats"
(* ****** ****** *)
#staload "./../SATS/trans23.sats"
#staload "./../SATS/tread23.sats"
(* ****** ****** *)
#staload "./../SATS/trans3a.sats"
#staload "./../SATS/tread33.sats"
(* ****** ****** *)
#staload "./../SATS/xatsopt.sats"
(* ****** ****** *)

#implfun
d2parsed_of_filsats(fpth) =
d2parsed_of_trans02
(d0parsed_from_fpath(0(*sta*), fpth))
#implfun
d2parsed_of_fildats(fpth) =
d2parsed_of_trans02
(d0parsed_from_fpath(1(*dyn*), fpth))

(* ****** ****** *)

#implfun
d3parsed_of_filsats(fpth) =
d3parsed_of_trans03
(d0parsed_from_fpath(0(*sta*), fpth))
#implfun
d3parsed_of_fildats(fpth) =
d3parsed_of_trans03
(d0parsed_from_fpath(1(*dyn*), fpth))

(* ****** ****** *)

#implfun
d2parsed_of_trans02(dpar) =
let
val dpar = d1parsed_of_trans01(dpar)
val dpar = d2parsed_of_trans12(dpar)
val dpar = d2parsed_of_tread12(dpar)
val dpar = d2parsed_of_trans2a(dpar)
val (  ) = d2parsed_at_trsym2a(dpar)
val dpar = d2parsed_of_tread22(dpar) in dpar
end (*let*) // end of [d2parsed_of_trans02(dpar)]

(* ****** ****** *)

#implfun
d3parsed_of_trans03(dpar) =
let
val dpar = d2parsed_of_trans02(dpar)
val dpar = d3parsed_of_trans23(dpar)
val dpar = d3parsed_of_tread23(dpar)
val dpar = d3parsed_of_trans3a(dpar)
val dpar = d3parsed_of_tread33(dpar) in dpar
end (*let*) // end of [d3parsed_of_trans03(dpar)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xatsopt.dats] *)
