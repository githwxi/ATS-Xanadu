(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Mon Dec 29 12:36:34 PM EST 2025
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
#impltmp
{ vt:vt }
g_ptcon
<asrt(vt)>
( (*void*) ) =
(
pstrn("asrt"))
#impltmp
{ vt:vt }
g_ptype
<asrt(vt)>
( (*void*) ) =
(
pstrn("asrt(");
g_ptype<vt>((*0*)); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
asrt_length
  (  xs  ) =
(
  a1sz_length<a>(asrt_decd(xs)))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
//
(*
HX-2026-01-04:
This one also works!
*)
//
#impltmp
< x0: vt >
asrt_exists
  (  xs  ) =
(
asrt_length<x0>(xs) >
asrt_search$idx<0>(xs))
where
{
//
#impltmp
search$tcmp1
< x0 >(*x0*) = exists$tcmp1<x0>
//
}(*where*)//end-of-[asrt_exists(xs)]
*)
//
(* ****** ****** *)
//
#impltmp
< x0: vt >
asrt_exists
  (  xs  ) =
(
  loop(0, ln)) where
{
//
val xs =
asrt_decd(xs)
val ln =
a1sz_length<x0>(xs)
//
fnx
loop
( li: nint
, ui: nint): bool =
if
(li >= ui)
then false else
let
val mi =
(
li+(ui-li) / 2)
val (pf | mx) =
a1sz_lget$at(xs, mi)
//
val
sgn = exists$tcmp1(mx)
pvx () =
owed_vt_return0(pf, mx)
//
in//let
//
if // if
(sgn = 0)
then true else
(
if
(sgn < 0) then
loop(li,mi) else loop(mi+1,ui))
//
end(*let*)//end-of-[loop(li,ui)]
//
}(*where*)//end-of-[asrt_exists(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0: vt >
asrt_search$idx
  (  xs  ) =
(
  loop(0, ln)) where
{
//
val xs =
asrt_decd(xs)
val ln =
a1sz_length<x0>(xs)
//
fnx
loop
(li: nint
,ui: nint): sint =
if
(li >= ui)
then ( li ) else
let
val mi =
(
li + (ui-li) / 2)
val (pf | mx) =
a1sz_lget$at(xs, mi)
//
val
sgn =
search$tcmp1<x0>(mx)
pvx () =
owed_vt_return0(pf, mx)
//
in//let
//
(
if
(sgn <= 0) then
loop(li,mi) else loop(mi+1,ui))
//
end(*let*)//end-of-[loop(li,ui)]
//
}(*where*)//end-of-[asrt_search$idx(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_asrt000.dats] *)
(***********************************************************************)
