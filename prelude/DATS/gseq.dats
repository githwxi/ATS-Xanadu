(* ****** ****** *)
(*
** for g-sequences
*)
(* ****** ****** *)

impltmp
<x0,xs>
g_foreach(xs) =
let
val
test =
g_forall<x0,xs>(xs) where
{
impltmp
forall$test(x0) =
let
val () = foreach$work(x0) in true
end
}
in
  // nothing
end // end of [g_foreach]

(* ****** ****** *)

impltmp
<x0,xs><y0>
g_maprev_list
  (xs) = let
//
val r0 = list_vt_nil()
//
in
//
g_foldleft<x0,xs>(xs, r0) where
{
  impltmp
  foldleft$fopr(r0, x0) =
  list_vt_cons{y0}(map$fopr(x0), r0)
}
//
end // end of [g_maprev_list]

(* ****** ****** *)

(* end of [gseq.dats] *)
