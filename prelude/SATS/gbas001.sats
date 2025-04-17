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
Wed 10 Jul 2024 09:08:28 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-15
*)
//
fun
<x0:t0>
max$nil((*nil*)): (x0)
fun
<x0:t0>
min$nil((*nil*)): (x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-15
*)
//
fun
<xs:t0>
<x0:vt>
get$at$exn
(xs: xs, i0: ni): (x0)
fun
<xs:t0>
<x0:vt>
set$at$exn
(xs:xs,i0:ni,x0:x0): void
fun
<xs:t0>
<x0:t0>
fset$at$exn
(xs:xs,i0:ni,x0:x0): (xs)
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
cget$at$exn
(xs: xs, i0: ni): (x0)
fun
<xs:t0>
<x0:vt>
setf$at$exn
(xs:xs,i0:ni,x0:x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
forall$test(x0: x0): bool
fun
<x0:t0>
rforall$test(x0: x0): bool
fun
<x0:t0>
iforall$test(ni, x0): bool
fun
<x0:t0>
irforall$test(ni, x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
foritm$work(x0: x0): void
fun
<x0:t0>
rforitm$work(x0: x0): void
fun
<x0:t0>
iforitm$work(ni, x0): void
fun
<x0:t0>
irforitm$work(ni, x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
folditm$fopr(r0, x0): (r0)
fun
<x0:t0>
<r0:vt>
rfolditm$fopr(x0, r0): (r0)
//
fun
<x0:t0>
<r0:vt>
ifolditm$fopr
(res: r0, pos: ni, itm: x0): (r0)
fun
<x0:t0>
<r0:vt>
irfolditm$fopr
(pos: ni, itm: x0, res: r0): (r0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<r0:vt>
foldall$fopr(r0, x0): (bool, r0)
fun
<x0:t0>
<r0:vt>
rfoldall$fopr(x0, r0): (bool, r0)
//
fun
<x0:t0>
<r0:vt>
ifoldall$fopr
(res: r0, pos: ni, itm: x0): (bool, r0)
fun
<x0:t0>
<r0:vt>
irfoldall$fopr
(pos: ni, itm: x0, res: r0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
map$fopr(itm: x0): (y0)
fun
<x0:t0>
<y0:vt>
rmap$fopr(itm: x0): (y0)
fun
<x0:t0>
<y0:vt>
imap$fopr(pos: ni, itm: x0): (y0)
fun
<x0:t0>
<y0:vt>
irmap$fopr(pos: ni, itm: x0): (y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
filter$test(itm: x0): bool
fun
<x0:t0>
rfilter$test(itm: x0): bool
fun
<x0:t0>
ifilter$test(pos: ni, itm: x0): bool
fun
<x0:t0>
irfilter$test(pos: ni, itm: x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
mapoptn$fopr(itm: x0): optn_vt(y0)
fun
<x0:t0>
<y0:vt>
rmapoptn$fopr(itm: x0): optn_vt(y0)
fun
<x0:t0>
<y0:vt>
imapoptn$fopr(pos: ni, itm: x0): optn_vt(y0)
fun
<x0:t0>
<y0:vt>
irmapoptn$fopr(pos: ni, itm: x0): optn_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
maplist$fopr(itm: x0): list_vt(y0)
fun
<x0:t0>
<y0:vt>
rmaplist$fopr(itm: x0): list_vt(y0)
fun
<x0:t0>
<y0:vt>
imaplist$fopr(pos: ni, itm: x0): list_vt(y0)
fun
<x0:t0>
<y0:vt>
irmaplist$fopr(pos: ni, itm: x0): list_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
mapstrm$fopr(itm: x0): strm_vt(y0)
fun
<x0:t0>
<y0:vt>
rmapstrm$fopr(itm: x0): strm_vt(y0)
fun
<x0:t0>
<y0:vt>
imapstrm$fopr(pos: ni, itm: x0): strm_vt(y0)
fun
<x0:t0>
<y0:vt>
irmapstrm$fopr(pos: ni, itm: x0): strm_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
mapstrq$fopr(itm: x0): strq_vt(y0)
fun
<x0:t0>
<y0:vt>
rmapstrq$fopr(itm: x0): strq_vt(y0)
fun
<x0:t0>
<y0:vt>
imapstrq$fopr(pos: ni, itm: x0): strq_vt(y0)
fun
<x0:t0>
<y0:vt>
irmapstrq$fopr(pos: ni, itm: x0): strq_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-16:
Tue 16 Jul 2024 10:43:39 AM EDT
*)
fun
<x0:t0>
exists$test(x0: x0): bool
fun
<x0:t0>
rexists$test(x0: x0): bool
fun
<x0:t0>
iexists$test(ni, x0): bool
fun
<x0:t0>
irexists$test(ni, x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt> // HX: vt!
fmake$fwork((*void*)): void
fun
<x0:t0>
fmake$fwork$work(x0: x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
c2hoose$forall$test(x0, x0): bool
fun
<x0:t0>
c3hoose$forall$test(x0, x0, x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gbas001.sats] *)
