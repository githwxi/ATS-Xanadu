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
Sat 07 Sep 2024 07:21:46 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-20:
Sat Dec 20 11:21:52 AM EST 2025
*)
//
fun<>
strm_nil
{a:t0}((*0*)): strm(a)
fun<>
strq_nil
{a:t0}((*0*)): strq(a, 0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
strm_sing
( x0: ( a ) ): strm(a)
fun
<a:t0>
strq_sing
( x0: ( a ) ): strq(a, 1)
//
fun
<a:t0>
strm_cons
(
x0: ( a ),
xs: strm( a )): strm( a )
fun
<a:t0>
strq_cons
{n:i0}
(
x0: ( a ),
xs: strq(a, n)): strq(a, n+1)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
strm_eval(strm(a)): strmcon(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-20:
Sat Dec 20 12:27:24 PM EST 2025
*)
fun
<x0:t0>
strm_head
(xs: strm(x0)): (x0)
fun
<x0:t0>
strm_tail
(xs: strm(x0)): strm(x0)
//
#symload
head with strm_head of 1000
#symload
tail with strm_tail of 1000
//
(* ****** ****** *)
//
fun
<x0:t0>
strm_head$opt
(xs: strm(x0)): optn_vt(x0)
fun
<x0:t0>
strm_tail$opt
(xs: strm(x0)): optn_vt(strm(x0))
//
#symload
head$opt with strm_head$opt of 1000
#symload
tail$opt with strm_tail$opt of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
strm_length
(xs: strm(x0)): (nint)
fun
<x0:t0>
strq_length
{n0:i0}(xs: strq(x0,n0)): sint(n0)
//
#symload length with strm_length of 1000
#symload length with strq_length of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
strm_append
( xs: strm(x0)
, ys: strm(x0)): strm(x0)
fun
<x0:t0>
strq_append
{n1,n2:i0}
( xs: strq(x0,n1)
, ys: strq(x0,n2)): strq(x0,n1+n2)
//
fun
<x0:t0>
strm_append_vt
( xs: strm(x0)
, ys: strm(x0)): strm_vt(x0)
fun
<x0:t0>
strq_append_vt
{n1,n2:i0}
( xs: strq(x0,n1)
, ys: strq(x0,n2)): strq_vt(x0,n1+n2)
//
#symload append with strm_append of 1000
#symload append with strq_append of 1000
#symload append_vt with strm_append_vt of 1000
#symload append_vt with strq_append_vt of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-21:
Sun Dec 21 07:13:28 PM EST 2025
*)
//
fun<>
strm_beg(): strn
fun<>
strm_end(): strn
fun<>
strm_sep(): strn
fun<>
strm_rst(): strn
//
fun
<x0:t0>
strm_print(xs: strm(x0)): void
//
fun
<x0:t0>
strm_all$print(xs: strm(x0)): void
//
fun<>
strm_print$len(): sint
fun
<x0:t0>
strm_len$print(xs: strm(x0), ln: sint): void
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_strm000.sats] *)
(***********************************************************************)
