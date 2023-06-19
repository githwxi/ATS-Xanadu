(* ****** ****** *)
(*
HX-2023-06-12:
[fact1] is defined:
*)
#include "./myfact.hats"
(* ****** ****** *)
//
(*
val fact2 = fact1
*)
fun
fact2(x: sint): sint =
if x > 0 then x * fact1(x-1) else 1
//
(* ****** ****** *)

fun
fact3(x: sint): sint =
(
loop(0(*i*), 1(*r*)) ) where
{
fun loop(i, r) =
if i < x then loop(i+1, i*r+r) else r
} (* where *) // end of [fact3(x:sint)]

(* ****** ****** *)

fun
list_facts
(n0: sint): list(sint) =
if
n0 > 0
then
list_extend<_>
(list_facts(n0-1), fact3(n0-1))
else list_nil((*void*))//end(list_facts)

(* ****** ****** *)

fun
list_facts
(n0: sint): list(sint) =
list_map
(sint_listize(n0)) where
{
//
fun
sint_listize(n0) =
if
n0 <= 0
then list_nil() else
list_extend
(sint_listize(n0-1), n0-1)
//
#typedef x0 = sint
#typedef y0 = sint
#impltmp
map$fopr<x0><y0>(x0) = fact2(x0) }

(* ****** ****** *)
//
fun<>
fact4(x: nint) = 
(
case+ x of
  | 0 => 1 | _ => x * fact4(x-1) )
//
(* ****** ****** *)

fun
fact5(x: nint) =
if x > 0 then x * fact4(x-1) else 1

(* ****** ****** *)

(* end of [DATA/myfact.dats] *)
