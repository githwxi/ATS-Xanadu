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
XATS2JS_NODE_xatshome$get
  ( (*void*) )) where
{
#extern
fun
XATS2JS_NODE_xatshome$get
  ((*void*)): strn = $extnam()
}
//
(* ****** ****** *)
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
