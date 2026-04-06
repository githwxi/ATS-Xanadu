(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-04-06:
[estream]:
linear stream
carrying an environment!!!
Mon Apr  6 01:40:46 AM EDT 2026
This feature can greatly impact
how programming is done in ATS3!
*)
(* ****** ****** *)
(* ****** ****** *)
//
#absvtbx
elazy_vt_vt_vx
(a:vwtp+,env:vwtp)<=p0tr
//
(* ****** ****** *)
//
#vwtpdef
ellazy
(a:vt,env:vt) =
  elazy_vt_vt_vx( a, env )
#vwtpdef
elazy_vt
(a:vt,env:vt) =
  elazy_vt_vt_vx( a, env )
//
(* ****** ****** *)
(* ****** ****** *)
//
datavwtp
estrmcon_vt
( a: vwtp+
, env: vwtp) =
|estrmcon_vt_nil of
(       env       )
|estrmcon_vt_cons of
(a, env, estream_vt(a, env))
where
{
#vwtpdef
estream_vt
( a: vt, env: vt) =
elazy_vt
( estrmcon_vt(a, env), env )}
//
#sexpdef estrm_vt = estream_vt
#sexpdef estcn_vt = estrmcon_vt
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<e1:vt>
estrm_vt_free
( xs
: estrm_vt(x0, e1)): void
#symload free with estrm_vt_free
//
(* ****** ****** *)
//
fun
<x0:vt>
<e1:vt>
estrm_vt_eval
( xs
: estrm_vt
  (x0, e1)
, e1: (e1)): estcn_vt(x0, e1)
#symload eval with estrm_vt_eval
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<e1:vt>
estrm_vt_strmize0
( xs
: estrm_vt
  (x0, e1), e1: e1): strm_vt(x0)
//
#symload
  strmize0 with estrm_vt_strmize0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<e1:vt>
estrm_vt_foritm0
(
xs:
estrm_vt(x0, e1), e1: e1): (e1)
fun
<x0:vt>
<e1:vt>
estrm_vt_forall0
(
xs:
estrm_vt(x0, e1), e1: e1): (bool, e1)
//
#symload forall0 with estrm_vt_forall0
#symload foritm0 with estrm_vt_foritm0
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<y0:vt>
<e1:vt>
estrm_vt_map0
(xs: estrm_vt(x0, e1)): estrm_vt(y0, e1)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_SATS_VT_estrm00_vt.sats] *)
(***********************************************************************)
