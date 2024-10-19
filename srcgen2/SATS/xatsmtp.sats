(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
Mon Oct  7 08:31:46 PM EDT 2024
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2024-10-07:
For general support
of meta-programming in ATS3
*)
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
(* ****** ****** *)
//
fun//<>
d2con_name$fun$emit
(out: FILR, dcon: d2con): void
fun//<>
d2con_ctag$fun$emit
(out: FILR, dcon: d2con): void
fun//<>
d2con_narg$fun$emit
(out: FILR, dcon: d2con): void
//
(* ****** ****** *)
//
fun
d2con_dcon$pat$emit
(out: FILR, dcon: d2con): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2cstlst_d2cs$name$fun$emit
(out: FILR, s2cs: s2cstlst): void
fun
s2cstlst_d2cs$ctag$fun$emit
(out: FILR, s2cs: s2cstlst): void
fun
s2cstlst_d2cs$narg$fun$emit
(out: FILR, s2cs: s2cstlst): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****************************************** *)
(* ****************************************** *)

(* end of [ATS3/XATSOPT_srcgen2_SATS_xatsmtp.sats] *)
