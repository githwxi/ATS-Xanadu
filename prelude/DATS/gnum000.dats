(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)
(*
#staload
"./../SATS/gnum.sats"
*)
(* ****** ****** *)
//
#impltmp
{a:t0}
g_0<a>() = g_i<a>(0)
#impltmp
{a:t0}
g_1<a>() = g_i<a>(1)
#impltmp
{a:t0}
g_2<a>() = g_i<a>(2)
#impltmp
{a:t0}
g_3<a>() = g_i<a>(3)
#impltmp
{a:t0}
g_4<a>() = g_i<a>(4)
#impltmp
{a:t0}
g_5<a>() = g_i<a>(5)
//
(* ****** ****** *)

#impltmp
{a:t0}
g_succ<a>(x) =
g_add<a>(x, g_1<a>())
#impltmp
{a:t0}
g_pred<a>(x) =
g_sub<a>(x, g_1<a>())

(* ****** ****** *)
//
// HX:
// For linear gnums
//
(* ****** ****** *)

#impltmp
{a:t0}
gl_add00<a>(x, y) = g_add<a>(x, y)
#impltmp
{a:t0}
gl_add11<a>(x, y) = g_add<a>(x, y)

(* ****** ****** *)

#impltmp
{a:t0}
gl_sub00<a>(x, y) = g_sub<a>(x, y)
#impltmp
{a:t0}
gl_sub11<a>(x, y) = g_sub<a>(x, y)

(* ****** ****** *)

#impltmp
{a:t0}
gl_mul00<a>(x, y) = g_mul<a>(x, y)
#impltmp
{a:t0}
gl_mul11<a>(x, y) = g_mul<a>(x, y)

(* ****** ****** *)

#impltmp
{a:t0}
gl_div00<a>(x, y) = g_div<a>(x, y)
#impltmp
{a:t0}
gl_div11<a>(x, y) = g_div<a>(x, y)

(* ****** ****** *)

#impltmp
{a:t0}
gl_mod00<a>(x, y) = g_mod<a>(x, y)
#impltmp
{a:t0}
gl_mod11<a>(x, y) = g_mod<a>(x, y)

(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gnum000.dats] *)
