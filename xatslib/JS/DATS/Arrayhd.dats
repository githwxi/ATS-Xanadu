(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/Array.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#typedef
jsa(a:vt) = jsarray(a)
#typedef
jsa(a:vt,n:i0) = jsarray(a,n)
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-27:
*)
//
#extern
fun<a:vt>
jsarray_listize
 {n:nat}
( xs: jsa(a, n)): list_vt(a, n)
#impltmp
< a: vt >
jsarray_listize =
(
  gasz_listize<jsa(a)><a>)//impltmp
#symload
listize with jsarray_listize of 1000
//
#impltmp
{ a: t0 }
gseq_listize0<jsa(a)><a> = jsarray_listize<a>
#impltmp
{ a: vt }
gseq_listize1<jsa(a)><a> = jsarray_listize<a>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-27:
*)
//
#extern
fun<a:vt>
jsarray_strmize
( A: jsa(a) ): strm_vt(a)
#impltmp
< a: vt >
jsarray_strmize =
(
  gasz_strmize<jsa(a)><a>)//impltmp
#symload
strmize with jsarray_strmize of 1000
//
#impltmp
{ a: t0 }
gseq_strmize0<jsa(a)><a> = jsarray_strmize<a>
#impltmp
{ a: vt }
gseq_strmize1<jsa(a)><a> = jsarray_strmize<a>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-27:
*)
//
#extern
fun<a:vt>
jsarray_forall
 ( A: jsa(a) ): bool
#impltmp
< a: vt >
jsarray_forall =
gasz_forall<jsa(a)><a>(*void*)
#symload
forall with jsarray_forall of 1000
//
#impltmp
{ a: t0 }
gseq_forall0<jsa(a)><a> = jsarray_forall<a>
#impltmp
{ a: vt }
gseq_forall1<jsa(a)><a> = jsarray_forall<a>
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-27:
*)
//
#extern
fun<a:vt>
jsarray_append
 {m,n:nat}
( xs: jsa(a, m)
, ys: jsa(a, n)): jsa(a, m+n)
#impltmp
< a: vt >
jsarray_append =
(
  gseq_append00<jsa(a)><a><jsa(a)>)
#symload append with jsarray_append of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-27:
*)
//
#extern
fun<a:vt>
jsarray_prepend
 {m,n:nat}
( xs: jsa(a, m)
, ys: jsa(a, n)): jsa(a, m+n)
#impltmp
< a: vt >
jsarray_prepend =
(
  gseq_prepend00<jsa(a)><a><jsa(a)>)
#symload prepend with jsarray_prepend of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-27:
*)
//
#extern
fun<a:vt>
jsarray_rappend
 {m,n:nat}
( xs: jsa(a, m)
, ys: jsa(a, n)): jsa(a, m+n)
#impltmp
< a: vt >
jsarray_rappend =
(
  gseq_rappend00<jsa(a)><a><jsa(a)>)
#symload rappend with jsarray_rappend of 1000
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
jsarray_sum(A: jsa(a)): (a)
#impltmp
< a: vt >
jsarray_sum = gseq_sum0<jsa(a)><a>
#symload sum with jsarray_sum of 1000
//
#extern
fun<a:vt>
jsarray_prod(A: jsa(a)): (a)
#impltmp
< a: vt >
jsarray_prod = gseq_prod0<jsa(a)><a>
#symload prod with jsarray_prod of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-29:
Mon 29 Jul 2024 01:40:18 PM EDT
*)
//
#extern
fun
<a:vt>
<b:t0>
jsarray_map_list_c1fr
{n:nat}
( A: jsa(a, n)
, fopr: (a) -<cfr> b): list(b, n)
#extern
fun
<a:vt>
<b:vt>
jsarray_map_llist_c1fr
{n:nat}
( A: jsa(a, n)
, fopr: (a) -<cfr> b): list_vt(b, n)
//
#impltmp
< a: vt >
< b: t0 >
jsarray_map_list_c1fr
  (A, fopr) =
list_vt2t{b}
(jsarray_map_llist_c1fr<a><b>(A, fopr))
#impltmp
< a: vt >
< b: vt >
jsarray_map_llist_c1fr
  (A, fopr) =
(
gseq_map1_llist<jsa(a)><a><b>(A)
) where
{
#impltmp map$fopr1<a><b>(x) = fopr(x)
}
//
#symload
map_list with jsarray_map_list_c1fr of 1000
#symload
map_llist with jsarray_map_llist_c1fr of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-29:
Mon 29 Jul 2024 11:19:25 PM EDT
*)
//
#staload
"prelude/SATS/gcls000.sats"
//
#extern
fun
GSEQ_jsarray
{a:vt}((*0*)): GSEQ(jsarray(a), a)
#symload GSEQ with GSEQ_jsarray of 0100
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_DATS_Arrayhd.dats] *)
