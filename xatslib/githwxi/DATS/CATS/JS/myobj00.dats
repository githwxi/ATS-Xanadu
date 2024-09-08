(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-09-07:
For dynamically typed values
Sat 07 Sep 2024 08:37:22 PM EDT
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"xatslib\
/DATS/CATS/JS/Hsmap00.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
hmap(a:t0) = jshsmap(strn, a)
//
(* ****** ****** *)
//
datatype dtval =
//
| DTVunit of ()
//
| DTVsint of sint
| DTVbool of bool
| DTVchar of char
| DTVdflt of dflt
| DTVstrn of strn
//
| DTVtupl of a1sz(dtval)
//
| DTVhmap of hmap(dtval)
//
| DTVf1un of
  (dtval) -> dtval
| DTVf2un of
  (dtval, dtval) -> dtval
| DTVf3un of
  (dtval, dtval, dtval) -> dtval
| DTVfxun of (a1sz(dtval)) -> dtval)
//
(* ****** ****** *)
//
#typedef myobj(*void*) = hmap(dtval)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
myobj_fmake_fwork
( fwork
: ((strn, dtval)->void)->void): myobj
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATS_myobj00.dats] *)
