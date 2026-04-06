(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Thu Jan  1 09:54:41 PM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"\
prelude/\
almanac/HATS/pre2026_sats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-05:
Mon Jan  5 03:06:12 PM EST 2026
*)
//
#impltmp
< xs:t0 >
gasq$seg_decd
(   xsii   ) =
$UN.castxy(    xsii    )
#impltmp
< xs:t0 >
gasq$seg_encd
(xs, lb, ub) =
(
  $UN.castxy(@(xs, lb, ub)))
//
(* ****** ****** *)
//
#impltmp
{ xs:t0
, x0:t0 }
$UN.gseq_head$raw
<gasq$seg(xs)><x0>
(      xsii      ) =
let
val
(xs, lb, ub) =
gasq$seg_decd<xs>(xsii) in//let
(
  $UN.gasq_get$at$raw<xs>(xs, lb)) end
//let//end-of-[$UN.gseq_head$raw<gasq$seg(xs)><x0>]
//
#impltmp
{ xs:t0
, x0:t0 }
$UN.gseq_tail$raw
<gasq$seg(xs)><x0>
(      xsii      ) =
let
val
(xs, lb, ub) =
gasq$seg_decd<xs>(xsii) in//let
(
  gasq$seg_encd<xs>(xs, lb+1, ub)) end
//let//end-of-[$UN.gseq_tail$raw<gasq$seg(xs)><x0>]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2027-01-07:
Wed Jan  7 12:37:11 PM EST 2026
*)
//
#impltmp
<(*tmp*)>
nint_digitize
  (  n0  ) =
nint_base$digitize<>(n0, 10)
#impltmp
<(*tmp*)>
nint_rdigitize
  (  n0  ) =
nint_base$rdigitize<>(n0, 10)
//
#impltmp
<(*tmp*)>
nint_base$digitize
  (n0, b0) =
strm_vt_rlistize0<ni>
(
nint_base$rdigitize<>(n0, b0))
//
#impltmp
<(*tmp*)>
nint_base$rdigitize
  (n0, b0) =
(
  auxmain(n0)) where
{
//
fun
auxmain
(n0: nint):
strm_vt(nint) = $llazy
(
if // if
(n0 <= 0)
then strmcon_vt_nil(*0*) else
(
  strmcon_vt_cons(n0%b0, auxmain(n0/b0))))
//
}(*where*)//end-of-[nint_base$rdigitize<>(n0,b0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-12:
Given a sint i0,
sint_gte$strmize(i0)
yields: (i0, i0+1, i0+2, ...)
Mon Jan 12 01:30:34 AM EST 2026
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
sint_lte$strmize =
fix
f0(i0) =>
$llazy(
strmcon_vt_cons(i0, f0(i0-1)))
#impltmp
<(*tmp*)>
sint_lte$strxize =
fix
f0(i0) =>
$llazy(
strxcon_vt_cons(i0, f0(i0-1)))
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
sint_gte$strmize =
fix
f0(i0) =>
$llazy(
strmcon_vt_cons(i0, f0(i0+1)))
#impltmp
<(*tmp*)>
sint_gte$strxize =
fix
f0(i0) =>
$llazy(
strxcon_vt_cons(i0, f0(i0+1)))
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
sint_btw$strmize
  ( sta, fin ) =
(
if (sta <= fin)
then auxup(sta) else auxdn(sta))
where
{
//
fun
auxup(i0) = $llazy
(
if i0 >= fin
then
strmcon_vt_nil() else
strmcon_vt_cons(i0, auxup(i0+1)))
//
fun
auxdn(i0) = $llazy
(
if i0 <= fin
then
strmcon_vt_nil() else
strmcon_vt_cons(i0, auxdn(i0-1)))
//
}(*where*)//end-of-[sint_btw$strmize(sta,fin)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-04-05:
Sun Apr  5 09:12:01 PM EDT 2026
*)
#impltmp
< x0:t0 >
list_all$permute
  (  xs  ) =
(
  auxmain(xs) )
where
{
//
#vwtpdef
xs = list_vt(x0)
#vwtpdef
xz = strm_vt(xs)
#vwtpdef
y0 = (x0, list_vt(x0))
//
fun
auxmain
( xs
: list(x0))
: strm_vt(list_vt(x0)) =
(
case+ xs of
|
list_nil() =>
(
strm_vt_sing
(list_vt_nil(*0*)))
|
list_cons _ =>
(
strm_vt_lstrm$concat0
<         xs         >
(
(
strm_vt_map0<y0><xz>
(
list_1choose$split_lstrm
<          x0          >
(          xs          )))
where
{
#impltmp
map$fopr0
<y0><xz>(y0) =
strm_vt_map0
< xs >< xs >
(
  auxmain(list_vt2t(y0.1)))
where
{
#impltmp
map$fopr0
<xs >< xs>
(   xs   ) = list_vt_cons(y0.0, xs) }
}
)
)
)
}(*where*)//end-of-[list_all$permute( xs )]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_almanac_DATS_pre2026.dats] *)
(***********************************************************************)
