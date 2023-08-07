(* ****** ****** *)
(*
** For function ops
*)
(* ****** ****** *)
#staload
"prelude/SATS/gfun000.sats"
#staload
"prelude/SATS/gseq000.sats"
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
//
#impltmp
<a1>
gfun_not_c1fr
(    f0    ) =
(
  lam(x1) => not(f0(x1)))
#impltmp
<a1>
gfun_not_f1np
(    f0    ) =
(
  lam(x1) => not(f0(x1)))
//
(* ****** ****** *)
//
#impltmp
<x0>
gfun_enum_strx_vt
(    xs    ) =
let
val xs = !xs
val A0 = a0ref(xs)
in//let
//
lam() =<cfr>
let
//
#typedef t0 =
(?strxcon_vt(x0))
//
val xs =
a0ref_get0<t0>(A0)
//
val xs =
($UN.castlin10(xs))
in//let
case+ xs of
| ~
strxcon_vt_cons
(  x1, xs  ) =>
let
val xs =
($UN.castlin10(!xs))
in
  $UN.a0ref_set0<t0>(A0, xs); x1 end
//
end(*let*)//end-of-lam
end(*let*)//end-of-[gfun_enum_strx_vt]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gfun_memberq_gseq(xs) =
lam(x0) => gseq_memberq<xs><x0>(xs, x0)
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gfun000.dats] *)
