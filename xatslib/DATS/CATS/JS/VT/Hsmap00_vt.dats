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
Fri 09 Aug 2024 03:06:19 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-09:
For hashmap support in JS
*)
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
#staload "./../Hsmap00.dats"
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fcast
UN_jshsmap_t2vt
{k:t0}
{x:vt}(A: jsm0(k,x)): jslm(k,x)
#extern
fcast
UN_jsarray_vt2t
{k:t0}
{x:vt}(A: !jslm(k,x)): jsm0(k,x)
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#impltmp
{ k: t0
, x: vt }
g_ptype
<jslm(k,x)>
( (*void*) ) =
(
pstrn"jshsmap_vt(";
g_ptype<k>();pstrn",";
g_ptype<x>();pstrn")")
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ k: t0
, x: vt }
g_print1
<jslm(k,x)>
  ( xs ) =
let
//
#vwtpdef x0 = (k,x)
#vwtpdef xs = jslm(k,x)
//
#impltmp
gseq_sep<xs><x0>() = ","
#impltmp
gseq_beg<xs><x0>() = "jshsmap_vt("
#impltmp
gseq_end<xs><x0>() = ")"
in//let
  gseq_print1<xs><x0>(xs)
end//end-of-[g_print1<jslm(k,x)>]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_DATS_CATS_JS_VT_Hsmap00_vt.dats] *)
