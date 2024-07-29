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
Fri 12 Jul 2024 08:39:27 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-22:
Should this kind of
routing be supported?
Mon 22 Jul 2024 08:28:43 PM EDT
*)
(*
//
#impltmp
< x0:vt >
forall$test0(x0) =
let
val r0 =
forall$test1<x0>(x0)
in//let
(
  g_free<x0>(x0); r0) end//let
//
#impltmp
< x0:vt >
forall$test1(x0) =
let
val x0 =
g_copy<x0>(x0) in//let
(forall$test0<x0>(x0)) end//let
//
*)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
forall$test0 = forall$test<x0>
#impltmp
< x0:t0 >
forall$test1 = forall$test<x0>
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
rforall$test0 = rforall$test<x0>
#impltmp
< x0:t0 >
rforall$test1 = rforall$test<x0>
//
#impltmp
< x0:t0 >
iforall$test0 = iforall$test<x0>
#impltmp
< x0:t0 >
iforall$test1 = iforall$test<x0>
//
#impltmp
< x0:t0 >
irforall$test0 = irforall$test<x0>
#impltmp
< x0:t0 >
irforall$test1 = irforall$test<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
foritm$work0 = foritm$work<x0>
#impltmp
< x0:t0 >
foritm$work1 = foritm$work<x0>
//
#impltmp
< x0:t0 >
rforitm$work0 = rforitm$work<x0>
#impltmp
< x0:t0 >
rforitm$work1 = rforitm$work<x0>
//
#impltmp
< x0:t0 >
iforitm$work0 = iforitm$work<x0>
#impltmp
< x0:t0 >
iforitm$work1 = iforitm$work<x0>
//
#impltmp
< x0:t0 >
irforitm$work0 = irforitm$work<x0>
#impltmp
< x0:t0 >
irforitm$work1 = irforitm$work<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< r0:vt >
folditm$fopr0 = folditm$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
folditm$fopr1 = folditm$fopr<x0><r0>
//
#impltmp
< x0:t0 >
< r0:vt >
rfolditm$fopr0 = rfolditm$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
rfolditm$fopr1 = rfolditm$fopr<x0><r0>
//
#impltmp
< x0:t0 >
< r0:vt >
ifolditm$fopr0 = ifolditm$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
ifolditm$fopr1 = ifolditm$fopr<x0><r0>
//
#impltmp
< x0:t0 >
< r0:vt >
irfolditm$fopr0 = irfolditm$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
irfolditm$fopr1 = irfolditm$fopr<x0><r0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< r0:vt >
foldall$fopr0 = foldall$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
foldall$fopr1 = foldall$fopr<x0><r0>
//
#impltmp
< x0:t0 >
< r0:vt >
rfoldall$fopr0 = rfoldall$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
rfoldall$fopr1 = rfoldall$fopr<x0><r0>
//
#impltmp
< x0:t0 >
< r0:vt >
ifoldall$fopr0 = ifoldall$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
ifoldall$fopr1 = ifoldall$fopr<x0><r0>
//
#impltmp
< x0:t0 >
< r0:vt >
irfoldall$fopr0 = irfoldall$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
irfoldall$fopr1 = irfoldall$fopr<x0><r0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:vt >
map$fopr0 = map$fopr<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
map$fopr1 = map$fopr<x0><y0>
//
#impltmp
< x0:t0 >
< y0:vt >
rmap$fopr0 = rmap$fopr<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
rmap$fopr1 = rmap$fopr<x0><y0>
//
#impltmp
< x0:t0 >
< y0:vt >
imap$fopr0 = imap$fopr<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
imap$fopr1 = imap$fopr<x0><y0>
//
#impltmp
< x0:t0 >
< y0:vt >
irmap$fopr0 = irmap$fopr<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
irmap$fopr1 = irmap$fopr<x0><y0>
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
filter$test1 = filter$test<x0>
#impltmp
< x0:t0 >
rfilter$test1 = rfilter$test<x0>
#impltmp
< x0:t0 >
ifilter$test1 = ifilter$test<x0>
#impltmp
< x0:t0 >
irfilter$test1 = ifilter$test<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-22:
Mon 22 Jul 2024 08:28:43 PM EDT
*)
//
#impltmp
< x0:t0 >
< y0:vt >
mapoptn$fopr0 = mapoptn$fopr<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
mapoptn$fopr1 = mapoptn$fopr<x0><y0>
//
#impltmp
< x0:t0 >
< y0:vt >
maplist$fopr0 = maplist$fopr<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
maplist$fopr1 = maplist$fopr<x0><y0>
//
#impltmp
< x0:t0 >
< y0:vt >
mapstrm$fopr0 = mapstrm$fopr<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
mapstrm$fopr1 = mapstrm$fopr<x0><y0>
//
#impltmp
< x0:t0 >
< y0:vt >
mapstrq$fopr0 = mapstrq$fopr<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
mapstrq$fopr1 = mapstrq$fopr<x0><y0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gbas001_vt.dats] *)
