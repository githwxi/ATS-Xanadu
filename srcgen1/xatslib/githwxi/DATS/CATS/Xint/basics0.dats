(* ****** ****** *)
(*
Basics for Xinterp
*)
(* ****** ****** *)
#staload
"srcgen1\
/xatslib\
/libcats/SATS/libcats.sats"
(* ****** ****** *)
#staload
"srcgen1\
/xatslib\
/githwxi/SATS/githwxi.sats"
(* ****** ****** *)
//
#extern
fun
XINTERP_g_stdin
((*void*)): FILR = $extnam()
#extern
fun
XINTERP_g_stdout
((*void*)): FILR = $extnam()
#extern
fun
XINTERP_g_stderr
((*void*)): FILR = $extnam()
//
#impltmp
g_stdin< > = XINTERP_g_stdin
#impltmp
g_stdout< > = XINTERP_g_stdout
#impltmp
g_stderr< > = XINTERP_g_stderr
//
(* ****** ****** *)
//
#extern
fun
XINTERP_bool_fprint:
(bool, FILR) -> void = $extnam()
#impltmp
bool_fprint<> = XINTERP_bool_fprint
#extern
fun
XINTERP_char_fprint:
(char, FILR) -> void = $extnam()
#impltmp
char_fprint<> = XINTERP_char_fprint
#extern
fun
XINTERP_strn_fprint:
(strn, FILR) -> void = $extnam()
#impltmp
strn_fprint<> = XINTERP_strn_fprint
//
#extern
fun
XINTERP_gint_fprint$sint:
(sint, FILR) -> void = $extnam()
#impltmp
gint_fprint$sint<> = XINTERP_gint_fprint$sint
#extern
fun
XINTERP_gint_fprint$uint:
(uint, FILR) -> void = $extnam()
#impltmp
gint_fprint$uint<> = XINTERP_gint_fprint$uint
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
