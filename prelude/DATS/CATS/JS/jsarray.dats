(* ****** ****** *)
(*
HX-2020-11-09:
Native arrays for Xats2js
*)
(* ****** ****** *)
#staload _ = "./basics.dats"
(* ****** ****** *)
//
abstype
jsarray_type(a:vt)
typedef
jsarray(a:vt) = jsarray_type(a)
//
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
// HX-2020-11-09
// symbol overloading for jsarray
//
(* ****** ****** *)
#symload
length
with XATS2JS_jsarray_length of 1000
(* ****** ****** *)
#symload
get_at
with XATS2JS_jsarray_get_at of 1000
#symload
set_at
with XATS2JS_jsarray_set_at of 1000
(* ****** ****** *)
//
#extern
fun
XATS2JS_jsarray_streamize
{a:t0}
( xs
: jsarray(a)): stream_vt(a) = $exname()
//
(* ****** ****** *)
impltmp
{a:t0}
gseq_streamize
<jsarray(a)><a> =
XATS2JS_jsarray_streamize
(* ****** ****** *)
//
implfun
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
    (
      strmcon_vt_nil((*void*))
    )
    else
    let
      val x0 = xs.get_at(i0)
    in
      strmcon_vt_cons(x0, auxmain(i0+1))
    end // end of [else]
  ) (* end of [auxmain] *)
//
} (* end of [XATS2JS_jsarray_streamize] *)
//
(* ****** ****** *)

(* end of [XATS2JS_jsarray.dats] *)
