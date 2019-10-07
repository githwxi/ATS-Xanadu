(* ****** ****** *)
(*
** for g-sequences
*)
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

impltmp
<x0,xs>
gseq_foreach(xs) =
let
val
test =
gseq_forall<x0,xs>(xs) where
{
impltmp
forall$test(x0) =
let
val () = foreach$work(x0) in true
end
}
in
  // nothing
end // end of [gseq_foreach]

(* ****** ****** *)

impltmp
<x0,xs><y0>
gseq_maprev_list
  (xs) = let
//
typedef r0 = list_vt(y0)
//
in
//
gseq_foldl<x0,xs>
(xs, list_vt_nil()) where
{
  impltmp
  foldl$fopr
  <x0><r0>
  (r0, x0) =
  list_vt_cons(map$fopr(x0), r0)
}
//
end // end of [gseq_maprev_list]

(* ****** ****** *)

impltmp
<x0,xs>
gseq_add(xs) =
let
//
typedef r0 = x0
//
implement
foldl$fopr
<x0><r0>
(r0, x0) = g_add(r0, x0)
//
in
  gseq_foldl<x0,xs><r0>(xs, g_0<r0>())
end // end of [gseq_add]

(* ****** ****** *)

impltmp
<x0,xs>
gseq_mul(xs) =
let
//
typedef r0 = x0
//
implement
foldl$fopr
<x0><r0>
(r0, x0) = g_mul(r0, x0)
//
in
  gseq_foldl<x0,xs><r0>(xs, g_1<r0>())
end // end of [gseq_mul]

(* ****** ****** *)

(* end of [gseq.dats] *)
