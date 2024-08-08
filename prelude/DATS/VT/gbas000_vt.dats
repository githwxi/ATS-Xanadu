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
Wed 10 Jul 2024 10:39:58 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
{ x0:t0 }
g_free0<x0>(obj) = ()
#impltmp
{ x0:vt }
g_free1<x0>(obj) = ()
*)
//
(*
#impltmp
{ x0:vt }
g_copy0<x0>(obj) = obj
#impltmp
{ x0:t0 }
g_copy1<x0>(obj) = obj
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
g_equal0<x0> = g_equal<x0>
#impltmp
{ x0:t0 }
g_equal1<x0> = g_equal<x0>
//
#impltmp
{ x0:t0 }
g_noteq0<x0> = g_noteq<x0>
#impltmp
{ x0:t0 }
g_noteq1<x0> = g_noteq<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
max$nil0<x0> = max$nil<x0>(*nil*)
#impltmp
{ x0:t0 }
min$nil0<x0> = min$nil<x0>(*nil*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
get$at$exn1 = get$at$exn<xs><x0>
#impltmp
< xs:t0 >
< x0:vt >
set$at$exn1 = set$at$exn<xs><x0>
#impltmp
< xs:t0 >
< x0:t0 >
fset$at$exn1 = fset$at$exn<xs><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gbas000_vt.dats] *)
