(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-06:
For miscellaneous functions on
strings
Fri 06 Sep 2024 09:38:26 PM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
word$alphaq
( ch: char ): bool
#extern
fun<>
strn_word$strmize
(cs: strn): strm_vt(strn)
//
(* ****** ****** *)
//
#extern
fun<>
strn_line$strmize
(cs: strn): strm_vt(strn)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-07:
This default is
just for English words!
Sat 07 Sep 2024 10:07:27 AM EDT
*)
#impltmp
word$alphaq<>(ch) =
let
val df = (ch - 'a')
in//let
if
(if 0 <= df then df < 26 else false)
then true else
let
val df = (ch - 'A')
in//let
(if 0 <= df then df < 26 else false)
end//let
end//let//end-of-[word$alphaq<>(ch)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_word$strmize
  ( cs ) =
(
  auxmain()) where
{
//
var i0 = 0
val p0 = $addr(i0)
fun i0_get() =
$UN.p2tr_get<nint>(p0)
//
val ln = strn_length(cs)
//
fun
auxmain() = $llazy
let
//
val i0 = i0_get() in//let
//
if
(i0 >= ln)
then
strmcon_vt_nil()
else
strmcon_vt_cons(cs, auxmain())
where
{
val cs =
strn_fmake_fwork
(
lam(work) =>
g_void(
GSEQ(ln-i0).forall(
lam(j0) =>
let
val () =
$UN.p2tr_set(p0, i0_get()+1)
val c0 =
(
$UN.strn_get$at$raw(cs, i0+j0))
in//let
if word$alphaq<>(c0)
then (work(c0); true) else false end))
)
}
//
end//let//$llazy//end-of-(auxmain(...))
//
}(*where*)//end-of-[strn_word$strmize(cs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
strn_line$strmize
  ( cs ) =
(
strn_word$strmize(cs)
) where
{
#impltmp word$alphaq<>(ch) = (ch != '\n')
}(*where*)//end-of-[strn_line$strmize(cs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_strn000.dats] *)
