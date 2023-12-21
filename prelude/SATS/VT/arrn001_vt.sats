(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// For pure arrays in C
//
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Start Time: May 28, 2020
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
// HX: 1-dimensional
(* ****** ****** *)
//
#absvtbx
a1psz_vt_i0_x0
(elem:vt, ntot:i0)
//
#vwtpdef
a1psz(a:vt,n:i0) = a1psz_vt_i0_x0(a, n)
//
(* ****** ****** *)
// HX: 2-dimensional
(* ****** ****** *)
//
#absvtbx
a2psz_vt_i0_i0_x0
(elem:vt,nrow:i0,ncol:i0)
//
#vwtpdef
a2psz
(a:vt
,m:i0,n:i0) = a2psz_vt_i0_i0_x0(a, m, n)
//
(* ****** ****** *)
(* ****** ****** *)
#vwtpdef
a1psz(a:vt) = [n:i0] a1psz(a, n)
#vwtpdef
a2psz(a:vt) = [m:i0;n:i0] a2psz(a, m, n)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
a1psz_length1
{n:i0}(AZ: !a1psz(a, n)): nint(n)
//
(* ****** ****** *)
//
fun
<a:vt>
a1psz_make0_ptrsize
{n:int}
(a1ptr(a, n), sint(n)): a1psz(a, n)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_arrn001_vt.sats] *)
