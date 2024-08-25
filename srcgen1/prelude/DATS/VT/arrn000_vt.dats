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
//
#staload UN =
"srcgen1\
/prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
//
(*
**HX: 0-dimensional
*)
//
(* ****** ****** *)
#impltmp
<a:vt>
a0ptr_frset1(A0, x0) =
g_free<a>
(a0ptr_exch1<a>(A0, x0))
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
a0ptr_make_1val(x0) =
let
val A0 =
a0ptr_alloc<a>((*nil*))
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
end(*let*)//end-of(a0ptr_make)
//
*)
//
(* ****** ****** *)
(*
**HX: 1-dimensional
*)
(* ****** ****** *)
#impltmp
<a:t0>
a1ptr_get$at1(A0, i0) =
a1ptr_dtget$at1<a>(A0, i0)
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
suc(i0) in loop(A0, i1, x0)
end where
{
val () =
(
a1ptr_set$at1<(?a)>(A0,i0,x0))
} (*end of [then]*)
else
(
$UN.castlin10{a1ptr(a,n)}(A0))
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
length(xs) in
a1ptr_make_listn(xs, n0) end
//
#impltmp
<a:t0>
a1ptr_make0_llist
  {n}(xs) =
let
val n0 =
length1(xs) in
a1ptr_make0_llistn(xs, n0) end
//
(* ****** ****** *)
//
#impltmp
<a:t0>
a1ptr_make_listn
  {n}(xs, n0) =
let
val A0 =
a1ptr_alloc(n0)
val () =
gseq_iforitm(xs) where
{
#impltmp
iforitm$work<a>(i, x) =
let
val i =
$UN.cast10{nintlt(n)}(i)
in//let
a1ptr_set$at1<(?a)>(A0, i, x)
end//let
}
in
  $UN.castlin10{a1ptr(a,n)}(A0)
end // end of [a1ptr_make_listn]
//
(* ****** ****** *)
//
#impltmp
<a:vt>
a1ptr_make0_llistn
  {n}(xs, n0) =
let
val A0 =
a1ptr_alloc(n0)
val () =
gseq_iforitm0(xs) where
{
#impltmp
iforitm$work0<a>(i, x) =
let
val i =
$UN.cast10{nintlt(n)}(i)
in//let
(
  a1ptr_set$at1<(?a)>
  (A0, i, $UN.delinear(x)))
end//let
}
in
  $UN.castlin10{a1ptr(a,n)}(A0)
end // end of [a1ptr_make0_llistn]
//
(* ****** ****** *)
(*
HX:
For implementing g-ops
*)
(* ****** ****** *)
//
#impltmp
{a:vt}
{n:i0}
g_free
<a1ptr(a,n)>(A0) =
(
a1ptr_free(A0, n0)
) where
{
  val n0 = a1ptr_length1(A0) }//where
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_arrn000_vt.dats] *)
