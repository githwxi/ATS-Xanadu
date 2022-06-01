(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
** All rights reserved
**
** ATS is free software;  you can  redistribute it and/or modify it under
** the terms of  the GNU GENERAL PUBLIC LICENSE (GPL) as published by the
** Free Software Foundation; either version 3, or (at  your  option)  any
** later version.
** 
** ATS is distributed in the hope that it will be useful, but WITHOUT ANY
** WARRANTY; without  even  the  implied  warranty  of MERCHANTABILITY or
** FITNESS FOR A PARTICULAR PURPOSE.  See the  GNU General Public License
** for more details.
** 
** You  should  have  received  a  copy of the GNU General Public License
** along  with  ATS;  see the  file COPYING.  If not, please write to the
** Free Software Foundation,  51 Franklin Street, Fifth Floor, Boston, MA
** 02110-1301, USA.
*)

(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: May, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload
"./../UTIL/SATS/mylibc0.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/lexbuf0.sats"
#staload "./../SATS/lexing0.sats"
//
#staload "./../SATS/locinfo.sats"
//
#staload
_(*TMP*) = "./../DATS/locinfo.dats"
//
(* ****** ****** *)

#define OCT 8
#define DEC 10
#define HEX 16

(* ****** ****** *)
//
extern
fun
isEMP(c: char): bool
//
extern
fun
isEOL(c: char): bool
//
extern
fun
isDOT(c: char): bool
extern
fun
isCLN(c: char): bool
//
extern
fun
isALNUM(c: char): bool
extern
fun
isDIGIT(c: char): bool
extern
fun
isXDIGIT(c: char): bool
//
extern
fun
isALNUM_(c: char): bool
//
extern
fun
isIDENTFST(c: char): bool
extern
fun
isIDENTRST(c: char): bool
extern
fun
isSYMBOLIC(c: char): bool
//
extern
fun isSLASH(c: char): bool
extern
fun isSLASH4(cs: string): bool
//
extern
fun isSHARP(c: char): bool
extern
fun isDOLLAR(c: char): bool
//
extern
fun isASTRSK(c: char): bool
//
extern
fun isLPAREN(c: char): bool
extern
fun isRPAREN(c: char): bool
//
extern
fun isSQUOTE(c: char): bool
extern
fun isDQUOTE(c: char): bool
//
(* ****** ****** *)
//
implement
isEOL(c) = (c = '\n')
//
implement
isEMP(c) =
if
(c = ' ')
then true
else (if (c = '\t') then true else false)
//
(* ****** ****** *)
//
implement
isDOT(c) = (c = '.')
implement
isCLN(c) = (c = ':')
//
(* ****** ****** *)
//
implement
isALNUM(c) = isalnum(c)
implement
isDIGIT(c) = isdigit(c)
implement
isXDIGIT(c) = isxdigit(c)
//
(* ****** ****** *)
//
implement
isALNUM_(c) =
(
  isalnum(c) || (c = '_')
)
//
(* ****** ****** *)

implement
isIDENTFST(c) =
(
  ifcase
  | isalpha(c) => true
  | ( c = '_' ) => true
  | _ (*rest-of-char*) => false
) (* end of [isIDENTFST] *)

implement
isIDENTRST(c) =
(
ifcase
| isalnum(c) => true
| ( c = '_' ) => true
| ( c = '$' ) => true
| ( c = '\'' ) => true // HX: ML tradition
| _ (*rest-of-char*) => false
) (* end of [isIDENTRST] *)

(* ****** ****** *)

implement
isSYMBOLIC(c) = let
//
val
SYMBOLIC = "%&+-./:=@~`^|*!?<>#"
//
(*
//
val
SYMBOLIC = "%&+-./:=@~`^|*!?<>#$"
//
*)
in
//
found >
the_null_ptr where
{
  val
  found =
  xatsopt_strchr
  (string2ptr(SYMBOLIC), char2int0(c))
}
//
end // end of [SYMBOLIC_test]

(* ****** ****** *)

implement
isSLASH(c) = (c = '/')
implement
isSLASH4(cs) =
(
0 =
xatsopt_strncmp
(string2ptr(cs), string2ptr("////"), i2sz(4))
) (* end of [isSLASH4] *)

(* ****** ****** *)

implement
isSHARP(c) = ( c = '#' )
implement
isDOLLAR(c) = ( c = '$' )

(* ****** ****** *)

implement
isASTRSK(c) = ( c = '*' )

(* ****** ****** *)

implement
isLPAREN(c) = ( c = '\(' )
implement
isRPAREN(c) = ( c = '\)' )

(* ****** ****** *)

implement
isSQUOTE(c) = ( c = '\'' )
implement
isDQUOTE(c) = ( c = '\"' )

(* ****** ****** *)
//
extern
fun
testing_digits
(buf: &lexbuf >> _): int
and
testing_xdigits
(buf: &lexbuf >> _): int
//
extern
fun
testing_sign_digits
(buf: &lexbuf >> _): int
//
(* ****** ****** *)

implement
testing_digits
  (buf) =
  loop(buf, 0) where
{
//
fun
loop
(buf:
&lexbuf >> _, k: int): int = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
if
isDIGIT(c0)
then
(
loop(buf, k+1)
)
else
let
  val () = lexbuf_unget(buf, i0) in k
end // end of [else]
//
end // end of [loop]
//
} (* end of [testing_digits] *)

implement
testing_sign_digits
  (buf) = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
ifcase
| c0 = '+' =>
  1+testing_digits(buf)
| c0 = '-' =>
  1+testing_digits(buf)
| isDIGIT(c0) => 1+testing_digits(buf)
| _(* else *) =>
  let
    val () = lexbuf_unget(buf, i0) in 0
  end // end of [else]
//
end // end of [testing_sign_digits]

(* ****** ****** *)

implement
testing_xdigits
  (buf) =
  loop(buf, 0) where
{
//
fun
loop
(buf:
&lexbuf >> _, k: int): int = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
if
isXDIGIT(c0)
then
(
loop(buf, k+1)
) // end of [then]
else
let
  val () = lexbuf_unget(buf, i0) in k
end // end of [else]
//
end // end of [loop]
//
} (* end of [testing_xdigits] *)

(* ****** ****** *)

extern
fun
testing_numersfx
(buf: &lexbuf >> _): int

(* ****** ****** *)
//
implement
testing_numersfx
  (buf) =
(
  loop(buf, 0)
) where
{
//
fun
loop
(buf:
&lexbuf >> _, k0: int): int =
let
//
val i0 =
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
ifcase
| isalpha(c0) => loop(buf, k0+1)
| _ (* else *) =>
  let
    val () = lexbuf_unget(buf, i0) in k0
  end
//
end // end of [loop]
//
} (* [testing_numersfx] *)
//
(* ****** ****** *)
//
extern
fun
testing_floatext
(buf:
&lexbuf >> _, i0: int): int
extern
fun
testing_floatext_hex
(buf:
&lexbuf >> _, i0: int): int
//
(* ****** ****** *)

implement
testing_floatext
  (buf, i0) = let
//
val c0 = int2char0(i0)
//
in
ifcase
| c0 = '.' =>
  loop0(buf, 1)
| c0 = 'e' =>
  loop1(buf, i0, 0)
| c0 = 'E' =>
  loop1(buf, i0, 0)
| _(* else *) =>
  let
    val () = lexbuf_unget(buf, i0) in 0
  end // end of [else]
end where
{
//
fun
loop0
(buf:
&lexbuf >> _, k: int): int = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
if
isDIGIT(c0)
then loop0(buf, k+1)
else loop1(buf, i0, k)
end // end of [loop0]
//
and
loop1
(buf:
&lexbuf >> _
, i0: int, k: int): int =
let
  val c0 = int2char0(i0)
in
//
ifcase
| c0 = 'e' =>
  (
    k+1+testing_sign_digits(buf)
  )
| c0 = 'E' =>
  (
    k+1+testing_sign_digits(buf)
  )
| _(* else *) => // exponent-less
  let
    val () = lexbuf_unget(buf, i0) in k
  end // end of [else]
//
end // end of [let]
//
} (* testing_floatext *)

(* ****** ****** *)

implement
testing_floatext_hex
  (buf, i0) = let
//
val c0 = int2char0(i0)
//
in
//
ifcase
| c0 = '.' =>
  loop0(buf, 1)
| c0 = 'p' =>
  loop1(buf, i0, 0)
| c0 = 'P' =>
  loop1(buf, i0, 0)
| _(* else *) =>
  let
    val () = lexbuf_unget(buf, i0) in 0
  end // end of [else]
//
end where
{
//
fun
loop0
(buf:
&lexbuf >> _, k: int): int = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
if
isXDIGIT(c0)
then loop0(buf, k+1)
else loop1(buf, i0, k)
end // end of [loop0]
//
and
loop1
(buf:
&lexbuf >> _
, i0: int, k: int): int = let
//
val c0 = int2char0(i0)
//
in
//
ifcase
| c0 = 'p' =>
  (
    k+1+testing_sign_digits(buf)
  )
| c0 = 'P' =>
  (
    k+1+testing_sign_digits(buf)
  )
| _(* else *) => // exponent-less
  let
    val () = lexbuf_unget(buf, i0) in k
  end // end of [else]
//
end // end of [let]
//
} (* testing_floatext_hex *)

(* ****** ****** *)

extern
fun
lexing_isIDENTFST
( buf
: &lexbuf >> _, i0: int
) : tnode // lexing_isIDENTFST
extern
fun
lexing_isSYMBOLIC
( buf
: &lexbuf >> _, i0: int
) : tnode // lexing_isSYMBOLIC

(* ****** ****** *)

extern
fun
lexing_COMMENT_line
( buf
: &lexbuf >> _, sym: string
) : tnode // lexing_COMMENT_line
extern
fun
lexing_COMMENT_rest
( buf
: &lexbuf >> _, sym: string
) : tnode // lexing_COMMENT_rest

(* ****** ****** *)

extern
fun
lexing_COMMENT_cblock
( buf
: &lexbuf >> _, i0: int, i1: int
) : tnode // lexing_COMMENT_cblock
extern
fun
lexing_COMMENT_mlblock
( buf
: &lexbuf >> _, i0: int, i1: int
) : tnode // lexing_COMMENT_mlblock

(* ****** ****** *)

local

(* ****** ****** *)

fun
lexing_isEOL
( buf
: &lexbuf >> _, i0: int
) : tnode = let
  val () =
  lexbuf_get_none(buf)
in
  T_EOL() // HX: newline token
end (* end of [lexing_isEOL] *)

(* ****** ****** *)

fun
lexing_isEMP
( buf
: &lexbuf >> _, i0: int
) : tnode =
  loop(buf) where
{
//
fun
loop
(buf:
&lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
if
isEMP(c0)
then loop(buf)
else let
  val () = lexbuf_unget(buf, i0)
in
  T_BLANK(lexbuf_get_fullseg(buf))
end // end of [else]
//
end // end of [loop]
//
} (* end of [lexing_isEMP] *)

(* ****** ****** *)

fun
lexing_isDOT
( buf
: &lexbuf >> _, i0: int
) : tnode = let
//
val i1 = 
(
  lexbuf_getc(buf)
)
val c1 = int2char0(i1)
//
in
//
ifcase
| c1 = '<' =>
  T_DOTLT(cs) where
  {
    val cs =
    lexbuf_get_fullseg(buf)
  }
| _(* else *) => let
    val () =
    lexbuf_unget(buf, i1)
  in
    lexing_isSYMBOLIC(buf, i0)
  end (* end of [......] *)
//
end (* end of [lexing_isDOT] *)

(* ****** ****** *)

fun
lexing_isCLN
( buf
: &lexbuf >> _, i0: int
) : tnode = let
//
val i1 = 
(
  lexbuf_getc(buf)
)
val c1 = int2char0(i1)
//
in
//
ifcase
| c1 = '<' =>
  T_CLNLT(cs) where
  {
    val cs =
    lexbuf_get_fullseg(buf)
  }
| _(* else *) => let
    val () =
    lexbuf_unget(buf, i1)
  in
    lexing_isSYMBOLIC(buf, i0)
  end (* end of [......] *)
//
end (* end of [lexing_isCOLON] *)

(* ****** ****** *)

fun
lexing_isSLASH
( buf
: &lexbuf >> _, i0: int
) : tnode = let
//
val i1 = 
(
  lexbuf_getc(buf)
)
val c1 = int2char0(i1)
//
in
//
ifcase
| c1 = '*' =>
  lexing_COMMENT_cblock
    (buf, i0, i1)
  // lexing_COMMENT_cblock
| c1 = '/' => let
    val-
    T_IDENT_sym(sym) =
    lexing_isSYMBOLIC(buf, i0)
  in
    if
    isSLASH4(sym)
    then
    lexing_COMMENT_rest(buf, sym)
    else
    lexing_COMMENT_line(buf, sym)
  end // end-of-SLASH
| _(* else *) => let
    val () =
    lexbuf_unget(buf, i1)
  in
    lexing_isSYMBOLIC(buf, i0)
  end (* end of [......] *)
//
end (* end of [lexing_isSLASH] *)

(* ****** ****** *)

fun
lexing_isDIGIT
( buf
: &lexbuf >> _, i0: int
) : tnode =
(
//
ifcase
| c0 = '0' => loop0(buf)
| _(* else *) => loop1(buf)
//
) where
{
//
fun
loop0
(buf:
&lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
ifcase
| c0 = 'x' => loop0x(buf)
| c0 = 'X' => loop0X(buf)
| _(* else *) =>
  (
    if
    isDIGIT(c0)
    then
    (
      loop0d(buf)
    ) // end of [then]
    else let
      val () =
      lexbuf_unget(buf, i0) in loop1(buf)
    end // end of [else]
  )
//
end // end of [loop0]

and
loop0d
(buf:
&lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
if
isDIGIT(c0)
then loop0d(buf)
else let
  val k0 =
  testing_floatext(buf, i0)
in
//
if
(k0 = 0)
then
let
  val k1 = testing_numersfx(buf)
in
  if
  (k1 = 0)
  then
  T_INT2(OCT, lexbuf_get_fullseg(buf))
  else
  T_INT3(OCT, lexbuf_get_fullseg(buf), k1)
  end // end of [then]
else
  let
  val k1 = testing_numersfx(buf)
  in
  if
  (k1 = 0)
  then
  T_FLT2(DEC, lexbuf_get_fullseg(buf))
  else
  T_FLT3(DEC, lexbuf_get_fullseg(buf), k1)
end // end of [else]
//
end // end of [else]
//
end // end of [loop0d]

and
loop0x
(buf:
&lexbuf >> _): tnode =
(
loop0X(buf) //
// HX: case-insensitive
//
)
and
loop0X
(buf:
&lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
if
isXDIGIT(c0)
then loop0x(buf)
else let
  val k0 =
  testing_floatext_hex(buf, i0)
in
//
if
(k0 = 0)
then
let
  val k1 = testing_numersfx(buf)
in
  if
  (k1 = 0)
  then
  T_INT2(HEX, lexbuf_get_fullseg(buf))
  else
  T_INT3(HEX, lexbuf_get_fullseg(buf), k1)
end // end of [then]
else
let
  val k1 = testing_numersfx(buf)
in
  if
  (k1 = 0)
  then
  T_FLT2(HEX, lexbuf_get_fullseg(buf))
  else
  T_FLT3(HEX, lexbuf_get_fullseg(buf), k1)
end // end of [else]
//
end // end of [else]
//
end // end of [loop0X]

(* ****** ****** *)

and
loop1
(buf:
&lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
if
isDIGIT(c0)
then loop1(buf)
else let
  val k0 =
  testing_floatext(buf, i0)
in
//
if
(k0 = 0)
then
let
  val k1 = testing_numersfx(buf)
in
  if
  (k1 = 0)
  then
  T_INT1(lexbuf_get_fullseg(buf))
  else
  T_INT3(DEC, lexbuf_get_fullseg(buf), k1)
end // end of [then]
else
let
  val k1 = testing_numersfx(buf)
in
  if
  (k1 = 0)
  then
  T_FLT1(lexbuf_get_fullseg(buf))
  else
  T_FLT3(DEC, lexbuf_get_fullseg(buf), k1)
end // end of [else]
//
end // end of [else]
//
end // end of [loop1]

(* ****** ****** *)

val c0 = int2char0(i0)

(* ****** ****** *)

} (* end of [lexing_isDIGIT] *)

(* ****** ****** *)

implement
lexing_isIDENTFST
  (buf, i0) =
  loop(buf) where
{
//
fun
loop
(buf:
&lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
(*
val () =
println!
("lexing_isIDENTFST: c0 = ", c0)
*)
//
in
//
if
isIDENTRST(c0)
then
(
loop(buf)
) // end of [then]
else let
  val () = lexbuf_unget(buf, i0)
in
  T_IDENT_alp(lexbuf_get_fullseg(buf))
end // end of [else]
//
end // end of [loop]
//
} (* end of [lexing_isIDENTFST] *)

(* ****** ****** *)

implement
lexing_isSYMBOLIC
  (buf, i0) =
  loop(buf) where
{
//
fun
loop
(buf:
&lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
if
isSYMBOLIC(c0)
then
(
loop(buf)
) // end of [then]
else let
  val () = lexbuf_unget(buf, i0)
in
  T_IDENT_sym(lexbuf_get_fullseg(buf))
end // end of [else]
//
end // end of [loop]
//
} (* end of [lexing_isSYMBOLIC] *)

(* ****** ****** *)

fun
lexing_isSHARP
( buf
: &lexbuf >> _, i0: int
) : tnode =
  loop(buf, 0) where
{
//
fun
loop
(buf:
&lexbuf >> _, k: int): tnode = let
//
val i1 = 
(
  lexbuf_getc(buf)
)
val c1 = int2char0(i1)
//
in
//
if
isALNUM_(c1)
then loop(buf, k+1)
else
(
if
(k > 0)
then let
  val () = lexbuf_unget(buf, i1)
in
  T_IDENT_srp(lexbuf_get_fullseg(buf))
end // end of [then]
else let
  val () =
  lexbuf_unget(buf, i1) in lexing_isSYMBOLIC(buf, i0)
end // end of [else]
)
//
end // end of [loop]
//
} (* end of [lexing_isSHARP] *)

(* ****** ****** *)

fun
lexing_isDOLLAR
( buf
: &lexbuf >> _, i0: int
) : tnode =
  loop(buf, 0) where
{
//
fun
loop
(buf:
&lexbuf >> _, k: int): tnode = let
//
val i1 = 
(
  lexbuf_getc(buf)
)
val c1 = int2char0(i1)
//
in
//
if
(*
isALNUM_(c1)
*)
isIDENTRST(c1)
then
(
loop(buf, k+1)
) (* end of [then] *)
else
(
if
(k > 0)
then
(
if
(c1 = '.')
then
(
T_IDENT_qual(lexbuf_get_fullseg(buf))
) // end of [then]
else let
  val () =
  lexbuf_unget(buf, i1)
in
  T_IDENT_dlr(lexbuf_get_fullseg(buf))
end // end of [else]
)
else let
  val () =
  lexbuf_unget(buf, i1) in lexing_isSYMBOLIC(buf, i0)
end // end of [else]
) (* end of [else] *)
//
end // end of [loop]
//
} (* end of [lexing_isDOLLAR] *)

(* ****** ****** *)

fun
lexing_isLPAREN
( buf
: &lexbuf >> _, i0: int
) : tnode = let
//
val i1 = 
(
  lexbuf_getc(buf)
)
val c1 = int2char0(i1)
//
in
//
ifcase
| c1 = '*' =>
  lexing_COMMENT_mlblock
    (buf, i0, i1)
  // lexing_COMMENT_mlblock
| _(* else *) =>
  T_SPECHAR(i0) where
  {
    val () =
      lexbuf_unget(buf, i1)
    // end of [val]
    val () = lexbuf_get_none(buf)
  } (* end of [......] *)
//
end (* end of [lexing_isLPAREN] *)

(* ****** ****** *)

fun
lexing_isSQUOTE
( buf
: &lexbuf >> _, i0: int
) : tnode =
  loop(buf) where
{
//
fun
loop
(buf:
&lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
ifcase
| c0 = '\\' => loop1(buf)
| c0 = '\'' => loop2(buf)
| _(* else *) => loop3(buf)
//
end // end of [loop]
//
and
loop1
(buf:
&lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
ifcase
| isdigit(c0) => loop11(buf)
| isprint(c0) => loop12(buf)
| _ (* else *) => loop12(buf)
//
end // end of [loop1]
//
and
loop2
(buf:
&lexbuf >> _): tnode =
T_CHAR_nil
(lexbuf_get_fullseg(buf))
//
and
loop3
(buf:
&lexbuf >> _): tnode = let
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
ifcase
//
| isSQUOTE(c0) =>
  T_CHAR_char
  (lexbuf_get_fullseg(buf))
//
| _ (* else *) => let
    val () = lexbuf_unget(buf, i0)
  in
    T_CHAR_char(lexbuf_get_fullseg(buf))
  end // end of [non-closing-SQUOTE]
//
end // end of [loop3]
//
and
loop11
(buf:
&lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
ifcase
//
| isdigit(c0) => loop11(buf)
//
| isSQUOTE(c0) =>
  T_CHAR_slash
  (lexbuf_get_fullseg(buf))
//
| _ (* else *) => let
    val () = lexbuf_unget(buf, i0)
  in
    T_CHAR_slash(lexbuf_get_fullseg(buf))
  end // end of [non-closing-SQUOTE]
//
end // end of [loop11]
//
and
loop12
(buf:
&lexbuf >> _): tnode = let
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
ifcase
| isSQUOTE(c0) =>
  T_CHAR_slash
  (lexbuf_get_fullseg(buf))
| _ (* else *) => let
    val () = lexbuf_unget(buf, i0)
  in
    T_CHAR_slash(lexbuf_get_fullseg(buf))
  end // end of [non-closing-SQUOTE]
//
end // end of [loop12]
//
} (* end of [lexing_isSQUOTE] *)

(* ****** ****** *)

fun
lexing_isDQUOTE
( buf
: &lexbuf >> _, i0: int
) : tnode =
  loop(buf) where
{
//
fun
loop
(buf:
&lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
(*
val () = println! ("i0 = ", i0)
*)
//
in
//
ifcase
| c0 = '\"' =>
  T_STRING_closed
  (lexbuf_get_fullseg(buf))
| c0 = '\\' =>
  loop(buf) where
  {
    val i0 = lexbuf_getc(buf)
  } (* end of [......] *)
| _(* else *) =>
  if
  (i0 >= 0)
  then loop(buf)
  else
  T_STRING_unclsd(lexbuf_get_fullseg(buf))
//
end // end of [loop]
//
} (* end of [lexing_isDQUOTE] *)

(* ****** ****** *)

in (* in-of-local *)

implement
lexing_tnode(buf) = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
(*
val () =
println!
("lexing_tnode: c0 = ", c0)
*)
//
//
in
//
ifcase
//
| isEMP(c0) =>
  lexing_isEMP(buf, i0)
//
| isEOL(c0) =>
  lexing_isEOL(buf, i0)
//
| isDOT(c0) =>
  lexing_isDOT(buf, i0)
//
| isCLN(c0) =>
  lexing_isCLN(buf, i0)
//
| isSLASH(c0) =>
  lexing_isSLASH(buf, i0)
//
| isDIGIT(c0) =>
  lexing_isDIGIT(buf, i0)
//
| isIDENTFST(c0) =>
  lexing_isIDENTFST(buf, i0)
//
| isSHARP(c0) =>
  lexing_isSHARP(buf, i0)
| isDOLLAR(c0) =>
  lexing_isDOLLAR(buf, i0)
//
| isSYMBOLIC(c0) =>
  lexing_isSYMBOLIC(buf, i0)
//
| isLPAREN(c0) =>
  (
    lexing_isLPAREN(buf, i0)
  )
//
| isSQUOTE(c0) =>
  (
    lexing_isSQUOTE(buf, i0)
  )
| isDQUOTE(c0) =>
  (
    lexing_isDQUOTE(buf, i0)
  )
//
| _(* else *) =>
  (
    if
    (i0 >= 0)
    then T_SPECHAR(i0) else T_EOF()
  ) where
  {
    val ((*void*)) = lexbuf_get_none(buf)
  }
//
end // end of [lexing_token]

(* ****** ****** *)

implement
lexing_COMMENT_rest
  (buf, sym) =
  loop0(buf) where
{
//
fun
loop0
(buf:
&lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
  if
  (i0 >= 0)
  then loop0(buf)
  else
  T_COMMENT_rest
  (sym, lexbuf_get_fullseg(buf))
end // end of [loop0]
//
} (* end of [lexing_COMMENT_rest] *)

(* ****** ****** *)

implement
lexing_COMMENT_line
  (buf, sym) =
  loop0(buf) where
{
//
fun
loop0
(buf:
&lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
  if
  isEOL(c0)
  then let
    val () = lexbuf_unget(buf, i0)
  in
    T_COMMENT_line
    (sym, lexbuf_get_fullseg(buf))
  end // end of [then]
  else
  (
    if
    (i0 >= 0)
    then loop0(buf)
    else
    T_COMMENT_line
    (sym, lexbuf_get_fullseg(buf))
  ) (* end of [else] *)
end // end of [loop0]
//
} (* end of [lexing_COMMENT_line] *)

(* ****** ****** *)

implement
lexing_COMMENT_cblock
  (buf, c0, c1) = let
//
fun
loop0
(buf:
&lexbuf >> _, lev: int): tnode =
if
(lev > 0)
then let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
ifcase
| isASTRSK(c0) =>
  loop1(buf, lev)
| _(* non-ASTRSK *) =>
  (
    if
    (i0 >= 0)
    then loop0(buf, lev)
    else
    T_COMMENT_cblock
    (lev, lexbuf_get_fullseg(buf))
  )
//
end // end of [then]
else
T_COMMENT_cblock
(0(*lev*), lexbuf_get_fullseg(buf))
//
and
loop1
(buf:
&lexbuf >> _, lev: int): tnode = let
//
val i1 = 
(
  lexbuf_getc(buf)
)
val c1 = int2char0(i1)
//
in
//
ifcase
| isSLASH(c1) => loop0(buf, lev-1)
| isASTRSK(c1) => loop1(buf, lev-0)
| _(*non-ASTRSK-SLASH*) => loop0(buf, lev)
//
end // end of [loop1]
//
in
  loop0(buf, 1(*lev*))
end // end of [lexing_COMMENT_cblock]

(* ****** ****** *)

implement
lexing_COMMENT_mlblock
  (buf, c0, c1) = let
//
fun
loop0
(buf:
&lexbuf >> _, lev: int): tnode =
if
(lev > 0)
then let
//
val i0 = 
(
  lexbuf_getc(buf)
)
val c0 = int2char0(i0)
//
in
//
ifcase
| isASTRSK(c0) =>
  loop1(buf, lev)
| isLPAREN(c0) =>
  loop2(buf, lev)
| _(* non-ASTRSK-LPAREN *) =>
  (
    if
    (i0 >= 0)
    then loop0(buf, lev)
    else
    T_COMMENT_mlblock
    (lev, lexbuf_get_fullseg(buf))
  )
//
end // end of [then]
else
T_COMMENT_mlblock
(0(*lev*), lexbuf_get_fullseg(buf))
//
and
loop1
(buf:
&lexbuf >> _, lev: int): tnode = let
//
val i1 = 
(
  lexbuf_getc(buf)
)
val c1 = int2char0(i1)
//
in
//
ifcase
| isASTRSK(c1) => loop1(buf, lev-0)
| isRPAREN(c1) => loop0(buf, lev-1)
| _(*non-ASTRSK-LPAREN*) => loop0(buf, lev)
//
end // end of [loop1]
//
and
loop2
(buf:
&lexbuf >> _, lev: int): tnode = let
//
val i1 = 
(
  lexbuf_getc(buf)
)
val c1 = int2char0(i1)
//
in
//
ifcase
| isASTRSK(c1) => loop0(buf, lev+1)
| isLPAREN(c1) => loop2(buf, lev+0)
| _(*non-ASTRSK-LPAREN*) => loop0(buf, lev)
//
end // end of [loop2]
//
in
  loop0(buf, 1(*lev*))
end // end of [lexing_COMMENT_mlblock]

(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

implement
fpath_tokenize
  (fpath) = let
//
val
opt =
fileref_open_opt
  (fpath, file_mode_r)
//
in
  case+ opt of
  | ~None_vt() =>
    (
      None_vt()
    )
  | ~Some_vt(inp) =>
    (
      Some_vt(fileref_tokenize(inp))
    )
end // end of [fpath_tokenize]

(* ****** ****** *)

local
//
#staload
"./../UTIL/SATS/cblist0.sats"
#staload
"./../UTIL/SATS/Posix/cblist0.sats"
#staload _ =
"./../UTIL/DATS/Posix/cblist0.dats"
//
in (* in-of-local *)

implement
string_tokenize
  (inp) = let
//
fun
loop
(buf:
&lexbuf >> _
,res:
 tnodelst_vt): tnodelst_vt = let
//
  val tnd = lexing_tnode(buf)
(*
  val (_) =
  println!
  ("string_tokenize: loop: tnd = ", tnd)
*)
//
in
  case+ tnd of
  | T_EOF() =>
    (
      list_vt_cons(tnd, res)
    )
  | _(*non-EOF*) =>
    ( loop
      (buf, list_vt_cons(tnd, res))
    )
end // end of [loop]
//
var buf: lexbuf
//
val cbs = string2cblist(inp)
val (_) = lexbuf_initize_cblist(buf, cbs)
val tnds = loop(buf, list_vt_nil(*void*))
//
in
//
toks where
{
//
var pos0: pos_t
//
val tnds = list_vt_reverse(tnds)
//
val ((*void*)) =
  $LOC.position_initize(pos0, 0, 0, 0)
val toks =
  lexing_locatize_nodelst(pos0, $UN.list_vt2t(tnds))
//
val ((*freed*)) = list_vt_free(tnds)
//
} (* end of [where] *)
end // end of [string_tokenize]

(* ****** ****** *)

implement
fileref_tokenize
  (inp) = let
//
val BSZ = i2sz(8012)
//
fun
loop
(buf:
&lexbuf >> _
,res:
 tnodelst_vt): tnodelst_vt = let
//
  val tnd = lexing_tnode(buf)
//
in
  case+ tnd of
  | T_EOF() =>
    (
      list_vt_cons(tnd, res)
    )
  | _(*non-EOF*) =>
    ( loop
      (buf, list_vt_cons(tnd, res))
    )
end // end of [loop]
//
var buf: lexbuf
//
val-
~Some_vt(cbs) =
(
  fileref_get_cblist_vt(inp, BSZ)
)
//
local
val cbs = $UN.castvwtp1(cbs)
val (_) = lexbuf_initize_cblist(buf, cbs)
in
val tnds = loop(buf, list_vt_nil(*void*))
//
end // end of [local]
//
in
//
toks where
{
//
var pos0: pos_t
//
val () = cblist_vt_free(cbs)
val tnds = list_vt_reverse(tnds)
//
val ((*void*)) =
  $LOC.position_initize(pos0, 0, 0, 0)
val toks =
  lexing_locatize_nodelst(pos0, $UN.list_vt2t(tnds))
//
val ((*freed*)) = list_vt_free(tnds)
//
} (* end of [where] *)
end // end of [fileref_tokenize]

end // end of [local]

(* ****** ****** *)

(* end of [xats_lexing0_util0.dats] *)
