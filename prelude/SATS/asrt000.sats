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
Mon Dec 29 09:01:30 AM EST 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef igtz = sintgt(0)
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-25:
It is for sorted [a1sz]
*)
//
#abstbox
asrt_vt_i0_tx
( a:vt,n:i0 ) <= a1sz(a)
//
#sexpdef
asrt = asrt_vt_i0_tx
#typedef
asrt(a:vt) = [n:i0] asrt(a,n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fcast
asrt_decd
{a:vt}
(asrt(a, n)): a1sz(a, n)
//
fcast
UN_asrt_encd
{a:vt}
(a1sz(a, n)): asrt(a, n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
asrt_length
{n:i0}
(xs: asrt(a, n)): sint(n)
//
#symload
length with asrt_length of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-29:
Array-based binary search:
asrt_exists:
This one uses [exists$tcmp]
asrt_search:
This one uses [search$tcmp]
Mon Dec 29 12:30:42 PM EST 2025
*)
fun
<x0:t0>
asrt_exists
(xs: asrt(x0)): ( bool )
fun
<x0:t0>
asrt_search
(xs: asrt(x0)): optn_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_asrt000.sats] *)
(***********************************************************************)
