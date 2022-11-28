(* ****** ****** *)
(*
#infixr -> of 10
*)
(* ****** ****** *)
//
(*
#infix0 < <= of 40 (*lt/eq*)
#infix0 > >= of 40 (*gt/eq*)
#infix0 = != of 30 (*equal*)
*)
//
(* ****** ****** *)
//
(*
#infixl + of 50
#infixl - of 50
#infixl * of 60
#prefix + of +(+1) (*uplus*)
#prefix - of -(+1) (*uminus*)
*)
//
(* ****** ****** *)
//
(*
#infix0 := of 0 // HX: assign
#infix0 :=: of 0 // HX: exchng
*)
//
(* ****** ****** *)
#sexpdef
foo(a:int) = a + 1
(* ****** ****** *)
//
#sexpdef
fint1 =
lam
(
a:int
):type => (int(a), int(a))
//
#sexpdef
fint2
(
a:int
): vtbx = $(int(a), int(a))
//
#typedef
fint3
(
a:i0, b:b0
): type =
$rec{x= sint(a), y= bool(b)}
//
(* ****** ****** *)
//
var a1: int = 0
val () = (a1 := a1 + 1)
//
(* ****** ****** *)
//
(* ****** ****** *)
val a2: int = a2 // nonrec
vlr a2: int = a2 // recurs
(* ****** ****** *)
//
(* ****** ****** *)
val
(x1, y2) = (a1 + 1, a1 + 2)
val
(x3, y4) = @(x1 + 1, y2 + 2)
val
(x5, y6) = $(x3 + 1, y4 + 2)
//
(* ****** ****** *)
val dbl2 = lam(x:int) => x+x
val sqr2 = lam(x:int) => x*x
(* ****** ****** *)
val fact =
fix f(x:int): int =>
if x > 0 then x * f(x-1) else 1
(* ****** ****** *)
//
(* ****** ****** *)
//
fun
fact0(x: sint): sint =
if x > 0 then x * fact0(x-1) else 1
//
fn0 fact0 =
lam(x: sint) : sint =>
if x > 0 then x * fact0(x-1) else 1
//
fun fact2 =
fix fact2(x: sint) : sint =>
if x > 0 then x * fact2(-1+x) else 1
//
(* ****** ****** *)
////
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
(xs: list(a)): sint = 
(
case+ xs of
|list_nil() => 0
|list_cons(_, xs) => 1+length<a>(xs))
(* ****** ****** *)
(*
#declmod(trec,debug)
#impltmp
{ a:t0 }
length<a>(xs: list(a)): sint =
(
case+ xs of
|list_nil() => 0
|list_cons(_, xs) => 1+length<a>(xs))
)
val:
rec
fact =
lam(x) => if x >= 0 then x * fact(x-1) else 1
*)
(* ****** ****** *)

(* end of [mytest1.dats] *)
