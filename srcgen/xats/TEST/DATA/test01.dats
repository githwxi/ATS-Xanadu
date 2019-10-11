(* ****** ****** *)

var x: int
val () = (x := 1)
val p0 = $addr(x)

(* ****** ****** *)
////
val x = A.x[a]

(* ****** ****** *)
////
fun
foo(&x: int): void = x := 1

////

case !p0 of
| @list_vt(x0, xs) =>

$fold(xs)
$addr(xs)
&xs

(* ****** ****** *)
////
#extern
fun
<a:type>
g_add : (a, a) -> a
#symload + with g_add

(* ****** ****** *)

(*
#extern
val
gint_add :
(int, int) -> int
and
gint_sub :
(int, int) -> int
*)

#extern
fun
gint_add :
(int, int) -> int
and
gint_sub :
(int, int) -> int
and
gint_mul :
(int, int) -> int

#symload + with gint_add
#symload - with gint_sub
#symload * with gint_mul

(* ****** ****** *)

#extern
fun
gint_gt1 :
(int, int) -> bool
and
gint_lt1 :
(int, int) -> bool

#symload > with gint_gt1 of 1
#symload < with gint_lt1 of 1

(* ****** ****** *)

#extern
fun
gint_gt2 :
(int, int) -> bool
and
gint_lt2 :
(int, int) -> bool

#symload > with gint_gt2 of 2
#symload < with gint_lt2 of 2

(* ****** ****** *)

#extern
fun
gint_gte1 :
(int, int) -> bool
and
gint_lte1 :
(int, int) -> bool

#symload >= with gint_gte1 of 1
#symload <= with gint_lte1 of 1

(* ****** ****** *)

#symload gte with gint_gte1 of 1

(* ****** ****** *)

(*
#symload > with gint_gt3 of 3
#symload < with gint_lt3 of 3
*)

(* ****** ****** *)
//
#extern
fun
bool_neg : (bool) -> bool
#symload not with bool_neg
//
(* ****** ****** *)
//
#extern
fun
gfloat_add :
(dfloat,double) -> double
#symload + with gfloat_add
//
(* ****** ****** *)

(*
#define
pow(x, n)
if
n > 0
then x*pow(x, n-1) else 1
*)

(*
#macdef
pow
{res:type}(x, n) =
let
val res: res = pow(x, n-1)
in
  if n > 0 then x * res else 1
end
*)

(* ****** ****** *)

(*
val x = 1 + 2
val f = 1.0 + 2.0
val s = "1" + "2"
*)

(* ****** ****** *)

val:
rec
fact =
lam(x:int): int =>
if x > 0 then x*fact(x-1) else 1

(* ****** ****** *)

fun:rec
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)

#extern
fun
<x:type>
list_vt_length
  {n:nat}
  (xs: list_vt(x, n)): int(n)
// end of [list_vt_length]

implement
{x:type}
list_vt_length<x>
  {n}(xs) =
( loop(xs, 0) ) where
{
//
fun
loop{i,j:nat|i+j=n}
(xs:
list_vt(x, i), j: int(j)): int(i+j) =
case+ xs of
| nil_vt() => j | cons_vt(_, xs) => loop(xs, j+1)
//
}(*list_vt_length*)

(* ****** ****** *)
////
#extern
fun
<x:type>
list_make_elt
  {n:nat}
  (n: int n, x: x): list_vt(x, n)
// end of [list_make_elt]

implmnt
<x>(*tmp*)
list_make_elt
  {n} (n, x) = let
//
fun:
(prf,trec)
loop
{i:nat | i <= n} .<i>.
(
  i: int i
, x: x, res: list_vt(x, n-i)
) : list_vt(x, n) =
(
  if (i > 0)
    then loop(i-1, x, cons(x, res)) else res
  // end of [if]
) // end of [loop]
//
in
  loop(n, x, nil())
end // end of [list_make_elt]

(* ****** ****** *)
////
fun<>
isevn(x: int) =
if x > 0
then not(isodd(x-1)) else true
and
isodd(x: int) =
if x > 0
then not(isevn(x-1)) else false

(* ****** ****** *)

(*
implement
isevn(x) =
if x > 0
then not(isodd(x-1)) else true
implement
isodd(x) =
if x > 0
then not(isevn(x-1)) else false
*)

(* ****** ****** *)
////
fun
<a:type>
length
(xs:list(a)): int =
(
case+ xs of
| nil() => 0
| cons(_, xs) => 1+length(xs)
)

(* ****** ****** *)
////
val x: int = 1sz

(* ****** ****** *)
////
var d2v:int = 0
var d2v:uint = 0u
var d2v:double = 0.0
var d2v:string with pf0 = "0.0"

(* ****** ****** *)
////
fun
not(tf: bool) =
(
case tf of
true => false | false => true
)

(* ****** ****** *)
////
#extern
fun
isodd(n:int): bool
and
isevn(n:int): bool

implmnt
isevn(n) =
if n > 0 then isodd(n-1) else true
implmnt
isodd(n) =
if n > 0 then isevn(n-1) else false

(* ****** ****** *)

(*
#extern
fun
<x:type>
identity1(x: !x >> x): void
#extern
fun
<x:type>
identity2(x: &x >> x): void
*)

(* ****** ****** *)
////
#extern
fun
<x:type>
list_init{n:int}
(x0: !list(?x, n) >> list(x, n))
#extern
fun
<x:type>
list_clear{n:int}
(x0: !list(x, n) >> list(?!x, n))

(* ****** ****** *)
////

#extern
fun
<a:type>
power(x: a, n: int): a

impltmp
{a:type}
power<a>(x, n) =
if n > 0 then x * power(x, n-1) else 1

impltmp
<a:type>
power(x, n) =
if n > 0 then x * power(x, n-1) else 1

(* ****** ****** *)
////

fun
<a:type>
power(x, n) =
if n > 0 then x * power(x, n-1) else 1
withtype (a, int) -> a 

////

(* ****** ****** *)

implmnt
{a:type}//...
power<a>(x, n) =
if n > 0 then x * power(x, n-1) else 1
////
(* ****** ****** *)

(*
fun
omega(x) = x(x)
*)

(* ****** ****** *)

(*
val x: int = 0
val y: int = x
*)

(* ****** ****** *)

fun
<a:type>
<b:type>
map
( xs: list(a)
, f0: a -<cloref> b) =
(
case+ xs of
| list_nil() =>
  1 // list_nil()
| list_cons(x0, xs) =>
  list_cons(f0(x0), map(xs, f0))
)
(* ****** ****** *)

////

fun
<a:type>
app2(f: a -> a, x: a) = f(f(x))


(* ****** ****** *)
////
fun<>
foo(n:int): int = foo(n)
fun<>
foo{n:int}(n:int(n)): int = foo{n}(n)

(* ****** ****** *)
////

fun
foo(x:int, y): int =
let val x = 1 in x; x; y; y; x end

////
fun
<a:type
,b:type>
swap(xy: @(a, b)) = $(xy.1, xy.0)

(* ****** ****** *)
////
val a = 0
val b = 0
val x = 0
val y = x.1(a, b)
////
(* ****** ****** *)
////
var x: (int, int)
val () = x.0 := 0
val () = x.1 := 1

(* ****** ****** *)
////
val
omega:
int -> int = lam(x) => x+1
////
(* ****** ****** *)

fun<>
fib(n: int) =
if
n <= 1
then n
else
(
  fib(n1) + fib(n2)
) where
{
  val n1 = n - 1 and n2 = n - 2
}
////
(* ****** ****** *)

fun
<a:type>
length
(xs:list(a)): int =
let
fun
loop(xs, i0) =
case+ xs of
| list_nil() => 0
| list_cons(_, xs) => loop(xs, i0+1)
in
  loop(xs, 0)
end
////
(* ****** ****** *)

fun
<a:type>
append
(xs:list(a)
,ys:list(a)): list(a) =
(
case+ xs of
| list_nil() => ys
| list_cons(x0, xs) =>
  list_cons(x0, append(xs, ys))
)
////
(* ****** ****** *)

fun succ(x:int):int = x+1

(* ****** ****** *)
////
fun:nrc
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)

(* end of [test01.dats] *)
