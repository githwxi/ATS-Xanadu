(* ****** ****** *)
(*
Basics0 for Xats2js
*)
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
(*
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
*)
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
(*
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
*)
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
(* ****** ****** *)
//
#extern
fun
XATS2JS_strm_vt_map0$f1un
{x0:vt}
{y0:vt}
( xs: strm_vt(x0)
, f0: (x0) -> (y0)): strm_vt(y0) = $extnam()
//
#extern
fun
XATS2JS_strm_vt_filter0$f1un
{x0:vt}
( xs: strm_vt(x0)
, f0: (x0) -> bool): strm_vt(x0) = $extnam()
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
XATS2JS_strm_vt_map0$f1un
{x0:vt}
{y0:vt}
(xs, f0) =
(
  auxmain(xs)) where
{
fun
auxmain
( xs
: strm_vt(x0)): strm_vt(y0) =
$llazy(
//
case+ !xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil((*void*))
| ~
strmcon_vt_cons(x0, xs) =>
strmcon_vt_cons(f0(x0), auxmain(xs))
//
)(*case+*)//end-of-( auxmain( xs ) )
}(*where*)//end(XATS2JS_strm_vt_map0$f1un)
//
(* ****** ****** *)
//
#implfun
XATS2JS_strm_vt_filter0$f1un
{x0:vt}
(xs, f0) =
(
  auxmain(xs)) where
{
fnx
auxmain
( xs
: strm_vt(x0)
) : strm_vt(x0) =
(
  $llazy(auxloop(xs)))
//
and
auxloop
( xs
: strm_vt(x0)
) : strmcon_vt(x0) =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil((*void*))
| ~
strmcon_vt_cons(x0, xs) =>
(
if
f0(x0)
then
strmcon_vt_cons
(x0, auxmain(xs)) else auxloop(xs))
)(*case+*)//end-of-( auxloop( xs ) )
}(*where*)//end(XATS2JS_strm_vt_filter0$f1un)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_basics0.dats] *)
