(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)

#staload "./../SATS/gbas.sats"

(* ****** ****** *)

impltmp{a:tflt1} g_self<a>(x) = x

(* ****** ****** *)

impltmp{a:tflt0} g_free<a>(x) = ()

(* ****** ****** *)

impltmp{a:tflt0} g_copy<a>(x) = (x)

(* ****** ****** *)
//
// HX: for list_vt
//
(* ****** ****** *)

impltmp
{a:tflt1}
g_free<list_vt(a)>(xs) =
(
  loop(xs)
) where
{
fun`
loop(xs: list_vt(a)): void =
(
case+ xs of
|
~list_vt_nil() => ()
|
~list_vt_cons(x0, xs) =>
 let val () = g_free<a>(x0) in loop(xs) end
)
} (* end of [g_free] *)

(* ****** ****** *)

(* end of [gbas.sats] *)
