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
Start Time: June 11th, 2022
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
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)

val
T0CASE = T_CASE(CSKcas0)
val
T0CASP = T_CASE(CSKcasp)
val
T0CASN = T_CASE(CSKcasn)

(* ****** ****** *)
//
val T0FN0 = T_FUN(FNKfn0)
val T0FN1 = T_FUN(FNKfn1)
val T0FNX = T_FUN(FNKfnx)
val T0FUN = T_FUN(FNKfn1)
//
val T0PRFN0 = T_FUN(FNKprfn0)
val T0PRFN1 = T_FUN(FNKprfn1)
val T0PRFUN = T_FUN(FNKprfn1)
val T0PRAXI = T_FUN(FNKpraxi)
val T0FCAST = T_FUN(FNKfcast)
//
(* ****** ****** *)
//
val T0VAL = T_VAL(VLKval)
val T0VLP = T_VAL(VLKvlp)
val T0VLN = T_VAL(VLKvln)
val T0VAR = T_VAR(VLKvar)
//
val T0PRVAL = T_VAL(VLKprval)
val T0PRVAR = T_VAL(VLKprval)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_lexing0_kword0.dats] *)
