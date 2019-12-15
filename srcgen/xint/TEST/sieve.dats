(* ****** ****** *)

fun
sieve
(xs: stream(int)) =
$lazy
(
let
val xs = $eval(xs)
in
case- xs of
|
strmcon_cons(x0, xs) =>
strmcon_cons
(x0, sieve(filter(xs, x0)))
end
) where
{
fun
filter
( xs
: stream(int), x0) =
$lazy
(
let
val xs = $eval(xs)
in
case-
|
strmcon_cons(x1, xs) =>
(
  if
  (x1%x0=0)
  then $eval(filter(xs, x0))
  else strmcon_cons(x1, filter(xs, x1))
)
end
) (* filter *)
} (* end of [sieve] *)

(* ****** ****** *)

(* end of [sieve.dats] *)
