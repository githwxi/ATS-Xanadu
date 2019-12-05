(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)

#staload
"./../SATS/gnum.sats"

(* ****** ****** *)

impltmp
{a:type}
g_0<a>() = g_i<a>(0)
impltmp
{a:type}
g_1<a>() = g_i<a>(1)
impltmp
{a:type}
g_2<a>() = g_i<a>(2)

(* ****** ****** *)

impltmp
{a:type}
g_succ<a>(x) = g_add(x, g_1())
impltmp
{a:type}
g_pred<a>(x) = g_sub(x, g_1())

(* ****** ****** *)

(* end of [gnum.dats] *)
