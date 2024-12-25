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
Sat 13 Jul 2024 10:56:58 AM EDT
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
{ x0:vt }
gseq_strmize0
<strm_vt(x0)><x0>(xs) = (xs)
#impltmp
{ x0:vt }
gseq_strqize0
<strq_vt(x0)><x0>(xs) = (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-28:
Sun 28 Jul 2024 03:48:39 PM EDT
*)
(*
#impltmp
< xs:vt >
< x0:vt >
gseq_listize1
  ( xs ) =
let
val xs =
g_copy<xs>(xs) in
gseq_listize0<xs><x0>(xs) end
*)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_strmize1
  ( xs ) =
let
val xs =
g_copy<xs>(xs) in
gseq_strmize0<xs><x0>(xs) end
#impltmp
< xs:vt >
< x0:vt >
gseq_strqize1
  ( xs ) =
let
val xs =
g_copy<xs>(xs) in
gseq_strqize0<xs><x0>(xs) end
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_listize0
  ( xs ) =
(
gseq_rfolditm0
<xs><x0><r0>(xs, r0))
where
{
val r0 = list_vt_nil()
#vwtpdef r0 = list_vt(x0)
#impltmp
rfolditm$fopr0
<x0><r0>
(x0, r0) = list_vt_cons(x0, r0)
}(*where*)//end(gseq_listize0(xs))
//
#impltmp
< xs:vt >
< x0:vt >
gseq_listize1
  ( xs ) =
(
gseq_rfolditm1
<xs><x0><r0>(xs, r0))
where
{
val r0 = list_vt_nil()
#vwtpdef r0 = list_vt(x0)
#impltmp
rfolditm$fopr1
<x0><r0>(x0, r0) =
list_vt_cons(g_copy<x0>(x0), r0)
}(*where*)//end(gseq_listize1(xs))
//
#impltmp
{ x0:vt }
gseq_listize0
<list_vt(x0)><x0> = g_self<list_vt(x0)>
#impltmp
{ x0:vt }
gseq_listize1
<list_vt(x0)><x0> = g_copy<list_vt(x0)>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rlistize0
  ( xs ) =
(
gseq_folditm0
<xs><x0><r0>(xs, r0))
where
{
val r0 = list_vt_nil()
#vwtpdef r0 = list_vt(x0)
#impltmp
folditm$fopr0
<x0><r0>
(r0, x0) = list_vt_cons(x0, r0)
}(*where*)//end(gseq_rlistize0(xs))
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rlistize1
  ( xs ) =
(
gseq_folditm1
<xs><x0><r0>(xs, r0))
where
{
val r0 = list_vt_nil()
#vwtpdef r0 = list_vt(x0)
#impltmp
folditm$fopr1
<x0><r0>(r0, x0) =
(
list_vt_cons(g_copy<x0>(x0), r0))
}(*where*)//end(gseq_rlistize1(xs))
//
(*
HX: a special case!
*)
#impltmp
{ x0:vt }
gseq_rlistize0
<list_vt(x0)><x0> = list_vt_reverse0<x0>
#impltmp
{ x0:vt }
gseq_rlistize1
<list_vt(x0)><x0> = list_vt_reverse1<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-22:
This is inefficent
for random-access gseq!
*)
#impltmp
< xs:vt >
< x0:vt >
gseq_rstrmize0
  ( xs ) =
list_vt_strmize0<x0>
(
  gseq_rlistize0<xs><x0>(xs))//reverse
#impltmp
< xs:vt >
< x0:vt >
gseq_rstrqize0
  ( xs ) =
list_vt_strqize0<x0>
(
  gseq_rlistize0<xs><x0>(xs))//reverse
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_forall0
  ( xs ) =
(
strm_vt_forall0<x0>
(
gseq_strmize0<xs><x0>(xs)))
//
#impltmp
< xs:vt >
< x0:vt >
gseq_forall1
  ( xs ) =
(
strm_vt_forall0<x0>
(
gseq_strmize1<xs><x0>(xs)))
where
{
#impltmp
forall$test0<x0>(x0) =
let
val b0 =
forall$test1<x0>(x0)
in (g_free<x0>(x0); b0) end//let
}(*where*)//end-of-[gseq_forall1(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_forall0$f1un
  (xs, test) =
(
gseq_forall0
<xs><x0>(xs)) where
{
#impltmp
forall$test0<x0>(x0) = test(x0)
}(*where*)//end(gseq_forall0$f1un(...))
//
#impltmp
< xs:vt >
< x0:vt >
gseq_forall1$f1un
  (xs, test) =
(
gseq_forall1
<xs><x0>(xs)) where
{
#impltmp
forall$test1<x0>(x0) = test(x0)
}(*where*)//end(gseq_forall1$f1un(...))
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rforall0
  ( xs ) =
(
strm_vt_forall0<x0>
(gseq_rstrmize0<xs><x0>(xs)))
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rforall1
  ( xs ) =
(
strm_vt_forall0<x0>
(
gseq_rstrmize1<xs><x0>(xs)))
where
{
#impltmp
forall$test0<x0>(x0) =
let
val b0 =
rforall$test1<x0>(x0)
in (g_free<x0>(x0); b0) end//let
}(*where*)//end-of[gseq_rforall1(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rforall0$f1un
  (xs, test) =
(
gseq_rforall0
<xs><x0>(xs)) where
{
#impltmp
rforall$test0<x0>(x0) = test(x0)
}(*where*)//end(gseq_rforall0$f1un(...))
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rforall1$f1un
  (xs, test) =
(
gseq_rforall1
<xs><x0>(xs)) where
{
#impltmp
rforall$test1<x0>(x0) = test(x0)
}(*where*)//end(gseq_rforall1$f1un(...))
//
(* ****** ****** *)
//
(*
#impltmp
< xs:vt >
< x0:vt >
gseq_iforall0
  ( xs ) =
strm_vt_iforall0<x0>
(gseq_strmize0<xs><x0>(xs))
*)
#impltmp
< xs:vt >
< x0:vt >
gseq_iforall0
  ( xs ) = b0
where {
//
var i0: ni = (0)
//
val p0 = $addr(i0)
//
val b0 =
(
gseq_forall0<xs><x0>(xs)
) where
{
#impltmp
forall$test0<x0>(x0) =
(
$UN.p2tr_set<ni>(p0, i0+1); b0)
where
{
val i0 = $UN.p2tr_get<ni>(p0)
val b0 = iforall$test0<x0>(i0, x0) }
}
//
}(*where*)//end-of-[gseq_iforall0(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_iforall1
  ( xs ) = b0
where {
//
var i0: ni = (0)
//
val p0 = $addr(i0)
//
val b0 =
(
gseq_forall1<xs><x0>(xs)
) where
{
#impltmp
forall$test1<x0>(x0) =
(
$UN.p2tr_set<ni>(p0, i0+1); b0)
where
{
val i0 = $UN.p2tr_get<ni>(p0)
val b0 = iforall$test1<x0>(i0, x0) }
}
//
}(*where*)//end-of-[gseq_iforall1(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_iforall0$f2un
  (xs, test) =
(
gseq_iforall0
<xs><x0>(xs)) where
{
#impltmp
iforall$test0<x0>(i0,x0) = test(i0,x0)
}(*where*)//end(gseq_iforall0$f2un(...))
//
#impltmp
< xs:vt >
< x0:vt >
gseq_iforall1$f2un
  (xs, test) =
(
gseq_iforall1
<xs><x0>(xs)) where
{
#impltmp
iforall$test1<x0>(i0,x0) = test(i0,x0)
}(*where*)//end(gseq_iforall1$f2un(...))
//
(* ****** ****** *)
//
(*
#impltmp
< xs:vt >
< x0:vt >
gseq_irforall0
  ( xs ) =
strm_vt_irforall0<x0>
(gseq_rstrmize0<xs><x0>(xs))
*)
#impltmp
< xs:vt >
< x0:vt >
gseq_irforall0
  ( xs ) = b0
where {
//
var i0: ni = (0)
//
val p0 = $addr(i0)
//
val b0 =
(
gseq_rforall0<xs><x0>(xs)
) where
{
#impltmp
rforall$test0<x0>(x0) =
(
$UN.p2tr_set<ni>(p0, i0+1); b0)
where
{
val i0 = $UN.p2tr_get<ni>(p0)
val b0 = irforall$test0<x0>(i0, x0) }
}
//
}(*where*)//end-of-[gseq_irforall0(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_irforall1
  ( xs ) = b0
where {
//
var i0: ni = (0)
//
val p0 = $addr(i0)
//
val b0 =
(
gseq_rforall1<xs><x0>(xs)
) where
{
#impltmp
rforall$test1<x0>(x0) =
(
$UN.p2tr_set<ni>(p0, i0+1); b0)
where
{
val i0 = $UN.p2tr_get<ni>(p0)
val b0 = irforall$test1<x0>(i0, x0) }
}
//
}(*where*)//end-of-[gseq_irforall1(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_irforall0$f2un
  (xs, test) =
(
gseq_irforall0
<xs><x0>(xs)) where
{
#impltmp
irforall$test0<x0>(i0,x0) = test(i0,x0)
}(*where*)//end(gseq_irforall0$f2un(...))
//
#impltmp
< xs:vt >
< x0:vt >
gseq_irforall1$f2un
  (xs, test) =
(
gseq_irforall1
<xs><x0>(xs)) where
{
#impltmp
irforall$test1<x0>(i0,x0) = test(i0,x0)
}(*where*)//end(gseq_irforall1$f2un(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_foritm0
  ( xs ) =
(
let
val _ =
gseq_forall0
<xs><x0>(xs) end//let
) where
{
#impltmp
forall$test0<x0>(x0) =
let
val () =
foritm$work0<x0>(x0) in true end
}(*where*)//end-of-[gseq_foritm0(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_foritm1
  ( xs ) =
(
let
val _ =
gseq_forall1
<xs><x0>(xs) end//let
) where
{
#impltmp
forall$test1<x0>(x0) =
let
val () =
foritm$work1<x0>(x0) in true end
}(*where*)//end-of-[gseq_foritm1(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_foritm0$f1un
  (xs, work) =
(
gseq_foritm0
<xs><x0>(xs)) where
{
#impltmp
foritm$work0<x0>(x0) = work(x0)
}(*where*)//end(gseq_foritm0$f1un(...))
//
#impltmp
< xs:vt >
< x0:vt >
gseq_foritm1$f1un
  (xs, work) =
(
gseq_foritm1
<xs><x0>(xs)) where
{
#impltmp
foritm$work1<x0>(x0) = work(x0)
}(*where*)//end(gseq_foritm1$f1un(...))
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rforitm0
  ( xs ) =
(
let
val _ =
gseq_rforall0
<xs><x0>( xs ) end//let
) where
{
#impltmp
rforall$test0<x0>(x0) =
let
val () =
  rforitm$work0<x0>(x0) in true end
}(*where*)//end-of-[gseq_rforitm0(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rforitm1
  ( xs ) =
(
let
val _ =
gseq_rforall1
<xs><x0>( xs ) end//let
) where
{
#impltmp
rforall$test1<x0>(x0) =
let
val () =
  rforitm$work1<x0>(x0) in true end
}(*where*)//end-of-[gseq_rforitm1(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rforitm0$f1un
  (xs, work) =
(
gseq_rforitm0
<xs><x0>( xs )) where
{
#impltmp
rforitm$work0<x0>(x0) = work(x0)
}(*where*)//end(gseq_rforitm0$f1un(...))
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rforitm1$f1un
  (xs, work) =
(
gseq_rforitm1
<xs><x0>( xs )) where
{
#impltmp
rforitm$work1<x0>(x0) = work(x0)
}(*where*)//end(gseq_rforitm1$f1un(...))
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_iforitm0
  ( xs ) =
(
let
val _ =
gseq_iforall0
<xs><x0>( xs ) end//let
) where
{
#impltmp
iforall$test0<x0>(i0, x0) =
let
val () =
iforitm$work0<x0>(i0, x0) in true end
}(*where*)//end-of-[gseq_iforitm0(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_iforitm1
  ( xs ) =
(
let
val _ =
gseq_iforall1
<xs><x0>( xs ) end//let
) where
{
#impltmp
iforall$test1<x0>(i0, x0) =
let
val () =
iforitm$work1<x0>(i0, x0) in true end
}(*where*)//end-of-[gseq_iforitm1(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_iforitm0$f2un
  (xs, work) =
(
gseq_iforitm0
<xs><x0>( xs )) where
{
#impltmp
iforitm$work0<x0>(i0,x0) = work(i0,x0)
}(*where*)//end(gseq_iforitm0$f2un(...))
//
#impltmp
< xs:vt >
< x0:vt >
gseq_iforitm1$f2un
  (xs, work) =
(
gseq_iforitm1
<xs><x0>( xs )) where
{
#impltmp
iforitm$work1<x0>(i0,x0) = work(i0,x0)
}(*where*)//end(gseq_iforitm1$f2un(...))
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_irforitm0
  ( xs ) =
(
let
val _ =
gseq_irforall0
<xs><x0>( xs ) end//let
) where
{
#impltmp
irforall$test0<x0>(i0, x0) =
let
val () =
irforitm$work0<x0>(i0, x0) in true end
}(*where*)//end-of-[gseq_irforitm0(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_irforitm1
  ( xs ) =
(
let
val _ =
gseq_irforall1
<xs><x0>( xs ) end//let
) where
{
#impltmp
irforall$test1<x0>(i0, x0) =
let
val () =
irforitm$work1<x0>(i0, x0) in true end
}(*where*)//end-of-[gseq_irforitm1(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_irforitm0$f2un
  (xs, work) =
(
gseq_irforitm0
<xs><x0>( xs )) where
{
#impltmp
irforitm$work0<x0>(i0,x0) = work(i0,x0)
}(*where*)//end(gseq_irforitm0$f2un(...))
//
#impltmp
< xs:vt >
< x0:vt >
gseq_irforitm1$f2un
  (xs, work) =
(
gseq_irforitm1
<xs><x0>( xs )) where
{
#impltmp
irforitm$work1<x0>(i0,x0) = work(i0,x0)
}(*where*)//end(gseq_irforitm1$f2un(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_folditm0
  (xs, r0) = r0
where {
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
gseq_foritm0<xs><x0>(xs)
) where
{
#impltmp
foritm$work0<x0>(x0) =
(
  $UN.p2tr_set<r0>(p0, r0))
where
{
val r0 = $UN.p2tr_get<r0>(p0)
val r0 = folditm$fopr0<x0><r0>(r0, x0)}}
//
}(*where*)//end-of-[gseq_folditm0(xs, r0)]
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_folditm1
  (xs, r0) = r0
where {
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
gseq_foritm1<xs><x0>(xs)
) where
{
#impltmp
foritm$work1<x0>(x0) =
(
  $UN.p2tr_set<r0>(p0, r0))
where
{
val r0 = $UN.p2tr_get<r0>(p0)
val r0 = folditm$fopr1<x0><r0>(r0, x0)}}
//
}(*where*)//end-of-[gseq_folditm1(xs, r0)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_rfolditm0
  (xs, r0) = r0
where {
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
gseq_rforitm0<xs><x0>(xs)
) where
{
#impltmp
rforitm$work0<x0>(x0) =
(
  $UN.p2tr_set<r0>(p0, r0))
where
{
val r0 = $UN.p2tr_get<r0>(p0)
val r0 = rfolditm$fopr0<x0><r0>(x0, r0)}}
//
}(*where*)//end-of-[gseq_rfolditm0(xs, r0)]
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_rfolditm1
  (xs, r0) = r0
where {
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
gseq_rforitm1<xs><x0>(xs)
) where
{
#impltmp
rforitm$work1<x0>(x0) =
(
  $UN.p2tr_set<r0>(p0, r0))
where
{
val r0 = $UN.p2tr_get<r0>(p0)
val r0 = rfolditm$fopr1<x0><r0>(x0, r0)}}
//
}(*where*)//end-of-[gseq_rfolditm1(xs, r0)]
//
(* ****** ****** *)
//
(*
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_ifolditm0
  (xs, r0) =
strm_vt_ifolditm0<x0><r0>
(
gseq_strmize0<xs><x0>(xs), r0)
*)
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_ifolditm0
  (xs, r0) = r0
where {
//
var i0: ni = 0
var r0: r0 = r0
//
val pi = $addr(i0)
val pr = $addr(r0)
//
val () =
(
gseq_foritm0<xs><x0>(xs)
) where
{
#impltmp
foritm$work0<x0>(x0) =
(
  $UN.p2tr_set<r0>(pr, r0)
; $UN.p2tr_set<ni>(pi, i0+1))
where
{
val i0 = $UN.p2tr_get<ni>(pi)
val r0 = $UN.p2tr_get<r0>(pr)
val r0 =
(
  ifolditm$fopr0<x0><r0>(r0, i0, x0))}}
//
}(*where*)//end-of-[gseq_ifolditm0(xs, r0)]
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_ifolditm1
  (xs, r0) = r0
where {
//
var i0: ni = 0
var r0: r0 = r0
//
val pi = $addr(i0)
val pr = $addr(r0)
//
val () =
(
gseq_foritm1<xs><x0>(xs)
) where
{
#impltmp
foritm$work1<x0>(x0) =
(
  $UN.p2tr_set<r0>(pr, r0)
; $UN.p2tr_set<ni>(pi, i0+1))
where
{
val i0 = $UN.p2tr_get<ni>(pi)
val r0 = $UN.p2tr_get<r0>(pr)
val r0 =
(
  ifolditm$fopr1<x0><r0>(r0, i0, x0))}}
//
}(*where*)//end-of-[gseq_ifolditm1(xs, r0)]
//
(* ****** ****** *)
//
(*
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_irfolditm0
  (xs, r0) =
strm_vt_irfolditm0<x0><r0>
(
gseq_strmize0<xs><x0>(xs), r0)
*)
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_irfolditm0
  (xs, r0) = r0
where {
//
var i0: ni = 0
var r0: r0 = r0
//
val pi = $addr(i0)
val pr = $addr(r0)
//
val () =
(
gseq_rforitm0<xs><x0>(xs)
) where
{
#impltmp
rforitm$work0<x0>(x0) =
(
  $UN.p2tr_set<r0>(pr, r0)
; $UN.p2tr_set<ni>(pi, i0+1))
where
{
val i0 = $UN.p2tr_get<ni>(pi)
val r0 = $UN.p2tr_get<r0>(pr)
val r0 =
(
  irfolditm$fopr0<x0><r0>(i0, x0, r0))}}
//
}(*where*)//end-of-[gseq_irfolditm0(xs, r0)]
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_irfolditm1
  (xs, r0) = r0
where {
//
var i0: ni = 0
var r0: r0 = r0
//
val pi = $addr(i0)
val pr = $addr(r0)
//
val () =
(
gseq_rforitm1<xs><x0>(xs)
) where
{
#impltmp
rforitm$work1<x0>(x0) =
(
  $UN.p2tr_set<r0>(pr, r0)
; $UN.p2tr_set<ni>(pi, i0+1))
where
{
val i0 = $UN.p2tr_get<ni>(pi)
val r0 = $UN.p2tr_get<r0>(pr)
val r0 =
(
  irfolditm$fopr1<x0><r0>(i0, x0, r0))}}
//
}(*where*)//end-of-[gseq_irfolditm1(xs, r0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_foldall0
  (xs, r0) = r0
where {
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val b0 =
(
gseq_forall0<xs><x0>(xs)
) where
{
#impltmp
forall$test0<x0>(x0) =
(
$UN.p2tr_set<r0>(p0, r0); b0)
where
{
val r0 = $UN.p2tr_get<r0>(p0)
val (b0, r0) =
(
  foldall$fopr0<x0><r0>(r0, x0)) } }
//
}(*where*)//end-of-[gseq_foldall0(xs, r0)]
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_foldall1
  (xs, r0) = r0
where {
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val b0 =
(
gseq_forall1<xs><x0>(xs)
) where
{
#impltmp
forall$test1<x0>(x0) =
(
$UN.p2tr_set<r0>(p0, r0); b0)
where
{
val r0 = $UN.p2tr_get<r0>(p0)
val (b0, r0) =
(
  foldall$fopr1<x0><r0>(r0, x0)) } }
//
}(*where*)//end-of-[gseq_foldall1(xs, r0)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_rfoldall0
  (xs, r0) = r0
where {
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val b0 =
(
gseq_rforall0<xs><x0>(xs)
) where
{
#impltmp
rforall$test0<x0>(x0) =
(
$UN.p2tr_set<r0>(p0, r0); b0)
where
{
val r0 = $UN.p2tr_get<r0>(p0)
val (b0, r0) =
(
  rfoldall$fopr0<x0><r0>(x0, r0)) } }
//
}(*where*)//end-of-[gseq_rfoldall0(xs, r0)]
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_rfoldall1
  (xs, r0) = r0
where {
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val b0 =
(
gseq_rforall1<xs><x0>(xs)
) where
{
#impltmp
rforall$test1<x0>(x0) =
(
$UN.p2tr_set<r0>(p0, r0); b0)
where
{
val r0 = $UN.p2tr_get<r0>(p0)
val (b0, r0) =
(
  rfoldall$fopr1<x0><r0>(x0, r0)) } }
//
}(*where*)//end-of-[gseq_rfoldall1(xs, r0)]
//
(* ****** ****** *)
//
(*
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_ifoldall0
  (xs, r0) =
strm_vt_ifoldall0<x0><r0>
(
gseq_strmize0<xs><x0>(xs), r0)
*)
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_ifoldall0
  (xs, r0) = r0
where {
//
var i0: ni = 0
var r0: r0 = r0
//
val pi = $addr(i0)
val pr = $addr(r0)
//
val b0 =
(
gseq_forall0<xs><x0>(xs)
) where
{
#impltmp
forall$test0
< x0 >( x0 ) = ( b0 )
where
{
val () =
$UN.p2tr_set<r0>(pr, r0)
val () =
$UN.p2tr_set<ni>(pi, i0+1)}
where
{
val i0 = $UN.p2tr_get<ni>(pi)
val r0 = $UN.p2tr_get<r0>(pr)
val (b0, r0) =
(
  ifoldall$fopr0<x0><r0>(r0, i0, x0))}}
//
}(*where*)//end-of-[gseq_ifoldall0(xs, r0)]
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_ifoldall1
  (xs, r0) = r0
where {
//
var i0: ni = 0
var r0: r0 = r0
//
val pi = $addr(i0)
val pr = $addr(r0)
//
val b0 =
(
gseq_forall1<xs><x0>(xs)
) where
{
#impltmp
forall$test1
< x0 >( x0 ) = ( b0 )
where
{
val () =
$UN.p2tr_set<r0>(pr, r0)
val () =
$UN.p2tr_set<ni>(pi, i0+1)}
where
{
val i0 = $UN.p2tr_get<ni>(pi)
val r0 = $UN.p2tr_get<r0>(pr)
val (b0, r0) =
(
  ifoldall$fopr1<x0><r0>(r0, i0, x0))}}
//
}(*where*)//end-of-[gseq_ifoldall1(xs, r0)]
//
(* ****** ****** *)
//
(*
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_irfoldall0
  (xs, r0) =
strm_vt_irfoldall0<x0><r0>
(
gseq_strmize0<xs><x0>(xs), r0)
*)
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_irfoldall0
  (xs, r0) = r0
where {
//
var i0: ni = 0
var r0: r0 = r0
//
val pi = $addr(i0)
val pr = $addr(r0)
//
val b0 =
(
gseq_rforall0<xs><x0>(xs)
) where
{
#impltmp
rforall$test0
< x0 >( x0 ) = ( b0 )
where
{
val () =
$UN.p2tr_set<r0>(pr, r0)
val () =
$UN.p2tr_set<ni>(pi, i0+1)}
where
{
val i0 = $UN.p2tr_get<ni>(pi)
val r0 = $UN.p2tr_get<r0>(pr)
val (b0, r0) =
(
  irfoldall$fopr0<x0><r0>(i0, x0, r0))}}
//
}(*where*)//end-of-[gseq_irfoldall0(xs, r0)]
//
#impltmp
< xs:vt >
< x0:vt >
< r0:vt >
gseq_irfoldall1
  (xs, r0) = r0
where {
//
var i0: ni = 0
var r0: r0 = r0
//
val pi = $addr(i0)
val pr = $addr(r0)
//
val b0 =
(
gseq_rforall1<xs><x0>(xs)
) where
{
#impltmp
rforall$test1
< x0 >( x0 ) = ( b0 )
where
{
val () =
$UN.p2tr_set<r0>(pr, r0)
val () =
$UN.p2tr_set<ni>(pi, i0+1)}
where
{
val i0 = $UN.p2tr_get<ni>(pi)
val r0 = $UN.p2tr_get<r0>(pr)
val (b0, r0) =
(
  irfoldall$fopr1<x0><r0>(i0, x0, r0))}}
//
}(*where*)//end-of-[gseq_irfoldall1(xs, r0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_map0_llist
  ( xs ) =
list_vt_map0<x0><y0>
(gseq_listize0<xs><x0>(xs))
*)
//
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_map0_lstrm
  ( xs ) =
strm_vt_map0<x0><y0>
(gseq_strmize0<xs><x0>(xs))
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_map0_lstrq
  ( xs ) =
strq_vt_map0<x0><y0>
(gseq_strqize0<xs><x0>(xs))
//
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_map0_llist
  ( xs ) =
strm_vt_listize0<y0>
(gseq_map0_lstrm<xs><x0><y0>(xs))
//
(* ****** ****** *)
//
(*
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_rmap0_llist
  ( xs ) =
list_vt_map0<x0><y0>
(gseq_rlistize0<xs><x0>(xs))
*)
//
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_rmap0_lstrm
  ( xs ) =
strm_vt_map0<x0><y0>
(gseq_rstrmize0<xs><x0>(xs))
where {
#impltmp
map$fopr0
< x0 >< y0 > = rmap$fopr0<x0><y0>
}(*where*)
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_rmap0_lstrq
  ( xs ) =
strq_vt_map0<x0><y0>
(gseq_rstrqize0<xs><x0>(xs))
where {
#impltmp
map$fopr0
< x0 >< y0 > = rmap$fopr0<x0><y0>
}(*where*)
//
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_rmap0_llist
  ( xs ) =
strm_vt_listize0<y0>
(gseq_rmap0_lstrm<xs><x0><y0>(xs))
//
(* ****** ****** *)
//
(*
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_imap0_llist
  ( xs ) =
list_vt_imap0<x0><y0>
(gseq_listize0<xs><x0>(xs))
*)
//
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_imap0_lstrm
  ( xs ) =
strm_vt_imap0<x0><y0>
(gseq_strmize0<xs><x0>(xs))
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_imap0_lstrq
  ( xs ) =
strq_vt_imap0<x0><y0>
(gseq_strqize0<xs><x0>(xs))
//
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_imap0_llist
  ( xs ) =
strm_vt_listize0<y0>
(gseq_imap0_lstrm<xs><x0><y0>(xs))
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_irmap0_lstrm
  ( xs ) =
strm_vt_imap0<x0><y0>
(gseq_rstrmize0<xs><x0>(xs))
where {
#impltmp
imap$fopr0
< x0 >< y0 > = irmap$fopr0<x0><y0>
}(*where*)
//
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_irmap0_lstrq
  ( xs ) =
strq_vt_imap0<x0><y0>
(gseq_rstrqize0<xs><x0>(xs))
where {
#impltmp
imap$fopr0
< x0 >< y0 > = irmap$fopr0<x0><y0>
}(*where*)
//
#impltmp
< xs:vt >
< x0:vt >
< y0:vt >
gseq_irmap0_llist
  ( xs ) =
strm_vt_listize0<y0>
(gseq_irmap0_lstrm<xs><x0><y0>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_filter0_lstrm
  ( xs ) =
strm_vt_filter0<x0>
(gseq_strmize0<xs><x0>(xs))
#impltmp
< xs:vt >
< x0:vt >
gseq_filter0_lstrq
  ( xs ) =
strq_vt_filter0<x0>
(gseq_strqize0<xs><x0>(xs))
//
(*
HX-2024-07-13:
Laziness here can prevent
the creation of an unnecessarily
long list for temporary use!
*)
#impltmp
< xs:vt >
< x0:vt >
gseq_filter0_llist
  ( xs ) =
strm_vt_listize0<x0>
(
gseq_filter0_lstrm<xs><x0>(xs))
//
(* ****** ****** *)
//
(*
HX-2024-07-24:
Wed 24 Jul 2024 04:33:40 PM EDT
*)
#impltmp
< xs:vt >
< x0:vt >
gseq_rfilter0_lstrm
  ( xs ) =
strm_vt_filter0<x0>
(gseq_rstrmize0<xs><x0>(xs))
#impltmp
< xs:vt >
< x0:vt >
gseq_rfilter0_lstrq
  ( xs ) =
strq_vt_filter0<x0>
(gseq_rstrqize0<xs><x0>(xs))
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rfilter0_llist
  ( xs ) =
strm_vt_listize0<x0>
(
gseq_rfilter0_lstrm<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_ifilter0_lstrm
  ( xs ) =
strm_vt_ifilter0<x0>
(gseq_strmize0<xs><x0>(xs))
#impltmp
< xs:vt >
< x0:vt >
gseq_ifilter0_lstrq
  ( xs ) =
strq_vt_ifilter0<x0>
(gseq_strqize0<xs><x0>(xs))
//
(*
HX-2024-07-13:
Laziness here can prevent
the creation of an unnecessarily
long list for temporary use!
*)
#impltmp
< xs:vt >
< x0:vt >
gseq_ifilter0_llist
  ( xs ) =
strm_vt_listize0<x0>
(
gseq_ifilter0_lstrm<xs><x0>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-16:
Tue 16 Jul 2024 11:19:32 AM EDT
*)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_exists0
  ( xs ) =
let
//
#impltmp
forall$test0<x0>(x0) =
(
  not(exists$test0<x0>(x0)))
//
in//let
  not(gseq_forall0<xs><x0>(xs))
end//let//end-of-[gseq_exists0(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_exists1
  ( xs ) =
let
//
#impltmp
forall$test1<x0>(x0) =
(
  not(exists$test1<x0>(x0)))
//
in//let
  not(gseq_forall1<xs><x0>(xs))
end//let//end-of-[gseq_exists1(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rexists0
  ( xs ) =
let
//
#impltmp
rforall$test0<x0>(x0) =
(
  not(rexists$test0<x0>(x0)))
//
in//let
  not(gseq_rforall0<xs><x0>(xs))
end(*let*)//end-of-[gseq_rexists0(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_rexists1
  ( xs ) =
let
//
#impltmp
rforall$test1<x0>(x0) =
(
  not(rexists$test1<x0>(x0)))
//
in//let
  not(gseq_rforall1<xs><x0>(xs))
end(*let*)//end-of-[gseq_rexists1(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_iexists0
  ( xs ) =
(
not(gseq_iforall0<xs><x0>(xs))
) where
{
//
#impltmp
iforall$test0<x0>(i0, x0) =
(
  not(iexists$test0<x0>(i0, x0)))
//
}(*where*)//end-of-[gseq_iexists0(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_iexists1
  ( xs ) =
(
not(gseq_iforall1<xs><x0>(xs))
) where
{
//
#impltmp
iforall$test1<x0>(i0, x0) =
(
  not(iexists$test1<x0>(i0, x0)))
//
}(*where*)//end-of-[gseq_iexists1(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_irexists0
  ( xs ) =
(
not(gseq_irforall0<xs><x0>(xs))
) where
{
//
#impltmp
irforall$test0<x0>(i0, x0) =
(
  not(irexists$test0<x0>(i0, x0)))
//
}(*where*)//end-of-[gseq_irexists0(xs)]
//
#impltmp
< xs:vt >
< x0:vt >
gseq_irexists1
  ( xs ) =
(
not(gseq_irforall1<xs><x0>(xs))
) where
{
//
#impltmp
irforall$test1<x0>(i0, x0) =
(
  not(irexists$test1<x0>(i0, x0)))
//
}(*where*)//end-of-[gseq_irexists1(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gseq001_vt.dats] *)
