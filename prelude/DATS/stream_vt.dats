(* ****** ****** *)
(*
** for lin-streams
*)
(* ****** ****** *)

(*
#staload
"./../SATS/stream_vt.sats"
*)

(* ****** ****** *)
//
impltmp
<a>(*tmp*)
stream_vt_nil() =
$llazy(strmcon_vt_nil())
impltmp
<a>(*tmp*)
stream_vt_cons
  (x0, xs) =
(
$llazy(strmcon_vt_cons(x0, xs))
)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
stream_vt_sing(x0) =
stream_vt_cons(x0, stream_vt_nil())
impltmp
<a>(*tmp*)
stream_vt_pair(x0, y0) =
stream_vt_cons(x0, stream_vt_sing(y0))
//  
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
stream_vt_free
  (xs) =
( loop(xs) ) where
{
fun
loop
( xs
: stream_vt(a)): void =
(
case+ !xs of
|
~ strmcon_vt_nil() => ()
|
~ strmcon_vt_cons(x0, xs) =>
  let
  val () = g_free<a>(x0) in loop(xs)
  end
) (* end of [loop] *)
} (* end of [stream_vt_free] *)
)
//
impltmp
<a>(*tmp*)
g_free<stream_vt(a)> = stream_vt_free<a>
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
stream_vt_extend
  (xs, x0) =
(
  stream_vt_append<a>
  (xs, stream_vt_sing<a>(x0))
)
//
impltmp
<a>(*tmp*)
stream_vt_append
  (xs, ys) =
(
  append(xs, ys)
) where
{
fun
append(xs, ys) =
$llazy
(
case+ !xs of
| ~strmcon_vt_nil() => !ys
| ~strmcon_vt_cons(x0, xs) =>
   strmcon_vt_cons(x0, append(xs, ys))
)
} (* end of [stream_vt_append] *)

(* ****** ****** *)

impltmp
<x0><y0>
stream_vt_map0
  (xs) =
(
  auxmain(xs)
) where
{
fun
auxmain
( xs
: stream_vt(x0)
)
: stream_vt(y0) =
$llazy
(
//
g_free(xs);
//
case+ !xs of
|
~ strmcon_vt_nil() =>
  strmcon_vt_nil((*void*))
|
~ strmcon_vt_cons(x0, xs) =>
  strmcon_vt_cons(map0$fopr(x0), auxmain(xs))
)
} (* end of [stream_vt_map0] *)

(* ****** ****** *)

impltmp
<x0>(*tmp*)
stream_vt_filter0
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain
( xs
: stream_vt(a)
)
: stream_vt(a) =
$llazy
( g_free(xs)
; auxloop($eval(xs)))
and
auxloop
( xs
: strmcon_vt(x0)
)
: strmcon_vt(x0) =
(
case+ xs of
|
~ strmcon_vt_nil() =>
  strmcon_vt_nil()
|
~ strmcon_vt_cons(x0, xs) =>
( if
  filter0$test<x0>(x0)
  then
  strmcon_vt_cons
  (x0, auxmain(xs)) else auxloop(!xs)
) (* end of [strmcom_vt_cons] *)
)
} (* end of [stream_vt_filter0] *)

(* ****** ****** *)

impltmp
<x0><y0>
stream_vt_mapopt0
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain
( xs
: stream_vt(x0)
)
: stream_vt(x0) =
$llazy
(auxloop($eval(xs)))
and
auxloop
( xs
: strmcon_vt(x0)
)
: strmcon_vt(x0) =
(
case+ xs of
|
~ strmcon_vt_nil() =>
  strmcon_vt_nil()
|
~ strmcon_vt_cons(x0, xs) =>
  let
    val
    opt =
    mapopt0$fopr<x0><y0>(x0)
  in
    case+ opt of
    |
    ~optn_vt_nil() =>
     auxloop($eval(xs)) // tail-call
    |
    ~optn_vt_cons(y0) =>
     strmcon_vt_cons(y0, auxmain(xs))
  end // end of [strmcon_vt_cons]
)
} (* end of [stream_vt_mapopt0] *)

(* ****** ****** *)

(* end of [stream_vt.dats] *)
