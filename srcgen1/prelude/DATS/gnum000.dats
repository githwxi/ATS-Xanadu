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
g_0<a>() = g_si<a>(0)
#impltmp
{a:t0}
g_1<a>() = g_si<a>(1)
#impltmp
{a:t0}
g_2<a>() = g_si<a>(2)
#impltmp
{a:t0}
g_3<a>() = g_si<a>(3)
#impltmp
{a:t0}
g_4<a>() = g_si<a>(4)
#impltmp
{a:t0}
g_5<a>() = g_si<a>(5)
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
//
#impltmp
{a:t0}
gl_0<a> = g_0<a>
#impltmp
{a:t0}
gl_1<a> = g_1<a>
#impltmp
{a:t0}
gl_2<a> = g_2<a>
#impltmp
{a:t0}
gl_3<a> = g_3<a>
#impltmp
{a:t0}
gl_4<a> = g_4<a>
#impltmp
{a:t0}
gl_5<a> = g_5<a>
//
(* ****** ****** *)

#impltmp
{a:t0}
gl_add00<a> = g_add<a>
#impltmp
{a:t0}
gl_add11<a> = g_add<a>

(* ****** ****** *)

#impltmp
{a:t0}
gl_sub00<a> = g_sub<a>
#impltmp
{a:t0}
gl_sub11<a> = g_sub<a>

(* ****** ****** *)

#impltmp
{a:t0}
gl_mul00<a> = g_mul<a>
#impltmp
{a:t0}
gl_mul11<a> = g_mul<a>

(* ****** ****** *)

#impltmp
{a:t0}
gl_div00<a> = g_div<a>
#impltmp
{a:t0}
gl_div11<a> = g_div<a>

(* ****** ****** *)

#impltmp
{a:t0}
gl_mod00<a> = g_mod<a>
#impltmp
{a:t0}
gl_mod11<a> = g_mod<a>

(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_gnum000.dats] *)
