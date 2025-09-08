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
//
// For options
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: September, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
optn_nil_
{a:t0}
((*_*)): optn(a, ff)
fun
<a:t0>
optn_cons_
(x0: a): optn(a, tt)
//
(* ****** ****** *)
//
fun
<a:t0>
optn_make_1val
(x0: a): optn(a, tt)
//
(* ****** ****** *)
//
fun<>
optn_nilq
{a:t0}{b:b0}
(xs: optn(a, b)): bool(~b)
fun<>
optn_consq
{a:t0}{b:b0}
(xs: optn(a, b)): bool( b )
//
(* ****** ****** *)
//
fun
<a:t0>
optn_head
(xs: optn(a, tt)): (  a  )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
optn_length
{b:b0}
(xs: optn(a, b)): int(b2i(b))
//
(* ****** ****** *)
//
fun
<a:t0>
optn_forall
{b:b0}(xs: optn(a, b)): bool
fun
<a:t0>
optn_rforall
{b:b0}(xs: optn(a, b)): bool
fun
<a:t0>
optn_iforall
{b:b0}(xs: optn(a, b)): bool
fun
<a:t0>
optn_irforall
{b:b0}(xs: optn(a, b)): bool
//
(* ****** ****** *)
//
fun
<a:t0>
optn_foritm
{b:b0}(xs: optn(a, b)): void
fun
<a:t0>
optn_rforitm
{b:b0}(xs: optn(a, b)): void
//
(* ****** ****** *)
//
fun
<a:t0>
optn_listize
{b:b0}
(optn(a, b)): list_vt(a, b2i(b))
fun
<a:t0>
optn_rlistize
{b:b0}
(optn(a, b)): list_vt(a, b2i(b))
//
(* ****** ****** *)
//
fun
<a:t0>
optn_strmize(optn(a)): strm_vt(a)
//
(* ****** ****** *)
//
(*
optn_map: map$for
optn_map_vt: map$for
*)
//
fun
<x0:t0>
<y0:t0>
optn_map
{n:b0}(optn(x0, n)): optn(y0, n)
fun
<x0:t0>
<y0:vt>
optn_map_vt
{n:b0}(optn(x0, n)): optn_vt(y0, n)
//
(* ****** ****** *)
//
fun
<a:t0>
optn_copy_vt
{n:b0}(xs: optn(a, n)): optn_vt(a, n)
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for optn
//
(* ****** ****** *)

#symload none with optn_nil
#symload some with optn_cons

(* ****** ****** *)

#symload nilq with optn_nilq of 1000
#symload eqzq with optn_nilq of 1000
#symload consq with optn_consq of 1000
#symload neqzq with optn_consq of 1000
//
(* ****** ****** *)

#symload length with optn_length of 1000

(* ****** ****** *)

#symload forall with optn_forall of 1000
#symload foritm with optn_foritm of 1000

(* ****** ****** *)

#symload rforall with optn_rforall of 1000
#symload rforitm with optn_rforitm of 1000

(* ****** ****** *)

#symload listize with optn_listize of 1000
#symload strmize with optn_strmize of 1000
(* ****** ****** *)

#symload rlistize with optn_rlistize of 1000

(* ****** ****** *)

#symload map with optn_map of 1000
#symload map_vt with optn_map_vt of 1000
#symload copy_vt with optn_copy_vt of 1000

(* ****** ****** *)
(* ****** ****** *)
//
//
fun
<x0:t0>
<y0:t0>
optn_map$f1un
{n:bool}
(xs:optn(x0,n), f0:(x0)->(y0)): optn(y0,n)
fun
<x0:t0>
<y0:vt>
optn_map$f1un_vt
{n:bool}
(xs:optn(x0,n), f0:(x0)->(y0)): optn_vt(y0,n)
//
#symload map$fun with optn_map$f1un of 1000
#symload map$fun_vt with optn_map$f1un_vt of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_prelude_SATS_optn000.sats] *)
(***********************************************************************)
