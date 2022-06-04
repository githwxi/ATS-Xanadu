(* ****** ****** *)
(*
Print for Xats2js/Node
*)
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
XATS2JS_NODE_gint_print_sint
(x0: sint): void = $extnam()
#extern
fun
XATS2JS_NODE_gint_print_uint
(x0: uint): void = $extnam()
in
#impltmp
gint_print_sint<> = XATS2JS_NODE_gint_print_sint
#impltmp
gint_print_uint<> = XATS2JS_NODE_gint_print_uint
end // end of [local]
//
(* ****** ****** *)
//
local
#extern
fun
XATS2JS_NODE_gflt_print_sflt
(x0: sflt): void = $extnam()
#extern
fun
XATS2JS_NODE_gflt_print_dflt
(x0: dflt): void = $extnam()
in
#impltmp
gflt_print_sflt<> = XATS2JS_NODE_gflt_print_sflt
#impltmp
gflt_print_dflt<> = XATS2JS_NODE_gflt_print_dflt
end // end of [local]
//
(* ****** ****** *)

(* end of [prelude_DATS_CATS_JS_NODE_g_print.dats] *)
