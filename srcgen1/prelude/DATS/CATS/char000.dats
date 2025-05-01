(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Tue Apr 29 10:16:32 PM EDT 2025
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS000_char_eq
( c1
: char
, c2
: char): bool = $extnam()
#impltmp
<(*tmp*)>
char_eq = XATS000_char_eq
#extern
fun
XATS000_char_neq
( c1
: char
, c2
: char): bool = $extnam()
#impltmp
<(*tmp*)>
char_neq = XATS000_char_neq
//
(* ****** ****** *)
//
#extern
fun
XATS000_char_cmp
( c1
: char
, c2
: char): sint = $extnam()
#impltmp
<(*tmp*)>
char_cmp = XATS000_char_cmp
//
(* ****** ****** *)
//
#extern
fun
XATS000_char_eqz
( c0
: char): bool = $extnam()
#impltmp
<(*tmp*)>
char_eqz = XATS000_char_eqz
//
#extern
fun
<(*tmp*)>
XATS000_char_neqz
( c0
: char): bool = $extnam()
#impltmp
char_neqz = XATS000_char_neqz
//
(* ****** ****** *)
//
#extern
fun
XATS000_char_equal
( c1: char
, c2: char): bool = $extnam()
#impltmp
<(*tmp*)>
char_equal = XATS000_char_equal
#extern
fun
XATS000_char_noteq
( c1: char
, c2: char): bool = $extnam()
#impltmp
<(*tmp*)>
char_noteq = XATS000_char_noteq
//
(* ****** ****** *)
//
#extern
fun
XATS000_char_isalpha
( c0: char ): bool = $extnam()
#extern
fun
XATS000_sint_isalpha
( c0: sint ): bool = $extnam()
//
#impltmp
<(*tmp*)>
char_isalpha = XATS000_char_isalpha
#impltmp
<(*tmp*)>
sint_isalpha = XATS000_sint_isalpha
//
(* ****** ****** *)
//
#extern
fun
XATS000_char_isalnum
( c0: char ): bool = $extnam()
#extern
fun
XATS000_sint_isalnum
( c0: sint ): bool = $extnam()
//
#impltmp
<(*tmp*)>
char_isalnum = XATS000_char_isalnum
#impltmp
<(*tmp*)>
sint_isalnum = XATS000_sint_isalnum
//
(* ****** ****** *)
//
#extern
fun
XATS000_char_isdigit
( c0: char ): bool = $extnam()
#extern
fun
XATS000_sint_isdigit
( c0: sint ): bool = $extnam()
//
#impltmp
<(*tmp*)>
char_isdigit = XATS000_char_isdigit
#impltmp
<(*tmp*)>
sint_isdigit = XATS000_sint_isdigit
//
(* ****** ****** *)
//
#extern
fun
XATS000_char_isxdigit
( c0: char ): bool = $extnam()
#extern
fun
XATS000_sint_isxdigit
( c0: sint ): bool = $extnam()
//
#impltmp
<(*tmp*)>
char_isxdigit = XATS000_char_isxdigit
#impltmp
<(*tmp*)>
sint_isxdigit = XATS000_sint_isxdigit
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
XATS000_char_code
( c0
: char): sint = $extnam()
#impltmp
<(*tmp*)>
char_code = XATS000_char_code
//
(* ****** ****** *)
//
#extern
fun
XATS000_char_make_code
( i0
: sint): char = $extnam()
#impltmp
<(*tmp*)>
char_make_code = XATS000_char_make_code
//
#extern
fun
XATS000_char_make_sint
( i0
: sint): char = $extnam()
#impltmp
<(*tmp*)>
char_make_sint = XATS000_char_make_sint
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen1_prelude_DATS_CATS_char000.dats] *)
(***********************************************************************)
