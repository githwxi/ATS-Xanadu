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
max0$nil((*nil*)): (x0)
fun
<x0:vt>
max1$nil((*nil*)): (x0)
//
fun
<x0:vt>
min1$nil((*nil*)): (x0)
fun
<x0:vt>
min0$nil((*nil*)): (x0)
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
get0_at$exn
  (i0: ni): x0
fun
<xs:vt>
<x0:vt>
get1_at$exn
(xs: !xs, i0: ni): x0
//
fun
<xs:vt>
<x0:vt>
set0_at$exn
  (i0: ni): void
fun
<xs:vt>
<x0:vt>
set1_at$exn
(xs: !xs, i0: ni): void
//
fun
<xs:vt>
<x0:vt>
fset0_at$exn
  (i0: ni): (xs)
fun
<xs:vt>
<x0:vt>
fset1_at$exn
(xs: !xs, i0: ni): (xs)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
forall0$test(x0: ~x0): bool
fun
<x0:vt>
forall1$test(x0: !x0): bool
//
fun
<x0:vt>
rforall0$test(x0: ~x0): bool
fun
<x0:vt>
rforall1$test(x0: !x0): bool
//
(* ****** ****** *)
//
fun
<x0:vt>
exists0$test(x0: ~x0): bool
fun
<x0:vt>
exists1$test(x0: !x0): bool
//
fun
<x0:vt>
rexists0$test(x0: ~x0): bool
fun
<x0:vt>
rexists1$test(x0: !x0): bool
//
(* ****** ****** *)
//
fun
<x0:vt>
foritm0$work(x0: ~x0): void
fun
<x0:vt>
foritm1$work(x0: !x0): void
//
fun
<x0:vt>
rforitm0$work(x0: ~x0): void
fun
<x0:vt>
rforitm1$work(x0: !x0): void
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
folditm0$fopr(r0, ~x0): (r0)
fun
<x0:vt>
<r0:vt>
folditm1$fopr(r0, !x0): (r0)
//
fun
<x0:vt>
<r0:vt>
foldall0$fopr(r0, ~x0): (bool, r0)
fun
<x0:vt>
<r0:vt>
foldall1$fopr(r0, !x0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
rfolditm0$fopr(~x0, r0): (r0)
fun
<x0:vt>
<r0:vt>
rfolditm1$fopr(!x0, r0): (r0)
//
fun
<x0:vt>
<r0:vt>
ifolditm0$fopr(r0, ni, ~x0): (r0)
fun
<x0:vt>
<r0:vt>
ifolditm1$fopr(r0, ni, !x0): (r0)
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
rfoldall0$fopr(~x0, r0): (bool, r0)
fun
<x0:vt>
<r0:vt>
rfoldall1$fopr(!x0, r0): (bool, r0)
//
fun
<x0:vt>
<r0:vt>
ifoldall0$fopr(r0, ni, ~x0): (bool, r0)
fun
<x0:vt>
<r0:vt>
ifoldall1$fopr(r0, ni, !x0): (bool, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
map0$fopr(x0: ~x0): ( y0 )
fun
<x0:vt>
<y0:vt>
map1$fopr(x0: !x0): ( y0 )
//
fun
<x0:vt>
<y0:vt>
map2$fopr(x0: &x0): ( y0 )
//
(* ****** ****** *)
//
(*
HX-2024-07-13:
Note that [filter0$test]
does not consumes its arg!
*)
fun
<x0:vt>
<y0:vt>
filter0$test(x0: !x0): bool
fun
<x0:vt>
<y0:vt>
filter1$test(x0: !x0): bool
//
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
mapoptn0$fopr(x0: ~x0): optn_vt(y0)
fun
<x0:vt>
<y0:vt>
maplist0$fopr(x0: ~x0): list_vt(y0)
fun
<x0:vt>
<y0:vt>
mapstrq0$fopr(x0: ~x0): strq_vt(y0)
//
fun
<x0:vt>
<y0:vt>
mapoptn1$fopr(x0: !x0): optn_vt(y0)
fun
<x0:vt>
<y0:vt>
maplist1$fopr(x0: !x0): list_vt(y0)
fun
<x0:vt>
<y0:vt>
mapstrq1$fopr(x0: !x0): strq_vt(y0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_gbas001_vt.sats] *)
