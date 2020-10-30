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
(b0: bool): void // = $ext()
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
(b0: char): void // = $ext()
}
//
(* ****** ****** *)
//
local
#extern
fun
XATS2JS_gint_print_sint
( x0: sint ): void // = $ext()
#extern
fun
XATS2JS_gint_print_uint
( x0: uint ): void // = $ext()
in
impltmp
gint_print_sint<> =
XATS2JS_gint_print_sint
impltmp
gint_print_uint<> =
XATS2JS_gint_print_uint
end // end of [local]
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
(cs: string): void // = $ext()
}
(* ****** ****** *)

(* end of [XATS2JS_print.dats] *)
