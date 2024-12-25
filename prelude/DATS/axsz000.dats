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
Sun 11 Aug 2024 05:30:58 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ vt:vt }
g_ptype
<a1sz(vt)>
( (*void*) ) =
(
pstrn("a1sz(");
g_ptype<vt>((*0*)); pstrn(")"))
//
#impltmp
{ vt:vt }
g_ptype
<a2sz(vt)>
( (*void*) ) =
(
pstrn("a2sz(");
g_ptype<vt>((*0*)); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_print<a1sz(a)>
  ( xs ) =
let
//
#vwtpdef x0 = (a)
#typedef xs = a1sz(a)
//
#impltmp
gseq_sep<xs><x0>() = ","
#impltmp
gseq_end<xs><x0>() = ")"
#impltmp
gseq_beg<xs><x0>() = "a1sz("
//
in//let
(
  gseq_print1<xs><x0>(xs) )
end//let//end(g_print<a1sz(a)>)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gasz_length
<a1sz(x0)><x0> = a1sz_length<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
a1sz_get$at =
$UN.gasz_get$at$raw<a1sz(x0)><x0>
#impltmp
< x0:t0 >
a1sz_set$at =
$UN.gasz_set$at$raw<a1sz(x0)><x0>
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
a1sz_cget$at =
$UN.gasz_cget$at$raw<a1sz(x0)><x0>
#impltmp
< x0:vt >
a1sz_setf$at =
$UN.gasz_setf$at$raw<a1sz(x0)><x0>
//
(* ****** ****** *)
//
#impltmp
{ x0:vt }
$UN.gasz_lget$at$raw
<  a1sz(x0)  >< x0 >
 ( A, i ) = a1sz_lget$at<x0>(A, i)
#impltmp
{ x0:vt }
$UN.gasz_lset$at$raw
<  a1sz(x0)  >< x0 >
( pf | A,i,x ) = a1sz_lset$at<x0>(pf | A,i,x)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-06:
Fri 06 Sep 2024 04:39:23 PM EDT
*)
//
#impltmp
< a: t0 >
a1sz_make_list
  ( xs ) =
a1sz_fmake_fwork<a>
(
lam(work) => GSEQ(xs).foritm(work))
//
(* ****** ****** *)
//
#impltmp
< a: t0 >
a1sz_make_ncpy
  (n, x) =
a1sz_fmake_fwork<a>
(
lam(work) =>
GSEQ(n).foritm(lam(i) => work( x )))
//
#impltmp
< a: vt >
a1sz_make_nfun
  (n, f) =
a1sz_fmake_fwork<a>
(
lam(work) =>
GSEQ(n).foritm(lam(i) => work(f(i))))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
a1sz_make_lstrm
  ( xs ) =
a1sz_fmake_fwork<a>
(
lam(work) =>
(
  strm_vt_foritm0$f1un<a>(xs, work)))
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_axsz000.dats] *)
