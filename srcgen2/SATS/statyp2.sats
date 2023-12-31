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
(*
Fri 04 Nov 2022 04:28:36 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
HX-2023-06-23:
linearity is erased
but boxity is not erases!!!
*)
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
TMP = "./xstamp0.sats"
//
#typedef stamp = $TMP.stamp
//
(* ****** ****** *)
//
#staload
LAB = "./xlabel0.sats"
#staload
LOC = "./locinfo.sats"
//
#typedef lab_t = $LAB.lab_t
#typedef label = $LAB.label
//
#typedef loc_t = $LOC.loc_t
#typedef loctn = $LOC.loctn
#typedef lcsrc = $LOC.lcsrc
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
#staload "./xbasics.sats"
(* ****** ****** *)
#staload "./xstamp0.sats"
(* ****** ****** *)
#staload "./staexp2.sats"
(* ****** ****** *)
//
#abstbox x2t2p_tbox
#typedef x2t2p = x2t2p_tbox
//
(* ****** ****** *)
//
fun
x2t2p_get_lctn
(xt2p : x2t2p): loc_t
fun
x2t2p_get_stmp
(xt2p : x2t2p): stamp
fun
x2t2p_get_styp
(xt2p : x2t2p): s2typ
fun
x2t2p_set_styp
(xt2p:x2t2p,t2p0:s2typ): void
//
#symload lctn with x2t2p_get_lctn
#symload stmp with x2t2p_get_stmp
#symload styp with x2t2p_get_styp
#symload styp with x2t2p_set_styp
//
(* ****** ****** *)
//
fun
x2t2p_make_lctn
( loc0 : loc_t): x2t2p
#symload
x2t2p with x2t2p_make_lctn
//
(* ****** ****** *)
fun
x2t2p_fprint(FILR,x2t2p): void
(* ****** ****** *)
//
fun
the_s2typ_void((*void*)): s2typ
//
fun
the_s2typ_sint((*void*)): s2typ
fun
the_s2typ_bool((*void*)): s2typ
fun
the_s2typ_char((*void*)): s2typ
fun
the_s2typ_dflt((*void*)): s2typ
fun
the_s2typ_strn((*void*)): s2typ
//
(* ****** ****** *)
//
fun
the_s2typ_p1tr0((*void*)): s2typ
//
fun
the_s2typ_p2tr0((*void*)): s2typ
fun
the_s2typ_p2at0((*void*)): s2typ
//
fun
the_s2typ_p2tr1(elt:s2typ): s2typ
fun
the_s2typ_p2at1(elt:s2typ): s2typ
//
(* ****** ****** *)
fun
the_s2typ_l0azy0((*void*)): s2typ
fun
the_s2typ_l0azy1(elt:s2typ): s2typ
(* ****** ****** *)
fun
the_s2typ_l1azy0((*void*)): s2typ
fun
the_s2typ_l1azy1(elt:s2typ): s2typ
(* ****** ****** *)
fun
the_s2typ_excptn( (*void*) ): s2typ
(* ****** ****** *)
//
datatype
s2typ_node =
//
(*
|T2Pbas of sym_t // type
*)
//
|T2Pcst of s2cst // constant
|T2Pvar of s2var // variable
//
|T2Plft of (s2typ) // left-value
//
|T2Pxtv of (x2t2p) // exist. var.
//
(* ****** ****** *)
//
|T2Ptop0 of (s2typ) // uninitized
|T2Ptop1 of (s2typ) // delineared
//
(* ****** ****** *)
//
// HX: ~/!/& = 0/1/-1
// knd: 0/1/-1//cbv0/v1/rf
|
T2Parg1 of
(sint(*knd*), s2typ)
|
T2Patx2 of // HX: bef=arg1
(//sint(*knd*)//knd = 1/-1
 s2typ(*bef*), s2typ(*aft*))
//
(* ****** ****** *)
//
|
T2Papps of
(s2typ(*fun*), s2typlst) // inst.
|
T2Plam1 of
(s2varlst(*arg*), s2typ) // abst.
//
|
T2Pf2cl of f2clknd
|
T2Pfun1 of
( s2typ // f2clknd
, sint(*npf*)
, s2typlst(*arg*), s2typ(*res*) )
// (* end of T2Pfun1 *)
//
| // external
T2Ptext of
(string(*name*), s2typlst(*arg*))
//
|
T2Pexi0 of // exists quantifier
(s2varlst(*vars*), s2typ(*body*))
|
T2Puni0 of // forall quantifier
(s2varlst(*vars*), s2typ(*body*))
//
|
T2Ptrcd of
(trcdknd(*knd*), sint(*npf*), l2t2plst)
//
|T2Pnone0 of ((*0*)) // HX: optional
|T2Pnone1 of (s2typ) | T2Ps2exp of (s2exp)
//
|T2Perrck of (int(*lvl*), s2typ)//HX:tread-error
//
// end of [s2type_node] // end of [ datatype(...) ]
//
(* ****** ****** *)
fun
s2typ_linq(s2typ): bool
fun
s2typ_prfq(s2typ): bool
(* ****** ****** *)
fun
s2typ_cbrfq(s2typ): bool
fun
s2typ_dataq(s2typ): bool
(* ****** ****** *)
//
fun
s2typ_fprint:(FILR,s2typ)->void
//
(* ****** ****** *)
fun
s2typ_get_sort(s2typ): sort2
fun
l2t2p_get_sort(l2t2p): sort2
fun
s2typ_get_node(s2typ): s2typ_node
fun
l2t2p_get_node(l2t2p): s2typ_node
(* ****** ****** *)
#symload sort with s2typ_get_sort
#symload sort with l2t2p_get_sort
#symload node with s2typ_get_node
#symload node with l2t2p_get_node
(* ****** ****** *)
//
fun
s2typ_var(s2v: s2var): s2typ
fun
s2typ_cst(s2c: s2cst): s2typ
//
(* ****** ****** *)
fun
s2typ_xtv(xtp: x2t2p): s2typ
(* ****** ****** *)
fun
s2typ_lft(t2p: s2typ): s2typ
(* ****** ****** *)
fun
s2typ_f2cl( f2clknd ): s2typ
(* ****** ****** *)
//
fun
s2typ_none0((*void*)): s2typ
fun
s2typ_none1(t2p0:s2typ): s2typ
fun
s2typ_s2exp(s2e0:s2exp): s2typ
//
(* ****** ****** *)
fun
s2typ_tup0
(npf1:sint,t2ps:s2typlst): s2typ
fun
s2typ_tup1
(trcdknd(*tknd*)
,npf1:sint,t2ps:s2typlst): s2typ
fun
s2typ_rcd2
(trcdknd(*tknd*)
,npf1:sint,ltps:l2t2plst): s2typ
(* ****** ****** *)
//
(*
fun
s2typ_unargx(t2p0: s2typ): s2typ
fun
s2typ_untopx(t2p0: s2typ): s2typ
*)
//
fun
s2typ_unmodx(t2p0: s2typ): s2typ
//
(* ****** ****** *)
fun
s2typ_make_node
(srt:sort2,nod:s2typ_node): s2typ
#symload s2typ with s2typ_make_node
(* ****** ****** *)
//
#typedef
s2vts = list@(s2var, s2typ)
//
(* ****** ****** *)
//
fun
s2vts_search_opt
( s2vts, s2var ): s2typopt_vt
//
(* ****** ****** *)
//
fun
s2vts_make_s2vs_t2ps
( s2vs: s2varlst,
  t2ps: s2typlst): (s2vts)
#symload
s2vts with s2vts_make_s2vs_t2ps
//
(* ****** ****** *)
//
fun
s2typ_prjout_opt
( s2typ, label ): s2typopt_vt
//
(* ****** ****** *)
//
fun
s2typ_p1tr0q(t2p0:s2typ): bool
//
fun
s2typ_p2tr0q(t2p0:s2typ): bool
fun
s2typ_p2tr1q(t2p0:s2typ): bool
(* ****** ****** *)
//
fun
s2typ_l0azy0q(t2p0:s2typ): bool
fun
s2typ_l0azy1q(t2p0:s2typ): bool
//
fun
s2typ_l1azy0q(t2p0:s2typ): bool
fun
s2typ_l1azy1q(t2p0:s2typ): bool
//
(* ****** ****** *)
//
fun // HX: for
s2typ_xtpck0 // occurs-check
(t2p0:s2typ, xtp0:x2t2p): bool
fun // HX: for
s2typlst_xtpck0 // occurs-check
(t2ps:s2typlst, xtp0:x2t2p): bool
fun // HX: for
l2t2plst_xtpck0 // occurs-check
(ltps:l2t2plst, xtp0:x2t2p): bool
//
(* ****** ****** *)
(*
HX-2023-05-21:
For eliminating
non-impredicative quantifiers
*)
fun
s2varlst_imprq(s2varlst): s2varlst
(* ****** ****** *)
//
fun
s2exp_stpize(s2e0:s2exp): ( s2typ )
fun
s2explst_stpize(s2explst): s2typlst
fun
l2s2elst_stpize(l2s2elst): l2t2plst
#symload stpize with s2exp_stpize
#symload stpize with s2explst_stpize
#symload stpize with l2s2elst_stpize
//
(* ****** ****** *)
//
fun
s2typ_hnfiz0
(t2p0: s2typ): s2typ
fun
s2typlst_hnfiz0
(t2ps: s2typlst): s2typlst
//
fun
s2typ_subst0
(t2p0:s2typ,svts:s2vts): s2typ
fun
s2typlst_subst0
( t2ps
: s2typlst, svts: s2vts): s2typlst
//
(* ****** ****** *)
//
fun
<e1nv:vwtp>
s2typ_eval$s2cst
( e1nv: !e1nv
, s2c0: s2cst): s2typopt_vt
fun
<e1nv:vwtp>
s2typ_eval$s2var
( e1nv: !e1nv
, s2v0: s2var): s2typopt_vt
//
(* ****** ****** *)
//
fun
<e1nv:vwtp>
s2typ_hnfiz0_e1nv
(e1nv: !e1nv, t2p0: s2typ): s2typ
fun
<e1nv:vwtp>
s2typ_subst0_e1nv
( e1nv: !e1nv
, t2p0: s2typ, svts: s2vts): s2typ
//
(* ****** ****** *)
//
fun<>
unify00_s2typ$xset
(xt2p: x2t2p, t2p2: s2typ): (void)
//
fun
<e1nv:vwtp>
unify00_s2typ_e1nv
( e1nv: !e1nv
, t2p1: s2typ, t2p2: s2typ): (bool)
fun
<e1nv:vwtp>
match00_s2typ_e1nv
( e1nv: !e1nv
, t2p1: s2typ, t2p2: s2typ): (bool)
//
(* ****** ****** *)
//
fun
<e1nv:vwtp>
s2typ_hnfizx_e1nv
( e1nv: !e1nv
, t2p0: s2typ, flag: &sint >> _): s2typ
//
(* ****** ****** *)
//
fun
<e1nv:vwtp>
s2typ_substx_e1nv
( e1nv: !e1nv
, t2p0: s2typ
, svts: s2vts, flag: &sint >> _): s2typ
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_statyp2.sats] *)
