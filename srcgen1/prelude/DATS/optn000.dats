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
// (Some time in 2019)
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
(*
** for opts
*)
(* ****** ****** *)

(*
#staload
"./../SATS/optn.sats"
*)

(* ****** ****** *)
//
#impltmp
<>(*tmp*)
optn_nil_
() = optn_nil()
#impltmp
<a>(*tmp*)
optn_cons_
(x0) = optn_cons(x0)
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
optn_nilq(xs) =
(
case+ xs of
| optn_nil() => true
| optn_cons(x0) => false)
#impltmp
<>(*tmp*)
optn_consq(xs) =
(
case+ xs of
| optn_nil() => false
| optn_cons(x0) => (true))
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
optn_length(xs) =
(
case+ xs of
| none() => 0 | some(x0) => 1
)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
optn_forall(xs) =
(
case+ xs of
|
optn_nil() => true
|
optn_cons(x0) => forall$test<a>(x0))
//
#impltmp
<a>(*tmp*)
optn_foreach(xs) =
(
case+ xs of
|
optn_nil() => ((*0*))
|
optn_cons(x0) => foreach$work<a>(x0))
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
optn_rforall(xs) =
(
case+ xs of
|
optn_nil() => true
|
optn_cons(x0) => rforall$test<a>(x0))
//
#impltmp
<a>(*tmp*)
optn_rforeach(xs) =
(
case+ xs of
|
optn_nil() => ((*0*))
|
optn_cons(x0) => rforeach$work<a>(x0))
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
optn_listize(xs) =
(
case+ xs of
|
optn_nil() => list_vt_nil()
|
optn_cons(x0) => list_vt_sing(x0))
//
#impltmp
<a>(*tmp*)
optn_strmize(xs) =
$llazy
(
case+ xs of
|
optn_nil() => strmcon_vt_nil()
|
optn_cons(x0) => strmcon_vt_sing(x0))
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
optn_rlistize(xs) =
(
case+ xs of
|
optn_nil() => list_vt_nil()
|
optn_cons(x0) => list_vt_sing(x0))
//
(* ****** ****** *)

#impltmp
<x0><y0>
optn_map(xs) =
(
optn_vt2t(optn_map_vt(xs)))
//
#impltmp
<x0><y0>
optn_map_vt(xs) =
(
case+ xs of
|
optn_nil() =>
optn_vt_nil()
|
optn_cons(x0) =>
optn_vt_cons(map$fopr<x0><y0>(x0))
) (*case+*) // end of [optn_map_vt]

(* ****** ****** *)

#impltmp
<a>(*tmp*)
optn_copy_vt(xs) =
(
case+ xs of
| optn_nil() => optn_vt_nil()
| optn_cons(x0) => optn_vt_cons(x0)
) (* end of [optn_copy_vt] *)

(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)
//
(*
(*
HX-2022-06-24:
The following code
is moved into synoug0.dats.
*)
#impltmp
{a:t0}
g_print<optn(a)> =
gseq_print<optn(a)><a>
//
#impltmp
{a:t0}
gseq_print$beg
<optn(a)><a>() = strn_print("(")
#impltmp
{a:t0}
gseq_print$end
<optn(a)><a>() = strn_print(")")
*)
//
(* ****** ****** *)

#impltmp
{a:t0}//tmp
gseq_forall<optn(a)><a> = optn_forall<a>
#impltmp
{a:t0}//tmp
gseq_foreach<optn(a)><a> = optn_foreach<a>
#impltmp
{a:t0}//tmp
gseq_rforall<optn(a)><a> = optn_rforall<a>
#impltmp
{a:t0}//tmp
gseq_rforeach<optn(a)><a> = optn_rforeach<a>

(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_optn000.dats] *)
