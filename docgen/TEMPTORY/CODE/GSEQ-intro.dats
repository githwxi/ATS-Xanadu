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
auxloop
(gseq_streamize<xs><x0>(xs))
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
  let
    val
    test =
    forall$test<x0>(x0)
  in
    if
    test
    then auxloop(xs)
    else let val () = free(xs) in false end
  end // end of [strmcon_vt_cons]
  )
} (*where*) // end of [gseq_forall]

(* ****** ****** *)

impltmp
<xs><x0>
gseq_exists(xs) =
(
  not(gseq_forall<xs><x0>(xs))) where
{
  impltmp
  forall$test<x0>(x0) = not(exists$test<x0>(x0))
} (* end of [gseq_exists] *)

(* ****** ****** *)

(* end of [GSEQ-intro.dats] *)
