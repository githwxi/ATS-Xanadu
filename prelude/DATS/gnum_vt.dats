(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)

#staload
"./../SATS/gbas.sats"
#staload
"./../SATS/gnum.sats"
#staload
"./../SATS/gnum_vt.sats"

(* ****** ****** *)

impltmp
{a:tflt0}
gl_add00<a>(x, y) = g_add<a>(x, y)
impltmp
{a:tflt0}
gl_add11<a>(x, y) = g_add<a>(x, y)

(* ****** ****** *)

impltmp
{a:tflt0}
gl_sub00<a>(x, y) = g_sub<a>(x, y)
impltmp
{a:tflt0}
gl_sub11<a>(x, y) = g_sub<a>(x, y)

(* ****** ****** *)

impltmp
{a:tflt0}
gl_mul00<a>(x, y) = g_mul<a>(x, y)
impltmp
{a:tflt0}
gl_mul11<a>(x, y) = g_mul<a>(x, y)

(* ****** ****** *)

impltmp
{a:tflt0}
gl_div00<a>(x, y) = g_div<a>(x, y)
impltmp
{a:tflt0}
gl_div11<a>(x, y) = g_div<a>(x, y)

(* ****** ****** *)

impltmp
{a:tflt0}
gl_mod00<a>(x, y) = g_mod<a>(x, y)
impltmp
{a:tflt0}
gl_mod11<a>(x, y) = g_mod<a>(x, y)

(* ****** ****** *)

(* end of [gnum_vt.dats] *)
