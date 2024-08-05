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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sat 13 Jul 2024 10:17:23 AM EDT
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
(*
HX-2024-08-05:
Mon 05 Aug 2024 06:21:53 PM EDT
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_z2forall
  (xs, ys) =
let
val xs =
gseq_strmize<xs><x0>(xs)
val ys =
gseq_strmize<ys><y0>(ys)
in//let
(
strm_vt_z2forall0<x0><y0>(xs, ys))
where
{
#impltmp
z2forall$test0<x0><y0> = z2forall$test<x0><y0>
} end//let//end-of-[gseq_z2forall(xs, ys)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_rz2forall
  (xs, ys) =
let
val xs =
gseq_rstrmize<xs><x0>(xs)
val ys =
gseq_rstrmize<ys><y0>(ys)
in//let
(
strm_vt_z2forall0<x0><y0>(xs, ys))
where
{
#impltmp
z2forall$test0<x0><y0> = rz2forall$test<x0><y0>
} end//let//end-of-[gseq_rz2forall(xs, ys)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_iz2forall
  (xs, ys) = b0
where {
//
var i0: ni = (0)
//
val p0 = $addr(i0)
//
val b0 =
(
gseq_z2forall
<xs><x0><ys><y0>(xs, ys))
where
{
#impltmp
z2forall$test
<x0><y0>(x0, y0) =
(
$UN.p2tr_set<ni>(p0, i0+1); b0)
where
{
val i0 = $UN.p2tr_get<ni>(p0)
val b0 = iz2forall$test<x0>(i0, x0, y0)
}(*where*)
}(*where*)
//
}(*where*)//end-of-[gseq_iz2forall(xs,ys)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_irz2forall
  (xs, ys) = b0
where {
//
var i0: ni = (0)
//
val p0 = $addr(i0)
//
val b0 =
(
gseq_rz2forall
<xs><x0><ys><y0>(xs, ys))
where
{
#impltmp
rz2forall$test
<x0><y0>(x0, y0) =
(
$UN.p2tr_set<ni>(p0, i0+1); b0)
where
{
val i0 = $UN.p2tr_get<ni>(p0)
val b0 = irz2forall$test<x0>(i0, x0, y0)
}(*where*)
}(*where*)
//
}(*where*)//end-of-[gseq_irz2forall(xs, ys)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_z2foritm
  (xs, ys) =
(
let
val _ =
gseq_z2forall
<xs><x0><ys><y0>(xs, ys)
end
) where
{
#impltmp
z2forall$test
<x0><y0>(x0, y0) = true
where
{ val () =
  z2foritm$work<x0><y0>(x0, y0) }
}(*where*)//end-of-[gseq_z2foritm(xs,ys)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_rz2foritm
  (xs, ys) =
(
let
val _ =
gseq_rz2forall
<xs><x0><ys><y0>(xs, ys)
end
) where
{
#impltmp
rz2forall$test
<x0><y0>(x0, y0) = true
where
{ val () =
  rz2foritm$work<x0><y0>(x0, y0) }
}(*where*)//end-of-[gseq_rz2foritm(xs,ys)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_iz2foritm
  (xs, ys) =
(
let
val _ =
gseq_iz2forall
<xs><x0><ys><y0>(xs, ys)
end
) where
{
#impltmp
iz2forall$test
<x0><y0>(i0, x0, y0) = true
where
{
val () =
iz2foritm$work<x0><y0>(i0, x0, y0) }
}(*where*)//end-of-[gseq_iz2foritm(xs,ys)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_irz2foritm
  (xs, ys) =
(
let
val _ =
gseq_irz2forall
<xs><x0><ys><y0>(xs, ys)
end
) where
{
#impltmp
irz2forall$test
<x0><y0>(i0, x0, y0) = true
where
{
val () =
irz2foritm$work<x0><y0>(i0, x0, y0) }
}(*where*)//end-of-[gseq_iz2foritm(xs,ys)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-04:
Sun 04 Aug 2024 07:26:14 AM EDT
*)
//
(*
HX-2024-08-04:
This one is BUGGY!!!
Can you spot the cause :)
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_x2forall
  (xs, ys) =
(
gseq_forall<xs><x0>(xs)) where
{
#impltmp
forall$test<x0>(x0) =
(
gseq_forall<ys><y0>(ys)) where
{
#impltmp
forall$test<y0>(y0) = x2forall$test<x0><y0>(x0, y0)
}(*where*)
}(*where*)//end-of-[gseq_x2forall(xs, ys)]
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_x2forall
  (xs, ys) =
let
//
fun
forall$test_x0(x0) =
(
  gseq_forall<ys><y0>(ys)
) where
{
#impltmp
forall$test<y0>(y0) =
x2forall$test<x0><y0>(x0, y0) }
//
in//let
(
  gseq_forall<xs><x0>(xs)) where
{
#impltmp
forall$test<x0>(x0) = forall$test_x0(x0)
}
end//(*let*)//end-of-[gseq_x2forall(xs, ys)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_x2rforall
  (xs, ys) =
let
//
fun
rforall$test_x0(x0) =
(
  gseq_rforall<ys><y0>(ys)
) where
{
#impltmp
rforall$test<y0>(y0) =
x2rforall$test<x0><y0>(x0, y0) }
//
in//let
(
  gseq_rforall<xs><x0>(xs)) where
{
#impltmp
rforall$test<x0>(x0) = rforall$test_x0(x0)
}
end//(*let*)//end-of-[gseq_x2rforall(xs, ys)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_x2iforall
  (xs, ys) =
let
//
fun
iforall$test_x0(i0, x0) =
(
  gseq_iforall<ys><y0>(ys)
) where
{
#impltmp
iforall$test<y0>(j0, y0) =
x2iforall$test<x0><y0>(i0, x0, j0, y0)
}
//
in//let
(
  gseq_iforall<xs><x0>(xs)) where
{
#impltmp
iforall$test<x0>(i0, x0) = iforall$test_x0(i0, x0)
}
end//(*let*)//end-of-[gseq_x2iforall(xs, ys)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_x2irforall
  (xs, ys) =
let
//
fun
irforall$test_x0(i0, x0) =
(
  gseq_irforall<ys><y0>(ys)
) where
{
#impltmp
irforall$test<y0>(j0, y0) =
x2irforall$test<x0><y0>(i0, x0, j0, y0)
}
//
in//let
(
  gseq_irforall<xs><x0>(xs)) where
{
#impltmp
irforall$test<x0>(i0, x0) = irforall$test_x0(i0, x0)
}
end//(*let*)//end-of-[gseq_x2irforall(xs, ys)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-04:
Sun 04 Aug 2024 10:21:55 AM EDT
//
These defines show the need for
[symload] that can not be easily
substituted with templates.
//
Note that [GSEQ] is meant to
be resolved during type-checking;
if [GSEQ_make] is used instead,
some types cannot be obtained until
the phase of template resolution.
//
*)
//
#define
GZ2SEQ(xs, ys) =
GSEQ_z2make(GSEQ(xs), GSEQ(ys))
//
(*
#typedef
gz2seq
( xs: t0, x0: t0
, ys: t0, y0: t0) =
(
z2tup(GSEQ(xs, x0), GSEQ(ys, y0)))
*)
//
#impltmp
<xs : t0>
<x0 : t0>
<ys : t0>
<y0 : t0>
GSEQ_z2make
(xgsq, ygsq) =
$UN.castxy//GSEQ_make
(z2tup_make(xgsq, ygsq))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:t0
, ys:t0
, y0:t0 }
GSEQ_forall
<gz2seq(xs,x0,ys,y0)><(x0,y0)>
  (  xsys  ) =
let
val
@(xs, ys) =
z2tup_unmk
(GSEQ_unmk(xsys))
val xs = GSEQ_unmk(xs)
and ys = GSEQ_unmk(ys) in gseq_z2forall<xs><x0><ys><y0>(xs, ys)
end(*let*)//end-of-[GSEQ_forall(z2tup(xs, ys)]
//
#impltmp
{ xs:t0
, x0:t0
, ys:t0
, y0:t0 }
GSEQ_rforall
<gz2seq(xs,x0,ys,y0)><(x0,y0)>
  (  xsys  ) =
let
val
@(xs, ys) =
z2tup_unmk
(GSEQ_unmk(xsys))
val xs = GSEQ_unmk(xs)
and ys = GSEQ_unmk(ys) in gseq_rz2forall<xs><x0><ys><y0>(xs, ys)
end(*let*)//end-of-[GSEQ_rforall(z2tup(xs, ys)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#define
GX2SEQ(xs, ys) =
GSEQ_x2make(GSEQ(xs), GSEQ(ys))
//
(*
#typedef
gx2seq
( xs: t0, x0: t0
, ys: t0, y0: t0) =
(
x2tup(GSEQ(xs, x0), GSEQ(ys, y0)))
*)
//
#impltmp
<xs : t0>
<x0 : t0>
<ys : t0>
<y0 : t0>
GSEQ_x2make
(xgsq, ygsq) = 
$UN.castxy//GSEQ_make
(x2tup_make(xgsq, ygsq))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:t0
, ys:t0
, y0:t0 }
gseq_forall
<gx2seq(xs,x0,ys,y0)><(x0,y0)>
  (xsys) =
(
gseq_x2forall
<xs><x0><ys><y0>(xs, ys))
where
{
val
@(xs, ys) =
x2tup_unmk(xsys)
val xs = GSEQ_unmk(xs)
and ys = GSEQ_unmk(ys)
#impltmp
x2forall$test<x0><y0>(x0, y0) = forall$test@(x0, y0)
}
//
#impltmp
{ xs:t0
, x0:t0
, ys:t0
, y0:t0 }
gseq_forall0
<gx2seq(xs,x0,ys,y0)><(x0,y0)>(xsys) =
(
gseq_forall
<gx2seq(xs,x0,ys,y0)><(x0,y0)>(xsys)) where
{
#impltmp forall$test<(x0,y0)> = forall$test0<(x0,y0)>
}
//
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:t0
, ys:t0
, y0:t0 }
gseq_rforall
<gx2seq(xs,x0,ys,y0)><(x0,y0)>
  (xsys) =
(
gseq_x2rforall
<xs><x0><ys><y0>(xs, ys))
where
{
val
@(xs, ys) =
x2tup_unmk(xsys)
val xs = GSEQ_unmk(xs)
and ys = GSEQ_unmk(ys)
#impltmp
x2rforall$test<x0><y0>(x0, y0) = rforall$test@(x0, y0)
}
//
#impltmp
{ xs:t0
, x0:t0
, ys:t0
, y0:t0 }
gseq_rforall0
<gx2seq(xs,x0,ys,y0)><(x0,y0)>(xsys) =
(
gseq_rforall
<gx2seq(xs,x0,ys,y0)><(x0,y0)>(xsys)) where
{
#impltmp rforall$test<(x0,y0)> = rforall$test0<(x0,y0)>
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gseq002.dats] *)
