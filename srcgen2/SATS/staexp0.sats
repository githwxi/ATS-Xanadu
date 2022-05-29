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
// Author: Hongwei Xi
// Start Time: May 28th, 2022
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
//
#staload LAB = "./xlabel0.sats"
#staload LOC = "./locinfo.sats"
//
#staload SYM = "./xsymbol.sats"
#staload LEX = "./lexing0.sats"
//
(* ****** ****** *)
//
#typedef label = $LAB.label
#typedef loctn = $LOC.loctn
//
#typedef token = $LEX.token
#typedef tokenlst = $LEX.tokenlst
#typedef tokenopt = $LEX.tokenopt
//
(* ****** ****** *)
//
#abstbox t0int_tbox = ptr
#abstbox t0chr_tbox = ptr
#abstbox t0flt_tbox = ptr
#abstbox t0str_tbox = ptr
//
#abstbox i0dnt_tbox = ptr
//
(* ****** ****** *)
//
#abstbox l0abl_tbox = ptr
//
(* ****** ****** *)

(* end of [xatsopt_staexp0.sats] *)
