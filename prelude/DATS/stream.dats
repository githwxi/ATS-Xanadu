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
impltmp
{a:type}
gseq_nil
<a,stream(a)>
((*void*)) = stream_nil<a>()
impltmp
{a:type}
gseq_cons
<a,stream(a)>
 (x0, xs) = stream_cons<a>(x0, xs)
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

impltmp
<x0>(*tmp*)
stream_filter
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain(xs) =
$lazy
(auxloop($eval(xs)))
and
auxloop
( xs
: strmcon(x0)
)
: strmcon(x0) =
(
case+ xs of
| strmcon_nil() =>
  strmcon_nil()
| strmcon_cons(x0, xs) =>
  if
  filter$test<x0>(x0)
  then
  strmcon_cons(x0, auxmain(xs)) else auxloop($eval(xs))
)
} (* end of [stream_filter] *)

(* ****** ****** *)

impltmp
<x0>(*tmp*)
stream_filter_vt
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain(xs) =
$llazy
(auxloop($eval(xs)))
and
auxloop
( xs
: strmcon(x0)
)
: strmcon_vt(x0) =
(
case+ xs of
| strmcon_nil() =>
  strmcon_vt_nil()
| strmcon_cons(x0, xs) =>
  if
  filter$test<x0>(x0)
  then
  strmcon_vt_cons(x0, auxmain(xs)) else auxloop($eval(xs))
)
} (* end of [stream_filter_vt] *)

(* ****** ****** *)

impltmp
<x0><y0>
stream_mapopt
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain(xs) =
$lazy
(auxloop($eval(xs)))
and
auxloop(xs) =
(
case+ xs of
| strmcon_nil() =>
  strmcon_nil()
| strmcon_cons(x0, xs) =>
  let
    val
    opt =
    mapopt$fopr<x0><y0>(x0)
  in
    case+ opt of
    |
    ~optn_vt_nil() =>
     auxloop($eval(xs)) // tail-call
    |
    ~optn_vt_cons(y0) =>
     strmcon_cons(y0, auxmain(xs))
  end // end of [strmcon_cons]
)
} (* end of [stream_mapopt] *)

(* ****** ****** *)

impltmp
<x0><y0>
stream_mapopt_vt
  (xs) =
(
  auxmain(xs)
) where
{
fnx
auxmain(xs) =
$llazy
(auxloop($eval(xs)))
and
auxloop(xs) =
(
case+ xs of
| strmcon_nil() =>
  strmcon_vt_nil()
| strmcon_cons(x0, xs) =>
  let
    val
    opt =
    mapopt$fopr<x0><y0>(x0)
  in
    case+ opt of
    |
    ~optn_vt_nil() =>
     auxloop($eval(xs)) // tail-call
    |
    ~optn_vt_cons(y0) =>
     strmcon_vt_cons(y0, auxmain(xs))
  end // end of [strmcon_cons]
)
} (* end of [stream_mapopt_vt] *)

(* ****** ****** *)

(* end of [stream.dats] *)
