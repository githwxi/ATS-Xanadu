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
//
(*
Author: Hongwei Xi
(*
Sun 14 Jul 2024 09:17:49 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_forall
  ( xs ) = 
(
  loop(xs) ) where
{
fun
loop
(xs: list(x0)): bool =
(
case+ xs of
| ~
list_nil() =>
  ( true )
| ~
list_cons(x1, xs) =>
let
val test =
forall$test<x0>(x1) in
if test then loop(xs) else false end)
}
//
#impltmp
{ x0:t0 }
gseq_forall
<list(x0)><x0> = list_forall<x0>
#impltmp
{ x0:t0 }
gseq_forall0
list_forall<x0>(xs) where
{
#impltmp
forall$test<x0>(x0) = forall$test0<x0>(x0)
}
#impltmp
{ x0:t0 }
gseq_forall1
<list(x0)><x0>(xs) =
list_forall<x0>(xs) where
{
#impltmp
forall$test<x0>(x0) = forall$test1<x0>(x0)
}
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_rforall
  ( xs ) =
(
list_vt_forall0<x0>
(list_reverse_vt<x0>(xs))) where
{
#impltmp
forall$test0<x0> = rforall$test<x0>
}
//
#impltmp
{ x0:t0 }
gseq_rforall
<list(x0)><x0> = list_rforall<x0>
#impltmp
{ x0:t0 }
gseq_rforall0
list_rforall<x0>(xs) where
{
#impltmp
rforall$test<x0>(x0) = rforall$test0<x0>(x0)
}
#impltmp
{ x0:t0 }
gseq_rforall1
<list(x0)><x0>(xs) =
list_rforall<x0>(xs) where
{
#impltmp
rforall$test<x0>(x0) = rforall$test1<x0>(x0)
}
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_iforall = gseq_iforall<list(x0)><x0>
//
#impltmp
< x0:t0 >
list_irforall = gseq_irforall<list(x0)><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_foritm
  ( xs ) = 
(
  loop(xs) ) where
{
fun
loop
(xs: list(x0)): void =
(
case+ xs of
| ~
list_nil() => ( (*void*) )
| ~
list_cons(x1, xs) =>
let
val () =
foritm$work<x0>(x1) in loop(xs) end)
}
//
#impltmp
{ x0:t0 }
gseq_foritm
<list(x0)><x0> = list_foritm<x0>
#impltmp
{ x0:t0 }
gseq_foritm0
<list(x0)><x0>(xs) =
(
list_foritm<x0>(xs)) where
{
#impltmp
foritm$work<x0> = foritm$work0<x0>
}
#impltmp
{ x0:t0 }
gseq_foritm1
<list(x0)><x0>(xs) =
(
list_foritm<x0>(xs)) where
{
#impltmp
foritm$work<x0> = foritm$work1<x0>
}
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_rforitm(xs) =
(
list_vt_foritm0<x0>
(list_reverse_vt<x0>(xs))) where
{
#impltmp
foritm$work0<x0> = rforitm$work<x0>
}
//
#impltmp
{ x0:t0 }
gseq_rforitm
<list(x0)><x0> = list_rforitm<x0>
#impltmp
{ x0:t0 }
gseq_rforitm0
<list(x0)><x0>(xs) =
(
list_rforitm<x0>(xs)) where
{
#impltmp
rforitm$work<x0> = rforitm$work0<x0>
}
#impltmp
{ x0:t0 }
gseq_rforitm1
<list(x0)><x0>(xs) =
(
list_rforitm<x0>(xs)) where
{
#impltmp
rforitm$work<x0> = rforitm$work1<x0>
}
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_iforitm = gseq_iforitm<list(x0)><x0>
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_irforitm = gseq_irforitm<list(x0)><x0>
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
list_strmize
  ( xs ) =
let
fun
auxmain(xs) =
$llazy
(
case+ xs of
|
list_nil() =>
strmcon_vt_nil()
|
list_cons(x0, xs) =>
strmcon_vt_cons(x0, auxmain(xs))
)
in
  auxmain(xs)
end(*let*)//end-of-[list_strmize(xs)]
//
#impltmp
{ x0:t0 }
gseq_strmize<list(x0)><x0> = list_strmize<x0>
#impltmp
{ x0:t0 }
gseq_strmize0<list(x0)><x0> = list_strmize<x0>
#impltmp
{ x0:t0 }
gseq_strmize1<list(x0)><x0> = list_strmize<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_rstrmize
  ( xs ) =
(
list_vt_strmize0<x0>(list_reverse_vt<x0>(xs)))
//
#impltmp
{ x0:t0 }
gseq_rstrmize<list(x0)><x0> = list_rstrmize<x0>
#impltmp
{ x0:t0 }
gseq_rstrmize0<list(x0)><x0> = list_rstrmize<x0>
#impltmp
{ x0:t0 }
gseq_rstrmize1<list(x0)><x0> = list_rstrmize<x0>
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_list001.dats] *)
