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
#abstype stamp_type <= uint
#typedef stamp = stamp_type
(* ****** ****** *)
#abstbox stamper_tbox // ptr
#typedef stamper = stamper_tbox
(* ****** ****** *)
//
val
the_stamp_nil: stamp(* 0 *)
//
fun
stamp_nilq(stamp): bool
#symload
nilq with stamp_nilq of 1000
//
(* ****** ****** *)
//
fun
stamp_cmp(stamp, stamp): sint
//
(* ****** ****** *)
//
fun//<>
stamp_fprint(FILR, stamp): void
//
(* ****** ****** *)
//
fun
stamp_get_uint(stamp): uint
#symload uint with stamp_get_uint
//
(* ****** ****** *)
fun
stamp_make_uint(uint): stamp
#symload stamp with stamp_make_uint
(* ****** ****** *)
fun
stamper_new((*void*)): stamper
fun
stamper_getinc(obj:stamper): stamp
fun
stamper_tmpset(stamper, sint): void
(* ****** ****** *)
#symload getinc with stamper_getinc
#symload tmpset with stamper_tmpset
(* ****** ****** *)

(* end of [ATS3/XATSOPT_xstamp0.sats] *)
