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
Sun 21 Jul 2024 01:21:25 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/Array.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
#typedef
jsa(a:vt) = jsarray(a)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_print<jsa(a)>
  ( xs ) =
let
//
#vwtpdef x0 = (a)
#typedef xs = jsa(a)
//
#impltmp
gseq_sep<xs><x0>() = ","
#impltmp
gseq_end<xs><x0>() = ")"
#impltmp
gseq_beg<xs><x0>() = "jsarray("
in//let
  gseq_print1<xs><x0>(xs)
end//end-of-[g_print<jsa(a)>]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_make_ncpy
  (n, x) =
(
XATS2JS_jsarray_make_ncpy
  (n, x)) where
{
#extern
fun
XATS2JS_jsarray_make_ncpy
 {a:t0}
( n
: nint
, x:( a )): jsa(a) = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_make_nfun
  (n, f) =
jsarray
(nint_map_lstrm_f1un<>(n, f))
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_make0_1val
  ( x1 ) =
(
XATS2JS_jsarray_make0_1val
  (x1)) where
{
#extern
fun
XATS2JS_jsarray_make0_1val
 {a:vt}
( x1: (a)): jsa(a) = $extnam()
}
//
#impltmp
<(*tmp*)>
jsarray_make0_2val
  (x1, x2) =
(
XATS2JS_jsarray_make0_2val
  (x1, x2)) where
{
#extern
fun
XATS2JS_jsarray_make0_2val
 {a:vt}
( x1: (a)
, x2: (a)): jsa(a) = $extnam()
}
//
#impltmp
<(*tmp*)>
jsarray_make0_3val
  (x1, x2, x3) =
(
XATS2JS_jsarray_make0_3val
  (x1, x2, x3)) where
{
#extern
fun
XATS2JS_jsarray_make0_3val
 {a:vt}
( x1: (a)
, x2: (a)
, x3: (a)): jsa(a) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_length
  ( A ) =
(
XATS2JS_jsarray_length(A)
) where
{
#extern
fun
XATS2JS_jsarray_length
 {a:vt}
(A: jsa(a)): nint = $extnam()
}
//
#impltmp
{ x0:t0 }
gseq_length
<jsa(x0)><x0> = jsarray_length<>{x0}
#impltmp
{ x0:vt }
gasz_length
<jsa(x0)><x0> = jsarray_length<>{x0}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-24:
Wed 24 Jul 2024 09:09:12 PM EDT
*)
//
#impltmp
<(*tmp*)>
jsarray_get$at
  {a}(A, i) =
(
XATS2JS_jsarray_get$at
  (A, i)) where
{
#extern
fun
XATS2JS_jsarray_get$at
{a:t0}
(A: jsa(a), i: nint): (a) = $extnam()
}
//
#impltmp
<(*tmp*)>
jsarray_set$at
  {a}(A, i, x) =
(
XATS2JS_jsarray_set$at
  (A, i, x)) where
{
#extern
fun
XATS2JS_jsarray_set$at
{a:t0}
(A: jsa(a), i:nint, x:a): void = $extnam()
}
//
#impltmp
{ x0:t0 }
gasz_get$at
<jsa(x0)><x0> =
jsarray_get$at<>{x0}//HX:safe
#impltmp
{ x0:t0 }
gasz_set$at
<jsa(x0)><x0> =
jsarray_set$at<>{x0}//HX:safe
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
$UN.gasz_get$at$raw
<jsa(x0)><x0>(A, i) =
jsarray_get$at<>{x0}(A, i)
(*where*)//end-[gasz_get$at$raw(...)]
//
#impltmp
{ x0:t0 }
$UN.gasz_set$at$raw
<jsa(x0)><x0>(A, i, x) =
jsarray_set$at<>{x0}(A, i, x)
(*where*)//end-of-[gasz_set$at$raw(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-09:
How can we avoid
writing these boilerplates?
*)
//
#impltmp
{ x0:t0 }
gseq_strmize
<jsa(x0)><x0> =
gasz_strmize<jsa(x0)><x0>
#impltmp
{ x0:vt }
gseq_strmize1
<jsa(x0)><x0> =
gasz_strmize<jsa(x0)><x0>
//
#impltmp
{ x0:t0 }
gseq_rstrmize
<jsa(x0)><x0> =
gasz_rstrmize<jsa(x0)><x0>
#impltmp
{ x0:vt }
gseq_rstrmize1
<jsa(x0)><x0> =
gasz_rstrmize<jsa(x0)><x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< x0:vt >
jsarray_forall
  ( A ) =
nint_forall<>
(
jsarray_length<>(A)) where
{
#impltmp
forall$test
<nint>( i0 ) =
forall$test0<x0>
(jsarray_get$at<x0>(A, i0))}
*)
//
#impltmp
{ x0:t0 }
gasz_forall
<jsa(x0)><x0>
  ( A ) =
jsarray_forall_f1un
<  (*tmp*)  >{  x0  }
( A
, lam(x) =>
  forall$test1<x0>(x) )
//
#impltmp
{ x0:t0 }
gseq_forall
<jsa(x0)><x0>
  ( A ) =
(
gasz_forall<jsa(x0)><x0>(A)
) where
{
#impltmp
forall$test1<x0> = forall$test<x0>
}
//
#impltmp
{ x0:vt }
gseq_forall1
<jsa(x0)><x0> =
gasz_forall<jsa(x0)><x0>
//
#impltmp
<(*tmp*)>
jsarray_forall_f1un
  (A, test) =
(
XATS2JS_jsarray_forall_f1un
  (A, test)) where
{
#extern
fun
XATS2JS_jsarray_forall_f1un
 {a:vt}
( A: jsa(a)
, test: (!a) -> bool): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_rforall
<jsa(x0)><x0>
  ( A ) =
jsarray_rforall_f1un
<  (*tmp*)  >{  x0  }
( A
, lam(x) =>
  rforall$test<x0>(x) )
//
#impltmp
{ x0:t0 }
gasz_rforall
<jsa(x0)><x0>
  ( A ) =
jsarray_rforall_f1un
<  (*tmp*)  >{  x0  }
( A
, lam(x) =>
  rforall$test1<x0>(x) )
//
#impltmp
{ x0:vt }
gseq_rforall1
<jsa(x0)><x0> =
gasz_rforall<jsa(x0)><x0>
//
#impltmp
<(*tmp*)>
jsarray_rforall_f1un
  (A, test) =
(
XATS2JS_jsarray_rforall_f1un
  (A, test)) where
{
#extern
fun
XATS2JS_jsarray_rforall_f1un
 {a:vt}
( A: jsa(a)
, test: (!a) -> bool): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gasz_iforall
<jsa(x0)><x0>
  ( A ) =
jsarray_iforall_f2un
<  (*tmp*)  >{  x0  }
( A
, lam(i, x) =>
  iforall$test1<x0>(i, x) )
//
#impltmp
{ x0:t0 }
gseq_iforall
<jsa(x0)><x0>
  ( A ) =
(
gasz_iforall<jsa(x0)><x0>(A)
) where
{
#impltmp
iforall$test1<x0> = iforall$test<x0>
}
//
#impltmp
{ x0:vt }
gseq_iforall1
<jsa(x0)><x0> =
gasz_iforall<jsa(x0)><x0>
//
#impltmp
<(*tmp*)>
jsarray_iforall_f2un
  (A, test) =
(
XATS2JS_jsarray_iforall_f2un
  (A, test)) where
{
#extern
fun
XATS2JS_jsarray_iforall_f2un
 {a:vt}
( A: jsa(a)
, test
: (nint, !a) -> bool): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_mapref_f1un
  (A, fopr) =
(
XATS2JS_jsarray_mapref_f1un
  (A, fopr)) where
{
#extern
fun
XATS2JS_jsarray_mapref_f1un
 {a:vt}
( A: jsa(a)
, fopr: (~a) -> (a)): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: vt >
jsarray_sortref
  ( A ) =
(
jsarray_sortref_f2un<>
(A, lam(x,y)=>g_cmp11<a>(x, y)))
//
(*
#impltmp
{ x0:vt }
gasz_sortref
<jsa(x0)><x0> =
jsarray_sortref<x0>(*void*)
#impltmp
{ x0:vt }
gasz_sortref0
<jsa(x0)><x0> =
jsarray_sortref<x0>(*void*)
#impltmp
{ x0:vt }
gasz_sortref1
<jsa(x0)><x0> =
jsarray_sortref<x0>(*void*)
*)
//
#impltmp
<(*tmp*)>
jsarray_sortref_f2un
  (A, cmpr) =
(
XATS2JS_jsarray_sortref_f2un
  (A, cmpr)) where
{
#extern
fun
XATS2JS_jsarray_sortref_f2un
 {a:vt}
( A: jsa(a)
, cmpr
: (!a, !a) -> sint): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-25:
Thu 25 Jul 2024 03:08:18 PM EDT
*)
//
#impltmp
<(*tmp*)>
jsarray_make0_lstrm
  {a:vt}( xs ) =
(
jsarray_fmake_fwork<>
(lam(work) => xs.foritm0(work)))
//
#impltmp
{ x0:vt }
g_make0_lstrm
<x0><jsa(x0)>(xs) =
(
  jsarray_make0_lstrm<>{x0}(xs))
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_fmake_fwork
  (fwork) =
(
XATS2JS_jsarray_fmake_fwork
  (fwork)) where
{
#extern
fun
XATS2JS_jsarray_fmake_fwork
 {a:vt}
(fwork: fwork(a)): jsa(a) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_DATS_Array00.dats] *)
