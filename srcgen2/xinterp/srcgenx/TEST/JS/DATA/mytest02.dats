(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#include
"prelude/HATS/prelude_dats.hats"
//
#include
"prelude/HATS/CATS/Xint/prelude_dats.hats"
//
(* ****** ****** *)
//
#extern
fun
mylength
( xs
: list(sint)): sint
//
#impltmp
mylength(xs) =
(
  loop(xs, 0)) where
{
//
#typedef a = sint
//
fnx
loop
{i,j:int}
( xs
: list(a,i)
, j0
: sint( j )): sint(i+j) =
(
case+ xs of
|
list_nil
((*nil*)) => j0
|
list_cons
( _, xs ) => loop(xs, j0+1)
)(*case+*)//end-of-(loop(xs,j0))
}(*where*)//end-of-(mylength(xs))
//
(* ****** ****** *)
(* ****** ****** *)
val mylist10 =
(
  list(0,1,2,3,4,5,6,7,8,9) )
(* ****** ****** *)
val length10 = length(mylist10)
(* ****** ****** *)
val mylength10 = mylength(mylist10)
(* ****** ****** *)
(* ****** ****** *)

(* end of [(* end of [ATS3/XATSOPT_BOOT_JS_DATA_mytest02.dats] *)
