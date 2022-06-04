(* ****** ****** *)
(*
Print for Xats2js
*)
(* ****** ****** *)
//
#impltmp
bool_print<> =
XATS2JS_bool_print
where
{
#extern
fun
XATS2JS_bool_print
(b0: bool): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
char_print<> =
XATS2JS_char_print
where
{
#extern
fun
XATS2JS_char_print
(b0: char): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
gint_print_sint<> =
XATS2JS_gint_print_sint
where
{
#extern
fun
XATS2JS_gint_print_sint
( x0: sint ): void = $extnam()
}
//
#impltmp
gint_print_uint<> =
XATS2JS_gint_print_uint
where
{
#extern
fun
XATS2JS_gint_print_uint
( x0: uint ): void = $extnam()
}
//
(* ****** ****** *)
//
#impltmp
gflt_print_sflt<> =
XATS2JS_gflt_print_sflt
where
{
#extern
fun
XATS2JS_gflt_print_sflt
( x0: sflt ): void = $extnam()
}
//
#impltmp
gflt_print_dflt<> =
XATS2JS_gflt_print_dflt
where
{
#extern
fun
XATS2JS_gflt_print_dflt
( x0: dflt ): void = $extnam()
}
//
(* ****** ****** *)
#impltmp
strn_print<> =
XATS2JS_strn_print
where
{
#extern
fun
XATS2JS_strn_print
( cs: strn ): void = $extnam()
}
(* ****** ****** *)
//
#extern
fun
XATS2JS_the_print_store_join(): strn = $extnam()
#extern
fun
XATS2JS_the_print_store_clear(): void = $extnam()
//
(* ****** ****** *)

(* end of [prelude_DATS_CATS_JS_g_print.dats] *)
