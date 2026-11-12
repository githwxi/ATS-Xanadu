(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Tue Nov 10 01:01:20 AM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload // LAB =
"./../../../SATS/xlabel0.sats"
#staload // SYM =
"./../../../SATS/xsymbol.sats"
//
#staload // LOC =
"./../../../SATS/locinfo.sats"
//
#staload // LEX =
"./../../../SATS/lexing0.sats"
//
(* ****** ****** *)
//
#staload // D2E =
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
//
#staload // GLO =
"./../../../SATS/xglobal.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/cc1emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1tnmcc1
( filr,itnm ) =
(
prints
("ccx", "tnm", stmp)) where
{
//
#impltmp g_print$out<>() = filr
//
val stmp = i1tnm_stmp$get(itnm)
//
}(*where*)//endof[i1tnmcc1(filr,itnm)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3-XANADU/srcgen2/xats2cc/srcgen1/DATS/cc1emit_utils0.dats] *)
(***********************************************************************)
