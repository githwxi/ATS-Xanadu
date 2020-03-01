(* ****** ****** *)
(*
** for g-sequences
*)
(* ****** ****** *)

#staload
UN =
"prelude/SATS/unsafe.sats"

(* ****** ****** *)

impltmp
<x0,xs><r0>
gseq_foldl(xs) =
(
  $UN.castlin(r0)
) where
{
//
var r0: r0
//
val p0 = $addr(r0)
//
val () =
(
gseq_foreach<x0,xs>(xs)
) where
{
impltmp
foreach$work<x0>(x0) =
let
val r0 = p2tr_get<r0>(p0)
in
p2tr_set<r0>
(p0, foldl$fopr<x0><r0>(r0, x0))
end // end of [foreach$work]
}
//
} (* end of [gseq_foldl] *)

(* ****** ****** *)

impltmp
<x0,xs>
gseq_length(xs) =
(
gseq_foldl
<x0,xs><r0>(xs, 0)
) where
{
typedef r0 = nint
implement
foldl$fopr
<x0><r0>(r0, x0) = r0 + 1
} (* gseq_length *)

(* ****** ****** *)

val xs =
list_cons
(1, list_cons(2, list_nil()))

(* ****** ****** *)

val ln = gseq_length(xs)

(* ****** ****** *)

(* end of [gseq_test.dats] *)
