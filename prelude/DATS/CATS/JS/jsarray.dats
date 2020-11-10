(* ****** ****** *)
(*
Native arrays for Xats2js
*)
(* ****** ****** *)

abstype
jsarray_type(a:vt)
typedef
jsarray(a:vt) = jsarray_type(a)

(* ****** ****** *)
#extern
fun
XATS2JS_jsarray_length
{a:t0}
( xs
: jsarray(a)): nint = $exname()
(* ****** ****** *)
#extern
fun
XATS2JS_jsarray_get_at
{a:t0}
( xs
: jsarray(a)
, i0: nint(*index*)): a = $exname()
#extern
fun
XATS2JS_jsarray_set_at
  {a:t0}
( xs
: jsarray(a)
, i0: nint, x0: a): void = $exname()
(* ****** ****** *)
//
#extern
fun<>
XATS2JS_jsarray_streamize
  {a:t0}(xs: jsarray(a)): stream_vt(a)
//
impltmp
<>(*tmp*)
XATS2JS_jsarray_streamize
{a}(xs) =
auxmain(0) where
{
//
  val n0 = length(xs)
//
  fun
  auxmain
  (i0: sint): stream_vt(a) =
  $llazy
  (
    if
    (i0 >= n0)
    then
    stream_vt_nil(*void*)
    else
    let
    val x0 = xs.get_at(i0)
    in
    stream_vt_cons(x0, auxmain(i0+1))
    end // end of [else]
  ) (* end of [auxmain] *)
//
} (* end of [XATS2JS_jsarray_streamize] *)
//
(* ****** ****** *)
//
// HX-2020-11-09
// symbol overloading for jsarray
//
(* ****** ****** *)
#symload
length with XATS2JS_jsarray_length of 1000
(* ****** ****** *)
#symload
get_at with XATS2JS_jsarray_get_at of 1000
#symload
set_at with XATS2JS_jsarray_set_at of 1000
(* ****** ****** *)

(* end of [XATS2JS_native.dats] *)
