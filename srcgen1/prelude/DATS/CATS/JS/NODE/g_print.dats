(* ****** ****** *)
(* ****** ****** *)
(*
Primitive prints for
srcgen1/prelude/JS/NODE/.
*)
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
bool_print<> =
XATS2JS_NODE_bool_print
where
{
#extern
fun
XATS2JS_NODE_bool_print
(b0: bool): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
char_print<> =
XATS2JS_NODE_char_print
where
{
#extern
fun
XATS2JS_NODE_char_print
(b0: char): void = $extnam()
}
//
(* ****** ****** *)
#impltmp
strn_print<> =
XATS2JS_NODE_strn_print
where
{
#extern
fun
XATS2JS_NODE_strn_print
(cs: strn): void = $extnam()
}
(* ****** ****** *)
//
local
#extern
fun
XATS2JS_NODE_gint_print$sint
(x0: sint): void = $extnam()
#extern
fun
XATS2JS_NODE_gint_print$uint
(x0: uint): void = $extnam()
in
#impltmp
gint_print$sint<> = XATS2JS_NODE_gint_print$sint
#impltmp
gint_print$uint<> = XATS2JS_NODE_gint_print$uint
end // end of [local]
//
(* ****** ****** *)
//
local
#extern
fun
XATS2JS_NODE_gflt_print$sflt
(x0: sflt): void = $extnam()
#extern
fun
XATS2JS_NODE_gflt_print$dflt
(x0: dflt): void = $extnam()
in
#impltmp
gflt_print$sflt<> = XATS2JS_NODE_gflt_print$sflt
#impltmp
gflt_print$dflt<> = XATS2JS_NODE_gflt_print$dflt
end // end of [local]
//
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_JS_NODE_g_print.dats] *)
