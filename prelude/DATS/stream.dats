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

abstbox box_tx
typedef box = box_tx

(* ****** ****** *)

#staload
UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)
//
// HX-2020-03-21
// This is a bit wild!
//
impltmp
<a>(*tmp*)
stream_vt2t(xs) =
(
auxmain
($UN.castlin01(xs))
) where
{
fun
auxmain
(xs: box): stream(a) =
$lazy
(
let
val xs =
$UN.castlin10{stream_vt(a)}(xs)
val r0 = !xs
in
//
case+ r0 of
|
~ strmcon_vt_nil
  () =>
  strmcon_nil((*void*))
|
@ strmcon_vt_cons
  (x0, xs) =>
  let
  val xs =
  $UN.castlin10{box}(xs)
  val () =
  ( r0.1 := auxmain(xs) )
  in $UN.castlin10{strmcom(a)}(r0) end
//
end // end of [let]
)
} (* end of [stream_vt2t] *)

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
<stream(a)><a>
((*void*)) = stream_nil<a>()
impltmp
{a:type}
gseq_cons
<stream(a)><a>
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
stream_print(xs) =
let
val len = 
stream_print$len<>()
in
if
(len < 0)
then stream_print_all(xs)
else stream_print_len(xs, len)
end
//
impltmp
<>(*tmp*)
stream_print$len() = 3
impltmp
<>(*tmp*)
stream_print$beg() = string_print("(")
impltmp
<>(*tmp*)
stream_print$end() = string_print(")")
impltmp
<>(*tmp*)
stream_print$sep() = string_print(",")
impltmp
<>(*tmp*)
stream_print$rst() = string_print("...")
//
impltmp
{a:t0}
g_print<stream(a)> = stream_print<a>
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
stream_print_all
  (xs) =
(
loop(xs, 0(*i0*))
) where
{
typedef
xs = stream(a)
fun
loop(xs: xs, i0: nint): void =
(
case+ !xs of
|
strmcon_nil() =>
stream_print$end<>()
|
strmcon_cons(x0, xs) =>
let
val () =
if
(i0 > 0)
then
stream_print$sep<>()
val () =
g_print<a>(x0) in loop(xs, succ(i0))
end // end of [strmcon_cons]
)
} (* end of [stream_print_all] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
stream_print_len
  (xs, n0) =
(
loop(xs, 0(*i0*))
) where
{
typedef
xs = stream(a)
fun
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
|
strmcon_nil() =>
stream_print$end<>()
|
strmcon_cons(x0, xs) =>
if
(i0 >= n0)
then
let
val () =
if
(n0 > 0)
then
stream_print$sep<>()
val () =
stream_print$rst<>()
in
stream_print$end<>()
end // end of [then]
else
let
val () =
if
(n0 > 0)
then
stream_print$sep<>()
val () =
g_print0<a>(x0) in loop(xs, succ(i0))
end // end of [else]
) (* strmcon_cons *)
} (* end of [stream_print_len] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
stream_length
  (xs) =
(
  loop(xs, 0(*i0*))
) where
{
typedef
xs = stream(a)
fun
loop
( xs: xs
, i0: nint): nint =
(
case+ !xs of
|
strmcon_nil() => i0
|
strmcon_cons
  (x0, xs) => loop(xs, succ(i0))
)
} (* end of [stream_length] *)

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
<a>(*tmp*)
stream_forall
  (xs) =
( loop(xs) ) where
{
fun
loop
( xs
: stream(a)): bool =
(
case+ !xs of
|
strmcon_nil() => true
|
strmcon_cons(x0, xs) =>
let
  val
  test = forall$test<a>(x0)
in
if test then loop(xs) else false
end
) (* end of [loop] *)
} (* end of [stream_forall] *)

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
(*
    val
    opt =
    mapopt$fopr<x0><y0>(x0)
*)
    val
    opt =
    filter$test<x0>(x0)
  in
(*
    case+ opt of
    | optn_vt_nil() =>
      auxloop($eval(xs)) // tail
    | optn_vt_cons(y0) =>
      strmcon_cons(y0, auxmain(xs))
*)
    if
    opt
    then
    let
      val y0 =
      map$fopr<x0><y0>(x0)
    in
      strmcon_cons(y0, auxmain(xs))
    end
    else auxloop($eval(xs))
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
(*
    val
    opt =
    mapopt$fopr<x0><y0>(x0)
*)
    val
    opt =
    filter$test<x0>(x0)
  in
(*
    case+ opt of
    | optn_vt_nil() =>
      auxloop($eval(xs)) // tail
    | optn_vt_cons(y0) =>
      strmcon_vt_cons(y0, auxmain(xs))
*)
    if
    opt
    then
    let
      val y0 =
      map$fopr<x0><y0>(x0)
    in
      strmcon_vt_cons(y0, auxmain(xs))
    end
    else auxloop($eval(xs))
  end // end of [strmcon_cons]
)
} (* end of [stream_mapopt_vt] *)

(* ****** ****** *)

impltmp
<x0><y0>
stream_mapoptn
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
    mapoptn$fopr<x0><y0>(x0)
  in
    case+ opt of
    | optn_vt_nil() =>
      auxloop($eval(xs)) // tail
    | optn_vt_cons(y0) =>
      strmcon_cons(y0, auxmain(xs))
  end
)
} (* end of [stream_mapoptn] *)

(* ****** ****** *)

impltmp
<x0><y0>
stream_mapoptn_vt
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
    mapoptn$fopr<x0><y0>(x0)
  in
    case+ opt of
    | optn_vt_nil() =>
      auxloop($eval(xs)) // tail
    | optn_vt_cons(y0) =>
      strmcon_vt_cons(y0, auxmain(xs))
  end
)
} (* end of [stream_mapoptn_vt] *)

(* ****** ****** *)

impltmp
<x0:t0>
stream_sieve
  (xs) =
( auxmain(xs) ) where
{
fun
auxmain
( xs
: stream(x0)): stream(x0) =
$lazy
(
case+ !xs of
| strmcon_nil() =>
  strmcon_nil()
| strmcon_cons(x1, xs) =>
  let
  val xs = 
  stream_filter<x0>(xs)
  in
  strmcon_cons(x1, auxmain(xs))
  end where
  {
  impltmp
  filter$test<x0>(x2) = sieve$test<x0>(x1, x2)
  }
)
} (* stream_sieve *)

(* ****** ****** *)

impltmp
<x0:t0>
stream_sieve_vt
  (xs) =
( auxmain(xs) ) where
{
fun
auxmain
( xs
: stream(x0)): stream_vt(x0) =
$llazy
(
case+ !xs of
| strmcon_nil() =>
  strmcon_vt_nil()
| strmcon_cons(x1, xs) =>
  let
  val xs = 
  stream_filter<x0>(xs)
  in
  strmcon_vt_cons(x1, auxmain(xs))
  end where
  {
  impltmp
  filter$test<x0>(x2) = sieve$test<x0>(x1, x2)
  }
)
} (* stream_sieve_vt *)

(* ****** ****** *)

(* end of [stream.dats] *)
