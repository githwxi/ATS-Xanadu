(* ****** ****** *)
//
// For dynamically tagged values
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: December, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
datatype dtvalue =
//
| DTVint of sint
| DTVbtf of bool
| DTVchr of char
| DTVflt of double
| DTVstr of string
//
| {a:tbox}
  DTVbx0 of ( a )
| {a:tbox}
  DTVbx1 of (int, a)
//
| DTVlist of dtvalist
//
| DTVfnp_args of
  (dtvalist) -<fnp> gval
| DTVcfr_args of
  (dtvalist) -<cfr> gval
//
where
{
typedef dtval = dtvalue
typedef dtvalist = list(dtval)
(*
typedef dtvalobj = hashtbl(string, dtval)
*)
}
//
(* ****** ****** *)

(* end of [xatslib_dtvalue.sats] *)
