(* ****** ****** *)
//
(*
#prefix ! of 00 (* static *)
*)
//
#prefix ! of 99 (* dynamic *)
//
(* ****** ****** *)

(*
#infixl app of 70 // the app_prcdv
*)

(* ****** ****** *)
//
// HX-2015-08-04:
// mostly following the Fortran convention
//
#infixr ** of 61 (*exp*)
//
(* ****** ****** *)
//
// multiplicative
//
#infixl * / % mod of 60
//
(* ****** ****** *)

#prefix ~ of 51 (* neg *)

(* ****** ****** *)
//
#infixl + - of 50 (*additive*)
#prefix + of +(+1) (* uplus *)
#prefix - of -(+1) (* uminus *)
//
(*
#infixr(+) ++ // concatenative
*)
//
(* ****** ****** *)
//
#infix0 < <= of 40
#infix0 > >= of 40
//
(* ****** ****** *)

#infixr :: @ of 40

(* ****** ****** *)

#infix0 = == != of 30

(* ****** ****** *)

#infixl && of 21
#infixl andalso land of &&

(* ****** ****** *)

#infixl || of 20
#infixl orelse xor lor lxor of ||

(* ****** ****** *)

#infixr -> of 10

(* ****** ****** *)

#nonfix foo bar baz

(* ****** ****** *)

abssort int
abssort addr
abssort bool
abssort char

(* ****** ****** *)

#stacst
add(x: int, y: int): int

#stacst + : (int, int) -> int
#stacst - : (int, int) -> int

#stacst > : (int, int) -> bool
#stacst >= : (int, int) -> bool

#stacst > : (addr, addr) -> bool
#stacst >= : (addr, addr) -> bool

(* ****** ****** *)

sortdef one = 1
sortdef two = 2
sortdef one' = two

sortdef f0 = f()
sortdef f1 = f(1)
sortdef f12 = f(1,2)
sortdef f_1_2 = f 1 2
sortdef fint1 = int -> int
sortdef fint2 = (int, int) -> int

sortdef qf = $Q.f

sortdef nat0 = {a:int|a >= 0}
sortdef nat1 = {a:int|a >= 1}

sortdef nat01 = (nat0 || nat1)
sortdef nat02 = (nat0 && nat1)

(* ****** ****** *)

// sortdef int2 = int * int

(* ****** ****** *)
////
(* ****** ****** *)

datasort
ilist =
| ilist_nil
| ilist_cons of (int, ilist)

(* ****** ****** *)

abstype foo(tbox+, prop-)
abstbox foo(tbox+, view-) == bar
abstflt foo(tflt+, view-) <= bar

absvtype xyz(int(*x*), y: int, z: int)
absvtbox xyz(int(*x*), y: int, z: int) <= int
absvtflt xyz(int(*x*), y: int, z: int) == int

(* ****** ****** *)
//
typedef int2 = int * int
//
typedef xyz = $extype"abcde"
//
(* ****** ****** *)

sortdef
foo =
bar0( bar1 + ! !! !!! )

(* ****** ****** *)

#stacst
fint2: (int, int) -> int

(* ****** ****** *)

sexpdef foo = int:type

sexpdef
foo =
bar0(1 + 2 + 3 + -4 + -5)

sexpdef
int2int =
{ n:int | n >= 0
} int(n) -> [n:nat] int(n:int)

typedef int2 = @(int, int)
typedef int2 = $(int, int)
typedef int2 = $tup(int, int)
typedef int2 = $tup_t(int, int)
typedef int2 = $tup_vt(int, int)
typedef point2 = @{x=int | y=int}
typedef point2 = $rec{x=int | y=int}
typedef point2 = $rec_t{x=int | y=int}
typedef point2 = $rec_vt{x=int | y=int}

(* ****** ****** *)

sexpdef
list0_int_1 =
(lam(a:type)(n:int) => list(a, n))(int)(1)

(* ****** ****** *)

sexpdef A_int = $A.int

(* ****** ****** *)

sexpdef one:int = 1
sexpdef one:char = '1'
sexpdef one:float = 1.0
sexpdef one:string = "1"

(* ****** ****** *)

sexpdef xy: int = op+(x, y)
sexpdef xy: int = op(add)(x, y)

(* ****** ****** *)

sexpdef
xyz: char = foo('a')
sexpdef
xyz: string = foo("a")
sexpdef
xyz: float = foo(1E-3f)
sexpdef
xyz: float = foo(0x1.abcdeP-3)

(* ****** ****** *)

typedef + = $A.+
typedef @ = $A.@

(* ****** ****** *)

typedef int2 = @(int, int)
typedef int2 = $(int, int)
typedef int2 = @{x=int, y=int}
typedef int2 = ${x=$A.int, y=$B.int}

(* ****** ****** *)

vtypedef int11 = @{x=int | y=int}
vtypedef int12 = ${x=int | y=int, z=int}

(* ****** ****** *)

absview array_v(vtype+)
absprop array_p(vtype+)

(* ****** ****** *)

abstype
arrayref
(a:vtype+, n:int) == ptr
absvtype
arrayptr
(a:vtype+, n:int) <= ptr

(* ****** ****** *)
//
abstype
foo
(a:type)
(b:type) == list(a, b) // illegal
//
(* ****** ****** *)
//
datasort
ilist =
  | ilist_nil
  | ilist_cons of (int, ilist)
and
ilist2 =
  | ilist2_nil
  | ilist2_cons of (int, int, ilist2)
//
(* ****** ****** *)

vtypedef
fint1 =
{a,b:int|a > b}
(int(a), int(b)) ->
[c:int | c <= a*b] int(c)
vtypedef
fint2 =
{a,b:int|a > b}
 (int(a), int(b)) ->
#[c:int | c <= a*b] int(c)

(* ****** ****** *)

typedef int x y =
(lam(u:int, v:bool): type => int(x+y))(0, false)

(* ****** ****** *)

local

sexpdef foo = int * int

in (* in-of-local *)

sortdef pos = {a: int | a > 0}
sortdef neg = {a: int | a < 0}
sortdef nat = {a: int | a >= 0}

endlocal // end of [local]

(* ****** ****** *)
//
datatype
mylist(a:type+, int) =
| mylist_nil(a, 0) of ()
| {n:nat}
  mylist_cons(a, n+1) of (a, mylist_(a, n))
and
mylist2(a:type+, int) =
| mylist2_nil(a, 0) of ()
| {n:nat}
  mylist2_cons(a, n+1) of (a, mylist2_(a, n))
//
where
  sortdef nat = {a: int | a >= 0}
  typedef mylist_(a, n) = mylist(a, n)
  typedef mylist2_(a, n) = mylist2(a, n)
endwhere
//
(* ****** ****** *)

typedef foo = bar2 -<0,ntm,!wrt> bar2

(* ****** ****** *)

fun
foo(x: int): int

(* ****** ****** *)
//
#include "/tmp/abcde.sats"
#staload "/tmp/abcde.sats"
//
fun
<a,b:int>
foo(int(a)): int(b) = $macro"C_foo"
fun
<a,b:int>
foo(int(a)): int(b) = $extern"C_foo"
//
fun
<a,b:int><c:int>
foo2(x1: int(a) | x2: int(b)):<0,!ntm,!wrt> int(c)
//
(* ****** ****** *)
//
// extern
//
fun
bar1(int, int): bool = $mac("bar1")
and
bar2(x:[a:int]int(a), int): bool = $mac("bar2")
//
(* ****** ****** *)

#static
val fact : int -> int

#extern
fun fact (n: int) : int
#extern
prfun fact2 int (int, int) : bool

(* ****** ****** *)

val zero : int

val fact : int -> int = $macro"fact"
val fact : int -> int = $static"fact"
val fact : int -> int = $extern"fact"

(* ****** ****** *)
//
fun fact{n:nat}(x: int(n)): int(fact(n))
//
fun fact: {n:nat} int(n) -> int(fact(n))
//
(* ****** ****** *)
//
// HX-2018-10-01:
//
datatype
list_type_int_tbox
  (a:type+, int) =
//
// type+: covariant
//
| list_nil(a, 0) of ()
| {n:int | n >= 0}
  list_cons(a, n+1) of
  (a, list_type_int_tbox(a, n))
// end of [list_type_int_tbox]
//
sexpdef list = list_type_int_tbox
//
(* ****** ****** *)
//
typedef
List(a:type) = [n:int] list(a, n)
//
typedef
List0(a:type) = [n:int | n >= 0] list(a, n)
typedef
List1(a:type) = [n:int | n >= 1] list(a, n)
//
typedef listLt
  (a:type, n:int) = [k:nat | k < n] list(a, k)
typedef listLte
  (a:type, n:int) = [k:nat | k <= n] list(a, k)
typedef listGt
  (a:type, n:int) = [k:int | k > n] list(a, k)
typedef listGte
  (a:type, n:int) = [k:int | k >= n] list(a, k)
typedef listBtw
  (a:type, m:int, n:int) = [k:int | m <= k; k < n] list(a, k)
typedef listBtwe
  (a:type, m:int, n:int) = [k:int | m <= k; k <= n] list(a, k)
//
(* ****** ****** *)
(*
//
#define nil list_nil
//
#define :: list_cons
#define cons list_cons
//
*)
(* ****** ****** *)
//
prfun
lemma_list_param
  {x:type}{n:int}
  (xs: list(INV(x), n)): [n >= 0] void
// end of [lemma_list_param]
//
(* ****** ****** *)
//
castfn
list_vt2t
  {x:type}{n:int}
  (xs: list_vt(INV(x), n)):<!wrt> list(x, n)
castfn
list_of_list_vt
  {x:type}{n:int}
  (xs: list_vt(INV(x), n)):<!wrt> list(x, n)
//
(* ****** ****** *)
//
fun<a:type>
list_tuple_0():<> list(a, 0)
//
fun<a:type>
list_tuple_1(x0: a):<> list(a, 1)
fun<a:type>
list_tuple_2(x0: a, x1: a):<> list(a, 2)
fun<a:type>
list_tuple_3(x0: a, x1: a, x2: a):<> list(a, 3)
//
fun<a:type>
list_tuple_4
  (x0: a, x1: a, x2: a, x3: a):<> list(a, 4)
fun<a:type>
list_tuple_5
  (x0: a, x1: a, x2: a, x3: a, x4: a):<> list(a, 5)
fun<a:type>
list_tuple_6
  (x0: a, x1: a, x2: a, x3: a, x4: a, x5: a):<> list(a, 6)
//
(* ****** ****** *)
//
#symload
list_tuple with list_tuple_0
#symload
list_tuple with list_tuple_1
#symload
list_tuple with list_tuple_2
#symload
list_tuple with list_tuple_3
#symload
list_tuple with list_tuple_4
#symload
list_tuple with list_tuple_5
#symload
list_tuple with list_tuple_6
//
(* ****** ****** *)

fun
<x:type>
list_make_sing(x):<!wrt> list_vt(x, 1)
fun
<x:type>
list_make_pair(x, x):<!wrt> list_vt(x, 2)

(* ****** ****** *)
//
fun
<x:type>
list_make_elt
  {n:nat}(n: int(n), x: x):<!wrt> list_vt(x, n)
// end of [list_make_elt]
//
(* ****** ****** *)

(* end of [syntax_sta.sats] *)
