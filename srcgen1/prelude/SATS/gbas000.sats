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
g_new((*_*)): a
*)
fun
<a:vt>
g_make((*_*)): a
//
(* ****** ****** *)
//
fun
<a:vt>
g_self(x : a): a
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
//
fun
<a:vt>
g_sel2
( x0: !(a)
, x1: !(a)): nintlt(2)
fun
<a:vt>
g_sel3
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
g_parse
(rep: strn): a
fun
<a:vt>
g_parse_exn
(rep: strn): a
fun
<a:vt>
g_parse_opt
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
//
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
fun
<x0:vt>
<y0:vt>
map2$fopr(x0: &x0): (y0)
//
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
//
fun
<x0:vt>
<r0:vt>
scanl0$fopr
( r0: r0, x0: ~x0 ): (r0)
fun
<x0:vt>
<r0:vt>
scanl1$fopr
( r0: r0, x0: !x0 ): (r0)
//
fun
<x0:vt>
<r0:vt>
scanr0$fopr
( x0: ~x0, r0: r0 ): (r0)
fun
<x0:vt>
<r0:vt>
scanr1$fopr
( x0: !x0, r0: r0 ): (r0)
//
(* ****** ****** *)
//
fun<x0:t0>
dropif$test(x0: x0): bool
fun<x0:t0>
takeif$test(x0: x0): bool
//
fun<x0:vt>
dropif0$test(x0: !x0): bool
fun<x0:vt>
takeif0$test(x0: !x0): bool
fun<x0:vt>
dropif1$test(x0: !x0): bool
fun<x0:vt>
takeif1$test(x0: !x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
filter$test(x0: x0): bool
fun
<x0:vt>
filter0$test(x0: !x0): bool
fun
<x0:vt>
filter1$test(x0: !x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
search$test(x0: x0): bool
fun
<x0:t0>
search0$test(x0: !x0): bool
fun
<x0:t0>
search1$test(x0: !x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
rsearch$test(x0: x0): bool
fun
<x0:t0>
rsearch0$test(x0: !x0): bool
fun
<x0:t0>
rsearch1$test(x0: !x0): bool
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
mapstrm$fopr(x0: x0): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
mapstrm0$fopr(x0: ~x0): strm_vt(y0)
fun
<x0:vt>
<y0:vt>
mapstrm1$fopr(x0: !x0): strm_vt(y0)
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
fun
<x0:vt>
forall2$test(x0: &x0): bool
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
fun
<x0:vt>
foreach2$work(x0: &x0): void

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
group$test(x0: x0): bool
fun
<x0:vt>
group0$test(x0: !x0): bool
//
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
fun
<x0:vt>
sieve0$test(x1: !x0, x2: !x0): bool
//
(* ****** ****** *)
//
fun
<x0:vt>
<n0:i0>
tabulate$fopr
(index: nintlt(n0)): x0
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
rmap$fopr(x0: x0): (y0)
fun
<x0:vt>
<y0:vt>
rmap0$fopr(x0: ~x0): (y0)
fun
<x0:vt>
<y0:vt>
rmap1$fopr(x0: !x0): (y0)
fun
<x0:vt>
<y0:vt>
rmap2$fopr(x0: &x0): (y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
rexists$test(x0: x0): bool
fun
<x0:vt>
rexists0$test(x0: ~x0): bool
fun
<x0:vt>
rexists1$test(x0: !x0): bool
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
fun
<x0:vt>
rforall2$test(x0: &x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
rforeach$work(x0: x0): void
fun
<x0:vt>
rforeach0$work(x0: ~x0): void
fun
<x0:vt>
rforeach1$work(x0: !x0): void
fun
<x0:vt>
rforeach2$work(x0: &x0): void
//
(* ****** ****** *)
//
// For gseq-i-operations
//
(* ****** ****** *)
//
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
fun
<x0:vt>
<y0:vt>
imap2$fopr(nint, &x0): (y0)
//
(* ****** ****** *)
//
fun<x0:t0>
idropif$test(nint, x0): bool
fun<x0:t0>
itakeif$test(nint, x0): bool
//
fun<x0:vt>
idropif0$test(nint, !x0): bool
fun<x0:vt>
itakeif0$test(nint, !x0): bool
fun<x0:vt>
idropif1$test(nint, !x0): bool
fun<x0:vt>
itakeif1$test(nint, !x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
ifilter$test(nint, x0): bool
fun
<x0:vt>
ifilter0$test(nint, !x0): bool
fun
<x0:vt>
ifilter1$test(nint, !x0): bool
//
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
fun
<x0:vt>
iforall2$test(nint, &x0): bool
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
iforeach$work(nint, x0): void
fun
<x0:vt>
iforeach0$work(nint, ~x0): void
fun
<x0:vt>
iforeach1$work(nint, !x0): void
fun
<x0:vt>
iforeach2$work(nint, &x0): void
//
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
//
// For z2-gseq-operations
//
(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
<z0:vt>
z2map$fopr(x0, y0): (z0)
fun
<x0:vt
,y0:vt>
<z0:vt>
z2map0$fopr(~x0, ~y0): (z0)
fun
<x0:vt
,y0:vt>
<z0:vt>
z2map1$fopr(!x0, !y0): (z0)
//
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
fun
<x0:t0
,y0:t0>
<z0:vt>
z2imap$fopr(nint,x0,y0): (z0)
fun
<x0:vt
,y0:vt>
<z0:vt>
z2imap0$fopr(nint,~x0,~y0): (z0)
fun
<x0:vt
,y0:vt>
<z0:vt>
z2imap1$fopr(nint,!x0,!y0): (z0)
//
(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
z2iforall$test(nint,x0,y0): bool
fun
<x0:vt
,y0:vt>
z2iforall0$test(nint,~x0,~y0): bool
fun
<x0:vt
,y0:vt>
z2iforall1$test(nint,!x0,!y0): bool
//
(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
z2iforcmp$fcmp(nint,x0,y0): sint
fun
<x0:vt
,y0:vt>
z2iforcmp0$fcmp(nint,~x0,~y0): sint
fun
<x0:vt
,y0:vt>
z2iforcmp1$fcmp(nint,!x0,!y0): sint
//
(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
z2iforeach$work(nint,x0,y0): void
fun
<x0:vt
,y0:vt>
z2iforeach0$work(nint,~x0,~y0): void
fun
<x0:vt
,y0:vt>
z2iforeach1$work(nint,!x0,!y0): void
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
x2filter$test
  (x0: x0, y0: y0): bool
//
(* ****** ****** *)
fun
<x0:t0
,y0:t0>
x2foreach$work(x0, y0): void
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
x2ifilter$test
  (nint, x0, nint, y0): bool
//
(* ****** ****** *)
//
fun
<x0:t0
,y0:t0>
x2iforeach$work(nint, x0, nint, y0): void
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
(*
HX-2023-02-26: Various combinator types
*)
(* ****** ****** *)
#typedef
strmize
(xs:t0, x0:t0) = ( xs) -<cfr> strm_vt(x0)
#typedef
strmize0
(xs:vt, x0:vt) = (~xs) -<cfr> strm_vt(x0)
(* ****** ****** *)
#typedef
forall
(xs:t0, x0:t0) = ( xs, x0 -<cfr> bool) -<cfr> bool
#typedef
forall0
(xs:vt, x0:vt) = (~xs, x0 -<cfr> bool) -<cfr> bool
#typedef
forall1
(xs:vt, x0:vt) = (!xs, x0 -<cfr> bool) -<cfr> bool
(* ****** ****** *)
#typedef
foreach
(xs:t0, x0:t0) = ( xs, x0 -<cfr> void) -<cfr> void
#typedef
foreach0
(xs:vt, x0:t0) = (~xs, x0 -<cfr> void) -<cfr> void
#typedef
foreach1
(xs:vt, x0:t0) = (!xs, x0 -<cfr> void) -<cfr> void
(* ****** ****** *)
#typedef
rstrmize
(xs:t0, x0:t0) = ( xs) -<cfr> strm_vt(x0)
#typedef
rstrmize0
(xs:vt, x0:vt) = (~xs) -<cfr> strm_vt(x0)
(* ****** ****** *)
#typedef
rforall
(xs:t0, x0:t0) = ( xs, x0 -<cfr> bool) -<cfr> bool
#typedef
rforall0
(xs:vt, x0:vt) = (~xs, x0 -<cfr> bool) -<cfr> bool
#typedef
rforall1
(xs:vt, x0:vt) = (!xs, x0 -<cfr> bool) -<cfr> bool
(* ****** ****** *)
#typedef
rforeach
(xs:t0, x0:t0) = ( xs, x0 -<cfr> void) -<cfr> void
#typedef
rforeach0
(xs:vt, x0:t0) = (~xs, x0 -<cfr> void) -<cfr> void
#typedef
rforeach1
(xs:vt, x0:t0) = (!xs, x0 -<cfr> void) -<cfr> void
(* ****** ****** *)
//
#typedef
foldl//cfr
(xs:t0,x0:t0,r0:vt) = ( xs,r0,(r0,x0) -<cfr> r0) -<cfr> r0
#typedef
foldl0//cfr
(xs:vt,x0:vt,r0:vt) = (~xs,r0,(r0,x0) -<cfr> r0) -<cfr> r0
#typedef
foldl1//cfr
(xs:vt,x0:vt,r0:vt) = (!xs,r0,(r0,x0) -<cfr> r0) -<cfr> r0
//
#typedef
foldr//cfr
(xs:t0,x0:t0,r0:vt) = ( xs,r0,(x0,r0) -<cfr> r0) -<cfr> r0
#typedef
foldr0//cfr
(xs:vt,x0:t0,r0:vt) = (~xs,r0,(x0,r0) -<cfr> r0) -<cfr> r0
#typedef
foldr1//cfr
(xs:vt,x0:t0,r0:vt) = (!xs,r0,(x0,r0) -<cfr> r0) -<cfr> r0
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gbas000.sats] *)
