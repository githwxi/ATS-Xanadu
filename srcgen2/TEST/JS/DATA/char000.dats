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
// Start Time: March, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
char_noteq
  (c1, c2) =
(
not(char_equal(c1, c2))
)
//
(* ****** ****** *)
//
#impltmp<>
char_lt(x1, x2) = 
(char_cmp<>(x1, x2) < 0)
#impltmp<>
char_gt(x1, x2) = 
(char_cmp<>(x1, x2) > 0)
#impltmp<>
char_eq(x1, x2) = 
(char_cmp<>(x1, x2) = 0)
#impltmp<>
char_lte(x1, x2) = 
(char_cmp<>(x1, x2) <= 0)
#impltmp<>
char_gte(x1, x2) = 
(char_cmp<>(x1, x2) >= 0)
#impltmp<>
char_neq(x1, x2) = 
(char_cmp<>(x1, x2) != 0)
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
sub_char_char
  (c1, c2) =
( code(c1) - code(c2) )
//
#impltmp
<>(*tmp*)
add_char_sint
  (c1, i2) =
char_make_code(code(c1)+i2)
//
(* ****** ****** *)

#impltmp
<>(*tmp*)
char_lower
(   c0   ) =
(
if
(c0 < 'A')
then c0 else
if
(c0 > 'Z')
then c0 else char
(code('a')+(code(c0)-code('A')))
endif // end-of-(else)
) (* if *) // end of [char_lower(c0)]

#impltmp
<>(*tmp*)
char_upper
(   c0   ) =
(
if
(c0 < 'a')
then c0 else
if
(c0 > 'z')
then c0 else char
(code('A')+(code(c0)-code('a')))
endif // end-of(else)
) (* if *) // end of [char_upper(c0)]

(* ****** ****** *)
//
// HX:
// For implementing
// some g-operations
//
(* ****** ****** *)

#impltmp
g_cmp<char> = char_cmp<>

(* ****** ****** *)
//
#impltmp
g_succ<char>(ch) =
char_make_code(code(ch)+1)
//
(* ****** ****** *)

#impltmp
g_equal<char> = char_equal<>
#impltmp
g_noteq<char> = char_noteq<>

(* ****** ****** *)
#impltmp
g_eqref<char> = g_equal<char>
#impltmp
g_neqrf<char> = g_noteq<char>
(* ****** ****** *)

#impltmp
g_print<char> = char_print<(*nil*)>

(* ****** ****** *)
//
// HX-2022-06-12:
// For deprecation
//
#impltmp
sint_make_char<> = char_code<(*_*)>
#impltmp
char_make_sint<> = char_make_code<>
#impltmp
char_make_uint<>(u) =
char_make_code<>(i) where {val i = g0u2s(u)}
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_char000.dats] *)
