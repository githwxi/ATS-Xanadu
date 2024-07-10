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
//
fun
<a:vt>
g_free(x : ~a): void
fun
<a:vt>
g_copy(x : !a): ( a )
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
fun
<a:vt>
g_input
((*void*)): (  a  )
//
fun
<a:vt>
g_input$exn
((*void*)): (  a  )
fun
<a:vt>
g_input_exn
((*void*)): (  a  )
//
fun
<a:vt>
g_input_opt
((*void*)): optn_vt(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
g_parse
(rep: strn): (  a  )
//
fun
<a:vt>
g_parse$exn
(rep: strn): (  a  )
fun
<a:vt>
g_parse_exn
(rep: strn): (  a  )
//
fun
<a:vt>
g_parse_opt
(rep: strn): optn_vt(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
g_torep(x : a): strn
fun
<a:t0>
g_tostr(x : a): strn
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
g_print(x: a): void
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gbas000.sats] *)
