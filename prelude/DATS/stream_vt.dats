(* ****** ****** *)
(*
** for lin-streams
*)
(* ****** ****** *)
//
(*
#staload
"./../SATS/stream_vt.sats"
*)
//
(* ****** ****** *)
#staload
UN =
"prelude/SATS/unsafe.sats"
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
$llazy
(
g_free(x0);
g_free(xs);
strmcon_vt_cons(x0, xs) )
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
strmcon_vt_sing(x0) =
strmcon_vt_cons(x0, stream_vt_nil())
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
stream_vt_pair(x0, y0) =
stream_vt_cons(x0, stream_vt_sing(y0))
impltmp
<a>(*tmp*)
strmcon_vt_pair(x0, y0) =
strmcon_vt_cons(x0, stream_vt_sing(y0))
//  
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
stream_vt_free(xs) = $free(xs)
//
impltmp
{a:vt}
g_free<stream_vt(a)> = stream_vt_free<a>
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
stream_vt_print(xs) =
let
val len = 
stream_vt_print$len<>()
in
if
(len < 0)
then stream_vt_print_all(xs)
else stream_vt_print_len(xs, len)
end
//
impltmp
<>(*tmp*)
stream_vt_print$len() = 3
impltmp
<>(*tmp*)
stream_vt_print$beg() = string_print("(")
impltmp
<>(*tmp*)
stream_vt_print$end() = string_print(")")
impltmp
<>(*tmp*)
stream_vt_print$sep() = string_print(",")
impltmp
<>(*tmp*)
stream_vt_print$rst() = string_print("...")
//
impltmp
{a:vt}
g_print0<stream_vt(a)> = stream_vt_print<a>
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
stream_vt_print_all
  (xs) =
(
loop
(xs, 0(*i0*)) where
{
val () =
stream_vt_print$beg<>()
}
) where
{
vwtpdef
xs = stream_vt(a)
fun
loop
( xs: xs
, i0: nint): void =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
(
stream_vt_print$end<>()
)
| ~
strmcon_vt_cons(x0, xs) =>
let
val () =
if
(i0 > 0)
then
stream_vt_print$sep<>()
val () =
g_print0<a>(x0) in loop(xs, succ(i0))
end // end of [strmcon_vt_cons]
)
} (* end of [stream_vt_print_all] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
stream_vt_print_len
  (xs, n0) =
(
loop
(xs, 0(*i0*)) where
{
val () =
stream_vt_print$beg<>()
}
) where
{
vwtpdef
xs = stream_vt(a)
fun
loop(xs: xs, i0: nint): void =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
stream_vt_print$end<>()
| ~
strmcon_vt_cons(x0, xs) =>
if
(i0 >= n0)
then
let
//
val () =
g_free<a>(x0)
val () =
stream_vt_free<a>(xs)
//
val () =
if
(i0 > 0)
then
stream_vt_print$sep<>()
val () =
stream_vt_print$rst<>()
//
in
  stream_vt_print$end<>()
end // end of [then]
else
let
val () =
if
(i0 > 0)
then
stream_vt_print$sep<>()
val () =
g_print0<a>(x0) in loop(xs, succ(i0))
end // end of [else]
) (* strmcon_vt_cons *)
} (* end of [stream_vt_print_len] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
stream_vt_length(xs) =
(
stream_vt_foldl0<a><nint>(xs, 0)
) where
{
//
impltmp
foldl0$fopr<a><nint>(r0, x0) =
let val () = g_free<a>(x0) in succ(r0) end
//
} (* end of [stream_vt_length] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
stream_vt_drop
  (xs, n0) =
(
  auxloop(xs, n0)
) where
{
//
vwtpdef xs = stream_vt(a)
//
fun
auxloop
(xs: xs, n0: sint): xs =
if
(n0 <= 0)
then xs else
(
case+ !xs of
|
strmcon_vt_nil() => stream_vt_nil()
|
strmcon_vt_cons(x0, xs) =>
  (g_free<a>(x0); auxloop(xs, pred(n0)))
)
} (* end of [stream_vt_drop] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
stream_vt_take
  (xs, n0) =
(
  auxmain(xs, n0)
) where
{
//
vwtpdef xs = stream_vt(a)
//
fun
auxmain
(xs: xs, n0: sint): xs =
$llazy
(
g_free(xs);
if
(n0 <= 0)
then
(
  g_free(xs); strmcon_vt_nil()
) (* then *)
else
(
case+ !xs of
//
|
strmcon_vt_nil() => strmcon_vt_nil()
//
|
strmcon_vt_cons(x0, xs) =>
strmcon_vt_cons(x0, auxmain(xs, pred(n0)))
//
) (* else *)
)
} (* end of [stream_vt_take] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
stream_vt_listize(xs) =
let
//
fun
loop
( xs
: stream_vt(a)
, r0
: &(?list_vt(a)) >> list_vt(a)
) : void =
(
case+ !xs of
|
strmcon_vt_nil() =>
(r0 := list_vt_nil())
|
strmcon_vt_cons(x0, xs) =>
let
  val () =
  (r0 := list_vt_cons(x0, _))
in
    loop(xs, r0.1); $fold(r0)
end
) (* end of [loop] *)
//
in
let
var r0: list_vt(a)
val () = loop(xs, r0) in r0 endlet
end (* end of [stream_vt_listize] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
stream_vt_rlistize(xs) =
(
  loop(xs, list_vt_nil())
) where
{
fun
loop
( xs
: stream_vt(a)
, r0: list_vt(a)): list_vt(a) =
(
case+ !xs of
|
strmcon_vt_nil() => r0
|
strmcon_vt_cons(x0, xs) =>
let
val r0 =
list_vt_cons(x0, r0) in loop(xs, r0)
end
)
} (* end of [stream_vt_rlistize] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
stream_vt_streamize(xs) = xs

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
g_free(xs);
g_free(ys);
case+ !xs of
| ~
strmcon_vt_nil() => !ys
| ~
strmcon_vt_cons(x0, xs) =>
strmcon_vt_cons(x0, append(xs, ys))
)
} (* end of [stream_vt_append] *)

(* ****** ****** *)
//
impltmp
<a>(*tmp*)
stream_vt_concat
  (xss) =
(
  auxmain0(xss)
) where
{
fnx
auxmain0(xss) =
$llazy
(
g_free(xss);
auxloop2(xss)
)
and
auxmain1(xss, xs0) =
$llazy
(
g_free(xss);
g_free(xs0);
(
case+ !xs0 of
| ~
strmcon_vt_nil() => auxloop2(xss)
| ~
strmcon_vt_cons(x0, xs1) =>
strmcon_vt_cons(x0, auxmain1(xss, xs1))
)
)
and
auxloop2(xss) =
(
case+ !xss of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(xs0, xss) =>
(
case+ !xs0 of
| ~
strmcon_vt_nil() => auxloop2(xss)
| ~
strmcon_vt_cons(x0, xs1) =>
strmcon_vt_cons(x0, auxmain1(xss, xs1))
)
)
} (* end of [stream_vt_concat] *)
//
(* ****** ****** *)
//
impltmp
<xs><x0>
stream_vt_gappend
  (xs1, xs2) = let
//
val xs1 =
glseq_streamize<xs><x0>(xs1)
val xs2 =
glseq_streamize<xs><x0>(xs2)
//
in
stream_vt_append<x0>(xs1, xs2)
end
//
(* ****** ****** *)
//
impltmp
<xs><x0>
stream_vt_gconcat
  (xss) =
(
  gconcat(xss)
) where
{
fun
gconcat(xss) =
$llazy
(
g_free(xss);
case+ !xss of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(xs0, xss) => !
(
stream_vt_append<x0>
(glseq_streamize<xs><x0>(xs0), gconcat(xss)))
)
} (* end of [stream_vt_gconcat] *)
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
stream_vt_sortedq
  (xs) =
(
case+ !xs of
| ~
strmcon_vt_nil() => true
| ~
strmcon_vt_cons(x0, xs) => loop(x0, xs)
) where
{
fun
loop
( x0: a
, xs: stream_vt(a)): bool =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
let val () = g_free<a>(x0) in true end
| ~
strmcon_vt_cons(x1, xs) =>
if
(x0 <= x1)
then
(g_free(x0); loop(x1, xs))
else
(g_free(x0); g_free(x1); g_free(xs); false)
)
} (* end of [stream_vt_sortedq] *)

(* ****** ****** *)

impltmp
<a><r0>
stream_vt_foldl0
  (xs, r0) = r0 where
{
//
var r0: r0 = r0
//
val p0 = $addr(r0)
//
val () =
(
  stream_vt_foreach0<a>(xs)
) where
{
impltmp
foreach0$work<a>(x0) =
let
val r0 = $UN.p2tr_get<r0>(p0)
in
//
$UN.p2tr_set<r0>
  (p0, foldl0$fopr<a><r0>(r0, x0))
//
end // end of [foreach0$work]
}
//
} (* end of [stream_foldl0/foreach0] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
stream_vt_forall0
  (xs) =
( loop(xs) ) where
{
fun
loop
( xs
: stream_vt(a)): bool =
(
case+ !xs of
| ~
strmcon_vt_nil() => true
| ~
strmcon_vt_cons(x0, xs) =>
let
  val
  test = forall0$test<a>(x0)
in
  if
  test
  then loop(xs) else (g_free(xs); false)
end
) (* end of [loop] *)
} (* end of [stream_vt_forall0] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
stream_vt_foreach0
  (xs) = let
//
val
test =
stream_vt_forall0<a>(xs) where
{
impltmp
forall0$test<a>(x0) =
let
val () = foreach0$work<a>(x0) in true
end
}
//
in
  // nothing
end // end of [stream_vt_foreach0/forall0]

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
| ~
strmcon_vt_nil() =>
strmcon_vt_nil((*void*))
| ~
strmcon_vt_cons(x0, xs) =>
let
  val y0 =
  map0$fopr<x0><y0>(x0)
in
  strmcon_vt_cons(y0, auxmain(xs))
end
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
: stream_vt(x0)
)
: stream_vt(x0) =
$llazy
(
g_free(xs);
auxloop($eval(xs)))
and
auxloop
( xs
: strmcon_vt(x0)
)
: strmcon_vt(x0) =
(
case+ xs of
| ~
strmcon_vt_nil
  () =>
strmcon_vt_nil()
| ~
strmcon_vt_cons
  (x0, xs) =>
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
: stream_vt(y0) =
$llazy
(
g_free(xs);
auxloop($eval(xs)))
and
auxloop
( xs
: strmcon_vt(x0)
)
: strmcon_vt(y0) =
(
case+ xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(x0, xs) =>
let
(*
  val
  opt =
  mapopt0$fopr<x0><y0>(x0)
*)
  val
  opt = filter1$test<x0>(x0)
in
(*
  case+ opt of
  | optn_vt_nil() =>
    auxloop($eval(xs)) // tail-call
  | optn_vt_cons(y0) =>
    strmcon_vt_cons(y0, auxmain(xs))
*)
  if
  opt
  then
  let
    val y0 =
    map0$fopr<x0><y0>(x0)
  in
    strmcon_vt_cons(y0, auxmain(xs))
  end
  else
  let
    val () =
    g_free(x0) in auxloop($eval(xs))
  end
//
end // end of [strmcon_vt_cons]
)
} (* end of [stream_vt_mapopt0] *)

(* ****** ****** *)

impltmp
<x0><y0>
stream_vt_mapoptn0
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
: stream_vt(y0) =
$llazy
(
g_free(xs);
auxloop($eval(xs)))
and
auxloop
( xs
: strmcon_vt(x0)
)
: strmcon_vt(y0) =
(
case+ xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(x0, xs) =>
let
  val
  opt =
  mapoptn0$fopr<x0><y0>(x0)
in
  case+ opt of
  | optn_vt_nil() =>
    auxloop($eval(xs)) // tail-call
  | optn_vt_cons(y0) =>
    strmcon_vt_cons(y0, auxmain(xs))
//
end // end of [strmcon_vt_cons]
)
} (* end of [stream_vt_mapoptn0] *)

(* ****** ****** *)

impltmp
<x0><y0>
stream_vt_maplist0
  (xs) =
(
  auxmain0(xs)
) where
{
fnx
auxmain0
( xs
: stream_vt(x0)
)
: stream_vt(y0) =
$llazy
(
g_free(xs);
auxloop2($eval(xs)))
//
and
auxmain1
( xs
: stream_vt(x0)
, ys: list_vt(y0)
) : stream_vt(y0) =
$llazy
(
g_free(xs);
g_free(ys);
case+ ys of
| ~
list_vt_nil() =>
auxloop2($eval(xs))
| ~
list_vt_cons(y0, ys) =>
strmcon_vt_cons(y0, auxmain1(xs, ys))
)
//
and
auxloop2
( xs
: strmcon_vt(x0)
)
: strmcon_vt(y0) =
(
case+ xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(x0, xs) =>
let
  val
  ys =
  maplist0$fopr<x0><y0>(x0)
in
  case+ ys of
  | ~
  list_vt_nil() =>
  auxloop2($eval(xs)) // tail-call
  | ~
  list_vt_cons(y0, ys) =>
  strmcon_vt_cons(y0, auxmain1(xs, ys))
end // end of [strmcon_vt_cons]
)
} (* end of [stream_vt_maplist0] *)

(* ****** ****** *)

impltmp
<x0><y0>
stream_vt_mapstrm0
  (xs) =
(
  auxmain0(xs)
) where
{
fnx
auxmain0
( xs
: stream_vt(x0)
)
: stream_vt(y0) =
$llazy
(
g_free(xs);
auxloop2($eval(xs)))
//
and
auxmain1
( xs
: stream_vt(x0)
, ys
: stream_vt(y0)
) : stream_vt(y0) =
$llazy
(
g_free(xs);
g_free(ys);
case+ !ys of
| ~
strmcon_vt_nil() =>
auxloop2($eval(xs))
| ~
strmcon_vt_cons(y0, ys) =>
strmcon_vt_cons(y0, auxmain1(xs, ys))
)
//
and
auxloop2
( xs
: strmcon_vt(x0)
)
: strmcon_vt(y0) =
(
case+ xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(x0, xs) =>
let
  val
  ys =
  mapstrm0$fopr<x0><y0>(x0)
in
  case+ !ys of
  | ~
  strmcon_vt_nil() =>
  auxloop2($eval(xs)) // tail-call
  | ~
  strmcon_vt_cons(y0, ys) =>
  strmcon_vt_cons(y0, auxmain1(xs, ys))
end // end of [strmcon_vt_cons]
)
} (* end of [stream_vt_mapstrm0] *)

(* ****** ****** *)
//
// For glseq-i-operations
//
(* ****** ****** *)

impltmp
<x0><y0>
stream_vt_imap0
  (xs) =
(
auxmain(0(*i0*), xs)
) where
{
fun
auxmain
( i0: nint
, xs
: stream_vt(x0)
)
: stream_vt(y0) =
$llazy
(
//
g_free(xs);
//
case+ !xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil((*void*))
| ~
strmcon_vt_cons(x0, xs) =>
let
  val y0 =
  imap0$fopr<x0><y0>(i0, x0)
in
  strmcon_vt_cons
  (y0, auxmain(succ(i0), xs))
end
)
} (* end of [stream_vt_imap0] *)

(* ****** ****** *)

impltmp
<x0><y0>
stream_vt_imapopt0
  (xs) =
(
auxmain(0(*i0*), xs)
) where
{
fnx
auxmain
( i0: nint
, xs
: stream_vt(x0)
)
: stream_vt(y0) =
$llazy
(
g_free(xs);
auxloop(i0, $eval(xs)))
and
auxloop
( i0: nint
, xs
: strmcon_vt(x0)
)
: strmcon_vt(y0) =
(
case+ xs of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil()
| ~
strmcon_vt_cons(x0, xs) =>
let
  val i1 = succ(i0)
  val
  opt = ifilter1$test<x0>(i0, x0)
in
  if
  opt
  then
  let
    val y0 =
    imap0$fopr<x0><y0>(i0, x0)
  in
    strmcon_vt_cons(y0, auxmain(i1, xs))
  end
  else
  let
    val () =
    g_free(x0) in auxloop(i1, $eval(xs))
  end
//
end // end of [strmcon_vt_cons]
)
} (* end of [stream_vt_imapopt0] *)

(* ****** ****** *)
//
// For z2-glseq-operations
//
(* ****** ****** *)

impltmp
<x0,y0>
stream_vt_z2streamize
( xs, ys ) =
auxmain(xs, ys) where
{
fun
auxmain
( xs
: stream_vt(x0)
, ys
: stream_vt(y0))
: stream_vt(@(x0, y0)) =
$llazy
(
g_free(xs);
g_free(ys);
case+ !xs of
//
| ~
strmcon_vt_nil
((*void*)) =>
(g_free(ys); strmcon_vt_nil())
//
| ~
strmcon_vt_cons
( x0, xs ) =>
(
case+ !ys of
| ~
strmcon_vt_nil
((*void*)) =>
( g_free(x0)
; g_free(xs); strmcon_vt_nil())
| ~
strmcon_vt_cons
( y0, ys ) =>
strmcon_vt_cons((x0, y0), auxmain(xs, ys))
) (* strmcon_vt_cons *)
//
)
} (* end of [stream_vt_zip2] *)

(* ****** ****** *)

impltmp
<x0,y0>
stream_vt_z2forall0
  (xs, ys) =
(
  loop(xs, ys)
) where
{
fun
loop
( xs
: stream_vt(x0)
, ys
: stream_vt(y0)): bool =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
(g_free(ys); true)
| ~
strmcon_vt_cons(x0, xs) =>
(
  case+ !ys of
  | ~
  strmcon_vt_nil() =>
  (g_free(xs); true)
  | ~
  strmcon_vt_cons(y0, ys) =>
  let
    val
    test =
    z2forall0$test<x0,y0>(x0, y0)
  in
    if
    test
    then loop(xs, ys)
    else (g_free(xs); g_free(ys); false)
  end // end of [strmcon_vt_cons]
)
) (* end of [loop] *)
} (* end of [stream_vt_z2forall0] *)

(* ****** ****** *)

impltmp
<x0,y0>
stream_vt_z2forcmp0
  (xs, ys) =
(
  loop(xs, ys)
) where
{
fun
loop
( xs
: stream_vt(x0)
, ys
: stream_vt(y0)): sint =
(
case+ !xs of
| ~
strmcon_vt_nil() =>
(
  case+ !ys of
  | ~
  strmcon_vt_nil() => 0
  | ~
  strmcon_vt_cons(y0, ys) =>
  (
    g_free(y0); g_free(ys); -1
  )
)
| ~
strmcon_vt_cons(x0, xs) =>
(
  case+ !ys of
  | ~
  strmcon_vt_nil() =>
  (
    g_free(x0); g_free(xs);  1
  )
  | ~
  strmcon_vt_cons(y0, ys) =>
  let
    val
    sign =
    z2forcmp0$fcmp<x0,y0>(x0, y0)
  in
    if
    (sign = 0)
    then loop(xs, ys)
    else (g_free(xs); g_free(ys); sign)
  end // end of [strmcon_vt_cons]
)
) (* end of [loop] *)
} (* end of [stream_vt_z2forcmp0] *)

(* ****** ****** *)
//
// HX-2020-06-02: for glseq-operations
//
(* ****** ****** *)
//
impltmp
{x0:vt}
glseq_listize0
<stream_vt(x0)><x0> = stream_vt_listize<x0>
impltmp
{x0:vt}
glseq_rlistize0
<stream_vt(x0)><x0> = stream_vt_rlistize<x0>
impltmp
{x0:vt}
glseq_streamize
<stream_vt(x0)><x0> = stream_vt_streamize<x0>
//
(* ****** ****** *)

(* end of [stream_vt.dats] *)
