(* ****** ****** *)
#staload "./xdebug.sats"
(* ****** ****** *)

impltmp
<a:t0>
foo(x) = ( x:a )

impltmp
{a:t0}
foo<a>(x, y) = ( x, y )

(* ****** ****** *)

////
impltmp
{a:t0}
foo<a,a>(x) = x
////
impltmp
{a:vt}
foo<a,a>(x) = x

////
absvtype vt
vtypedef vts = list_vt(vt)
////
fun
foo(xs: list(int)) = length<int>(xs)