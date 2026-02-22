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
#staload
"./../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
#extern
fcast
castxy{ax:t0}{ay:t0}(ax:ax):(ay)
//
in//local
//
#implfun
d2var_fprint
(dvar, out0) =
$D2E.d2var_fprint(dvar, castxy(out0))
//
#implfun
d2pat_fprint
(dpat, out0) =
$D2E.d2pat_fprint(dpat, castxy(out0))
#implfun
d2exp_fprint
(dexp, out0) =
$D2E.d2exp_fprint(dexp, castxy(out0))
//
#implfun
d2ecl_fprint
(d2cl, out0) =
$D2E.d2ecl_fprint(d2cl, castxy(out0))
//
end//local
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t2iag1_fprint
( tiag, out0 ) =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
  prints("T2IAG1(", tiag.t2qs(), ")")
end(*let*)//end-of-[t2iag1_fprint(tiag,out0)]
//
#implfun
t2jag1_fprint
( tjag, out0 ) =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
  prints("T2JAG1(", tjag.t2qs(), ")")
end(*let*)//end-of-[t2jag1_fprint(tjag,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_dynexp2_print0.dats] *)
(***********************************************************************)
