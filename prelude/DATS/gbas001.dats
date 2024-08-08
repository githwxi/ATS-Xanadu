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
Wed 10 Jul 2024 10:42:18 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
max$nil() =
(
  $raise UndefinedExn())
#impltmp
< x0:t0 >
min$nil() =
(
  $raise UndefinedExn())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
get$at$exn
  (xs, i0) =
(
$raise SubscriptExn(*void*))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
set$at$exn
  (xs, i0, x0) =
(
$raise SubscriptExn(*void*))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
fset$at$exn
  (xs, i0, x0) =
(
$raise SubscriptExn(*void*))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
forall$test =
rforall$test<x0>
#impltmp
< x0:t0 >
rforall$test = forall$test<x0>
//
#impltmp
< x0:t0 >
iforall$test =
irforall$test<x0>
#impltmp
< x0:t0 >
irforall$test = iforall$test<x0>
*)
//
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
foritm$work =
rforitm$work<x0>
#impltmp
< x0:t0 >
rforitm$work = foritm$work<x0>
//
#impltmp
< x0:t0 >
iforitm$work =
irforitm$work<x0>
#impltmp
< x0:t0 >
irforitm$work = iforitm$work<x0>
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
< r0:vt >
folditm$fopr
( r0
, x0 ) =
(
rfolditm$fopr<x0><r0>(x0, r0))
#impltmp
< x0:t0 >
< r0:vt >
rfolditm$fopr
( x0
, r0 ) =
(
  folditm$fopr<x0><r0>(r0, x0))
*)
//
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
< r0:vt >
foldall$fopr
( r0
, x0 ) =
(
rfoldall$fopr<x0><r0>(x0, r0))
#impltmp
< x0:t0 >
< r0:vt >
rfoldall$fopr
( x0
, r0 ) =
(
  foldall$fopr<x0><r0>(r0, x0))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-16:
Tue 16 Jul 2024 10:43:39 AM EDT
*)
(*
#impltmp
< x0:t0 >
exists$test =
rexists$test<x0>
#impltmp
< x0:t0 >
rexists$test = exists$test<x0>
//
#impltmp
< x0:t0 >
iexists$test =
irexists$test<x0>
#impltmp
< x0:t0 >
irexists$test = iexists$test<x0>
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-22:
Mon 22 Jul 2024 05:20:11 PM EDT
*)
//
(*
#impltmp
< x0:t0 >
forall$test = forall$test0<x0>
#impltmp
< x0:t0 >
forall$test = forall$test1<x0>
*)
//
(*
#impltmp
< x0:t0 >
rforall$test = rforall$test0<x0>
#impltmp
< x0:t0 >
rforall$test = rforall$test1<x0>
*)
//
(*
#impltmp
< x0:t0 >
iforall$test = iforall$test0<x0>
#impltmp
< x0:t0 >
iforall$test = iforall$test1<x0>
*)
//
(*
#impltmp
< x0:t0 >
irforall$test = irforall$test0<x0>
#impltmp
< x0:t0 >
irforall$test = irforall$test1<x0>
*)
//
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
foritm$work = foritm$work0<x0>
#impltmp
< x0:t0 >
foritm$work = foritm$work1<x0>
*)
//
(*
#impltmp
< x0:t0 >
rforitm$work = rforitm$work0<x0>
#impltmp
< x0:t0 >
rforitm$work = rforitm$work1<x0>
*)
//
(*
#impltmp
< x0:t0 >
iforitm$work = iforitm$work0<x0>
#impltmp
< x0:t0 >
iforitm$work = iforitm$work1<x0>
*)
//
(*
#impltmp
< x0:t0 >
irforitm$work = irforitm$work0<x0>
#impltmp
< x0:t0 >
irforitm$work = irforitm$work1<x0>
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-22:
Mon 22 Jul 2024 05:20:11 PM EDT
*)
//
(*
#impltmp
< x0:t0 >
< r0:vt >
folditm$fopr = folditm$fopr0<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
folditm$fopr = folditm$fopr1<x0><r0>
*)
//
(*
#impltmp
< x0:t0 >
< r0:vt >
rfolditm$fopr = rfolditm$fopr0<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
rfolditm$fopr = rfolditm$fopr1<x0><r0>
*)
//
(*
#impltmp
< x0:t0 >
< r0:vt >
ifolditm$fopr = ifolditm$fopr0<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
ifolditm$fopr = ifolditm$fopr1<x0><r0>
*)
//
(*
#impltmp
< x0:t0 >
< r0:vt >
irfolditm$fopr = irfolditm$fopr0<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
irfolditm$fopr = irfolditm$fopr1<x0><r0>
*)
//
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
< r0:vt >
foldall$fopr = foldall$fopr0<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
foldall$fopr = foldall$fopr1<x0><r0>
*)
//
(*
#impltmp
< x0:t0 >
< r0:vt >
rfoldall$fopr = rfoldall$fopr0<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
rfoldall$fopr = rfoldall$fopr0<x0><r0>
*)
//
(*
#impltmp
< x0:t0 >
< r0:vt >
ifoldall$fopr = ifoldall$fopr0<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
ifoldall$fopr = ifoldall$fopr1<x0><r0>
*)
//
(*
#impltmp
< x0:t0 >
< r0:vt >
irfoldall$fopr = irfoldall$fopr0<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
irfoldall$fopr = irfoldall$fopr1<x0><r0>
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-22:
Mon 22 Jul 2024 05:26:27 PM EDT
*)
//
(*
#impltmp
< x0:t0 >
< y0:vt >
map$fopr = map$fopr0<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
map$fopr = map$fopr1<x0><y0>
*)
//
(*
#impltmp
< x0:t0 >
< y0:vt >
rmap$fopr = rmap$fopr0<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
rmap$fopr = rmap$fopr1<x0><y0>
*)
//
(*
#impltmp
< x0:t0 >
< y0:vt >
imap$fopr = imap$fopr0<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
imap$fopr = imap$fopr1<x0><y0>
*)
//
(*
#impltmp
< x0:t0 >
< y0:vt >
irmap$fopr = irmap$fopr0<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
irmap$fopr = irmap$fopr1<x0><y0>
*)
//
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
filter$test = filter$test1<x0>
#impltmp
< x0:t0 >
rfilter$test = rfilter$test1<x0>
#impltmp
< x0:t0 >
ifilter$test = ifilter$test1<x0>
#impltmp
< x0:t0 >
irfilter$test = irfilter$test1<x0>
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-22:
Mon 22 Jul 2024 05:29:19 PM EDT
*)
//
(*
#impltmp
< x0:t0 >
< y0:vt >
mapoptn$fopr = mapoptn$fopr0<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
mapoptn$fopr = mapoptn$fopr0<x0><y0>
*)
//
(*
#impltmp
< x0:t0 >
< y0:vt >
maplist$fopr = maplist$fopr0<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
maplist$fopr = maplist$fopr1<x0><y0>
*)
//
(*
#impltmp
< x0:t0 >
< y0:vt >
mapstrm$fopr = mapstrm$fopr0<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
mapstrm$fopr = mapstrm$fopr1<x0><y0>
*)
//
(*
#impltmp
< x0:t0 >
< y0:vt >
mapstrq$fopr = mapstrq$fopr0<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
mapstrq$fopr = mapstrq$fopr1<x0><y0>
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gbas001.dats] *)
