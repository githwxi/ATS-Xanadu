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
Wed May  7 08:40:39 AM EDT 2025
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
fun
<x0:vt>
strx_vt_strmize0
(xs: strx_vt(x0)): strm_vt(x0)
//
#symload
strmize0 with strx_vt_strmize0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strx_vt_map0
(xs: strx_vt(x0)): strx_vt(y0)
//
fun
<x0:vt>
<y0:vt>
strx_vt_imap0
(xs: strx_vt(x0)): strx_vt(y0)
//
#symload map0 with strx_vt_map0 of 1000
#symload imap0 with strx_vt_imap0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strx_vt_map0$f1un
( xs: strx_vt(x0)
, fopr: (~x0) -> y0): strx_vt(y0)
#symload map0 with strx_vt_map0$f1un of 1000
#symload map0$fun with strx_vt_map0$f1un of 1000
//
fun
<x0:vt>
<y0:vt>
strx_vt_imap0$f1un
( xs: strx_vt(x0)
, fopr: (ni,~x0) -> y0): strx_vt(y0)
#symload map0 with strx_vt_imap0$f1un of 1000
#symload map0$fun with strx_vt_imap0$f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
strx_vt_filter0
(xs: strx_vt(x0)): strx_vt(x0)
fun
<x0:vt>
strx_vt_ifilter0
(xs: strx_vt(x0)): strx_vt(x0)
//
#symload filter0 with strx_vt_filter0 of 1000
#symload ifilter0 with strx_vt_ifilter0 of 1000
//
(* ****** ****** *)
//
fun
<x0:vt>
strx_vt_filter0$f1un
( xs: strx_vt(x0)
, test: (!x0) -> bool): strx_vt(x0)
#symload filter0 with strx_vt_filter0$f1un of 1000
#symload filter0$fun with strx_vt_filter0$f1un of 1000
//
fun
<x0:vt>
strx_vt_ifilter0$f2un
( xs: strx_vt(x0)
, test: (ni,!x0) -> bool): strx_vt(x0)
#symload ifilter0 with strx_vt_ifilter0$f2un of 1000
#symload ifilter0$fun with strx_vt_ifilter0$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strx_vt_mapoptn0
(xs: ~strx_vt(x0)): strx_vt(y0)
fun
<x0:vt>
<y0:vt>
strx_vt_maplist0
(xs: ~strx_vt(x0)): strx_vt(y0)
//
#symload mapoptn0 with strx_vt_mapoptn0 of 1000
#symload maplist0 with strx_vt_maplist0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
strx_vt_scanitm0
(xs: ~strx_vt(x0), r0: r0): strx_vt(r0)
//
#symload scanitm0 with strx_vt_scanitm0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_VT_strx001_vt.sats] *)
(***********************************************************************)
