(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-04-07:
[ustream]:
stream with
unboxed constructors!
Introducing 'ubxd' is
a big step towards supporting
C-style of programming in ATS3.
In particular, ustrm_vt should
be a very telling example of the
usefulness of 'ubxd'.
*)
(* ****** ****** *)
(* ****** ****** *)
//
(*
#abstype
uflat_tx_t0(a: tx)
#sexpdef uflat = uflat_tx_t0
*)
#absvwtp
uflat_vx_vt(a: vx)
#sexpdef uflat = uflat_vx_vt
//
(* ****** ****** *)
(* ****** ****** *)
//
datavwtp
ustrmcon_vt
( a0:vwtp+ ) =
|
ustrmcon_vt_nil
of
(   (*void*)   )
|
ustrmcon_vt_cons
of
(a0, ustream_vt(a0))
where
{
#vwtpdef
ustream_vt
( a0: vt ) =
lazy_vt(uflat(ustrmcon_vt(a0)))
}
//
(* ****** ****** *)
#vwtpdef
ustrm_vt(a:vt) = ustream_vt(a)
(* ****** ****** *)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
ustrm_vt_forall0
(xs: ustrm_vt(x0)): bool
fun
<x0:vt>
ustrm_vt_foritm0
(xs: ustrm_vt(x0)): void
//
#symload forall0 with ustrm_vt_forall0
#symload foritm0 with ustrm_vt_foritm0
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_SATS_VT_ustrm00_vt.sats] *)
(***********************************************************************)
