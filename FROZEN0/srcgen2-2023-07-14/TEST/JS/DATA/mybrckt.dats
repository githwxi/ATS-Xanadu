(* ****** ****** *)
//
#extern
fun
myget_at
{a:t0}
( xs
: list(a), i0: nint): a
#extern
fun
myset_at
{a:t0}
( xs: list(a)
, i0: nint, x0: a): void
//
#symload [] with myget_at
#symload [] with myset_at of 1000
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
//
#extval
fun
<a:t0>
myget2_at
( xs
: list(a), i0: nint): a
#extval
fun
<a:t0>
myset2_at
( xs: list(a)
, i0: nint, x0: a): void
//
#symload [] with myget2_at
#symload [] with myset2_at of 1001
//
(* ****** ****** *)

fun
<a:t0>
myhead2_get
(xs: list(a)): a = xs[0]
fun
<a:t0>
myhead2_set
(xs: list(a), x0: a): void = (xs[0] := x0)

(* ****** ****** *)

(* end of [DATA/mybrckt.dats] *)
