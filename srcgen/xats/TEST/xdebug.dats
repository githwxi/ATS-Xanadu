(* ****** ****** *)
#staload "./xdebug.sats"
(* ****** ****** *)

#extern
fun
foo(x: int, y: string): void

(* ****** ****** *)

val x = 0
val y = "0"
val () = foo(x, y)

(* ****** ****** *)
////
val x = A[0]

(* ****** ****** *)
////
val x = 10: bool

(* ****** ****** *)
////
abstype xyz(a:i0)
absimpl xyz(a:i0) = sint(a)

(* ****** ****** *)
////
(*
val x1 = foo1<_>(10)
*)
val x2 = foo2<>{sint}(10, 10, 10)

(* ****** ****** *)
////
fun
foo
{a0:tx}
(x0:a0) = x0
val foo10 = foo(10)

(* ****** ****** *)
////
(* ****** ****** *)
#staload _ =
"prelude/DATS/gbas.dats"
(* ****** ****** *)
abstype T0
absvtype VT
(* ****** ****** *)
fun
foo_t0(x0: T0): void = g_free(x0)
(*
fun
foo_vt(x0: VT): void = g_free(x0)
*)
(* ****** ****** *)
////
impltmp
{a:t0}
rand<list(a)>() =
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
