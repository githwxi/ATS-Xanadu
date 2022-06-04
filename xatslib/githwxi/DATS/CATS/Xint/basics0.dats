(* ****** ****** *)
(*
Basics for Xinterp
*)
(* ****** ****** *)
#staload
"xatslib\
/libcats/SATS/libcats.sats"
(* ****** ****** *)
//
#impltmp
g_stdin<> =
XINTERP_g_stdin where
{
#extern
fun
XINTERP_g_stdin
((*void*)): FILEref = $extnam()
}
//
#impltmp
g_stdout<> =
XINTERP_g_stdout where
{
#extern
fun
XINTERP_g_stdout
((*void*)): FILEref = $extnam()
}
//
#impltmp
g_stderr<> =
XINTERP_g_stderr where
{
#extern
fun
XINTERP_g_stderr
((*void*)): FILEref = $extnam()
}
//
(* ****** ****** *)
//
#extern
fun
XINTERP_bool_fprint
(FILEref, bool): void = $extnam()
#impltmp
bool_fprint<> = XINTERP_bool_fprint
#extern
fun
XINTERP_char_fprint
(FILEref, char): void = $extnam()
#impltmp
char_fprint<> = XINTERP_char_fprint
//
#extern
fun
XINTERP_gint_fprint_sint
(FILEref, sint): void = $extnam()
#impltmp
gint_fprint_sint<> = XINTERP_gint_fprint_sint
//
(* ****** ****** *)
//
#extern
fun
XINTERP_fgetc_ref
(finp: FILEref): ierr = $extnam()
#impltmp fgetc_ref<> = XINTERP_fgetc_ref
//
(* ****** ****** *)
//
#extern
fun
XINTERP_fputc_ref
( c0: int
, fout: FILEref): ierr = $extnam()
#impltmp fputc_ref<> = XINTERP_fputc_ref
//
(* ****** ****** *)
//
#extern
fun
XINTERP_nint_rand_limit
{n:pos}
(limit: int(n)): nintlt(n) = $extnam()
//
#impltmp
nint_rand_limit<> = XINTERP_nint_rand_limit
//
(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATSCATS_Xint_basics0.dats] *)

