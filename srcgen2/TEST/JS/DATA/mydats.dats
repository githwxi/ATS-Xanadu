(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
(*
fun
foo (
(*void*)
) : void = ( foo(); )
*)
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2023-08-07: supported
Please see trans01_d0expseq
Mon Aug  7 23:26:13 EDT 2023
*)
//
fun
foo (
(*void*)
) : void = let in foo(); end
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
proj0(ci: @(char, sint)) = ci.0
fun
proj1(ci: @(char, sint)) = ci.1
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
fact29(x: sint) =
(
  loop@(0, 1) ) where
{
fun
loop ir =
let
  val (i, r) = ir
in//let
(
 if i < x
 then loop@(i+1, (i+1)*r) else r ) end
} (*where*) // end of [fact29(x: sint)]
//
(* ****** ****** *)
(* ****** ****** *)
fun
<x0:vt>
mycopy(x0: !x0): x0 = x0
fun
<x0:vt>
myfree(x0: ~x0): void = ()
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
mycprf
( x0 :
& x0 >> x0): x0 = x0
//
#extval
fun
<a:vt>
mycprf2
(x0: &a >> a): a
#impltmp
{x0: vt}
mycprf2<x0>( x0 ) = x0
//
(* ****** ****** *)
(* ****** ****** *)
val fxy =
lam{n:int}
(x: int(n))
(y: int(n)): int(n+n) => x+y
val sum = fxy(1000000)(1000000)
(* ****** ****** *)
(* ****** ****** *)
fun
<a0:vt>
myswap
(x0: &a0, y0: &a0): void =
let
val a0 = x0 in (x0:=y0; y0:=a0)
endlet
(* ****** ****** *)
(* ****** ****** *)
#impltmp
<>(*tmp*)
list_nilq
{a:t0}(xs) =
(
case+ xs of
|
nil _ => true | cons _ => false)
//(*case*) // end-of-[list_nilq(xs)]
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a0:t0>
list_length =
fix
length(xs) =>
(
case+ xs of
| nil _ => 0
| cons(_, xs) => length(xs))//end-fun
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
list_append
{m,n}
(xs, ys) = let
fnx
loop
{m:nat} .<m>.
( xs
: list(a, m)
, r0:
& (?list(a)>>list(a,m+n))): void =
(
case+ xs of
| list_nil() =>
  (r0 := ys)
| list_cons(x0, xs) =>
  let
    val () =
    r0 := list_cons(x0, _)
  in
    loop(xs, r0.1); $fold(r0)
  end
endcas // end of [ case+(xs) ]
)
in
let
var r0: list(a) in loop(xs, r0); r0
end(*let*)
end(*let*)//end-of(list_append(xs,ys))
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
strm_append
  (xs, ys) =
(
  append(xs, ys)) where
{
fun
append(xs, ys) =
$lazy
(
case+ $eval(xs) of
|
strmcon_nil() => $eval(ys)
|
strmcon_cons(x0, xs) =>
(
  strmcon_cons(x0, append(xs, ys))))
}(*where*)//end-of(strm_append(xs,ys))
//
(* ****** ****** *)

(* end of [DATA/mydats.dats] *)
