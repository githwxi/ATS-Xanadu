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
//
(* ****** ****** *)
//
#staload
S2E = "./\
../../../SATS/staexp2.sats"
#staload
T2P = "./\
../../../SATS/statyp2.sats"
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
//
|T2P1cst of s2cst // constant
|T2P1var of s2var // variable
//
|T2P1lft of s2typ1 // l-value
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
|T2P1f2cl of $BAS.f2clknd
|T2P1fun1 of
(s2typ1(*f2cl*), sint(*npf*)
,s2typ1lst(*args*), s2typ1(*res*))
//
|T2P1exi0 of // exists quantifier
(s2varlst(*vars*), s2typ1(*body*))
|T2P1uni0 of // forall quantifier
(s2varlst(*vars*), s2typ1(*body*))
//
|T2P1trcd of
(
$BAS.trcdknd,sint(*npf*),l2t2p1lst)
//
|T2P1text of
(string(*name*), s2typ1lst(*args*))
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
s2typ1_s2typ(styp: s2typ): s2typ1
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
(styp: s2typ1, out0: FILR): void
fun
l2t2p1_fprint
(lt2p: l2t2p1, out0: FILR): void
//
#symload fprint with s2typ1_fprint of 1000
#symload fprint with l2t2p1_fprint of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_statyp2.sats] *)
(***********************************************************************)
