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
arref_streamize
  {n}(A0) =
(
  auxmain(0(*i0*))
) where
{
//
val n0 =
arref_length<a><n>(A0)
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
} (* end of [arref_streamize] *)

(* ****** ****** *)

impltmp
<a:type>
arref_forall
  (A0) =
(
arref_forall1<a>(A0)
) where
{
impltmp
forall1$test<a> = forall$test<a>
}
impltmp
<a:vtype>
arref_forall1
  {n}(A0) =
(
  loop(0(*i0*))
) where
{
//
val n0 =
arref_length<a><n>(A0)
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
} (* end of [arref_forall1] *)

(* ****** ****** *)

impltmp
<a:type>
arref_foreach
  (A0) =
(
arref_foreach1<a>(A0)
) where
{
impltmp
foreach1$work<a> = foreach$work<a>
}
impltmp
<a:vtype>
arref_foreach1
  {n}(A0) =
(
  loop(0(*i0*))
) where
{
//
val n0 =
arref_length<a><n>(A0)
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
} (* end of [arref_foreach1] *)

(* ****** ****** *)

impltmp
{a:t0}{n:i0}
gseq_length
<a,arref(a,n)> = arref_length<a><n>

(* ****** ****** *)

impltmp
{a:t0}{n:i0}
gseq_forall
<a,arref(a,n)> = arref_forall<a><n>
impltmp
{a:t0}{n:i0}
gseq_foreach
<a,arref(a,n)> = arref_foreach<a><n>

(* ****** ****** *)

(* end of [garr.dats] *)
