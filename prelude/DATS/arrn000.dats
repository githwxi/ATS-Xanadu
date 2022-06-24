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
#impltmp
<a:vt>
a0ref_make(x0) =
a0ptr2ref
(a0ptr_make<a>(x0))
//
(* ****** ****** *)
#impltmp
<a:t0>
a0ref_get(A0) =
a0ref_get0<a>(A0)
(* ****** ****** *)
#impltmp
<a:t0>
a0ref_set(A0, x0) =
a0ref_setf<a>(A0, x0)
(* ****** ****** *)
//
#impltmp
<a:vt>
a0ref_setf(A0, x0) =
g_free<a>
(a0ref_exch<a>(A0, x0))
//
(* ****** ****** *)
(*
**HX: 1-dimensional
*)
(* ****** ****** *)
#impltmp
<a:t0>
a1ref_get_at(A0, i0) =
a1ref_get0_at<a>(A0, i0)
(* ****** ****** *)
//
#impltmp
<a:vt>
a1ref_make_nval
  (asz, ini) =
(
a1ptr2ref
(a1ptr_make_nval<a>(asz, ini))
)
//
(* ****** ****** *)
//
#impltmp
<a:t0>
a1ref_make_list
( xs ) =
( a1ptr2ref
  (a1ptr_make_list<a>(xs))
)
//
#impltmp
<a:vt>
a1ref_make_list_vt
( xs ) =
( a1ptr2ref
  (a1ptr_make_list_vt<a>(xs))
)
//
(* ****** ****** *)
//
(*
HX-2010-10-25:
A C-style implementation
that SHOULD work in general
*)
//
#impltmp
<a:t0>
a1ref_listize
  {n}(A0) = let
//
var
res:
?list_vt(a) =
list_vt_nil()
val p0 = $addr(res)
//
val n0 =
a1ref_length(A0)
val n1 = pred(n0)
//
#impltmp
x1forint$work<n>(i0) =
let
  val j0 = n1 - i0
  val x0 = get_at(A0, j0)
in
$UN.p2tr_set_list_vt_cons(p0, x0)
end
//
in
let
val () =
g_x1forint<n>(n0) in $UN.castlin10(res)
end
end // end of [a1ref_listize]
//
(* ****** ****** *)
//
(*
HX-2010-10-25:
A C-style implementation
that SHOULD work in general
*)
//
#impltmp
<a:t0>
a1ref_rlistize
  {n}(A0) = let
//
var
res:
?list_vt(a) =
list_vt_nil()
val p0 = $addr(res)
//
val n0 = a1ref_length(A0)
//
#impltmp
x1forint$work<n>(i0) =
let
  val x0 = get_at(A0, i0)
in
$UN.p2tr_set_list_vt_cons(p0, x0)
end
//
in
let
val () =
g_x1forint<n>(n0) in $UN.castlin10(res)
end
end // end of [a1ref_rlistize]
//
(* ****** ****** *)

#impltmp
<a:vt>
a1ref_strmize
  {n}(A0) =
(
  auxmain(0(*i0*))
) where
{
//
val n0 =
a1ref_length<a><n>(A0)
//
fun
auxmain
{i:nat
|i<=n}
(i0: sint(i)): strm_vt(a) =
$llazy
(
if
(i0 >= n0)
then
strmcon_vt_nil((*void*))
else
strmcon_vt_cons
(get_at(A0, i0), auxmain(succ(i0)))
) (* end of [auxmain] *)
} (*where*) // end-of(a1ref_strmize)

(* ****** ****** *)
//
#impltmp
<a:t0>
a1ref_forall
  {n}(A0) =
(
  loop(0(*i0*))
) where
{
//
val n0 =
a1ref_length<a><n>(A0)
//
fun
loop
{i:nat
|i<=n}(i0: sint(i)): bool =
if
(i0 < n0)
then
let
val
test =
forall$test<a>(get_at(A0, i0))
in
if
test
then loop(succ(i0)) else false
end // then
else false // else // end of [if]
//
} (* end of [a1ref_forall] *)
//
(* ****** ****** *)
//
#impltmp
<a:t0>
a1ref_foreach
  {n}(A0) =
(
  loop(0(*i0*))
) where
{
//
val n0 =
a1ref_length<a><n>(A0)
//
fun
loop
{i:nat
|i<=n}(i0: sint(i)): void =
if
(i0 < n0)
then
(
  loop(succ(i0))
) where
{
  val () =
  foreach$work<a>(get_at(A0, i0))
}
//
} (* end of [a1ref_foreach] *)
//
(* ****** ****** *)
//
#impltmp
<a:t0>
a1ref_rforall
  {n}(A0) =
(
loop
(a1ref_length(A0))) where
{
//
fun
loop
{i:nat
|i<=n}(i0: sint(i)): bool =
if
(i0 > 0)
then
let
val i1 = pred(i0)
val
test =
rforall$test<a>(get_at(A0, i1))
in
if test then loop(i1) else false
end // then
else false // else // end of [if]
//
} (* end of [a1ref_rforall] *)
//
(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)
//
#impltmp
{a:t0}
{n:i0}
gseq_length
<a1ref(a,n)><a> = a1ref_length<a><n>
//
(* ****** ****** *)
//
#impltmp
{a:t0}
{n:i0}
gseq_forall
<a1ref(a,n)><a> = a1ref_forall<a>{n}
#impltmp
{a:t0}
{n:i0}
gseq_foreach
<a1ref(a,n)><a> = a1ref_foreach<a>{n}
//
(* ****** ****** *)
//
#impltmp
{a:t0}
{n:i0}
gseq_listize
<a1ref(a,n)><a> = a1ref_listize<a>{n}
//
#impltmp
{a:t0}
{n:i0}
gseq_rlistize
<a1ref(a,n)><a> = a1ref_rlistize<a>{n}
//
(* ****** ****** *)
//
#impltmp
{a:t0}
{n:i0}
gseq_unlist
<a1ref(a,n)><a>(xs) = a1ref_make_list<a>(xs)
#impltmp
{a:t0}{n:i0}
gseq_unlist_vt
<a1ref(a,n)><a>(xs) = a1ref_make_list_vt<a>(xs)
//
(* ****** ****** *)
//
#impltmp
{a:vt}
{n:i0}
glseq_forall1
<a1ref(a,n)><a> = a1ref_forall1<a>{n}
#impltmp
{a:vt}
{n:i0}
glseq_foreach1
<a1ref(a,n)><a> = a1ref_foreach1<a>{n}
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_arrn000.dats] *)
