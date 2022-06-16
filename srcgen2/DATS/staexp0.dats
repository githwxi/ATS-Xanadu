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
Start Time: June 08th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/xlabel0.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
(* ****** ****** *)

local
//
datatype
l0abl =
L0ABL of
(
loctn, l0abl_node)
#absimpl
l0abl_tbox = l0abl
//
in (* in-of-local *)

(* ****** ****** *)
//
#implfun
l0abl_get_lctn(lab) =
let val+L0ABL(loc,lnd) = lab in loc end
#implfun
l0abl_get_node(lab) =
let val+L0ABL(loc,lnd) = lab in lnd end
#implfun
l0abl_make_node(loc,lnd) = L0ABL(loc,lnd)
//
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)
#implfun
l0abl_make_none
  (  tok  ) = let
val
loc =
token_get_lctn(tok)
in
l0abl_make_node(loc, L0ABLnone(tok))
//
end // end of [l0abl_make_none]
(* ****** ****** *)
//
#implfun
l0abl_make_int1
  (  tok  ) = let
//
val
loc =
token_get_lctn(tok)
val-
T_INT01(rep) =
token_get_node(tok)
//
val int = g_parse<sint>(rep)
//
in
//
l0abl_make_node(loc, L0ABLsome(LABint(int)))
//
end // end of [l0abl_make_int1]
//
#implfun
l0abl_make_name
  (  tok  ) = let
//
val
loc =
token_get_lctn(tok)
val-
T_IDALP(rep) =
token_get_node(tok)
//
val sym = symbl_make_name(rep)
//
(*
val () =
prerrln
("l0abl_make_name: sym = ", sym)
*)
//
in
//
l0abl_make_node(loc, L0ABLsome(LABsym(sym)))
//
end // end of [l0abl_make_name]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_staexp0.dats] *)
