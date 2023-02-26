(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Sun 26 Feb 2023 10:23:10 AM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/tread23.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
//
#implfun
d3parsed_fpemsg
  (out, dpar) = let
//
val nerror =
d3parsed_get_nerror(dpar)
//
in//let
if
(nerror > 0) then
let
val parsed =
d3parsed_get_parsed(dpar)
in
d3eclistopt_fpemsg(out, parsed) end else ()
end (*let*)//end-of-[d3parsed_fpemsg(out,dpar)]
//
(* ****** ****** *)
//
#implfun
d3explstopt_fpemsg
  (out, dopt) =
(
case+ dopt of
| optn_nil() => ((*void*))
| optn_cons(d3es) => d3explst_fpemsg(out, d3es)
)
//
(* ****** ****** *)
//
#implfun
d3eclistopt_fpemsg
  (out, dopt) =
(
case+ dopt of
| optn_nil() => ((*void*))
| optn_cons(d3cs) => d3eclist_fpemsg(out, d3cs)
)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread23.dats] *)
