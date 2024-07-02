(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Fri 28 Jul 2023 01:40:19 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload
_(*TRANS3a*) = "./trans3a.dats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans3a.sats"
(* ****** ****** *)
#symload styp with x2t2p_get_styp
(* ****** ****** *)
#symload node with s2typ_get_node
#symload sort with s2typ_get_sort
(* ****** ****** *)
#symload lctn with t2jag_get_lctn
#symload t2ps with t2jag_get_t2ps
(* ****** ****** *)
//
#implfun
trans3a_s2typ
( env0,t2p0 ) = let
//
(*
val () =
prerrln
("trans3a_s2typ: t2p0 = ", t2p0)
*)
//
in//let
//
case+
t2p0.node() of
//
(*
|T2Pbas _ => t2p0
*)
//
|T2Pcst _ => t2p0
//
|T2Pvar _ => t2p0
(*
f0_var(env0, t2p0)
*)
//
|T2Pxtv _ =>
f0_xtv(env0, t2p0)
//
|T2Plft _ =>
f0_lft(env0, t2p0)
//
|T2Pf2cl _ => (t2p0)
//
|T2Ptop0 _ => f0_top0(env0, t2p0)
|T2Ptop1 _ => f0_top1(env0, t2p0)
//
|T2Parg1 _ => f0_arg1(env0, t2p0)
|T2Patx2 _ => f0_atx2(env0, t2p0)
//
|T2Papps _ => f0_apps(env0, t2p0)
//
|T2Pfun1 _ => f0_fun1(env0, t2p0)
//
|T2Pexi0 _ => f0_exi0(env0, t2p0)
|T2Puni0 _ => f0_uni0(env0, t2p0)
//
|T2Ptext _ => f0_text(env0, t2p0)
//
|T2Ptrcd _ => f0_trcd(env0, t2p0)
//
|T2Pnone0 _ => f0_none0(env0, t2p0)
|T2Pnone1 _ => f0_none1(env0, t2p0)
|T2Ps2exp _ => f0_s2exp(env0, t2p0)
//
|
_(* otherwise *) => s2typ_none1(t2p0)
//
end where // end-of-let
{
//
(* ****** ****** *)
//
(*
(*
HX-2023-08-02:
Not for now!!!
This is to be done at
dependent type-checking
*)
fun
f0_var
( env0:
! tr3aenv
, t2p0: s2typ): s2typ =
let
val-
T2Pvar(s2v1) = t2p0.node()
val test =
tr3aenv_s2vrch_btf(env0, s2v1)
in//let
( if test
  then t2p0 else s2typ_none1(t2p0) )
end(*let*)//end-of-[ f0_var(env0,t2p0) ]
*)
//
(* ****** ****** *)
//
fun
f0_xtv
( env0:
! tr3aenv
, t2p0: s2typ): s2typ =
let
//
val-
T2Pxtv(xtv1) = t2p0.node()
//
in//let
//
let
val t2p1 = xtv1.styp((*0*))
in//let
case+
t2p1.node() of
//
|
T2Pnone0() => s2typ_none1(t2p0)
//
|_(*else*) => trans3a_s2typ(env0,t2p1)
end(*let*)
//
end(*let*)//end-of-[ f0_xtv(env0,t2p0) ]
//
(* ****** ****** *)
//
fun
f0_lft
( env0:
! tr3aenv
, t2p0: s2typ): s2typ =
let
//
val-
T2Plft(t2p1) = t2p0.node()
//
val
t2p1 = trans3a_s2typ(env0, t2p1)
//
in//let
(
  s2typ(t2p0.sort(), T2Plft(t2p1)) )
end(*let*)//end-of-[ f0_lft(env0,t2p0) ]
//
(* ****** ****** *)
//
fun
f0_top0
( env0:
! tr3aenv
, t2p0: s2typ): s2typ =
let
//
val-
T2Ptop0(t2p1) = t2p0.node()
//
val
t2p1 = trans3a_s2typ(env0, t2p1)
//
in//let
  s2typ(t2p0.sort(), T2Ptop0(t2p1))
end(*let*)//end-of-[ f0_top0(env0,t2p0) ]
//
fun
f0_top1
( env0:
! tr3aenv
, t2p0: s2typ): s2typ =
let
//
val-
T2Ptop1(t2p1) = t2p0.node()
//
val
t2p1 = trans3a_s2typ(env0, t2p1)
//
in//let
  s2typ(t2p0.sort(), T2Ptop1(t2p1))
end(*let*)//end-of-[ f0_top1(env0,t2p0) ]
//
(* ****** ****** *)
//
fun
f0_arg1
( env0:
! tr3aenv
, t2p0: s2typ): s2typ =
let
//
val-
T2Parg1
( knd0, t2p1) = t2p0.node()
//
val
t2p1 = trans3a_s2typ(env0, t2p1)
//
in//let
  s2typ_make_node
  (t2p0.sort(), T2Parg1(knd0, t2p1))
end(*let*)//end-of-[ f0_arg1(env0,t2p0) ]
//
(* ****** ****** *)
//
fun
f0_atx2
( env0:
! tr3aenv
, t2p0: s2typ): s2typ =
let
//
val-
T2Patx2
( t2p1, t2p2) = t2p0.node()
//
val
t2p1 = trans3a_s2typ(env0, t2p1)
val
t2p2 = trans3a_s2typ(env0, t2p2)
//
in//let
  s2typ_make_node
  (t2p0.sort(), T2Patx2(t2p1, t2p2))
end(*let*)//end-of-[ f0_atx2(env0,t2p0) ]
//
(* ****** ****** *)
//
fun
f0_apps
( env0:
! tr3aenv
, t2p0: s2typ): s2typ =
let
//
val-
T2Papps
( t2f0, t2ps) = t2p0.node()
//
val
t2f0 = trans3a_s2typ(env0, t2f0)
val
t2ps = trans3a_s2typlst(env0, t2ps)
//
in//let
s2typ(t2p0.sort(), T2Papps(t2f0,t2ps))
end(*let*)//end-of-[ f0_apps(env0,t2p0) ]
//
(* ****** ****** *)
//
fun
f0_fun1
( env0:
! tr3aenv
, t2p0: s2typ): s2typ =
let
//
val-
T2Pfun1
( f2cl, npf1
, t2ps, tres) = t2p0.node()
//
val
f2cl =
trans3a_s2typ(env0, f2cl)
val
t2ps =
trans3a_s2typlst(env0, t2ps)
val
tres = trans3a_s2typ(env0, tres)
//
in//let
  s2typ_make_node
  ( t2p0.sort()
  , T2Pfun1(f2cl, npf1, t2ps, tres))
end(*let*)//end-of-[ f0_fun1(env0,t2p0) ]
//
(* ****** ****** *)
//
fun
f0_exi0
( env0:
! tr3aenv
, t2p0: s2typ): s2typ =
let
//
val-
T2Pexi0
( s2vs, t2p1) = t2p0.node()
//
val
t2p1 = trans3a_s2typ(env0, t2p1)
//
in//let
s2typ(t2p0.sort(), T2Pexi0(s2vs,t2p1))
end(*let*)//end-of-[ f0_exi0(env0,t2p0) ]
//
fun
f0_uni0
( env0:
! tr3aenv
, t2p0: s2typ): s2typ =
let
//
val-
T2Puni0
( s2vs, t2p1) = t2p0.node()
//
val
t2p1 = trans3a_s2typ(env0, t2p1)
//
in//let
s2typ(t2p0.sort(), T2Puni0(s2vs,t2p1))
end(*let*)//end-of-[ f0_uni0(env0,t2p0) ]
//
(* ****** ****** *)
//
fun
f0_text
( env0:
! tr3aenv
, t2p0: s2typ): s2typ =
let
//
val-
T2Ptext
( name, t2ps) = t2p0.node()
//
val
t2ps = trans3a_s2typlst(env0, t2ps)
//
in//let
s2typ(t2p0.sort(), T2Ptext(name,t2ps))
end(*let*)//end-of-[ f0_text(env0,t2p0) ]
//
(* ****** ****** *)
//
fun
f0_trcd
( env0:
! tr3aenv
, t2p0: s2typ): s2typ =
let
//
val-
T2Ptrcd
( tknd
, npf1, ltps) = t2p0.node()
//
val
ltps = trans3a_l2t2plst(env0, ltps)
//
in//let
s2typ_make_node
(t2p0.sort(), T2Ptrcd(tknd,npf1,ltps))
end(*let*)//end-of-[ f0_trcd(env0,t2p0) ]
//
(* ****** ****** *)
//
fun
f0_none0
( env0:
! tr3aenv
, t2p0: s2typ): s2typ = t2p0 // end-of-fun
fun
f0_none1
( env0:
! tr3aenv
, t2p0: s2typ): s2typ = t2p0 // end-of-fun
fun
f0_s2exp
( env0:
! tr3aenv
, t2p0: s2typ): s2typ = t2p0 // end-of-fun
//
(* ****** ****** *)
//
}(*where*)//end of [trans3a_s2typ(env0,t2p0)]
//
(* ****** ****** *)
//
#implfun
trans3a_l2t2p
( env0,lt2p ) =
(
S2LAB(l0, t2p0)) where
{
val+
S2LAB(l0, t2p0) = lt2p
val
t2p0 = trans3a_s2typ(env0, t2p0) }//end-fun
//(*where*)//end-of[trans3a_l2t2p(env0,lt2p)]
//
(* ****** ****** *)
//
#implfun
trans3a_t2jag
( env0, tjag ) =
let
val loc0 = tjag.lctn()
in//let
t2jag_make_t2ps
( loc0
, trans3a_s2typlst(env0, tjag.t2ps((*0*))))
end(*let*) // end-[trans3a_t2jag(env0,tjag)]
//
(* ****** ****** *)
//
#implfun
trans3a_s2typlst
( env0, t2ps ) =
(
  list_trans3a_fnp(env0, t2ps, trans3a_s2typ))
//
(* ****** ****** *)
//
#implfun
trans3a_l2t2plst
( env0, ltps ) =
(
  list_trans3a_fnp(env0, ltps, trans3a_l2t2p))
//
(* ****** ****** *)
//
#implfun
trans3a_t2jaglst
( env0, t2js ) =
(
  list_trans3a_fnp(env0, t2js, trans3a_t2jag))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_trans3a_staexp.dats] *)
