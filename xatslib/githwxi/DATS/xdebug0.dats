(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
#extern
fun<>
FI$name(): string
(* ****** ****** *)
#extern
fun
<f0:t0>
FI$arity(f0: f0): int
(* ****** ****** *)
#extern
fun
<f0:t0>
FI$pinfo(f0: f0): void
(* ****** ****** *)
#extern
fun
<f1:t0>
<f2:t0>
FI$debug(f1: f1): (f2)
(* ****** ****** *)
// //////////////////////////////////////////////// //
//
// HX-2020-11-16:
// Implementations below
//
// //////////////////////////////////////////////// //
(* ****** ****** *)
#impltmp
<>(*tmp*)
FI$name
() =
"**UNKNOWN**"
(* ****** ****** *)
#impltmp
{f0:t0}
FI$arity
<f0>(f0) = (-1)
(* ****** ****** *)
#impltmp
{r0:vt}
FI$arity
<()->r0>(f0) = 0
#impltmp
{a1:vt}
{r0:vt}
FI$arity
<(a1)->r0>(f0) = 1
#impltmp
{a1:vt
,a2:vt}
{r0:vt}
FI$arity
<(a1,a2)->r0>(f0) = 2
#impltmp
{a1:vt
,a2:vt
,a3:vt}
{r0:vt}
FI$arity
<(a1,a2,a3)->r0>(f0) = 3
(* ****** ****** *)
#impltmp
{f0:t0}
FI$pinfo<f0>(f0) =
let
val nm = FI$name()
val na = FI$arity(f0)
val () =
println("fun(", nm, "): arity = ", na)
end // end of [FI$info]
(* ****** ****** *)
#impltmp
{f0:t0}
FI$debug
<f0><f0>(f0) = f0
(* ****** ****** *)
#impltmp
{r0:vt}
FI$debug
<()->r0>
<()-<cfr>r0>
(f0) =
lam() => r0 where
{
val nm = FI$name()
val () = println(nm, ": call")
val r0 = f0()
val () = println(nm, ": res0 = ", r0)
}
(* ****** ****** *)
#impltmp
{a1:vt}
{r0:vt}
FI$debug
<(a1)->r0>
<(a1)-<cfr>r0>
(f0) =
lam(x1) => r0 where
{
val nm = FI$name()
val () = println(nm, ": call")
val () = println(nm, ": arg1 = ", x1)
val r0 = f0(x1)
val () = println(nm, ": res0 = ", r0)
}
(* ****** ****** *)
#impltmp
{a1:vt
,a2:vt}
{r0:vt}
FI$debug
<(a1,a2)->r0>
<(a1,a2)-<cfr>r0>
(f0) =
lam(x1, x2) => r0 where
{
val nm = FI$name()
val () = println(nm, ": call")
val () = println(nm, ": arg1 = ", x1)
val () = println(nm, ": arg2 = ", x2)
val r0 = f0(x1, x2)
val () = println(nm, ": res0 = ", r0)
}
(* ****** ****** *)

(* end of [xatslib_githwxi_xdebug00.dats] *)
