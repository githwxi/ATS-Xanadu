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
Sat 27 Jul 2024 01:32:19 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-29:
Sat 03 Aug 2024 05:17:21 PM EDT
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_listize = gseq_listize0<xs><x0>
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_strmize = gseq_strmize0<xs><x0>
#impltmp
< xs:t0 >
< x0:t0 >
gseq_strqize = gseq_strqize0<xs><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_exists(xs) =
(
gseq_exists0<xs><x0>(xs)
) where
{
#impltmp
exists$test0<x0> = exists$test<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rexists(xs) =
(
gseq_rexists0<xs><x0>(xs)
) where
{
#impltmp
rexists$test0<x0> = rexists$test<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iexists(xs) =
(
gseq_iexists0<xs><x0>(xs)
) where
{
#impltmp
iexists$test0<x0> = iexists$test<x0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_irexists(xs) =
(
gseq_irexists0<xs><x0>(xs)
) where
{
#impltmp
irexists$test0<x0> = irexists$test<x0>
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_foritm(xs) =
(
gseq_foritm0<xs><x0>(xs)
) where {
#impltmp
foritm$work0<x0> = foritm$work<x0>
}(*where*)//end-of-[gseq_foritm(xs)]
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_rforitm(xs) =
(
gseq_rforitm0<xs><x0>(xs)
) where {
#impltmp
rforitm$work0<x0> = rforitm$work<x0>
}(*where*)//end-of-[gseq_rforitm(xs)]
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iforitm(xs) =
(
gseq_iforitm0<xs><x0>(xs)
) where {
#impltmp
iforitm$work0<x0> = iforitm$work<x0>
}(*where*)//end-of-[gseq_iforitm(xs)]
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_irforitm(xs) =
(
gseq_irforitm0<xs><x0>(xs)
) where {
#impltmp
irforitm$work0<x0> = irforitm$work<x0>
}(*where*)//end-of-[gseq_irforitm(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_folditm(xs, r0) =
(
gseq_folditm0<xs><x0><r0>(xs, r0)
) where {
#impltmp
folditm$fopr0
<  x0  ><  r0  > = folditm$fopr<x0><r0>
}(*where*)//end-of-[gseq_folditm(xs, r0)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_rfolditm(xs, r0) =
(
gseq_rfolditm0<xs><x0><r0>(xs, r0)
) where
{
#impltmp
rfolditm$fopr0
<  x0  ><  r0  > = rfolditm$fopr<x0><r0>
}(*where*)//end-of-[gseq_rfolditm(xs, r0)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_ifolditm(xs, r0) =
(
gseq_ifolditm0<xs><x0><r0>(xs, r0)
) where
{
#impltmp
ifolditm$fopr0
<  x0  ><  r0  > = ifolditm$fopr<x0><r0>
}(*where*)//end-of-[gseq_ifolditm(xs, r0)]
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_irfolditm(xs, r0) =
(
gseq_irfolditm0<xs><x0><r0>(xs, r0)
) where
{
#impltmp
irfolditm$fopr0
<  x0  ><  r0  > = irfolditm$fopr<x0><r0>
}(*where*)//end-of-[gseq_irfolditm(xs, r0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_foldall(xs, r0) =
(
gseq_foldall0<xs><x0><r0>(xs, r0)
) where
{
#impltmp
foldall$fopr0
<  x0  ><  r0  > = foldall$fopr<x0><r0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_rfoldall(xs, r0) =
(
gseq_rfoldall0<xs><x0><r0>(xs, r0)
) where
{
#impltmp
rfoldall$fopr0
<  x0  ><  r0  > = rfoldall$fopr<x0><r0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_ifoldall(xs, r0) =
(
gseq_ifoldall0<xs><x0><r0>(xs, r0)
) where
{
#impltmp
ifoldall$fopr0
<  x0  ><  r0  > = ifoldall$fopr<x0><r0>
}
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_irfoldall(xs, r0) =
(
gseq_irfoldall0<xs><x0><r0>(xs, r0)
) where
{
#impltmp
irfoldall$fopr0
<  x0  ><  r0  > = irfoldall$fopr<x0><r0>
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gxyz000.dats] *)
