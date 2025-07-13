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
#staload
"./../SATS/statyp2.sats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
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
|T2P1none0
( (*void*) ) =>
(
  prints("T2P1none0(", ")"))
//
|T2P1cst
(   s2c1   ) =>
prints("T2P1cst(", s2c1, ")")
|T2P1var
(   s2v1   ) =>
prints("T2P1var(", s2v1, ")")
//
|T2P1lft
(   t2p1   ) =>
prints("T2P1lft(", t2p1, ")")
//
|T2P1top0
(   t2p1   ) =>
prints("T2P1top0(", t2p1, ")")
|T2P1top1
(   t2p1   ) =>
prints("T2P1top1(", t2p1, ")")
//
|T2P1arg1
(knd0, t2p1) =>
( print("T2P1arg1(")
; prints(knd0, ";", t2p1, ")"))
|T2P1atx2
(t2p1, t2p2) =>
( print("T2P1atx2(")
; prints(t2p1, ";", t2p2, ")"))
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
|T2P1f2cl
(   f2cl   ) =>
(
prints("T2P1f2cl(", f2cl, ")"))
|T2P1fun1
(f2cl, npf1
,t2ps, tres) =>
(
print("T2P1fun1(");
prints
(f2cl,";"
,npf1,";", t2ps,";", tres,")"))
//
|T2P1exi0
(s2vs, t2p1) =>
prints
("T2P1exi0(",s2vs,";",t2p1,")")
|T2P1uni0
(s2vs, t2p1) =>
prints
("T2P1uni0(",s2vs,";",t2p1,")")
//
|T2P1trcd
(trcd
,npf1, ltps) =>
(
print("T2P1trcd(");
prints(trcd,";",npf1,";",ltps,")"))
//
|T2P1text
(name, t2ps) =>
prints
("T2P1text(", name, ";", t2ps, ")")
//
|T2P1s2typ
(   styp   ) =>
(
  prints( "T2P1s2typ(", styp, ")" ))
//
|T2P1errck
(lvl0, t2p1) =>
prints("T2P1errck(", lvl0, ";", t2p1, ")")
//
end(*let*)//end-of-[s2typ1_fprint(t2p0,out0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_statyp2_print0.dats] *)
(***********************************************************************)
