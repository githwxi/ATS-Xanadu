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
Tue 23 Jul 2024 06:07:30 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt
, y0:vt >
strm_vt_z2forall0 =
gseq_z2forall0<strm_vt(x0),strm_vt(y0)><x0,y0>
//
#impltmp
< x0:vt
, y0:vt >
strm_vt_z2foritm0 =
gseq_z2foritm0<strm_vt(x0),strm_vt(y0)><x0,y0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt
, y0:vt >
strm_vt_z2forall0
  ( xs, ys ) =
(
  auxmain(xs, ys)) where
{
fun
auxmain
( xs
: strm_vt(x0)
, ys
: strm_vt(y0)): bool =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
(free(ys); true)
| ~
strmcon_vt_cons(x1, xs) =>
(
case+ !ys of
| ~
strmcon_vt_nil() =>
(free(x1);free(xs);true)
| ~
strmcon_vt_cons(y1, ys) =>
(
if
z2forall$test0
<x0,y0>(x1, y1)
then auxmain(xs, ys)
else (free(xs);free(ys);false))))
}(*where*)//end-of-[strm_vt_z2forall0(xs,ys)]
//
#impltmp
{ x0:vt
, y0:vt }
gseq_z2forall0
<strm_vt(x0)
,strm_vt(y0)><x0,y0> = strm_vt_z2forall0<x0,y0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt
, y0:vt >
strm_vt_iz2forall0 =
gseq_iz2forall0<strm_vt(x0),strm_vt(y0)><x0,y0>
//
#impltmp
< x0:vt
, y0:vt >
strm_vt_iz2foritm0 =
gseq_iz2foritm0<strm_vt(x0),strm_vt(y0)><x0,y0>
//
(* ****** ****** *)
//
#impltmp
< x0:vt
, y0:vt >
strm_vt_iz2forall0
  ( xs, ys ) =
(
auxmain(0, xs, ys)) where
{
fun
auxmain
( i0: nint
, xs
: strm_vt(x0)
, ys
: strm_vt(y0)): bool =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
(free(ys); true)
| ~
strmcon_vt_cons(x1, xs) =>
(
case+ !ys of
| ~
strmcon_vt_nil() =>
(free(x1);free(xs);true)
| ~
strmcon_vt_cons(y1, ys) =>
(
if
iz2forall$test0
<x0,y0>(i0, x1, y1)
then auxmain(i0+1, xs, ys)
else (free(xs);free(ys);false))))
}(*where*)//end-of-[strm_vt_iz2forall0(xs,ys)]
//
#impltmp
{ x0:vt
, y0:vt }
gseq_z2forall0
<strm_vt(x0)
,strm_vt(y0)><x0,y0> = strm_vt_z2forall0<x0,y0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_strm001_vt.dats] *)
