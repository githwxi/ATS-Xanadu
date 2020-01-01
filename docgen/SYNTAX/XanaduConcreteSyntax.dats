(* ****** ****** *)
(*
The Concrete Syntax of Xanadu
*)
(* ****** ****** *)

(* Ints *)

val _ = 01234567
val _ = 123456789
val _ = 0xdeadbeef
val _ = 0XDEADBEEF

(* ****** ****** *)

(* Bools *)

val _ = true: bool(tt)
val _ = false: bool(ff)

(* ****** ****** *)

(* Chars *)

val _ = 'a'
val _ = '\n'
val _ = '\123'

(* ****** ****** *)

(* Strings *)

val _ = "abcde"
val _ = "\"abcde\""
val _ = "Hello, world!\n"

(* ****** ****** *)

val xyz = 0
val xyz' = 0
val x1yz = 0
val xyz1 = 0
val _X'Y'Z_ = 0
val some_variable = 0
val _$some$variable_ = 0

(* ****** ****** *)

#extern
fun fact(x: int): int
implfun
fact(x) =
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)

(* end of [XanaduConcreteSyntax.dats] *)
