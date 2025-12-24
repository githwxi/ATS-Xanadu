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
#staload
UN = "prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
#abstbox jsdasz_tbox(a:vt)
#absvtbx jsdasz_vtbx(a:vt)
(* ****** ****** *)
#sexpdef jsa1 = jsdasz_tbox
#sexpdef jsla = jsdasz_vtbx
(* ****** ****** *)
#typedef
jsdasz(a: vt) = jsdasz_tbox(a)
#vwtpdef
jsdasz_vt(a: vt) = jsdasz_vtbx(a)
(* ****** ****** *)
(* ****** ****** *)
#extern
fcast
jsdasz_vt2t{a:vt}(A:jsla(a)): jsa1(a)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_ptype
<jsa1(a)>
( (*void*) ) =
(
pstrn
"jsdasz(";
g_ptype<a>();pstrn")")
//end-of-(impltmp(g_ptype<jsa1(a)>))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_print
<jsa1(a)>
  ( xs ) =
let
//
#vwtpdef x0 = (a)
#typedef xs = jsa1(a)
//
#impltmp
gseq_sep<xs><x0>() = ","
#impltmp
gseq_end<xs><x0>() = ")"
#impltmp
gseq_beg<xs><x0>() = "jsdasz("
in//let
  gseq_print1<xs><x0>(xs)
end(*let*)//end(impltmp(g_print<jsa1(a)>))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_forall
<jsa1(a)> =
gasq_forall<jsa1(a)><a>
//
#impltmp
{ a: vt }
g_foritm
<jsa1(a)> =
gseq_foritm1<jsa1(a)><a>
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsdasz_length
{a:vt}(A:jsa1(a)): nint
//
#impltmp
{ x0:t0 }
gseq_length
<jsa1(x0)><x0> =
jsdasz_length<>{x0}(*void*)
#impltmp
{ x0:vt }
gasq_length
<jsa1(x0)><x0> =
jsdasz_length<>{x0}(*void*)
//
#impltmp
<(*tmp*)>
jsdasz_length
  ( A ) =
(
XATS2JS_jsdasz_length(A)
) where
{
#extern
fun
XATS2JS_jsdasz_length
 {a:vt}
(A:jsa1(a)): nint = $extnam()
}
//
#symload
length with jsdasz_length of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsdasz_make_ncpy
{a:t0}(n0:nint, x0:a): jsa1(a)
//
#extern
fun<>
jsdasz_make_nfun
{a:vt}{n:n0}
(n0: sint(n)
,f0: nintlt(n) -> (a)): jsa1(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsdasz_make0_1val
 {a:vt}( x1: (a) ): jsa1(a)
#extern
fun<>
jsdasz_make0_2val
 {a:vt}( x1:a, x2:a ): jsa1(a)
#extern
fun<>
jsdasz_make0_3val
 {a:vt}( x1:a, x2:a, x3:a ): jsa1(a)
//
#symload
jsdasz_1val with jsdasz_make0_1val of 1000
#symload
jsdasz_2val with jsdasz_make0_2val of 1000
#symload
jsdasz_3val with jsdasz_make0_3val of 1000
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
((~a) -> void) -> void
//
#extern
fun<>
jsdasz_fmake_fwork
{a:vt}
(fwork: fwork(a)): jsa1(a)
//
#symload
jsdasz with jsdasz_fmake_fwork of 1000
//
(* ****** ****** *)
//
#extern
fun<>
jsdasz_make0_lstrm
 {a:vt}
(xs: ~strm_vt(a)):jsa1(a)
#extern
fun<>
jsdasz_make0_lstrq
 {a:vt}
(xs: ~strq_vt(a)):jsa1(a)
//
#symload
jsdasz with jsdasz_make0_lstrm of 1000
#symload
jsdasz with jsdasz_make0_lstrq of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsdasz_get$at
 {a:t0}//HX: t0(not vt)
(A:jsa1(a), i:nint): (a)
#extern
fun<>
jsdasz_set$at
 {a:t0}//HX: t0(not vt)
(A:jsa1(a), i:nint, x:a): void
//
#symload
get$at with jsdasz_get$at of 1000
#symload
set$at with jsdasz_set$at of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsdasz_forall$f1un
 {a:vt}
( A
: jsa1(a)
, test: (!a) -> bool): bool
#symload
forall with jsdasz_forall$f1un of 1000
//
#extern
fun<>
jsdasz_rforall$f1un
 {a:vt}
( A
: jsa1(a)
, test: (!a) -> bool): bool
#symload
rforall with jsdasz_rforall$f1un of 1000
//
#extern
fun<>
jsdasz_iforall$f2un
 {a:vt}
( A
: jsa1(a)
, test: (nint, !a) -> bool): bool
#symload
iforall with jsdasz_iforall$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
jsdasz_mapref$f1un
 {a:vt}
( A
: jsa1(a)
, fopr: (~a) -> (a)): void
#extern
fun<>
jsdasz_imapref$f1un
 {a:vt}
( A
: jsa1(a)
, fopr: (ni, ~a) -> (a)): void
//
#symload
mapref with jsdasz_mapref$f1un of 1000
#symload
imapref with jsdasz_imapref$f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<a:vt>
jsdasz_sortref
( A: jsa1(a) ): void
#extern
fun<>
jsdasz_sortref$f2un
 {a:vt}
( A
: jsa1(a)
, cmpr: (!a, !a) -> sint): void
//
#symload
sortref with jsdasz_sortref of 1000
#symload
sortref with jsdasz_sortref$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsdasz_make_ncpy
  (n, x) =
(
XATS2JS_jsdasz_make_ncpy
  (n, x)) where
{
#extern
fun
XATS2JS_jsdasz_make_ncpy
 {a:vt}
(n:nint, x:a): jsa1(a) = $extnam()
}
//
(* ****** ****** *)
//
(*
HX-2024-08-13:
Maybe too inefficient!
#impltmp
<(*tmp*)>
jsdasz_make_nfun
  (n, f) =
jsdasz
(nint_map_lstrm$f1un<>(n, f))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsdasz_make0_1val
  ( x1 ) =
(
XATS2JS_jsdasz_make0_1val
  ( x1 )) where
{
#extern
fun
XATS2JS_jsdasz_make0_1val
{a:vt}
(x1: (a)): jsa1(a) = $extnam()
}
//
#impltmp
<(*tmp*)>
jsdasz_make0_2val
  (x1, x2) =
(
XATS2JS_jsdasz_make0_2val
  (x1, x2)) where
{
#extern
fun
XATS2JS_jsdasz_make0_2val
 {a:vt}
(x1: (a)
,x2: (a)): jsa1(a) = $extnam()
}
//
#impltmp
<(*tmp*)>
jsdasz_make0_3val
  (x1, x2, x3) =
(
XATS2JS_jsdasz_make0_3val
  (x1, x2, x3)) where
{
#extern
fun
XATS2JS_jsdasz_make0_3val
 {a:vt}
(x1: (a)
,x2: (a)
,x3: (a)): jsa1(a) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsdasz_make_nfun
  (n, f) =
(
XATS2JS_jsdasz_make_nfun
  (n, f)) where
{
#extern
fun
XATS2JS_jsdasz_make_nfun
{a:vt}{n:n0}
(n:sint(n)
,f:nintlt(n)->(a)): jsa1(a) = $extnam()
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
gasq_get$at
<jsa1(x0)><x0> =
jsdasz_get$at<>{x0}(*void*)
#impltmp
{ x0:t0 }
gasq_set$at
<jsa1(x0)><x0> =
jsdasz_set$at<>{x0}(*void*)
//
#impltmp
<(*tmp*)>
jsdasz_get$at
  {a}(A, i) =
(
XATS2JS_jsdasz_get$at
  (A, i)) where
{
#extern
fun
XATS2JS_jsdasz_get$at
{a:t0}
(A:jsa1(a), i:nint): (a) = $extnam()
}
//
#impltmp
<(*tmp*)>
jsdasz_set$at
  {a}(A, i, x) =
(
XATS2JS_jsdasz_set$at
  (A, i, x)) where
{
#extern
fun
XATS2JS_jsdasz_set$at
{a:t0}
(A:jsa1(a),i:nint,x:a): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
$UN.gasq_get$at$raw
<jsa1(x0)><x0>(A, i) =
jsdasz_get$at<>{x0}(A, i)
(*where*)//end-[gasq_get$at$raw(...)]
//
#impltmp
{ x0:t0 }
$UN.gasq_set$at$raw
<jsa1(x0)><x0>(A, i, x) =
jsdasz_set$at<>{x0}(A, i, x)
(*where*)//end-of-[gasq_set$at$raw(...)]
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
<jsa1(x0)><x0> =
gasq_strmize<jsa1(x0)><x0>(*0*)
#impltmp
{ x0:vt }
gseq_strmize1
<jsa1(x0)><x0> =
gasq_strmize<jsa1(x0)><x0>(*0*)
//
#impltmp
{ x0:t0 }
gseq_rstrmize0
<jsa1(x0)><x0> =
gasq_rstrmize<jsa1(x0)><x0>(*0*)
#impltmp
{ x0:vt }
gseq_rstrmize1
<jsa1(x0)><x0> =
gasq_rstrmize<jsa1(x0)><x0>(*0*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< x0:vt >
jsdasz_forall
  ( A ) =
nint_forall<>
(
jsdasz_length<>(A)) where
{
#impltmp
forall$test
<nint>( i0 ) =
forall$test0<x0>
(jsdasz_get$at<x0>(A, i0))}
*)
//
#impltmp
{ x0:t0 }
gasq_forall
<jsa1(x0)><x0>
  ( A ) =
jsdasz_forall$f1un
<  (*tmp*)  >{  x0  }
( A
, lam(x) =>
  forall$test1<x0>(x) )
//
#impltmp
{ x0:t0 }
gseq_forall
<jsa1(x0)><x0>
  ( A ) =
(
gasq_forall<jsa1(x0)><x0>(A)
) where
{
#impltmp
forall$test1<x0> = forall$test<x0>
}
//
#impltmp
{ x0:vt }
gseq_forall1
<jsa1(x0)><x0> =
gasq_forall<jsa1(x0)><x0>(*0*)
//
#impltmp
<(*tmp*)>
jsdasz_forall$f1un
  (A, test) =
(
XATS2JS_jsdasz_forall$f1un
  (A, test)) where
{
#extern
fun
XATS2JS_jsdasz_forall$f1un
 {a:vt}
( A
: jsa1(a)
, test: (!a) -> bool): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_rforall
<jsdasz(x0)><x0>
  ( A ) =
jsdasz_rforall$f1un
<  (*tmp*)  >{  x0  }
( A
, lam(x) =>
  rforall$test<x0>(x) )
//
#impltmp
{ x0:t0 }
gasq_rforall
<jsdasz(x0)><x0>
  ( A ) =
jsdasz_rforall$f1un
<  (*tmp*)  >{  x0  }
( A
, lam(x) =>
  rforall$test1<x0>(x) )
//
#impltmp
{ x0:vt }
gseq_rforall1
<jsa1(x0)><x0> =
gasq_rforall<jsa1(x0)><x0>
//
#impltmp
<(*tmp*)>
jsdasz_rforall$f1un
  (A, test) =
(
XATS2JS_jsdasz_rforall$f1un
  (A, test)) where
{
#extern
fun
XATS2JS_jsdasz_rforall$f1un
 {a:vt}
( A
: jsa1(a)
, test: (!a) -> bool): bool = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gasq_iforall
<jsa1(x0)><x0>
  ( A ) =
jsdasz_iforall$f2un
<  (*tmp*)  >{  x0  }
( A
, lam(i, x) =>
  iforall$test1<x0>(i, x) )
//
#impltmp
{ x0:t0 }
gseq_iforall
<jsa1(x0)><x0>
  ( A ) =
(
gasq_iforall<jsa1(x0)><x0>(A)
) where
{
#impltmp
iforall$test1<x0> = iforall$test<x0>
}
//
#impltmp
{ x0:vt }
gseq_iforall1
<jsa1(x0)><x0> =
gasq_iforall<jsa1(x0)><x0>
//
#impltmp
<(*tmp*)>
jsdasz_iforall$f2un
  (A, test) =
(
XATS2JS_jsdasz_iforall$f2un
  (A, test)) where
{
#extern
fun
XATS2JS_jsdasz_iforall$f2un
 {a:vt}
( A
: jsa1(a)
, test
: (nint, !a) -> bool): bool = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsdasz_mapref$f1un
  (A, fopr) =
(
XATS2JS_jsdasz_mapref$f1un
  (A, fopr)) where
{
#extern
fun
XATS2JS_jsdasz_mapref$f1un
 {a:vt}
( A
: jsa1(a)
, fopr: (~a) -> (a)): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsdasz_imapref$f1un
  (A, fopr) =
(
XATS2JS_jsdasz_imapref$f1un
  (A, fopr)) where
{
#extern
fun
XATS2JS_jsdasz_imapref$f1un
 {a:vt}
( A
: jsa1(a)
, fopr: (ni, ~a) -> (a)): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
{ x0:vt }
gasq_sortref
<jsa1(x0)><x0> =
jsdasz_sortref<x0>(*void*)
#impltmp
{ x0:vt }
gasq_sortref0
<jsa1(x0)><x0> =
jsdasz_sortref<x0>(*void*)
#impltmp
{ x0:vt }
gasq_sortref1
<jsa1(x0)><x0> =
jsdasz_sortref<x0>(*void*)
*)
//
#impltmp
< a: vt >
jsdasz_sortref
  ( A ) =
(
jsdasz_sortref$f2un<>
(A, lam(x,y)=>g_cmp11<a>(x, y)))
//
#impltmp
<(*tmp*)>
jsdasz_sortref$f2un
  (A, cmpr) =
(
XATS2JS_jsdasz_sortref$f2un
  (A, cmpr)) where
{
#extern
fun
XATS2JS_jsdasz_sortref$f2un
 {a:vt}
( A
: jsa1(a)
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
jsdasz_make0_lstrm
  {a:vt}( xs ) =
(
jsdasz_fmake_fwork<>
(lam(work) => xs.foritm0(work)))
//
#impltmp
{ x0:vt }
g_make0_lstrm
<x0><jsa1(x0)>(xs) =
(
  jsdasz_make0_lstrm<>{x0}(xs))
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsdasz_fmake_fwork
  (fwork) =
(
XATS2JS_jsdasz_fmake_fwork
  (fwork)) where
{
#extern
fun
XATS2JS_jsdasz_fmake_fwork
 {a:vt}
(fwork: fwork(a)): jsa1(a) = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_append<jsa1(a)> =
gseq_append00<jsa1(a)><a><jsa1(a)>
//
(* ****** ****** *)
//
#impltmp
{ a: vt }
g_prepend<jsa1(a)> =
gseq_prepend00<jsa1(a)><a><jsa1(a)>
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
jsdasz_sum(A: jsa1(a)): (a)
#extern
fun<a:vt>
jsdasz_prod(A: jsa1(a)): (a)
#impltmp
< a: vt >
jsdasz_sum = gseq_sum0<jsa1(a)><a>
#symload sum with jsdasz_sum of 1000
#impltmp
< a: vt >
jsdasz_prod = gseq_prod0<jsa1(a)><a>
#symload prod with jsdasz_prod of 1000
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
gasq_listize<jsa1(a)><a>
#symload
listize with jarray_listize of 1000
//
*)
//
#extern
fun
<a:vt>
jsdasz_listize
( A0:jsa1( a )): list_vt(a)
#impltmp
< a: vt >
jsdasz_listize
 ( xs ) =
(
  gasq_listize<jsa1(a)><a>(xs))
#symload
listize with jsdasz_listize of 1000
//
(* ****** ****** *)
//
#extern
fun
<a:vt>
jsdasz_strmize
( A0:jsa1( a )): strm_vt(a)
#impltmp
< a: vt >
jsdasz_strmize
 ( xs ) =
(
  gasq_strmize<jsa1(a)><a>(xs))
#symload
strmize with jsdasz_strmize of 1000
//
#extern
fun
<a:vt>
jsdasz_strqize
( A0:jsa1( a )): strq_vt(a)
#impltmp
< a: vt >
jsdasz_strqize
 ( xs ) =
(
  gasq_strqize<jsa1(a)><a>(xs))
#symload
strqize with jsdasz_strqize of 1000
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
GSEQ_make_jsdasz
{a:t0}
(A:jsa1(a)): GSEQ(jsa1(a), a)
#symload
GSEQ with GSEQ_make_jsdasz of 1000
//
#extern
fcast // fun
GASQ_make_jsdasz
{a:vt}
(A:jsa1(a)): GASQ(jsa1(a), a)
#symload
GASQ with GASQ_make_jsdasz of 1000
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
jsdasz_iter(a:vt)
//
#impltmp
{ a: vt }
g_ptype
<
jsdasz_iter(a)>
(   (*void*)   ) =
(
pstrn
"jsdasz_iter(";
g_ptype<a>();pstrn")")
//
(* ****** ****** *)
//
(*
HX-2024-08-14:
This one is like
lazy [jsdasz_iforitm]
*)
//
#extern
fun<>
jsdasz_iter_make
 {a:vt}
( A
: jsdasz(a)): jsdasz_iter(a)
//
#extern
fun<>
jsdasz_iter_next$work
 {a:vt}
( iter:
! jsdasz_iter(a)
, work: (nint, !a) -> void): bool
//
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
jsdasz_iter_make
  ( A ) =
(
XATS2JS_jsdasz_iter_make
  ( A )) where
{
#extern
fun
XATS2JS_jsdasz_iter_make
 {a:vt}
( A
: jsdasz(a)): jsdasz_iter(a) = $extnam()
}
#symload
jsdasz_iter with jsdasz_iter_make of 1000
//
#impltmp
<(*tmp*)>
jsdasz_iter_next$work
  (iter, work) =
(
XATS2JS_jsdasz_iter_next$work
  (iter, work)) where
{
#extern
fun
XATS2JS_jsdasz_iter_next$work
 {a:vt}
( iter:
! jsdasz_iter(a)
, work: (nint, !a) -> void): bool = $extnam()
}
//
#symload
next$work with jsdasz_iter_next$work of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_xbasics_DATS_CATS_JS_dynarr0.dats] *)
(***********************************************************************)
