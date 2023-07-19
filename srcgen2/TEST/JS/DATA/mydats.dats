(* ****** ****** *)
fun
<x0:vt>
mycopy(x0: !x0): x0 = x0
(* ****** ****** *)
fun
<x0:vt>
myfree(x0: ~x0): void = ()
(* ****** ****** *)
(* ****** ****** *)
#impltmp
<>(*tmp*)
list_nilq
  (xs) =
(
case+ xs of
|nil _ => true |cons _ => false
) (*case*) // end-of-[list_nilq(xs)]
(* ****** ****** *)
(* ****** ****** *)
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
end(* let *)
end(* let *)//end-of(list_append(xs,ys))
(* ****** ****** *)

(* end of [DATA/mydats.dats] *)
