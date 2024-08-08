(* ****** ****** *)
(*
** For function ops
*)
(* ****** ****** *)
//
(*
#staload
"srcgen1\
/prelude/SATS/gfun000.sats"
*)
//
(* ****** ****** *)
#staload UN =
"srcgen1\
/prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
#impltmp
<a1:t0>
gfun_not_f1un
(    f0    ) =
(
  lam(x1) => not(f0(x1)) )//impl
//
(* ****** ****** *)
//
#impltmp
<x0:vt>
gfun_enum_strx_vt
(    xs    ) =
let
val xs = !xs
val A0 = a0ref(xs)
in//let
//
lam((*0*)) =>
let
//
#typedef t0 =
(?strxcon_vt(x0))
//
val xs =
$UN.castlin10
(
a0ref_dtget<t0>(A0))
//
in//let
case+ xs of
| ~
strxcon_vt_cons
(  x1, xs  ) =>
let
val xs =
($UN.castlin10(!xs))
in
(
a0ref_dtset<t0>(A0, xs); x1) end
//
end(*let*)//end-of-lam
end(*let*)//end-of-[gfun_enum_strx_vt]
//
(* ****** ****** *)
//
(*
#impltmp
<xs><x0>
gfun_memberq_gseq(xs) =
(
lam(x0)=>gseq_memberq<xs><x0>(xs,x0))
*)
//
(* ****** ****** *)
//
#impltmp
<x0:t0>
<y0:vt>
gfun_equal$at
  (f0, x0, y0) =
(
  g_equal0<y0>(f0(x0), y0))
//
#impltmp
<x0:t0>
<y0:vt>
gfun_rand_equal_f1un
  (f1, f2) =
let
  val x1 = g_rand<x0>((*0*))
  and x2 = g_rand<x0>((*0*))
in
  g_equal0<y0>(f1(x1), f2(x2)) endlet
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_gfun000.dats] *)
