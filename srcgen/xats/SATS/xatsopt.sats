(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: November, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
fun
xatsopt_version
  (out: FILEref): void
//
(* ****** ****** *)
#staload
D0E = "./../SATS/dynexp0.sats"
#staload
D1E = "./../SATS/dynexp1.sats"
#staload
D2E = "./../SATS/dynexp2.sats"
#staload
D3E = "./../SATS/dynexp3.sats"
#staload
D4E = "./../SATS/dynexp4.sats"
(* ****** ****** *)
#staload
HIR = "./../SATS/intrep0.sats"
(* ****** ****** *)
//
typedef
d0parsed = $D0E.d0parsed
typedef
d1transd = $D1E.d1transd
typedef
d2transd = $D2E.d2transd
typedef
d3transd = $D3E.d3transd
typedef
d4transd = $D4E.d4transd
//
typedef
h0comped = $HIR.h0comped
//
(* ****** ****** *)
//
fun
trans01_package
  (p0kg: d0parsed): d1transd
//
(* ****** ****** *)
fun
trans02_package
  (p0kg: d0parsed): d2transd
//
(* ****** ****** *)
//
fun
trans03_package
  (p0kg: d0parsed): d3transd
//
(* ****** ****** *)
//
fun
trans34_package
  (p3kg: d3transd): d4transd
//
(* ****** ****** *)
(*
fun
trans04_package
  (p0kg: d0parsed): d4transd
*)
//
(* ****** ****** *)
//
fun
trs03cmp30_package
  (p0kg: d0parsed): h0comped
//
(* ****** ****** *)
//
fun
trs04cmp30_package
  (p0kg: d0parsed): h0comped
//
(* ****** ****** *)
fun
the_fixity_load
(
  XATSENV: string
) : void =
  "ext#libxatsopt_the_fixity_load"
(* ****** ****** *)
fun
the_basics_load
( XATSENV: string
, stadyn: int, given: string
) : void =
  "ext#libxatsopt_the_basics_load"
//
(* ****** ****** *)
fun
the_prelude_load
( XATSENV: string
, stadyn: int, given: string
) : void =
  "ext#libxatsopt_the_prelude_load"
//
(* ****** ****** *)
fun
the_preludes_load
(
  XATSENV: string
) : void =
  "ext#libxatsopt_the_preludes_load"
fun
the_preludes_load_if
(
  XATSENV: string, flag: &int
) : void =
  "ext#libxatsopt_the_preludes_load_if"
//
(* ****** ****** *)
//
fun
the_XATSHOME_get((*void*)): string
//
(* ****** ****** *)
//
fun
echo_argc_argv
  {n:nat}
( out: FILEref
, argc: int(n), argv: !argv(n)): void
//
(* ****** ****** *)
fun
xatsopt_main0
{n:int | n >= 1}(int(n), !argv(n)): void
//
(* ****** ****** *)

(* end of [xats_xatsopt.sats] *)
