(* ****** ****** *)

excptcon
| Found0 of ()
| Found1 of int
| Found2 of string

(* ****** ****** *)

fun
rfind
( xs
: list(int), x0: int): bool =
(
try
let
val () =
auxlst(xs) in false
end with ~TRUE() => true
)
where
{
fun
auxlst
(xs: list(int)): void =
(
case+ xs of
| list_nil() => ()
| list_cons(x1, xs) =>
  let
  val () = auxlst(xs)
  in
    if x0 = x1 then $raise Found0()
  end
)
} (* end of [rfind] *)

(* ****** ****** *)

(* end of [rfind.dats] *)
