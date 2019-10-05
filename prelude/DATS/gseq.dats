(* ****** ****** *)
(*
** for g-sequences
*)
(* ****** ****** *)

#staload
"./../SATS/gseq.sats"

(* ****** ****** *)

implement
g_maprev_list
  (xs) = let
//
var r0 =
list_vt_nil()
//
val () =
g_foreach(xs) where
{
implement
foreach$work(x) =
!r0 :=
list_vt_cons(map$fopr(x), !r0)
}
//
in
  list_vt2t(r0)
end // end of [g_maprev_list]

(* ****** ****** *)

(* end of [gseq.dats] *)
