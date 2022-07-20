(* ****** ****** *)
(*
thu Jul 14 12:57:48 EDT 2022
*)
(* ****** ****** *)
//
val x1 = 10
//
val x2 = 20
and x3 =
$lam($10 + $20)
//
val x4 =
$lam($10 + $20)
where
{ val foo1 = bar2 }
//
(* ****** ****** *)

val id = lam(x) => x
val id = fix f(x) => x

(* ****** ****** *)

val x4 =
if b0 > 0 then 1 else 0
val x4 =
if b0 > 0 then 1 else 0
endst{n:int}(x:int, y:int)

(* ****** ****** *)

val ln =
(case+ xs of
|list_nil() => 0|list_cons _ => 1)

(* ****** ****** *)

var foo1: int with foo2 = (1 + 2)

(* ****** ****** *)

fun fact(x:int): int =
if x > 0 then x * fact(x-1) else 1

(* ****** ****** *)

datatype
list(a:type) =
|list_nil |list_cons of (a, list(a))

(* ****** ****** *)

fun
<a:type>
list_length
(xs: list(a)): sint =
(
case+ xs of
|
list_nil() => 0
|
list_cons(_, xs) => 1 + list_length<a>(xs)
|
list_cons(_, xs) => (if(xs|xs)then(0)else(1)) where { val xxx = yyy }
)

(* ****** ****** *)

#include "myfile-for-inclusion.hats"
#staload "myfile-for-staloading.sats"
#dyninit "myfile-for-dyniniting.dats"
#staload NS = "myfile-for-staloading.dats"

(* ****** ****** *)

val xyz =
(loop(i0,r0); fold(r0))

(* ****** ****** *)

datasort ints =
|ints_nil of ()
|ints_cons of (int, ints)

(* ****** ****** *)

#nonfix foo1 foo2 foo3

(* ****** ****** *)

#infix0
foo1 foo2 foo3 of 1000

(* ****** ****** *)

#abssort abc // abstract
#stacst0 abc : int -> int

(* ****** ****** *)

#sortdef nat = {a:int | a >= 0; a <= 5}

(* ****** ****** *)

val ID = $lam($1)

(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_miscell.dats] *)
