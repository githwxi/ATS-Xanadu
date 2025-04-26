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
Mon 08 Jul 2024 08:46:41 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
g_void( a ): void
fun
<a:vt>
g_self( a ): ( a )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
g_free( ~a ): void
fun
<a:vt>
g_copy( !a ): ( a )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
g_work(x : a): void
fun
<a:t0>
g_test(x : a): bool
//
fun
<a0:t0>
g_iwork
(i0:ni,x0:a0): void
fun
<a0:t0>
g_itest
(i0:ni,x0:a0): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
g_equal(a, a): bool
fun
<a:t0>
g_noteq(a, a): bool
//
(* ****** ****** *)
//
fun
<a:t0>
g_eqref(a, a): bool
fun
<a:t0>
g_neqrf(a, a): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
(*
HX-2025-04-26:
Is this a good idea?
*)
fun
<a:vt>
g_input
((*void*)): (  a  )
fun
<a:vt>
g_input$exn
((*void*)): (  a  )
fun
<a:vt>
g_input$opt
((*void*)): optn_vt(a)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
(*
HX-2025-04-26:
Is this a good idea?
*)
fun
<a:vt>
g_parse
(rep: strn): (  a  )
fun
<a:vt>
g_parse$exn
(rep: strn): (  a  )
fun
<a:vt>
g_parse$opt
(rep: strn): optn_vt(a)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
g_torep(obj: a): strn
fun
<a:t0>
g_tostr(obj: a): strn
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
g_print(obj: x0): void
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload void with g_void of 0100
#symload self with g_self of 0100
//
(* ****** ****** *)
//
#symload torep with g_torep of 0100
#symload tostr with g_tostr of 0100
//
(* ****** ****** *)
//
#symload print with g_print of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gbas000.sats] *)
