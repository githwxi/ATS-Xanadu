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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sun 14 Jul 2024 12:24:44 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a0:t0 >
< a1:t0 >
z2tup_make
( x1, x2 ) =
(
  $UN.castxy@(x1, x2))
#impltmp
< a0:t0 >
< a1:t0 >
z2tup_unmk
 ( ztup ) = $UN.castxy(ztup)
//
#impltmp
{ a0:t0
, a1:t0 }
g_ptype
<z2tup(a0,a1)>
(  (*void*)  ) =
( pstrn"z2tup("
; g_ptype<a0>(); pstrn(",")
; g_ptype<a1>(); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a0:t0 >
< a1:t0 >
x2tup_make
( x1, x2 ) =
(
  $UN.castxy@(x1, x2))
#impltmp
< a0:t0 >
< a1:t0 >
x2tup_unmk
 ( xtup ) = $UN.castxy(xtup)
//
#impltmp
{ a0:t0
, a1:t0 }
g_ptype
<x2tup(a0,a1)>
(  (*void*)  ) =
( pstrn"x2tup("
; g_ptype<a0>(); pstrn(",")
; g_ptype<a1>(); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< x0:t0
, y0:t0 >
z2forall$test =
rz2forall$test<x0,y0>
#impltmp
< x0:t0
, y0:t0 >
rz2forall$test = z2forall$test<x0,y0>
*)
//
(*
#impltmp
< x0:t0
, y0:t0 >
z2foritm$work =
rz2foritm$work<x0,y0>
#impltmp
< x0:t0
, y0:t0 >
rz2foritm$work = z2foritm$work<x0,y0>
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gbas002.dats] *)
