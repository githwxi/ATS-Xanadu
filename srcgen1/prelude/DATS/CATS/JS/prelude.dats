(* ****** ****** *)
(*
Prelude for Xats2js
*)
(* ****** ****** *)
#staload
UN = // for casting
"srcgen1\
/prelude/SATS/unsafex.sats"
(* ****** ****** *)
#staload _ = 
"srcgen1\
/prelude/DATS/strm000.dats"
#staload _ = 
"srcgen1\
/prelude/DATS/VT/strm000_vt.dats"
(* ****** ****** *)
(*
#implfun
{a:vt} // HX: This is
g_free<a>(x0) = () // for JS!!!
*)
(* ****** ****** *)
//prelude/basics0.sats
(* ****** ****** *)
//
#extern
fun
XATS2JS_lazy_f0un
{a:t0}
( f0
: ((*void*)) -> (a)
) : lazy(a) = $extnam()
#extern
fun
XATS2JS_llazy_f0un
{a:vt}
( f0
: ((*void*)) -> (a)
) : lazy_vt(a) = $extnam()
#extern
fun
XATS2JS_lazy_vt_f0un
{a:vt}
( f0
: ((*void*)) -> (a)
) : lazy_vt(a) = $extnam()
//
#implfun
XATS2JS_lazy_f0un{a}(f0) = $lazy(f0())
#implfun
XATS2JS_llazy_f0un{a}(f0) = $llazy(f0())
#implfun
XATS2JS_lazy_vt_f0un{a}(f0) = $llazy(f0())
//
(* ****** ****** *)
//
// prelude/optn.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_optn_nil
{a:t0}(): optn(a) = $extnam()
#extern
fun
XATS2JS_optn_cons
{a:t0}(x0: a): optn(a) = $extnam()
//
#implfun
XATS2JS_optn_nil() = optn_nil()
#implfun
XATS2JS_optn_cons(x0) = optn_cons(x0)
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_optn_uncons_funs
{x0:t0}{r0:vt}
( xs
: optn(x0)
, f0: () -> (r0)
, f1: (x0) -> (r0)): r0 = $extnam()
#implfun
XATS2JS_optn_uncons_funs
  (xs, f0, f1) =
( case+ xs of
  | optn_nil() => f0()
  | optn_cons(x0) => f1(x0)
) (* end of [XATS2JS_optn_uncons_funs] *)
//
(* ****** ****** *)
//
// prelude/list.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_list_nil
{a:t0}
( (*void*) ): list(a) = $extnam()
#extern
fun
XATS2JS_list_cons
{a:t0}
( x0: a
, xs: list(a)): list(a) = $extnam()
//
#implfun
XATS2JS_list_nil() = list_nil((*void*))
#implfun
XATS2JS_list_cons(x0, xs) = list_cons(x0, xs)
//
(* ****** ****** *)
#extern
fun
XATS2JS_list_uncons_funs
{x0:t0}{r0:vt}
( xs
: list(x0)
, f0
: ((*void*)) -> r0
, f1
: (x0, list(x0)) -> r0): r0 = $extnam()
#implfun
XATS2JS_list_uncons_funs
  (xs, f0, f1) =
( case+ xs of
  | list_nil() => f0()
  | list_cons(x0, xs) => f1(x0, xs)
) (* end of [XATS2JS_list_uncons_funs] *)
(* ****** ****** *)
//
// prelude/strm000.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_strmcon_nil
{a:t0}
( (*void*) ): strmcon(a) = $extnam()
#extern
fun
XATS2JS_strmcon_cons
{a:t0}
( x0: a
, xs: strm(a)): strmcon(a) = $extnam()
//
#implfun
XATS2JS_strmcon_nil() = strmcon_nil((*void*))
#implfun
XATS2JS_strmcon_cons(x0, xs) = strmcon_cons(x0, xs)
//
(* ****** ****** *)
(*
//
#extern
fun
XATS2JS_strm_nil
{a:t0}
( (*void*) ): strm(a) = $extnam()
#extern
fun
XATS2JS_strm_cons
{a:t0}
( x0: a
, xs: strm(a)): strm(a) = $extnam()
//
#implfun
XATS2JS_strm_nil() = strm_nil((*void*))
#implfun
XATS2JS_strm_cons(x0, xs) = strm_cons(x0, xs)
//
*)
(* ****** ****** *)
#extern
fun
XATS2JS_strm_uncons_funs
{x0:t0}{r0:vt}
( xs
: strm(x0)
, f0
: ((*void*)) -> r0
, f1
: (x0, strm(x0)) -> r0): r0 = $extnam()
#implfun
XATS2JS_strm_uncons_funs
  (xs, f0, f1) =
( case+ !xs of
  | strmcon_nil() => f0((*void*))
  | strmcon_cons(x0, xs) => f1(x0, xs)
) (* end of [XATS2JS_strm_uncons_funs] *)
(* ****** ****** *)
#extern
fun
XATS2JS_streax_uncons_funs
{x0:t0}{r0:vt}
( xs
: streax(x0)
, f1
: (x0, streax(x0))->(r0)): r0 = $extnam()
#implfun
XATS2JS_streax_uncons_funs
  (xs, f1) =
( case+ !xs of
  | strxcon_cons(x0, xs) => f1(x0, xs)
) (* end of [XATS2JS_streax_uncons_funs] *)
(* ****** ****** *)
//
// prelude/optn_vt.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_optn_vt_nil
{a:vt}(): optn_vt(a) = $extnam()
#extern
fun
XATS2JS_optn_vt_cons
{a:vt}(x0: a): optn_vt(a) = $extnam()
//
#implfun
XATS2JS_optn_vt_nil() = optn_vt_nil()
#implfun
XATS2JS_optn_vt_cons(x0) = optn_vt_cons(x0)
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_optn_vt_uncons_funs
{x0:vt}{r0:vt}
( xs
: optn_vt(x0)
, f0: () -> r0
, f1: (x0) -> r0): r0 = $extnam()
//
#implfun
XATS2JS_optn_vt_uncons_funs
  (xs, f0, f1) =
( case+ xs of
  | ~optn_vt_nil() => f0()
  | ~optn_vt_cons(x0) => f1(x0)
) (* end of [XATS2JS_optn_vt_uncons_funs] *)
//
(* ****** ****** *)
//
// prelude/list_vt.sats
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_list_vt_nil
{a:vt}
( (*void*) ): list_vt(a) = $extnam()
#extern
fun
XATS2JS_list_vt_cons
{a:vt}
( x0: a
, xs: list_vt(a)): list_vt(a) = $extnam()
//
#implfun
XATS2JS_list_vt_nil() = list_vt_nil((*void*))
#implfun
XATS2JS_list_vt_cons(x0, xs) = list_vt_cons(x0, xs)
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_list_vt_uncons_funs
{x0:vt}{r0:vt}
( xs
: list_vt(x0)
, f0
: ((*void*)) -> r0
, f1
: (x0, list_vt(x0))->r0): r0 = $extnam()
//
#implfun
XATS2JS_list_vt_uncons_funs
  (xs, f0, f1) =
( case+ xs of
  | ~list_vt_nil() => f0()
  | ~list_vt_cons(x0, xs) => f1(x0, xs)
) (* end of [XATS2JS_list_vt_uncons_funs] *)
//
(* ****** ****** *)
//
// prelude/strm_vt.sats
//
(* ****** ****** *)
(*
//
#extern
fun
XATS2JS_strm_vt_nil
{a:vt}
( (*void*) ): strm_vt(a) = $extnam()
#extern
fun
XATS2JS_strm_vt_cons
{a:vt}
( x0: a
, xs: strm_vt(a)): strm_vt(a) = $extnam()
//
#implfun
XATS2JS_strm_vt_nil() = strm_vt_nil((*void*))
#implfun
XATS2JS_strm_vt_cons(x0, xs) = strm_vt_cons(x0, xs)
//
*)
(* ****** ****** *)
//
#extern
fun
XATS2JS_strmcon_vt_nil
{a:vt}
( (*void*) ): strmcon_vt(a) = $extnam()
#extern
fun
XATS2JS_strmcon_vt_cons
{a:vt}
( x0: a
, xs: strm_vt(a)): strmcon_vt(a) = $extnam()
//
#implfun
XATS2JS_strmcon_vt_nil() = strmcon_vt_nil((*void*))
#implfun
XATS2JS_strmcon_vt_cons(x0, xs) = strmcon_vt_cons(x0, xs)
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_strm_vt_uncons_funs
{x0:vt}{r0:vt}
( xs
: strm_vt(x0)
, f0
: ((*void*)) -> r0
, f1
: (x0, strm_vt(x0))->r0): r0 = $extnam()
//
#implfun
XATS2JS_strm_vt_uncons_funs
  (xs, f0, f1) =
( case+ !xs of
  | ~strmcon_vt_nil() => f0((*void*))
  | ~strmcon_vt_cons(x0, xs) => f1(x0, xs)
) (* end of [XATS2JS_strm_vt_uncons_funs] *)
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_streax_vt_uncons_funs
{x0:vt}{r0:vt}
( xs
: streax_vt(x0)
, f1
: (x0, streax_vt(x0))->r0): r0 = $extnam()
//
#implfun
XATS2JS_streax_vt_uncons_funs
  (xs, f1) =
( case+ !xs of
  | ~strxcon_vt_cons(x0, xs) => f1(x0, xs)
) (* end of [XATS2JS_streax_vt_uncons_funs] *)
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_strm_vt_map0_f1un
{x0:vt}
{y0:vt}
( xs: strm_vt(x0)
, f0: (x0) -> (y0)): strm_vt(y0) = $extnam()
//
#implfun
XATS2JS_strm_vt_map0_f1un
{x0}{y0}
(xs, f0) =
(
strm_vt_map0<x0><y0>(xs)
) where
{
#impltmp map$fopr0<x0><y0>(x0) = f0(x0)
} (* end of [XATS2JS_strm_vt_map0_f1un] *)
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_strm_vt_filter0_f1un
{x0:vt}
( xs: strm_vt(x0)
, f0: (x0) -> bool): strm_vt(x0) = $extnam()
//
#implfun
XATS2JS_strm_vt_filter0_f1un
{x0}(xs, f0) =
(
strm_vt_filter0<x0>(xs)
) where
{
//
  #impltmp
  g_free<x0>(x0) = () // leak!
//
  #impltmp filter$test1<x0>(x0) = f0(x0)
//
} (* end of [XATS2JS_strm_vt_filter0_f1un] *)
//
(* ****** ****** *)
//
(*
prelude/arrn000.sats
(
arrays of
various dimensionality)
*)
//
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
#extern
fun
XATS2JS_a0ref_get
{a:t0}
( A0
: a0ref(a)): ( a ) = $extnam()
#impltmp
{ a:t0 }
a0ref_get<a> = XATS2JS_a0ref_get
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_a0ref_set
{a:t0}
( A0
: a0ref(a)
, x0 : (a)) : void = $extnam()
#impltmp
{ a:t0 }
a0ref_set<a> = XATS2JS_a0ref_set
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
( A0:
  a1ref(a, n)
, i0: nintlt(n)): ~a = $extnam()
}
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_prelude.dats] *)
