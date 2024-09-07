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
strn_line$strmize
(cs: strn): strm_vt(strn)
//
#impltmp
<(*tmp*)>
strn_line$strmize
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
if
(c0 != '\n')
then (work(c0); true) else false end))
)
}
//
end//let//$llazy//end-of-(auxmain(...))
//
}(*where*)//end-of-[strn_line$strmize(cs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_strn000.dats] *)
