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
#abssort tabs1
#abssort tabs2
#abssort tabs3
(* ****** ****** *)
local
#abssort tabs1
in//local
#stacst0
myscst01
(tabs1, tabs2): tabs3
endloc // end of [local]
#stacst0
myscst02
(tabs1, tabs2): tabs3
(* ****** ****** *)
//
#sortdef mysort1 = tabs1
#sortdef mysort2 = tabs2
//
#sortdef
mysort3 = {a: int | a >= 0}
//
(* ****** ****** *)
#sexpdef
int_0: int = 0
#sexpdef
char_0: char = '\0'
#sexpdef
bool_1: bool = true
(* ****** ****** *)
//
datasort ints =
|ints_nil of ((*nil*))
|ints_cons of (i0,ints)
//
(* ****** ****** *)
#abstype
mylist(a:t0)(i:i0) = list(a,i)
(* ****** ****** *)
//
excptcon | TRUE | FALSE of ()
//
(* ****** ****** *)
//
datatype
mylist =
| mylist_nil
| mylist_cons of (sint, mylist)
//
datavwtp
mylist_vt =
| mylist_vt_nil
| mylist_vt_cons of (sint, mylist_vt)
//
(* ****** ****** *)
////
(* ****** ****** *)
#sexpdef
mysexp1(a:tabs1): tabs1 = a
#sexpdef
mysexp2(a:tabs1): mysort2 = a
(* ****** ****** *)
#stacst0
foo: tabs1 -> tabs2
#stacst0
foo: (tabs1, tabs1) -> tabs2
#stacst0
foo: (tabs1, tabs2) -> tabs2
#stacst0
foo1: tabs1 -> tabs2
#stacst0
foo2: (tabs1, tabs1) -> tabs2
#sexpdef
mysexp3(a:tabs1): mysort2 = foo(a)
#sexpdef
mysexp4(a:tabs1): mysort2 = foo(a, a)
#sexpdef
mysexp5() = (0, 1, 2)
#sexpdef
mysexp6() = (0 | 1, 2)
#sexpdef
mysexp7() = @(1, 2, 3)
#sexpdef
mysexp8() = @(1 | 2, 3)
(* ****** ****** *)
#sexpdef
mysexp9
(a1, a2, b3) = (a1, a2) -> b3
(* ****** ****** *)
#sexpdef
mysexp10() = @{a=0, b=1, c=3}
#sexpdef
mysexp11() = @{a=0 | b=1, c=3}
(* ****** ****** *)
////
(* ****** ****** *)
//
fun fact =
fix fact(x: sint): sint =>
if x > 0 then x * fact(x-1) else 1
//
(* ****** ****** *)
////
(* ****** ****** *)
#infixl + of 50
#infixl - of 50
#infixl * of 60
#prefix + of +(+1) (*uplus*)
#prefix - of -(+1) (*uminus*)
#define foo1 = - x +
#define foo2 = + * x
#define foo3 = x + y * z
#define foo4 = ((x + y * z * - - 1)
(* ****** ****** *)
#nonfix op1 op2 op3
#prefix op1 op2 op3
#infixl op1 op2 op3 of 1000
#infixr op1 op2 op3 of ++(-1)
#pstfix op1 op2 op3 of op1(+1)
#infix0 op1 op2 op3 of op2(-1)
(* ****** ****** *)

#stacst0 ii(int): int

(* ****** ****** *)

#sexpdef xy = x op1 y op2

(* ****** ****** *)

#static
datasort myst = myst
#extern
datasort myst = myst

#sortdef
pos = {a:int | a > 0
#sortdef
neg = {a:int | a < 0}

#sexpdef int1 = $(int)
#sexpdef int2 = @(int, int)
#typedef Nat0 = [a:pos] int(a)

(* ****** ****** *)

#typedef int2 = @{i1=int, i2=int}

(* ****** ****** *)
//
fun
fact(x: sint): sint
fun
fact(x: sint): sint = $extnam()
//
fun fact =
lam(x: sint): sint =>
if x > 0 then x * fact(x-1) else 1
//
fun fact =
fix fact(x: sint): sint =>
if x > 0 then x * fact(x-1) else 1
//
(* ****** ****** *)

#typedef
fint2 =
lam(a:int): type => (int(a), int(a))

#typedef
fint2(a:int): type = int(a), int(a))

(* ****** ****** *)

#symload + with add_sint_sint of add(+10)

(* ****** ****** *)

#absopen $MOD.myabst // attach definition

#absimpl
$MOD.fint2(a:int): type = (int(a), int(a))

#abstype int2(a:int):type <= (int, int)
#abstype int3(a:int):type == (int, int, int)

(* ****** ****** *)

#staload "./abcde1.sats"
#staload "./abcde2.sats"
fun
foo1(tok1: token1): tnode1 = tok1.node()
fun
foo2(tok2: token2): tnode2 = tok2.node()

(* ****** ****** *)
//
fun
fact(x:sint): sint =
(
  helper(x) ) where
{
fun
helper(i: sint): sint =
if (i > 0) then helper(i-1) * i else 0 }
//
(* ****** ****** *)

datasort
ioptn = ioptn_nil | ioptn_cons of (int)
and
ilist = ilist_nil | ilist_cons of (int, ilist)

(* ****** ****** *)

local

#infix0 op1 op2

in//local

val xyz = x op1 y op2 z

excptcon
| TrueExn of () | FalseExn of ()

endloc // end of [local]

(* ****** ****** *)
fun
<a:t0>
length(xs: list(a)): sint = 
(
case+ xs of
| list_nil() => 0
| list_cons(_, xs) => 1 + length<a>(xs)
)
(* ****** ****** *)

#infixr + of 100
#infixl * of 200
#symload foo1 with $MOD.foo1 of 100
#symload foo2 with $MOD.foo2 of (1 + 2 + 3)

(* ****** ****** *)

(* end of [mytest1.sats] *)
