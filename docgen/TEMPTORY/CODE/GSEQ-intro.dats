(* ****** ****** *)
//
// HX-2021-01-05:
// For GSEQ-intro
//
(* ****** ****** *)

impltmp
<xs><x0>
gseq_forall(xs) =
(
  auxloop(streamize(xs))
) where
{
  fun
  auxloop(xs) =
  (
  case+ !xs of
  | ~
  strmcon_vt_nil() => true
  | ~
  strmcon_vt_cons(x0, xs) =>
  if
  forall$test(x0)
  then auxloop(xs)
  else let val () = free(xs) in false end
  )
} (* end of [gseq_forall] *)

(* ****** ****** *)

(* end of [GSEQ-intro.dats] *)
