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
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
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
gseq_forall
<
gz2seq
(xs,x0,ys,y0)><(x0,y0)>
  (xsys) =
(
gseq_z2forall
<xs><x0><ys><y0>(xs, ys))
where
{
val
@(xs, ys) =
z2tup_unmk(xsys)
val xs = GSEQ_unmk(xs)
and ys = GSEQ_unmk(ys)
#impltmp
z2forall$test<x0><y0>(x0, y0) = forall$test@(x0, y0)
}
//
#impltmp
{ xs:t0
, x0:t0
, ys:t0
, y0:t0 }
gseq_rforall
<
gz2seq
(xs,x0,ys,y0)><(x0,y0)>
  (xsys) =
(
gseq_rz2forall
<xs><x0><ys><y0>(xs, ys))
where
{
val
@(xs, ys) =
z2tup_unmk(xsys)
val xs = GSEQ_unmk(xs)
and ys = GSEQ_unmk(ys)
#impltmp
rz2forall$test<x0><y0>(x0, y0) = rforall$test@(x0, y0)
}
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
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
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
<
gx2seq
(xs,x0,ys,y0)><(x0,y0)>
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
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:t0
, ys:t0
, y0:t0 }
gseq_rforall
<
gx2seq
(xs,x0,ys,y0)><(x0,y0)>
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
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-05:
Thu 05 Sep 2024 08:13:20 PM EDT
*)
#impltmp
{ xs:t0
, x0:t0
, ys:t0
, y0:t0 }
gseq_strmize
<
gx2seq
(xs,x0,ys,y0)><(x0,y0)>
  (xsys) =
let
//
#typedef
xy = @(x0, y0)
//
val
@(xs, ys) =
x2tup_unmk(xsys)
val xs = GSEQ_unmk(xs)
and ys = GSEQ_unmk(ys)
//
in//let
strm_vt_concat0<xy>
(
gseq_map$f1un_lstrm
<xs><x0><strm_vt(xy)>
(
xs,
lam(x0) =>
gseq_map$f1un_lstrm<ys><y0><xy>(ys,lam(y0)=>(x0,y0)))
)
end//let//end-of-[gseq_strmize<gx2seq(...)><...>]
//
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
}
end where
{
(*
val () =
(
  prints("gseq_z2forall: xs = ", xs, "\n"))
val () =
(
  prints("gseq_z2forall: ys = ", ys, "\n"))
*)
}(*where*)//let//end-of-[gseq_z2forall(xs, ys)]
//
(* ****** ****** *)
//
(*
//
HX-2024-08-05:
This is so interestingly buggy
(when |xs| does not equal |ys|).
Please do not delete the code as
it serves as a really good example!
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
}
end where
{
(*
val () =
(
  prints("gseq_rz2forall: xs = ", xs, "\n"))
val () =
(
  prints("gseq_rz2forall: ys = ", ys, "\n"))
*)
}(*where*)//let//end-of-[gseq_rz2forall(xs, ys)]
*)
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
gseq_strmize<xs><x0>(xs)
val ys =
gseq_strmize<ys><y0>(ys)
//
in//let
list_vt_forall0<(x0,y0)>
(
strm_vt_z2rlistize0<x0><y0>(xs, ys)
) where
{
#impltmp
forall$test<(x0,y0)>(xy) =
(
  rz2forall$test<x0><y0>(xy.0, xy.1))
}
end//let//end-of-[gseq_rz2forall(xs,ys)]
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
(* ****** ****** *)
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
(*
HX-2024-08-10:
Sat 10 Aug 2024 07:14:36 PM EDT
*)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_cmp
  (xs, ys) =
(
gseq_z2forcmp
<xs><x0><xs><x0>(xs, ys))
where
{
#impltmp
z2forcmp$test<x0> = g_cmp<x0>
}(*where*)//end-of-[gseq_cmp(xs,ys)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_z2forcmp
  (xs, ys) =
let
val xs =
gseq_strmize<xs><x0>(xs)
val ys =
gseq_strmize<ys><y0>(ys)
in//let
(
strm_vt_z2forcmp0<x0><y0>(xs, ys))
where
{
#impltmp
z2forcmp$test0<x0><y0> = z2forcmp$test<x0><y0>
}
end where
{
(*
val () =
(
  prints("gseq_z2forcmp: xs = ", xs, "\n"))
val () =
(
  prints("gseq_z2forcmp: ys = ", ys, "\n"))
*)
}(*where*)//let//end-of-[gseq_z2forcmp(xs, ys)]
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
Can you spot the SUBTLE cause :)
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
forall$test<y0>(y0) =
(
  x2forall$test<x0><y0>(x0, y0))
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
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gseq002.dats] *)
