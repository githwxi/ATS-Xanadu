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
Mon 08 Jul 2024 05:07:13 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
list_vt_forall0
  ( xs ) = 
(
  loop(xs) ) where
{
fun
loop
(xs: list_vt(x0)): bool =
(
case+ xs of
| ~
list_vt_nil
  ((*0*)) => (true)
| ~
list_vt_cons(x1, xs) =>
let
val test =
forall$test0<x0>(x1) in
if test then loop(xs) else false end)
}
//
#impltmp
< x0:vt >
list_vt_forall1
  ( xs ) = 
(
  loop(xs) ) where
{
fun
loop
(xs: list_vt(x0)): bool =
(
case+ xs of
|
list_vt_nil
  ((*0*)) => (true)
|
list_vt_cons(x1, xs) =>
let
val test =
forall$test1<x0>(x1) in
if test then loop(xs) else false end)
}
//
#impltmp
{ x0:vt }
gseq_forall0
<list_vt(x0)><x0> = list_vt_forall0<x0>(*void*)
#impltmp
{ x0:vt }
gseq_forall1
<list_vt(x0)><x0> = list_vt_forall1<x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
list_vt_rforall0
  ( xs ) = 
(
list_vt_forall0<x0>
(list_vt_reverse0<x0>(xs))) where
{
#impltmp
forall$test0<x0> = rforall$test0<x0>
}
//
#impltmp
< x0:vt >
list_vt_rforall1
  ( xs ) = 
(
list_vt_forall0<x0>
(list_vt_reverse1<x0>(xs))) where
{
#impltmp
forall$test0<x0>(x0) =
(
g_free<x0>(x0); test) where
{
  val test = rforall$test1<x0>(x0) }
}
//
#impltmp
{ x0:vt }
gseq_rforall0
<list_vt(x0)><x0> = list_vt_rforall0<x0>(*void*)
#impltmp
{ x0:vt }
gseq_rforall1
<list_vt(x0)><x0> = list_vt_rforall1<x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
list_vt_iforall0 = gseq_iforall0<list_vt(x0)><x0>
#impltmp
< x0:vt >
list_vt_iforall1 = gseq_iforall1<list_vt(x0)><x0>
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
list_vt_irforall0 = gseq_irforall0<list_vt(x0)><x0>
#impltmp
< x0:vt >
list_vt_irforall1 = gseq_irforall1<list_vt(x0)><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
list_vt_foritm0
  (xs) = 
(
  loop(xs) ) where
{
fun
loop
(xs: list_vt(x0)): void =
(
case+ xs of
| ~
list_vt_nil
  ((*0*)) => ((*0*))
| ~
list_vt_cons(x1, xs) =>
let
val () =
foritm$work0<x0>(x1) in loop(xs) end)
}
//
#impltmp
< x0:vt >
list_vt_foritm1
  (xs) = 
(
  loop(xs) ) where
{
fun
loop
(xs: !list_vt(x0)): void =
(
case+ xs of
|list_vt_nil
  ((*0*)) => ((*0*))
|
list_vt_cons(x1, xs) =>
let
val () =
foritm$work1<x0>(x1) in loop(xs) end)
}
//
#impltmp
{ x0:vt }
gseq_foritm0
<list_vt(x0)><x0> = list_vt_foritm0<x0>(*void*)
#impltmp
{ x0:vt }
gseq_foritm1
<list_vt(x0)><x0> = list_vt_foritm1<x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
list_vt_rforitm0 = gseq_rforitm0<list_vt(x0)><x0>
#impltmp
< x0:vt >
list_vt_rforitm1 = gseq_rforitm1<list_vt(x0)><x0>
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
list_vt_iforitm0 = gseq_iforitm0<list_vt(x0)><x0>
#impltmp
< x0:vt >
list_vt_iforitm1 = gseq_iforitm1<list_vt(x0)><x0>
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
list_vt_irforitm0 = gseq_irforitm0<list_vt(x0)><x0>
#impltmp
< x0:vt >
list_vt_irforitm1 = gseq_irforitm1<list_vt(x0)><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX: 2024-07-28:
Sun 28 Jul 2024 02:37:26 PM EDT
*)
//
#impltmp
<x0>(*tmp*)
list_vt_strmize0
  (xs) =
let
fun
auxmain(xs) =
$llazy
(
case+ xs of
| ~
list_vt_nil() =>
strmcon_vt_nil()
| ~
list_vt_cons(x0, xs) =>
strmcon_vt_cons(x0, auxmain(xs))
)
in
  auxmain(xs)
end(*let*)//end-of-[list_vt_strmize0(xs)]
//
#impltmp
{ x0:vt }
gseq_strmize0
<list_vt(x0)><x0> = list_vt_strmize0<x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_list001_vt.dats] *)
