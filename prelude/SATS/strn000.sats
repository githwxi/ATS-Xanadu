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
Mon 08 Jul 2024 09:12:42 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-11:
The 'g' in 'gmake' means
that the argument, which is
the subject, is polymorphic.
*)
fun
<a:t0>
strn_gmake(x: a): (strn)
fun
<a:vt>
strn_gmake0(x: ~a): (strn)
fun
<a:vt>
strn_gmake1(x: !a): (strn)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_make_list
{n0:i0}
(cs: list(cgtz, n0)): strn(n0)
fun<>
strn_make0_llist
{n0:i0}
(cs: ~list_vt(cgtz, n0)): strn(n0)
fun<>
strn_make1_llist
{n0:i0}
(cs: !list_vt(cgtz, n0)): strn(n0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_forall(cs: strn): void
fun<>
strn_foritm(cs: strn): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_strmize
(cs: strn): strm_vt(cgtz)
fun<>
strn_strqize
{n0:i0}
(cs: strn(n0)): strq_vt(cgtz, n0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_strn000.sats] *)
