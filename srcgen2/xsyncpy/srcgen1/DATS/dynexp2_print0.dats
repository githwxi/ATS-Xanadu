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
Sun May 18 10:02:26 AM EDT 2025
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"xatslib\
/libcats\
/HATS/libcats_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
#staload
"./../../../SATS/dynexp2.sats"
//
#extern
fcast
castxy{ax:t0}{ay:t0}(ax):(ay)
//
in//local
//
#impltmp
g_print<d2exp>(d2e0) =
(
//
case+
d2e0.node() of
//
| _(*otherwise*) =>
let
val out0 =
g_print$out<>() in d2exp_fprint(d2e0, castxy(out0))
end//let
//
)(*case+*)//end-of-[g_print<d2exp>(d2e0)]
//
end//local//end-of-[staload("./../../../SATS/dynexp2.sats")]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_dynexp2_print0.dats] *)
(***********************************************************************)
