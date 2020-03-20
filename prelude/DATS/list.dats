(* ****** ****** *)
(*
** for lists
*)
(* ****** ****** *)

(*
#staload
"./../SATS/list.sats"
*)

(* ****** ****** *)
//
impltmp
<>(*tmp*)
list_nilq
  (xs) =
(
case+ xs of
| list_nil() => true
| list_cons(_, _) => false
)
impltmp
<>(*tmp*)
list_consq
  (xs) =
(
case+ xs of
| list_nil() => false
| list_cons(_, _) => (true)
)
//
(* ****** ****** *)
//
impltmp
<a:type>
list_head_raw(xs) = xs.0
impltmp
<a:type>
list_tail_raw(xs) = xs.1
//
impltmp
{a:type}
gseq_head_raw<a,list(a)> = list_head_raw<a>
impltmp
{a:type}
gseq_tail_raw<a,list(a)> = list_tail_raw<a>
//
(* ****** ****** *)

impltmp
{a:t0}
g_cmp<list(a)> = gseq_cmp<a,list(a)>

(* ****** ****** *)
//
impltmp
{a:t0}
g_print<list(a)>(xs) =
let
val () =
gseq_print<a,list(a)>(xs)
end
//
impltmp
{a:t0}
gseq_print$beg
< a, list(a) >() = string_print("(")
impltmp
{a:t0}
gseq_print$end
< a, list(a) >() = string_print(")")
impltmp
{a:t0}
gseq_print$sep
< a, list(a) >() = string_print(",")
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_length
  (xs) =
(
  loop(xs, 0)
) where
{
fun
loop{i,j:int}
( xs
: list(a, i)
, j0: int(j)): int(i+j) =
(
case+ xs of
| list_nil() => j0
| list_cons(_, xs) => loop(xs, j0+1)
)
} (* end of [list_length] *)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_append
{m,n}(xs, ys) = let
fun
loop
{m:nat} .<m>.
( xs
: list(a, m)
, r0
: &(?list(a) >> list(a, m+n))): void =
(
case+ xs of
| list_nil() =>
  (r0 := ys)
| list_cons(x0, xs) =>
  let
    val () =
    r0 := list_cons(x0, _)
  in
    loop(xs, r0.1); $fold(r0)
  end
)
in
  let
    var r0: list(a) in loop(xs, r0); r0
  end
end (* end of [list_append] *)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_rappend
  (xs, ys) =
(
  loop(xs, ys)
) where
{
fun
loop
{m,n:nat}.<m>.
( xs
: list(a, m)
, ys
: list(a, n)): list(a, m+n) =
(
case+ xs of
| list_nil() => ys
| list_cons(x0, xs) =>
  loop(xs, list_cons(x0, ys))
)
} (* list_rappend *)
//
impltmp
<a>(*tmp*)
list_reverse
  (xs) =
(
list_rappend<a>(xs, list_nil())
) (* list_reverse *)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_forall(xs) =
  (loop(xs)) where
{
fun
loop
(xs: list(a)): bool =
(
case+ xs of
| list_nil() => true
| list_cons(x0, xs) =>
  if
  forall$test<a>(x0)
  then loop(xs) else false
)
}
//
impltmp
{a:type}
gseq_forall<a,list(a)> = list_forall<a>
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_foreach(xs) =
  (loop(xs)) where
{
fun
loop
(xs: list(a)): void =
(
case+ xs of
| list_nil() => ()
| list_cons(x0, xs) =>
  let
  val () =
  foreach$work<a>(x0) in loop(xs)
  end
)
}
//
impltmp
{a:type}
gseq_foreach<a,list(a)> = list_foreach<a>
//
(* ****** ****** *)
//
impltmp
<x0><y0>
list_map(xs) =
(
list_vt2t(list_map_vt(xs))
)
//
impltmp
<x0><y0>
list_map_vt(xs) = let
//
fun
loop{i:nat}.<i>.
( xs
: list(x0, i)
, r0
: &(?list_vt(y0)) >> list_vt(y0, i)
) : void =
(
case+ xs of
|
list_nil() =>
(r0 := list_vt_nil())
|
list_cons(x0, xs) =>
let
val y0 = map$fopr(x0)
val () =
(r0 := list_vt_cons(y0, _))
in
  loop(xs, r0.1); $fold(r0)
end
) (* end of [loop] *)
//
in
let
var r0: list_vt(y0) in loop(xs, r0); r0
end
end (* end of [list_map_vt] *)
//
(* ****** ****** *)
//
impltmp
<x0><y0>
list_maprev(xs) =
(
list_vt2t(list_maprev_vt(xs))
)
//
impltmp
<x0><y0>
list_maprev_vt(xs) =
(
loop(xs, list_vt_nil((*void*)))
) where
{
//
fun
loop{i:nat}.<i>.
( xs
: list(x0, i)
, ys
: list_vt(y0, j)
) : list_vt(y0, i+j) =
(
case+ xs of
|
list_nil() => ys
|
list_cons(x0, xs) =>
(
  loop(xs, ys)
) where
{
  val y0 = map$fopr(x0)
  val ys =
  list_vt_cons{y0}(y0, ys)
}
) (* end of [loop] *)
//
} (* end of [list_maprev_vt] *)
//
(* ****** ****** *)
//
(*
HX-2019-10:
Quite an informative example:
*)
//
impltmp
<a>(*tmp*)
list_tabulate_cref
  {n}(n0, f0) = let
//
impltmp
tabulate$fopr<a><n>(i0) = f0(i0)
//
in
  list_tabulate<a><n>(n0)
end // end of [list_tabulate_cref]
//
(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)
//
impltmp
{a:t0}
$UN.gseq_head
<a,list(a)>(xs) = xs.0
impltmp
{a:t0}
$UN.gseq_tail
<a,list(a)>(xs) = xs.1
impltmp
{a:t0}
$UN.gseq_uncons
<a,list(a)>(xs) =
let
val x0 = xs.0
val () = xs := xs.1 in x0
end
//
(* ****** ****** *)
//
impltmp
{a:t0}
gseq_nil
<a,list(a)>() = list_nil()
impltmp
{a:t0}
gseq_cons
<a,list(a)>
  (x0, xs) = list_cons(x0, xs)
//
(* ****** ****** *)
//
impltmp
{a:t0}
gseq_nil?
<a,list(a)> = list_nil? <a>
impltmp
{a:t0}
gseq_cons?
<a,list(a)> = list_cons? <a>
//
(* ****** ****** *)
//
impltmp
{a:t0}
gseq_length<a,list(a)> = list_length<a>
//
(* ****** ****** *)
//
impltmp
{a:t0}
gseq_forall<a,list(a)> = list_forall<a>
//
(* ****** ****** *)
//
impltmp
{a:t0}
gseq_foreach<a,list(a)> = list_foreach<a>
//
(* ****** ****** *)
//
impltmp
{a:t0}
gseq_map_list<a,list(a)> = list_map_vt<a>
impltmp
{a:t0}
gseq_map_rlist<a,list(a)> = list_maprev_vt<a>
//
(* ****** ****** *)

(* end of [list.dats] *)
