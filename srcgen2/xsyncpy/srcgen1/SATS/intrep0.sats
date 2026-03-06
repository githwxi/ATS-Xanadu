(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Sat Feb 21 09:40:52 PM EST 2026
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
T2Q = "./statyp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
LOC = "./\
../../../SATS/locinfo.sats"
//
#staload
D1E = "./\
../../../SATS/dynexp1.sats"
//
#staload
S2E = "./\
../../../SATS/staexp2.sats"
#staload
D2E = "./\
../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#typedef loc_t = $LOC.loc_t
#typedef loctn = $LOC.loctn
(* ****** ****** *)
#typedef sort2 = $S2E.sort2
#typedef s2exp = $S2E.s2exp
(* ****** ****** *)
#typedef d2var = $D2E.d2var
(* ****** ****** *)
//
#abstbox i0typ1_tbox // p0tr
#typedef i0typ1 = i0typ1_tbox
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox i0pat1_tbox // p0tr
#typedef i0pat1 = i0pat1_tbox
//
(* ****** ****** *)
//
#abstbox i0exp1_tbox // p0tr
#typedef i0exp1 = i0exp1_tbox
//
(* ****** ****** *)
//
#abstbox i0dcl1_tbox // p0tr
#typedef i0dcl1 = i0dcl1_tbox
//
(* ****** ****** *)
//
#abstbox i0valdcl1_tbox//p0tr
#abstbox i0vardcl1_tbox//p0tr
#abstbox i0fundcl1_tbox//p0tr
//
(* ****** ****** *)
//
#abstbox i0parsed1_tbox//p0tr
//
(* ****** ****** *)
#typedef i0valdcl1 = i0valdcl1_tbox
#typedef i0vardcl1 = i0vardcl1_tbox
#typedef i0fundcl1 = i0fundcl1_tbox
(* ****** ****** *)
#typedef i0parsed1 = i0parsed1_tbox
(* ****** ****** *)
#typedef i0valdcl1lst = list(i0valdcl1)
#typedef i0vardcl1lst = list(i0vardcl1)
#typedef i0fundcl1lst = list(i0fundcl1)
(* ****** ****** *)
#typedef i0dcl1lstopt = optn(i0dcl1lst)
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0lab(itm:type) =
|I0LAB of (label, itm(*elt*))
//
(* ****** ****** *)
//
fun
<x0:t0>
i0lab_itm$get
(ilab: i0lab(x0)): x0
#symload itm with i0lab_itm$get
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef l0i0t1 = i0lab(i0typ1)
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef l0i0p1 = i0lab(i0pat1)
#typedef l0i0e1 = i0lab(i0exp1)
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef i0typ1lst = list(i0typ1)
#typedef i0typ1opt = optn(i0typ1)
#typedef l0i0t1lst = list(l0i0t1)
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef i0pat1lst = list(i0pat1)
#typedef i0pat1opt = optn(i0pat1)
#typedef l0i0p1lst = list(l0i0p1)
//
(* ****** ****** *)
//
#typedef i0exp1lst = list(i0exp1)
#typedef i0exp1opt = optn(i0exp1)
#typedef l0i0e1lst = list(l0i0e1)
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef i0dcl1lst = list(i0dcl1)
//
(* ****** ****** *)
#typedef f1unarrw = $D1E.f1unarrw
#typedef wths2exp = $D2E.wths2exp
(* ****** ****** *)
//
#typedef i0dcl1lstopt = optn(i0dcl1lst)
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0typ1_node =
//
(* ****** ****** *)
|I0T1cst of s2cst//constant
|I0T1var of s2var//variable
(* ****** ****** *)
|I0T1lft of i0typ1//lft-value
(* ****** ****** *)
//
|I0T1apps of
(
i0typ1(*fun*),i0typ1lst(*args*))
|I0T1lam1 of
(
s2varlst(*args*), i0typ1(*body*))
//
(* ****** ****** *)
//
|I0T1exi0 of//exists.quantifier
(
s2varlst(*vars*), i0typ1(*body*))
|I0T1uni0 of//forall.quantifier
(
s2varlst(*vars*), i0typ1(*body*))
//
(* ****** ****** *)
//
|I0T1tcon of
(d2con, i0typ1lst(*args*))
//
|I0T1trcd of
(trcdknd, sint(*npf*), l0i0t1lst)
//
(* ****** ****** *)
//
|I0T1text of
(
string(*name*), i0typ1lst(*args*))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0typ1_sort$get
( dtyp: i0typ1 ): sort2
fun
i0typ1_node$get
( dtyp: i0typ1 ): i0typ1_node
//
#symload sort with i0typ1_sort$get
#symload node with i0typ1_node$get
//
(* ****** ****** *)
//
fun
i0typ1_fprint
(ityp: i0typ1, out0: FILR): void
#symload fprint with i0typ1_fprint of 1000
//
(* ****** ****** *)
//
fun
i0typ1_make_sort$node
(s2t0: sort2, node: i0typ1_node): i0typ1
#symload i0typ1 with i0typ1_make_sort$node
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0pat1_node =
//
(* ****** ****** *)
//
|I0P1any of ()
|I0P1var of d2var
//
(* ****** ****** *)
//
|I0P1int of sint
|I0P1btf of bool
|I0P1chr of token
|I0P1flt of token
|I0P1str of token
//
(* ****** ****** *)
//
|I0P1dap1 of
(i0pat1(*dcon*))
|I0P1dapp of
(i0pat1(*dcon*)
,sint(*npf*), i0pat1lst(*darg*))
//
(* ****** ****** *)
//
|I0P1rfpt of
(i0pat1,token(*AS*),i0pat1(*aspt*))
//
(* ****** ****** *)
//
|I0P1tup0 of (sint(*npf*),i0pat1lst)
|I0P1tup1 of
(token(*knd*),sint(*npf*),i0pat1lst)
|I0P1rcd2 of
(token(*knd*),sint(*npf*),l0i0p1lst)
//
(* ****** ****** *)
//
fun
i0pat1_lctn$get
( ipat: i0pat1 ): loctn
fun
i0pat1_ityp$get
( ipat: i0pat1 ): i0typ1
fun
i0pat1_node$get
( ipat: i0pat1 ): i0pat1_node
//
#symload lctn with i0pat1_lctn$get
#symload ityp with i0pat1_ityp$get
#symload node with i0pat1_node$get
//
(* ****** ****** *)
//
fun
i0pat1_fprint
(ipat: i0pat1, out0: FILR): void
#symload fprint with i0pat1_fprint of 1000
//
(* ****** ****** *)
//
fun
i0pat1_make_lctn$ityp$node
(loc0: loctn
,i0t0: i0typ1, node: i0pat1_node): i0pat1
#symload i0pat1 with i0pat1_make_lctn$ityp$node
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0exp1_node =
//
(* ****** ****** *)
//
|I0E1int of sint
|I0E1btf of bool
|I0E1chr of token
|I0E1flt of token
|I0E1str of token
//
(* ****** ****** *)
//
|I0E1seqn of
(i0exp1lst(*init*), i0exp1(*last*))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0exp1_lctn$get
( iexp: i0exp1 ): loctn
fun
i0exp1_ityp$get
( iexp: i0exp1 ): i0typ1
fun
i0exp1_node$get
( iexp: i0exp1 ): i0exp1_node
//
#symload lctn with i0exp1_lctn$get
#symload ityp with i0exp1_ityp$get
#symload node with i0exp1_node$get
//
(* ****** ****** *)
//
fun
i0exp1_fprint
(iexp: i0exp1, out0: FILR): void
#symload fprint with i0exp1_fprint of 1000
//
(* ****** ****** *)
//
fun
i0exp1_make_lctn$ityp$node
(loc0: loctn
,i0t0: i0typ1, node: i0exp1_node): i0exp1
#symload i0exp1 with i0exp1_make_lctn$ityp$node
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
teqi0exp1 =
|
TEQI0EXP1none of
(   (*void*)   )
|
TEQI0EXP1some of
(token(*EQ0*), i0exp1)
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0dcl1_node =
//
(* ****** ****** *)
|I0D1d3ecl of (d3ecl1)
(* ****** ****** *)
//
|I0D1static of
(token(*STATIC*), i0dcl1)
|I0D1extern of
(token(*EXTERN*), i0dcl1)
//
(* ****** ****** *)
//
|I0D1dclst0 of
(
  i0dcl1lst  )//guarded
|I0D1local0 of
( i0dcl1lst(*local-head*)
, i0dcl1lst(*local-body*))
//
(* ****** ****** *)
//
|I0Dinclude of
(sint(*s/d*)
,token, g1exp // src
,fpathopt, i0dcl1lstopt)//incl.
//
(* ****** ****** *)
//
|I0D1valdclst of
(token(*VAL(vlk)*), i0valdcl1lst)
|I0D1vardclst of
(token(*VAR(vrk)*), i0vardcl1lst)
//
|I0D1fundclst of
(token(*FUN(fnk)*)
,t2qaglst, d2cstlst, i0fundcl1lst)
//
(* ****** ****** *)
//
|I0D1errck of (sint(*lvl*), i0dcl1(*err*))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0dcl1_lctn$get
(idcl: i0dcl1): loctn
#symload lctn with i0dcl1_lctn$get
fun
i0dcl1_node$get
(idcl: i0dcl1): i0dcl1_node
#symload node with i0dcl1_node$get
//
fun
i0dcl1_fprint
(idcl: i0dcl1, out0: FILR): void
#symload fprint with i0dcl1_fprint of 1000
//
(* ****** ****** *)
//
fun
i0dcl1_make_lctn$node
(loc0: loctn, node: i0dcl1_node): i0dcl1
#symload i0dcl1 with i0dcl1_make_lctn$node
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0valdcl1_fprint
(ival: i0valdcl1, out0: FILR): void
fun
i0vardcl1_fprint
(ivar: i0vardcl1, out0: FILR): void
fun
i0fundcl1_fprint
(ifun: i0fundcl1, out0: FILR): void
//
#symload
fprint with i0valdcl1_fprint of 1000
#symload
fprint with i0vardcl1_fprint of 1000
#symload
fprint with i0fundcl1_fprint of 1000
//
(* ****** ****** *)
//
fun
i0valdcl1_lctn$get:(i0valdcl1)->loc_t
fun
i0vardcl1_lctn$get:(i0vardcl1)->loc_t
fun
i0fundcl1_lctn$get:(i0fundcl1)->loc_t
//
#symload lctn with i0valdcl1_lctn$get
#symload lctn with i0vardcl1_lctn$get
#symload lctn with i0fundcl1_lctn$get
//
(* ****** ****** *)
//
fun
i0valdcl1_ipat$get:(i0valdcl1)->i0pat1
(*
fun
i0valdcl1_wsxp$get:(i0valdcl1)->wths2exp
fun
i0valdcl1_dgrt$get:(i0valdcl1)->d3typ1opt
*)
fun
i0valdcl1_tixp$get:(i0valdcl1)->teqi0exp1
//
#symload ipat with i0valdcl1_ipat$get
#symload tixp with i0valdcl1_tixp$get(*opt*)
//
(* ****** ****** *)
//
#typedef s2expopt = optn(s2exp)
#typedef d2varopt = optn(d2var)
//
fun
i0vardcl1_dpid$get:(i0vardcl1)->d2var
fun
i0vardcl1_ityp$get:(i0vardcl1)->i0typ1
fun
i0vardcl1_vpid$get:(i0vardcl1)->d2varopt
fun
i0vardcl1_sres$get:(i0vardcl1)->s2expopt
fun
i0vardcl1_dini$get:(i0vardcl1)->teqi0exp1
//
#symload dpid with i0vardcl1_dpid$get
#symload styp with i0vardcl1_styp$get
#symload vpid with i0vardcl1_vpid$get(*opt*)
#symload sres with i0vardcl1_sres$get(*opt*)
#symload dini with i0vardcl1_dini$get(*opt*)
//
(* ****** ****** *)
//
fun
i0valdcl1_make_arg5
(lctn: loc_t
,ipat: i0pat1, dgrt: d3typ1opt
,tixp: teqi0exp1, wsxp: wths2exp): i0valdcl1
//
(* ****** ****** *)
//
fun
i0vardcl1_make_args
(lctn: loc_t
,dpid: d2var
,i0t1: i0typ1
,vpid: d2varopt
,sres: s2expopt, dini: teqi0exp1): i0vardcl1
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_intrep0.sats] *)
(***********************************************************************)
