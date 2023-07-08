(* ****** ****** *)

val myadd =
lam(x: sint, y: sint) => x + y
val mymul =
lam(x: sint, y: sint) => x * y

(* ****** ****** *)

val myfact =
fix f(x: sint) =>
(if x > 0 then x * f(x-1) else 1)

(* ****** ****** *)

(* end of [DATA/myl1am.dats] *)
