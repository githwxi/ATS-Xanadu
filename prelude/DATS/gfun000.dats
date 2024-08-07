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
Tue 06 Aug 2024 05:59:23 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
#typedef si = sint
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ r0:vt }
g_ptype
<f0un(r0)>
(  (*void*)  ) =
( pstrn"f0un("
; g_ptype<r0>(); pstrn(")"))
//
#impltmp
{ a1:t0 }
{ r0:vt }
g_ptype
<f1un(a1,r0)>
(  (*void*)  ) =
( pstrn"f1un("
; g_ptype<a1>(); pstrn(";")
; g_ptype<r0>(); pstrn(")"))
//
#impltmp
{ a1:t0
, a2:t0 }
{ r0:vt }
g_ptype
<
f2un(a1,a2,r0)
>
(  (*void*)  ) =
( pstrn"f2un("
; g_ptype<a1>(); pstrn(",")
; g_ptype<a2>(); pstrn(";")
; g_ptype<r0>(); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a1:t0>
f1un_not
(    f0    ) =
(
  lam(x1:a1) => not(f0(x1)) )
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
f0un_repeat_nint
(f0, times) =
nint_foritm(times) where
{
#impltmp
foritm$work<ni>(_) = f0((*void*))
}(*where*)//end(f0un_repeat_nint(f0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gfun000.dats] *)
