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
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
g_forall
<list(x0)> =
gseq_forall<list(x0)><x0>
#impltmp
{ x0:t0 }
g_exists
<list(x0)> =
gseq_exists<list(x0)><x0>
//
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
(
if test
then loop(xs) else false) end)
}
//
#impltmp
{ x0:t0 }
gseq_forall
<list(x0)><x0> = list_forall<x0>
#impltmp
{ x0:t0 }
gseq_forall0
<list(x0)><x0>(xs) =
list_forall<x0>(xs) where
{
#impltmp
forall$test<x0> = forall$test0<x0>
}
#impltmp
{ x0:t0 }
gseq_forall1
<list(x0)><x0>(xs) =
list_forall<x0>(xs) where
{
#impltmp
forall$test<x0> = forall$test1<x0>
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
<list(x0)><x0>(xs) =
list_rforall<x0>(xs) where
{
#impltmp
rforall$test<x0> = rforall$test0<x0>
}
#impltmp
{ x0:t0 }
gseq_rforall1
<list(x0)><x0>(xs) =
list_rforall<x0>(xs) where
{
#impltmp
rforall$test<x0> = rforall$test1<x0>
}
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_iforall =
gseq_iforall<list(x0)><x0>(* void *)
//
#impltmp
< x0:t0 >
list_irforall =
gseq_irforall<list(x0)><x0>(* void *)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_forall$f1un =
gseq_forall$f1un<list(x0)><x0>(* void *)
#impltmp
< x0:t0 >
list_iforall$f2un =
gseq_iforall$f2un<list(x0)><x0>(* void *)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
g_foritm
<list(x0)> =
gseq_foritm<list(x0)><x0>
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
list_iforitm =
gseq_iforitm<list(x0)><x0>(* void *)
#impltmp
< x0:t0 >
list_irforitm =
gseq_irforitm<list(x0)><x0>(* void *)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_foritm$f1un =
gseq_foritm$f1un<list(x0)><x0>(* void *)
#impltmp
< x0:t0 >
list_iforitm$f2un =
gseq_iforitm$f2un<list(x0)><x0>(* void *)
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
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<x0>(*tmp*)
list_rlistize = list_reverse_vt<x0>
#impltmp
{ x0:t0 }
gseq_rlistize<list(x0)><x0> = list_rlistize<x0>
//
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
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-31:
Wed 31 Jul 2024 10:34:56 AM EDT
*)
//
#impltmp
< x0:t0 >
list_c2hoose_lstrm
  ( xs ) =
(
  auxmain(xs)) where
{
fun auxmain(xs) = $llazy
(
//
case+ xs of
|
list_nil() =>
strmcon_vt_nil(*void*)
|
list_cons(x1, xs) => !
(
strm_vt_append00
<y0>(r1, auxmain(xs))
) where
{
//
#typedef xs = list(x0)
#typedef y0 = @(x0, x0)
//
val r1 =
(
gseq_map_lstrm<xs><x0><y0>(xs)
) where
{
#impltmp
map$fopr<x0><y0>(x2) = @(x1, x2) } }//whr
)(*case+*)
}(*where*)//end-of-[list_c2hoose_lstrm(xs)]
//
#impltmp
< x0:t0 >
list_c2hoose$forall
  ( xs ) =
(
strm_vt_forall0<x2>
(list_c2hoose_lstrm<x0>(xs))
) where
{
#typedef x2 = @(x0, x0)
#impltmp
forall$test0<x2>(x2) =
c2hoose$forall$test<x0>(x2.0, x2.1)
}(*where*)//end-of-[list_c2hoose$forall(xs)]
//
#impltmp
< x0:t0 >
list_c2hoose$forall$f2un
  (xs, test) =
(
list_c2hoose$forall<x0>(xs)
) where
{
#impltmp
c2hoose$forall$test<x0>(x1, x2) = test(x1, x2)
}(*where*)//end-of-[list_c2hoose$forall$f2un(...)]
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_c3hoose_lstrm
  ( xs ) =
(
  auxmain(xs)) where
{
fun auxmain(xs) = $llazy
(
//
case+ xs of
|
list_nil() =>
strmcon_vt_nil(*void*)
//
|
list_cons(x1, xs) => !
(
strm_vt_append00
<y0>(r1, auxmain(xs))
) where
{
//
#typedef xx = @(x0, x0)
#typedef y0 = @(x0, x0, x0)
//
val r1 =
(
strm_vt_map0<xx><y0>
(list_c2hoose_lstrm<x0>(xs))
) where
{
#impltmp
map$fopr
<xx><y0>(xx) = @(x1, xx.0, xx.1) } }//whr
//
)(*case+*)
}(*where*)//end-of-[list_c3hoose_lstrm(xs)]
//
#impltmp
< x0:t0 >
list_c3hoose$forall
  ( xs ) =
(
strm_vt_forall0<x3>
(list_c3hoose_lstrm<x0>(xs))
) where
{
#typedef x3 = @(x0, x0, x0)
#impltmp
forall$test0<x3>(x3) =
c3hoose$forall$test<x0>(x3.0, x3.1, x3.2)
}(*where*)//end-of-[list_c3hoose$forall(xs)]
//
#impltmp
< x0:t0 >
list_c3hoose$forall$f3un
  (xs, test) =
(
list_c3hoose$forall<x0>(xs)
) where
{
#impltmp
c3hoose$forall$test<x0>(x1, x2, x3) = test(x1, x2, x3)
}(*where*)//end-of-[list_c3hoose$forall$f3un(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
list_fmake() =
(
let
val () =
fmake$fwork<x0>((*0*))
in//let
list_vt2t{x0}
(list_vt_reverse0<x0>(r0))
end
) where // end-of-[list_fmake()]
{
//
var r0:
list_vt(x0) =
list_vt_nil()
val p0 = $addr(r0)
//
#impltmp
fmake$fwork$work<x0>(x0) =
$UN.p2tr_set
(p0,list_vt_cons(x0, $UN.p2tr_get(p0)))
//
}(*where*)//end-of-[list_fmake((*0*))]
//
#impltmp
< x0:t0 >
list_fmake_fwork
  (fwork) =
(
  list_fmake<x0>()) where
{
#impltmp
fmake$fwork<x0>
  ((*void*)) =
(
fwork(lam(x0) => fmake$fwork$work<x0>(x0)))
}(*where*)//end-of-[list_fmake_fwork(fwork)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-03:
Tue 03 Sep 2024 01:16:12 PM EDT
*)
//
#impltmp
< x0:t0 >
< y0:t0 >
list_map =
gseq_map_list<list(x0)><x0><y0>(*void*)
#impltmp
< x0:t0 >
< y0:t0 >
list_map$f1un =
gseq_map$f1un_list<list(x0)><x0><y0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:vt >
list_map_vt =
gseq_map_llist<list(x0)><x0><y0>(*void*)
#impltmp
< x0:t0 >
< y0:vt >
list_map$f1un_vt =
gseq_map$f1un_llist<list(x0)><x0><y0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:t0 >
list_maprev =
gseq_map_rlist<list(x0)><x0><y0>(*void*)
#impltmp
< x0:t0 >
< y0:t0 >
list_maprev$f1un =
gseq_map$f1un_rlist<list(x0)><x0><y0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:vt >
list_maprev_vt =
gseq_map_rllist<list(x0)><x0><y0>(*void*)
#impltmp
< x0:t0 >
< y0:vt >
list_maprev$f1un_vt =
gseq_map$f1un_rllist<list(x0)><x0><y0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_list001.dats] *)
