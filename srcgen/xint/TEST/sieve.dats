(* ****** ****** *)

fun
filter
(xs, x0) =
$lazy
(
let
val xs = $eval(xs)
in
case- xs of
|
strmcon_cons(x1, xs) =>
(
  if
  (x1%x0=0)
  then $eval(filter(xs, x0))
  else strmcon_cons(x1, filter(xs, x0))
)
end

fun
sieve
( xs
: stream(int)) =
$lazy
(
let
val xs = $eval(xs)
in
case- xs of
|
strmcon_cons(x0, xs) =>
strmcon_cons(x0, sieve(filter(xs, x0)))
end
) (* end of [sieve] *)

(* ****** ****** *)

val
xs =
sieve(from(2)) where
{
fun
from
(n:int): stream(int) =
$lazy(strmcon_cons(n, from(n+1)))
}

val-
strmcon_cons(x0, xs) = $eval(xs)
val-
strmcon_cons(x1, xs) = $eval(xs)
val-
strmcon_cons(x2, xs) = $eval(xs)
val-
strmcon_cons(x3, xs) = $eval(xs)
val-
strmcon_cons(x4, xs) = $eval(xs)
val-
strmcon_cons(x5, xs) = $eval(xs)

(* ****** ****** *)

(* end of [sieve.dats] *)
