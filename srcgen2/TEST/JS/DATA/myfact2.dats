(* ****** ****** *)
#staload "./myfact.dats"
(* ****** ****** *)
(*
//
(*
HX:
[fact2] is defined elsewhere
Should this really be supported?
*)
//
fun
fact21(x: sint): sint =
if x > 0 then x * fact2(x-1) else 1
*)
(* ****** ****** *)
fun
fact28(x: sint) =
(
  loop@(0, 1) ) where
{
fun
loop ir =
if i < x
then loop@(ir.0+1, (ir.0+1)*ir.1) else ir.1
}
////
(* ****** ****** *)

excptcon FACTexn of ()

fun
fact21
( x
: sint
) : sint = $raise FACTexn

(* ****** ****** *)
//
fun
fact22(x: sint) =
if
x > 0
then x * fact23(x-1) else 1
and
fact23(x: sint) =
if
x > 0
then x * fact22(x-1) else 1
//
(* ****** ****** *)

fun
fact24(x: sint) =
(
  loop(0); res) where
{
var res = 1
fnx
loop(i: int): void =
if i < x then
(res := res * (i+1); loop(i+1))
}

(* ****** ****** *)

fun
fact25(x: sint) =
(
  loop@(0, 1) ) where
{
fun
loop@(i, r) =
if i < x then loop@(i+1, i*r+r) else r
}

(* ****** ****** *)

fun
fact26(x: sint) =
(
  loop $(0, 1) ) where
{
fun
loop $(i, r) =
if i < x then loop $(i+1, i*r+r) else r
}

(* ****** ****** *)

fun
fact27(x: sint) =
(
  loop(0); res) where
{
//
var res = 1
//
val
prs = &res
(*
val
prs = $addr(res)
*)
fnx
loop(i: int): void =
if i < x then
(!prs := !prs * (i+1); loop(i+1)) }//fun

(* ****** ****** *)


(* ****** ****** *)

(* end of [DATA/myfact2.dats] *)
