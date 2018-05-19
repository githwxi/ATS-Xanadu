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

#staload "./location.sats"

(* ****** ****** *)
//
datatype
tnode =
//
  | T_EOF of ()
  | T_ERR of ()
//
  | T_COMMENT_line of () // line comment
  | T_COMMENT_rest of () // rest-of-file
  | T_COMMENT_block of () // block comment
//
typedef
token =
$rec{
  token_loc= loc_t, token_node= tnode
} (* end of [token] *)
//
typedef tokenopt = Option(token)
vtypedef tokenopt_vt = Option_vt(token)
//
(* ****** ****** *)
//
fun
print_token : (token) -> void
fun
prerr_token : (token) -> void
fun
fprint_token : (FILEref, token) -> void
//
overload print with print_token
overload prerr with prerr_token
overload fprint with fprint_token
//
(* ****** ****** *)

(* end of [xats_lexing.sats] *)
