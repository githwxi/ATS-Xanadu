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
<a:type>
arref_forall
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
forall$test<a>(sub(A0, i0))
in
if test then loop(succ(i0)) else false
end else false // end of [if]
//
} (* end of [arref_forall] *)

(* ****** ****** *)

impltmp
<a:type>
arref_foreach
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
  val () = foreach$work<a>(sub(A0, i0))
}
//
} (* end of [arref_foreach] *)

(* ****** ****** *)

(* end of [garr.dats] *)
