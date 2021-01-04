(* ****** ****** *)
//
// HX-2021-01-04:
// For TBP-intro
//
(* ****** ****** *)
//
#extern
fun
<a:type>
list_equal
( xs: list(a)
, ys: list(a)): bool
//
impltmp
<a>(*tmp*)
list_equal
  (xs, ys) =
( loop(xs, ys) ) where
{
//
fun
loop
( xs: list(a)
, ys: list(a) ): bool =
(
case+ xs of
| list_nil() =>
  (
  case+ ys of
  | list_nil() => true
  | list_cons _ => false
  )
| list_cons(x0, xs) =>
  (
  case+ ys of
  | list_nil() => true
  | list_cons(y0, ys) =>
    let
      val ans =
      g_equal<a>(x0, y0)
    in
      if ans then loop(xs, ys) else false
    end
  )
) (* end of [loop] *)
//
} (* end of [list_equal] *)
//
(* ****** ****** *)
//
#extern
fun
<a:type>
list_fequal
( xs: list(a)
, ys: list(a)
, eq: (a, a) -> bool): bool
//
implement
<a>(*tmp*)
list_fequal
( xs, ys, eq ) =
( loop(xs, ys) ) where
{
//
fun
loop
( xs: list(a)
, ys: list(a) ): bool =
(
case+ xs of
|
list_nil() =>
(
  case+ ys of
  | list_nil() => true
  | list_cons _ => false
)
|
list_cons(x0, xs) =>
(
  case+ ys of
  | list_nil() => true
  | list_cons(y0, ys) =>
    let
      val ans = eq(x0, y0)
    in
      if ans then loop(xs, ys) else false
    end
) (* list_cons *)
) (* end of [loop] *)
//
} (* end of [list_fequal] *)
//
(* ****** ****** *)
impltmp
<a>(*tmp*)
list_fequal
  (xs, ys, eq) =
(
  list_equal<a>(xs, ys)
) where
{
  implement g_equal<a>(x, y) = eq(x, y)
}
(* ****** ****** *)

(* end of [TBP-intro.dats] *)
