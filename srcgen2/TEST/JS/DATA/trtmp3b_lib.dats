(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#impltmp
gint_lt_sint_sint
  < (*nil*) >(x, y) = x < y
#impltmp
gint_gt_sint_sint
  < (*nil*) >(x, y) = x > y
#impltmp
gint_eq_sint_sint
  < (*nil*) >(x, y) = x = y
//
#impltmp
gint_lte_sint_sint
  < (*nil*) >(x, y) = x <= y
#impltmp
gint_gte_sint_sint
  < (*nil*) >(x, y) = x >= y
#impltmp
gint_neq_sint_sint
  < (*nil*) >(x, y) = x != y
//
(* ****** ****** *)
//
#impltmp
gint_add_sint_sint
  < (*nil*) >(x, y) = (x + y)
#impltmp
gint_sub_sint_sint
  < (*nil*) >(x, y) = (x - y)
//
(* ****** ****** *)
//
#impltmp
gint_mul_sint_sint
  < (*nil*) >(x, y) = (x * y)
#impltmp
gint_div_sint_sint
  < (*nil*) >(x, y) = (x / y)
//
(* ****** ****** *)

(* end of [DATA/trtmp3b_lib.dats] *)
