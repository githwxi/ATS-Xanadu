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

#staload "./../SATS/lexing.sats"

(* ****** ****** *)
//
extern
fun
isBLANK(c: char): bool
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

implement
isBLANK(c) = isspace(c)

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
  | ( c = '\'' ) => true // HX: following the ML tradition
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

(* end of [xats_lexing_util.dats] *)
