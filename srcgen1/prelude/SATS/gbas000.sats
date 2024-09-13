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
//
(*
fun
<a:vt>
g_new((*_*)): (a)
*)
fun
<a:vt>
g_make((*_*)): (a)
//
(* ****** ****** *)
//
fun
<a:t0>
g_void(x: a): void
//
fun
<a:vt>
g_self(x: a): ( a )
//
(* ****** ****** *)
//
fun
<a:vt>
g_data(x : !a): ?!a
//
(* ****** ****** *)
//
fun
<a:vt>
g_free(x : ~a): void
fun
<a:vt>
g_copy(x : !a): ( a )
//
fun
<a:vt>
g_updt(x : &(a) >> _): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
g_work(x : a): void
fun
<a:t0>
g_test(x : a): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
g_s2el
( x0: !(a)
, x1: !(a)): nintlt(2)
fun
<a:vt>
g_s3el
( x0: !(a)
, x1: !(a)
, x2: !(a)): nintlt(3)
//
(* ****** ****** *)
//
fun
<a:vt>
g_input(): a
fun
<a:vt>
g_input$exn
((*void*)): a
fun
<a:vt>
g_input$opt
((*void*)): optn_vt(a)
//
(* ****** ****** *)
//
fun
<a:vt>
g_parse
(rep: strn): a
fun
<a:vt>
g_parse$exn
(rep: strn): a
fun
<a:vt>
g_parse$opt
(rep: strn): optn_vt(a)
//
(* ****** ****** *)
//
fun
<a:t0>
g_equal(a, a): bool
fun
<a:t0>
g_noteq(a, a): bool
//
(* ****** ****** *)
//
fun
<a:vt>
g_equal0(~a, ~a): bool
fun
<a:vt>
g_noteq0(~a, ~a): bool
//
fun
<a:vt>
g_equal1(!a, !a): bool
fun
<a:vt>
g_noteq1(!a, !a): bool
//
(* ****** ****** *)
(*
HX-2020-11-12:
reference equality
*)
fun
<a:t0>
g_eqref(a, a): bool
fun
<a:t0>
g_neqrf(a, a): bool
//
(*
HX-2020-11-12:
Note that == is already
widely used for equality
*)
//
#symload == with g_eqref
#symload !== with g_neqrf
//
(*
#symload === with g_eqref
#symload !=== with g_neqrf
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
g_print(x: a): void
fun
<a:vt>
g_print0(x: ~a): void
fun
<a:vt>
g_print1(x: !a): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
map$fopr(x0: x0): (y0)
fun
<x0:vt>
<y0:vt>
map$fopr0(x0: ~x0): (y0)
fun
<x0:vt>
<y0:vt>
map$fopr1(x0: !x0): (y0)
fun
<x0:vt>
<y0:vt>
map2fopr2(x0: &x0): (y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
scanl$fopr
( r0: r0, x0: x0 ): (r0)
fun
<x0:t0>
<r0:vt>
scanr$fopr
( x0: x0, r0: r0 ): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
scanl$fopr0
( r0: r0, x0: ~x0 ): (r0)
fun
<x0:vt>
<r0:vt>
scanl$fopr1
( r0: r0, x0: !x0 ): (r0)
//
fun
<x0:vt>
<r0:vt>
scanr$fopr0
( x0: ~x0, r0: r0 ): (r0)
fun
<x0:vt>
<r0:vt>
scanr$fopr1
( x0: !x0, r0: r0 ): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<x0:t0>
dropif$test(x0: x0): bool
fun<x0:t0>
takeif$test(x0: x0): bool
//
fun<x0:vt>
dropif$test0(x0: !x0): bool
fun<x0:vt>
takeif$test0(x0: !x0): bool
fun<x0:vt>
dropif$test1(x0: !x0): bool
fun<x0:vt>
takeif$test1(x0: !x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
filter$test(x0: x0): bool
(*
fun
<x0:vt>
filter$test0(x0: ~x0): bool
*)
fun
<x0:vt>
filter$test1(x0: !x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
search$test(x0: x0): bool
fun
<x0:t0>
search$test0(x0: !x0): bool
fun
<x0:t0>
search$test1(x0: !x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
rsearch$test(x0: x0): bool
fun
<x0:t0>
rsearch$test0(x0: !x0): bool
fun
<x0:t0>
rsearch$test1(x0: !x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
mapoptn$fopr(x0: x0): optn_vt(y0)
fun
<x0:vt>
<y0:vt>
mapoptn$fopr0(x0: ~x0): optn_vt(y0)
fun
<x0:vt>
<y0:vt>
mapoptn$fopr1(x0: !x0): optn_vt(y0)
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
maplist$fopr0(x0: ~x0): list_vt(y0)
fun
<x0:vt>
<y0:vt>
maplist$fopr1(x0: !x0): list_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
mapstrm$fopr(x0: x0): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
mapstrm$fopr0(x0: ~x0): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
mapstrm$fopr1(x0: !x0): strm_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
mapstrq$fopr(x0: x0): strq_vt(y0)
fun
<x0:vt>
<y0:vt>
mapstrq$fopr0(x0: ~x0): strq_vt(y0)
fun
<x0:vt>
<y0:vt>
mapstrq$fopr1(x0: !x0): strq_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
exists$test(x0: x0): bool
fun
<x0:vt>
exists$test0(x0: ~x0): bool
fun
<x0:vt>
exists$test1(x0: !x0): bool
fun
<x0:vt>
exists$test2(x0: &x0): bool
//
fun
<x0:t0>
forall$test(x0: x0): bool
fun
<x0:vt>
forall$test0(x0: ~x0): bool
fun
<x0:vt>
forall$test1(x0: !x0): bool
fun
<x0:vt>
forall$test2(x0: &x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
foritm$work(x0: x0): void
fun
<x0:vt>
foritm$work0(x0: ~x0): void
fun
<x0:vt>
foritm$work1(x0: !x0): void
fun
<x0:vt>
foritm$work2(x0: &x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
foldl$fopr(r0: r0, x0: x0): r0
fun
<x0:vt>
<r0:vt>
foldl$fopr0(r0: r0, x0: ~x0): r0
fun
<x0:vt>
<r0:vt>
foldl$fopr1(r0: r0, x0: !x0): r0
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
foldr$fopr0(x0: ~x0, r0: r0): r0
fun
<x0:vt>
<r0:vt>
foldr$fopr1(x0: !x0, r0: r0): r0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
group$test(x0: x0): bool
fun
<x0:vt>
group$test0(x0: !x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2022-07-03:
//
Sun Jul  3 10:35:38 EDT 2022
//
An element is KEPT only if
the [sieve$test] on it passes
*)
fun
<x0:t0>
sieve$test(x1: x0, x2: x0): bool
(*
HX-2024-07-24:
This is not supported!!!
fun
<x0:vt>
sieve$test0(x1: ~x0, x2: ~x0): bool
*)
fun
<x0:vt>
sieve$test1(x1: !x0, x2: !x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<n0:i0>
tabulate$fopr
(index: nintlt(n0)): x0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
rmap$fopr(x0: x0): (y0)
fun
<x0:vt>
<y0:vt>
rmap$fopr0(x0: ~x0): (y0)
fun
<x0:vt>
<y0:vt>
rmap$fopr1(x0: !x0): (y0)
fun
<x0:vt>
<y0:vt>
rmap$fopr2(x0: &x0): (y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
rexists$test(x0: x0): bool
fun
<x0:vt>
rexists$test0(x0: ~x0): bool
fun
<x0:vt>
rexists$test1(x0: !x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
rforall$test(x0: x0): bool
fun
<x0:vt>
rforall$test0(x0: ~x0): bool
fun
<x0:vt>
rforall$test1(x0: !x0): bool
fun
<x0:vt>
rforall$test2(x0: &x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
rforitm$work(x0: x0): void
fun
<x0:vt>
rforitm$work0(x0: ~x0): void
fun
<x0:vt>
rforitm$work1(x0: !x0): void
fun
<x0:vt>
rforitm$work2(x0: &x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
imap$fopr(nint, x0): (y0)
fun
<x0:vt>
<y0:vt>
imap$fopr0(nint, ~x0): (y0)
fun
<x0:vt>
<y0:vt>
imap$fopr1(nint, !x0): (y0)
fun
<x0:vt>
<y0:vt>
imap$fopr2(nint, &x0): (y0)
//
(* ****** ****** *)
//
fun<x0:t0>
idropif$test(nint, x0): bool
fun<x0:t0>
itakeif$test(nint, x0): bool
//
fun<x0:vt>
idropif$test0(nint, !x0): bool
fun<x0:vt>
itakeif$test0(nint, !x0): bool
fun<x0:vt>
idropif$test1(nint, !x0): bool
fun<x0:vt>
itakeif$test1(nint, !x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
ifilter$test(nint, x0): bool
(*
fun
<x0:vt>
ifilter$test0(nint, !x0): bool
*)
fun
<x0:vt>
ifilter$test1(nint, !x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
iexists$test(nint, x0): bool
fun
<x0:vt>
iexists$test0(nint, ~x0): bool
fun
<x0:vt>
iexists$test1(nint, !x0): bool
//
fun
<x0:t0>
iforall$test(nint, x0): bool
fun
<x0:vt>
iforall$test0(nint, ~x0): bool
fun
<x0:vt>
iforall$test1(nint, !x0): bool
fun
<x0:vt>
iforall$test2(nint, &x0): bool
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
//
fun
<x0:t0>
iforitm$work(nint, x0): void
fun
<x0:vt>
iforitm$work0(nint, ~x0): void
fun
<x0:vt>
iforitm$work1(nint, !x0): void
fun
<x0:vt>
iforitm$work2(nint, &x0): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<ln:i0>
iforitmn$work
  (i0: sint(ln), x0: x0): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
ifoldl$fopr
(r0: r0, i0: nint, x0: x0): r0
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
ifoldr$fopr
(i0: nint, x0: x0, r0: r0): r0
//
(* ****** ****** *)
(* ****** ****** *)
//
// For z2-gseq-operations
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#abstype
z2tup_type
(xs:t0,ys:t0) <= (xs,ys)
#sexpdef z2tup = z2tup_type
fun
<xs:t0>
<ys:t0>
z2tup_make
( xs, ys ): z2tup(xs, ys)
fun
<xs:t0>
<ys:t0>
z2tup_unmk
(z2tup(xs, ys)): @(xs, ys)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
<z0:vt>
z2map$fopr(x0, y0): (z0)
fun
<x0:vt>
<y0:vt>
<z0:vt>
z2map$fopr0(~x0, ~y0): (z0)
fun
<x0:vt>
<y0:vt>
<z0:vt>
z2map$fopr1(!x0, !y0): (z0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
<r0:vt>
z2foldl$fopr(r0, x0, y0): r0
fun
<x0:t0>
<y0:t0>
<r0:vt>
z2foldr$fopr(x0, y0, r0): r0
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
z2forall$test(x0, y0): bool
fun
<x0:vt>
<y0:vt>
z2forall$test0(~x0, ~y0): bool
fun
<x0:vt>
<y0:vt>
z2forall$test1(!x0, !y0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
z2forcmp$test(x0, y0): sint
fun
<x0:vt>
<y0:vt>
z2forcmp$test0(~x0, ~y0): sint
fun
<x0:vt>
<y0:vt>
z2forcmp$test1(!x0, !y0): sint
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
z2foritm$work(x0, y0): void
fun
<x0:vt>
<y0:vt>
z2foritm$work0(~x0, ~y0): void
fun
<x0:vt>
<y0:vt>
z2foritm$work1(!x0, !y0): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
<z0:vt>
iz2map$fopr(nint,x0,y0): (z0)
fun
<x0:vt>
<y0:vt>
<z0:vt>
iz2map$fopr0(nint,~x0,~y0): (z0)
fun
<x0:vt>
<y0:vt>
<z0:vt>
iz2map$fopr1(nint,!x0,!y0): (z0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
iz2forall$test(nint,x0,y0): bool
fun
<x0:vt>
<y0:vt>
iz2forall$test0(nint,~x0,~y0): bool
fun
<x0:vt>
<y0:vt>
iz2forall$test1(nint,!x0,!y0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
iz2forcmp$test(nint,x0,y0): sint
fun
<x0:vt>
<y0:vt>
iz2forcmp$test0(nint,~x0,~y0): sint
fun
<x0:vt>
<y0:vt>
iz2forcmp$test1(nint,!x0,!y0): sint
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
iz2foritm$work(nint,x0,y0): void
fun
<x0:vt>
<y0:vt>
iz2foritm$work0(nint,~x0,~y0): void
fun
<x0:vt>
<y0:vt>
iz2foritm$work1(nint,!x0,!y0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
// For x2-gseq-operations
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#abstype
x2tup_type
(xs:t0,ys:t0) <= (xs,ys)
#sexpdef x2tup = x2tup_type
fun
<xs:t0>
<ys:t0>
x2tup_make
( xs, ys ): x2tup(xs, ys)
fun
<xs:t0>
<ys:t0>
x2tup_unmk
(x2tup(xs, ys)): @(xs, ys)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
<z0:vt>
x2map$fopr(x0, y0): z0
//
fun
<x0:t0>
<y0:t0>
x2filter$test
  (x0: x0, y0: y0): bool
//
(* ****** ****** *)
fun
<x0:t0>
<y0:t0>
x2forall$test(x0, y0): bool
fun
<x0:t0>
<y0:t0>
x2rforall$test(x0, y0): bool
(* ****** ****** *)
fun
<x0:t0>
<y0:t0>
x2foritm$work(x0, y0): void
fun
<x0:t0>
<y0:t0>
x2rforitm$work(x0, y0): void
(* ****** ****** *)
//
fun<>
x2foritm_row$beg(): void
fun<>
x2foritm_row$end(): void
fun
<x0:t0>
<y0:t0>
x2foritm_row$work(x0, y0): void
//
(* ****** ****** *)
//
fun<>
x2foritm_col$beg(): void
fun<>
x2foritm_col$end(): void
fun
<x0:t0>
<y0:t0>
x2foritm_col$work(x0, y0): void
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
<z0:vt>
x2imap$fopr
  (nint, x0, nint, y0): z0
fun
<x0:t0>
<y0:t0>
x2ifilter$test
  (nint, x0, nint, y0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
x2iforall$test(nint, x0, nint, y0): bool
fun
<x0:t0>
<y0:t0>
x2iforitm$work(nint, x0, nint, y0): void
//
(* ****** ****** *)
//
fun<>
x2iforitm_row$beg(nint): void
fun<>
x2iforitm_row$end(nint): void
fun
<x0:t0>
<y0:t0>
x2iforitm_row$work(nint, x0, nint, y0): void
//
(* ****** ****** *)
//
fun<>
x2iforitm_col$beg(nint): void
fun<>
x2iforitm_col$end(nint): void
fun
<x0:t0>
<y0:t0>
x2iforitm_col$work(nint, x0, nint, y0): void
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2023-02-26: Various combinator types
*)
(* ****** ****** *)
(* ****** ****** *)
#typedef
strmize
(xs:t0, x0:t0) = ( xs) -> strm_vt(x0)
#typedef
strmize0
(xs:vt, x0:vt) = (~xs) -> strm_vt(x0)
(* ****** ****** *)
#typedef
forall
(xs:t0, x0:t0) = ( xs, x0 -> bool) -> bool
#typedef
forall0
(xs:vt, x0:vt) = (~xs, x0 -> bool) -> bool
#typedef
forall1
(xs:vt, x0:vt) = (!xs, x0 -> bool) -> bool
(* ****** ****** *)
#typedef
foritm
(xs:t0, x0:t0) = ( xs, x0 -> void) -> void
#typedef
foritm0
(xs:vt, x0:t0) = (~xs, x0 -> void) -> void
#typedef
foritm1
(xs:vt, x0:t0) = (!xs, x0 -> void) -> void
(* ****** ****** *)
#typedef
rstrmize
(xs:t0, x0:t0) = ( xs) -> strm_vt(x0)
#typedef
rstrmize0
(xs:vt, x0:vt) = (~xs) -> strm_vt(x0)
(* ****** ****** *)
#typedef
rforall
(xs:t0, x0:t0) = ( xs, x0 -> bool) -> bool
#typedef
rforall0
(xs:vt, x0:vt) = (~xs, x0 -> bool) -> bool
#typedef
rforall1
(xs:vt, x0:vt) = (!xs, x0 -> bool) -> bool
(* ****** ****** *)
#typedef
rforitm
(xs:t0, x0:t0) = ( xs, x0 -> void) -> void
#typedef
rforitm0
(xs:vt, x0:t0) = (~xs, x0 -> void) -> void
#typedef
rforitm1
(xs:vt, x0:t0) = (!xs, x0 -> void) -> void
(* ****** ****** *)
//
#typedef
foldl//cfr
(xs:t0,x0:t0,r0:vt) = ( xs,r0,(r0,x0) -> r0) -> r0
#typedef
foldl0//cfr
(xs:vt,x0:vt,r0:vt) = (~xs,r0,(r0,x0) -> r0) -> r0
#typedef
foldl1//cfr
(xs:vt,x0:vt,r0:vt) = (!xs,r0,(r0,x0) -> r0) -> r0
//
#typedef
foldr//cfr
(xs:t0,x0:t0,r0:vt) = ( xs,r0,(x0,r0) -> r0) -> r0
#typedef
foldr0//cfr
(xs:vt,x0:t0,r0:vt) = (~xs,r0,(x0,r0) -> r0) -> r0
#typedef
foldr1//cfr
(xs:vt,x0:t0,r0:vt) = (!xs,r0,(x0,r0) -> r0) -> r0
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_gbas000.sats] *)
