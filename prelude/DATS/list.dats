(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)

#staload
"./../SATS/list.sats"

(* ****** ****** *)

impltmp
{a:type}
list_length<a>
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

(* end of [list.dats] *)
