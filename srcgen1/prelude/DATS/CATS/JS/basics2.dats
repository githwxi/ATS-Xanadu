(* ****** ****** *)
(*
Basics2 for Xats2js
*)
(* ****** ****** *)
#staload
UN = // for casting
"srcgen1\
/prelude/SATS/unsafex.sats"
(* ****** ****** *)
(*
#staload _ = 
"srcgen1\
/prelude/DATS/strm000.dats"
#staload _ = 
"srcgen1\
/prelude/DATS/VT/strm000_vt.dats"
*)
(* ****** ****** *)
(*
#impltmp
{a:vt} // HX: This is
g_free<a>(x0) = () // for JS!!!
*)
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2020-10-25:
Please note that
[a] is boxed in JavaScript
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
// HX: 0-dimensional
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a:vt }
a0ptr_free<a>(A0) = ()
//
(* ****** ****** *)
//
#impltmp
{ a:t0 }
a0ref_get<a> =
XATS2JS_a0ref_get where
{
#extern
fun
XATS2JS_a0ref_get
{a:t0}
( A0
: a0ref(a)): ( a ) = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
{ a:t0 }
a0ref_set<a> =
XATS2JS_a0ref_set where
{
#extern
fun
XATS2JS_a0ref_set
{a:t0}
( A0
: a0ref(a)
, x0 : (a)) : void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
{ a:vt }
a0ref_dtget<a> =
XATS2JS_a0ref_dtget where
{
#extern
fun
XATS2JS_a0ref_dtget
{a:vt}
( A0
: a0ref(a)): (?!a) = $extnam()
}
//
#impltmp
{ a:vt }
a0ref_dtset<a> =
XATS2JS_a0ref_dtset where
{
#extern
fun
XATS2JS_a0ref_dtset
{a:vt}
( A0
: a0ref(a), x0: ?!a): void = $extnam()
}
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS2JS_a0ptr_alloc
{a:vt}
(
// argless
) : a0ptr(?a) = $extnam()
#impltmp
{a:vt}
a0ptr_alloc<a> = XATS2JS_a0ptr_alloc
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_a0ptr_make0_1val
{a:vt}
(
x0: a
) : a0ptr(a) = $extnam()
#impltmp
{ a:vt }
a0ptr_make0_1val<a> = XATS2JS_a0ptr_make0_1val
//
(* ****** ****** *)
(* ****** ****** *)
//
// HX: 1-dimensional
//
(* ****** ****** *)
//
#impltmp
{ a:vt }
a1ptr_free<a>(A0, n0) = () // GC
//
#impltmp
{ a:vt }
a1ptr_mfree0<a>(  A0  ) = () // GC
#impltmp
{ a:vt }
a1ptr_clear1<a>(A0, n0) = () // GC
//
(* ****** ****** *)
#extern
fun
XATS2JS_a1ptr_alloc
{a:vt}
{n:nat}
( asz
: int(n))
: a1ptr(?a, n) = $extnam((*self*))
#impltmp
{ a:vt }
a1ptr_alloc<a> = XATS2JS_a1ptr_alloc
(* ****** ****** *)
//
#extern
fun
XATS2JS_a1ref_get$at
{a:t0}
{n:i0}
( A0:
  a1ref(a, n)
, i0: nintlt(n)): a = $extnam()
#impltmp
{ a:t0 }
a1ref_get$at<a> = XATS2JS_a1ref_get$at
//
#extern
fun
XATS2JS_a1ptr_get$at1
{a:t0}
{n:i0}
( A0:
! a1ptr(a, n)
, i0: nintlt(n)): a = $extnam()
#impltmp
{ a:t0 }
a1ptr_get$at1<a> = XATS2JS_a1ptr_get$at1
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_a1ref_set$at
{a:t0}
{n:i0}
( A0:
  a1ref(a, n)
, i0: nintlt(n)
, x0: a(*new*)): void = $extnam()
#impltmp
{ a:t0 }
a1ref_set$at<a> = XATS2JS_a1ref_set$at
//
#extern
fun
XATS2JS_a1ptr_set$at1
{a:t0}
{n:i0}
( A0:
! a1ptr(a, n)
, i0: nintlt(n)
, x0: a(*new*)): void = $extnam()
#impltmp
{ a:t0 }
a1ptr_set$at1<a> = XATS2JS_a1ptr_set$at1
//
(* ****** ****** *)
//
(*
#extern
fun
XATS2JS_a1ptr_set$at$raw
{a:vt}
{n:i0}
( A0:
! a1ptr(?a, n)
, i0: nintlt(n)
, x0: a(*ini*)): void = $extnam()
#impltmp
{ a:vt }
a1ptr_set$at$raw<a> = XATS2JS_a1ptr_set$at$raw
*)
//
(* ****** ****** *)
//
#impltmp
{ a:vt }
a1ref_dtget$at<a> =
XATS2JS_a1ref_dtget$at where
{
#extern
fun
XATS2JS_a1ref_dtget$at
{a:vt}
{n:i0}
(A0: a1ref(a, n), i0: nintlt(n)): ~a = $extnam()
}
//
#impltmp
{ a:vt }
a1ptr_dtget$at1<a> =
XATS2JS_a1ptr_dtget$at1 where
{
#extern
fun
XATS2JS_a1ptr_dtget$at1
{a:vt}
{n:i0}
(A0: a1ptr(a, n), i0: nintlt(n)): ~a = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_basics2.dats] *)
(***********************************************************************)
