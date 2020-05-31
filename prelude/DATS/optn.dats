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
//
impltmp
<a>(*tmp*)
optn_forall(xs) =
(
case+ xs of
| optn_none _ => true
| optn_some(x0) => forall$test<a>(x0)
)
//
impltmp
<a>(*tmp*)
optn_foreach(xs) =
(
case+ xs of
| optn_none _ => ()
| optn_some(x0) => foreach$work<a>(x0)
)
//
impltmp
<a>(*tmp*)
optn_rforall(xs) =
(
case+ xs of
| optn_none _ => true
| optn_some(x0) => rforall$test<a>(x0)
)
//
(* ****** ****** *)

impltmp
{a:t0}
gseq_forall<a,optn(a)> = optn_forall<a>
impltmp
{a:t0}
gseq_foreach<a,optn(a)> = optn_foreach<a>
impltmp
{a:t0}
gseq_rforall<a,optn(a)> = optn_rforall<a>
impltmp
{a:t0}
gseq_rforeach<a,optn(a)> = optn_rforeach<a>

(* ****** ****** *)

(* end of [optn.dats] *)
