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
$UN.castxy(@(xs, lb, ub))
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
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_almanac_DATS_pre2026.dats] *)
(***********************************************************************)
