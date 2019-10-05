(* ****** ****** *)
(*
** for g-sequences
*)
(* ****** ****** *)

impltmp
<xs,x0>
g_foreach(xs) =
let
val
test =
g_forall<xs,x0>(xs) where
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
<xs,x0><y0>
g_maprev_list
  (xs) = let
//
val r0 = list_vt_nil()
//
in
//
g_foldleft<xs,x0>(xs, r0) where
{
  impltmp
  foldleft$fopr(r0, x0) =
  list_vt_cons{y0}(map$fopr(x0), r0)
}
//
end // end of [g_maprev_list]

(* ****** ****** *)

(* end of [gseq.dats] *)
