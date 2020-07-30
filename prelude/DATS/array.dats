(* ****** ****** *)
(*
HX: for pure C-arrays
*)
(* ****** ****** *)
(*
#staload
"./../SATS/array.sats"
*)
(* ****** ****** *)
#staload
UN =
"prelude/SATS/unsafe.sats"
(* ****** ****** *)
//
(*
**HX: 0-dimensional
*)
//
(* ****** ****** *)
//
impltmp
<a:vt>
a0ref_make(x0) =
a0ptr2ref
(a0ptr_make<a>(x0))
//
impltmp
<a:vt>
a0ptr_make(x0) =
let
val A0 =
a0ptr_alloc<a>()
val p0 =
$UN.cast10{p2tr(a)}(A0)
val () =
$UN.p2tr_set<a>(p0, x0)
in
$UN.castlin10{a0ptr(a)}(A0)
end
//
(* ****** ****** *)
//
impltmp
<a:t0>
a0ref_print(A0) =
let
val () = a0ref_print$beg<>()
val () = g_print<a>(get(A0))
val () = a0ref_print$end<>()
end
//
impltmp
<>(*tmp*)
a0ref_print$beg() = string_print("[")
impltmp
<>(*tmp*)
a0ref_print$end() = string_print("]")
//
(* ****** ****** *)
(*
**HX: 1-dimensional
*)
(* ****** ****** *)
//
impltmp
<a:vt>
a1ref_make_nval
  (asz, ini) =
(
a1ptr2ref
(a1ptr_make_nval<a>(asz, ini))
)
//
impltmp
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
impltmp
<a:t0>
a1ref_make_list
( xs ) =
( a1ptr2ref
  (a1ptr_make_list<a>(xs))
)
//
impltmp
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
impltmp
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
impltmp
<a:vt>
a1ref_make_list_vt
( xs ) =
( a1ptr2ref
  (a1ptr_make_list_vt<a>(xs))
)
//
impltmp
<a:vt>
a1ptr_make_list_vt
  {n}(xs) =
let
val n0 =
length(xs)
val A0 =
a1ptr_alloc(n0)
val () =
glseq_iforeach0(xs) where
{
impltmp
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
impltmp
<>(*tmp*)
a1ref_print$beg() = string_print("[")
impltmp
<>(*tmp*)
a1ref_print$end() = string_print("]")
//
(* ****** ****** *)

impltmp
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
impltmp
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

(* ****** ****** *)

impltmp
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
impltmp
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

(* ****** ****** *)

impltmp
<a:vt>
a1ref_streamize
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
(i0: sint(i)): stream_vt(a) =
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
} (* end of [a1ref_streamize] *)

(* ****** ****** *)
//
impltmp
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
if test then loop(succ(i0)) else false
end else false // end of [if]
//
} (* end of [a1ref_forall] *)
//
(* ****** ****** *)
//
impltmp
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
impltmp
<a:t0>
a1ref_rforall
  {n}(A0) =
(
loop(length(A0))
) where
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
end else false // end of [if]
//
} (* end of [a1ref_rforall] *)
//
(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)
//
impltmp
{a:t0}
{n:i0}
gseq_length
<a1ref(a,n)><a> = a1ref_length<a><n>
//
(* ****** ****** *)
//
impltmp
{a:t0}
{n:i0}
gseq_forall
<a1ref(a,n)><a> = a1ref_forall<a>{n}
impltmp
{a:t0}
{n:i0}
gseq_foreach
<a1ref(a,n)><a> = a1ref_foreach<a>{n}
//
(* ****** ****** *)
//
impltmp
{a:t0}
{n:i0}
gseq_listize
<a1ref(a,n)><a> = a1ref_listize<a>{n}
//
impltmp
{a:t0}
{n:i0}
gseq_rlistize
<a1ref(a,n)><a> = a1ref_rlistize<a>{n}
//
(* ****** ****** *)
//
impltmp
{a:t0}
{n:i0}
gseq_unlist
<a1ref(a,n)><a>(xs) = a1ref_make_list<a>(xs)
impltmp
{a:t0}{n:i0}
gseq_unlist_vt
<a1ref(a,n)><a>(xs) = a1ref_make_list_vt<a>(xs)
//
(* ****** ****** *)

(* end of [array.dats] *)
