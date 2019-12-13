
#extern
fun
foo1:
(int) -> void
#extern
fun
foo2:
(int, int) -> void

#symload foo with foo1
#symload foo with foo2

var x0 = 0
val x1 = foo(0, x0)

////
#extern
fun
foo2(x: &int >> int): void

(*
#extern
fun
foo2(!x: int >> int): void
*)

////

fun<>
bop1_int_int
( x: int
, y: int): int = x+y

#extern
fun<>
bop2_int_int
(x: int, y: int): int

implement
bop2_int_int<>(x, y) = x + y

val
ans =
bop1_int_int<>(1, 2)
where
{
implement
bop1_int_int<>(x, y) = x * y
}

////

val
fact =
fix f(x:int) => if x > 0 then x * f(x-1) else 1

////
#extern
fun
<a:type>
foo(x: a): a

implement
<a>
foo(x) = x

val x = foo(1)
val x = foo(true)
////
implement
{a}
<b,c>
foo<list(a)>(x, y) = x + y
////
val x = (_:int)
////
impltmp
{x0:type
,xs:type
,y0:type}
gseq_maprev_list
<x0,list(x0)><y0>(xs) =
list_maprev_vt<x0><y0>(xs)
////
#extern
fun
foo
{n:int}
{a:tbox}{b:tbox}(): b

(*
implement
foo{n}{a}{b}() = x
*)

val x = foo{int}{bool}()

////
fun
fact(n: int) =
gseq_mul<int,_>(n) where
{
impltmp
g_mul<int>(r, i) = r * (i+1)
}

////
val () = let val () = () in end

////

#extern
fun
<xs:type>
<x0:type>
<r0:type>
g_foldl
( xs: xs
, r0: r0
, f0: (r0, x0) -<cref> r0): r0

impltmp
{x0:type
,r0:type}
g_foldl<list(x0)><x0><r0>(xs, r0, f0) =
(
loop(xs, r0)
) where
{
fun
loop(xs, r0) =
(
case+ xs of
| list_nil
  () => r0
| list_cons
  (x0, xs) => loop(xs, f0(r0, x0))
)
}

val xs =
cons(1, cons(2, nil()))

val res =
g_foldl(xs, 0, lam(r0, x0) =<cref> x0 + r0)

////

#extern
fun
foo
( x:int
, y:int): double

#symload + with foo

val x = 1

val y = 1 + x:double

////

impltmp
<a>(*tmp*)
list_reverse
  (xs) =
(
list_revapp(xs, nil())
) (* list_reverse *)

////
fun
<a:type>
<b:type>
map
( xs: list(a)
, f0: a -<cloref> b)
=
(
case+ xs of
| list_nil() =>
  list_nil()
| list_cons(x0, xs) =>
  list_cons(f0(x0), map(xs, f0))
)
////
val xs =
list_cons
(1, list_cons(2, list_nil()))

val ys = map(xs, lam(x) => x + x)
val zs = map(xs, lam(x) => g_mul<int>(x, x))

(* ****** ****** *)
////
impltmp
{a:tflt1}
g_self<a>(x) = x

(* ****** ****** *)
////

impltmp
<a>
g_self(x) = x

(* ****** ****** *)

#extern
fun
foo1
{a:type}
(x: a)
{b:type}
(y: b) : int
fun
foo2
{a:type}{b:type}
(x: a, y: b): int

#symload foo with foo1
#symload foo with foo2

val xy = foo{int}(0){_}("0")
val xy = foo{int}{string}(0, "0")

(* ****** ****** *)
////
#extern
fun
<a:type
,b:type>
foo(x: a, y: b): int

val xy = foo<_,_>(0, "0")

(* ****** ****** *)
////
#extern
fun
<a:type>
foo(x: a): a

val x = foo(0)
////
val x = g_self{.}(0)
val x = g_self<_>{__}(0)

#extern
fun
<a:type>
list_nil?
:
{i:int}
list(a, i) -> bool(i=0)
#extern
fun
<a:type>
list_cons?!
:
{i:int}
list(a, i) -> bool(i > 0)

#symload
iseqz with list_nil?
#symload
isneqz with list_cons?!

////

fun word? : string -> bool

////

filter
(
map(subset(cs)) where
{
implement map$fopr(cs) = permute(xs)
}
) where
{
implement filter$test(cs) = word?(cs)
}