(* ****** ****** *)
(* ****** ****** *)
(*
Basics for
srcgen1/xatslib/JS/NODE/.
*)
(* ****** ****** *)
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
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
the_XATSHOME_get() =
(
XATS2JS_NODE_the_XATSHOME_get
  ( (*void*) )) where
{
#extern
fun
XATS2JS_NODE_the_XATSHOME_get
  ((*void*)): strn = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
//
(*
HX-2025-04-28:
For async programming!
*)
//
#extern
fun
XATS2JS_NODE_g_stdin
  ((*void*)): FILR = $extnam()
//
#impltmp
g_stdin< > = XATS2JS_NODE_g_stdin
//
*)
//
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
g_stdout< > = XATS2JS_NODE_g_stdout
#impltmp
g_stderr< > = XATS2JS_NODE_g_stderr
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
fpath_rexists
  (path) =
(
XATS2JS_NODE_fs_rexists(path)
) where
{
#extern
fun
XATS2JS_NODE_fs_rexists
  (path: strn): bool = $extnam()
}
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
in//let
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
  (path: strn): stropt = $extnam()
} (* end of [fpath_strmize_char] *)

(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xatslib_githwxi_DATS_CATS_JS_NODE_basics0.dats] *)
