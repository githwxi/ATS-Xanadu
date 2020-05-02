(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)
(*
#staload
"./../SATS/gord.sats"
*)
(* ****** ****** *)

impltmp
{a:type}
g_eq<a>(x, y) =
(g_cmp<a>(x, y) = 0)
impltmp
{a:type}
g_lt<a>(x, y) =
(g_cmp<a>(x, y) < 0)
impltmp
{a:type}
g_gt<a>(x, y) =
(g_cmp<a>(x, y) > 0)
impltmp
{a:type}
g_lte<a>(x, y) =
(g_cmp<a>(x, y) <= 0)
impltmp
{a:type}
g_gte<a>(x, y) =
(g_cmp<a>(x, y) >= 0)
impltmp
{a:type}
g_neq<a>(x, y) =
(g_cmp<a>(x, y) != 0)

(* ****** ****** *)
//
impltmp
{a:type}
g_ltz<a>(x) = (g_cmpz(x) < 0)
impltmp
{a:type}
g_gtz<a>(x) = (g_cmpz(x) > 0)
impltmp
{a:type}
g_eqz<a>(x) = (g_cmpz(x) = 0)
//
impltmp
{a:type}
g_ltez<a>(x) = (g_cmpz(x) <= 0)
impltmp
{a:type}
g_gtez<a>(x) = (g_cmpz(x) >= 0)
impltmp
{a:type}
g_neqz<a>(x) = (g_cmpz(x) != 0)

(* ****** ****** *)
//
impltmp
{a:type}
g_cmpz<a>(x) = (g_cmp(x, g_0()))
//
(* ****** ****** *)

impltmp
{a:type}
g_max<a>(x, y) =
if g_gte<a>(x, y) then (x) else (y)
impltmp
{a:type}
g_min<a>(x, y) =
if g_lte<a>(x, y) then (x) else (y)

(* ****** ****** *)

(* end of [gord.dats] *)
