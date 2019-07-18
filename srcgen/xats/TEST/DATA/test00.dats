(* ****** ****** *)

(*
#stacst x: int
#stacst y: int
sexpdef xy = x + y
*)

(* ****** ****** *)

(*
typedef u0 = {i:int} int(i)
typedef v0 = [j:int] int(j)

typedef tup0 = @(uint(0), uint(1))
typedef tup1 = $(uint(0), uint(1))

typedef frec0 =
bool(xy=0) -> @{x=int, y=int(1), z=bool}
typedef frec1 =
bool(xy=1) -> ${x=int, y=int(1), z=bool}
*)

(* ****** ****** *)

typedef
cref = (int) -<cloref> int
vtypedef
lcptr = (unit | int) -<lin,cloptr> int

(* ****** ****** *)

absprop unit == unit
abstype abc0: type == int
abstype abc1(n:int) <= int(n)

(* ****** ****** *)

absimpl abc0 = int
absimpl abc1(n:int) = int(n)

(* ****** ****** *)

#extern fun foo(x: &0 >> 1): int

(* ****** ****** *)

fun:rec
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1
fun:nrc
fact(x: int): int =
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)

(* end of [test00.dats] *)
