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
max0$nil = max$nil<x0>(*nil*)
#impltmp
< x0:t0 >
min0$nil = min$nil<x0>(*nil*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
get0_at$exn = get_at$exn<xs><x0>
#impltmp
< xs:t0 >
< x0:t0 >
set0_at$exn = set_at$exn<xs><x0>
#impltmp
< xs:t0 >
< x0:t0 >
fset0_at$exn = fset_at$exn<xs><x0>
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
foritm0$work = foritm$work<x0>
#impltmp
< x0:t0 >
foritm1$work = foritm$work<x0>
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
folditm0$fopr = folditm$fopr<x0><r0>
#impltmp
< x0:t0 >
< r0:vt >
folditm1$fopr = folditm$fopr<x0><r0>
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
(* ****** ****** *)
//
#impltmp
< x0:t0 >
filter0$test = filter$test<x0>
#impltmp
< x0:t0 >
filter1$test = filter$test<x0>
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
