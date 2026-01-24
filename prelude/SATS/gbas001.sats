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
(*
HX-2025-09-07:
[ri] traverses
(x0, x1, x2) as:
(2, x2), (1, x1), (0, x0)
[ir] readily replaces [ri]!
//
fun
<x0:t0>
riforall$test(ni, x0): bool
//
*)
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
search$test(itm: x0): bool
fun
<x0:t0>
search$tcmp(itm: x0): sint
//
fun
<x0:t0>
rsearch$test(itm: x0): bool
fun
<x0:t0>
rsearch$tcmp(itm: x0): sint
//
fun
<x0:t0>
isearch$test(pos: ni, itm: x0): bool
fun
<x0:t0>
isearch$tcmp(pos: ni, itm: x0): sint
//
fun
<x0:t0>
irsearch$test(pos: ni, itm: x0): bool
fun
<x0:t0>
irsearch$tcmp(pos: ni, itm: x0): sint
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
exists$tcmp(itm: x0): sint
//
fun
<x0:t0>
rexists$test(x0: x0): bool
fun
<x0:t0>
rexists$tcmp(x0: x0): sint
//
fun
<x0:t0>
iexists$test(ni, x0): bool
fun
<x0:t0>
iexists$tcmp(ni, x0): sint
//
fun
<x0:t0>
irexists$test(ni, x0): bool
fun
<x0:t0>
irexists$tcmp(ni, x0): sint
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
(*
HX-2025-05-31:
Sat May 31 07:04:48 PM EDT 2025
*)
//
fun
<x0:t0>
<y0:vt>
<e1:vt>
map$e1nv$fopr(itm: x0, env: !e1): (y0)
fun
<x0:t0>
<y0:vt>
<e1:vt>
rmap$e1nv$fopr(itm: x0, env: !e1): (y0)
fun
<x0:t0>
<y0:vt>
<e1:vt>
imap$e1nv$fopr(pos: ni, itm: x0, env: !e1): (y0)
fun
<x0:t0>
<y0:vt>
<e1:vt>
irmap$e1nv$fopr(pos: ni, itm: x0, env: !e1): (y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-06-01:
Sun Jun  1 11:04:55 AM EDT 2025
*)
//
fun
<x0:t0>
<e1:vt>
forall$e1nv$test(x0: x0, e1: !e1): bool
fun
<x0:t0>
<e1:vt>
rforall$e1nv$test(x0: x0, e1: !e1): bool
fun
<x0:t0>
<e1:vt>
iforall$e1nv$test(ni, x0, e1: !e1): bool
fun
<x0:t0>
<e1:vt>
irforall$e1nv$test(ni, x0, e1: !e1): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
<e1:vt>
foritm$e1nv$test(x0: x0, e1: !e1): void
fun
<x0:t0>
<e1:vt>
rforitm$e1nv$test(x0: x0, e1: !e1): void
fun
<x0:t0>
<e1:vt>
iforitm$e1nv$test(ni, x0, e1: !e1): void
fun
<x0:t0>
<e1:vt>
irforitm$e1nv$test(ni, x0, e1: !e1): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-05:
Mon Jan  5 12:17:18 PM EST 2026
*)
//
fun
<x0:t0>
sortedq$lteq(x1: x0, x2: x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-23:
Fri Jan 23 09:39:08 PM EST 2026
*)
//
//
fun
<x0:t0>
drop$till$test(itm: x0): bool
fun
<x0:t0>
rdrop$till$test(itm: x0): bool
fun
<x0:t0>
idrop$till$test(pos: ni, itm: x0): bool
fun
<x0:t0>
irdrop$till$test(pos: ni, itm: x0): bool
//
(* ****** ****** *)
//
fun
<x0:t0>
take$when$test(itm: x0): bool
fun
<x0:t0>
rtake$when$test(itm: x0): bool
fun
<x0:t0>
itake$when$test(pos: ni, itm: x0): bool
fun
<x0:t0>
irtake$when$test(pos: ni, itm: x0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_gbas001.sats] *)
(***********************************************************************)
