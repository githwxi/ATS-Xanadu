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
// Start Time: December, 2018
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
#staload "./../SATS/symbol.sats"
#staload "./../SATS/lexing.sats"
//
#staload "./../SATS/trans01.sats"
//
(* ****** ****** *)

local

fun
aux1
(rep: string): int =
auxmain
(10, string2ptr(rep), 0)
and
aux2
( bas: int
, rep: string): int =
auxmain
(bas, string2ptr(rep), 0)
and
auxmain
( b0: int
, p0: ptr
, r0: int): int =
(
let
val c0 =
$UN.ptr0_get<char>(p0)
in(* in-of-let *)
//
if
isdigit(c0)
then
(
  auxmain(b0, p0, r0)
) where
{
  val p0 = ptr_succ<char>(p0)
  val r0 = b0 * r0 + (c0 - '0')
}
else (r0) // end of [if]
//
end
) (* end of [auxmain] *)

in (* in-of-local *)

implement
token2sint(tok) =
(
case-
tok.node() of
//
| T_INT1(rep) => aux1(rep)
| T_INT2(bas, rep) => aux2(bas, rep)
| T_INT3(bas, rep, _) => aux2(bas, rep)
//
) (* end of [token2sint] *)

implement
token2dint(tok) =
(
case-
tok.node() of
//
| T_INT1(rep) => aux1(rep)
| T_INT2(bas, rep) => aux2(bas, rep)
| T_INT3(bas, rep, _) => aux2(bas, rep)
//
) (* end of [token2dint] *)

end // end of [local]

(* ****** ****** *)

implement
sortid_sym(tok) =
(
case-
tok.node() of
//
| T_IDENT_alp(nm) => $SYM.symbol_make(nm)
| T_IDENT_sym(nm) => $SYM.symbol_make(nm)
//
) (* end of [sortid_sym] *)

(* ****** ****** *)

implement
sargid_sym(tok) =
(
case-
tok.node() of
//
| T_IDENT_alp(nm) => $SYM.symbol_make(nm)
| T_IDENT_alp(nm) => $SYM.symbol_make(nm)
//
) (* end of [sexpid_sym] *)

(* ****** ****** *)

implement
sexpid_sym(tok) =
(
case-
tok.node() of
//
| T_IDENT_alp(nm) => $SYM.symbol_make(nm)
| T_IDENT_sym(nm) => $SYM.symbol_make(nm)
//
) (* end of [sexpid_sym] *)

(* ****** ****** *)

implement
dexpid_sym(tok) =
(
case-
tok.node() of
//
| T_IDENT_alp(nm) => $SYM.symbol_make(nm)
| T_IDENT_sym(nm) => $SYM.symbol_make(nm)
| T_IDENT_srp(nm) => $SYM.symbol_make(nm)
| T_IDENT_dlr(nm) => $SYM.symbol_make(nm)
//
) (* end of [dexpid_sym] *)

(* ****** ****** *)

(* end of [trans01_basics.dats] *)
