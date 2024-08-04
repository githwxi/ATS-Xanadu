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
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_z2forall =
gseq_z2forall0<xs><x0><ys><y0>(*void*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_rz2forall =
gseq_rz2forall0<xs><x0><ys><y0>(*void*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_iz2forall =
gseq_iz2forall0<xs><x0><ys><y0>(*void*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_irz2forall =
gseq_irz2forall0<xs><x0><ys><y0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_z2foritm =
gseq_z2foritm0<xs><x0><ys><y0>(*void*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_rz2foritm =
gseq_rz2foritm0<xs><x0><ys><y0>(*void*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_iz2foritm =
gseq_iz2foritm0<xs><x0><ys><y0>(*void*)
//
#impltmp
< xs:t0 >
< x0:t0 >
< ys:t0 >
< y0:t0 >
gseq_irz2foritm =
gseq_irz2foritm0<xs><x0><ys><y0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-04:
Sun 04 Aug 2024 07:26:14 AM EDT
*)
//
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
(
gseq_rforall<xs><x0>(xs)) where
{
#impltmp
rforall$test<x0>(x0) =
(
gseq_rforall<ys><y0>(ys)) where
{
#impltmp
rforall$test<y0>(y0) = x2rforall$test<x0><y0>(x0, y0)
}(*where*)
}(*where*)//end-of-[gseq_x2rforall(xs, ys)]
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
(
gseq_iforall<xs><x0>(xs)) where
{
#impltmp
iforall$test<x0>(i0, x0) =
(
gseq_iforall<ys><y0>(ys)) where
{
#impltmp
iforall$test<y0>(j0, y0) = x2iforall$test<x0><y0>(i0, x0, j0, y0)
}(*where*)
}(*where*)//end-of-[gseq_x2iforall(xs, ys)]
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
(
gseq_irforall<xs><x0>(xs)) where
{
#impltmp
irforall$test<x0>(i0, x0) =
(
gseq_irforall<ys><y0>(ys)) where
{
#impltmp
irforall$test<y0>(j0, y0) = x2irforall$test<x0><y0>(i0, x0, j0, y0)
}(*where*)
}(*where*)//end-of-[gseq_x2irforall(xs, ys)]
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
GSEQ_make_z2tup
(z2tup_make(GSEQ(xs), GSEQ(ys)))
#define
GX2SEQ(xs, ys) =
GSEQ_make_x2tup
(x2tup_make(GSEQ(xs), GSEQ(ys)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ xs:t0
, ys:t0
, x0:t0
, y0:t0 }
GSEQ_forall
<z2tup(xs,ys)><(x0,y0)>
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
, ys:t0
, x0:t0
, y0:t0 }
GSEQ_rforall
<z2tup(xs,ys)><(x0,y0)>
  (  xsys  ) =
let
val
@(xs, ys) =
z2tup_unmk
(GSEQ_unmk(xsys))
val xs = GSEQ_unmk(xs)
and ys = GSEQ_unmk(ys) in gseq_z2rforall<xs><x0><ys><y0>(xs, ys)
end(*let*)//end-of-[GSEQ_rforall(z2tup(xs, ys)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ xs:t0
, ys:t0
, x0:t0
, y0:t0 }
GSEQ_forall
<x2tup(xs,ys)><(x0,y0)>
  (  xsys  ) =
let
val
@(xs, ys) =
x2tup_unmk
(GSEQ_unmk(xsys))
val xs = GSEQ_unmk(xs)
and ys = GSEQ_unmk(ys) in gseq_x2forall<xs><x0><ys><y0>(xs, ys)
end(*let*)//end-of-[GSEQ_forall(x2tup(xs, ys)]
//
#impltmp
{ xs:t0
, ys:t0
, x0:t0
, y0:t0 }
GSEQ_rforall
<x2tup(xs,ys)><(x0,y0)>
  (  xsys  ) =
let
val
@(xs, ys) =
x2tup_unmk
(GSEQ_unmk(xsys))
val xs = GSEQ_unmk(xs)
and ys = GSEQ_unmk(ys) in gseq_x2rforall<xs><x0><ys><y0>(xs, ys)
end(*let*)//end-of-[GSEQ_rforall(x2tup(xs, ys)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gseq002.dats] *)
