(* ****** ****** *)
(*
#staload "./../SATS/gflt.sats"
*)
(* ****** ****** *)
//
#impltmp
g_si<sflt> = gflt_si_sflt<>
#impltmp
g_ui<sflt> = gflt_ui_sflt<>
//
#impltmp
g_si<dflt> = gflt_si_dflt<>
#impltmp
g_ui<dflt> = gflt_ui_dflt<>
//
(* ****** ****** *)

#impltmp
g_print<sflt> = gflt_print_sflt<>
#impltmp
g_print<dflt> = gflt_print_dflt<>

(* ****** ****** *)
//
#impltmp
g_neg<sflt> = gflt_neg_sflt<>
#impltmp
g_neg<dflt> = gflt_neg_dflt<>
//
#impltmp
g_abs<sflt> = gflt_abs_sflt<>
#impltmp
g_abs<dflt> = gflt_abs_dflt<>
//
#impltmp
g_succ<sflt> = gflt_succ_sflt<>
#impltmp
g_pred<sflt> = gflt_pred_sflt<>
#impltmp
g_succ<dflt> = gflt_succ_dflt<>
#impltmp
g_pred<dflt> = gflt_pred_dflt<>
//
(* ****** ****** *)
//
#impltmp
g_lt<sflt> = gflt_lt_sflt_sflt<>
#impltmp
g_gt<sflt> = gflt_gt_sflt_sflt<>
#impltmp
g_eq<sflt> = gflt_eq_sflt_sflt<>
#impltmp
g_lte<sflt> = gflt_lte_sflt_sflt<>
#impltmp
g_gte<sflt> = gflt_gte_sflt_sflt<>
#impltmp
g_neq<sflt> = gflt_neq_sflt_sflt<>
//
#impltmp
g_lt<dflt> = gflt_lt_dflt_dflt<>
#impltmp
g_gt<dflt> = gflt_gt_dflt_dflt<>
#impltmp
g_eq<dflt> = gflt_eq_dflt_dflt<>
#impltmp
g_lte<dflt> = gflt_lte_dflt_dflt<>
#impltmp
g_gte<dflt> = gflt_gte_dflt_dflt<>
#impltmp
g_neq<dflt> = gflt_neq_dflt_dflt<>
//
(* ****** ****** *)

#impltmp
g_cmp<sflt> = gflt_cmp_sflt_sflt<>
#impltmp
g_cmp<dflt> = gflt_cmp_dflt_dflt<>

(* ****** ****** *)
//
#impltmp
g_add<sflt> = gflt_add_sflt_sflt<>
#impltmp
g_sub<sflt> = gflt_sub_sflt_sflt<>
#impltmp
g_mul<sflt> = gflt_mul_sflt_sflt<>
#impltmp
g_div<sflt> = gflt_div_sflt_sflt<>
//
#impltmp
g_add<dflt> = gflt_add_dflt_dflt<>
#impltmp
g_sub<dflt> = gflt_sub_dflt_dflt<>
#impltmp
g_mul<dflt> = gflt_mul_dflt_dflt<>
#impltmp
g_div<dflt> = gflt_div_dflt_dflt<>
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
gflt_lt_dflt_sint(f1, i2) =
gflt_lt_dflt_dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_gt_dflt_sint(f1, i2) =
gflt_gt_dflt_dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_eq_dflt_sint(f1, i2) =
gflt_eq_dflt_dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_lte_dflt_sint(f1, i2) =
gflt_lte_dflt_dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_gte_dflt_sint(f1, i2) =
gflt_gte_dflt_dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_neq_dflt_sint(f1, i2) =
gflt_neq_dflt_dflt(f1, g_si(i2))
//
#impltmp
<>(*tmp*)
gflt_cmp_dflt_sint(f1, i2) =
gflt_cmp_dflt_dflt(f1, g_si(i2))
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
gflt_lt_sint_dflt(i1, f2) =
gflt_lt_dflt_dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_gt_sint_dflt(i1, f2) =
gflt_gt_dflt_dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_eq_sint_dflt(i1, f2) =
gflt_eq_dflt_dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_lte_sint_dflt(i1, f2) =
gflt_lte_dflt_dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_gte_sint_dflt(i1, f2) =
gflt_gte_dflt_dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_neq_sint_dflt(i1, f2) =
gflt_neq_dflt_dflt(g_si(i1), f2)
//
#impltmp
<>(*tmp*)
gflt_cmp_sint_dflt(i1, f2) =
gflt_cmp_dflt_dflt(g_si(i1), f2)
//
(* ****** ****** *)

#impltmp
<>(*tmp*)
gflt_add_sint_dflt(i1, f2) =
gflt_add_dflt_dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_sub_sint_dflt(i1, f2) =
gflt_sub_dflt_dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_mul_sint_dflt(i1, f2) =
gflt_mul_dflt_dflt(g_si(i1), f2)
#impltmp
<>(*tmp*)
gflt_div_sint_dflt(i1, f2) =
gflt_div_dflt_dflt(g_si(i1), f2)

(* ****** ****** *)

#impltmp
<>(*tmp*)
gflt_add_dflt_sint(f1, i2) =
gflt_add_dflt_dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_sub_dflt_sint(f1, i2) =
gflt_sub_dflt_dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_mul_dflt_sint(f1, i2) =
gflt_mul_dflt_dflt(f1, g_si(i2))
#impltmp
<>(*tmp*)
gflt_div_dflt_sint(f1, i2) =
gflt_div_dflt_dflt(f1, g_si(i2))

(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gflt000.dats] *)
