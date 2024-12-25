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
Mon 12 Aug 2024 09:58:00 PM EDT
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
< x0:vt >
a1sz_strmize =
gasz_strmize<a1sz(x0)><x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_strmize
<a1sz(x0)><x0> =
gasz_strmize<a1sz(x0)><x0>(*void*)
#impltmp
{ x0:vt }
gseq_strmize1
<a1sz(x0)><x0> =
gasz_strmize<a1sz(x0)><x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_forall<a1sz(a)> =
gasz_forall<a1sz(a)><a>
//
#impltmp
{ a: vt }
g_foritm<a1sz(a)> =
gseq_foritm1<a1sz(a)><a>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
a1sz_forall =
gasz_forall<a1sz(x0)><x0>
#impltmp
< x0:vt >
a1sz_forall$f1un
  (A, test) =
(
a1sz_forall<x0>(A)) where
{
#impltmp
forall$test1<x0>(x0) = test(x0)
}(*where*)//end(a1sz_forall$f1un)
//
#impltmp
{ x0:t0 }
gseq_forall
<a1sz(x0)><x0>
  ( A ) =
(
a1sz_forall<x0>(A)) where
{
#impltmp
forall$test1<x0> = forall$test<x0>
}
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
a1sz_rforall =
gasz_rforall<a1sz(x0)><x0>
#impltmp
{ x0:vt }
a1sz_rforall$f1un
  (A, test) =
(
a1sz_rforall<x0>(A)) where
{
#impltmp
rforall$test1<x0>(x0) = test(x0)
}(*where*)//end(a1sz_rforall$f1un)
//
#impltmp
{ x0:t0 }
gseq_rforall
<a1sz(x0)><x0>
  ( A ) =
(
a1sz_rforall<x0>(A)) where
{
#impltmp
rforall$test1<x0> = rforall$test<x0>
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
a1sz_mapref =
gasz_mapref<a1sz(x0)><x0>(*void*)
#impltmp
< x0:vt >
a1sz_mapref_c1bv =
gasz_mapref_c1bv<a1sz(x0)><x0>(*void*)
//
#impltmp
< x0:vt >
a1sz_imapref =
gasz_imapref<a1sz(x0)><x0>(*void*)
#impltmp
< x0:vt >
a1sz_imapref_c2bv =
gasz_imapref_c2bv<a1sz(x0)><x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-17:
Sat 17 Aug 2024 07:31:59 PM EDT
#impltmp
<(*tmp*)>
a1sz_fmake_fwork(fwork) = (* ...... *)
HX-2024-08-17: Externally!
For instance, one JS version
can be found in [DATS/CATS/JS/axsz000.dats]
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
< y0:vt >
gasz_map_a1sz
  ( xs ) =
let
//
val n0 =
gasz_length
<xs><x0>(xs)
//
in//let
//
a1sz_make_nfun<y0>
(
n0,
//
lam(i0):y0 =>
let
val y0 =
map$fopr1<x0><y0>(x0)
prval () =
owed_vt_return0{x0}(pf, x0) in y0
end//endof(let)
where {
val//val
(pf|x0) =
$UN.gasz_lget$at$raw<xs><x0>(xs,i0)
// end-of-[val(...)]
}(*where*)//end-of-[lam]
//
)(*end-of-[a1sz_make_nfun(n0, ...)]*)
//
end(*let*)//end-of-[gasz_map_a1sz(xs)]
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:vt >
< y0:vt >
gasz_map$f1un_a1sz
  (xs, fopr) =
(
  gasz_map_a1sz(xs))
where
{
#impltmp
map$fopr1<x0><y0>(x0) = fopr(  x0  ) }
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_axsz001.dats] *)
