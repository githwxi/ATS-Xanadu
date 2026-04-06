(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-04-06:
Mon Apr  6 10:14:57 AM EDT 2026
*)
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../SATS/VT/estrm00_vt.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:vt }
{ e1:vt }
gseq_foritm$e1nv0
<
estrm_vt
(x0 , e1)>
<   x0   >
<   e1   >(xs, e1) =
let
//
#impltmp
foritm$e1nv$work0
<x0 >< e1>(x0, e1) =
(
  foritm$work0<x0>(x0))
//
in//let
let
val
(pf|e1) =
(
$UN.castxy1{e1}{e1}(e1))
val(e1) =
(
estrm_vt_foritm0
<  x0  ><  e1  >(xs, e1))
pvx(  ) = owed_vt_return0(pf, e1) end
end//let//end-of-[gseq_foritm$e1nv0(xs,e1)]
////
(* ****** ****** *)
//
#impltmp
< x0:vt >
< e1:vt >
estrm_vt_foritm0
  ( xs, e1 ) =
(
  auxloop(xs, e1)
) where
{
//
fnx
auxloop(
xs:
estrm_vt
(x0, e1), e1: e1): e1 =
(
case+
xs.eval(e1) of
| ~
estrmcon_vt_nil(e1) => e1
| ~
estrmcon_vt_cons(x1, e1) =>
(foritm$work0<x0>(x1); auxloop(xs, e1)))
//
}(*where*)//end-of-[estrm_vt_foritm0(xs,e1)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
< e1:vt >
estrm_vt_map0
  (  xs  ) =
(
  auxmain(xs)) where
{
fun
auxmain
( xs
: estrm_vt(x0, e1)
)
: estrm_vt(y0, e1) = $elazy
(
//
free(xs);
//
lam(e1:e1) =>
case+
xs.eval(e1) of
| ~
estrmcon_vt_nil
(      e1      ) =>
(
estrmcon_vt_nil(e1))
| ~
estrmcon_vt_cons
(  x1, e1, xs  ) =>
let
val y1 = map$fopr0<x0><y0>(x1)
in//let
estrmcon_vt_cons(y1, e1, auxmain(xs))
end//let
)
}(*where*)//end-of-[estrm_vt_map0(xs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_DATS_VT_estrm00_vt.dats] *)
(***********************************************************************)
