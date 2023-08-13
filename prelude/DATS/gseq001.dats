(* ****** ****** *)
(*
Hongwei Xi
email: gmhwxi@gmail.com
Sun Aug 13 12:32:58 EDT 2023
*)
(* ****** ****** *)
(*
** for combined gseq-operations
*)
(* ****** ****** *)
#staload
"./../SATS/gseq001.sats"
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsafex.sats"
//
(* ****** ****** *)
//
#impltmp
<xz><xs><x0>
gseq_concat_forall
  (xss) =
gseq_forall<xz><xs>(xss) where
{
#impltmp
forall$test<xs> = gseq_forall<xs><x0>
}
//where//end-of-[gseq_concat_forall(...)]
//
(* ****** ****** *)
//
#impltmp
<xz><xs><x0>
gseq_concat_foreach
  (xss) =
gseq_foreach<xz><xs>(xss) where
{
#impltmp
foreach$work<xs> = gseq_foreach<xs><x0>
}
//where//end-of-[gseq_concat_foreach(...)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_uncons_strmize
  ( xs ) =
(
  auxmain(xs) ) where
{
fun
auxmain
( xs: xs)
: strm_vt(@(x0, xs)) =
$llazy(
if // if1
gseq_nilq
<xs><x0>(xs)
then // if1
strmcon_vt_nil
(  (*void*)  )
else
let // if1
var xs = xs
val x0 = // head element
gseq_uncons_raw<xs><x0>(xs) in//let
strmcon_vt_cons(@(x0,xs),auxmain(xs)) end )
}(*where*)//end-of-[gseq_uncons_strmize(xs)]
//
(* ****** ****** *)
//
#impltmp
<xs><x0>
gseq_2choose_strmize
  ( xs ) = let
//
fun
auxloop
( xys
: strm_vt(@(x0,xs))
)
: strm_vt(@(x0,x0)) =
$llazy
(
case+ !xys of
| ~
strmcon_vt_nil() =>
strmcon_vt_nil(*0*)
| ~
strmcon_vt_cons
(@(x0, xs), xys) =>
let
val xxs =
(
gseq_map_strm
<xs><x0><xx>(xs)) where
{
#typedef xx = @(x0, x0)
#impltmp
map$fopr<x0><xx>(x1) = @(x0, x1) }
in//let
! // HX: inside [$llazy]
(strm_vt_append0(xxs,auxloop(xys)))
endlet//end-of-[strmcon_vt_cons(...)]
)(*llazy*) // end-of-[ auxloop(xyz) ]
//
in//let
(
  auxloop
  (gseq_uncons_strmize<xs><x0>(xs)) )
endlet//end-of-[gseq_2choose_strmize(xs)]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_gseq001.dats] *)
