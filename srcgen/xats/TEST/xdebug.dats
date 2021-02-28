(* ****** ****** *)
#include
"share\
/xatsopt_prelude.hats"
(* ****** ****** *)
#staload "./xdebug.sats"
(* ****** ****** *)
(*
val int = 10
val chr = 'a'
val btf = true
*)
(* ****** ****** *)

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
val res = foo(10)

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
