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
var x: int = 10
(* ****** ****** *)
val p = &x//addr
(* ****** ****** *)
val () = (x:=x+1)
(* ****** ****** *)
val xx = ( x * x )
(* ****** ****** *)
prv pf = $view( x )
(* ****** ****** *)
val () = !p:=(!p)+1
(* ****** ****** *)
//
fun
foo0
(x:
 ?sint): sint = x + 1
//
fun
foo1
(x:
 &sint): void = x := x+1
and
foo2
(x:
 &sint >> sint): void = x := x+1
//
(* ****** ****** *)
val y1 = foo1( x )
and y2 = foo2( x )
val y3 = foo0( x )
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<a:t0>
mylength
( xs
: list(a)): sint
//
#impltmp
<a>(*tmp*)
mylength(xs) =
(
  loop(xs, 0)) where
{
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
( x1,
list_nil _ ) => loop(xs, j0+1)
|
list_cons
( x1,
list_cons
( x2, xs ) ) => loop(xs, j0+2)
)(*case+*)//end-of-(loop(xs,j0))
}(*where*)//end-of-(mylength(xs))
//
(* ****** ****** *)
(* ****** ****** *)
val mylist10 =
(
  list(0,1,2,3,4,5,6,7,8,9) )
val length10 = length(mylist10)
val mylength10 = mylength(mylist10)
(* ****** ****** *)
//
(*
val mylist26 =
list_vt2t
(
strn_listize
( "ABCDEFGHIJKLMNOPQRSTUVWXYZ"))
*)
//
val mylist26 =
gseq_foldr
<strn><c><r>
( "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
, list_nil()) where
{
#typedef c = char
#typedef r = list(char)
#impltmp
foldr$fopr<c><r>(c, r) = list_cons(c, r)
}
//
val length26 = length(mylist26)
val mylength26 = mylength(mylist26)
(* ****** ****** *)
////
(* ****** ****** *)
//
fun
isevn(x: nint): bool =
if x > 0
then isodd(x-1) else true
and
isodd(x: nint): bool =
if x > 0
then isevn(x-1) else false
//
val
isevn10=isevn(10) and isodd10=isodd(10)
//
(* ****** ****** *)
(* ****** ****** *)

dataprop
FIB (int, int) =
|
FIB0(0, 0)
|
FIB1(1, 1)
|
{n:nat}{r0,r1:int}
FIB2(n+2, r0+r1) of (FIB (n, r0), FIB (n+1, r1))
// end of [FIB] // end of [dataprop]

(* ****** ****** *)
fun
fibats
{n:nat}
(n: sint(n)):
[r:int] (FIB (n, r) | int r) = let
//
fun
loop
{i:nat
|i <= n}
{r0,r1:int}
( pf0: FIB(i, r0)
, pf1: FIB(i+1, r1)
| n_i: sint(n-i)
, r_0: sint r0, r_1: sint r1
) : [r:int] (FIB(n, r) | sint(r)) =
(
if
n_i <= 1
then
(
if (n_i >= 1)
then (pf1 | r_1) else (pf0 | r_0))
else
loop{i+1}
(
  pf1
, FIB2(pf0, pf1) | n_i-1, r_1, r_0+r_1)
) (* end of [loop] *)
in//let
  loop{0}(FIB0(*void*), FIB1(*void*) | n, 0, 1)
end//let//end of [fibats]
//
(* ****** ****** *)
val fibats10 = fibats(10) // fibats10 = 55
(* ****** ****** *)

(* end of [(* end of [ATS3/XATSOPT_BOOT_JS_DATA_mytest02.dats] *)
