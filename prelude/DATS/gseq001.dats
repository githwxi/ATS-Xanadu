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
Sat 13 Jul 2024 10:07:23 AM EDT
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
< xs:t0 >
< x0:t0 >
gseq_strmize =
gseq_strmize0<xs><x0>(*void*)
#impltmp
< xs:t0 >
< x0:t0 >
gseq_strqize =
gseq_strqize0<xs><x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rstrmize =
gseq_rstrmize0<xs><x0>(*void*)
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rstrqize =
gseq_rstrqize0<xs><x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_listize
  ( xs ) =
(
gseq_rfolditm
<xs><x0><r0>(xs, r0))
where
{
val r0 = list_vt_nil()
#vwtpdef r0 = list_vt(x0)
#impltmp
rfolditm$fopr
<x0><r0>
(x0, r0) = list_vt_cons(x0, r0)
}(*where*)//end(gseq_listize(xs))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rlistize
  ( xs ) =
(
gseq_folditm
<xs><x0><r0>(xs, r0))
where
{
val r0 = list_vt_nil()
#vwtpdef r0 = list_vt(x0)
#impltmp
folditm$fopr
<x0><r0>
(r0, x0) = list_vt_cons(x0, r0)
}(*where*)//end(gseq_rlistize(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_forall
  ( xs ) =
(
strm_vt_forall0<x0>
(
gseq_strmize<xs><x0>(xs)))
where
{
#impltmp
forall$test0<x0> = forall$test<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_forall$f1un
  (xs, test) =
(
gseq_forall
<xs><x0>(xs)) where {
#impltmp
forall$test<x0>(x0) = test(x0)//impl
}(*where*)//end-of-[gseq_forall$f1un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_exists
  ( xs ) =
let
//
#impltmp
forall$test<x0>(x0) =
(
  not(exists$test<x0>(x0)))
//
in//let
  not(gseq_forall<xs><x0>(xs))
end//let//end-of-[gseq_exists(xs)]
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_exists$f1un
  (xs, test) =
(
gseq_exists
<xs><x0>(xs)) where {
#impltmp
exists$test<x0>(x0) = test(x0)//impl
}(*where*)//end-of-[gseq_exists$f1un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforall
  ( xs ) =
(
strm_vt_forall0<x0>
(gseq_rstrmize<xs><x0>(xs)))
where
{
#impltmp
forall$test0<x0> = rforall$test<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforall$f1un
  (xs, test) =
(
gseq_rforall
<xs><x0>(xs)) where {
#impltmp
rforall$test<x0>(x0) = test(x0)//impl
}(*where*)//end-of-[gseq_rforall$f1un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rexists
  ( xs ) =
let
//
#impltmp
rforall$test<x0>(x0) =
(
  not(rexists$test<x0>(x0)))
//
in//let
  not(gseq_rforall<xs><x0>(xs))
end//let//end-of-[gseq_rexists(xs)]
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rexists$f1un
  (xs, test) =
(
gseq_rexists
<xs><x0>(xs)) where {
#impltmp
rexists$test<x0>(x0) = test(x0)//impl
}(*where*)//end-of-[gseq_rexists$f1un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iforall
  ( xs ) = b0
where {
//
var i0: ni = (0)
//
val p0 = $addr(i0)
//
val b0 =
(
gseq_forall<xs><x0>(xs)
) where
{
#impltmp
forall$test<x0>(x0) =
(
$UN.p2tr_set<ni>(p0, i0+1); b0)
where
{
val i0 = $UN.p2tr_get<ni>(p0)
val b0 = iforall$test<x0>(i0, x0) }
}
//
}(*where*)//end-of-[gseq_iforall(xs)]
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iforall$f2un
  (xs, test) =
(
gseq_iforall
<xs><x0>(xs)) where {
#impltmp
iforall$test<x0>(i0, x0) = test(i0, x0)
}(*where*)//end-of-[gseq_iforall$f2un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iexists
  ( xs ) =
let
//
#impltmp
iforall$test<x0>(i0, x0) =
(
not(iexists$test<x0>(i0, x0)))
//
in//let
(
  not(gseq_iforall<xs><x0>(xs)))
end//let//end-of-[gseq_iexists(xs)]
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iexists$f2un
  (xs, test) =
(
gseq_iexists
<xs><x0>(xs)) where {
#impltmp
iexists$test<x0>(i0, x0) = test(i0, x0)
}(*where*)//end-of-[gseq_iexists$f2un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_irforall
  ( xs ) = b0
where {
//
var i0: ni = (0)
//
val p0 = $addr(i0)
//
val b0 =
(
gseq_rforall<xs><x0>(xs)
) where
{
#impltmp
rforall$test<x0>(x0) =
(
$UN.p2tr_set<ni>(p0, i0+1); b0)
where
{
val i0 = $UN.p2tr_get<ni>(p0)
val b0 = irforall$test<x0>(i0, x0) }
}
//
}(*where*)//end-of-[gseq_irforall(xs)]
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_irforall$f2un
  (xs, test) =
(
gseq_irforall
<xs><x0>(xs)) where {
#impltmp
irforall$test<x0>(i0, x0) = test(i0, x0)
}(*where*)//end-of-[gseq_irforall$f2un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_irexists
  ( xs ) =
let
//
#impltmp
iforall$test<x0>(i0, x0) =
(
not(irexists$test<x0>(i0, x0)))
//
in//let
(
  not(gseq_iforall<xs><x0>(xs)))
end//let//end-of-[gseq_irexists(xs)]
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_irexists$f2un
  (xs, test) =
(
gseq_irexists
<xs><x0>(xs)) where {
#impltmp
irexists$test<x0>(i0, x0) = test(i0, x0)
}(*where*)//end-of-[gseq_irexists$f2un(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_foritm
  ( xs ) =
(
let
val _ =
gseq_forall
<xs><x0>(xs) end//let
) where
{
#impltmp
forall$test<x0>(x0) =
let
val () =
foritm$work<x0>(x0) in true end
}(*where*)//end-of-[gseq_foritm(xs)]
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_foritm$f1un
  (xs, work) =
(
gseq_foritm
<xs><x0>(xs)) where {
#impltmp foritm$work<x0>(x0) = work(x0)
}(*where*)//end-of-[gseq_foritm$f1un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforitm
  ( xs ) =
(
let
val _ =
gseq_rforall
<xs><x0>(xs) end//let
) where
{
#impltmp
rforall$test<x0>(x0) =
let
val () =
rforitm$work<x0>(x0) in true end
}(*where*)//end-of-[gseq_rforitm(xs)]
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforitm$f1un
  (xs, test) =
(
gseq_rforitm
<xs><x0>(xs)) where {
#impltmp rforitm$work<x0>(x0) = test(x0)
}(*where*)//end-of-[gseq_rforitm$f1un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iforitm
  ( xs ) =
(
let
val _ =
gseq_iforall
<xs><x0>(xs) end//let
) where
{
#impltmp
iforall$test<x0>(i0,x0) =
let
val () =
iforitm$work<x0>(i0,x0) in true end
}(*where*)//end-of-[gseq_iforitm(xs)]
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iforitm$f2un
  (xs, test) =
(
gseq_iforitm
<xs><x0>(xs)) where {
#impltmp
iforitm$work<x0>(i0, x0) = test(i0, x0)
}(*where*)//end-of-[gseq_iforitm$f2un(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_irforitm
  ( xs ) =
(
let
val _ =
gseq_irforall
<xs><x0>(xs) end//let
) where
{
#impltmp
irforall$test<x0>(i0,x0) =
let
val () =
irforitm$work<x0>(i0,x0) in true end
}(*where*)//end-of-[gseq_irforitm(xs)]
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_irforitm$f2un
  (xs, test) =
(
gseq_irforitm
<xs><x0>(xs)) where {
#impltmp
irforitm$work<x0>(i0, x0) = test(i0, x0)
}(*where*)//end-of-[gseq_irforitm$f2un(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_folditm
  (xs, r0) = r0
where {
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
gseq_foritm<xs><x0>(xs)
) where
{
#impltmp
foritm$work<x0>(x0) =
(
  $UN.p2tr_set<r0>(p0, r0))
where
{
val r0 = $UN.p2tr_get<r0>(p0)
val r0 = folditm$fopr<x0><r0>(r0, x0)}}
//
}(*where*)//end-of-[gseq_folditm(xs, r0)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_folditm$f2un
  (xs, r0, fopr) =
(
gseq_folditm
<xs><x0><r0>(xs, r0)) where
{
#impltmp
folditm$fopr<x0><r0>(r0, x0) = fopr(r0, x0)
}(*where*)//end-of-[gseq_folditm$f2un(xs,r0)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_rfolditm
  (xs, r0) = r0
where {
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
gseq_rforitm<xs><x0>(xs)
) where
{
#impltmp
rforitm$work<x0>(x0) =
(
  $UN.p2tr_set<r0>(p0, r0))
where
{
val r0 = $UN.p2tr_get<r0>(p0)
val r0 = rfolditm$fopr<x0><r0>(x0, r0)}}
//
}(*where*)//end-of-[gseq_rfolditm(xs, r0)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_rfolditm$f2un
  (xs, r0, fopr) =
(
gseq_rfolditm
<xs><x0><r0>(xs, r0)) where
{
#impltmp
rfolditm$fopr<x0><r0>(r0, x0) = fopr(r0, x0)
}(*where*)//end-of-[gseq_rfolditm$f2un(xs,r0)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_ifolditm
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
gseq_foritm<xs><x0>(xs)
) where
{
#impltmp
foritm$work<x0>(x0) =
(
  $UN.p2tr_set<r0>(pr, r0)
; $UN.p2tr_set<ni>(pi, i0+1))
where
{
val i0 = $UN.p2tr_get<ni>(pi)
val r0 = $UN.p2tr_get<r0>(pr)
val r0 =
(
  ifolditm$fopr<x0><r0>(r0, i0, x0))}}
//
}(*where*)//end-of-[gseq_ifolditm(xs, r0)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_ifolditm$f3un
  (xs, r0, fopr) =
(
gseq_ifolditm
<xs><x0><r0>(xs, r0)) where
{
#impltmp
ifolditm$fopr
< x0 >< r0 >(r0, i0, x0) = fopr(r0, i0, x0)
}(*where*)//end-of-[gseq_ifolditm$f3un(xs,r0)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_irfolditm
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
gseq_rforitm<xs><x0>(xs)
) where
{
#impltmp
rforitm$work<x0>(x0) =
(
  $UN.p2tr_set<r0>(pr, r0)
; $UN.p2tr_set<ni>(pi, i0+1))
where
{
val i0 = $UN.p2tr_get<ni>(pi)
val r0 = $UN.p2tr_get<r0>(pr)
val r0 =
(
  irfolditm$fopr<x0><r0>(i0, x0, r0))}}
//
}(*where*)//end-of-[gseq_irfolditm(xs, r0)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_irfolditm$f3un
  (xs, r0, fopr) =
(
gseq_irfolditm
<xs><x0><r0>(xs, r0)) where
{
#impltmp
irfolditm$fopr
< x0 >< r0 >(r0, i0, x0) = fopr(r0, i0, x0)
}(*where*)//end-of-[gseq_irfolditm$f3un(xs,r0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_foldall
  (xs, r0) = r0
where {
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val b0 =
(
gseq_forall<xs><x0>(xs)
) where
{
#impltmp
forall$test<x0>(x0) =
(
$UN.p2tr_set<r0>(p0, r0); b0)
where
{
val r0 = $UN.p2tr_get<r0>(p0)
val (b0, r0) =
(
  foldall$fopr<x0><r0>(r0, x0)) } }
//
}(*where*)//end-of-[gseq_foldall(xs, r0)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_foldall$f2un
  (xs, r0, fopr) =
(
gseq_foldall
<xs><x0><r0>(xs, r0)) where
{
#impltmp
foldall$fopr<x0><r0>(r0, x0) = fopr(r0, x0)
}(*where*)//end-of-[gseq_foldall$f2un(xs,r0)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_rfoldall
  (xs, r0) = r0
where {
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val b0 =
(
gseq_rforall<xs><x0>(xs)
) where
{
#impltmp
rforall$test<x0>(x0) =
(
$UN.p2tr_set<r0>(p0, r0); b0)
where
{
val r0 = $UN.p2tr_get<r0>(p0)
val (b0, r0) =
(
  rfoldall$fopr<x0><r0>(x0, r0)) } }
//
}(*where*)//end-of-[gseq_rfoldall(xs, r0)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_rfoldall$f2un
  (xs, r0, fopr) =
(
gseq_rfoldall
<xs><x0><r0>(xs, r0)) where
{
#impltmp
rfoldall$fopr<x0><r0>(r0, x0) = fopr(r0, x0)
}(*where*)//end-of-[gseq_rfoldall$f2un(xs,r0)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_ifoldall
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
gseq_forall<xs><x0>(xs)
) where
{
#impltmp
forall$test
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
  ifoldall$fopr<x0><r0>(r0, i0, x0))}}
//
}(*where*)//end-of-[gseq_ifoldall(xs, r0)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_ifoldall$f3un
  (xs, r0, fopr) =
(
gseq_ifoldall
<xs><x0><r0>(xs, r0)) where
{
#impltmp
ifoldall$fopr
< x0 >< r0 >(r0, i0, x0) = fopr(r0, i0, x0)
}(*where*)//end-of-[gseq_ifoldall$f3un(xs,r0)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_irfoldall
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
gseq_rforall<xs><x0>(xs)
) where
{
#impltmp
rforall$test
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
  irfoldall$fopr<x0><r0>(i0, x0, r0))}}
//
}(*where*)//end-of-[gseq_irfoldall(xs, r0)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_irfoldall$f3un
  (xs, r0, fopr) =
(
gseq_irfoldall
<xs><x0><r0>(xs, r0)) where
{
#impltmp
irfoldall$fopr
< x0 >< r0 >(r0, i0, x0) = fopr(r0, i0, x0)
}(*where*)//end-of-[gseq_irfoldall$f3un(xs,r0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:vt >
< y0:vt >
gseq_map_ares(xs) =
g_make0_lstrm<y0><ys>
(
gseq_map_lstrm<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_map_self(xs) =
g_make0_lstrm<x0><xs>
(
gseq_map_lstrm<xs><x0><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:vt >
< y0:vt >
gseq_map$f1un_ares
  (xs, fopr) =
(
gseq_map_ares
<xs><x0>
<ys><y0>( xs )) where
{
#impltmp
map$fopr<x0><y0>(x0) = fopr(x0)
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_map$f1un_self
  (xs, fopr) =
(
gseq_map_self
<xs><x0>( xs )) where
{
#impltmp
map$fopr<x0><x0>(x0) = fopr(x0)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_map_list
  ( xs ) =
list_vt2t{y0}
(
gseq_map_llist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_map$f1un_list
  (xs, fopr) =
list_vt2t{y0}
(
gseq_map$f1un_llist<xs><x0><y0>(xs, fopr))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map_llist
  ( xs ) =
strm_vt_listize0<y0>
(
gseq_map_lstrm<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map$f1un_llist
  (xs, fopr) =
(
gseq_map_llist<xs><x0><y0>(xs))
where
{
#impltmp
map$fopr<x0><y0>( x0 ) = fopr( x0 )
}(*where*)//end-of-[gseq_map$f1un_llist]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map_lstrm
  ( xs ) =
strm_vt_map0<x0><y0>
(gseq_strmize<xs><x0>(xs))
where {
#impltmp
map$fopr0<x0><y0> = map$fopr<x0><y0>
}(*where*)
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map_lstrq
  ( xs ) =
strq_vt_map0<x0><y0>
(gseq_strqize<xs><x0>(xs))
where {
#impltmp
map$fopr0<x0><y0> = map$fopr<x0><y0>
}(*where*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map$f1un_lstrm
  (xs, fopr) =
(
gseq_map_lstrm<xs><x0><y0>(xs))
where
{
#impltmp
map$fopr<x0><y0>( x0 ) = fopr( x0 )
}(*where*)//end-of-[gseq_map$f1un_lstrm]
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map$f1un_lstrq
  (xs, fopr) =
(
gseq_map_lstrq<xs><x0><y0>(xs))
where
{
#impltmp
map$fopr<x0><y0>( x0 ) = fopr( x0 )
}(*where*)//end-of-[gseq_map$f1un_lstrq]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_map_rlist
  ( xs ) =
list_vt2t{y0}
(
gseq_map_rllist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_map$f1un_rlist
  (xs, fopr) =
list_vt2t{y0}
(gseq_map$f1un_rllist<xs><x0><y0>(xs, fopr))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map_rllist
  ( xs ) =
strm_vt_rlistize0<y0>
(gseq_map_lstrm<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map$f1un_rllist
  (xs, fopr) =
(
gseq_map_rllist<xs><x0><y0>(xs))
where
{
#impltmp
map$fopr<x0><y0>( x0 ) = fopr( x0 )
}(*where*)//end-of-[gseq_map$f1un_rllist]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_rmap_list
  ( xs ) =
list_vt2t{y0}
(
gseq_rmap_llist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_rmap$f1un_list
  (xs, fopr ) =
list_vt2t{y0}
(
gseq_rmap$f1un_llist<xs><x0><y0>(xs, fopr))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_rmap_llist
  ( xs ) =
strm_vt_listize0<y0>
(
gseq_rmap_lstrm<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_rmap$f1un_llist
  (xs, fopr) =
(
gseq_rmap_llist<xs><x0><y0>(xs))
where
{
#impltmp
rmap$fopr<x0><y0>( x0 ) = fopr( x0 )
}(*where*)//end-of-[gseq_rmap$f1un_llist]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_rmap_lstrm
  ( xs ) =
strm_vt_map0<x0><y0>
(gseq_rstrmize<xs><x0>(xs))
where
{
#impltmp
map$fopr0<x0><y0> = rmap$fopr<x0><y0>
}
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_rmap_lstrq
  ( xs ) =
strq_vt_map0<x0><y0>
(gseq_rstrqize<xs><x0>(xs))
where
{
#impltmp
map$fopr0<x0><y0> = rmap$fopr<x0><y0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_rmap$f1un_lstrm
  (xs, fopr) =
(
gseq_rmap_lstrm<xs><x0><y0>(xs))
where
{
#impltmp
rmap$fopr<x0><y0>( x0 ) = fopr( x0 )
}(*where*)//end-of-[gseq_rmap$f1un_lstrm]
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_rmap$f1un_lstrq
  (xs, fopr) =
(
gseq_rmap_lstrq<xs><x0><y0>(xs))
where
{
#impltmp
rmap$fopr<x0><y0>( x0 ) = fopr( x0 )
}(*where*)//end-of-[gseq_rmap$f1un_lstrq]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_rmap_rlist
  ( xs ) =
list_vt2t{y0}
(
gseq_rmap_rllist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_rmap$f1un_rlist
  (xs, fopr ) =
list_vt2t{y0}
(
gseq_rmap$f1un_rllist<xs><x0><y0>(xs, fopr))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_rmap_rllist
  ( xs ) =
strm_vt_rlistize0<y0>
(gseq_rmap_lstrm<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_rmap$f1un_rllist
  (xs, fopr) =
(
gseq_rmap_rllist<xs><x0><y0>(xs))
where
{
#impltmp
rmap$fopr<x0><y0>( x0 ) = fopr( x0 )
}(*where*)//end-of-[gseq_rmap$f1un_rllist]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_imap_list
  ( xs ) =
list_vt2t{y0}
(
gseq_imap_llist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_imap$f2un_list
  (xs, fopr) =
list_vt2t{y0}
(
gseq_imap$f2un_llist<xs><x0><y0>(xs, fopr))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap_llist
  ( xs ) =
strm_vt_listize0<y0>
(
gseq_imap_lstrm<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap$f2un_llist
  (xs, fopr) =
(
gseq_imap_llist<xs><x0><y0>(xs)
) where
{
#impltmp
imap$fopr<x0><y0>(i0, x0) = fopr(i0, x0)
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap_lstrm
  ( xs ) =
strm_vt_imap0<x0><y0>
(gseq_strmize<xs><x0>(xs))
where {
#impltmp
imap$fopr0<x0><y0> = imap$fopr<x0><y0>
}(*where*)
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap_lstrq
  ( xs ) =
strq_vt_imap0<x0><y0>
(gseq_strqize0<xs><x0>(xs))
where {
#impltmp
imap$fopr0<x0><y0> = imap$fopr<x0><y0>
}(*where*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap$f2un_lstrm
  (xs, fopr) =
(
gseq_imap_lstrm<xs><x0><y0>(xs)
) where
{
#impltmp
imap$fopr<x0><y0>(i0, x0) = fopr(i0, x0)
}
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap$f2un_lstrq
  (xs, fopr) =
(
gseq_imap_lstrq<xs><x0><y0>(xs)
) where
{
#impltmp
imap$fopr<x0><y0>(i0, x0) = fopr(i0, x0)
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_imap_rlist
  ( xs ) =
list_vt2t{y0}
(
gseq_imap_rllist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_imap$f2un_rlist
  (xs, fopr) =
list_vt2t{y0}
(
gseq_imap$f2un_rllist<xs><x0><y0>(xs, fopr))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap_rllist
  ( xs ) =
strm_vt_rlistize0<y0>
(
gseq_imap_lstrm<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap$f2un_rllist
  (xs, fopr) =
(
gseq_imap_rllist<xs><x0><y0>(xs)
) where
{
#impltmp
imap$fopr<x0><y0>(i0, x0) = fopr(i0, x0)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-28:
Sun 28 Jul 2024 05:43:53 PM EDT
*)
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_irmap_list
  ( xs ) =
list_vt2t{y0}
(
gseq_irmap_llist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_irmap_llist
  ( xs ) =
strm_vt_listize0<y0>
(
gseq_irmap_lstrm<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_irmap$f2un_llist
  (xs, fopr) =
(
gseq_irmap_llist<xs><x0><y0>(xs)
) where
{
#impltmp
irmap$fopr<x0><y0>(i0, x0) = fopr(i0, x0)
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_irmap_lstrm
  ( xs ) =
strm_vt_imap0<x0><y0>
(gseq_rstrmize<xs><x0>(xs))
where
{
#impltmp
imap$fopr0<x0><y0> = irmap$fopr<x0><y0>
}
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_irmap_lstrq
  ( xs ) =
strq_vt_imap0<x0><y0>
(gseq_rstrqize<xs><x0>(xs))
where
{
#impltmp
imap$fopr0<x0><y0> = irmap$fopr<x0><y0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_irmap$f2un_lstrm
  (xs, fopr) =
(
gseq_irmap_lstrm<xs><x0><y0>(xs)
) where
{
#impltmp
irmap$fopr<x0><y0>(i0, x0) = fopr(i0, x0)
}
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_irmap$f2un_lstrq
  (xs, fopr) =
(
gseq_irmap_lstrq<xs><x0><y0>(xs)
) where
{
#impltmp
irmap$fopr<x0><y0>(i0, x0) = fopr(i0, x0)
}
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_irmap_rlist
  ( xs ) =
list_vt2t{y0}
(
gseq_irmap_rllist<xs><x0><y0>(xs))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_irmap_rllist
  ( xs ) =
strm_vt_rlistize0<y0>
(gseq_irmap_lstrm<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_irmap$f2un_rllist
  (xs, fopr) =
(
gseq_irmap_rllist<xs><x0><y0>(xs)
) where
{
#impltmp
irmap$fopr<x0><y0>(i0, x0) = fopr(i0, x0)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:vt >
gseq_filter_ares
  ( xs ) =
g_make0_lstrm<x0><ys>
(
gseq_filter_lstrm<xs><x0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter_self
  ( xs ) =
g_make0_lstrm<x0><xs>
(
gseq_filter_lstrm<xs><x0>(xs))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter_list
  ( xs ) =
list_vt2t{x0}
(
gseq_filter_llist<xs><x0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter$f1un_list
  (xs, fopr ) =
list_vt2t{x0}
(
gseq_filter$f1un_llist<xs><x0>(xs, fopr))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter_llist
  ( xs ) =
strm_vt_listize0<x0>
(
gseq_filter_lstrm<xs><x0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter$f1un_llist
  (xs, fopr) =
(
gseq_filter_llist<xs><x0>(xs)
) where
{
#impltmp
filter$test<x0>( x0 ) = fopr( x0 )
}(*where*)//end(gseq_filter$f1un_llist)
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter_lstrm
  ( xs ) =
strm_vt_filter0<x0>
(
  gseq_strmize<xs><x0>(xs))
where
{
#impltmp
filter$test1<x0> = filter$test<x0>
}
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter_lstrq
  ( xs ) =
strq_vt_filter0<x0>
(
  gseq_strqize<xs><x0>(xs))
where
{
#impltmp
filter$test1<x0> = filter$test<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter$f1un_lstrm
  (xs, fopr) =
(
gseq_filter_lstrm<xs><x0>(xs)
) where
{
#impltmp
filter$test<x0>( x0 ) = fopr( x0 )
}(*where*)//end(gseq_filter$f1un_lstrm)
#impltmp
< xs:t0 >
< x0:t0 >
gseq_filter$f1un_lstrq
  (xs, fopr) =
(
gseq_filter_lstrq<xs><x0>(xs)
) where
{
#impltmp
filter$test<x0>( x0 ) = fopr( x0 )
}(*where*)//end(gseq_filter$f1un_lstrq)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-16:
Fri 16 Aug 2024 08:45:52 AM EDT
This is some kind of "fusion" aiming at
saving the intermediate structure that is
otherwise needed in the standard explicit
composition (as reference implementation)!
*)
//
(*
HX-2024-08-17:
Sat 17 Aug 2024 11:47:00 AM EDT
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map$listize =
gseq_map_llist<xs><x0><y0>(*alias*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map$strmize =
gseq_map_lstrm<xs><x0><y0>(*alias*)
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map$strqize =
gseq_map_lstrq<xs><x0><y0>(*alias*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
//
HX:
This is the standard
reference implementation:
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map$forall
  ( xs ) =
(
strm_vt_forall0<y0>
(gseq_map<xs><x0><y0>(xs)))
//
*)
//
(*
HX-2024-08-17:
We need to think about generating
the following style of "fused" code
in some automated manner!!!
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map$forall
  ( xs ) =
(
gseq_forall
<xs><x0>(xs)) where
{
#impltmp
forall$test<x0>(x0) =
forall$test0<y0>(map$fopr<x0><y0>(x0))
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_map$forall$f1un
  (xs, fopr) =
(
gseq_map$forall
<xs><x0><y0>(xs)) where
{
#impltmp
map$fopr<x0><y0>(x0) = fopr(    x0    )
}(*where*)//end(gseq_map$forall$f1un(...))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap$iforall
  ( xs ) =
(
gseq_iforall
<xs><x0>(xs)) where
{
#impltmp
iforall$test<x0>(i0, x0) =
iforall$test0<y0>
(i0, imap$fopr<x0><y0>(i0, x0))
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap$iforall$f2un
  (xs, fopr) =
(
gseq_imap$iforall
<xs><x0><y0>( xs ))
where {
#impltmp
imap$fopr<x0><y0>(i0, x0) = fopr(i0, x0)
}(*where*)//end(gseq_imap$iforall$f2un(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_uncons$forall
  ( xs ) =
(
  auxmain(xs)) where
{
//
fun
auxmain
( xs
: xs ): bool =
(
if
gseq_nilq
<xs><x0>(xs)
then (true) else
let
//
val x0 =
$UN.gseq_head$raw<xs><x0>(xs)
//
in//let
//
if not(
forall$test<x0>(x0))
then false else
auxmain($UN.gseq_tail$raw<xs><x0>(xs))
end//let//else//end-of-[if]
//
)(*llazy*)//end-of-[auxmain(xs)]
//
}(*where*)//end-of-(gseq_uncons$forall(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_uncons$strmize
  ( xs ) =
(
  auxmain(xs)) where
{
//
fun
auxmain
( xs: xs )
: strm_vt(x0) = $llazy
(
if
gseq_nilq
<xs><x0>(xs)
then
(
  strmcon_vt_nil()) else
let
//
val x0 =
$UN.gseq_head$raw<xs><x0>(xs)
val xs =
$UN.gseq_tail$raw<xs><x0>(xs)
//
in//let
(
  strmcon_vt_cons(x0, auxmain(xs)))
end//let//else//end-of-[if]
)(*llazy*)//end-of-[auxmain(xs)]
//
}(*where*)//end-of-(gseq_uncons$strmize(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-21:
Wed 21 Aug 2024 08:16:22 AM EDT
*)
#impltmp
gseq_fmake_fwork
<strn><cgtz>(f0) = strn_fmake_fwork<>(f0)
//
#impltmp
{ x0:t0 }
gseq_fmake_fwork
<a1sz(x0)><x0>(f0) = a1sz_fmake_fwork<x0>(f0)
//
#impltmp
{ x0:t0 }
gseq_fmake_fwork
<list(x0)><x0>(f0) = list_fmake_fwork<x0>(f0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gseq001.dats] *)
