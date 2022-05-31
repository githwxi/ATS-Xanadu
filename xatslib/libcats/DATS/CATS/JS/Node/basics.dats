(* ****** ****** *)
(*
Basics
for Xats2js/Node
*)
(* ****** ****** *)

#staload
"xatslib\
/libc/DATS/fpath.dats"

(* ****** ****** *)

#impltmp
<>(*tmp*)
fpath_streamize_char
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
stream_vt_nil((*void*))
else
string_streamize(stropt_unsome(opt))
end where
{
#extern
fun
XATS2JS_NODE_fs_readFileSync
  (path: string): stropt = $exname()
} (* end of [fpath_streamize_char] *)

(* ****** ****** *)
//
#impltmp
<>(*tmp*)
fpath_streamize_cgtz
  (path) =
(
  fpath_streamize_char<>(path)
) (* end of [fpath_streamize_cgtz] *)
//
(* ****** ****** *)

(* end of [xatslib_libc_XATS2JS_NODE_basics.dats] *)
