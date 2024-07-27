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
#extern
fun<a:vt>
jsarray_listize
 {n:nat}
( xs: jsa(a, n)): list_vt(a, n)
#impltmp
<a : vt >
jsarray_listize =
(
  gasz_listize<jsa(a)><a>)//impltmp
#symload listize with jsarray_listize of 1000
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
<a : vt >
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
<a : vt >
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
<a : vt >
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
