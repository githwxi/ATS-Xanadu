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
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
//
#staload
LAB = "./xlabel0.sats"
#staload
LOC = "./locinfo.sats"
//
#typedef lab_t = $LAB.lab_t
#typedef loc_t = $LOC.loc_t
//
(* ****** ****** *)
//
#staload
SYM = "./xsymbol.sats"
#staload
LEX = "./lexing0.sats"
//
#typedef sym_t = $SYM.sym_t
#typedef token = $LEX.token
//
(* ****** ****** *)
//
#abstbox t0int_tbox // ptr
#abstbox t0chr_tbox // ptr
#abstbox t0flt_tbox // ptr
#abstbox t0str_tbox // ptr
//
#abstbox i0dnt_tbox // ptr
#abstbox l0abl_tbox // ptr
//
(* ****** ****** *)
//
#abstbox g0nam_tbox // ptr
//
(* ****** ****** *)
//
#abstbox g0exp_tbox // ptr
//
#abstbox g0mag_tbox // ptr
//
(* ****** ****** *)
//
#abstbox sort0_tbox // ptr
#abstbox s0exp_tbox // ptr
//
#abstbox s0arg_tbox // ptr
#abstbox s0mag_tbox // ptr
//
#abstbox t0arg_tbox // ptr
#abstbox t0mag_tbox // ptr
//
(* ****** ****** *)
//
#typedef t0int = t0int_tbox
#typedef t0chr = t0chr_tbox
#typedef t0flt = t0flt_tbox
#typedef t0str = t0str_tbox
//
#typedef i0dnt = i0dnt_tbox
#typedef l0abl = l0abl_tbox
//
(* ****** ****** *)
//
#typedef s0tid = i0dnt_tbox
#typedef s0eid = i0dnt_tbox
//
#typedef d0pid = i0dnt_tbox
#typedef d0eid = i0dnt_tbox
//
(* ****** ****** *)
//
#typedef g0nam = g0nam_tbox
#typedef g0exp = g0exp_tbox
#typedef g0mag = g0mag_tbox
#typedef g0namlst = list(g0nam)
#typedef g0explst = list(g0exp)
#typedef g0maglst = list(g0mag)
//
(* ****** ****** *)
//
datatype
sq0eid =
| SQ0EIDnone of (s0eid)
| SQ0EIDsome of (token, s0eid)
datatype
dq0eid =
| DQ0EIDnone of (d0eid)
| DQ0EIDsome of (token, d0eid)
//
fun
sq0eid_get_locn(sq0eid): loc_t
fun
dq0eid_get_locn(dq0eid): loc_t
//
#symload locn with sq0eid_get_locn
#symload locn with dq0eid_get_locn
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_staexp0.sats] *)
