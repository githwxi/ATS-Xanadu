(* ****** ****** *)
(*
Thu Jul 14 12:57:48 EDT 2022
*)
(* ****** ****** *)
//
val x1 = 10
//
val x2 = 20
and x3 =
$lam($10 + $20)
//
val x4 =
$lam($10 + $20)
where
{ val foo1 = bar2 }
//
(* ****** ****** *)

val id = lam(x) => x
val id = fix f(x) => x

(* ****** ****** *)

val x4 =
if b0 > 0 then 1 else 0
val x4 =
if b0 > 0 then 1 else 0
endst{n:int}(x:int, y:int)

(* ****** ****** *)

val ln =
(case+ xs of
|list_nil() => 0|list_cons _ => 1)

(* ****** ****** *)

var foo1: int with foo2 = (1 + 2)

(* ****** ****** *)

fun fact(x:int): int =
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)

datatype
list(a:type) =
|list_nil |list_cons of (a, list(a))

(* ****** ****** *)

fun
<a:type>
list_length
(xs: list(a)): sint =
(
case+ xs of
|
list_nil() => 0
|
list_cons(_, xs) => 1 + list_length<a>(xs)
|
list_cons(_, xs) => (if(xs|xs)then(0)else(1))
)

(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_basics0.dats] *)
