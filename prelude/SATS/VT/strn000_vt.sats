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
Mon 08 Jul 2024 09:15:20 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#vwtpdef
lstrnllst = list_vt(strn_vt)
#vwtpdef
lstrnlopt = optn_vt(strn_vt)
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_vt_length0
{n0:i0}
(cs: ~strn_vt(n0)): sint(n0)
fun<>
strn_vt_length1
{n0:i0}
(cs: !strn_vt(n0)): sint(n0)
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
strn_vt_gmake(x: a): strn_vt
fun
<a:vt>
strn_vt_gmake0(x: ~a): strn_vt
fun
<a:vt>
strn_vt_gmake1(x: !a): strn_vt
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_vt_make_list
{n0:i0}
(cs: list(cgtz, n0)): strn_vt(n0)
fun<>
strn_vt_make0_llist
{n0:i0}
(cs: ~list_vt(cgtz, n0)): strn_vt(n0)
fun<>
strn_vt_make1_llist
{n0:i0}
(cs: !list_vt(cgtz, n0)): strn_vt(n0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_vt_strmize0
(cs: ~strn_vt): strm_vt(cgtz)
fun<>
strn_vt_strqize0
{n0:i0}
(cs: ~strn_vt(n0)): strq_vt(cgtz, n0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_strn000_vt.sats] *)
