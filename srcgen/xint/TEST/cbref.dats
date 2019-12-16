(* ****** ****** *)

fun
fact(n) =
let
fun
loop(n: int, r: &int) =
  if
  (n > 0)
  then
  let
  val () =
  (r := n * r) in loop(n-1, r)
  end
  else ()
in
  let
  var r: int = 1
  in
    let val () = loop(n, r) in r end
  end
end

val fact10 = fact(10)

(* ****** ****** *)

fun
fact(n:int): int =
let
//
fun
loop(nr: &(int, int)): int =
if
(nr.0 > 0)
then
let
val n = nr.0
and r = nr.1
in
nr.0 := n-1;
nr.1 := n*r; loop(nr)
else nr.1 // end of [if]
//
in
  let var nr = @(n, 1) in loop(nr) end
end

val fact10 = fact(10)

(* ****** ****** *)

(* end of [cbref.dats] *)
