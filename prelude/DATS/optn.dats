(* ****** ****** *)
(*
** for opts
*)
(* ****** ****** *)

(*
#staload
"./../SATS/optn.sats"
*)

(* ****** ****** *)
//
impltmp
<a>(*tmp*)
optn_length(xs) =
(
case+ xs of
| optn_none _ => 0 | optn_some _ => 1
)
//
(* ****** ****** *)

(* end of [optn.dats] *)
