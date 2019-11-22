(* ****** ****** *)
(*
//
val
fact =
fix f(x:int):int =>
if
x > 0
then x*f(x-1) else 1
//
val fact10 = fact(10)
//
*)
(* ****** ****** *)

val
fact10 = fact(10) where
{
fun
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1
}

(* ****** ****** *)
////
val
isevn =
fix f(x:int): bool =>
(
if x > 0 then g(x-1) else true
) where
{
val g =
lam(x) =>
if x > 0 then f(x-1) else false
}
val isevn100 = isevn(100)
val isevn101 = isevn(101)
////
(* ****** ****** *)

// (*
val x = 10
val y = 20
val f1 = lam(x:int) => x + x
val x2 = f(x)
val f2 = lam(x:int)(y:int) => x * y
val xy = f2(x)(y)
// *)
//
(* ****** ****** *)

(*
val xy = cons(x, cons(y, nil()))
*)

(* ****** ****** *)

(* end of [test01.dats] *)