(* ****** ****** *)
(*
The Concrete Syntax of ATS3
*)
(* ****** ****** *)

(* Ints *)

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
val _ = 1000.
val _ = 1.0E3
val _ = 3.1415926

val d0 = 1.0 : double
val f0 = 1.0f : float
val ld = 1.0l : ldouble

(* ****** ****** *)

(* Strings *)

val _ = "abcde"
val _ = "\"abcde\""
val _ = "\177\2ff\012\013"
val _ =
"Hello, world!\012": string
val _ = "\
This is a string \
spreaded over multiple lines."

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
#implfun
fact(x) =
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)

#extern
fun
<a:t0>
length(xs: list(a)): sint
#impltmp
{a:t0}
length<a>(xs) =
(
case+ xs of
| list_nil() => 0
| list_cons(_, xs) => 1 + length<a>(xs))

(* ****** ****** *)

#include "/path/to/myfile-for-inclusion.hats"
#staload "/path/to/myfile-for-staloading.sats"
#dyninit "/path/to/myfile-for-dyniniting.dats"
#staload NS = "/path/to/myfile-for-staloading.dats"

(* ****** ****** *)

(* end of [ATS3-Xanadu/docgenx/SYNTAX/ConcreteSyntax.dats] *)
