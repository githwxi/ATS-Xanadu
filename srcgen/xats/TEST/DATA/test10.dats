(* ****** ****** *)
#staload
"prelude\
/DATS/CATS\
/Xats/basics.dats"
(* ****** ****** *)
//
(*
HX-2021-01-15:
For testing [$exist]
*)
//
(* ****** ****** *)

(*
val x0 = $exists(1)
*)
(*
val x1 = $exists{1}(1)
*)

(* ****** ****** *)

val fxy =
lam{n:int}
(x: int(n))
(y: int(n)): int(n+n) => x+y

val sum = fxy(1000000)(1000000)

(* ****** ****** *)

(* end of [test10.dats] *)
