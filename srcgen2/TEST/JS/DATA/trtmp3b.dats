(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)

val x1 = 1
and x2 = 2
val x12 = (1 + 2)

(* ****** ****** *)
//
#impltmp
gint_gt_sint_sint
  < (*nil*) >(x, y) = x > y
//
(* ****** ****** *)
//
#impltmp
gint_sub_sint_sint
  < (*nil*) >(x, y) = x - y
#impltmp
gint_add_sint_sint
  < (*nil*) >(x, y) = x + y
#impltmp
gint_mul_sint_sint
  < (*nil*) >(x, y) = x * y
//
(* ****** ****** *)

fun
fact(x: int): int = 
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)

(* end of [DATA/trtmp3b.dats] *)
