(* ****** ****** *)
(*
The Concrete Syntax of ATS3
*)
(* ****** ****** *)

(* Sints *)

val _ =
01234567: sint
val _ =
123456789l: slint
val _ =
0xdeadbeefll: sllint
val _ =
0XDEADBEEFLL: sllint

val _ =
123u: uint
val _ =
123456789ul: ulint
val _ =
0XDEADBEEFULL: ullint

(* ****** ****** *)
//
(* Bools *)
//
(*
val _ = tbtf: bool(tt)
val _ = fbtf: bool(ff)
*)
val _ = true: bool(tt)
val _ = false: bool(ff)
//
(* ****** ****** *)

(* Chars *)

val _ = 'a'
val _ = '\n'
val _ = '\123'

(* ****** ****** *)

(* Floats *)

val _ = 0.01
val _ = 1E-2
val _ = 1000
val _ = 1.0E3
val _ = 3.1415926

val d0 = 1.0 : double
val f0 = 1.0f : float
val ld = 1.0l : ldouble

(* ****** ****** *)

(* Strings *)

val _ = "abcde"
val _ = "\"abcde\""
val _ =
"Hello, world!\n": string
val _ = "\
This is a string \
spreaded over multiple lines"

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

(* end of [ATS3-ConcreteSyntax.dats] *)
