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
Thu 08 Aug 2024 04:47:26 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#define
GZ2ASQ(xs, ys) =
GASQ_z2make(GASQ(xs), GASQ(ys))
//
(*
#typedef
gz2asq
( xs: t0, x0: t0
, ys: t0, y0: t0) =
(
z2tup(GASQ(xs, x0), GASQ(ys, y0)))
*)
//
#impltmp
< xs:t0 >
< x0:vt >
< ys:t0 >
< y0:vt >
GASQ_z2make
(xseq, yseq) =
$UN.castxy//GASQ_make
(z2tup_make(xseq, yseq))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-05:
Thu 08 Aug 2024 04:50:03 AM EDT
*)
//
#impltmp
< xs:t0 >
< x0:vt >
< ys:t0 >
< y0:vt >
gasq_z2forall
  (xs, ys) =
let
val nx =
gasq_length<xs><x0>(xs)
val ny =
gasq_length<ys><y0>(ys)
in//let
(
nint_forall<>
(g_min<nint>(nx, ny))) where
{
#impltmp
forall$test<nint>(i0) =
let
pvx () =
  owed_vt_return0(fx, x0)
pvx () =
  owed_vt_return0(fy, y0) in btf
end where
{
//
val
(fx|x0) =
$UN.gasq_lget$at$raw<xs><x0>(xs, i0)
val
(fy|y0) =
$UN.gasq_lget$at$raw<ys><y0>(ys, i0)
//
val btf = z2forall$test1<x0><y0>(x0, y0)
//
}(*where*)
}(*where*)
end(*let*)//end-of-[gasq_z2forall(xs, ys)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
< ys:t0 >
< y0:vt >
gasq_z2rforall
  (xs, ys) =
let
val nx =
gasq_length<xs><x0>(xs)
val ny =
gasq_length<ys><y0>(ys)
in//let
(
nint_rforall<>
(g_min<nint>(nx, ny))) where
{
#impltmp
rforall$test<nint>(i0) =
let
pvx () =
  owed_vt_return0(fx, x0)
pvx () =
  owed_vt_return0(fy, y0) in btf
end where
{
//
val
(fx|x0) =
$UN.gasq_lget$at$raw<xs><x0>(xs, i0)
val
(fy|y0) =
$UN.gasq_lget$at$raw<ys><y0>(ys, i0)
//
val btf = z2rforall$test1<x0><y0>(x0, y0)
//
}(*where*)
}(*where*)
end(*let*)//end-of-[gasq_z2rforall(xs, ys)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
< ys:t0 >
< y0:vt >
gasq_z2iforall
  (xs, ys) =
let
val nx =
gasq_length<xs><x0>(xs)
val ny =
gasq_length<ys><y0>(ys)
in//let
(
nint_forall<>
(g_min<nint>(nx, ny))) where
{
#impltmp
forall$test<nint>(i0) =
let
pvx () =
  owed_vt_return0(fx, x0)
pvx () =
  owed_vt_return0(fy, y0) in btf
end where
{
//
val
(fx|x0) =
$UN.gasq_lget$at$raw<xs><x0>(xs, i0)
val
(fy|y0) =
$UN.gasq_lget$at$raw<ys><y0>(ys, i0)
//
val btf =
(
  z2iforall$test1<x0><y0>(i0, x0, y0) )
//
}(*where*)
}(*where*)
end(*let*)//end-of-[gasq_z2iforall(xs, ys)]
//
(* ****** ****** *)
//
//
#impltmp
< xs:t0 >
< x0:vt >
< ys:t0 >
< y0:vt >
gasq_z2irforall
  (xs, ys) =
let
val nx =
gasq_length<xs><x0>(xs)
val ny =
gasq_length<ys><y0>(ys)
in//let
(
nint_rforall<>
(g_min<nint>(nx, ny))) where
{
#impltmp
rforall$test<nint>(i0) =
let
pvx () =
  owed_vt_return0(fx, x0)
pvx () =
  owed_vt_return0(fy, y0) in btf
end where
{
//
val
(fx|x0) =
$UN.gasq_lget$at$raw<xs><x0>(xs, i0)
val
(fy|y0) =
$UN.gasq_lget$at$raw<ys><y0>(ys, i0)
//
val btf =
(
  z2irforall$test1<x0><y0>(i0, x0, y0) )
//
}(*where*)
}(*where*)
end(*let*)//end-of-[gasq_z2irforall(xs, ys)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-16:
Fri Jan 16 12:56:24 PM EST 2026
*)
#impltmp
< xs:t0 >
< x0:vt >
< ys:t0 >
< y0:vt >
gasq_z2forcmp
  (xs, ys) =
(
  loop( 0 ) ) where
{
//
val nx =
gasq_length<xs><x0>(xs)
val ny =
gasq_length<ys><y0>(ys)
val ln = (g_min(nx, ny))
//
fun
loop
(i0: nint): sint =
if // if
(i0 >= ln)
then(//then
  g_cmp<sint>(nx, ny))
else(//else
//
let//let
val i1 = i0 + 1
pvx () =
(
  owed_vt_return0(fx, x0))
pvx () =
(
  owed_vt_return0(fy, y0))
in // let
(
if(sgn!=0)then(sgn)else(loop(i1)))
end where{
//
val
(fx|x0) =
$UN.gasq_lget$at$raw<xs><x0>(xs, i0)
val
(fy|y0) =
$UN.gasq_lget$at$raw<ys><y0>(ys, i0)
//
val sgn = z2forcmp$tcmp1<x0><y0>(x0, y0)}
//
)(*endif*)//end-of-[loop(i0:nint):sint]
//
}(*where*)//end-of-[gasq_z2forcmp(xs, ys)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
< ys:t0 >
< y0:vt >
gasq_z2rforcmp
  (xs, ys) =
(
  loop( 0 ) ) where
{
//
val nx =
gasq_length<xs><x0>(xs)
val ny =
gasq_length<ys><y0>(ys)
val ln = (g_min(nx, ny))
//
fun
loop
(i0: nint): sint =
if // if
(i0 >= ln)
then(//then
  g_cmp<sint>(nx, ny))
else(//else
//
let//let
val i1 = i0 + 1
pvx () =
(
  owed_vt_return0(fx, x0))
pvx () =
(
  owed_vt_return0(fy, y0))
in // let
(
if(sgn!=0)then(sgn)else(loop(i1)))
end where{
//
val
(fx|x0) =
$UN.gasq_lget$at$raw<xs><x0>(xs, i0)
val
(fy|y0) =
$UN.gasq_lget$at$raw<ys><y0>(ys, i0)
//
val sgn = z2rforcmp$tcmp1<x0><y0>(x0, y0)}
//
)(*endif*)//end-of-[loop(i0:nint):sint]
//
}(*where*)//end-of-[gasq_z2rforcmp(xs, ys)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_gasq002.dats] *)
(***********************************************************************)
