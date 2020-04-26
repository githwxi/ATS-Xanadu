(* ****** ****** *)
(*
** for lists_vt
*)
(* ****** ****** *)

(*
#staload
"./../SATS/list_vt.sats"
*)

(* ****** ****** *)
//
impltmp
<>(*tmp*)
list_vt_nilq
  (xs) =
(
case+ xs of
| !list_vt_nil() => true
| !list_vt_cons(_, _) => false
)
impltmp
<>(*tmp*)
list_vt_consq
  (xs) =
(
case+ xs of
| !list_vt_nil() => false
| !list_vt_cons(_, _) => (true)
)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_vt_free
  {n}(xs) = let
( loop(xs) ) where
{
fun
loop
{n:nat}.<n>.
(xs: list_vt(a, n)): void =
(
case+ xs of
| ~
list_vt_nil() => ()
| ~
list_vt_cons(x0, xs) =>
let
  val () = g_free<a>(x0) in loop(xs)
end
) (* end of [loop] *)
} (* end of [list_vt_free] *)
//
impltmp
<a>(*tmp*)
g_free<list_vt(a)> = list_vt_free<a>
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
list_vt_copy(xs) =
let
fun
loop
{n:nat}.<n>.
( xs
: !list_vt(a, n)
, r0
: &(?list_vt(a)>>list_vt(a, n))
) : void =
(
case+ xs of
| !
list_vt_nil() =>
(r0 := list_vt_nil())
| !
list_vt_cons(x0, xs) =>
let
  val x0 = g_copy<a>(x0)
  val () =
  (r0 := list_vt_cons(x0, _))
in
  loop(xs, r0.1); $fold(r0)
end
)
in
let
var r0: list_vt(a) in loop(xs, r0); r0
end
end // end of [list_vt_copy]

impltmp
<a>(*tmp*)
list_vt_rcopy(xs) =
list_vt_rappend10<a>(xs, list_vt_nil())

(* ****** ****** *)

impltmp
<a>(*tmp*)
list_vt_length
  {n}(xs) =
( loop(xs, 0) ) where
{
fun
loop
{i,j:nat|i+j==n}.<i>.
( xs
: !list_vt(a, i), j: int(j)): int(n) =
(
case+ xs of
| !list_vt_nil() => j
| !list_vt_cons(_, xs) => loop(xs, j+1)
)
} endwhr // end of [length_vt_length]

(* ****** ****** *)

impltmp
<a>(*tmp*)
list_vt_reverse(xs) =
list_vt_rappend<a>(xs, list_vt_nil())

(* ****** ****** *)

implement
<a>(*tmp*)
list_vt_rappend
  (xs, ys) =
(
  loop(xs, ys)
) where
{
//
fun
loop
{m,n:nat} .<m>.
( xs0
: list_vt(a, m)
, ys0
: list_vt(a, n)
) : list_vt(a, m+n) =
(
case+ xs0 of
| ~
list_vt_nil() => ys0
| @
list_vt_cons(_, _) =>
let
  val xs1 = xs0.1
  val ( ) = xs0.1 := ys0
in
  $fold(xs0); loop(xs1, xs0)
end // end of [list_vt_cons]
) (* end of [loop] *)
//
} (* end of [list_vt_rappend] *)

(* ****** ****** *)

implement
<a>(*tmp*)
list_vt_rappend10
  (xs, ys) =
(
  loop(xs, ys)
) where
{
//
fun
loop
{m,n:nat} .<m>.
( xs0
: !list_vt(a, m)
, ys0
: ~list_vt(a, n)
) : list_vt(a, m+n) =
(
case+ xs0 of
| !
list_vt_nil() => ys0
| !
list_vt_cons(x0, xs1) =>
let
val x0 = g_copy<a>(x0)
in
loop(xs1, list_vt_cons(x0, ys0))
end // end of [list_vt_cons]
) (* end of [loop] *)
//
} (* end of [list_vt_rappend10] *)

(* ****** ****** *)

implement
<a>(*tmp*)
list_vt_rappend11
  (xs, ys) =
(
  loop(xs, ys)
) where
{
//
fun
loop
{m,n:nat} .<m>.
( xs0
: !list_vt(a, m)
, ys0
: !list_vt(a, n)
) : list_vt(a, m+n) =
(
case+ xs0 of
| !
list_vt_nil() =>
 list_vt_copy<a>(ys0)
| !
list_vt_cons(x0, xs1) =>
let
val x0 = g_copy<a>(x0)
in
loop(xs1, list_vt_cons(x0, ys0))
end // end of [list_vt_cons]
) (* end of [loop] *)
//
} (* end of [list_vt_rappend11] *)

(* ****** ****** *)
//
(*
HX-2019-10:
Quite an informative example:
*)
//
impltmp
<a>(*tmp*)
list_vt_tabulate_cref
  {n}(n0, f0) = let
//
impltmp
tabulate$fopr<a><n>(i0) = f0(i0)
//
in
  list_vt_tabulate<a><n>(n0)
end // end of [list_vt_tabulate_cref]
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_vt_forall0
  (xs) =
  (loop(xs)) where
{
fun
loop
( xs
: list_vt(a)): bool =
(
case+ xs of
| ~
list_vt_nil() => true
| ~
list_vt_cons(x0, xs) =>
let
val
test = forall0$test<a>(x0)
in
//
if
test
then loop(xs)
else
let
val () =
list_vt_free(xs) in false end
//
end // end of [list_vt_cons]
)
} (* end of [list_vt_forall0] *)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_vt_foreach0
  (xs) =
  (loop(xs)) where
{
fun
loop
( xs
: list_vt(a)): void =
(
case+ xs of
| ~
list_vt_nil() => ()
| ~
list_vt_cons(x0, xs) =>
let
val () =
foreach0$work<a>(x0) in loop(xs)
end // end of [list_vt_cons]
)
} (* end of [list_vt_foreach0] *)
//
(* ****** ****** *)
//
impltmp
<x0><y0>
list_vt_map0(xs) = let
//
fun
loop{i:nat}.<i>.
( xs
: ~list_vt(x0, i)
, r0
: &(?list_vt(y0)) >> list_vt(y0, i)
) : void =
(
case+ xs of
| ~
list_vt_nil() =>
(r0 := list_vt_nil())
| ~
list_vt_cons(x0, xs) =>
let
  val y0 =
  map0$fopr<x0><y0>(x0)
  val () =
  (r0 := list_vt_cons(y0, _))
in
  loop(xs, r0.1); $fold(r0)
end
) (* end of [loop] *)
//
in
  let
  var r0: list_vt(y0)
  val () = loop(xs, r0) in r0 end
end (* end of [list_map0_vt] *)
//
(* ****** ****** *)

impltmp
<x0><y0>
list_vt_maprev0
  (xs) =
(
let
val ys =
list_vt_nil() in loop(xs, ys)
end
) where
{
//
fun
loop
{i,j:nat}.<i>.
( xs
: list_vt(x0, i)
, ys
: list_vt(y0, j))
: list_vt(y0, i+j) =
(
case+ xs of
| ~
list_vt_nil() => ys
| ~
list_vt_cons(x0, xs) =>
let
  val y0 =
  map0$fopr<x0><y0>(x0)
in
  loop(xs, list_vt_cons(y0, ys))
end
)
//
} (* end of [list_vt_maprev0] *)

(* ****** ****** *)
//
// For glseq-operations
//
(* ****** ****** *)
//
//
impltmp
{x0:vt}
glseq_nilq1
<x0,list_vt(x0)>(xs) =
(
case+ xs of
| !
list_vt_nil() => true
| !
list_vt_cons(_, _) => false
)
impltmp
{x0:vt}
glseq_consq1
<x0,list_vt(x0)>(xs) =
(
case+ xs of
| !
list_vt_nil() => false
| !
list_vt_cons(_, _) => (true)
)
//
(* ****** ****** *)

impltmp
{x0:vt}
glseq_uncons_raw
<x0,list_vt(x0)>(xs) =
let
val x0 = xs.0
val () = xs := xs.1 in x0 end

(* ****** ****** *)
//
impltmp
{x0:vt}
glseq_listize0
<x0,list_vt(x0)>(xs) = xs
impltmp
{x0:vt}
glseq_rlistize0
<x0,list_vt(x0)>(xs) = list_vt_reverse(xs)
//
(* ****** ****** *)
//
impltmp
{a:vt}
glseq_forall0<a,list_vt(a)> = list_vt_forall0<a>
impltmp
{a:vt}
glseq_foreach0<a,list_vt(a)> = list_vt_foreach0<a>
//
(* ****** ****** *)
//
impltmp
{a:vt}
glseq_map0_list<a,list_vt(a)> = list_vt_map0<a>
impltmp
{a:vt}
glseq_map0_rlist<a,list_vt(a)> = list_vt_maprev0<a>
//
(* ****** ****** *)

(* end of [list_vt.dats] *)
