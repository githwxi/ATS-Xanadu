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
//
// HX:
// For linear gords
//
(* ****** ****** *)

impltmp
{a:vtype}
gl_eq00<a>(x, y) =
(gl_cmp00<a>(x, y) = 0)
impltmp
{a:vtype}
gl_neq00<a>(x, y) =
(gl_cmp00<a>(x, y) != 0)

(* ****** ****** *)

impltmp
{a:vtype}
gl_lt00<a>(x, y) =
(gl_cmp00<a>(x, y) < 0)
impltmp
{a:vtype}
gl_gt00<a>(x, y) =
(gl_cmp00<a>(x, y) > 0)

(* ****** ****** *)

impltmp
{a:vtype}
gl_lte00<a>(x, y) =
(gl_cmp00<a>(x, y) <= 0)
impltmp
{a:vtype}
gl_gte00<a>(x, y) =
(gl_cmp00<a>(x, y) >= 0)

(* ****** ****** *)

impltmp
{a:vtype}
gl_max11<a>(x, y) =
if gl_gte11<a>(x, y)
then g_copy<a>(x) else g_copy<a>(y)
impltmp
{a:vtype}
gl_min11<a>(x, y) =
if gl_lte11<a>(x, y)
then g_copy<a>(x) else g_copy<a>(y)

(* ****** ****** *)

impltmp
{a:tflt0}
gl_cmp00<a>(x, y) = g_cmp<a>(x, y)
impltmp
{a:tflt0}
gl_cmp11<a>(x, y) = g_cmp<a>(x, y)

(* ****** ****** *)

impltmp
{a:tflt0}
gl_max00<a>(x, y) = g_max<a>(x, y)
impltmp
{a:tflt0}
gl_max11<a>(x, y) = g_max<a>(x, y)

(* ****** ****** *)

impltmp
{a:tflt0}
gl_min00<a>(x, y) = g_min<a>(x, y)
impltmp
{a:tflt0}
gl_min11<a>(x, y) = g_min<a>(x, y)

(* ****** ****** *)

(* end of [gord.dats] *)
