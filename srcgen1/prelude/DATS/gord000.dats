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
//
#impltmp
{a:t0}
g_eq<a>(x, y) =
(g_cmp<a>(x, y) = 0)
#impltmp
{a:t0}
g_lt<a>(x, y) =
(g_cmp<a>(x, y) < 0)
#impltmp
{a:t0}
g_gt<a>(x, y) =
(g_cmp<a>(x, y) > 0)
#impltmp
{a:t0}
g_lte<a>(x, y) =
(g_cmp<a>(x, y) <= 0)
#impltmp
{a:t0}
g_gte<a>(x, y) =
(g_cmp<a>(x, y) >= 0)
#impltmp
{a:t0}
g_neq<a>(x, y) =
(g_cmp<a>(x, y) != 0)
//
(* ****** ****** *)
//
#impltmp
{a:t0}
g_ltz<a>(x) = (g_cmpz(x) < 0)
#impltmp
{a:t0}
g_gtz<a>(x) = (g_cmpz(x) > 0)
#impltmp
{a:t0}
g_eqz<a>(x) = (g_cmpz(x) = 0)
//
#impltmp
{a:t0}
g_ltez<a>(x) = (g_cmpz(x) <= 0)
#impltmp
{a:t0}
g_gtez<a>(x) = (g_cmpz(x) >= 0)
#impltmp
{a:t0}
g_neqz<a>(x) = (g_cmpz(x) != 0)
//
(* ****** ****** *)
//
#impltmp
{a:t0}
g_cmpz<a>(x) = (g_cmp(x, g_0()))
//
(* ****** ****** *)
//
#impltmp
{a:t0}
g_max<a>(x, y) =
if g_gte<a>(x, y) then (x) else (y)
#impltmp
{a:t0}
g_min<a>(x, y) =
if g_lte<a>(x, y) then (x) else (y)
//
(* ****** ****** *)
//
(*
HX:
For linear gord-ops
*)
//
(* ****** ****** *)
//
#impltmp
{a:t0}
g_eq00<a> = g_eq<a>
#impltmp
{a:t0}
g_eq11<a> = g_eq<a>
//
(* ****** ****** *)
//
#impltmp
{a:t0}
g_lt00<a> = g_lt<a>
#impltmp
{a:t0}
g_lt11<a> = g_lt<a>
#impltmp
{a:t0}
g_gt00<a> = g_gt<a>
#impltmp
{a:t0}
g_gt11<a> = g_gt<a>
//
(* ****** ****** *)
//
#impltmp
{a:t0}
g_lte00<a> = g_lte<a>
#impltmp
{a:t0}
g_lte11<a> = g_lte<a>
#impltmp
{a:t0}
g_gte00<a> = g_gte<a>
#impltmp
{a:t0}
g_gte11<a> = g_gte<a>
//
(* ****** ****** *)
//
#impltmp
{a:t0}
g_cmp00<a> = g_cmp<a>
#impltmp
{a:t0}
g_cmp11<a> = g_cmp<a>
//
(* ****** ****** *)
//
#impltmp
{a:t0}
g_max00<a> = g_max<a>
#impltmp
{a:t0}
g_max11<a> = g_max<a>
#impltmp
{a:t0}
g_min00<a> = g_min<a>
#impltmp
{a:t0}
g_min11<a> = g_min<a>
//
(* ****** ****** *)
//
#impltmp
{a:vt}
g_eq00<a>(x, y) =
(g_cmp00<a>(x, y) = 0)
#impltmp
{a:vt}
g_neq00<a>(x, y) =
(g_cmp00<a>(x, y) != 0)
//
(* ****** ****** *)
//
#impltmp
{a:vt}
g_lt00<a>(x, y) =
(g_cmp00<a>(x, y) < 0)
#impltmp
{a:vt}
g_gt00<a>(x, y) =
(g_cmp00<a>(x, y) > 0)
//
(* ****** ****** *)
//
#impltmp
{a:vt}
g_lte00<a>(x, y) =
(g_cmp00<a>(x, y) <= 0)
#impltmp
{a:vt}
g_gte00<a>(x, y) =
(g_cmp00<a>(x, y) >= 0)
//
(* ****** ****** *)
//
#impltmp
{a:vt}
g_max11<a>(x, y) =
if
(g_gte11<a>(x, y))
then g_copy<a>(x) else g_copy<a>(y)
#impltmp
{a:vt}
g_min11<a>(x, y) =
if
(g_lte11<a>(x, y))
then g_copy<a>(x) else g_copy<a>(y)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_gord000.dats] *)
