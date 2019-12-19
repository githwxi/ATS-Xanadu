(* ****** ****** *)
(*
** for streams
*)
(* ****** ****** *)

(*
#staload
"./../SATS/stream.sats"
*)


(* ****** ****** *)
//
impltmp
<a>(*tmp*)
stream_nil() =
$lazy(strmcon_nil())
impltmp
<a>(*tmp*)
stream_cons
  (x0, xs) =
(
$lazy(strmcon_cons(x0, xs))
)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
stream_sing(x0) =
stream_cons(x0, stream_nil())
impltmp
<a>(*tmp*)
stream_pair(x0, y0) =
stream_cons(x0, stream_sing(y0))
//  
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
stream_extend
  (xs, x0) =
(
stream_append(xs, stream_sing(x0))
)
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
stream_append
  (xs, ys) =
(
  append(xs, ys)
) where
{
fun
append(xs, ys) =
$lazy
(
case+ $eval(xs) of
| strmcon_nil() => $eval(ys)
| strmcon_cons(x0, xs) =>
  strmcon_cons(x0, append(xs, ys))
)
} (* end of [stream_append] *)

(* ****** ****** *)

impltmp
<x0><y0>
stream_map
  (xs) =
(
  auxmain(xs)
) where
{
fun
auxmain(xs) =
$lazy
(
case+ $eval(xs) of
| strmcon_nil() =>
  strmcon_nil()
| strmcon_cons(x0, xs) =>
  strmcon_cons(map$fopr(x0), auxmain(xs))
)
} (* end of [stream_map] *)

impltmp
<x0><y0>
stream_map_vt
  (xs) =
(
  auxmain(xs)
) where
{
fun
auxmain(xs) =
$llazy
(
case+ $eval(xs) of
| strmcon_nil() =>
  strmcon_vt_nil()
| strmcon_cons(x0, xs) =>
  strmcon_vt_cons(map$fopr(x0), auxmain(xs))
)
} (* end of [stream_map_vt] *)

(* ****** ****** *)

(* end of [stream.dats] *)
