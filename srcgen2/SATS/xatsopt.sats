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
Sat 15 Jul 2023 12:01:12 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
S0E = "./../SATS/staexp0.sats"
#staload
S1E = "./../SATS/staexp1.sats"
#staload
S2E = "./../SATS/staexp2.sats"
#staload
T2P = "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload
D0E = "./../SATS/dynexp0.sats"
#staload
D1E = "./../SATS/dynexp1.sats"
#staload
D2E = "./../SATS/dynexp2.sats"
#staload
D3E = "./../SATS/dynexp3.sats"
(* ****** ****** *)
//
#absvwtp
argv_i0_vx(n:i0) <= p0tr
#vwtpdef
argv(n:i0) = argv_i0_vx(n:i0)
//
(* ****** ****** *)
//
#typedef d0parsed = $D0E.d0parsed
#typedef d1parsed = $D1E.d1parsed
#typedef d2parsed = $D2E.d2parsed
#typedef d3parsed = $D3E.d3parsed
//
(* ****** ****** *)
//
fun
xatsopt_main0
{n:int|n >= 1}
(argc: sint(n), argv: !argv(n)): void
//
(* ****** ****** *)
//
fun
echo_argc_argv
  {n:nat}
( out0: FILEref
, argc: sint(n), argv: !argv(n)): void
//
(* ****** ****** *)
//
fun
xatsopt_version(): string
fun
xatsopt_fprint_version(out: FILEref): void
//
(* ****** ****** *)
//
fun
d2parsed_of_filsats(fpth: string): d2parsed
fun
d2parsed_of_fildats(fpth: string): d2parsed
//
fun
d2parsed_of_trans02(dpar: d0parsed): d2parsed
//
(* ****** ****** *)
//
fun
d3parsed_of_filsats(fpth: string): d3parsed
fun
d3parsed_of_fildats(fpth: string): d3parsed
//
fun
d3parsed_of_trans03(dpar: d0parsed): d3parsed
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xatsopt.sats] *)
