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
#sexpdef strm = stream
#sexpdef strq = streaq
#sexpdef strx = streax
*)
(* ****** ****** *)
//
// For functional streams
//
(* ****** ****** *)
//
fun<>
strmcon_nil_
{a:t0}
((*void*)): strmcon(a)
fun
<a:t0>
strmcon_cons_
(a, strm(a)): strmcon(a)
//
fun
<a:t0>
strxcon_cons_
(a, strx(a)): strxcon(a)
//
fun
<x0:t0>
<r0:vt>
strmcon_uncons_cfr
( xs: strmcon( x0 )
, f0: ((*void*)) -<cfr> r0
, f1: (x0, strm(x0)) -<cfr> r0): r0
//
fun
<x0:t0>
<r0:vt>
strxcon_uncons_cfr
( xs: strxcon(x0)
, f1: (x0, strx(x0)) -<cfr> r0): r0
//
(* ****** ****** *)

fun
<a:t0>
strm_nil(): strm(a)
fun
<a:t0>
strm_cons
(x0: a, xs: strm(a)): strm(a)

(* ****** ****** *)

fun
<a:t0>
strm_sing(x0: a): strm(a)
fun
<a:t0>
strm_pair(x1: a, x2: a): strm(a)

(* ****** ****** *)

fun
<a:t0>
strm_length
( xs: strm(a) ): nint

(* ****** ****** *)
//
fun
<a:t0>
strm_extend
(xs: strm(a), x0: a): strm(a)
fun
<a:t0>
strm_append
(xs:strm(a), ys:strm(a)): strm(a)
//
(* ****** ****** *)
//
fun
<a:t0>
strm_concat
(xss: strm(strm(a))): strm(a)
//
(* ****** ****** *)
//
fun
<a:t0>
strm_forall(xs: strm(a)): bool
(*
fun
<x0:t0>
strm_foreach(xs: strm(x0)): void
*)
//
(* ****** ****** *)
//
fun
<x0:t0>
strm_listize
( xs: strm(x0) ) : list_vt(x0)
fun
<x0:t0>
strm_strmize
( xs: strm(x0) ) : strm_vt(x0)
//
(* ****** ****** *)
//
(*
strm_map: map$fopr
strm_map_vt: map$fopr
*)
//
fun
<x0:t0>
<y0:t0>
strm_map(strm(x0)): strm(y0)
fun
<x0:t0>
<y0:t0>
strx_map(strx(x0)): strx(y0)
//
fun
<x0:t0>
<y0:vt>
strm_map_vt(strm(x0)): strm_vt(y0)
fun
<x0:t0>
<y0:vt>
strx_map_vt(strx(x0)): strx_vt(y0)
//
(* ****** ****** *)
//
(*
strm_filter: filter$test
strm_filter_vt: filter$test
*)
//
fun
<x0:t0>
strm_filter(strm(x0)): strm(x0)
fun
<x0:t0>
strx_filter(strx(x0)): strx(x0)
//
fun
<x0:t0>
strm_filter_vt(strm(x0)): strm_vt(x0)
fun
<x0:t0>
strx_filter_vt(strx(x0)): strx_vt(x0)
//
(* ****** ****** *)
//
(*
strm_mapopt:
filter$fopr, map$fopr
strm_mapopt_vt:
filter$fopr, map$fopr
*)
fun
<x0:t0>
<y0:t0>
strm_mapopt(strm(x0)): strm(y0)
fun
<x0:t0>
<y0:vt>
strm_mapopt_vt(strm(x0)): strm_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:t0>
strm_mapoptn(strm(x0)): strm(y0)
fun
<x0:t0>
<y0:vt>
strm_mapoptn_vt(strm(x0)): strm_vt(y0)
//
(* ****** ****** *)
//
fun
<x0:t0>
strm_merge
(strm(x0), strm(x0)): strm(x0)
//
(* ****** ****** *)
//
fun
<x0:t0>
strm_sieve(strm(x0)): strm(x0)
fun
<x0:t0>
strx_sieve(strm(x0)): strx(x0)
//
fun
<x0:t0>
strm_sieve_vt(strm(x0)): strm_vt(x0)
fun
<x0:t0>
strx_sieve_vt(strm(x0)): strx_vt(x0)
//
(* ****** ****** *)

fun
<x0:t0>
<y0:t0>
strm_imap(strm(x0)): strm( y0 )
fun
<x0:t0>
<y0:vt>
strm_imap_vt(strm(x0)): strm_vt( y0 )

(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for strm
//
(* ****** ****** *)
//
#symload nil with strmcon_nil
#symload cons with strmcon_cons
//
(* ****** ****** *)

#symload
length with strm_length of 1000

(* ****** ****** *)

#symload
extend with strm_extend of 1000
#symload
append with strm_append of 1000
#symload
concat with strm_concat of 1000

(* ****** ****** *)
//
#symload
forall with strm_forall of 1000
(*
#symload
foreach with strm_foreach of 1000
*)
//
(* ****** ****** *)
//
#symload
listize with strm_listize of 1000
#symload
strmize with strm_strmize of 1000
//
(* ****** ****** *)
//
#symload map with strm_map of 1000
#symload map with strx_map of 1000
#symload map_vt with strm_map_vt of 1000
#symload map_vt with strx_map_vt of 1000
//
(* ****** ****** *)
//
#symload sieve with strm_sieve of 1000
#symload sieve with strx_sieve of 1000
#symload sieve_vt with strm_sieve_vt of 1000
#symload sieve_vt with strx_sieve_vt of 1000
//
(* ****** ****** *)
//
#symload filter with strm_filter of 1000
#symload filter with strx_filter of 1000
#symload filter_vt with strm_filter_vt of 1000
#symload filter_vt with strx_filter_vt of 1000
//
(* ****** ****** *)
//
#symload imap with strm_imap of 1000
#symload imap_vt with strm_imap_vt of 1000
//
(* ****** ****** *)
//
#symload mapopt with strm_mapopt of 1000
#symload mapopt_vt with strm_mapopt_vt of 1000
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_strm0.sats] *)
