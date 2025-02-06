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
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
g_type
{t0:t0}(_) =
$UN.castxy(unit(*0*))
#impltmp
<(*tmp*)>
g_vwtp
{vt:vt}(_) =
$UN.castxy(unit(*0*))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< vt:vt >
g_psort() =
(
  strn_print("vwtp"))
#impltmp
< vx:vx >
g_psort() =
(
  strn_print("vtbx"))
#impltmp
< t0:t0 >
g_psort() =
(
  strn_print("type"))
#impltmp
< tx:tx >
g_psort() =
(
  strn_print("tbox"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< vw:vw >
g_ptype() =
(
 strn_print("$typ(vw)"))
#impltmp
< pf:pf >
g_ptype() =
(
 strn_print("$typ(pf)"))
//
#impltmp
< vt:vt >
g_ptype() =
(
 strn_print("$typ(vt)"))
#impltmp
< t0:t0 >
g_ptype() =
(
 strn_print("$typ(t0)"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< t0:t0 >
g_print(x0) =
( pstrn"$val("
; g_ptype<t0>(); pstrn":"
; g_psort<t0>(); pstrn")")
//
#impltmp
< vt:vt >
g_print1(x0) =
( pstrn"$val("
; g_ptype<vt>(); pstrn":"
; g_psort<vt>(); pstrn")")
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
g_ptype
< sint >
( (*void*) ) = pstrn("sint")
#impltmp
g_ptype
< uint >
( (*void*) ) = pstrn("uint")
//
#impltmp
g_ptype
< bool >
( (*void*) ) = pstrn("bool")
#impltmp
g_ptype
< char >
( (*void*) ) = pstrn("char")
//
#impltmp
g_ptype
< strn >
( (*void*) ) = pstrn("strn")
//
#impltmp
g_ptype
< sflt >
( (*void*) ) = pstrn("sflt")
#impltmp
g_ptype
< dflt >
( (*void*) ) = pstrn("dflt")
//
(* ****** ****** *)
//
#impltmp
{ t0:t0 }
g_ptype
<list(t0)>
( (*void*) ) =
(
pstrn("list(");
g_ptype<t0>((*0*)); pstrn(")"))
//
#impltmp
{ t0:t0 }
g_ptype
<optn(t0)>
( (*void*) ) =
(
pstrn("optn(");
g_ptype<t0>((*0*)); pstrn(")"))
//
#impltmp
{ t0:t0 }
g_ptype
<strm(t0)>
( (*void*) ) =
(
pstrn("strm(");
g_ptype<t0>((*0*)); pstrn(")"))
//
(* ****** ****** *)
//
#impltmp
{ vt:vt }
g_ptype
<list_vt(vt)>
( (*void*) ) =
(
pstrn("list_vt(");
g_ptype<vt>((*0*)); pstrn(")"))
//
#impltmp
{ vt:vt }
g_ptype
<optn_vt(vt)>
( (*void*) ) =
(
pstrn("optn_vt(");
g_ptype<vt>((*0*)); pstrn(")"))
//
#impltmp
{ vt:vt }
g_ptype
<strm_vt(vt)>
( (*void*) ) =
(
pstrn("strm_vt(");
g_ptype<vt>((*0*)); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-06:
Tue 06 Aug 2024 07:17:33 AM EDT
*)
//
#impltmp
{ vw:vw }
g_print
<type(vw)>(_(*0*)) =
(
g_ptype<vw>((*void*));
pstrn":";g_psort<vw>((*void*)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_prlen((*void*)) = 10(*default*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
assert$errmsg() =
"gdbg000: [assert] failed!"
//
#impltmp
<(*tmp*)>
bool_assert(cond) =
let
val emsg =
assert$errmsg<>() in//let
(
  bool_assert$errmsg<>(cond, emsg))
end(*let*)//end-of-[bool_assert(cond)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gdbg000.dats] *)
