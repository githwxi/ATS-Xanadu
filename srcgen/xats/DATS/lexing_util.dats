(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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

#staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

#staload "./../SATS/lexbuf.sats"
#staload "./../SATS/lexing.sats"

(* ****** ****** *)
//
extern
fun
isBLANK(c: char): bool
//
extern
fun
isDIGIT(c: char): bool
extern
fun
isXDIGIT(c: char): bool
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

(* ****** ****** *)
//
implement
isBLANK(c) =
if
(c = ' ')
then true
else (if (c = '\t') then true else false)
//
(* ****** ****** *)

implement
isDIGIT(c) = isdigit(c)
implement
isXDIGIT(c) = isxdigit(c)

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
SYMBOLIC="%&+-./:=@~`^|*!?<>#"
//
(*
val
symbolic = "%&+-./:=@~`^|*!?<>#$"
*)
in
  $extfcall(ptr, "strchr", SYMBOLIC, c) > the_null_ptr
end // end of [SYMBOLIC_test]

(* ****** ****** *)

local

fun
lexing_isBLANK
( buf
: &lexbuf >> _, c0: char
) : tnode =
  loop(buf) where
{
//
fun
loop
(buf: &lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
//
val c0 = int2char0(i0)
//
in
//
if
isBLANK(c0)
then loop(buf)
else let
  val () = lexbuf_unget(buf)
in
  T_BLANK(lexbuf_get_fullseg(buf))
end // end of [else]
//
end // end of [loop]
//
} (* end of [lexing_isBLANK] *)

(* ****** ****** *)

#define OCT 8
#define DEC 10
#define HEX 16

(* ****** ****** *)

fun
lexing_isDIGIT
( buf
: &lexbuf >> _, c0: char
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
(buf: &lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
//
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
    then loop0d(buf)
    else let
      val () = lexbuf_unget(buf)
    in
      T_INT(DEC, lexbuf_get_fullseg(buf))
    end // end of [else]
  )
//
end // end of [loop0]

and
loop0d
(buf: &lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
//
val c0 = int2char0(i0)
//
in
//
if
isDIGIT(c0)
then loop0d(buf)
else let
  val () = lexbuf_unget(buf)
in
  T_INT(OCT, lexbuf_get_fullseg(buf))
end // end of [else]
//
end // end of [loop0d]

and
loop0x
(buf: &lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
//
val c0 = int2char0(i0)
//
in
//
if
isXDIGIT(c0)
then loop0x(buf)
else let
  val () = lexbuf_unget(buf)
in
  T_INT(HEX, lexbuf_get_fullseg(buf))
end // end of [else]
//
end // end of [loop0x]

and
loop0X
(buf: &lexbuf >> _): tnode = loop0x(buf)

(* ****** ****** *)

fun
loop1
(buf: &lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
//
val c0 = int2char0(i0)
//
in
//
if
isDIGIT(c0)
then loop1(buf)
else let
  val () = lexbuf_unget(buf)
in
  T_INT(DEC, lexbuf_get_fullseg(buf))
end // end of [else]
//
end // end of [loop1]
//
} (* end of [lexing_isDIGIT] *)

(* ****** ****** *)

fun
lexing_isIDENTFST
( buf
: &lexbuf >> _, c0: char
) : tnode =
  loop(buf) where
{
//
fun
loop
(buf: &lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
//
val c0 = int2char0(i0)
//
in
//
if
isIDENTRST(c0)
then loop(buf)
else let
  val () = lexbuf_unget(buf)
in
  T_IDENT_alp(lexbuf_get_fullseg(buf))
end // end of [else]
//
end // end of [loop]
//
} (* end of [lexing_isIDENTFST] *)

(* ****** ****** *)

fun
lexing_isSYMBOLIC
( buf
: &lexbuf >> _, c0: char
) : tnode =
  loop(buf) where
{
//
fun
loop
(buf: &lexbuf >> _): tnode = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
//
val c0 = int2char0(i0)
//
in
//
if
isSYMBOLIC(c0)
then loop(buf)
else let
  val () = lexbuf_unget(buf)
in
  T_IDENT_sym(lexbuf_get_fullseg(buf))
end // end of [else]
//
end // end of [loop]
//
} (* end of [lexing_isSYMBOLIC] *)

in (* in-of-local *)

implement
lexing_tnode(buf) = let
//
val i0 = 
(
  lexbuf_getc(buf)
)
//
val c0 = int2char0(i0)
//
in
//
ifcase
//
| isBLANK(c0) =>
  lexing_isBLANK(buf, c0)
//
| isDIGIT(c0) =>
  lexing_isDIGIT(buf, c0)
//
| isIDENTFST(c0) =>
  lexing_isIDENTFST(buf, c0)
//
| isSYMBOLIC(c0) =>
  lexing_isSYMBOLIC(buf, c0)
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

end // end of [local]

(* ****** ****** *)

(* end of [xats_lexing_util.dats] *)
