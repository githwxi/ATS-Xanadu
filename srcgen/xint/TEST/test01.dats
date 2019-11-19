(* ****** ****** *)

val x = 10
val y = 20
val z = x * y % y
val f = lam(x:int) => x + x
////
(* ****** ****** *)

val xy = cons(x, cons(y, nil()))

(* ****** ****** *)

fun
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1

val fact10 = fact(10)

(* ****** ****** *)

(* end of [test01.dats] *)