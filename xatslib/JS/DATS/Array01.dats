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
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_JS_DATS_Array01.dats] *)
