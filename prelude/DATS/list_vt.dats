(* ****** ****** *)
(*
** for lists_vt
*)
(* ****** ****** *)

(*
#staload
"./../SATS/list_vt.sats"
*)

(* ****** ****** *)
//
(*
HX-2019-10:
Quite an informative example:
*)
//
impltmp
<a>(*tmp*)
list_vt_tabulate_cref
  {n}(n0, f0) = let
//
impltmp
tabulate$fopr<a><n>(i0) = f0(i0)
//
in
  list_vt_tabulate<a><n>(n0)
end // end of [list_vt_tabulate_cref]
//
(* ****** ****** *)

(* end of [list_vt.dats] *)
