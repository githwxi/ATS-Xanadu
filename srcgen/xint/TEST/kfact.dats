(* ****** ****** *)

#extern
fun
<ans:type>
kfact
( n: int
, k: int -<cref> ans): ans

implement
<ans>
kfact =
fix
kf(n, k0) =>
if n > 0
then kf(n-1, lam(r) => k0(n * r))
else k0(1) // end of [if]

val
fact =
lam(n) => kfact<int>(n, lam r => r)

(* ****** ****** *)

val fact10 =
let val ans = fact(10) in ans end

(* ****** ****** *)

(* end of [kfact.dats] *)
