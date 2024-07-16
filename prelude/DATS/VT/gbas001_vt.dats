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
#impltmp
< x0:t0 >
forall0$test = forall$test<x0>
#impltmp
< x0:t0 >
forall1$test = forall$test<x0>
//
#impltmp
< x0:t0 >
rforall0$test = rforall$test<x0>
#impltmp
< x0:t0 >
rforall1$test = rforall$test<x0>
//
#impltmp
< x0:t0 >
iforall0$test = iforall$test<x0>
#impltmp
< x0:t0 >
iforall1$test = iforall$test<x0>
//
#impltmp
< x0:t0 >
irforall0$test = irforall$test<x0>
#impltmp
< x0:t0 >
irforall1$test = irforall$test<x0>
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
foritm0$work = foritm$work<x0>
#impltmp
< x0:t0 >
foritm1$work = foritm$work<x0>
//
#impltmp
< x0:t0 >
rforitm0$work = rforitm$work<x0>
#impltmp
< x0:t0 >
rforitm1$work = rforitm$work<x0>
//
#impltmp
< x0:t0 >
iforitm0$work = iforitm$work<x0>
#impltmp
< x0:t0 >
iforitm1$work = iforitm$work<x0>
//
#impltmp
< x0:t0 >
irforitm0$work = irforitm$work<x0>
#impltmp
< x0:t0 >
irforitm1$work = irforitm$work<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< r0:vt >
folditm0$fopr = folditm$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
folditm1$fopr = folditm$fopr<x0><r0>
//
#impltmp
< x0:t0 >
< r0:vt >
rfolditm0$fopr = rfolditm$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
rfolditm1$fopr = rfolditm$fopr<x0><r0>
//
#impltmp
< x0:t0 >
< r0:vt >
ifolditm0$fopr = ifolditm$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
ifolditm1$fopr = ifolditm$fopr<x0><r0>
//
#impltmp
< x0:t0 >
< r0:vt >
irfolditm0$fopr = irfolditm$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
irfolditm1$fopr = irfolditm$fopr<x0><r0>
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< r0:vt >
foldall0$fopr = foldall$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
foldall1$fopr = foldall$fopr<x0><r0>
//
#impltmp
< x0:t0 >
< r0:vt >
rfoldall0$fopr = rfoldall$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
rfoldall1$fopr = rfoldall$fopr<x0><r0>
//
#impltmp
< x0:t0 >
< r0:vt >
ifoldall0$fopr = ifoldall$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
ifoldall1$fopr = ifoldall$fopr<x0><r0>
//
#impltmp
< x0:t0 >
< r0:vt >
irfoldall0$fopr = irfoldall$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
irfoldall1$fopr = irfoldall$fopr<x0><r0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:vt >
map0$fopr = map$fopr<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
map1$fopr = map$fopr<x0><y0>
//
#impltmp
< x0:t0 >
< y0:vt >
rmap0$fopr = rmap$fopr<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
rmap1$fopr = rmap$fopr<x0><y0>
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
filter0$test = filter$test<x0>
#impltmp
< x0:t0 >
filter1$test = filter$test<x0>
//
#impltmp
< x0:t0 >
rfilter0$test = rfilter$test<x0>
#impltmp
< x0:t0 >
rfilter1$test = rfilter$test<x0>
//
#impltmp
< x0:t0 >
ifilter0$test = ifilter$test<x0>
#impltmp
< x0:t0 >
ifilter1$test = ifilter$test<x0>
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
< y0:vt >
mapoptn0$fopr = mapoptn$fopr<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
mapoptn1$fopr = mapoptn$fopr<x0><y0>
//
#impltmp
< x0:t0 >
< y0:vt >
maplist0$fopr = maplist$fopr<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
maplist1$fopr = maplist$fopr<x0><y0>
//
#impltmp
< x0:t0 >
< y0:vt >
mapstrm0$fopr = mapstrm$fopr<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
mapstrm1$fopr = mapstrm$fopr<x0><y0>
//
#impltmp
< x0:t0 >
< y0:vt >
mapstrq0$fopr = mapstrq$fopr<x0><y0>
#impltmp
< x0:t0 >
< y0:vt >
mapstrq1$fopr = mapstrq$fopr<x0><y0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gbas001_vt.dats] *)
