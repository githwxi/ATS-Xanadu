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
Sat 20 Jul 2024 09:41:27 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#abstype
jsarray(a: vwtp, n: int)
(* ****** ****** *)
#typedef
jsarray
(a: vwtp) = [n:int] jsarray(a, n)
(* ****** ****** *)
(* ****** ****** *)
//

//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_length
 {a:vt}{n:i0}
(A: jsarray(a, n)): sint(n)
//
#symload
length with jsarray_length of 1000
//
(* ****** ****** *)
//
fun<>
jsarray_get_at
 {a:t0}{n:i0}
(A:jsarray(a, n), i:nintlt(n)): (a)
fun<>
jsarray_set_at
 {a:t0}{n:i0}
(A:jsarray(a, n), i:nintlt(n), x:a): void
//
#symload get_at with jsarray_get_at of 1000
#symload set_at with jsarray_set_at of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_strmize
{a:vt}
(A: jsarray(a)): strm_vt(a)
fun<>
jsarray_strqize
{a:vt}{n:i0}
(A: jsarray(a, n)): strq_vt(a)
//
#symload strmize with jsarray_strmize of 1000
#symload strqize with jsarray_strqize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
jsarray_forall
{a:t0}
(A: jsarray(a)): bool
//
fun//fun
jsarray_forall_c1fr
{a:t0}
( A: jsarray(a)
, test: (a)-<cfr>bool): bool
//
#symload
forall with jsarray_forall of 1000
#symload
forall with jsarray_forall_c1fr of 1000
//
(* ****** ****** *)
//
fun<>
jsarray_rforall
{a:t0}
(A: jsarray(a)): bool
fun//fun
jsarray_rforall_c1fr
{a:t0}
( A: jsarray(a)
, test: (a)-<cfr>bool): bool
//
#symload
rforall with jsarray_rforall of 1000
#symload
rforall with jsarray_rforall_c1fr of 1000
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_SATS_Array.sats] *)
