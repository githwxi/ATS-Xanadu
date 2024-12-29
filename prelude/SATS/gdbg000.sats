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
Mon 05 Aug 2024 10:10:05 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-05:
Mon 05 Aug 2024 10:17:21 PM EDT
ATS3 amply enables programmers to
implement debugging support from the
"outside"; the point to be stressed here
is that these programmers are not supposed
to have any direct access to the internals
of the ATS3/Xanadu implemnetation!
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstype
type_vw_t0(a:vw) <= unit
#sexpdef type = type_vw_t0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
g_type
{t0:t0}(x0: t0): type(t0)
fun<>
g_vwtp
{vt:vt}(x0: !vt): type(vt)
fun<>
g_prop
{pf:pf}(x0: pf|): type(pf)
fun<>
g_view
{vw:vw}(x0: !vw|): type(vw)
//
#symload type with g_type of 0100
#symload vwtp with g_vwtp of 0100
#symload prop with g_prop of 0100
#symload view with g_view of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-06:
These are the Number~1
functions for debugging
*)
//
fun
<vt:vt>
g_debug( x0:vt ): ( vt )
//
fun
<vw:vw>
g_psort((*void*)): ( void )
fun
<vw:vw>
g_ptype((*void*)): ( void )
//
(* ****** ****** *)
//
#symload debug with g_debug of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
bool_assert
(cond: bool): void
fun<>
assert$errmsg
( (*void*) ): strn
fun<>
bool_assert$errmsg
(cond: bool, msg: strn): void
//
#symload
assert with bool_assert of 1000
#symload
assert with bool_assert$errmsg of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_gdbg000.sats] *)
