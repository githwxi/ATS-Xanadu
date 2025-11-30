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
Sun May 18 11:31:16 AM EDT 2025
*)
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
BAS = "./\
../../../SATS/xbasics.sats"
#staload
LAB = "./\
../../../SATS/xlabel0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
S2E = "./\
../../../SATS/staexp2.sats"
#staload
T2P = "./\
../../../SATS/statyp2.sats"
#staload
D2E = "./\
../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
#sexpdef s2lab = $S2E.s2lab
(* ****** ****** *)
#sexpdef sort2 = $T2P.sort2
(* ****** ****** *)
#typedef s2var = $T2P.s2var
#typedef s2cst = $T2P.s2cst
(* ****** ****** *)
#typedef s2typ = $T2P.s2typ
#typedef l2t2p = $T2P.l2t2p
(* ****** ****** *)
#typedef d2con = $D2E.d2con
(* ****** ****** *)
#typedef s2varlst = list(s2var)
#typedef s2cstlst = list(s2cst)
#typedef s2typlst = list(s2typ)
(* ****** ****** *)
//
fun
s2typ_fprint
(styp: s2typ, out0: FILR): void
fun
l2t2p_fprint
(lt2p: l2t2p, out0: FILR): void
//
#symload
fprint with s2typ_fprint of 1000
#symload
fprint with l2t2p_fprint of 1000
//
(* ****** ****** *)
(* ****** ****** *)
#abstbox s2typ1_tbox // p0tr
#typedef s2typ1 = s2typ1_tbox
#typedef l2t2p1 = s2lab(s2typ1)
(* ****** ****** *)
#typedef s2typ1lst = list(s2typ1)
#typedef l2t2p1lst = list(l2t2p1)
(* ****** ****** *)
//
datatype
s2typ1_node =
(* ****** ****** *)
//
|T2P1cst of s2cst//constant
|T2P1var of s2var//variable
//
(* ****** ****** *)
//
(*
HX-2025-11-22:
A left-variable can be
introduced as follows:
(1) a var declaration
(2) a banged var in a tuple
(3) a banged var in a dtcon
*)
|T2P1lft of s2typ1//lft-value
//
(* ****** ****** *)
//
|
T2P1top0 of s2typ1//uninitized
|
T2P1top1 of s2typ1//delineared
//
(* ****** ****** *)
//
// HX: ~/!/& = 0/1/-1
// knd: 0/1/-1//cbv0/v1/rf
|T2P1arg1 of
(sint(*knd*), s2typ1)
|T2P1atx2 of // HX: bef=arg1
(//sint(*knd*)//knd = 1 / -1
 s2typ1(*bef*), s2typ1(*aft*))
//
(* ****** ****** *)
//
|T2P1apps of
(
s2typ1(*fun*), s2typ1lst(*args*))
|T2P1lam1 of
(
s2varlst(*args*), s2typ1(*body*))
//
(* ****** ****** *)
//
|T2P1f2cl of $BAS.f2clknd
|T2P1fun1 of
(s2typ1(*f2cl*), sint(*npf*)
,s2typ1lst(*args*), s2typ1(*res*))
//
(* ****** ****** *)
//
|T2P1exi0 of // exists quantifier
(s2varlst(*vars*), s2typ1(*body*))
|T2P1uni0 of // forall quantifier
(s2varlst(*vars*), s2typ1(*body*))
//
(* ****** ****** *)
//
(*
|T2P1tcon of (d2con, s2typlst)
*)
//
|T2P1trcd of
(
$BAS.trcdknd,sint(*npf*),l2t2p1lst)
//
(* ****** ****** *)
//
|T2P1text of
(string(*name*), s2typ1lst(*args*))
//
(* ****** ****** *)
//
|T2P1none0 of ((*0*))//HX: optional
//
|T2P1s2typ of (s2typ)//yet-to-be-copied
//
|T2P1errck of (sint(*lvl*), s2typ1(*err*))
//
(* ****** ****** *)
//
fun
s2typ1_linq(s2typ1): bool
fun
s2typ1_prfq(s2typ1): bool
//
fun
l2t2p1_linq(l2t2p1): bool
fun
l2t2p1_prfq(l2t2p1): bool
//
fun
s2typ1lst_linq(s2typ1lst): bool
fun
s2typ1lst_prfq(s2typ1lst): bool
//
fun
l2t2p1lst_linq(l2t2p1lst): bool
fun
l2t2p1lst_prfq(l2t2p1lst): bool
//
(* ****** ****** *)
//
fun
sort2_enlin(sort2): sort2
fun
sort2_delin(sort2): sort2
//
fun
s2typ1_delin(s2typ1): s2typ1
//
fun
s2typ1_t0pize(t2q0:s2typ1):s2typ1
fun
s2typ1_t1pize(t2q0:s2typ1):s2typ1
//
(* ****** ****** *)
//
fun
s2typ1_sort$get
(styp: s2typ1): sort2
#symload sort with s2typ1_sort$get
//
fun
s2typ1_node$get
(styp: s2typ1): s2typ1_node
#symload node with s2typ1_node$get
//
(* ****** ****** *)
//
fun
s2typ1_lteq
(t2q1: s2typ1, t2q2: s2typ1): bool
fun
l2t2p1_lteq
(ltq1: l2t2p1, ltq2: l2t2p1): bool
//
#symload <= with s2typ1_lteq of 1000
#symload <= with l2t2p1_lteq of 1000
//
fun
s2typ1lst_lteq
(tqs1: s2typ1lst, tqs2: s2typ1lst): bool
fun
l2t2p1lst_lteq
(lts1: l2t2p1lst, lts2: l2t2p1lst): bool
//
(* ****** ****** *)
//
fun
s2typ1_none0(): s2typ1
//
(* ****** ****** *)
//
fun
s2typ1_lft(t2q0: s2typ1): s2typ1
//
(* ****** ****** *)
//
fun
s2typ1_tup0
(npf1:sint,t2qs:s2typ1lst): s2typ1
fun
s2typ1_tup1
(trcdknd(*tknd*)
,npf1:sint,t2qs:s2typ1lst): s2typ1
fun
s2typ1_rcd2
(trcdknd(*tknd*)
,npf1:sint,ltqs:l2t2p1lst): s2typ1
//
(* ****** ****** *)
//
fun
s2typ1_make_s2typ(styp: s2typ): s2typ1
//
(* ****** ****** *)
//
fun
s2typ1_make_sort$node
(s2t0:sort2,node:s2typ1_node): s2typ1
#symload s2typ1 with s2typ1_make_sort$node
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2typ1_fprint
(t2q0: s2typ1, out0: FILR): void
fun
l2t2p1_fprint
(lt2q: l2t2p1, out0: FILR): void
//
#symload fprint with s2typ1_fprint of 1000
#symload fprint with l2t2p1_fprint of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef label = $LAB.label
//
fun
l2t2p1lst_lab$proj
(ltqs: l2t2p1lst, lab0: label): s2typ1
//
fun
s2typ1_lab$fset
(styp
:s2typ1,lab0:label,t2q0:s2typ1): s2typ1
fun
l2t2p1lst_lab$fset
(ltqs
:l2t2p1lst,lab0:label,t2q0:s2typ1): l2t2p1lst
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_statyp2.sats] *)
(***********************************************************************)
