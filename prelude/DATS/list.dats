(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)

#staload
"./../SATS/list.sats"

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
list_revapp(xs, list_nil())
) (* list_reverse *)
//
(* ****** ****** *)
//
impltmp
<a><b>
list_maprev(xs) =
(
list_vt2t(list_maprev_vt(xs))
)
//
impltmp
<a><b>
list_maprev_vt(xs) =
(
loop(xs, list_vt_nil((*void*)))
) where
{
//
fun
loop{i:nat}.<i>.
( xs
: list(a, i)
, ys
: list_vt(b, j)
) : list_vt(b, i+j) =
(
case+ xs of
| list_nil() => ys
| list_cons(x0, xs) =>
  (
    loop(xs, ys)
  ) where
  {
    val y0 = map$fopr(x0)
    val ys = list_vt_cons(y0, ys)
  }
) (* end of [loop] *)
//
} (* end of [list_maprev_vt] *)
//
(* ****** ****** *)

(* end of [list.dats] *)
