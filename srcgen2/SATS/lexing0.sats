(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
Start Time: May 28th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload LOC = "./locinfo.sats"
(* ****** ****** *)
#typedef
loc_t = $LOC.loc_t
(* ****** ****** *)
//
datatype tnode =
//
| T_EOF of ((*void*))
| T_ERR of ((*void*))
//
(* ****** ****** *)
#abstbox token_tbox // ptr
#typedef token = token_tbox
(* ****** ****** *)
#typedef tokenlst = list(token)
#typedef tokenopt = optn(token)
(* ****** ****** *)
//
fun//<>
tnode_fprint(FILR, tnode): void
fun//<>
token_fprint(FILR, token): void
//
(* ****** ****** *)
//
fun//{}
token_get_loc0: token -> loc_t
fun//{}
token_get_node: token -> tnode
#symload loc0 with token_get_node
#symload node with token_get_node
//
fun//{}
token_make_node
(loc: loc_t, node: tnode): token
#symload token with token_make_node
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_lexing0.sats] *)
