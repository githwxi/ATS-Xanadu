(* ****** ****** *)
#infixl + - of 50
#infixl * / of 60
#prefix + - of 61
#infixl < <= of 30
#infixl > >= of 30
(* ****** ****** *)
//
fun
fact(x: sint): sint =
if x > 0 then x * fact(x-1) else 1
//
fun fact =
lam(x: sint) : sint =>
if x > 0 then x * fact(x-1) else 1
//
fun fact =
fix fact(x: sint) : sint =>
if x > 0 then x * fact(-1+x) else 1
//
(* ****** ****** *)

#typedef
fint2 =
lam(a:int): type => (int(a), int(a))

#typedef
fint2(a:int): type = (int(a), int(a))

(* ****** ****** *)

(* end of [mytest1.dats] *)
