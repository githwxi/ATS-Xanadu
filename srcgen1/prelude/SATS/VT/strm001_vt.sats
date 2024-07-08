(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
For functional lin-streams.
*)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Tue Jan  2 20:48:52 EST 2024
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#sexpdef strm_vt = stream_vt
#sexpdef strq_vt = streaq_vt
#sexpdef strx_vt = streax_vt
*)
(* ****** ****** *)
//
fun
<a:vt>
strq_vt_sing
( x0: a ): strq_vt(a, 1)
fun
<a:vt>
strq_vt_pair
(x0:a,x1:a): strq_vt(a, 2)
//
(* ****** ****** *)
fun
<a:vt>
strx_vt_tail0
( strx_vt(a) ): strx_vt(a)
fun
<a:vt>
strq_vt_tail0
{n:pos}
(strq_vt(a,n)): strq_vt(a,n-1)
(* ****** ****** *)
//
fun
<a:vt>
strmcon_vt_sing
  ( x0: a ) : strmcon_vt(a)
fun
<a:vt>
strmcon_vt_pair
  (x0:a, x1:a) : strmcon_vt(a)
//
(* ****** ****** *)
//
fun<>
strmcon_vt_nil_
{a:vt}((*void*)): strmcon_vt(a)
fun
<a:vt>
strmcon_vt_cons_
( x0: (a)
, xs: strm_vt(a)): strmcon_vt(a)
//
fun
<a:vt>
strxcon_vt_cons_
( x0: (a)
, xs: strx_vt(a)): strxcon_vt(a)
//
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
strmcon_vt_uncons_cfr
( xs: strmcon_vt( x0 )
, f0: ((*void*)) -<cfr> r0
, f1: (x0, strm_vt(x0)) -<cfr> r0): r0
fun
<x0:vt>
<r0:vt>
strxcon_vt_uncons_cfr
( xs: strxcon_vt( x0 )
, f1: (x0, strx_vt(x0)) -<cfr> r0): r0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
strq_vt_make_list
{n:int}
(xs: list(a,n)): strq(a,n)
//
fun
<a:t0>
strq_vt_make0_llist
{n:int}
(xs: list_vt(a,n)): strq(a,n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:vt>
strx_vt_strmize0
(xs: strx_vt(a)): strm_vt( a )
//
(* ****** ****** *)
//
fun
<a:vt>
strq_vt_strmize0
(xs: strq_vt(a)): strm_vt( a )
//
fun
<a:vt>
strq_vt_listize0
{n:i0}
(xs: strq_vt(a,n)): list_vt(a,n)
fun
<a:vt>
strq_vt_rlistize0
{n:i0}
(xs: strq_vt(a,n)): list_vt(a,n)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strx_vt_map0
  (xs: strx_vt(x0)): strx_vt(y0)
fun
<x0:vt>
strx_vt_filter0
  (xs: strx_vt(x0)): strx_vt(x0)
fun
<x0:vt>
<y0:vt>
strx_vt_mapopt0
  (xs: strx_vt(x0)): strx_vt(y0)
fun
<x0:vt>
<y0:vt>
strx_vt_mapoptn0
  (xs: strx_vt(x0)): strx_vt(y0)
fun
<x0:vt>
<y0:vt>
strx_vt_maplist0
  (xs: strx_vt(x0)): strx_vt(y0)
fun
<x0:vt>
<y0:vt>
strx_vt_mapstrm0
  (xs: strx_vt(x0)): strx_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:vt>
strx_vt_sieve0
  (xs: strx_vt(x0)): strx_vt(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
strx_vt_imap0
  (xs: strx_vt(x0)): strx_vt(y0)
//
fun
<x0:vt>
strx_vt_ifilter0
  (xs: strx_vt(x0)): strx_vt(x0)
//
fun
<x0:vt>
<y0:vt>
strx_vt_imapopt0
  (xs: strx_vt(x0)): strx_vt(y0)
//
fun
<a:vt>
strx_vt_istrmize0
( xs
: strx_vt(a)): strm_vt(@(nint, a))
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload
strmize0 with strx_vt_strmize0 of 1000
//
(* ****** ****** *)
//
#symload
listize0 with strq_vt_listize0 of 1000
#symload
strmize0 with strq_vt_strmize0 of 1000
#symload
rlistize0 with strq_vt_rlistize0 of 1000
//
(* ****** ****** *)
//
#symload map0 with strx_vt_map0 of 1000
#symload filter0 with strx_vt_filter0 of 1000
//
(* ****** ****** *)
(* ****** ****** *)
(* end of [ATS3/XANADU_prelude_strm001_vt.sats] *)
