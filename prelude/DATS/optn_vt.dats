(* ****** ****** *)
(*
** for opts_vt
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
optn_vt_nilq(xs) =
(
case+ xs of
| !optn_vt_none _ => true
| !optn_vt_some _ => false
)
//
impltmp
<a>(*tmp*)
optn_vt_consq(xs) =
(
case+ xs of
| ! optn_vt_none _ => false
| ! optn_vt_some _ => (true)
)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
optn_vt_length(xs) =
(
case+ xs of
| !optn_vt_none _ => 0 | !optn_vt_some _ => 1
)
//
(* ****** ****** *)

(* end of [optn_vt.dats] *)
