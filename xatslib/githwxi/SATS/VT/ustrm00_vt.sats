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
#abstype
ubxd_tx_t0(a: tx)
#absvwtp
ubxd_vx_vt(a: vx)
#sexpdef ubxd = ubxd_tx_t0
#sexpdef ubxd_vt = ubxd_vx_vt
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
lazy_vt(ubxd_vt(ustrmcon_vt(a0)))
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_SATS_VT_ustrm00_vt.sats] *)
(***********************************************************************)
