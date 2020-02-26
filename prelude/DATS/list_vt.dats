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

impltmp
<a>(*tmp*)
list_vt_length
  {n}(xs) = let
( loop(xs, 0) ) where
{
fun
loop
{i,j:nat|i+j==n}.<i>.
( xs
: !list_vt(a, i), j: int(j)): int(n) =
(
case+ xs of
| list_vt_nil() => j
| list_vt_cons(_, xs) => loop(xs, j+1)
)
} endwhr // end of [length_vt_length]

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

(* end of [list_vt.dats] *)
