(* ****** ****** *)

excptcon
| TRUEexn of ()

(* ****** ****** *)

val exn = TRUEexn()

(* ****** ****** *)

fun
rfind
( xs
: list(int), x0: int): bool =
try
let
val () =
auxlst(xs) in false
end
with
| ~TRUEexn() => true
end where
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
    if x0 = x1 then $raise TRUEexn()
  end
)
} (* end of [rfind] *)

(* ****** ****** *)

(* end of [rfind.dats] *)
