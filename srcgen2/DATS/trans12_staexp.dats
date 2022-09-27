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
(*
Sun 11 Sep 2022 02:28:00 PM EDT
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
#staload
_(*TRANS12*) = "./trans12.dats"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
#staload "./../SATS/trans12.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with sort1_get_lctn
#symload node with sort1_get_node
(* ****** ****** *)
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
(* ****** ****** *)

#implfun
trans12_sort1
( tenv,s1t0 ) = let
(*
val
loc0 = s1t0.lctn()
val () =
prerrln
("trans12_sort1: s1t0 = ", s1t0)
*)
in//let
//
case+
s1t0.node() of
//
|S1Tint(tok) =>
sort2_int(token2sint(tok))
//
| S1Tnone0 () => sort2_none1(s1t0)
| S1Tnone1 (s0t0) => sort2_none1(s1t0)
//
end where
{
} (*where*) // end of [trans12_sort1(tenv,s1t0)]

(* ****** ****** *)

#implfun
trans12_s1exp
( tenv,s1e0 ) = let
//
(*
val
loc0 = s1e0.lctn()
val () =
prerrln
("trans12_s1exp: s1e0 = ", s1e0)
*)
//
in//let
//
case+
s1e0.node() of
//
|S1Eint(tok) =>
s2exp_int(token2sint(tok))
|S1Echr(tok) =>
s2exp_chr(token2schr(tok))
|S1Eflt(tok) =>
s2exp_flt(token2sflt(tok))
|S1Estr(tok) =>
s2exp_str(token2sstr(tok))
//
|_(*otherwise*) => s2exp_none1(s1e0)
//
end where
{
} (*where*) // end of [trans12_s1exp(tenv,s1e0)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans12_staexp.dats] *)
