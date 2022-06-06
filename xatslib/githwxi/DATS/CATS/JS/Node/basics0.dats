(* ****** ****** *)
(*
Basics
for Xats2js/Node
*)
(* ****** ****** *)
#staload
"xatslib\
/libcats/SATS/libcats.sats"
(* ****** ****** *)
#staload
"xatslib\
/githwxi/SATS/githwxi.sats"
(* ****** ****** *)
//
#extern
fun
XATS2JS_NODE_g_stdin
((*void*)): FILR = $extnam()
#extern
fun
XATS2JS_NODE_g_stdout
((*void*)): FILR = $extnam()
#extern
fun
XATS2JS_NODE_g_stderr
((*void*)): FILR = $extnam()
//
#impltmp
g_stdin< > = XATS2JS_NODE_g_stdin
#impltmp
g_stdout< > = XATS2JS_NODE_g_stdout
#impltmp
g_stderr< > = XATS2JS_NODE_g_stderr
//
(* ****** ****** *)

#impltmp
<>(*tmp*)
fpath_strmize_char
  (path) =
let
val
opt =
XATS2JS_NODE_fs_readFileSync
  (path)
in
if
stropt_nilq(opt)
then
strm_vt_nil((*void*))
else
strn_strmize(stropt_unsome(opt))
end where
{
#extern
fun
XATS2JS_NODE_fs_readFileSync
(path: string): stropt = $extnam()
} (* end of [fpath_strmize_char] *)

(* ****** ****** *)
//
#impltmp
<>(*tmp*)
fpath_strmize_cgtz=fpath_strmize_char<>
//
(* ****** ****** *)
//
#extern
fun
XATS2JS_NODE_bool_fprint:
(FILR, bool) -> void = $extnam()
#impltmp
bool_fprint<> = XATS2JS_NODE_bool_fprint
#extern
fun
XATS2JS_NODE_char_fprint:
(FILR, char) -> void = $extnam()
#impltmp
char_fprint<> = XATS2JS_NODE_char_fprint
#extern
fun
XATS2JS_NODE_strn_fprint:
(FILR, strn) -> void = $extnam()
#impltmp
strn_fprint<> = XATS2JS_NODE_strn_fprint
//
#extern
fun
XATS2JS_NODE_gint_fprint_sint:
(FILR, sint) -> void = $extnam()
#impltmp
gint_fprint_sint<> = XATS2JS_NODE_gint_fprint_sint
#extern
fun
XATS2JS_NODE_gint_fprint_uint:
(FILR, uint) -> void = $extnam()
#impltmp
gint_fprint_uint<> = XATS2JS_NODE_gint_fprint_uint
//
(* ****** ****** *)

(* end of [ATS3/XANADU_xatslib_githwxi_DATSCATS_JS_NODE_basics0.dats] *)
