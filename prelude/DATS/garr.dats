(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)
(*
#staload
"./../SATS/garr.sats"
*)
(* ****** ****** *)
//
(*
**HX: 0-dimensional
*)
//
(* ****** ****** *)
//
impltmp
<a:vtype>
a0ref_make(x0) =
a0ptr2ref
(a0ptr_make<a>(x0))
//
(* ****** ****** *)
//
impltmp
<a:vtype>
a0ref_print(A0) =
let
val x0 =
a0ref_get<a>(A0)
val () =
a0ref_print$beg<>()
val () =
let
val () =
g_print<a>(x0) in g_free<a>(x0)
end
val () =
a0ref_print$end<>()
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
<a:vtype>
a1ref_make_nval(asz, ini) =
a1ptr2ref
(a1ptr_make_nval<a>(asz, ini))
//
(* ****** ****** *)

impltmp
<a:vtype>
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
(sub(A0, i0), auxmain(succ(i0)))
) (* end of [auxmain] *)
} (* end of [a1ref_streamize] *)

(* ****** ****** *)
//
impltmp
<a:type>
a1ref_forall
  (A0) =
(
a1ref_forall0<a>(A0)
) where
{
impltmp
forall0$test<a> = forall$test<a>
}
//
impltmp
<a:vtype>
a1ref_forall0
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
forall0$test<a>(sub(A0, i0))
in
if test then loop(succ(i0)) else false
end else false // end of [if]
//
} (* end of [a1ref_forall0] *)
//
(* ****** ****** *)
//
impltmp
<a:type>
a1ref_foreach
  (A0) =
(
a1ref_foreach0<a>(A0)
) where
{
impltmp
foreach0$work<a> = foreach$work<a>
}
//
impltmp
<a:vtype>
a1ref_foreach0
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
  foreach0$work<a>(sub(A0, i0))
}
//
} (* end of [a1ref_foreach0] *)
//
(* ****** ****** *)
//
// For gseq-operations
//
(* ****** ****** *)

impltmp
{a:t0}{n:i0}
gseq_length
<a,a1ref(a,n)> = a1ref_length<a><n>

(* ****** ****** *)

impltmp
{a:t0}{n:i0}
gseq_forall
<a,a1ref(a,n)> = a1ref_forall<a><n>
impltmp
{a:t0}{n:i0}
gseq_foreach
<a,a1ref(a,n)> = a1ref_foreach<a><n>

(* ****** ****** *)

(* end of [garr.dats] *)
