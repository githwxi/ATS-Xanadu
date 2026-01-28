(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-01-26:
Mon Jan 26 08:37:33 PM EST 2026
*)
(* ****** ****** *)
(* ****** ****** *)
//
#abstype
fpath_t0 == strn
#typedef fpath = fpath_t0
fcast
fpath_encd(fpth: strn):fpath
fcast
fpath_decd(fpth: fpath):strn
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
the_basics0_strn$read(): strn
fun<>
the_fixity0_strn$read(): strn
//
(* ****** ****** *)
//
fun<>
prelude$fpath_strn$read(fpth: fpath): strn
fun<>
prelude$fpath_strn$readopt(fpth: fpath): stropt
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_premeta_SATS_meta000.sats] *)
(***********************************************************************)
