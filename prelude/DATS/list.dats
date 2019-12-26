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
list_nil?
  (xs) =
(
case+ xs of
| list_nil() => true
| list_cons(_, _) => false
)
impltmp
<>(*tmp*)
list_cons?
  (xs) =
(
case+ xs of
| list_nil() => false
| list_cons(_, _) => (true)
)
//
(* ****** ****** *)

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
list_revapp
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
} (* list_revapp *)
//
impltmp
<a>(*tmp*)
list_reverse
  (xs) =
(
list_revapp<a>(xs, list_nil())
) (* list_reverse *)
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
list_nil() => ()
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
  val ys = list_vt_cons{y0}(y0, ys)
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
impltmp
{x0:type}
gseq_nil
<x0,list(x0)>() = list_nil()
impltmp
{x0:type}
gseq_cons
<x0,list(x0)>
  (x0, xs) = list_cons(x0, xs)
//
(* ****** ****** *)

impltmp
{x0:type}
gseq_nil?
<x0,list(x0)>(xs) = list_nil?(xs)
impltmp
{x0:type}
gseq_cons?
<x0,list(x0)>(xs) = list_cons?(xs)

(* ****** ****** *)

impltmp
{x0:type}
gseq_length
<x0,list(x0)>(xs) = list_length<x0>(xs)

(* ****** ****** *)

impltmp
{x0:type}
gseq_forall
<x0,list(x0)>(xs) = list_forall<x0>(xs)

(* ****** ****** *)

impltmp
{x0:type}
gseq_foreach
<x0,list(x0)>(xs) = list_foreach<x0>(xs)

(* ****** ****** *)
//
impltmp
{x0:type
,xs:type
,y0:type}
gseq_map_list
<x0,list(x0)><y0>(xs) = list_map_vt<x0><y0>(xs)
impltmp
{x0:type
,xs:type
,y0:type}
gseq_maprev_list
<x0,list(x0)><y0>(xs) = list_maprev_vt<x0><y0>(xs)
//
(* ****** ****** *)

(* end of [list.dats] *)
