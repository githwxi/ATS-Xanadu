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
var
res = 1
fun
loop(i: int): void =
if i < x then
(res := res * (i+1); loop(i+1))
}

(* ****** ****** *)

(* end of [DATA/myfact2.dats] *)
