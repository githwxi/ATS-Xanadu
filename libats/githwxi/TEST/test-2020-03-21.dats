(* ****** ****** *)
(*
HX-2020-03-21:
For testing gint_digitize
For testing gint_rdigitize
*)
(* ****** ****** *)

#staload
"libats\
/githwxi/DATS/mygist.dats"

(* ****** ****** *)
//
val ds1 = digitize(31415926)
//
(* ****** ****** *)
//
val ds2 =
stream_vt_listize(rdigitize(31415926))
//
(* ****** ****** *)

(* end of [test-2020-03-21.dats] *)
