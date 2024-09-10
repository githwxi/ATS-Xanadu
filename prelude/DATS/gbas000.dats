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
#impltmp
{ x0:t0 }
g_void<x0>(obj) = ()
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
g_self<x0>(obj) = obj
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-16:
g_free0 and g_copy1
are in [gbas001.dats]
*)
#impltmp
{ x0:t0 }
g_free<x0>(obj) = ( )
#impltmp
{ x0:t0 }
g_copy<x0>(obj) = obj
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<unit>(ut) = strn_print("unit")
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
g_parse(rep) =
(
case+ opt of
| ~optn_vt_cons(x0) => x0
) where
{
  val opt = g_parse$opt<x0>(rep)
}(*where*)//end-of-[g_parse(rep)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gbas000.dats] *)
