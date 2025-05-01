(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Wed Apr 30 10:41:58 AM EDT 2025
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../../SATS/libcats.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
//
(*
HX-2025-04-28:
For async programming!
*)
//
#extern
fun
XATS2JS_NODE_g_stdin
  ((*void*)): FILR = $extnam()
//
#impltmp
g_stdin< > = XATS2JS_NODE_g_stdin
//
*)
//
#extern
fun
XATS2JS_NODE_g_stdout
  ((*void*)): FILR = $extnam()
#extern
fun
XATS2JS_NODE_g_stderr
  ((*void*)): FILR = $extnam()
//
#impltmp
g_stdout< > = XATS2JS_NODE_g_stdout
#impltmp
g_stderr< > = XATS2JS_NODE_g_stderr
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2JS_NODE_bool_fprint:
(bool, FILR) -> void = $extnam()
#impltmp
bool_fprint<> = XATS2JS_NODE_bool_fprint
//
#extern
fun
XATS2JS_NODE_char_fprint:
(char, FILR) -> void = $extnam()
#impltmp
char_fprint<> = XATS2JS_NODE_char_fprint
//
#extern
fun
XATS2JS_NODE_strn_fprint:
(strn, FILR) -> void = $extnam()
#impltmp
strn_fprint<> = XATS2JS_NODE_strn_fprint
//
#extern
fun
XATS2JS_NODE_gint_fprint$sint:
(sint, FILR) -> void = $extnam()
#impltmp
gint_fprint$sint<> = XATS2JS_NODE_gint_fprint$sint
#extern
fun
XATS2JS_NODE_gint_fprint$uint:
(uint, FILR) -> void = $extnam()
#impltmp
gint_fprint$uint<> = XATS2JS_NODE_gint_fprint$uint
//
#extern
fun
XATS2JS_NODE_gflt_fprint$sflt:
(sflt, FILR) -> void = $extnam()
#impltmp
gflt_fprint$sflt<> = XATS2JS_NODE_gflt_fprint$sflt
#extern
fun
XATS2JS_NODE_gflt_fprint$dflt:
(dflt, FILR) -> void = $extnam()
#impltmp
gflt_fprint$dflt<> = XATS2JS_NODE_gflt_fprint$dflt
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_xatslib_libcats_DATS_CATS_JS_NODE_libcats.dats] *)
(***********************************************************************)
