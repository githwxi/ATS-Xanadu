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
{a:vt}
g_0<a>() = g_si<a>(0)
#impltmp
{a:vt}
g_1<a>() = g_si<a>(1)
#impltmp
{a:vt}
g_2<a>() = g_si<a>(2)
#impltmp
{a:vt}
g_3<a>() = g_si<a>(3)
#impltmp
{a:vt}
g_4<a>() = g_si<a>(4)
#impltmp
{a:vt}
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

#impltmp
{a:t0}
g_neg0<a> = g_neg<a>
#impltmp
{a:t0}
g_abs0<a> = g_abs<a>

(* ****** ****** *)

#impltmp
{a:t0}
g_succ0<a> = g_succ<a>
#impltmp
{a:t0}
g_pred0<a> = g_pred<a>

(* ****** ****** *)

#impltmp
{a:t0}
g_add00<a> = g_add<a>
#impltmp
{a:t0}
g_add11<a> = g_add<a>

(* ****** ****** *)

#impltmp
{a:t0}
g_sub00<a> = g_sub<a>
#impltmp
{a:t0}
g_sub11<a> = g_sub<a>

(* ****** ****** *)

#impltmp
{a:t0}
g_mul00<a> = g_mul<a>
#impltmp
{a:t0}
g_mul11<a> = g_mul<a>

(* ****** ****** *)

#impltmp
{a:t0}
g_div00<a> = g_div<a>
#impltmp
{a:t0}
g_div11<a> = g_div<a>

(* ****** ****** *)

#impltmp
{a:t0}
g_mod00<a> = g_mod<a>
#impltmp
{a:t0}
g_mod11<a> = g_mod<a>

(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_gnum000.dats] *)
