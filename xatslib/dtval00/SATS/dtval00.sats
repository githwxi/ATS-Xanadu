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
datatype dtval =
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
  (dtvalist) -<fnp> dtval
| DTVcfr_args of
  (dtvalist) -<cfr> dtval
//
where
{
typedef dtvalist = list(dtval)
(*
typedef dtvalobj = hashtbl(strn,dtval)
*)
} (*where*) // end of [datatype(dtval)]
//
(* ****** ****** *)

(* end of [xatslib_dtval00_dtval00.sats] *)
