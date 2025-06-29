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
Sun Jun  1 10:10:09 PM EDT 2025
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
"./../SATS/statyp2.sats"
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
s2typ_fprint
(styp, out0) =
$T2P.s2typ_fprint(styp, castxy(out0))
//
end//local
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s2typ1_fprint
( t2p0, out0 ) =
let
//
#impltmp
g_print$out<>() = out0
//
in//let
//
case+
t2p0.node() of
//
|T2P1cst
(   s2c1   ) =>
prints("T2P1cst(", s2c1, ")")
|T2P1var
(   s2v1   ) =>
prints("T2P1var(", s2v1, ")")
//
|T2P1apps
(t2f0, t2ps) =>
prints
("T2P1apps(",t2f0,";",t2ps,")")
|T2P1lam1
(s2vs, t2p1) =>
prints
("T2P1lam1(",s2vs,";",t2p1,")")
//
|T2P1s2typ
(   styp   ) =>
(
  prints( "T2P1s2typ(", styp, ")" ))
//
end(*let*)//end-of-[s2typ1_fprint(t2p0,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_statyp2_print0.dats] *)
(***********************************************************************)
