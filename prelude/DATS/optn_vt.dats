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
| !
optn_vt_nil() => true
| !
optn_vt_cons(x0) => false
)
//
impltmp
<a>(*tmp*)
optn_vt_consq(xs) =
(
case+ xs of
| !
optn_vt_nil() => false
| !
optn_vt_cons(x0) => (true)
)
//
impltmp
{a:vt}
g_free
<optn_vt(a)> = optn_vt_free<a>
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
optn_vt_free(xs) =
(
case+ xs of
| ~
optn_vt_nil() => ()
| ~
optn_vt_cons(x0) => g_free<a>(x0)
)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
optn_vt_length(xs) =
(
case+ xs of
| !none_vt() => 0 | !some_vt(x0) => 1
)
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
optn_vt_listize(xs) =
(
case+ xs of
| ~
optn_vt_nil() => list_vt_nil()
| ~
optn_vt_cons(x0) => list_vt_sing(x0)
)
impltmp
<a>(*tmp*)
optn_vt_rlistize(xs) =
(
case+ xs of
| ~
optn_vt_nil() => list_vt_nil()
| ~
optn_vt_cons(x0) => list_vt_sing(x0)
)
impltmp
<a>(*tmp*)
optn_vt_streamize0(xs) =
$llazy
(
g_free(xs);
case+ xs of
| ~
optn_vt_nil() => strmcon_vt_nil()
| ~
optn_vt_cons(x0) => strmcon_vt_sing(x0)
)

(* ****** ****** *)

(* end of [optn_vt.dats] *)
