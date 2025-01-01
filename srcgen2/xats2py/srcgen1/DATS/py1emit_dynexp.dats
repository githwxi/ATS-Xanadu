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
Fri Nov 29 04:22:27 PM EST 2024
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/py1emit.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/py1emit.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0pckpy1
( filr
, ival, ipat) =
let
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
conj
(b0: sint): void =
if
(b0 > 0)
then print(" && ") else ()
//
(* ****** ****** *)
//
fun
proj
(i0: sint
,ival: i1val
,ipat: i0pat): i1val =
(
case-
ipat.node() of
//
|I0Ptup0 _ =>
i1val
(loc0,I1Vp0rj(ival, i0))
//
|I0Pdapp(i0f0, _) =>
i1val(loc0,
  I1Vp1cn(i0f0, ival, i0))
//
|I0Ptup1(tknd, _) =>
i1val(loc0,
  I1Vp1rj(tknd, ival, i0))
//
) where
{
  val loc0 = ival.lctn((*0*))
}(*where*)//end-of-[proj(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_ipat
( b0: sint
, ival: i1val
, ipat: i0pat): void =
case+
ipat.node() of
//
|
_(*otherwise*) =>
(
conj(b0); prints('"',ipat,'"'))
//
//end-of-[f0_ipat(b0,ival,ipat)]
//
(* ****** ****** *)
(* ****** ****** *)
//
in
( if
  i0pat_allq(ipat)
  then print("True")
  else f0_ipat(0(*conj*), ival, ipat) )
end(*let*)//end-(i0pckpy1(filr,ival,ipat))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fjas1py1
(filr,fjas) =
let
//
#impltmp
g_print$out<>() = filr
//
fnx
loop1
(i0: sint
,fjas: fjarglst): void =
(
case+ fjas of
|
list_nil
((*void*)) => ((*0*))
|
list_cons
(fja1, fjas) =>
(
  loop2(i0, fja1, fjas))
)
//
and
loop2
(i0: sint
,fja1: fjarg
,fjas: fjarglst): void =
(
case+
fja1.node() of
|FJARGdarg(i1bs) =>
(
  loop3(i0, i1bs, fjas))
)
//
and
loop3
(i0: sint
,i1bs: i1bndlst
,fjas: fjarglst): void =
(
case+ i1bs of
|
list_nil() =>
(
  loop1(i0, fjas))
|
list_cons(_, i1bs) =>
( if
  (i0 > 1)
  then
  print(", ")
; prints("arg", i0)
; loop3(i0+1, i1bs, fjas))
)
//
in
(print("(")
;loop1(1(*i0*),fjas);print(")"))
end(*let*)//end-of-[fjas1py1(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1valpy1(filr, ival) =
let
//
(*
val () =
prerrsln
("i1valpy1: ival = ", ival)
*)
//
in//let
//
case+
ival.node() of
//
(* ****** ****** *)
(* ****** ****** *)
|I1Vnil
((*0*)) => prints("[", "]")
(* ****** ****** *)
(* ****** ****** *)
|I1Vint
( tint ) => i0intpy1(filr,tint)
(* ****** ****** *)
(* ****** ****** *)
|I1Vtnm
( itnm ) => i1tnmpy1(filr,itnm)
(* ****** ****** *)
(* ****** ****** *)
//
|
_(*otherwise*) => i1val_fprint(filr,ival)
//
end where
{
//
  #impltmp g_print$out<>() = filr
//
  #impltmp
  g_print<i1val>(x) = i1valpy1(filr, x)
//
}(*where*)//end-of-[ i1valpy1(filr,ival) ]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1valpy1_list
( filr: FILR
, i1vs: i1valist): void =
(
list_iforitm(i1vs)) where
{
#typedef x0 = i1val
#typedef xs = i1valist
#impltmp
iforitm$work<x0>(i0, x0) =
(
if
(i0 >= 1)
then
strnfpr(filr,", ");i1valpy1(filr, x0))
}(*where*)//end-of-[i1valpy1_list(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1cmp
( env0,icmp ) =
xats2js_i1cmp( env0,icmp ) // implfun
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1let
( env0,ilet ) =
xats2js_i1let( env0,ilet ) // implfun
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_i1letlst
  (env0, ilts) =
(
  list_py1emit_fnp(env0, ilts, py1emit_i1let))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
py1emit_fjarglst
  (env0, fjas) =
(
  loop1(1(*i0*), fjas)) where
{
//
val filr =
(
  envx2js_get_filr(env0))
val nind =
(
  envx2js_get_nind(env0))
//
fnx
loop1
( i0: sint
, fjas: fjarglst): void =
(
case+ fjas of
|
list_nil
( (*void*) ) => ( (*void*) )
|
list_cons
(fja1, fjas) => loop2(i0, fja1, fjas)
)
//
and
loop2
( i0: sint
, fja1: fjarg
, fjas: fjarglst): void =
(
case+
fja1.node() of
|
FJARGdarg(i1bs) => loop3(i0, i1bs, fjas)
)
//
and
loop3
( i0: sint
, i1bs: i1bndlst
, fjas: fjarglst): void =
(
case+ i1bs of
|
list_nil() =>
loop1(i0, fjas)
|
list_cons(ibnd, i1bs) =>
(
  loop3(i0+1, i1bs, fjas)) where
{
//
#impltmp
g_print$out<>() = filr
//
#impltmp g_print
<i1tnm>(itnm) = i1tnmpy1(filr, itnm)
//
val () =
case+ ibnd of
|
I1BNDcons(itnm, i0p1, dvvs) =>
(
nindfpr(filr,nind);
(
prints("let ", itnm, " = ", "arg", i0, "\n")))
}
)
//
}(*where*)//end-of-[py1emit_fjarglst(env0,fjas)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_py1emit_dynexp.dats] *)
(***********************************************************************)
