(* ****** ****** *)
(*
Basics for Xats2js/Node
*)
(* ****** ****** *)

#staload
"xatslib/libc/DATS/fpath.dats"

(* ****** ****** *)

impltmp
<>(*tmp*)
fpath_streamize_char

where
{
#extern
fun
XATS2JS_NODE_fs_readFileSync
  (path: string): stropt = $exname()
} (* end of [fpath_streamize_char] *)

(* ****** ****** *)

(* end of [xatslib_libc_XATS2JS_NODE_basics.dats] *)
