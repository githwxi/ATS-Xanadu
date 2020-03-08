(* ****** ****** *)
(*
** The runtime for Xinterp
*)
(* ****** ****** *)
//
// prelude/bool.sats
//
(* ****** ****** *)
//
#extern
fun
xint_bool_neg
{b0:bool}
( b0
: bool(b0)
) : bool(~b0) = $ext()
impltmp
bool_neg<> = xint_bool_neg
//
(* ****** ****** *)
//
#extern
fun
xint_bool_add
{b1,b2:bool}
( b1
: bool(b1)
, b2
: bool(b2)
) : bool(b1+b2) = $ext()
#extern
fun
xint_bool_mul
{b1,b2:bool}
( b1
: bool(b1)
, b2
: bool(b2)
) : bool(b1*b2) = $ext()
//
impltmp
bool_add<> = xint_bool_add
impltmp
bool_mul<> = xint_bool_mul
//
(* ****** ****** *)
//
#extern
fun
xint_bool_print
( b0
: bool): void = $ext()
impltmp
bool_print<> = xint_bool_print
//
(* ****** ****** *)
//
// prelude/char.sats
//
(* ****** ****** *)
//
#extern
fun
xint_char_eqzq
{c:char}
( c0
: char(c)
) : bool(c=0) = $ext()
#extern
fun
xint_char_neqzq
{c:char}
( c0
: char(c)
) : bool(c>0) = $ext()
//
impltmp
char_eqzq<> = xint_char_eqzq
impltmp
char_neqzq<> = xint_char_neqzq
//
(* ****** ****** *)
//
#extern
fun
char_equal
{c1,c2:char}
( c1
: char(c1)
, c2
: char(c2)
) : bool(c1=c2) = $ext()
#extern
fun
char_nequal
{c1,c2:char}
( c1
: char(c1)
, c2
: char(c2)
) : bool(c1!=c2) = $ext()
//
impltmp
char_equal<> = xint_char_equal
impltmp
char_noteq<> = xint_char_noteq
//
(* ****** ****** *)
//
#extern
fun
xint_char_print
(c0: char): void = $ext()
impltmp
char_print<> = xint_char_print
//
(* ****** ****** *)

(* end of [runtime.dats] *)
