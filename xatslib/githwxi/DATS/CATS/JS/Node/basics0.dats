(* ****** ****** *)
(*
Basics
for Xats2js/Node
*)
(* ****** ****** *)

#staload
"xatslib\
/libcats/DATS/fpath00.dats"

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

(* end of [ATS3/XANADU_xatslib_githwxi_DATSCATS_JS_NODE_basics0.dats] *)
