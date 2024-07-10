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
Wed 10 Jul 2024 07:53:15 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<ys:vt>
g_make_lstrm
(xs: strm_vt(x0)): (ys)
fun
<x0:vt>
<ys:vt>
g_make_lstrq
(xs: strq_vt(x0)): (ys)
//
(* ****** ****** *)
//
fun
<x0:t0>
list_make_lstrm
(xs: strm_vt(x0)): list(x0)
fun
<x0:t0>
list_make_lstrq
{n0:i0}
(xs: strq_vt(x0, n0)): list(x0, n0)
//
#symload list with list_make_lstrm
#symload list with list_make_lstrq
//
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_make_lstrm
(xs: strm_vt(x0)): list_vt(x0)
fun
<x0:vt>
list_vt_make_lstrq
{n0:i0}
(xs: strq_vt(x0, n0)): list_vt(x0, n0)
//
#symload list_vt with list_vt_make_lstrm
#symload list_vt with list_vt_make_lstrq
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_strn001_vt.sats] *)
