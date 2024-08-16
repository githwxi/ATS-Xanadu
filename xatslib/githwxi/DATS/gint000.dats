(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-08-07:
For miscellaneous functions on
integers
Wed 07 Aug 2024 07:36:09 PM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
sint_lte$strmize
(si: sint): strm_vt(sint)
#extern
fun<>
sint_gte$strmize
(si: sint): strm_vt(sint)
//
#impltmp
<(*tmp*)>
sint_lte$strmize
  ( si ) = $llazy
(
strmcon_vt_cons
(si, sint_lte$strmize(si-1)))
//
#impltmp
<(*tmp*)>
sint_gte$strmize
  ( si ) = $llazy
(
strmcon_vt_cons
(si, sint_gte$strmize(si+1)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
nint_dgt$listize
( nint: nint )
: list_vt(nintlt(10))
#extern
fun<>
nint_dgt$listize_base
{b0:i0|b0>=2}
( nint: nint
, base: nint(b0))
: list_vt(nintlt(b0))
fun<>
nint_rdgt$strmize_base
{b0:i0|b0>=2}
( nint: nint
, base: nint(b0))
: strm_vt(nintlt(b0))
//
#impltmp
<(*tmp*)>
nint_dgt$listize
  ( ni ) =
(
nint_dgt$listize_base<>(ni, 10))
//
#impltmp
<(*tmp*)>
nint_dgt$listize_base
  (ni, b0) =
strm_vt_rlistize0
(nint_rdgt$strmize_base<>(ni, b0))
//
#impltmp
<(*tmp*)>
nint_rdgt$strmize_base
  (ni, b0) =
(
  auxmain(ni)) where
{
fun auxmain(ni) = $llazy
(
if ni = 0
then strmcon_vt_nil() else
strmcon_vt_cons(ni % b0, auxmain(ni/b0)))
}(*where*)//end-of-[nint_rdgt$strmize_base]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_gint000.dats] *)
