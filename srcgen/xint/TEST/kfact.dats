(* ****** ****** *)

fun
kfact(n, k) =
if n > 0
then
kfact(n-1, lam(r) => k(n * r))
else k(1)

val
fact =
lam(n) => kfact(n, lam r => r)

(* ****** ****** *)

val fact10 =
let val ans = fact(10) in ans end

(* ****** ****** *)

(* end of [kfact.dats] *)
