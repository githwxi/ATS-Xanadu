(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-07:
For dynamically typed values
Sat 07 Sep 2024 08:37:22 PM EDT
HX-2026-01-24:
Sat Jan 24 12:32:17 AM EST 2026
*)
(* ****** ****** *)
(* ****** ****** *)
//
datatype
dtval(*0*) =
//
|DTVunit of unit
//
|DTVsint of sint
|DTVbool of bool
|DTVchar of char
|DTVdflt of dflt
|DTVstrn of strn
//
|DTVlist of list(dtval)
//
|DTVa1sz of a1sz(dtval)
(*
|DTVhmap of hmap(dtval)
*)
//
|DTVf1un of
( dtval ) -> dtval
|DTVf2un of
(dtval, dtval) -> dtval
|DTVf3un of
(dtval, dtval, dtval) -> dtval
|DTVfxun of (a1sz(dtval)) -> dtval
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_SATS_dtval00.sats] *)
(***********************************************************************)
