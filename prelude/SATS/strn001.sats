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
Fri 26 Jul 2024 09:17:44 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_listize
(cs: strn): list_vt(cgtz)
fun<>
strn_rlistize
(cs: strn): list_vt(cgtz)
//
fun<>
strn_strmize
(cs: strn): strm_vt(cgtz)
fun<>
strn_rstrmize
(cs: strn): strm_vt(cgtz)
//
fun<>
strn_strqize
{n0:i0}
(cs: strn(n0)): strq_vt(cgtz, n0)
fun<>
strn_rstrqize
{n0:i0}
(cs: strn(n0)): strq_vt(cgtz, n0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_forall(cs: strn): void
fun<>
strn_rforall(cs: strn): void
fun<>
strn_iforall(cs: strn): void
fun<>
strn_irforall(cs: strn): void
//
(* ****** ****** *)
//
fun<>
strn_foritm(cs: strn): void
fun<>
strn_rforitm(cs: strn): void
fun<>
strn_iforitm(cs: strn): void
fun<>
strn_irforitm(cs: strn): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_strn001.sats] *)
