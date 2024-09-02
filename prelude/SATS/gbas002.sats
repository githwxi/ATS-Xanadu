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
Sat 13 Jul 2024 09:24:55 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-07-13:
We should probably
not go higher to handle z3!!!
*)
#abstype
z2tup_type
(xs:t0,ys:t0) <= (xs,ys)
#sexpdef z2tup = z2tup_type
//
fun
<xs:t0>
<ys:t0>
z2tup_make
(xs:xs, ys:ys): z2tup(xs, ys)
fun
<xs:t0>
<ys:t0>
z2tup_unmk
( ztup
: z2tup(xs, ys)): @( xs, ys )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
z2forall$test
(x1: x1, x2: x2): bool
fun
<x1:t0>
<x2:t0>
rz2forall$test
(x1: x1, x2: x2): bool
fun
<x1:t0>
<x2:t0>
iz2forall$test
(i0: ni, x1: x1, x2: x2): bool
fun
<x1:t0>
<x2:t0>
irz2forall$test
(i0: ni, x1: x1, x2: x2): bool
//
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
z2forcmp$test
(x1: x1, x2: x2): sint
fun
<x1:t0>
<x2:t0>
iz2forcmp$test
(i0: ni, x1: x1, x2: x2): sint
//
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
z2foritm$work
(x1: x1, x2: x2): void
fun
<x1:t0>
<x2:t0>
rz2foritm$work
(x1: x1, x2: x2): void
fun
<x1:t0>
<x2:t0>
iz2foritm$work
(i0: ni, x1: x1, x2: x2): void
fun
<x1:t0>
<x2:t0>
irz2foritm$work
(i0: ni, x1: x1, x2: x2): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
<r0:vt>
z2folditm$fopr
(x1: x1, x2: x2, r0: r0): (r0)
fun
<x1:t0>
<x2:t0>
<r0:vt>
rz2folditm$fopr
(x1: x1, x2: x2, r0: r0): (r0)
fun
<x1:t0>
<x2:t0>
<r0:vt>
iz2folditm$fopr
(i0: ni
,x1: x1, x2: x2, r0: r0): (r0)
fun
<x1:t0>
<x2:t0>
<r0:vt>
irz2folditm$fopr
(i0: ni
,x1: x1, x2: x2, r0: r0): (r0)
//
fun
<x1:t0>
<x2:t0>
<r0:vt>
z2foldall$fopr
(x1: x1, x2: x2, r0: r0): (bool, r0)
fun
<x1:t0>
<x2:t0>
<r0:vt>
rz2foldall$fopr
(x1: x1, x2: x2, r0: r0): (bool, r0)
fun
<x1:t0>
<x2:t0>
<r0:vt>
iz2foldall$fopr
(i0: ni
,x1: x1, x2: x2, r0: r0): (bool, r0)
fun
<x1:t0>
<x2:t0>
<r0:vt>
irz2foldall$fopr
(i0: ni
,x1: x1, x2: x2, r0: r0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
<y0:vt>
z2map$fopr(x1: x1, x2: x2): (y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
rz2map$fopr(x1: x1, x2: x2): (y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
iz2map$fopr
  (i0: ni, x1: x1, x2: x2): (y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
irz2map$fopr
  (i0: ni, x1: x1, x2: x2): (y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
<y0:vt>
z2mapoptn$fopr(x1, x2): optn_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
z2maplist$fopr(x1, x2): list_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
z2mapstrm$fopr(x1, x2): strm_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
z2mapstrq$fopr(x1, x2): strq_vt(y0)
//
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
<y0:vt>
rz2mapoptn$fopr(x1, x2): optn_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
rz2maplist$fopr(x1, x2): list_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
rz2mapstrm$fopr(x1, x2): strm_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
rz2mapstrq$fopr(x1, x2): strq_vt(y0)
//
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
<y0:vt>
iz2mapoptn$fopr
(i0: ni, x1: x1, x2: x2): optn_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
iz2maplist$fopr
(i0: ni, x1: x1, x2: x2): list_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
iz2mapstrm$fopr
(i0: ni, x1: x1, x2: x2): strm_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
iz2mapstrq$fopr
(i0: ni, x1: x1, x2: x2): strq_vt(y0)
//
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
<y0:vt>
irz2mapoptn$fopr
(i0: ni, x1: x1, x2: x2): optn_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
irz2maplist$fopr
(i0: ni, x1: x1, x2: x2): list_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
irz2mapstrm$fopr
(i0: ni, x1: x1, x2: x2): strm_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
irz2mapstrq$fopr
(i0: ni, x1: x1, x2: x2): strq_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-04:
We should probably
not go higher to handle x3!!!
Sun 04 Aug 2024 08:10:45 AM EDT
*)
#abstype
x2tup_type
(xs:t0,ys:t0) <= (xs,ys)
#sexpdef x2tup = x2tup_type
//
fun
<xs:t0>
<ys:t0>
x2tup_make
(xs:xs, ys:ys): x2tup(xs, ys)
fun
<xs:t0>
<ys:t0>
x2tup_unmk
( xtup
: x2tup(xs, ys)): @( xs, ys )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
x2forall$test
(x1: x1, x2: x2): bool
fun
<x1:t0>
<x2:t0>
x2rforall$test
(x1: x1, x2: x2): bool
fun
<x1:t0>
<x2:t0>
x2iforall$test
(i0: ni, x1: x1, x2: x2): bool
fun
<x1:t0>
<x2:t0>
x2irforall$test
(i0: ni, x1: x1, x2: x2): bool
//
fun
<x1:t0>
<x2:t0>
x2foritm$work
(x1: x1, x2: x2): void
fun
<x1:t0>
<x2:t0>
x2rforitm$work
(x1: x1, x2: x2): void
fun
<x1:t0>
<x2:t0>
x2iforitm$work
(i0: ni, x1: x1, x2: x2): void
fun
<x1:t0>
<x2:t0>
x2irforitm$work
(i0: ni, x1: x1, x2: x2): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
<r0:vt>
x2folditm$fopr
(x1: x1, x2: x2, r0: r0): (r0)
fun
<x1:t0>
<x2:t0>
<r0:vt>
x2rfolditm$fopr
(x1: x1, x2: x2, r0: r0): (r0)
fun
<x1:t0>
<x2:t0>
<r0:vt>
x2ifolditm$fopr
(i0: ni
,x1: x1, x2: x2, r0: r0): (r0)
fun
<x1:t0>
<x2:t0>
<r0:vt>
x2irfolditm$fopr
(i0: ni
,x1: x1, x2: x2, r0: r0): (r0)
//
fun
<x1:t0>
<x2:t0>
<r0:vt>
x2foldall$fopr
(x1: x1, x2: x2, r0: r0): (bool, r0)
fun
<x1:t0>
<x2:t0>
<r0:vt>
x2rfoldall$fopr
(x1: x1, x2: x2, r0: r0): (bool, r0)
fun
<x1:t0>
<x2:t0>
<r0:vt>
x2ifoldall$fopr
(i0: ni
,x1: x1, x2: x2, r0: r0): (bool, r0)
fun
<x1:t0>
<x2:t0>
<r0:vt>
x2irfoldall$fopr
(i0: ni
,x1: x1, x2: x2, r0: r0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2map$fopr(x1: x1, x2: x2): (y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2rmap$fopr(x1: x1, x2: x2): (y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2imap$fopr
( i0: nint, x1: x1, x2: x2): (y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2irmap$fopr
( i0: nint, x1: x1, x2: x2): (y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2mapoptn$fopr(x1, x2): optn_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2maplist$fopr(x1, x2): list_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2mapstrm$fopr(x1, x2): strm_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2mapstrq$fopr(x1, x2): strq_vt(y0)
//
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2rmapoptn$fopr(x1, x2): optn_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2rmaplist$fopr(x1, x2): list_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2rmapstrm$fopr(x1, x2): strm_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2rmapstrq$fopr(x1, x2): strq_vt(y0)
//
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2imapoptn$fopr
(i0: ni, x1: x1, x2: x2): optn_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2imaplist$fopr
(i0: ni, x1: x1, x2: x2): list_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2imapstrm$fopr
(i0: ni, x1: x1, x2: x2): strm_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2imapstrq$fopr
(i0: ni, x1: x1, x2: x2): strq_vt(y0)
//
(* ****** ****** *)
//
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2irmapoptn$fopr
(i0: ni, x1: x1, x2: x2): optn_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2irmaplist$fopr
(i0: ni, x1: x1, x2: x2): list_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2irmapstrm$fopr
(i0: ni, x1: x1, x2: x2): strm_vt(y0)
fun
<x1:t0>
<x2:t0>
<y0:vt>
x2irmapstrq$fopr
(i0: ni, x1: x1, x2: x2): strq_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gbas002.sats] *)
