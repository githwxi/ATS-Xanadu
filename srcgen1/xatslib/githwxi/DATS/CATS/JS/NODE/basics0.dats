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
  (fpx) =
(
XATS2JS_NODE_fs_rexists(fpx)
) where
{
#extern
fun
XATS2JS_NODE_fs_rexists
  (fpx: strn): bool = $extnam()
}(*where*)//end-of-[fpath_rexists(fpx)]
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
fpath_strmize_char
  (fpx) =
let
val
opt =
XATS2JS_NODE_fs_readFileSync
  (fpx)
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
  (fpx: strn): stropt = $extnam()
}(*where*)//end-of-[fpath_strmize_char(fpx)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xatslib_githwxi_DATS_CATS_JS_NODE_basics0.dats] *)
