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
Sat 07 Sep 2024 07:21:46 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-20:
Sat Dec 20 11:21:52 AM EST 2025
*)
//
fun<>
strm_nil
{a:t0}((*0*)): strm(a)
fun<>
strq_nil
{a:t0}((*0*)): strq(a, 0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
strm_sing
( x0: ( a ) ): strm(a)
fun
<a:t0>
strq_sing
( x0: ( a ) ): strq(a, 1)
//
fun
<a:t0>
strm_cons
(
x0: ( a ),
xs: strm( a )): strm( a )
fun
<a:t0>
strq_cons
{n:i0}
(
x0: ( a ),
xs: strq(a, n)): strq(a, n+1)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_strm000.sats] *)
(***********************************************************************)
