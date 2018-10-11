(* ****** ****** *)
//
(*
#prefix 00 ! (* static *)
*)
//
#prefix 99 ! (* dynamic *)
//
(* ****** ****** *)

(*
#postfix 80 .lab // dynamic
#postfix 80 ->lab // dynamic
*)

(* ****** ****** *)

(*
#prefix 79 & // dynamic
*)

(* ****** ****** *)

(*
#infixl 70 app
*)

(* ****** ****** *)

(*
#postfix 69 ?
*)

(* ****** ****** *)
//
// HX-2015-08-04:
// mostly following the Fortran convention
//
#infixr 61 ** (*exp*)
//
(* ****** ****** *)
//
// multiplicative
//
#infixl 60 * / % mod
//
(*
#infixl 60 nmul ndiv nmod
*)
//
(* ****** ****** *)

#prefix 51 - ~ (*negative*)

(* ****** ****** *)
//
#infixl 50 + - (*additive*)
//
(*
#infixr (+) ++ // concatenative
*)
//
(* ****** ****** *)

#infixl 41 asl asr
#infixl 41 lsl lsr

(* ****** ****** *)
//
#infix0 40 < <= > >=
//
(*
//
// HX-2012-07: removed
//
#infixl ( < ) ilt flt plt ult
#infixl ( <= ) ilte flte plte ulte
#infixl ( > ) igt fgt pgt ugt
#infixl ( >= ) igte fgte pgte ugte
*)
//
(* ****** ****** *)

#infixr 40 :: @

(* ****** ****** *)

#infix 30 = == != // <>

(* ****** ****** *)

(*
//
// HX-2012-07: removed
//
#infix ( = ) ieq feq peq ueq
#infix ( <> ) ineq fneq pneq uneq
*)

(* ****** ****** *)

#infixl 21 &&
#infixl ( && ) andalso land

(* ****** ****** *)

#infixl 20 ||
#infixl ( || ) xor orelse lor lxor

(* ****** ****** *)

#infixr 10 ->

(* ****** ****** *)

#infix0 (0) := // HX: assign
#infix0 (0) :=: // HX: exchange

(* ****** ****** *)

#infixl (0) << (* g0int_asl, g0uint_lsl *)
#infixr (0) >> (* g0int_asr, g0uint_lsr *)

(* ****** ****** *)

(*
#prefix (0) ++ -- // inc and dec
#prefix (0) !++ --! // getinc and decget
#infixr (0) =++ --= // setinc and decset
*)

(* ****** ****** *)

(*
#infix0 (0) :+= :-= :*= :/= // x:=x+a, x:=x-a, ...
#infix0 (0) :=+ :=- :=* :=/ // x:=a+x, x:=a-x, ...
*)

(* ****** ****** *)

sortdef
nat = {a:int | a >= 0}

sortdef int2 = int * int

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
(*
typedef xyz = $extype"abcde"
*)
//
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
