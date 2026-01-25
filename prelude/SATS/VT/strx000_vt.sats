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
//
(*
Author: Hongwei Xi
(*
Wed May  7 08:03:12 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
strx_vt_cons
(
x0: (a),
xs: strx_vt(a)): strx_vt(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strx_vt_free
(xs: strx_vt(x0)): ( void )
fun
<x0:vt>
strx_vt_eval
(xs: strx_vt(x0)): strxcon_vt(x0)
//
#symload free with strx_vt_free of 1000
#symload eval with strx_vt_eval of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strx_vt_head0
(xs: strx_vt(x0)): (x0)
fun
<x0:vt>
strx_vt_tail0
(xs: strx_vt(x0)): strx_vt(x0)
//
#symload head0 with strx_vt_head0
#symload tail0 with strx_vt_tail0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strx_vt_prepend0__llist0
( xs: strx_vt(x0)
, ys: list_vt(x0)): strx_vt(x0)
fun
<x0:vt>
strx_vt_prepend0__lstrm0
( xs: strx_vt(x0)
, ys: strm_vt(x0)): strx_vt(x0)
fun
<x0:vt>
strx_vt_prepend0__lstrq0
( xs: strx_vt(x0)
, ys: strq_vt(x0)): strx_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload prepend00 with strx_vt_prepend0__llist0
#symload prepend00 with strx_vt_prepend0__lstrm0
#symload prepend00 with strx_vt_prepend0__lstrq0
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-13:
Tue Jan 13 02:42:01 AM EST 2026
*)
fun<>
strx_vt_beg(): strn
fun<>
strx_vt_end(): strn
fun<>
strx_vt_sep(): strn
fun<>
strx_vt_rst(): strn
//
fun
<x0:vt>
strx_vt_print0(xs: strx_vt(x0)): void
//
fun
<x0:vt>
strx_vt_all$print0(xs: strx_vt(x0)): void
//
(*
fun<>
strx_vt_print$len(): sint
*)
fun<>
strx_vt$print$len(): sint
fun
<x0:vt>
strx_vt_len$print0(xs: strx_vt(x0), ln: sint): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_VT_strn000_vt.sats] *)
(***********************************************************************)
