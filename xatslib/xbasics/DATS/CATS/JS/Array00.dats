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
(*
Sat 20 Jul 2024 09:41:27 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08:
JS arrays are dynamic!
So we cannot have the
an index type for capturing
the size of such an array.
*)
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
(* ****** ****** *)
#abstbox
jsarray_tbox(a:vt)
#absvtbx
jsarray_vtbx(a:vt)
(* ****** ****** *)
#typedef
jsarray
(a: vt) = jsarray_tbox(a)
#vwtpdef
jsarray_vt
(a: vt) = jsarray_vtbx(a)
(* ****** ****** *)
#typedef
jsa0(a:vt) = jsarray(a)
#vwtpdef
jsla(a:vt) = jsarray_vt(a)
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
#extern
fcast
jsarray_vt2t
{a:vt}(A:jsla(a)): jsa0(a)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_ptype
<jsa0(a)>
( (*void*) ) =
(
pstrn"jsarray(";
g_ptype<a>();pstrn")")
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_print
<jsa0(a)>
  ( xs ) =
let
//
#vwtpdef x0 = (a)
#typedef xs = jsa0(a)
//
#impltmp
gseq_sep<xs><x0>() = ","
#impltmp
gseq_end<xs><x0>() = ")"
#impltmp
gseq_beg<xs><x0>() = "jsarray("
in//let
  gseq_print1<xs><x0>(xs)
end(*let*)//end(g_print<jsa0(a)>)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_forall
<jsa0(a)> =
gasz_forall<jsa0(a)><a>
//
#impltmp
{ a: vt }
g_foritm
<jsa0(a)> =
gseq_foritm1<jsa0(a)><a>
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsarray_length
{a:vt}(A:jsa0(a)): nint
//
#impltmp
{ x0:t0 }
gseq_length
<jsa0(x0)><x0> =
jsarray_length<>{x0}(*void*)
#impltmp
{ x0:vt }
gasz_length
<jsa0(x0)><x0> =
jsarray_length<>{x0}(*void*)
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
(A:jsa0(a)): nint = $extnam()
}
//
#symload length with jsarray_length of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsarray_make_ncpy
{a:t0}(n0:nint, x0:a): jsa0(a)
//
#extern
fun<>
jsarray_make_nfun
{a:vt}{n:n0}
(n0: sint(n)
,f0: nintlt(n) -> (a)): jsa0(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsarray_make0_1val
 {a:vt}( x1: (a) ): jsa0(a)
#extern
fun<>
jsarray_make0_2val
 {a:vt}( x1:a, x2:a ): jsa0(a)
#extern
fun<>
jsarray_make0_3val
 {a:vt}( x1:a, x2:a, x3:a ): jsa0(a)
//
#symload
jsarray_1val with jsarray_make0_1val of 1000
#symload
jsarray_2val with jsarray_make0_2val of 1000
#symload
jsarray_3val with jsarray_make0_3val of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-25:
[fwork] may be linear
in the future!
*)
#typedef
fwork(a:vt) =
((~a)->void)->void
//
#extern
fun<>
jsarray_fmake_fwork
{a:vt}
(fwork: fwork(a)): jsa0(a)
//
#symload
jsarray with jsarray_fmake_fwork of 1000
//
(* ****** ****** *)
//
#extern
fun<>
jsarray_make0_lstrm
 {a:vt}
(xs: ~strm_vt(a)):jsa0(a)
#extern
fun<>
jsarray_make0_lstrq
 {a:vt}
(xs: ~strq_vt(a)):jsa0(a)
//
#symload
jsarray with jsarray_make0_lstrm of 1000
#symload
jsarray with jsarray_make0_lstrq of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsarray_get$at
 {a:t0}//HX: t0(not vt)
(A:jsa0(a), i:nint): (a)
#extern
fun<>
jsarray_set$at
 {a:t0}//HX: t0(not vt)
(A:jsa0(a), i:nint, x:a): void
//
#symload get$at with jsarray_get$at of 1000
#symload set$at with jsarray_set$at of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsarray_forall_f1un
 {a:vt}
( A
: jsa0(a)
, test: (!a) -> bool): bool
#symload
forall with jsarray_forall_f1un of 1000
//
#extern
fun<>
jsarray_rforall_f1un
 {a:vt}
( A
: jsa0(a)
, test: (!a) -> bool): bool
#symload
rforall with jsarray_rforall_f1un of 1000
//
#extern
fun<>
jsarray_iforall_f2un
 {a:vt}
( A
: jsa0(a)
, test: (nint, !a) -> bool): bool
#symload
iforall with jsarray_iforall_f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsarray_mapref_f1un
 {a:vt}
( A
: jsa0(a)
, fopr: (~a) -> (a)): void
#extern
fun<>
jsarray_imapref_f1un
 {a:vt}
( A
: jsa0(a)
, fopr: (ni, ~a) -> (a)): void
//
#symload
mapref with jsarray_mapref_f1un of 1000
#symload
imapref with jsarray_imapref_f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<a:vt>
jsarray_sortref
( A: jsa0(a) ): void
#extern
fun<>
jsarray_sortref_f2un
 {a:vt}
( A
: jsa0(a)
, cmpr: (!a, !a) -> sint): void
//
#symload
sortref with jsarray_sortref of 1000
#symload
sortref with jsarray_sortref_f2un of 1000
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
 {a:vt}
(n:nint, x:a): jsa0(a) = $extnam()
}
//
(* ****** ****** *)
//
(*
HX-2024-08-13:
Maybe too inefficient!
#impltmp
<(*tmp*)>
jsarray_make_nfun
  (n, f) =
jsarray
(nint_map_lstrm_f1un<>(n, f))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_make0_1val
  ( x1 ) =
(
XATS2JS_jsarray_make0_1val
  ( x1 )) where
{
#extern
fun
XATS2JS_jsarray_make0_1val
{a:vt}
(x1: (a)): jsa0(a) = $extnam()
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
(x1: (a)
,x2: (a)): jsa0(a) = $extnam()
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
(x1: (a)
,x2: (a)
,x3: (a)): jsa0(a) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_make_nfun
  (n, f) =
(
XATS2JS_jsarray_make_nfun
  (n, f)) where
{
#extern
fun
XATS2JS_jsarray_make_nfun
{a:vt}{n:n0}
(n:sint(n)
,f:nintlt(n)->(a)): jsa0(a) = $extnam()
}
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
{ x0:t0 }
gasz_get$at
<jsa0(x0)><x0> =
jsarray_get$at<>{x0}(*void*)
#impltmp
{ x0:t0 }
gasz_set$at
<jsa0(x0)><x0> =
jsarray_set$at<>{x0}(*void*)
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
(A:jsa0(a), i:nint): (a) = $extnam()
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
(A:jsa0(a),i:nint,x:a): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
$UN.gasz_get$at$raw
<jsa0(x0)><x0>(A, i) =
jsarray_get$at<>{x0}(A, i)
(*where*)//end-[gasz_get$at$raw(...)]
//
#impltmp
{ x0:t0 }
$UN.gasz_set$at$raw
<jsa0(x0)><x0>(A, i, x) =
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
gseq_strmize0
<jsa0(x0)><x0> =
gasz_strmize<jsa0(x0)><x0>(*0*)
#impltmp
{ x0:vt }
gseq_strmize1
<jsa0(x0)><x0> =
gasz_strmize<jsa0(x0)><x0>(*0*)
//
#impltmp
{ x0:t0 }
gseq_rstrmize0
<jsa0(x0)><x0> =
gasz_rstrmize<jsa0(x0)><x0>(*0*)
#impltmp
{ x0:vt }
gseq_rstrmize1
<jsa0(x0)><x0> =
gasz_rstrmize<jsa0(x0)><x0>(*0*)
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
<jsa0(x0)><x0>
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
<jsa0(x0)><x0>
  ( A ) =
(
gasz_forall<jsa0(x0)><x0>(A)
) where
{
#impltmp
forall$test1<x0> = forall$test<x0>
}
//
#impltmp
{ x0:vt }
gseq_forall1
<jsa0(x0)><x0> =
gasz_forall<jsa0(x0)><x0>(*0*)
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
( A
: jsa0(a)
, test: (!a) -> bool): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_rforall
<jsarray(x0)><x0>
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
<jsarray(x0)><x0>
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
<jsa0(x0)><x0> =
gasz_rforall<jsa0(x0)><x0>
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
( A
: jsa0(a)
, test: (!a) -> bool): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gasz_iforall
<jsa0(x0)><x0>
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
<jsa0(x0)><x0>
  ( A ) =
(
gasz_iforall<jsa0(x0)><x0>(A)
) where
{
#impltmp
iforall$test1<x0> = iforall$test<x0>
}
//
#impltmp
{ x0:vt }
gseq_iforall1
<jsa0(x0)><x0> =
gasz_iforall<jsa0(x0)><x0>
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
( A
: jsa0(a)
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
( A
: jsa0(a)
, fopr: (~a) -> (a)): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_imapref_f1un
  (A, fopr) =
(
XATS2JS_jsarray_imapref_f1un
  (A, fopr)) where
{
#extern
fun
XATS2JS_jsarray_imapref_f1un
 {a:vt}
( A
: jsa0(a)
, fopr: (ni, ~a) -> (a)): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
{ x0:vt }
gasz_sortref
<jsa0(x0)><x0> =
jsarray_sortref<x0>(*void*)
#impltmp
{ x0:vt }
gasz_sortref0
<jsa0(x0)><x0> =
jsarray_sortref<x0>(*void*)
#impltmp
{ x0:vt }
gasz_sortref1
<jsa0(x0)><x0> =
jsarray_sortref<x0>(*void*)
*)
//
#impltmp
< a: vt >
jsarray_sortref
  ( A ) =
(
jsarray_sortref_f2un<>
(A, lam(x,y)=>g_cmp11<a>(x, y)))
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
( A
: jsa0(a)
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
<x0><jsa0(x0)>(xs) =
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
(fwork: fwork(a)): jsa0(a) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_append<jsa0(a)> =
gseq_append00<jsa0(a)><a><jsa0(a)>
//
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_prepend<jsa0(a)> =
gseq_prepend00<jsa0(a)><a><jsa0(a)>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-202-07-29:
Mon 29 Jul 2024 07:59:38 AM EDT
*)
//
#extern
fun<a:vt>
jsarray_sum(A: jsa0(a)): (a)
#extern
fun<a:vt>
jsarray_prod(A: jsa0(a)): (a)
#impltmp
< a: vt >
jsarray_sum = gseq_sum0<jsa0(a)><a>
#symload sum with jsarray_sum of 1000
#impltmp
< a: vt >
jsarray_prod = gseq_prod0<jsa0(a)><a>
#symload prod with jsarray_prod of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
//
HX-2024-08-09:
This seems to be a convenient
style compared to the one below
Fri 09 Aug 2024 11:57:45 AM EDT
//
#extern
fun
<a:vt>
jarray_listize =
gasz_listize<jsa0(a)><a>
#symload listize with jarray_listize of 1000
//
*)
//
#extern
fun
<a:vt>
jsarray_listize
( A0:jsa0( a )): list_vt(a)
#impltmp
< a: vt >
jsarray_listize
 ( xs ) =
(
  gasz_listize<jsa0(a)><a>(xs))
#symload listize with jsarray_listize of 1000
//
(* ****** ****** *)
//
#extern
fun
<a:vt>
jsarray_strmize
( A0:jsa0( a )): strm_vt(a)
#impltmp
< a: vt >
jsarray_strmize
 ( xs ) =
(
  gasz_strmize<jsa0(a)><a>(xs))
#symload strmize with jsarray_strmize of 1000
//
#extern
fun
<a:vt>
jsarray_strqize
( A0:jsa0( a )): strq_vt(a)
#impltmp
< a: vt >
jsarray_strqize
 ( xs ) =
(
  gasz_strqize<jsa0(a)><a>(xs))
#symload strqize with jsarray_strqize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-29:
Mon 29 Jul 2024 11:19:25 PM EDT
*)
//
#extern
fcast // fun
GSEQ_make_jsarray
{a:t0}
(A:jsa0(a)): GSEQ(jsa0(a), a)
#symload GSEQ with GSEQ_make_jsarray of 1000
//
#extern
fcast // fun
GASZ_make_jsarray
{a:vt}
(A:jsa0(a)): GASZ(jsa0(a), a)
#symload GASZ with GASZ_make_jsarray of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
//
(*
HX-2024-08-09:
Fri 09 Aug 2024 08:24:11 AM EDT
*)
//
#absvwtp
jsarray_iter(a:vt)
//
#impltmp
{ a: vt }
g_ptype
<
jsarray_iter(a)>
(   (*void*)   ) =
(
pstrn
"jsarray_iter(";
g_ptype<a>();pstrn")")
//
(* ****** ****** *)
//
(*
HX-2024-08-14:
This one is like
lazy [jsarray_iforitm]
*)
//
#extern
fun<>
jsarray_iter_make
 {a:vt}
( A
: jsarray(a)): jsarray_iter(a)
//
#extern
fun<>
jsarray_iter_next$work
 {a:vt}
( iter:
! jsarray_iter(a)
, work: (nint, !a) -> void): bool
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsarray_iter_make
  ( A ) =
(
XATS2JS_jsarray_iter_make
  ( A )) where
{
#extern
fun
XATS2JS_jsarray_iter_make
 {a:vt}
( A
: jsarray(a)): jsarray_iter(a) = $extnam()
}
#symload
jsarray_iter with jsarray_iter_make of 1000
//
#impltmp
<(*tmp*)>
jsarray_iter_next$work
  (iter, work) =
(
XATS2JS_jsarray_iter_next$work
  (iter, work)) where
{
#extern
fun
XATS2JS_jsarray_iter_next$work
 {a:vt}
( iter:
! jsarray_iter(a)
, work: (nint, !a) -> void): bool = $extnam()
}
//
#symload next$work with jsarray_iter_next$work of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_DATS_CATS_JS_Array00.dats] *)
