(* ****** ****** *)
//
#extern
fun
<a:t0>
myget_at
( xs
: list(a), i0: nint): a
#extern
fun
<a:t0>
myset_at
( xs: list(a)
, i0: nint, x0: a): void
#symload [] with myset_at
//
(* ****** ****** *)

fun
<a:t0>
myhead_get
(xs: list(a)): a = xs[0]
fun
<a:t0>
myhead_set
(xs: list(a), x0: a): void = (xs[0] := x0)

(* ****** ****** *)

(* end of [DATA/mybrckt.dats] *)
