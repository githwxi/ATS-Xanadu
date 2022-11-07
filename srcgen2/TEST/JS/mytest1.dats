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
//
#infix0 := of 0 // HX: assign
#infix0 :=: of 0 // HX: exchange
//
(* ****** ****** *)
#typedef
fint2 =
lam(a:int): type => (int(a), int(a))
#typedef
fint2(a:int): type = (int(a), int(a))
(* ****** ****** *)
var a1: int = 0
val () = (a1 := a1 + 1)
val (x1, y2) = (a1 + 1, a1 + 2)
val (x1, y2) = @(x1 + 1, y2 + 2)
val (x1, y2) = $(x1 + 1, y2 + 2)
(* ****** ****** *)
val dbl2 = lam(x:int) => x+x
val sqr2 = lam(x:int) => x*x
(* ****** ****** *)
val fact =
fix f(x:int): int =>
if x > 0 then x * f(x-1) else 1
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
