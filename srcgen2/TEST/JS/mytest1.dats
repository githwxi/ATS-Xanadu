(* ****** ****** *)
(*
#infixr -> of 10
*)
(* ****** ****** *)
(*
val x1 = 1
and y2 = 2
val xy = x1 + y2
*)
(* ****** ****** *)
(*
val xs = list_nil()
val ys = list_cons(1, xs)
val zs = list_cons("1", ys)
*)
(* ****** ****** *)
#symload nil with list_nil
#symload cons with list_cons
#symload nil_vt with list_vt_nil
#symload cons_vt with list_vt_cons
(* ****** ****** *)

fun
<a:t0>
len(xs: list(a)) =
(
case+ xs of
| list_nil() => 0
| list_cons(_, xs) => len(xs) + 1
)

(* ****** ****** *)
////
(* ****** ****** *)
//
var z3: strn = "0"
val () = (z3 := "1")
//
(* ****** ****** *)
//
(*
fun
fact0(x) =
if x > 0 then x * fact0(x-1) else 1
*)
//
(* ****** ****** *)
#extern
fun
mymul: (sint, sint) -> sint
(* ****** ****** *)
fun
fact0(x: sint): strn =
if x > 0 then mymul(x, fact0(x-1)) else "1"
(* ****** ****** *)
//
(* ****** ****** *)
val ab = @(1,2)
(* ****** ****** *)
val ba = @{b=2,a=1}
(* ****** ****** *)
////
(* ****** ****** *)
val ff =
lam(x: int, y: int) => x + y
val gg =
fix f(x: int, y: int) => x + y
(* ****** ****** *)
#extern
fun fact(x: sint): sint
#implfun
fact(x: sint) =
if x > 0 then x * fact(x-1) else 1
(* ****** ****** *)
////
(* ****** ****** *)
val xy = @(0,1)
val x0 = (xy.0)
val y1 = (xy->1)
val z2 = (xy[0])
val () = (xy[1] := x + y)
(* ****** ****** *)
////
(* ****** ****** *)
var x1: sint = "0"
var x2: sint = true
(* ****** ****** *)
fun
id{a:tx}(x: a): a = x
(* ****** ****** *)
fun
fa(x: sint): sint = x + fb(x)
and
fb(x: bool): bool = x + fa(x)
(* ****** ****** *)
fun
fc(x: sint): bool =
let
val xx = x + x in xx > xx end
(* ****** ****** *)
fun
fd(x: bool): bool = if x then x
(* ****** ****** *)
fun
fe(x: bool): bool =
case+ x of true => x | false => ~x
(* ****** ****** *)
////
(* ****** ****** *)
#define ONE 1
#define TWO 2
(* ****** ****** *)
#abstbox
myint2(i0,i0)
#absimpl
myint2(a1,a2) =
@(sint(a1), sint(a1+a3))
(* ****** ****** *)
#define add(x)(y) = x + y
#define mul(x)(y) = x * y
#define
addmul(x,y)(z) = (x*z + y*z)
#define
muladd(x)(y,z) = (x*y + x*z)
(* ****** ****** *)
val one = ONE
val two = TWO
(* ****** ****** *)
fun
badd(x, y) = add y x
(* ****** ****** *)
//
fun
square(x) = mul(x)(x)
//
fun sumsqr(x, y) =
(square(x) + square(y))
//
fun sqrsum(x, y) =
let
val
xy0 =
add(x)(y) in square(xy0)
end (*let*) // end-of-fun
//
(* ****** ****** *)
datatype
AB2(a:t0, i0) =
| A(a, 0) of (a)
| {n:int} B(a, n) of (a, 0)
(* ****** ****** *)
#extern val ab2: AB2(int, 0)
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
foo(a:int) = a + a
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
excptcon
| TRUEexn of ()
| FALSEexn of 123
//
datatype AB1 = A | B
//
datatype
AB2(x:type) =
| A of (x) | B of (x, x)
//
datatype
AB3
(a:t0, n:i0) =
| A of (a) | B of (a, a)
//
(* ****** ****** *)
//
(* ****** ****** *)
datatype AB4(int) =
| A("0") of () | B(1) of ()
(* ****** ****** *)
//
(* ****** ****** *)
//
var a1: int = 0
val () = (a1 := a1 + 1)
//
(* ****** ****** *)
//
(* ****** ****** *)
vlr a2: int = a2 // recurs
val a2: int = a2 // nonrec
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
//
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
#declmod
(trec,debug)
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
