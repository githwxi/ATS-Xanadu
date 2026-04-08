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
HX-2026-04-08:
This one is likely no
longer needed as [uopt] can
be implemented as uflat(optn)!
Wed Apr  8 02:51:46 AM EDT 2026
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstype
uopt_t0_b0_t0
( a:t0,b:b0 ) <= @(sint, a)
#sexpdef uopt = uopt_t0_b0_t0
//
#typedef
uopt(a:t0) = [b:b0] uopt(a, b)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
uopt_nil
((*0*)): uopt(x0, false)
fun
<x0:t0>
uopt_cons
(x0: a): uopt(x0, (true))
fun
<x0:t0>
uopt_uncons
(xs: uopt(x0, true)): (x0)
//
fun
<x0:t0>
uopt_nilq
{b1:b0}(uopt(x0, b1)): bool(~b1)
fun
<x0:t0>
uopt_consq
{b1:b0}(uopt(x0, b1)): bool( b1)
//
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_uopt000.sats] *)
(***********************************************************************)
