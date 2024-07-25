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
Mon 08 Jul 2024 02:15:16 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
// For casting of all sorts
//
(* ****** ****** *)
//
fcast
detop0{a0:t0}(x0: ?a0): (a0)
fcast
detop1{a0:vt}(x0: ?a0): (a0)
//
(* ****** ****** *)
//
fcast
cast01{a0:t0}{a1:t0}(a0):(a1)
fcast
cast10{a1:t0}{a0:t0}(a0):(a1)
//
(* ****** ****** *)
//
fcast
delinear{a0:vt}( a0 ): ( ?!a0 )
fcast
enlinear{a0:vt}(?!a0): (  a0  )
//
(* ****** ****** *)
//
fcast
castlin01{a0:vt}{a1:vt}(a0):(a1)
fcast
castlin10{a1:vt}{a0:vt}(a0):(a1)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
Mon Jul  4 17:58:26 EDT 2022
*)
fcast//HX: it is safe!
datacopy{a0:vt}(x0: !a0): (?!a0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
p1tr_get(p0: p1tr): (a)
fun
<a:vt>
p1tr_set(p0: p1tr, x0: a): void
fun
<a:vt>
p1tr_ret(p0: p1tr, x0: a): void
//
#symload ptr_get with p1tr_get of 1000
#symload ptr_set with p1tr_set of 1000
#symload ptr_ret with p1tr_ret of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
p2tr_get(p0: p2tr(a)): (a)
fun
<a:vt>
p2tr_set(p0: p2tr(a), x0: a): void
fun
<a:vt>
p2tr_ret(p0: p2tr(a), x0: a): void
//
#symload ptr_get with p2tr_get of 1000
#symload ptr_set with p2tr_set of 1000
#symload ptr_ret with p2tr_ret of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2020-07-29:
const pointers are read-only
*)
//
fun
<a:vt>
cp1tr_get(cp: cp1tr): (a)
fun
<a:vt>
cp2tr_get(cp: cp2tr(a)): (a)
//
#symload cptr_get with cp1tr_get of 1000
#symload cptr_get with cp2tr_get of 1000
//
(* ****** ****** *)
//
fun
<a:t0>
p2tr_set_list_nil
(p0: p2tr(list(a))): void
fun
<a:t0>
p2tr_set_list_cons
(p0: p2tr(list(a)), x0: a): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a0ref_set0
(A0: a0ref(a), x0: ?!a): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_get_at
(cs: strn, i0: sint): cgtz
//
(* ****** ****** *)
(* ****** ****** *)
//
#include "./VT/unsfx00_vt.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_unsfx00.sats] *)
