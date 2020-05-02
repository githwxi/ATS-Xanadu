(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)
(*
#staload
"./../SATS/gbas.sats"
#staload
"./../SATS/gord.sats"
#staload
"./../SATS/gord_vt.sats"
*)
(* ****** ****** *)

impltmp
{a:vtype}
gl_eq00a>(x, y) =
(gl_cmp00<a>(x, y) = 0)
impltmp
{a:vtype}
gl_neq00a>(x, y) =
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

(* end of [gord_vt.dats] *)
