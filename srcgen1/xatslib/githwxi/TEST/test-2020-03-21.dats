(* ****** ****** *)
(*
HX-2020-03-21:
For testing gint_digitize
For testing gint_rdigitize
*)
(* ****** ****** *)
//
#staload
"./../DATS/mygist0.dats"
//
(* ****** ****** *)
//
val bs =
digitize(16)
where
#impltmp digitize$base<>() = 2
endwhr // end of [val]
//
(* ****** ****** *)
//
val ds1 = digitize(31415926)
val ds2 =
strm_vt_listize0(rdigitize(31415926))
//
(* ****** ****** *)

(* end of [ATS-Xanadu/srcgen1/xatslib/githwxi/TEST/test-2020-03-21.dats] *)
