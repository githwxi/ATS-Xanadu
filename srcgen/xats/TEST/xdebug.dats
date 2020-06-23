(* ****** ****** *)
#staload "./xdebug.sats"
(* ****** ****** *)

impltmp
{a:t0}
rand<list_vt(a)>() =
list_vt2t(rand_list<a>())

(* ****** ****** *)
////
impltmp
<a:t0>
foo(x) = ( x:a )

impltmp
{a:vt}
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

(* ****** ****** *)

(* end of [xdebug.dats] *
