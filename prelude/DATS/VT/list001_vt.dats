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
(*
HX-2024-09-14:
Sat 14 Sep 2024 03:04:03 PM EDT
*)
//
#impltmp
< x0:t0 >
< y0:t0 >
list_vt_map0
  ( xs ) = let
//
fnx
loop
{i:nat}.<i>.
( xs
: ~list_vt(x0,i)
, r0
: &(?list_vt(y0)) >> list_vt(y0,i)
) : void =
(
case+ xs of
| ~
list_vt_nil() =>
(r0 := list_vt_nil())
| ~
list_vt_cons(x0, xs) =>
let
val y0 =
map$fopr0<x0><y0>(x0)
val () =
(r0 := list_vt_cons(y0, _))
in
(
  loop(xs, r0.1); $fold(r0))
end
) (* end of [loop] *)
//
in
//
let
  var r0: list_vt(y0)
  val () = loop(xs, r0) in r0 end//let
//
end(*let*)//end-of-[ list_vt_map0(...) ]
//
#impltmp
< x0:vt >
< y0:vt >
list_vt_map0$f1un
  (xs, f0) =
(
  list_vt_map0<x0><y0>(xs)) where
{
#impltmp map$fopr0<x0><y0>(x0) = f0(x0)
}(*where*)//end-of-[list_vt_map0$f1un(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0><y0>
list_vt_maprev0
  ( xs ) =
(
let
val ys =
list_vt_nil() in loop(xs, ys)
end//let
) where
{
//
fnx
loop
{i,j:nat}.<i>.
( xs
: list_vt(x0, i)
, ys
: list_vt(y0, j))
: list_vt(y0, i+j) =
(
case+ xs of
| ~
list_vt_nil() => ys
| ~
list_vt_cons(x0, xs) =>
let
  val y0 =
  map$fopr0<x0><y0>(x0)
in
  loop(xs, list_vt_cons(y0, ys))
end//let//end-of-[list_vt_cons(...)]
)
//
}(*where*)//end-of-[list_vt_maprev0(...)]
//
#impltmp
< x0:vt >
< y0:vt >
list_vt_maprev0$f1un
  (xs, f0) =
(
  list_vt_maprev0<x0><y0>(xs)) where
{
#impltmp map$fopr0<x0><y0>(x0) = f0(x0)
}(*where*)//end-of-[list_vt_maprev0$f1un(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-01-12:
Sun Jan 12 09:23:42 AM EST 2025
*)
//
#impltmp
< x0:vt >
< r0:vt >
list_vt_folditm0 =
gseq_folditm0<list_vt(x0)><x0><r0>
//
#impltmp
< x0:vt >
< r0:vt >
list_vt_rfolditm0 =
gseq_rfolditm0<list_vt(x0)><x0><r0>
//
#impltmp
< x0:vt >
< r0:vt >
list_vt_ifolditm0 =
gseq_ifolditm0<list_vt(x0)><x0><r0>
//
#impltmp
< x0:vt >
< r0:vt >
list_vt_irfolditm0 =
gseq_irfolditm0<list_vt(x0)><x0><r0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_list001_vt.dats] *)
