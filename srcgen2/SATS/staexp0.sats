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
#typedef g0nid = i0dnt_tbox
#typedef g0eid = i0dnt_tbox
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
fun
t0int_fprint:(FILR,t0int)->void
fun
t0chr_fprint:(FILR,t0chr)->void
fun
t0flt_fprint:(FILR,t0flt)->void
fun
t0str_fprint:(FILR,t0str)->void
(* ****** ****** *)
fun
i0dnt_fprint:(FILR,i0dnt)->void
fun
l0abl_fprint:(FILR,l0abl)->void
(* ****** ****** *)
//
datatype
s0qid =
| S0QIDnone of (i0dnt)
| S0QIDsome of (token, i0dnt)
datatype
d0qid =
| D0QIDnone of (i0dnt)
| D0QIDsome of (token, i0dnt)
//
fun
s0qid_get_locn(s0qid): loc_t
fun
d0qid_get_locn(d0qid): loc_t
//
#symload locn with s0qid_get_locn
#symload locn with d0qid_get_locn
//
fun s0qid_fprint:(FILR,s0qid)->void
fun d0qid_fprint:(FILR,d0qid)->void
//
(* ****** ****** *)
//
datatype
g0nam_node =
//
| G0Nid0 of (g0nid)
//
| G0Nint of (t0int)
| G0Nchr of (t0chr)
| G0Nflt of (t0flt)
| G0Nstr of (t0str)
//
| G0Nlist of
  (token, g0namlst, token)
//
| G0Nnone0 of ()
| G0Nnone1 of (token(*error*))
//
(* ****** ****** *)
//
fun
g0nam_get_locn(g0nam): loc_t
fun
g0nam_get_node(g0nam): g0nam_node
//
#symload locn with g0nam_get_locn
#symload node with g0nam_get_node
//
fun g0nam_fprint:(FILR,g0nam)->void
//
(* ****** ****** *)
fun g0exp_fprint:(FILR,g0exp)->void
fun g0mag_fprint:(FILR,g0mag)->void
(* ****** ****** *)

(* end of [ATS3/XATSOPT_staexp0.sats] *)
