(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#extern
fun
<a:type
,b:type>
myswap1(x: a, y: b): @(b, a)
//
#extern
fun
<a:type
,b:type>
myswap2(x: a, y: b): @(b, a)
//
(* ****** ****** *)
//
#impltmp
<aa, bb>
myswap1(x, y) = (y, x)
//
(* ****** ****** *)
//
#impltmp
{aa: t0
,bb: t0}
myswap2
<aa,bb>(x, y) = (y, x)
//
#impltmp
myswap2
<sint,strn>(x, y) = (y, x)
#impltmp
myswap2
<strn,sint>(x, y) = (y, x)
//
(* ****** ****** *)

fun
myswap_try1
( x: sint
, y: strn)
: (strn, sint) = myswap1(x, y)

(* ****** ****** *)

fun
myswap_try2
( x: sint
, y: strn)
: (strn, sint) = myswap2(x, y)

(* ****** ****** *)

(* end of [DATA/trtmp3b_003.dats] *)
