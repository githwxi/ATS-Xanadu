(* ****** ****** *)
#infixr -> of 10
(* ****** ****** *)
//
#infix0 < <= of 40 (*lt/eq*)
#infix0 > >= of 40 (*gt/eq*)
#infix0 = != of 30 (*equal*)
//
(* ****** ****** *)
//
#infixl + of 50
#infixl - of 50
#infixl * of 60
#prefix + of +(+1) (*uplus*)
#prefix - of -(+1) (*uminus*)
//
(* ****** ****** *)
#typedef
fint2 =
lam(a:int): type => (int(a), int(a))
#typedef
fint2(a:int): type = (int(a), int(a))
(* ****** ****** *)
val x: int = 0
var x: int = 0
(* ****** ****** *)
////
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
fun
<a:t0>
length(xs: list(a)): sint = 
(
case+ xs of
|list_nil() => 0
|list_cons(_, xs) => 1+length<a>(xs))
(* ****** ****** *)
#impltmp
{a:t0}
length<a>
(xs: list(/a)): sint = 
(
case+ xs of
|list_nil() => 0
|list_cons(_, xs) => 1+length<a>(xs))
(* ****** ****** *)

(* end of [mytest1.dats] *)
