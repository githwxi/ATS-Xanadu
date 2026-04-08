(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-04-07:
Tue Apr  7 11:48:08 PM EDT 2026
*)
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../SATS/VT/ustrm00_vt.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
debox
{a:vx}: (a) -> uflat(a)
#extern
fun
enbox
{a:vx}: uflat(a) -> (a)
(*
#implfun
debox{a:vx}(x) = $debox(x)
#implfun
enbox{a:vx}(u) = $enbox(x)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val
sint_gte$strmize =
fix f(n: sint) => $llazy
(debox(ustrmcon_vt_cons(n, f(n+1))))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
ustrm_vt_forall0
  ( xs ) =
(
  auxloop(xs)) where
{
fun
auxloop
( xs
: ustrm_vt(x0)): bool =
(
case+
enbox(!xs) of
| ~
ustrmcon_vt_nil
  ( (*void*) ) => (true)
| ~
ustrmcon_vt_cons
  (  x1, xs  ) =>
(
if // if
forall$test0<x0>(x1)
then(auxloop(xs))else(free(xs);false)))
}(*where*)//end-of-[ustrm_vt_forall0(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_DATS_VT_ustrm00_vt.dats] *)
(***********************************************************************)
