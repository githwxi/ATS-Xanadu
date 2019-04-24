(*
fun
{a
:type}
length
| nil() => 0
| cons(x, xs) = x+length(xs)
withtype
{n:nat} list(a, n) -> int(n)
*)

////
#define x 5
#macdef f{a}(x,y) = u*(x+y*z)
////
(*
#macdef g(x) x + 6
*)

case+ xs of
| nil () => 0
| cons x xs => 1+length(xs)

#define f(x)(y) x + y

lam(x) => lam(y) => x + y

G0Vclo(lam(y) => x + y, D0E

D0E

app(lam(xs) => cons(x, xs))



#if
x = 0
#then
#define x = 0
#elif
x = 1
#then
#define x = 1
#else
#define x = 2
#endif

(*
p_ifgdec := [#if] p_ifrest
p_ifrest := g0exp p_srpthen p_srpendif
p_srpthen := [#then] d0eclseq p_srpelse
p_srpelse := | [#else] d0eclseq | [#elif] p_ifrest
*)

////

#include
"./syntax_sta.sats"
#include
"prelude/SATS/list.sats"
#staload
"prelude/SATS/list.sats"
#staload
List =
"prelude/SATS/list.sats"

////

#include
XATSPRE("SATS/list.sats")
#include
XATSLIB("SATS/list.sats")
#include
XATSLIBC("SATS/list.sats")

////

#staload
"http://www.ats-lang.org/hello1.dats"
#staload
HELLO2 =
"http://www.ats-lang.org/hello2.dats"

////

abstype
abcdefg1(int)

absimpl
abcedfg2(x:int) = int(x)

////

implement
<x0:t0>
list_length(xs) = 0

////

#extern
fun
foo(x:int): bool
and
bar(x:int): bool = (x = x)

////
(* ****** ****** *)

val x = $addr(x)
val:
prf x = $view(x)
val:
prf x = $fold(x)
val:
prf x = $unfold(x)

(* ****** ****** *)

fun
foo(xs) = let
//
var
d2v:int = (0)
val pfx = $view(d2v)
//
var
d2v:int with pfx = (0)
//
in
end // end of [foo]

////
fun
foo(xs) =
(
case+ xs of
| list_nil //
| list_nil() => 0
| xs => foo(xs) + 1
| ys => xs + foo(ys)
| list_cons{a}{n}(_, xs) => foo(xs) + 1
) where
{
  val xs = xs ++ xs
} where
{
  val xs = xs ++ xs
} endwhere // end of [fun]

////
#extern
fun
<a
,b:type
;c:type>
pair
( x: !a >> a?
, y: !a >> a?): list(?a, ?n) = @(x, y)
////

if nil?(xs) then () els

if some?(xs) then process(unsome(xs)) else ()

~nil?(x)

#static
fun
<a
,b:type>
pair(x, y) = $(x, y)

fun myplus(x, y) = x + y

////
#extern
fun
fact
{i:nat}
.< i >.
(x:int(i)): int =
if
(x > 0)
then
let
val x1 = x-1 in x * fact(x1)
endlet
else 1 // end of [else]
////
val
x = 1

fun
fact(x) =
if x > 0 then x * fact(x-1) else 1
////
val:
(rec
,prf)
fact =
lam(x) =>
if x > 0 then x * fact(x-1) else 1

////

fun
<a:type>
foo:
{n:nat}(a) -> int(n)

val x = foo<int>{1}(1)

fun
bar(x: int): int =
(
  x + y
) where
{
  val y = foo(x) + 1
} endwhere

(*
fun
baz:
$type
($A.foo<int>) = lam (x) => -x + 1
*)

(*
typedef
append_type =
{a:type}
{m,n:int}
( list(a, m)
, list(a, n)) => list(a, m+n)

fun
<a:type>append : append_type(a)

implement
<a>
append
{m,n}(xs, ys) =
auxlst(xs) where
{
fun
auxlst
{m:int}
$type
(append<x>) =
lam(xs, ys) =>
(
case+ xs of
| nil() => ys
| cons(x0, xs) => cons(x0, auxlst(xs, ys))
)
}
*)

////

fun
isevn: int -> int
and
isodd(x: int): int =
if x > 0 then isevn(x-1) else false
// end of [isodd]

implmnt
isevn(x) =
  if x > 0 then isodd(x-1) else true
// implmnt

////

#static
val foo: int

#extern
fun
foo: int -> int
and
bar: int -> int

////
val
foo: int
and
bar: int = 1

////
fun
foo(x: int(x)): int
////
extern
fun
foo: int -> int
////
val
:rec
x = 1
val
:prf
y = foo(x)

////

fun:
(prf, rec)
foo:
int -> int =
lam(arg) => 1

////
#staload N = $ADD
#staload M = $FOO$S2E
val xyz = $ME.foo
////
(* ****** ****** *)

val float0 = 0x.abcdefp0f

val ((*void*)) =
println!("float0 = ", float0)

(* ****** ****** *)

var
foo: sexp with pf = 123

#symload
[] with $BAR.bar of 100
#symload
foo with $BAR.bar of 100
#symload
.foo with $BAR$BAZ.bar of 100

(* ****** ****** *)

val-
nil() = xs0
withtype list(int)

val+
:rec
x \cons xs2 = xs1

val
tup_flat = @(1, 2)
val
tup_boxd = $(1, 2)

(* ****** ****** *)
//
val:rec cons(x, xs) = xs
//
(* ****** ****** *)
//
val
xyz
:nrec =
(
if x > 0
  then (f; g; h) else i; j
) where
{
  val f = lam(_) => g + h
} : (int : type) 
//
(* ****** ****** *)

fun
:nrec
foo(x) =
(
case+ x of
| list_nil() //
| list_nil() => 0
| list_cons(_, xs) => foo(xs) + 1
) where
{
  val x = x + x
} where
{
  val xs = xs + xs
} endwhere // end of [fun]

(* ****** ****** *)

fun:
nrec
fact(n) =
(n).foldleft(1, $lam($0*succ($1)))
fun:
(rec)
fact =
$fix(if $1 > 0 then $1*$0(pred($1)) else 1)

(* ****** ****** *)

implement
:nonrec
{a:type;b,c:tbox}
<a:type;b,c:tbox>
foo2<list(a)><b,c>(x: a): int =
  (if x then x + x else x - x)

(* ****** ****** *)

#extern
fun
fact
{n:int}
(*.<n+1>.*)
(x: int(n)): intGte(1)

(* ****** ****** *)

val xyz = (foo<a,b+c>(x, y))
val xyz = ((foo<a),(b+c>(x, y)))

(* ****** ****** *)

primplmnt
(*nonrec*)
lemma_list_param(xs) =
(
//
case+ xs of
| list_nil _ => () | list_cons _ => ()
//
) (* lemma_list_param *)

(* ****** ****** *)
//
implement
:nonrec
<a>(*tmp*)
list_tuple_0() = list_nil()
//
implement
<a>(*tmp*)
list_tuple_1(x0) = $list{a}(x0)
implement
<a>(*tmp*)
list_tuple_2(x0, x1) = $list{a}(x0, x1)
implement
<a>(*tmp*)
list_tuple_3(x0, x1, x2) = $list{a}(x0, x1, x2)
//
implement
<a>(*tmp*)
list_tuple_4
(x0, x1, x2, x3) = $list{a}(x0, x1, x2, x3)
implement
<a>(*tmp*)
list_tuple_5
(x0, x1, x2, x3, x4) = $list{a}(x0, x1, x2, x3, x4)
implement
<a>(*tmp*)
list_tuple_6
(x0, x1, x2, x3, x4, x5) = $list{a}(x0, x1, x2, x3, x4, x5)
//
(* ****** ****** *)

implement
<x>(*tmp*)
list_make_elt
  {n}(n, x) = let
//
fun loop
  {i:nat | i <= n} .<i>.
(
 i: int(i), x: x, res: list_vt(x, n-i)
) :<> list_vt(x, n) =
(
  if (i > 0)
    then loop(pred(i), x, list_vt_cons(x, res)) else res
  // end of [if]
) // end of [loop]
//
in
  loop(n, x, list_vt_nil(*void*))
end // end of [list_make_elt]

(* ****** ****** *)

implmnt
:nonrec
<(*tmp*)>
list_make_intrange
  {l0,r}
  (l0, r) = let
//
typedef
elt = intBtw(l0, r)
//
vtypedef
res(l:int) = list_vt(elt, r-l)
//
fun
loop
{
  l:int
| l0 <= l; l <= r
} .<r-l>.
(
  l: int l, r: int r
, res: &ptr? >> res(l)
) :<!wrt> void =
(
//
if
(l < r)
then let
  val () = res :=
    list_vt_cons{elt}{0}(l, _)
  // end of [val]
  val+list_vt_cons(_, res1) = res
  val () = loop(l+1, r, res1)
  prval ((*folded*)) = fold@(res)
in
  // nothing
end else (res := list_vt_nil())
//
) (* end of [loop] *)
//
in
//
  res where
  {
    // var res: ptr
    val ((*void*)) = $effmask_wrt(loop(l0, r, res))
  } (* end of [where] *)
end // end of [list_make_intrange]

(* ****** ****** *)
//
implement
<(*tmp*)>
fprint_list$sep
  (out) = fprint_string(out, ", ")
// end of [fprint_list$sep]
//
implement
<a>(*tmp*)
fprint_list(out, xs) = let
//
implement
{env}
list_iforeach$fwork<a><env>
  (i, x, env) = let
  val () =
  if i > 0
    then fprint_list$sep<>(out)
  // end of [if]
  // end of [val]
in
  fprint_val<a>(out, x)
end // end of [list_iforeach$fwork]
//
val _(*len*) = list_iforeach<a>(xs)
//
in
  // nothing
end // end of [fprint_list]

(* ****** ****** *)

val bar = xs.f(x).g(y).h(z1, z2)

val foo = xs.foldleft(0, $lam($0+$1))
val foo = xs.foldright($lam($0+$1), 0)

(* ****** ****** *)

fun
<a:type>
permute
(xs: list(a)): list(list(a)) =
if
iseqz(xs)
then $list(nil())
else concat(xs.imap(lam(i,x)=>mcons(x, permute(xs-i))))

(* ****** ****** *)

absimpl
$FOO.foo(x:int): type = bar

fun
:rec
foo(xs: list(int)): int =
(
case+ xs of
| nil() => 0
| cons(x, xs) => (x) + foo(xs)
)

val
:rec
fact =
lam(x: int): int =<ntm>
if x >= 1 then x * fact(x-1) else x

val f =
lam(x, y) =>
if x > y then x else y endif endlam

(* ****** ****** *)

val
:rec
fact =
lam(x: int): int =<cloref1>
  if x >= 1 then x * fact(x-1) else 1
// end of [lam]

(* ****** ****** *)
//
val xs =
xs.1().2().insert(i, x).insert(i', x')
//
(* ****** ****** *)

val x =
if
(if True then False else True)
then if True then False else True endif
else if True then False else True endif
endif

(* ****** ****** *)

fun
queensol
(n: int): list(int) =
(
if
n > 0
then
mapopt
(cross(N, queensol(n-1)))
else list_nil()
)
where
{
implement
mapopt$fopr(@(x0, xs)) =
if
test(x0, xs) then Some(cons(x0, xs)) else None
} where
{
fun
test
( x0: int
, xs: list(int)): bool =
(xs).iforall(lam(i, x) => (x != x0) && (abs(x-x0) != i+1))
}

(* ****** ****** *)

(* end of [syntax_dyn.dats] *)
