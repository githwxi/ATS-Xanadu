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
a1ref_forall1<a>(A0)
) where
{
impltmp
forall1$test<a> = forall$test<a>
}
//
impltmp
<a:vtype>
a1ref_forall1
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
then let
val test =
forall1$test<a>(sub(A0, i0))
in
if test then loop(succ(i0)) else false
end else false // end of [if]
//
} (* end of [a1ref_forall1] *)
//
(* ****** ****** *)
//
impltmp
<a:type>
a1ref_foreach
  (A0) =
(
a1ref_foreach1<a>(A0)
) where
{
impltmp
foreach1$work<a> = foreach$work<a>
}
//
impltmp
<a:vtype>
a1ref_foreach1
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
val () = foreach1$work<a>(sub(A0, i0))
}
//
} (* end of [a1ref_foreach1] *)
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
