(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-16:
Fri 16 Aug 2024 12:15:39 PM EDT
For implementing operations on so-called
2-list-based queues
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload UN =
"prelude/SATS/unsfx00.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#absvtbx
q2lst_vt_vx(a:vt) <= p0tr
(*
#absvtbx
q2lst_vt_i0_vx(a:t0) <= p0tr
*)
//
#vwtpdef
q2lst_vt(a:vt) = q2lst_vt_vx(a)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ a:vt }
g_ptcon
<q2lst_vt(a)>() =
(
pstrn("q2lst_vt"))
#impltmp
{ a:vt }
g_ptype
<q2lst_vt(a)>() =
(
pstrn
("q2lst_vt(");
g_ptype<a>(); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_DATS_VT_q2lst00_vt.dats] *)
(***********************************************************************)
