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
fun
<a0:vt>
mytest_arg(): a0
#extern
fun
<f0:t0>
<r0:vt>
mytest_fun(fx: f0): r0

(* ****** ****** *)

impltmp
<a0:vt>
mytest_arg
(
// argless
) =
( arg ) where
{
val
arg = rand<a0>()
//
(*
val () =
println!
("mytest_arg: arg = ", arg)
*)
//
} (* end of [where] *)
//
endwhr // end of [mytest_arg]

(* ****** ****** *)

impltmp
{r0:vt}
mytest_fun
<()-<fnp>r0>(f0) = f0()
impltmp
{r0:vt}
mytest_fun
<()-<cfr>r0>(f0) = f0()

(* ****** ****** *)
//
impltmp
{a1:vt}
{r0:vt}
mytest_fun
<(a1)-<fnp>r0>(f0) =
let
val x1 = mytest_arg<a1>() in f0(x1)
end
impltmp
{a1:vt}
{r0:vt}
mytest_fun
<(a1)-<cfr>r0>(f0) =
let
val x1 = mytest_arg<a1>() in f0(x1)
end
//
(* ****** ****** *)
//
impltmp
{a1:vt
,a2:vt}
{r0:vt}
mytest_fun
<(a1,a2)-<fnp>r0>(f0) =
let
val x1 = mytest_arg<a1>()
val x2 = mytest_arg<a2>() in f0(x1, x2)
end
impltmp
{a1:vt
,a2:vt}
{r0:vt}
mytest_fun
<(a1,a2)-<cfr>r0>(f0) =
let
val x1 = mytest_arg<a1>()
val x2 = mytest_arg<a2>() in f0(x1, x2)
end
//
(* ****** ****** *)
//
#extern
fun
<f0:t0>
mytest_fun_asso(fx: f0): bool
//
impltmp
{a0:t0}
mytest_fun_asso
<(a0, a0)-<fnp>a0>
 (  f0  ) = let
//
val x1 = mytest_arg<a0>()
val x2 = mytest_arg<a0>()
val x3 = mytest_arg<a0>()
//
in
  f0(f0(x1, x2), x3) = f0(x1, f0(x2, x3))
end // end of [mytest_fun_asso]
impltmp
{a0:t0}
mytest_fun_asso
<(a0,a0)-<cfr>a0>
  (f0) = let
//
val x1 = mytest_arg<a0>()
val x2 = mytest_arg<a0>()
val x3 = mytest_arg<a0>()
//
in
  f0(f0(x1, x2), x3) = f0(x1, f0(x2, x3))
end // end of [mytest_fun_asso]
//
(* ****** ****** *)
//
#extern
fun
<f0:t0>
mytest_fun_comm(fx: f0): bool
//
impltmp
{a0:t0}
{r0:vt}
mytest_fun_comm
<(a0, a0)-<fnp>r0>
 (  f0  ) = let
//
val x1 =
mytest_arg<a0>()
val x2 =
mytest_arg<a0>() in f0(x1, x2) = f0(x2, x1)
end // end of [mytest_fun_comm]
impltmp
{a0:t0}
{r0:vt}
mytest_fun_comm
<(a0, a0)-<cfr>r0>
 (  f0  ) = let
//
val x1 =
mytest_arg<a0>()
val x2 =
mytest_arg<a0>() in f0(x1, x2) = f0(x2, x1)
end // end of [mytest_fun_comm]
//
(* ****** ****** *)

(* end of [mytest.dats] *)
