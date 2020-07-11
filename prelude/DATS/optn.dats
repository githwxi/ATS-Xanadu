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
<>(*tmp*)
optn_nilq(xs) =
(
case+ xs of
| optn_nil() => true
| optn_cons(x0) => false
)
impltmp
<>(*tmp*)
optn_consq(xs) =
(
case+ xs of
| optn_nil() => false
| optn_cons(x0) => (true)
)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
optn_length(xs) =
(
case+ xs of
| none() => 0 | some(x0) => 1
)
//
(* ****** ****** *)
//
impltmp
<a>(*tmp*)
optn_forall(xs) =
(
case+ xs of
| optn_nil() => true
| optn_cons(x0) => forall$test<a>(x0)
)
//
impltmp
<a>(*tmp*)
optn_foreach(xs) =
(
case+ xs of
| optn_nil() => ()
| optn_cons(x0) => foreach$work<a>(x0)
)
//
impltmp
<a>(*tmp*)
optn_rforall(xs) =
(
case+ xs of
| optn_nil() => true
| optn_cons(x0) => rforall$test<a>(x0)
)
//
(* ****** ****** *)

impltmp
<a>(*tmp*)
optn_listize(xs) =
(
case+ xs of
| optn_nil() => list_vt_nil()
| optn_cons(x0) => list_vt_sing(x0)
)
impltmp
<a>(*tmp*)
optn_rlistize(xs) =
(
case+ xs of
| optn_nil() => list_vt_nil()
| optn_cons(x0) => list_vt_sing(x0)
)
impltmp
<a>(*tmp*)
optn_streamize(xs) =
$llazy
(
case+ xs of
| optn_nil() => strmcon_vt_nil()
| optn_cons(x0) => strmcon_vt_sing(x0)
)

(* ****** ****** *)

impltmp
<x0><y0>
optn_map(xs) =
(
optn_vt2t(optn_map_vt(xs))
)
//
impltmp
<x0><y0>
optn_map_vt(xs) =
(
case+ xs of
|
optn_nil() =>
optn_vt_nil()
|
optn_cons(x0) =>
optn_vt_cons(map$fopr<x0><y0>(x0))
) (* end of [optn_map_vt] *)

(* ****** ****** *)

impltmp
<a>(*tmp*)
optn_copy_vt(xs) =
(
case+ xs of
| optn_nil() => optn_vt_nil()
| optn_cons(x0) => optn_vt_cons(x0)
) (* end of [optn_copy_vt] *)

(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)

impltmp
{a:t0}
gseq_forall<optn(a)><a> = optn_forall<a>
impltmp
{a:t0}
gseq_foreach<optn(a)><a> = optn_foreach<a>
impltmp
{a:t0}
gseq_rforall<optn(a)><a> = optn_rforall<a>
impltmp
{a:t0}
gseq_rforeach<optn(a)><a> = optn_rforeach<a>

(* ****** ****** *)

(* end of [optn.dats] *)
