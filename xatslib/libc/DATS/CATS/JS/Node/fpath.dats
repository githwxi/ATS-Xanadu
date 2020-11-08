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
XATS2JS_NODE_fpath_streamize_char
where
{
#extern
fun
XATS2JS_NODE_fpath_streamize_char
  (path: string): stream_vt(char) = $exname()
} (* end of [fpath_streamize_char] *)

(* ****** ****** *)

impltmp
<>(*tmp*)
fpath_streamize_line
XATS2JS_NODE_fpath_streamize_line
where
{
#extern
fun
XATS2JS_NODE_fpath_streamize_line
  (path: string): stream_vt(string) = $exname()
} (* end of [fpath_streamize_line] *)

(* ****** ****** *)

(* end of [xatslib_libc_XATS2JS_NODE_basics.dats] *)
