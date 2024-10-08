(* ****** ****** *)
(*
HX: for pure C-arrays
*)
(* ****** ****** *)
(*
#staload
"./../SATS/arrn000.sats"
*)
(* ****** ****** *)
//
#staload UN =
"srcgen1\
/prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
//
(*
// prelude/array.sats
// arrays of
// various dimensionality
*)
//
(* ****** ****** *)
//
(*
HX-2020-10-25:
A C-style implementation
does not work in general
*)
//
#impltmp
<a:vt>
a0ptr_make0_1val(x0) =
let
val A0 =
a0ptr_alloc<a>((*nil*))
val p0 =
$UN.cast10{p2tr(a)}(A0)
val () =
$UN.p2tr_set<a>(p0, x0)
in
$UN.castlin10{a0ptr(a)}(A0)
end // end of [a0ptr_make_1val(x0)]
//
(* ****** ****** *)
//
(*
HX-2010-10-25:
A C-style implementation
does not work in general
*)
//
#impltmp
<a:t0>
a1ref_listize
  {n}(A0) = let
//
var
res:
list_vt(a) =
list_vt_nil()
val p0 = $addr(res)
//
val n0 =
a1ref_length(A0)
val n1 = pre(n0)
//
#impltmp
x1forint$work<n>(i0) =
let
  val j0 = n1 - i0
  val x0 = get$at(A0, j0)
in
$UN.p2tr_set_list_vt_cons(p0, x0)
end
//
in
let
val () =
g_x1forint<n>(n0) in $UN.castlin10(res)
end
end (*let*) // end of [a1ref_listize(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_Xint_prelude.dats] *)
