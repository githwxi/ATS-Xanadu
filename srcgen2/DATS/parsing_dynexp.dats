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
Start Time: July 4th, 2022
(*
Mon Jul  4 19:02:42 EDT 2022
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
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/parsing.sats"
(* ****** ****** *)
#symload
lctn with token_get_lctn//lexing0
#symload
lctn with i0dnt_get_lctn//staexp0
#symload
lctn with l0abl_get_lctn//staexp0
#symload
lctn with sort0_get_lctn//staexp0
#symload
lctn with s0exp_get_lctn//staexp0
(* ****** ****** *)
#symload
node with token_get_node//lexing0
#symload
node with i0dnt_get_node//staexp0
#symload
node with l0abl_get_node//staexp0
(* ****** ****** *)
#symload
tnode with token_get_node//lexing0
(* ****** ****** *)
#symload + with add_loctn_loctn//locinfo
(* ****** ****** *)
//
(*
atmd0pat::
//
  | d0pid
//
  | t0int // int
  | t0chr // char
  | t0flt // float
  | t0str // string
//
*)
//
#extern
fun
p1_d0pat_atm: p1_fun(d0pat)
#extern
fun
p1_d0patseq_atm: p1_fun(d0patlst)
//
(* ****** ****** *)
//
#extern
fun
p1_d0patseq_COMMA: p1_fun(d0patlst)
#extern
fun
p1_l0d0pseq_COMMA: p1_fun(l0d0plst)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_parsing_dynexp.dats] *)
