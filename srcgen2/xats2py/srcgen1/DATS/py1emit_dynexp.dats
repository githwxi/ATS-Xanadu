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
end(*let*)//end-(i0pckjs1(filr,ival,ipat))
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

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_py1emit_dynexp.dats] *)
(***********************************************************************)
