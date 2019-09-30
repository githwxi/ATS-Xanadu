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
| list_cons(_, _) => true
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
list_reverse
  (xs) =
(
  list_revapp<a>(xs, list_nil())
)
//
(* ****** ****** *)

(* end of [list.dats] *)
