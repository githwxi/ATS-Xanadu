(* ****** ****** *)
(*
Print for Xats2js
*)
(* ****** ****** *)
//
impltmp
bool_print<> =
XATS2JS_bool_print
where
{
#extern
fun
XATS2JS_bool_print
(b0: bool): void = $exname()
}
//
(* ****** ****** *)
//
impltmp
char_print<> =
XATS2JS_char_print
where
{
#extern
fun
XATS2JS_char_print
(b0: char): void = $exname()
}
//
(* ****** ****** *)
//
impltmp
gint_print_sint<> =
XATS2JS_gint_print_sint
where
{
#extern
fun
XATS2JS_gint_print_sint
( x0: sint ): void = $exname()
}
//
impltmp
gint_print_uint<> =
XATS2JS_gint_print_uint
where
{
#extern
fun
XATS2JS_gint_print_uint
( x0: uint ): void = $exname()
}
//
(* ****** ****** *)
impltmp
string_print<> =
XATS2JS_string_print
where
{
#extern
fun
XATS2JS_string_print
(cs: string): void = $exname()
}
(* ****** ****** *)
//
#extern
fun
XATS2JS_the_print_store_join(): string
#extern
fun
XATS2JS_the_print_store_clear(): (void)
//
(* ****** ****** *)

(* end of [XATS2JS_g_print.dats] *)
