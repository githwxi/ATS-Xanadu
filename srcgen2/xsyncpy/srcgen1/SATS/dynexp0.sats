(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun May 18 10:48:25 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX: for [FILR]
*)
#include
"xatslib\
/libcats\
/HATS/libcats_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
D0E = "./\
../../../SATS/dynexp0.sats"
//
(* ****** ****** *)
//
#typedef d0pat = $D0E.d2pat
#typedef d0exp = $D0E.d2exp
#typedef d0ecl = $D0E.d2ecl
//
(* ****** ****** *)
(* ****** ****** *)
//
#symload
lctn with $D0E.d0pat_get_lctn
#symload
node with $D0E.d0pat_get_node
//
#symload
lctn with $D0E.d0exp_get_lctn
#symload
node with $D0E.d0exp_get_node
//
#symload
lctn with $D0E.d0ecl_get_lctn
#symload
node with $D0E.d0ecl_get_node
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
d0exp_fprint
(dexp: d0exp, out0: FILR): void
#symload
fprint with d0exp_fprint of 1000
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_dynexp0.sats] *)
(***********************************************************************)
