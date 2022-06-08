(* ****** ****** *)
(*
HX: for pure C-arrays
*)
(* ****** ****** *)
(*
#staload
"./..\
/SATS/arrn000.sats"
#staload
"./..\
/SATS/VT/arrn000_vt.sats"
*)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
//
(*
**HX: 0-dimensional
*)
//
(* ****** ****** *)
//
(*
//
(*
HX-2020-10-25:
A C-style implementation
that does not work in general
*)
//
#impltmp
<a:vt>
a0ptr_make(x0) =
let
val A0 =
a0ptr_alloc<a>()
//
(*
HX-2021:
Casting an array to a
pointer may not be supported!
*)
//
val p0 =
$UN.cast10{p2tr(a)}(A0)
val () =
$UN.p2tr_set<a>(p0, x0)
in
$UN.castlin10{a0ptr(a)}(A0)
end
*)
//
(* ****** ****** *)
#impltmp
<a:vt>
a0ptr_setf(A0, x0) =
g_free<a>
(a0ptr_exch<a>(A0, x0))
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
a0ptr_print$beg() = strn_print("[")
#impltmp
<>(*tmp*)
a0ptr_print$end() = strn_print("]")
//
(* ****** ****** *)
#impltmp
{a:vt}
gl_print1<a0ptr(a)> = a0ptr_print1<a>
(* ****** ****** *)
(*
**HX: 1-dimensional
*)
(* ****** ****** *)
#impltmp
<a:t0>
a1ptr_get_at(A0, i0) =
a1ptr_get0_at<a>(A0, i0)
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
a1ptr_make_nval
  {n}(n0, x0) =
(
let
val A0 =
a1ptr_alloc(n0)
in
loop(A0, 0(*i0*), x0)
end
) where
{
fun
loop
{i:nat
|i<=n}.<n-i>.
( A0
: a1ptr
  (?a, n)
, i0
: int(i)
, x0:(a)): a1ptr(a, n) =
(
if
(i0 < n0)
then
let
val
i1 =
succ(i0) in loop(A0, i1, x0)
end where
{
val x1 = g_copy<a>(x0)
val () =
a1ptr_set_at_raw<a>(A0, i0, x1)
} (*end of [then]*)
else
let
val () = g_free<a>(x0)
in
  $UN.castlin10{a1ptr(a,n)}(A0)
end // end of [else]
)
} (* end of [a1ptr_make_nval] *)
//
(* ****** ****** *)
//
#impltmp
<a:t0>
a1ptr_make_list
  {n}(xs) =
let
val n0 =
length(xs)
val A0 =
a1ptr_alloc(n0)
val () =
gseq_iforeach(xs) where
{
#impltmp
iforeach$work<a>(i, x) =
let
val i =
$UN.cast10{nintlt(n)}(i)
in
  a1ptr_set_at_raw<a>(A0, i, x)
end
}
in
  $UN.castlin10{a1ptr(a,n)}(A0)
end // end of [a1ptr_make_list]
//
(* ****** ****** *)
//
#impltmp
<a:vt>
a1ptr_make_list_vt
  {n}(xs) =
let
val n0 =
length1(xs)
val A0 =
a1ptr_alloc(n0)
val () =
glseq_iforeach0(xs) where
{
#impltmp
iforeach0$work<a>(i, x) =
let
val i =
$UN.cast10{nintlt(n)}(i)
in
  a1ptr_set_at_raw<a>(A0, i, x)
end
}
in
  $UN.castlin10{a1ptr(a,n)}(A0)
end // end of [a1ptr_make_list_vt]
//
(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_arrn000_vt.dats] *)
