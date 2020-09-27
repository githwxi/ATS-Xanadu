(* ****** ****** *)
(*
** for lists
*)
(* ****** ****** *)

(*
#staload
"./../SATS/list.sats"
*)
(*
#staload
"./../SATS/gseq.sats"
*)

(* ****** ****** *)

impltmp
<a>(*tmp*)
list_sing(x0) =
list_cons(x0, list_nil())

(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_make_nval
  (n0, x0) =
(
list_vt2t
(list_make_nval_vt<a>(n0, x0))
)
//
impltmp
<a>(*tmp*)
list_make_nval_vt
  (n0, x0) =
(
loop(n0, list_vt_nil())
) where
{
fun
loop
{i,j:nat}.<i>.
( i0
: int(i)
, xs
: list_vt(a, j))
: list_vt(a, i+j) =
(
if
(i0 > 0)
then
loop
( pred(i0)
, list_vt_cons(x0, xs)) else xs
)
} (* end of [list_make_nval_vt] *)
//
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
list_head(xs) =
let
val+
list_cons
(x0, xs) = xs in x0 end
impltmp
<a:type>
list_tail(xs) =
let
val+
list_cons
(x0, xs) = xs in xs end
//
impltmp
<a:type>
list_head_raw(xs) = (xs.0)
impltmp
<a:type>
list_tail_raw(xs) = (xs.1)
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
list_get_at
  (xs, i0) =
(
  auxlst(xs, i0)
) where
{
fun
auxlst
{n:int}
( xs
: list(a, n)
, i0
: nintlt(n)): (a) =
(
case+ xs of
|
list_cons(x0, xs) =>
if
(i0 > 0)
then auxlst(xs, pred(i0)) else x0
) (* end of [auxlst] *)
} (* end of [list_get_at] *)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_extend
(xs, x0) = let
val ys =
list_sing<a>(x0) in
  list_append<a>(xs, ys)
end // end of [list_extend]
//
impltmp
<a>(*tmp*)
list_append
{m,n}
(xs, ys) = let
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
list_concat
  (xss) =
(
list_vt2t
(list_concat_vt<a>(xss))
)
//
impltmp
<a>(*tmp*)
list_concat_vt
  (xss) =
(
let
val
res = list_vt_nil()
in
list_vt_reverse<a>(auxmain(xss, res))
end
) where
{
fun
auxmain
( xss
: list(list(a))
, res: list_vt(a)): list_vt(a) =
(
case+ xss of
| list_nil() => res
| list_cons(xs, xss) =>
  auxmain(xss, list_rappend_vt(xs, res))
)
} (* end of [list_concat_vt] *)
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
(* ****** ****** *)

//
impltmp
<a>(*tmp*)
list_rappend_vt
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
: list_vt(a, n)): list_vt(a, m+n) =
(
case+ xs of
| list_nil() => ys
| list_cons(x0, xs) =>
  loop(xs, list_vt_cons(x0, ys))
)
} (* list_rappend_vt *)

(* ****** ****** *)
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
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_listize = list_copy_vt<a>
impltmp
<a>(*tmp*)
list_rlistize = list_rcopy_vt<a>
//
impltmp
<a>(*tmp*)
list_streamize
  (xs) =
( auxmain(xs) ) where
{
fun
auxmain(xs) =
$llazy
(
case+ xs of
|
list_nil() =>
strmcon_vt_nil()
|
list_cons(x0, xs) =>
strmcon_vt_cons(x0, auxmain(xs))
)
} (* end of [list_streamize] *)
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
typedef
ys = list_vt(y0)
typedef
ys(i:int) = list_vt(y0, i)
//
fun
loop
{i:nat}.<i>.
( xs:
  list(x0, i)
, r0:
& (?ys) >> ys(i)): void =
(
case+ xs of
|
list_nil() =>
(r0 := list_vt_nil())
|
list_cons(x0, xs) =>
let
val y0 =
map$fopr<x0><y0>(x0)
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
loop
{i,j:nat}.<i>.
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
  val y0 =
  map$fopr<x0><y0>(x0)
  val ys =
  list_vt_cons( y0, ys )
}
) (* end of [loop] *)
//
} (* end of [list_maprev_vt] *)
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
list_copy_vt
  (xs) =
(
list_map_vt<a><a>(xs)
) where
{
impltmp map$fopr<a><a>(x0) = x0
}
impltmp
<a>(*tmp*)
list_rcopy_vt
  (xs) =
(
list_maprev_vt<a><a>(xs)
) where
{
impltmp map$fopr<a><a>(x0) = x0
}

(* ****** ****** *)
//
(*
HX-2019-10:
Quite an informative example:
*)
//
impltmp
<a>(*tmp*)
list_tabulate_cfr
  {n}(n0, f0) = let
//
impltmp
tabulate$fopr<a><n>(i0) = f0(i0)
//
in
  list_tabulate<a><n>(n0)
end // end of [list_tabulate_cfr]
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
list_mergesort
  (xs) =
list_vt2t(list_mergesort_vt<a>(xs))
impltmp
<a>(*tmp*)
list_mergesort_vt
  (xs) =
list_vt_mergesort<a>(list_copy_vt<a>(xs))

(* ****** ****** *)
//
impltmp
<a>(*tmp*)
list_subsetize_vt
  (xs) =
(
  auxmain(xs)
) where
{
//
typedef
xs(n:int) =
listlte_vt(a, n)
//
fun
auxmain
{n:int}
( xs
: list(a, n))
: stream_vt(xs(n)) =
$llazy
(
case+ xs of
|
list_nil() =>
strmcon_vt_sing
(list_vt_nil())
|
list_cons(x0, xs) =>
let
val res1 =
auxmain(xs)
val res2 =
auxmain(xs)
val res2 =
stream_vt_map0(res2) where
{
sexpdef n0 = n
sexpdef n1 = pred(n)
impltmp
map0$fopr
<xs(n1)><xs(n0)>
(xs) = list_vt_cons(x0, xs)
}
in !
(stream_vt_append<xs(n)>(res1, res2))
end
)
} (* end of [list_subsetize_vt] *)
//
(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)
//
(*
impltmp
{a:t0}
$UN.gseq_head
<list(a)><a>(xs) = xs.0
impltmp
{a:t0}
$UN.gseq_tail
<list(a)><a>(xs) = xs.1
impltmp
{a:t0}
$UN.gseq_uncons
<list(a)><a>(xs) =
let
val x0 = xs.0
val () = xs := xs.1 in x0
end
*)
//
(* ****** ****** *)
//
impltmp
{a:t0}
gseq_nil
<list(a)><a>() = list_nil()
impltmp
{a:t0}
gseq_cons
<list(a)><a>
  (x0, xs) = list_cons(x0, xs)
//
(* ****** ****** *)
//
impltmp
{a:t0}
gseq_nilq
<list(a)><a> = list_nilq{a}
impltmp
{a:t0}
gseq_consq
<list(a)><a> = list_consq{a}
//
(* ****** ****** *)
//
impltmp
{a:t0}
gseq_uncons_raw
<list(a)><a>(xs) =
let
  val x0 = xs.0
  val () = xs := xs.1 in x0
end
//
(* ****** ****** *)
//
impltmp
{a:type}
gseq_head_raw
<list(a)><a> = list_head_raw<a>
impltmp
{a:type}
gseq_tail_raw
<list(a)><a> = list_tail_raw<a>
//
(* ****** ****** *)
//
impltmp
{a:t0}
g_cmp<list(a)> = gseq_cmp<list(a)><a>

(* ****** ****** *)
//
impltmp
{a:t0}
g_print<list(a)>(xs) =
let
val () =
gseq_print<list(a)><a>(xs)
end // end of [g_print]
//
impltmp
{a:t0}
gseq_print$beg
<list(a)><a>() = string_print("(")
impltmp
{a:t0}
gseq_print$end
<list(a)><a>() = string_print(")")
impltmp
{a:t0}
gseq_print$sep
<list(a)><a>() = string_print(",")
//
(* ****** ****** *)
//
impltmp
{a:t0}
gseq_length<list(a)><a> = list_length<a>
//
(* ****** ****** *)
//
impltmp
{a:t0}
gseq_forall<list(a)><a> = list_forall<a>
impltmp
{a:t0}
gseq_foreach<list(a)><a> = list_foreach<a>
//
(* ****** ****** *)

impltmp
{a:t0}
gseq_listize<list(a)><a> = list_listize<a>
impltmp
{a:t0}
gseq_rlistize<list(a)><a> = list_rlistize<a>
impltmp
{a:t0}
gseq_streamize<list(a)><a> = list_streamize<a>

(* ****** ****** *)
//
impltmp
{a:t0}
gseq_map_list<list(a)><a> = list_map_vt<a>
impltmp
{a:t0}
gseq_map_rlist<list(a)><a> = list_maprev_vt<a>
//
(* ****** ****** *)
//
(*
For gseqn-operations
*)
#staload "./../SATS/gseqn.sats"
//
(* ****** ****** *)

impltmp
{a:t0}{n:i0}
gseqn_nilq<list(a,n)><a><n> = list_nilq<>
impltmp
{a:t0}{n:i0}
gseqn_consq<list(a,n)><a><n> = list_consq<>

(* ****** ****** *)

impltmp
{a:t0}{n:i0}
gseqn_head<list(a,n)><a><n> = list_head<a>
impltmp
{a:t0}{n:i0}
gseqn_tail
<list(a,n)><a><n><list(a,n-1)> = list_tail<a>

(* ****** ****** *)

impltmp
{a:t0}{n:i0}
gseqn_length<list(a,n)><a><n> = list_length<a>

(* ****** ****** *)

(* end of [list.dats] *)
