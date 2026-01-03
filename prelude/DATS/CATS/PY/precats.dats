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
Sat Jan  3 04:14:44 PM EST 2026
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-03:
For implementing operations
in PY that can be called in ATS.
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
//
(*
HX-2026-01-02:
Already inside
[xats2js_js1emit.js]!
*)
//
#extern
fun
XATS2PY_optn_nil
{a:t0}
((*0*)): optn(a) = $extnam()
#implfun
XATS2PY_optn_nil() = optn_nil()
#extern
fun
XATS2PY_optn_cons
{a:t0}
(x0: a): optn(a) = $extnam()
#implfun
XATS2PY_optn_cons(x0) = optn_cons(x0)
//
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_CATS_PY_precats.dats] *)
(***********************************************************************)
