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
bool_print<>(b0) =
if
(b0)
then g_print<string>("true")
else g_print<string>("false")
endif//end-of-[bool_print(b0)]
//
(* ****** ****** *)
//
#impltmp
bool_parse<>(rep) =
(
case+ rep of
| "false" => false
(*
| "False" => false
| "FALSE" => false
| "" => false | "0" => false
| "ff" => false | "Ff" => false | "FF" => false
| "nil" => false | "Nil" => false | "NIL" => false
| "none" => false | "None" => false | "NONE" => false
| "null" => false | "Null" => false | "NULL" => false
*)
| _ (* else *) => true
)
//
(* ****** ****** *)
//
#impltmp
<>(*tmp*)
bool2sint(b) =
(if b then 1 else 0)
//
(* ****** ****** *)
//
#impltmp
<a>(*tmp*)
bool_ifval
(b0, x1, y2) =
(if b0 then x1 else y2)
//
(* ****** ****** *)
//
(*
HX:
For implementing g-ops
*)
//
(* ****** ****** *)
#impltmp
g_eqref<bool> = g_equal<bool>
#impltmp
g_neqrf<bool> = g_noteq<bool>
(* ****** ****** *)
#impltmp
g_print<bool> = bool_print<(*nil*)>
(* ****** ****** *)
//
(*
HX:
For implementing
some verbs in [gbas.sats]
*)
//
#impltmp forall$test<bool>(x0) = x0
#impltmp forall0$test<bool>(x0) = x0
#impltmp forall1$test<bool>(x0) = x0
//
(* ****** ****** *)
//
#impltmp exists$test<bool>(x0) = x0
#impltmp exists0$test<bool>(x0) = x0
#impltmp exists1$test<bool>(x0) = x0
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_bool000.dats] *)
