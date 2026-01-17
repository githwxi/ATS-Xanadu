(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
#staload UN =
"srcgen1\
/prelude/SATS/unsafex.sats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Fri Jan 16 06:08:53 PM EST 2026
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-16:
For implementing operations
in JS that can be called in ATS.
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
//
(*
HX-2026-01-16:
Already inside
[xats2js_js1emit.js]!
*)
//
#extern
fun
XATS2JS_optn_nil
{a:t0}
((*0*)): optn(a) = $extnam()
#implfun
XATS2JS_optn_nil() = optn_nil()
#extern
fun
XATS2JS_optn_cons
{a:t0}
(x0: a): optn(a) = $extnam()
#implfun
XATS2JS_optn_cons(x0) = optn_cons(x0)
//
*)
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_optn_nilq
{a:t0}
( xs
: optn(a)): bool = $extnam()
#implfun
XATS2JS_optn_nilq(xs) =
(
case+ xs of
|optn_nil() => true |optn_cons _ => false)
//
#extern
fun
XATS2JS_optn_consq
{a:t0}
( xs
: optn(a)): bool = $extnam()
#implfun
XATS2JS_optn_consq(xs) =
(
case+ xs of
|optn_nil() => false |optn_cons _ => (true))
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_optn_head$raw
{a:t0}
( xs
: optn(a)): (a) = $extnam()
#implfun
XATS2JS_optn_head$raw(xs) =
(
case- xs of optn_cons(x0) => (x0))
//
#extern
fun
XATS2JS_optn_uncons$raw
{a:t0}
( xs
: optn(a)): (a) = $extnam()
#implfun
XATS2JS_optn_uncons$raw(xs) =
(
case- xs of optn_cons(x0) => (x0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
//
(*
HX-2026-01-16:
Already inside
[xats2js_js1emit.js]!
*)
//
#extern
fun
XATS2JS_list_nil
{a:t0}
((*0*)): list(a) = $extnam()
#implfun
XATS2JS_list_nil() = list_nil()
#extern
fun
XATS2JS_list_cons
{a:t0}
( x1: a//head
, xs: list(a)): list(a) = $extnam()
#implfun
XATS2JS_list_cons(x1,xs) = list_cons(x1,xs)
//
*)
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_list_nilq
{a:t0}
( xs
: list(a)): bool = $extnam()
#implfun
XATS2JS_list_nilq(xs) =
(
case+ xs of
|list_nil() => true |list_cons _ => false)
//
#extern
fun
XATS2JS_list_consq
{a:t0}
( xs
: list(a)): bool = $extnam()
#implfun
XATS2JS_list_consq(xs) =
(
case+ xs of
|list_nil() => false |list_cons _ => (true))
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_list_head$raw
{a:t0}
( xs
: list(a)): (a) = $extnam()
#implfun
XATS2JS_list_head$raw(xs) =
(
case- xs of list_cons(x1, xs) => (x1))
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2JS_lazy_make_f0un
{a:t0}
( f0
: ()->(a)): lazy(a) = $extnam()
#implfun
XATS2JS_lazy_make_f0un(f0) = $lazy(f0())
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2JS_strmcon_nil
{a:t0}
((*0*)): strmcon(a) = $extnam()
#implfun
XATS2JS_strmcon_nil() = strmcon_nil()
//
#extern
fun
XATS2JS_strmcon_cons
{a:t0}
(x1: a//head
,xs: strm(a)): strmcon(a) = $extnam()
#implfun
XATS2JS_strmcon_cons(x1,xs) = strmcon_cons(x1,xs)
//
#extern
fun
XATS2JS_strxcon_cons
{a:t0}
(x1: a//head
,xs: strx(a)): strxcon(a) = $extnam()
#implfun
XATS2JS_strxcon_cons(x1,xs) = strxcon_cons(x1,xs)
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_strmcon_nilq
{a:t0}
( xs
: strmcon(a)): bool = $extnam()
#implfun
XATS2JS_strmcon_nilq(xs) =
(
case+ xs of
|strmcon_nil() => true |strmcon_cons _ => false)
//
#extern
fun
XATS2JS_strmcon_consq
{a:t0}
( xs
: strmcon(a)): bool = $extnam()
#implfun
XATS2JS_strmcon_consq(xs) =
(
case+ xs of
|strmcon_nil() => false |strmcon_cons _ => (true))
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_strmcon_head$raw
{a:t0}
( xs
: strmcon(a)): (a) = $extnam()
#implfun
XATS2JS_strmcon_head$raw(xs) =
(
case- xs of strmcon_cons(x1, xs) => (x1))
//
#extern
fun
XATS2JS_strmcon_tail$raw
{a:t0}
( xs
: strmcon(a)): strm(a) = $extnam()
#implfun
XATS2JS_strmcon_tail$raw(xs) =
(
case- xs of strmcon_cons(x1, xs) => (xs))
//
(* ****** ****** *)
//
#extern
fun
(*
HX: no failure!
*)
XATS2JS_strxcon_head$raw
{a:t0}
( xs
: strxcon(a)): (a) = $extnam()
#implfun
XATS2JS_strxcon_head$raw(xs) =
(
case+ xs of strxcon_cons(x1, xs) => (x1))
//
#extern
fun
(*
HX: no failure!
*)
XATS2JS_strxcon_tail$raw
{a:t0}
( xs
: strxcon(a)): strx(a) = $extnam()
#implfun
XATS2JS_strxcon_tail$raw(xs) =
(
case+ xs of strxcon_cons(x1, xs) => (xs))
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-01-02: For VT!
*)
(* ****** ****** *)
(* ****** ****** *)
//
(*
//
(*
HX-2026-01-02:
Already inside
[xats2js_js1emit.js]!
*)
//
#extern
fun
XATS2JS_optn_vt_nil
{a:vt}
((*0*)): optn_vt(a) = $extnam()
#implfun
XATS2JS_optn_vt_nil() = optn_vt_nil()
#extern
fun
XATS2JS_optn_vt_cons
{a:vt}
(x0: a): optn_vt(a) = $extnam()
#implfun
XATS2JS_optn_vt_cons(x0) = optn_vt_cons(x0)
//
*)
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_optn_vt_nilq1
{a:vt}
( xs:
! optn_vt(a)): bool = $extnam()
#implfun
XATS2JS_optn_vt_nilq1(xs) =
(
case+ xs of
|optn_vt_nil()=>true|optn_vt_cons(x0)=>false)
//
#extern
fun
XATS2JS_optn_vt_consq1
{a:vt}
( xs:
! optn_vt(a)): bool = $extnam()
#implfun
XATS2JS_optn_vt_consq1(xs) =
(
case+ xs of
|optn_vt_nil()=>false|optn_vt_cons(x0)=>(true))
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_optn_vt_head$raw0
{a:vt}
( xs
: optn_vt(a)): (a) = $extnam()
#implfun
XATS2JS_optn_vt_head$raw0(xs) =
(
case- xs of ~optn_vt_cons(x0) => (x0))
//
#extern
fun
XATS2JS_optn_vt_uncons$raw0
{a:vt}
( xs
: optn_vt(a)): (a) = $extnam()
#implfun
XATS2JS_optn_vt_uncons$raw0(xs) =
(
case- xs of ~optn_vt_cons(x0) => (x0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
//
(*
HX-2026-01-02:
Already inside
[xats2js_js1emit.js]!
*)
//
#extern
fun
XATS2JS_list_vt_nil
{a:vt}
((*0*)): list_vt(a) = $extnam()
#implfun
XATS2JS_list_vt_nil() = list_vt_nil()
#extern
fun
XATS2JS_list_vt_cons
{a:vt}
( x1: a//head
, xs: list_vt(a)): list_vt(a) = $extnam()
#implfun
XATS2JS_list_vt_cons(x1,xs) = list_vt_cons(x1,xs)
//
*)
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_list_vt_nilq1
{a:vt}
( xs:
! list_vt(a)): bool = $extnam()
#implfun
XATS2JS_list_vt_nilq1(xs) =
(
case+ xs of
|list_vt_nil()=>true|list_vt_cons _ => false)
//
#extern
fun
XATS2JS_list_vt_consq1
{a:vt}
( xs:
! list_vt(a)): bool = $extnam()
#implfun
XATS2JS_list_vt_consq1(xs) =
(
case+ xs of
|list_vt_nil()=>false|list_vt_cons _ => (true))
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_list_vt_head$raw1
{a:vt}
( xs
: list_vt(a)): (a) = $extnam()
#implfun
XATS2JS_list_vt_head$raw1(xs) =
(
case- xs of
|
list_vt_cons
(  x1, xs  ) =>
let
val x1 =
$UN.datacopy(x1) in $UN.enlinear(x1) end)
//
#extern
fun
XATS2JS_list_vt_tail$raw0
{a:vt}
( xs:
~ list_vt(a)): list_vt(a) = $extnam()
#implfun
XATS2JS_list_vt_tail$raw0(xs) =
case- xs of
| ~
list_vt_cons
(  x1, xs  ) =>
(
  let val x1 = $UN.delinear(x1) in xs end)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2JS_lazy_vt_eval
{a:vt}
( lz:
~ lazy_vt(a)): (a) = $extnam()
#implfun
XATS2JS_lazy_vt_eval(lz) = $eval(lz)
//
#extern
fun
XATS2JS_lazy_vt_free
{a:vt}
( lz:
~ lazy_vt(a)): void = $extnam()
#implfun
XATS2JS_lazy_vt_free(lz) = $free(lz)
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_lazy_vt_make_f0un
{a:vt}
( f0
: ()->(a)): lazy_vt(a) = $extnam()
#implfun
XATS2JS_lazy_vt_make_f0un(f0) = $llazy(f0())
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2JS_strmcon_vt_nil
{a:vt}
((*0*)): strmcon_vt(a) = $extnam()
#implfun
XATS2JS_strmcon_vt_nil() = strmcon_vt_nil()
//
#extern
fun
XATS2JS_strmcon_vt_cons
{a:vt}
(x1: a//head
,xs: strm_vt(a)): strmcon_vt(a) = $extnam()
#implfun
XATS2JS_strmcon_vt_cons(x1,xs) = strmcon_vt_cons(x1,xs)
//
#extern
fun
XATS2JS_strxcon_vt_cons
{a:vt}
(x1: a//head
,xs: strx_vt(a)): strxcon_vt(a) = $extnam()
#implfun
XATS2JS_strxcon_vt_cons(x1,xs) = strxcon_vt_cons(x1,xs)
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_strmcon_vt_nilq1
{a:vt}
( xs:
! strmcon_vt(a)): bool = $extnam()
#implfun
XATS2JS_strmcon_vt_nilq1(xs) =
(
case+ xs of
|strmcon_vt_nil()=>true|strmcon_vt_cons _ =>false)
//
#extern
fun
XATS2JS_strmcon_vt_consq1
{a:vt}
( xs:
! strmcon_vt(a)): bool = $extnam()
#implfun
XATS2JS_strmcon_vt_consq1(xs) =
(
case+ xs of
|strmcon_vt_nil()=>false|strmcon_vt_cons _ =>(true))
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_strmcon_vt_head$raw1
{a:vt}
( xs:
! strmcon_vt(a)): (a) = $extnam()
#implfun
XATS2JS_strmcon_vt_head$raw1(xs) =
(
case- xs of
|
strmcon_vt_cons
(   x1 , xs   ) =>
let
val x1 =
$UN.datacopy(x1) in $UN.enlinear(x1) end)
//
#extern
fun
XATS2JS_strmcon_vt_tail$raw0
{a:vt}
( xs:
~ strmcon_vt(a)): strm_vt(a) = $extnam()
#implfun
XATS2JS_strmcon_vt_tail$raw0(xs) =
case- xs of
| ~
strmcon_vt_cons
(   x1 , xs   ) =>
(
  let val x1 = $UN.delinear(x1) in xs end)
//
(* ****** ****** *)
//
(*
HX: no failure!
*)
#extern
fun
XATS2JS_strxcon_vt_head$raw1
{a:vt}
( xs:
! strxcon_vt(a)): (a) = $extnam()
#implfun
XATS2JS_strxcon_vt_head$raw1(xs) =
(
case+ xs of
|
strxcon_vt_cons
(   x1 , xs   ) =>
let
val x1 =
$UN.datacopy(x1) in $UN.enlinear(x1) end)
//
(*
HX: no failure!
*)
#extern
fun
XATS2JS_strxcon_vt_tail$raw0
{a:vt}
( xs:
~ strxcon_vt(a)): strx_vt(a) = $extnam()
#implfun
XATS2JS_strxcon_vt_tail$raw0(xs) =
case+ xs of
| ~
strxcon_vt_cons
(   x1 , xs   ) =>
(
  let val x1 = $UN.delinear(x1) in xs end)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_precats.dats] *)
(***********************************************************************)
