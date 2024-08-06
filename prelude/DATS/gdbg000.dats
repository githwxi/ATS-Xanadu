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
Mon 05 Aug 2024 10:30:08 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_print
<type(sint)>
( (*void*) ) = strn_print("sint")
//
#impltmp
g_print
<type(bool)>
( (*void*) ) = strn_print("bool")
#impltmp
g_print
<type(char)>
( (*void*) ) = strn_print("char")
//
#impltmp
g_print
<type(strn)>
( (*void*) ) = strn_print("strn")
//
#impltmp
g_print
<type(sflt)>
( (*void*) ) = strn_print("sflt")
#impltmp
g_print
<type(dflt)>
( (*void*) ) = strn_print("dflt")
//
(* ****** ****** *)
//
#impltmp
{ t0:t0 }
g_print
<type(list(t0))>
( (*void*) ) =
(
strn_print
( "list(" );
g_ptype<t0>((*0*)); strn_print(")"))
//
#impltmp
{ t0:t0 }
g_ptype
<strm(t0)>
( (*void*) ) =
(
strn_print
( "strm(" );
g_ptype<t0>((*0*)); strn_print(")"))
//
(* ****** ****** *)
//
#impltmp
{ vt:vt }
g_ptype
<list_vt(vt)>
( (*void*) ) =
(
strn_print
("list_vt(");
g_ptype<vt>((*0*)); strn_print(")"))
//
#impltmp
{ vt:vt }
g_ptype
<strm_vt(vt)>
( (*void*) ) =
(
strn_print
("strm_vt(");
g_ptype<vt>((*0*)); strn_print(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-06:
Tue 06 Aug 2024 07:17:33 AM EDT
*)
#impltmp
{ vw:vw }
g_print<type(vw)>(_) = g_ptype<vw>()
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gdbg000.dats] *)
