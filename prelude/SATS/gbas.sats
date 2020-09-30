(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// For generic basics
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: June, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

fun
<a:vt>
g_self(x: a): a

(* ****** ****** *)

fun
<a:vt>
g_free(x: ~a): void
fun
<a:vt>
g_copy(x: !(a)): (a)

(* ****** ****** *)
//
fun
<a:vt>
g_input(): a
fun
<a:vt>
g_input_exn
((*void*)): a
fun
<a:vt>
g_input_opt
((*void*)): optn_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
g_equal(!a, !a): bool
fun
<a:vt>
g_noteq(!a, !a): bool
//
(* ****** ****** *)
//
fun
<a:vt>
g_print(x: !a): void
fun
<a:vt>
g_print0(x: ~a): void
(*
fun
<a:vt>
g_print1(x: !a): void
*)
//
(* ****** ****** *)

fun
<x0:t0>
<y0:vt>
map$fopr(x0: x0): (y0)
fun
<x0:vt>
<y0:vt>
map0$fopr(x0: ~x0): (y0)
fun
<x0:vt>
<y0:vt>
map1$fopr(x0: !x0): (y0)

(* ****** ****** *)

fun
<x0:t0>
dropif$test(x0: x0): bool

(* ****** ****** *)
//
fun
<x0:t0>
filter$test(x0: x0): bool
fun
<x0:vt>
filter0$test(x0: ~x0): bool
fun
<x0:vt>
filter1$test(x0: !x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
mapoptn$fopr(x0: x0): optn_vt(y0)
fun
<x0:vt>
<y0:vt>
mapoptn0$fopr(x0: ~x0): optn_vt(y0)
fun
<x0:vt>
<y0:vt>
mapoptn1$fopr(x0: !x0): optn_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
maplist$fopr(x0: x0): list_vt(y0)
fun
<x0:vt>
<y0:vt>
maplist0$fopr(x0: ~x0): list_vt(y0)
fun
<x0:vt>
<y0:vt>
maplist1$fopr(x0: !x0): list_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
mapstrm$fopr(x0: x0): stream_vt(y0)
fun
<x0:vt>
<y0:vt>
mapstrm0$fopr(x0: ~x0): stream_vt(y0)
fun
<x0:vt>
<y0:vt>
mapstrm1$fopr(x0: !x0): stream_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
exists$test(x0: x0): bool
fun
<x0:vt>
exists0$test(x0: ~x0): bool
fun
<x0:vt>
exists1$test(x0: !x0): bool
//
fun
<x0:t0>
forall$test(x0: x0): bool
fun
<x0:vt>
forall0$test(x0: ~x0): bool
fun
<x0:vt>
forall1$test(x0: !x0): bool
//
(* ****** ****** *)

fun
<x0:t0>
foreach$work(x0: x0): void
fun
<x0:vt>
foreach0$work(x0: ~x0): void
fun
<x0:vt>
foreach1$work(x0: !x0): void

(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
foldl$fopr(r0: r0, x0: x0): r0
fun
<x0:vt>
<r0:vt>
foldl0$fopr(r0: r0, x0: ~x0): r0
fun
<x0:vt>
<r0:vt>
foldl1$fopr(r0: r0, x0: !x0): r0
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
foldr$fopr(x0: x0, r0: r0): r0
fun
<x0:vt>
<r0:vt>
foldr0$fopr(x0: ~x0, r0: r0): r0
fun
<x0:vt>
<r0:vt>
foldr1$fopr(x0: !x0, r0: r0): r0
//
(* ****** ****** *)
//
fun
<x0:t0>
sieve$test(x1: x0, x2: x0): bool
//
(* ****** ****** *)
//
fun
<a:vt>
<n:i0>
tabulate$fopr(i0: nintlt(n)): (a)
//
(* ****** ****** *)
//
fun
<x0:t0>
rexists$test(x0: x0): bool
//
fun
<x0:t0>
rforall$test(x0: x0): bool
fun
<x0:vt>
rforall0$test(x0: ~x0): bool
fun
<x0:vt>
rforall1$test(x0: !x0): bool
//
(* ****** ****** *)

fun
<x0:t0>
rforeach$work(x0: x0): void
fun
<x0:vt>
rforeach0$work(x0: ~x0): void
fun
<x0:vt>
rforeach1$work(x0: !x0): void

(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)

fun
<x0:t0>
<y0:vt>
imap$fopr(nint, x0): (y0)
fun
<x0:vt>
<y0:vt>
imap0$fopr(nint, ~x0): (y0)
fun
<x0:vt>
<y0:vt>
imap1$fopr(nint, !x0): (y0)

(* ****** ****** *)

fun
<x0:t0>
idropif$test(nint, x0): bool
fun
<x0:vt>
idropif0$test(nint, ~x0): bool
fun
<x0:vt>
idropif1$test(nint, !x0): bool

(* ****** ****** *)

fun
<x0:t0>
itakeif$test(nint, x0): bool
fun
<x0:vt>
itakeif0$test(nint, ~x0): bool
fun
<x0:vt>
itakeif1$test(nint, !x0): bool

(* ****** ****** *)

fun
<x0:t0>
ifilter$test(nint, x0): bool
fun
<x0:vt>
ifilter0$test(nint, ~x0): bool
fun
<x0:vt>
ifilter1$test(nint, !x0): bool

(* ****** ****** *)
//
fun
<x0:t0>
iexists$test(nint, x0): bool
fun
<x0:vt>
iexists0$test(nint, ~x0): bool
fun
<x0:vt>
iexists1$test(nint, !x0): bool
//
fun
<x0:t0>
iforall$test(nint, x0): bool
fun
<x0:vt>
iforall0$test(nint, ~x0): bool
fun
<x0:vt>
iforall1$test(nint, !x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
<ln:i0>
iforalln$test
  (i0: sint(ln), x0: x0): bool
//
(* ****** ****** *)

fun
<x0:t0>
iforeach$work(nint, x0): void
fun
<x0:vt>
iforeach0$work(nint, ~x0): void
fun
<x0:vt>
iforeach1$work(nint, !x0): void

(* ****** ****** *)
//
fun
<x0:t0>
<ln:i0>
iforeachn$work
  (i0: sint(ln), x0: x0): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
ifoldl$fopr
( r0: r0, i0: nint, x0: x0 ): r0
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
ifoldr$fopr
( i0: nint, x0: x0, r0: r0 ): r0
//
(* ****** ****** *)
//
// For z2-gseq-operations
//
(* ****** ****** *)

fun
<x0:t0
,y0:t0>
<z0:vt>
z2map$fopr(x0, y0): (z0)

(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
<r0:vt>
z2foldl$fopr(r0, x0, y0): r0
fun
<x0:t0
,y0:t0>
<r0:vt>
z2foldr$fopr(x0, y0, r0): r0
//
(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
z2forall$test(x0, y0): bool
fun
<x0:vt
,y0:vt>
z2forall0$test(~x0, ~y0): bool
fun
<x0:vt
,y0:vt>
z2forall1$test(!x0, !y0): bool
//
fun
<x0:t0
,y0:t0>
z2forcmp$fcmp(x0, y0): sint
fun
<x0:vt
,y0:vt>
z2forcmp0$fcmp(~x0, ~y0): sint
fun
<x0:vt
,y0:vt>
z2forcmp1$fcmp(!x0, !y0): sint
//
fun
<x0:t0
,y0:t0>
z2foreach$work(x0, y0): void
fun
<x0:vt
,y0:vt>
z2foreach0$work(~x0, ~y0): void
fun
<x0:vt
,y0:vt>
z2foreach1$work(!x0, !y0): void
//
(* ****** ****** *)
//
// For x2-gseq-operations
//
(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
<z0:vt>
x2map$fopr(x0, y0): z0
//
fun
<x0:t0
,y0:t0>
<z0:vt>
x2filter$test
  (x0: x0, y0: y0): bool
//
(* ****** ****** *)
//
fun<>
x2foreach_row$beg(): void
fun<>
x2foreach_row$end(): void
fun
<x0:t0
,y0:t0>
x2foreach_row$work(x0, y0): void
//
(* ****** ****** *)
//
fun<>
x2foreach_col$beg(): void
fun<>
x2foreach_col$end(): void
fun
<x0:t0
,y0:t0>
x2foreach_col$work(x0, y0): void
//
(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
<z0:vt>
x2imap$fopr
  (nint, x0, nint, y0): z0
fun
<x0:t0
,y0:t0>
<z0:vt>
x2ifilter$test
  (nint, x0, nint, y0): bool
//
(* ****** ****** *)
//
fun<>
x2iforeach_row$beg(nint): void
fun<>
x2iforeach_row$end(nint): void
fun
<x0:t0
,y0:t0>
x2iforeach_row$work(nint, x0, nint, y0): void
//
(* ****** ****** *)
//
fun<>
x2iforeach_col$beg(nint): void
fun<>
x2iforeach_col$end(nint): void
fun
<x0:t0
,y0:t0>
x2iforeach_col$work(nint, x0, nint, y0): void
//
(* ****** ****** *)

(* end of [gbas.sats] *)
