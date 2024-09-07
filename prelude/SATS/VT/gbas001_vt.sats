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
Wed 10 Jul 2024 09:26:36 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
//
(*
HX-2024-07-15
*)
fun
<x0:vt>
max$nil0((*nil*)): (x0)
fun
<x0:vt>
max$nil1((*nil*)): (x0)
//
fun
<x0:vt>
min$nil0((*nil*)): (x0)
fun
<x0:vt>
min$nil1((*nil*)): (x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-15
*)
fun
<xs:vt>
<x0:vt>
get$at$exn0
(xs: ~xs, i0: ni): x0
fun
<xs:vt>
<x0:vt>
get$at$exn1
(xs: !xs, i0: ni): x0
//
(*
HX-2024-08-02:
This makes no sense!
fun
<xs:vt>
<x0:vt>
set$at$exn0
(xs: ~xs, x0, ni): void
*)
fun
<xs:vt>
<x0:vt>
set$at$exn1
(xs: !xs, x0, ni): void
//
fun
<xs:vt>
<x0:vt>
fset$at$exn0
(xs: ~xs, x0, ni): (xs)
fun
<xs:vt>
<x0:vt>
fset$at$exn1
(xs: !xs, x0, ni): (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
forall$test0(x0: ~x0): bool
fun
<x0:vt>
forall$test1(x0: !x0): bool
//
fun
<x0:vt>
exists$test0(x0: ~x0): bool
fun
<x0:vt>
exists$test1(x0: !x0): bool
//
fun
<x0:vt>
rforall$test0(x0: ~x0): bool
fun
<x0:vt>
rforall$test1(x0: !x0): bool
//
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
<x0:vt>
iforall$test0(ni, ~x0): bool
fun
<x0:vt>
iforall$test1(ni, !x0): bool
//
fun
<x0:vt>
iexists$test0(ni, ~x0): bool
fun
<x0:vt>
iexists$test1(ni, !x0): bool
//
(* ****** ****** *)
//
fun
<x0:vt>
irforall$test0(ni, ~x0): bool
fun
<x0:vt>
irforall$test1(ni, !x0): bool
//
fun
<x0:vt>
irexists$test0(ni, ~x0): bool
fun
<x0:vt>
irexists$test1(ni, !x0): bool
//
(* ****** ****** *)
//
fun
<x0:vt>
foritm$work0(x0: ~x0): void
fun
<x0:vt>
foritm$work1(x0: !x0): void
//
fun
<x0:vt>
rforitm$work0(x0: ~x0): void
fun
<x0:vt>
rforitm$work1(x0: !x0): void
//
fun
<x0:vt>
iforitm$work0(ni, ~x0): void
fun
<x0:vt>
iforitm$work1(ni, !x0): void
//
fun
<x0:vt>
irforitm$work0(ni, ~x0): void
fun
<x0:vt>
irforitm$work1(ni, !x0): void
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
folditm$fopr0(r0, ~x0): (r0)
fun
<x0:vt>
<r0:vt>
folditm$fopr1(r0, !x0): (r0)
//
fun
<x0:vt>
<r0:vt>
rfolditm$fopr0(~x0, r0): (r0)
fun
<x0:vt>
<r0:vt>
rfolditm$fopr1(!x0, r0): (r0)
//
fun
<x0:vt>
<r0:vt>
ifolditm$fopr0(r0, ni, ~x0): (r0)
fun
<x0:vt>
<r0:vt>
ifolditm$fopr1(r0, ni, !x0): (r0)
//
fun
<x0:vt>
<r0:vt>
irfolditm$fopr0(ni, ~x0, r0): (r0)
fun
<x0:vt>
<r0:vt>
irfolditm$fopr1(ni, !x0, r0): (r0)
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
foldall$fopr0(r0, ~x0): (bool, r0)
fun
<x0:vt>
<r0:vt>
foldall$fopr1(r0, !x0): (bool, r0)
//
fun
<x0:vt>
<r0:vt>
rfoldall$fopr0(~x0, r0): (bool, r0)
fun
<x0:vt>
<r0:vt>
rfoldall$fopr1(!x0, r0): (bool, r0)
//
fun
<x0:vt>
<r0:vt>
ifoldall$fopr0(r0, ni, ~x0): (bool, r0)
fun
<x0:vt>
<r0:vt>
ifoldall$fopr1(r0, ni, !x0): (bool, r0)
//
fun
<x0:vt>
<r0:vt>
irfoldall$fopr0(ni, ~x0, r0): (bool, r0)
fun
<x0:vt>
<r0:vt>
irfoldall$fopr1(ni, !x0, r0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
map$fopr0(x0: ~x0): ( y0 )
fun
<x0:vt>
<y0:vt>
map$fopr1(x0: !x0): ( y0 )
//
fun
<x0:vt>
<y0:vt>
rmap$fopr0(x0: ~x0): ( y0 )
fun
<x0:vt>
<y0:vt>
rmap$fopr1(x0: !x0): ( y0 )
//
fun
<x0:vt>
<y0:vt>
imap$fopr0(ni, ~x0): ( y0 )
fun
<x0:vt>
<y0:vt>
imap$fopr1(ni, !x0): ( y0 )
//
fun
<x0:vt>
<y0:vt>
irmap$fopr0(ni, ~x0): ( y0 )
fun
<x0:vt>
<y0:vt>
irmap$fopr1(ni, !x0): ( y0 )
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-24:
[filter$test0] is removed!
fun
<x0:vt>
<y0:vt>
filter$test0(x0: ~x0): bool
*)
//
fun
<x0:vt>
filter$test1(x0: !x0): bool
fun
<x0:vt>
rfilter$test1(x0: !x0): bool
fun
<x0:vt>
ifilter$test1(x0: !x0): bool
fun
<x0:vt>
irfilter$test1(x0: !x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
mapoptn$fopr0(x0: ~x0): optn_vt(y0)
fun
<x0:vt>
<y0:vt>
maplist$fopr0(x0: ~x0): list_vt(y0)
fun
<x0:vt>
<y0:vt>
mapstrq$fopr0(x0: ~x0): strq_vt(y0)
//
fun
<x0:vt>
<y0:vt>
mapoptn$fopr1(x0: !x0): optn_vt(y0)
fun
<x0:vt>
<y0:vt>
maplist$fopr1(x0: !x0): list_vt(y0)
fun
<x0:vt>
<y0:vt>
mapstrq$fopr1(x0: !x0): strq_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-31:
It is in [gbas001.sats]!
fun
<x0:vt> // HX: vt!
fmake$fwork((*void*)): void
*)
fun
<x0:vt>
fmake$fwork$work0(x0: ~x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
c2hoose$forall$test0(~x0, ~x0): bool
fun
<x0:vt>
c3hoose$forall$test0(~x0, ~x0, ~x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_gbas001_vt.sats] *)
