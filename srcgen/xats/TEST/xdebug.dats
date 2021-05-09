(* ****** ****** *)
#include
"share\
/xatsopt_prelude.hats"
(* ****** ****** *)
#staload "./xdebug.sats"
(* ****** ****** *)
(*
prfun
gint_mul_nint_nint
{m,n:nat}(): [m*n>=0] void
*)
(*
dataprop
nmul(int, int, int) =
|
{n:nat}
nmul0(0, n, 0) of ()
|
{m
,n:nat}{p:int}
nmul1
(m+1, n, p+n) of (nmul(m, n, p))
dataprop
inteq(int, int) =
{x: int} INTEQ(x, x) of ()
gint_equal_sint
{n:int}(sint(n)): [x:int] inteq(x,n)
*)
(* ****** ****** *)
fun
fact(x: nint) =
if
x > 0
then
let
  val x1 = x - 1 in x * fact(x1)
end else 1 // end of [if]
////
(* ****** ****** *)
fun
fact(x:nint): nint =
if
x > 0
then x * fact(x-1) else 1
(* ****** ****** *)
////
(* ****** ****** *)
fun
fact
{x:int}(x) =
if
(x > 0)
then x*fact(x-1) else x
withtype {n:nat} (int(n)) -> int
(*
#extern
fun
fact{n:int}(x: int(n)): int
implement
fact{n}(x) =
if x > 0 then x*fact(x-1) else x
*)
(* ****** ****** *)
////
(* ****** ****** *)
val x = 0
val y = 1
val z = ""
val xyz =
if
true
then 1
else 2
endst{i,j:int| i>=j}
( x: int(i)
, y: int(j), z: string)
(* ****** ****** *)
fun
length(xs: list(int)): int =
(
case+ xs of
|
list_nil
((*void*)) => 0 + 0
|
list_cons
( _ , xs ) => 1 + length(xs)
endst
{i,j:int| i>=j}
(x: int(i), y: int(j), z: string)
)
(* ****** ****** *)
////
(* ****** ****** *)
//
(*
fun
fact(x: int) =
(
case+ x of
| 0 => 1
| n => n * fact(n-1))
*)
fun
fact(x: int) =
(
case+ x = 0 of
| true => 1
| false => x * fact(x-1))
//
(* ****** ****** *)
////
(* ****** ****** *)
fun
fact(x: int) =
if
(x > 0)
then x * fact(x-1) else 1
(* ****** ****** *)
////
(* ****** ****** *)
(*
val int = 10
val chr = 'a'
val btf = true
*)
(* ****** ****** *)
//
#extern
fun
<a:type>
foo(x: a): (a, a)
//
fun
< >
bar(): (int, int) = foo<int>(0)
////
(* ****** ****** *)
(*
val xs0 = list_nil()
val xs1 = list_cons(1, xs0)
val xs2 = list_cons<int>(2, xs1)
*)
(* ****** ****** *)
(*
//
datatype
ints =
| ints_nil of ()
| ints_cons of (int, ints)
//
val xs0 = ints_nil()
val xs1 = ints_cons(1, xs0)
val xs2 = ints_cons(2, xs1)
//
*)
(* ****** ****** *)
////
(* ****** ****** *)
//
(*
#extern
fun
foo
{n:nat}
( x0
: int(n)): int(n)
*)
#extern
fun
foo
{n:nat}
(x0:int(n)): int
val res0 = foo(10)
val res1 = foo{10}(10)
//
(* ****** ****** *)
////
(* ****** ****** *)
//
#define X 1
//
fun
foo(x0: int): bool = 
case+ x0 of
| X => true | _ => false
//
(* ****** ****** *)
////
(* ****** ****** *)
local
#define
XATSHOME="__XATSHOME__"
in
#include"\
$XATSHOME/prelude/SATS/gbas.sats"
end // end of [local]

(* ****** ****** *)
(*
#include"\
$(XATSHOME)/prelude/SATS/gbas.sats"
#include"\
$()(XATSHOME)/prelude/SATS/gbas.sats"
*)
(* ****** ****** *)
fun
foo
(A: a1ref(int, 3)): void = (A[0] := 0)
(* ****** ****** *)
////
(* ****** ****** *)
fun
foo(Z: a0ref(int)): int = Z[]
(* ****** ****** *)
////
(* ****** ****** *)
#define x = 1
#define y = (x+1)
(* ****** ****** *)
////
(* ****** ****** *)

val sum = op + (1, 2)

(* ****** ****** *)
////
(* ****** ****** *)

fun
foo
( xs
: stream_vt(int)): void =
(
case+ !xs of
| ~strmcon_vt_nil() => ()
)

(* ****** ****** *)
////
datatype
ab = A of () | B of (int)
fun
foo(ab: ab): int =
case+ ab of A _ => 0 | B _ => 1
(* ****** ****** *)
////
impltmp
tabulate$fopr
<cgtz><2>(i0) = 'a'
val aa = string_tabulate<2>(2)
////
val ba =
string_reverse("ab")
(* ****** ****** *)
////
(* ****** ****** *)
#extern
fun
fact
( x0
: int): int = $exname(0)

implement
fact(x0) =
if
x0 > 0
then x0 * fact(x0-1) else 1

(*
#exname fact = _
*)

(* ****** ****** *)
////
(* ****** ****** *)

fun
foo(xs: list(int)): bool =
(
case+ xs of
| list_cons _ => true | _ => false
)

(* ****** ****** *)
////
(* ****** ****** *)
fun foo() =
(
case+ 1 of 
| x when x > 1 => ()
)
(* ****** ****** *)
////
(* ****** ****** *)
(*
datatype abc = ABC of xyz
*)
(* ****** ****** *)
////
(* ****** ****** *)

#define nul 0
#define one 1
#define two 2
#define exp = one + two * two

#define pow2(x) = x * x
#define pow3(x) = x * pow2(x)

#define
npow(n, x) =
if
n > 0
then x * npow(n-1, x) else 1

#define pow2(x) = npow(2, x)

(* ****** ****** *)

#define iadd(x, y) = iadd(x, y)

(* ****** ****** *)

val x1 = one
and x2 = two
(*
val one = 1
val two = 2
*)
val x3 = exp
val x12 = x1 + x2
val xx1 = pow2(x1)
val xxx2 = pow3(x2)

(* ****** ****** *)
////
(* ****** ****** *)
//
#extern
fun
length(xs: list(int)): int =
(
case+ xs of
|
list_nil() => 0 + 0
|
list_cons{n}(_, xs) => 1 + length(xs)
)
//
(* ****** ****** *)
////
(* ****** ****** *)

fun<>
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)
////
(* ****** ****** *)

fun
<a:type>
foo( x: a ) = (x, x)

(* ****** ****** *)
////
(* ****** ****** *)

#extern
fun
foo
( x: int
, y: string): string

(* ****** ****** *)

val
x = 0
val
y = "0"
val:prf
z =
let
val z = foo(x, foo(x, y)) in z; 1
end

(* ****** ****** *)

val f1 = lam(x: int) => foo(x, y)
val f2 = fix f(x: int) => foo(x, f(x))

(* ****** ****** *)
////
(* ****** ****** *)

val x = A[0]

(* ****** ****** *)
////
(* ****** ****** *)

val x = 10: bool

(* ****** ****** *)
////
(* ****** ****** *)

abstype xyz(a:i0)
absimpl xyz(a:i0) = sint(a)

(* ****** ****** *)
////
(* ****** ****** *)

(*
val x1 = foo1<_>(10)
*)
val x2 = foo2<>{sint}(10, 10, 10)

(* ****** ****** *)
////
(* ****** ****** *)

fun
foo
{a0:tx}
(x0:a0) = x0
val foo10 = foo(10)

(* ****** ****** *)
////
(* ****** ****** *)

#staload _ =
"prelude/DATS/gbas.dats"

(* ****** ****** *)
abstype T0
absvtype VT
(* ****** ****** *)
fun
foo_t0(x0: T0): void = g_free(x0)
(*
fun
foo_vt(x0: VT): void = g_free(x0)
*)
(* ****** ****** *)
////
(* ****** ****** *)

impltmp
{a:t0}
rand<list(a)>() =
list_vt2t(rand_list<a>())

(* ****** ****** *)
////
(* ****** ****** *)

impltmp
<a:t0>
foo(x) = ( x:a )

impltmp
{a:vt}
foo<a>(x, y) = ( x, y )

(* ****** ****** *)
////
(* ****** ****** *)

impltmp
{a:t0}
foo<a,a>(x) = x

(* ****** ****** *)
////
(* ****** ****** *)

impltmp
{a:vt}
foo<a,a>(x) = x

(* ****** ****** *)
////
(* ****** ****** *)

absvtype vt
vtypedef vts = list_vt(vt)

(* ****** ****** *)
////
(* ****** ****** *)

fun
foo(xs: list(int)) = length<int>(xs)

(* ****** ****** *)

(* end of [xdebug.dats] *
