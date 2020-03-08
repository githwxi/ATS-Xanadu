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
|
~ list_vt_nil() => ()
|
~ list_vt_cons(x0, xs) =>
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
|
~list_vt_nil() => true
|
~list_vt_cons(x0, xs) =>
let
val
test =
forall0$test<a>(x0)
in
//
if
test
then loop(xs)
else
let
val () =
list_vt_free(xs) in false
end // end of [else]
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
: list_vt(a)): bool =
(
case+ xs of
|
~list_vt_nil() => true
|
~list_vt_cons(x0, xs) =>
let
val () =
foreach0$work<a>(x0) in loop(xs)
end // end of [list_vt_cons]
)
} (* end of [list_vt_foreach0] *)
//
(* ****** ****** *)

(* end of [list_vt.dats] *)
