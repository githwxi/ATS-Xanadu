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

(* end of [XanaduConcreteSyntax.dats] *)
