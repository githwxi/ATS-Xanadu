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
Thu Sep 18 02:05:37 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/staexp1.sats"
#staload
"./../SATS/staexp2.sats"
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp2.sats"
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/tryltck.sats"
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
#symload <
with sint_lt$sint of 1099
#symload >
with sint_gt$sint of 1099
#symload =
with sint_eq$sint of 1099
#symload <=
with sint_lte$sint of 1099
#symload >=
with sint_gte$sint of 1099
#symload !=
with sint_neq$sint of 1099
//
#symload +
with sint_add$sint of 1099
#symload -
with sint_sub$sint of 1099
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat1_errck
(lvl0: sint
,d3p0: d3pat1): d3pat1 =
(
let
val loc0 = d3p0.lctn()
val styp = d3p0.styp()
in//let
d3pat1_make_lctn$styp$node
(loc0,styp,D3P1errck(lvl0,d3p0))
end//let
)(*case+*)//end(d3pat1_errck(...))
//
(* ****** ****** *)
//
fun
d3exp1_errck
(lvl0: sint
,d3e0: d3exp1): d3exp1 =
(
let
val loc0 = d3e0.lctn()
val dtyp = d3e0.dtyp()
in//let
d3exp1_make_lctn$dtyp$node
(loc0,dtyp,D3E1errck(lvl0,d3e0))
end//let
)(*case+*)//end(d3exp1_errck(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat1_errvl
(d3p0: d3pat1): sint =
(
case+ d3p0.node() of
|
D3P1errck
(lvl0, _) => lvl0 | _ => 0)
#symload errvl with d3pat1_errvl
//
fun
d3pat1_errvl_a2
(d3p1: d3pat1
,d3p2: d3pat1): sint =
maxs(errvl(d3p1), errvl(d3p2))
#symload errvl with d3pat1_errvl_a2
//
(* ****** ****** *)
//
fun
d3pat1lst_errvl
(d3ps: d3pat1lst): sint =
(
list_folditm
<x0><r0>(d3ps, 0(*lvl*))
) where
{
//
#typedef r0 = sint
#typedef x0 = d3pat1
#typedef xs = d3pat1lst
//
#impltmp
folditm$fopr
<x0><r0>(r0, x0) =
let
val x0 =
d3pat1_errvl(x0) in//let
(if r0 >= x0 then r0 else x0) end
//
}(*where*)//end-of(d3pat1lst_errvl)
#symload errvl with d3pat1lst_errvl
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_errvl
(d3e0: d3exp1): sint =
(
case+ d3e0.node() of
|
D3E1errck
(lvl0, _) => lvl0 | _ => 0)
#symload errvl with d3exp1_errvl
//
fun
d3exp1_errvl_a2
(d3e1: d3exp1
,d3e2: d3exp1): sint =
maxs(errvl(d3e1), errvl(d3e2))
#symload errvl with d3exp1_errvl_a2
//
(* ****** ****** *)
//
fun
d3exp1lst_errvl
(d3es: d3exp1lst): sint =
(
list_folditm
<x0><r0>(d3es, 0(*lvl*))
) where
{
//
#typedef r0 = sint
#typedef x0 = d3exp1
#typedef xs = d3exp1lst
//
#impltmp
folditm$fopr
<x0><r0>(r0, x0) =
let
val x0 =
d3exp1_errvl(x0) in//let
(if r0 >= x0 then r0 else x0) end
//
}(*where*)//end-of(d3exp1lst_errvl)
#symload errvl with d3exp1lst_errvl
//
(* ****** ****** *)
//
fun
d3exp1opt_errvl
(dopt: d3exp1opt): sint =
(
case+ dopt of
| optn_nil() => 0
| optn_cons(dexp) => errvl(dexp) )
#symload errvl with d3exp1opt_errvl
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3cls1_errvl
(dcls: d3cls1): sint =
(
case+
dcls.node() of
|D3CLS1gpt
(  dgpt  ) => (   0   )
|D3CLS1cls
(dgpt, d3e1) => errvl(d3e1))
#symload errvl with d3cls1_errvl
//
fun
d3cls1lst_errvl
(dcls: d3cls1lst): sint =
(
case+ dcls of
|list_nil
( (*void*) ) => (   0   )
|list_cons
(dcl1, dcls) =>
maxs(
errvl(dcl1), d3cls1lst_errvl(dcls))
)(*case+*)//end-of-(d3cls1lst_errvl)
//
#symload errvl with d3cls1lst_errvl
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat1_bang_errck
(loc0: loc_t
,t2q0: s2typ1
,d3p1: d3pat1   ): d3pat1 =
let
val lvl0 = errvl(d3p1) in//let
d3pat1_errck
(
lvl0+1,
d3pat1_make_lctn$styp$node
  (loc0, t2q0, D3P1bang(  d3p1  )))
endlet//end-of-[d3pat1_bang_errck(...)]
//
(* ****** ****** *)
//
fun
d3pat1_flat_errck
(loc0: loc_t
,t2q0: s2typ1
,d3p1: d3pat1   ): d3pat1 =
let
val lvl0 = errvl(d3p1) in//let
d3pat1_errck
(
lvl0+1,
d3pat1_make_lctn$styp$node
  (loc0, t2q0, D3P1flat(  d3p1  )))
endlet//end-of-[d3pat1_flat_errck(...)]
//
(* ****** ****** *)
//
fun
d3pat1_free_errck
(loc0: loc_t
,t2q0: s2typ1
,d3p1: d3pat1   ): d3pat1 =
let
val lvl0 = errvl(d3p1) in//let
d3pat1_errck
(
lvl0+1,
d3pat1_make_lctn$styp$node
  (loc0, t2q0, D3P1free(  d3p1  )))
endlet//end-of-[d3pat1_free_errck(...)]
//
(* ****** ****** *)
//
fun
d3pat1_tapq_errck
(loc0: loc_t
,t2q0: s2typ1
,d3f0: d3pat1
,tjas: t2jag1lst): d3pat1 =
let
val lvl0 = errvl(d3f0) in//let
d3pat1_errck
(
lvl0+1,
d3pat1_make_lctn$styp$node
  (loc0, t2q0, D3P1tapq(d3f0, tjas)))
endlet//end-of-[d3pat1_tapq_errck(...)]
//
(* ****** ****** *)
//
fun
d3pat1_dapp_errck
(loc0: loc_t
,t2q0: s2typ1
,d3f0: d3pat1
,npf1: (sint)
,d3ps: d3pat1lst): d3pat1 =
let
//
val
lvl0 = maxs
(errvl(d3f0), errvl(d3ps))
//
in//let
(
d3pat1_errck
(
lvl0+1,
d3pat1(loc0,
  t2q0, D3P1dapp(d3f0, npf1, d3ps))))
endlet//end-of-[d3pat1_dapp_errck(...)]
//
(* ****** ****** *)
//
fun
d3pat1_tup0_errck
(loc0: loc_t
,t2q0: s2typ1
,npf1: (sint)
,d3ps: d3pat1lst): d3pat1 =
let
//
val
lvl0 = errvl(d3ps) in//let
//
d3pat1_errck
(
lvl0+1,
d3pat1_make_lctn$styp$node
  (loc0, t2q0, D3P1tup0(npf1, d3ps)))
//
endlet//end-of-[d3pat1_tup0_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat1_argtp_errck
(loc0: loc_t
,t2q0: s2typ1
,d3p1: d3pat1
,t2q2: s2typ1   ): d3pat1 =
let
//
val
lvl0 = errvl(d3p1) in//let
//
d3pat1_errck
(
lvl0+1,
d3pat1_make_lctn$styp$node
  (loc0, t2q0, D3P1argtp(d3p1, t2q2)))
//
endlet//end-of-[d3pat1_argtp_errck(...)]
//
(* ****** ****** *)
//
fun
d3pat1_annot_errck
(loc0: loc_t
,t2q0: s2typ1
,d3p1: d3pat1
,s1e2: (s1exp)
,s2e2: (s2exp)
,t2q2: (s2typ1) ): d3pat1 =
let
//
val
lvl0 = errvl(d3p1) in//let
//
d3pat1_errck(
lvl0+1,
d3pat1_make_lctn$styp$node
(loc0
,t2q0,D3P1annot(d3p1,s1e2,s2e2,t2q2)))
//
endlet//end-of-[d3pat1_annot_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_dapp_errck
(loc0: loc_t
,t3q0: d3typ1
,d3f0: d3exp1
,npf1: (sint)
,d3es: d3exp1lst): d3exp1 =
let
//
val
lvl0 = maxs
(errvl(d3f0), errvl(d3es))
//
in//let
//
d3exp1_errck
(
lvl0+1,
d3exp1(
  loc0,t3q0,D3E1dapp(d3f0,npf1,d3es)))
//
endlet//end-of-[d3exp1_dapp_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_proj_errck
(loc0: loc_t
,t3q0: d3typ1
,tknd: token
,lab1: label
,dtup: d3exp1   ): d3exp1 =
let
//
val
lvl0 = errvl(dtup)
//
in//let
//
d3exp1_errck
(
lvl0+1,
d3exp1(
  loc0,t3q0,D3E1proj(tknd,lab1,dtup)))
//
endlet//end-of-[d3exp1_proj_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_let1_errck
( loc0
: loc_t
, t3q0: d3typ1
, dcls: d3ecl1lst
, d3e1: d3exp1
, dvts: dvstp1lst): d3exp1 =
let
//
val
lvl0 = errvl(d3e1)
//
in//let
//
d3exp1_errck
(
lvl0+1,
d3exp1(
  loc0,t3q0,D3E1let1(dcls,d3e1,dvts)))
//
endlet//end-of-[d3exp1_let1_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_ift0_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1
,dthn: d3exp1opt
,dels: d3exp1opt): d3exp1 =
let
//
val
lvl0 = maxs
(errvl(d3e1)
,errvl(dthn), errvl(dels))
//
in//let
//
d3exp1_errck
(
lvl0+1,
d3exp1(
  loc0,t3q0,D3E1ift0(d3e1,dthn,dels)))
//
endlet//end-of-[d3exp1_ift0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_cas0_errck
(loc0: loc_t
,t3q0: d3typ1
,tknd: token
,d3e1: d3exp1
,dcls: d3cls1lst): d3exp1 =
let
//
val
lvl0 = maxs
(errvl(d3e1), errvl(dcls))
//
in//let
d3exp1_errck
(
lvl0+1,
d3exp1(
  loc0,t3q0,D3E1cas0(tknd,d3e1,dcls)))
endlet // end of [d3exp1_cas0_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_seqn_errck
(loc0: loc_t
,t3q0: d3typ1
,d3es: d3exp1lst
,d3e1: d3exp1   ): d3exp1 =
let
//
val
lvl0 = maxs
(errvl(d3es), errvl(d3e1))
//
in//let
//
d3exp1_errck
( lvl0+1
, d3exp1
  (loc0, t3q0, D3E1seqn(d3es, d3e1)))
//
endlet//end-of-[d3exp1_seqn_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_tup0_errck
(loc0: loc_t
,t3q0: d3typ1
,npf1: (sint)
,d3es: d3exp1lst): d3exp1 =
let
//
val
lvl0 =
errvl(d3es) in//let
d3exp1_errck
( lvl0+1
, d3exp1
  (loc0, t3q0, D3E1tup0(npf1, d3es)))
//
endlet//end-of-[d3exp1_tup0_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_tup1_errck
(loc0: loc_t
,t3q0: d3typ1
,tknd: token
,npf1: (sint)
,d3es: d3exp1lst): d3exp1 =
let
//
val
lvl0 =
errvl(d3es) in//let
d3exp1_errck
(
lvl0+1,
d3exp1
( loc0
, t3q0, D3E1tup1(tknd, npf1, d3es)))
//
endlet//end-of-[d3exp1_tup1_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_lam1_errck
( loc0
: loc_t
, t3q0
: d3typ1
, tknd
: token
, f3as
: f3arg1lst
, f3bs
: f3axp1lst
, evts
: dvdtp1lst
, sres: s2res
, arrw: f1unarrw
, d3e1: d3exp1
, vts1: dvstp1lst
, vts2: dvdtp1lst): d3exp1 =
let
//
val
lvl0 = errvl(d3e1)
//
in//let
//
d3exp1_errck
(
lvl0+1,
d3exp1(
loc0, t3q0,
D3E1lam1(
tknd, f3as, f3bs,
evts, sres, arrw, d3e1, vts1, vts2)))
//
endlet//end-of-[d3exp1_lam1_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_flat_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1   ): d3exp1 =
let
//
val
lvl0 =
errvl(d3e1) in//let
d3exp1_errck
( lvl0+1
, d3exp1(loc0, t3q0, D3E1flat(d3e1)))
//
endlet//end-of-[d3exp1_flat_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_free_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1   ): d3exp1 =
let
//
val
lvl0 =
errvl(d3e1) in//let
d3exp1_errck
( lvl0+1
, d3exp1(loc0, t3q0, D3E1free(d3e1)))
//
endlet//end-of-[d3exp1_free_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_dl0az_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1   ): d3exp1 =
let
//
val
lvl0 =
errvl(d3e1) in//let
d3exp1_errck
( lvl0+1
, d3exp1(loc0, t3q0, D3E1dl0az(d3e1)))
//
endlet//end-of-[d3exp1_dl0az_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_dl1az_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1   ): d3exp1 =
let
//
val
lvl0 =
errvl(d3e1) in//let
d3exp1_errck
( lvl0+1
, d3exp1(loc0, t3q0, D3E1dl1az(d3e1)))
//
endlet//end-of-[d3exp1_dl1az_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_assgn_errck
(loc0: loc_t
,t3q0: d3typ1
,d3el: d3exp1
,d3er: d3exp1   ): d3exp1 =
let
//
val
lvl0 =
errvl
(d3el, d3er) in//let
//
d3exp1_errck
( lvl0+1
, d3exp1_make_lctn$dtyp$node
  (loc0, t3q0, D3E1assgn(d3el,d3er)))
//
endlet//end-of-[d3exp1_assgn_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_xazgn_errck
(loc0: loc_t
,t3q0: d3typ1
,d3el: d3exp1
,d3er: d3exp1   ): d3exp1 =
let
//
val
lvl0 =
errvl
(d3el, d3er) in//let
//
d3exp1_errck
( lvl0+1
, d3exp1_make_lctn$dtyp$node
  (loc0, t3q0, D3E1xazgn(d3el,d3er)))
//
endlet//end-of-[d3exp1_xazgn_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_xchng_errck
(loc0: loc_t
,t3q0: d3typ1
,d3el: d3exp1
,d3er: d3exp1   ): d3exp1 =
let
//
val
lvl0 =
errvl
(d3el, d3er) in//let
//
d3exp1_errck
( lvl0+1
, d3exp1_make_lctn$dtyp$node
  (loc0, t3q0, D3E1xchng(d3el,d3er)))
//
endlet//end-of-[d3exp1_xchng_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_l0az1_errck
( loc0: loc_t
, t3q0: d3typ1
, dsym: d1exp
, evts: dvdtp1lst
, d3e1: d3exp1
, vts1: dvdtp1lst): d3exp1 =
let
//
val
lvl0 =
errvl(d3e1) in//let
//
d3exp1_errck
(
lvl0+1,
d3exp1_make_lctn$dtyp$node
( loc0, t3q0,
  D3E1l0az1(dsym, evts, d3e1, vts1)))
//
endlet//end-of-[d3exp1_l0az1_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_l1az1_errck
( loc0: loc_t
, t3q0: d3typ1
, dsym: d1exp
, evts: dvdtp1lst
, d3e1: d3exp1
, vts1: dvdtp1lst
, d3es: d3exp1lst
, vts2: dvdtp1lst): d3exp1 =
let
val
lvl0 =
maxs
(errvl(d3e1)
,errvl(d3es)) in//let
//
d3exp1_errck
(
lvl0+1,
d3exp1_make_lctn$dtyp$node
(
loc0, t3q0,
D3E1l1az1(
dsym, evts, d3e1, vts1, d3es, vts2)))
//
endlet//end-of-[d3exp1_l1az1_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_dvdtp_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1
,dvts: dvdtp1lst): d3exp1 =
let
//
val
lvl0 =
errvl(d3e1) in//let
//
d3exp1_errck
( lvl0+1
, d3exp1_make_lctn$dtyp$node
  (loc0, t3q0, D3E1dvdtp(d3e1,dvts)))
//
endlet//end-of-[d3exp1_dvdtp_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_delin_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1
,tlin: d3typ1   ): d3exp1 =
let
//
val
lvl0 =
errvl(d3e1) in//let
//
(
d3exp1_errck
(
lvl0+1,
d3exp1_make_lctn$dtyp$node
( loc0, t3q0, D3E1delin(d3e1, tlin))))
//
endlet//end-of-[d3exp1_delin_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_exlin_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1
,tlin: d3typ1   ): d3exp1 =
let
//
val
lvl0 =
errvl(d3e1) in//let
//
(
d3exp1_errck
(
lvl0+1,
d3exp1_make_lctn$dtyp$node
( loc0, t3q0, D3E1exlin(d3e1, tlin))))
//
endlet//end-of-[d3exp1_exlin_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_t2pck_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1
,t2q1: s2typ1
,t2q2: s2typ1   ): d3exp1 =
let
//
val
lvl0 =
errvl(d3e1) in//let
//
(
d3exp1_errck
(
lvl0+1,
d3exp1_make_lctn$dtyp$node
( loc0
, t3q0, D3E1t2pck(d3e1, t2q1, t2q2))))
//
endlet//end-of-[d3exp1_t2pck_errck(...)]
//
(* ****** ****** *)
//
fun
d3exp1_t2ped_errck
(loc0: loc_t
,t3q0: d3typ1
,d3e1: d3exp1
,t2q1: s2typ1
,t2q2: s2typ1   ): d3exp1 =
let
//
val
lvl0 =
errvl(d3e1) in//let
//
(
d3exp1_errck
(
lvl0+1,
d3exp1_make_lctn$dtyp$node
( loc0
, t3q0, D3E1t2ped(d3e1, t2q1, t2q2))))
//
endlet//end-of-[d3exp1_t2ped_errck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3pat1_tryltck
( dpat, err0 ) =
(
case+
dpat.node() of
//
|D3P1any _ => dpat
|D3P1var _ => dpat
//
|D3P1int _ => dpat
|D3P1btf _ => dpat
|D3P1chr _ => dpat
|D3P1flt _ => dpat
|D3P1str _ => dpat
//
(* ****** ****** *)
|D3P1con _ => dpat
(* ****** ****** *)
//
|D3P1bang _ =>
(
  f0_bang(dpat, err0))
//
|D3P1flat _ =>
(
  f0_flat(dpat, err0))
//
|D3P1free _ =>
(
  f0_free(dpat, err0))
//
(* ****** ****** *)
//
|D3P1tapq _ =>
(
  f0_tapq(dpat, err0))
//
(* ****** ****** *)
//
|D3P1dap1 _ => (dpat)
//
|D3P1dapp _ =>
(
  f0_dapp(dpat, err0))
//
(* ****** ****** *)
//
|D3P1tup0 _ =>
(
  f0_tup0(dpat, err0))
//
(* ****** ****** *)
//
|D3P1argtp _ =>
(
  f0_argtp(dpat, err0))
|D3P1annot _ =>
(
  f0_annot(dpat, err0))
//
(* ****** ****** *)
//
| _(*otherwise*) =>
let
val () = err0 := err0+1 in
(
  d3pat1_errck(1(*lvl*), dpat)) end
//
(* ****** ****** *)
//
) where
{
//
(* ****** ****** *)
//
fun
f0_bang
(d3p0: d3pat1
,err0: &sint >> _): d3pat1 =
let
//
val nerr = err0
//
val t2q0 = d3p0.styp()
//
val-
D3P1bang
(   d3p1   ) = d3p0.node()
//
val d3p1 =
(
  d3pat1_tryltck(d3p1, err0))
in//let
//
if // if
(err0=nerr)
then (d3p0) else
let
val loc0 = d3p0.lctn()
in//let
(
d3pat1_bang_errck(loc0,t2q0,d3p1))
end//let
//
end(*let*)//end-of-[f0_bang(d3p0,err0)]
//
(* ****** ****** *)
//
fun
f0_flat
(d3p0: d3pat1
,err0: &sint >> _): d3pat1 =
let
//
val nerr = err0
//
val t2q0 = d3p0.styp()
//
val-
D3P1flat
(   d3p1   ) = d3p0.node()
//
val d3p1 =
(
  d3pat1_tryltck(d3p1, err0))
in//let
//
if // if
(err0=nerr)
then (d3p0) else
let
val loc0 = d3p0.lctn()
in//let
(
d3pat1_flat_errck(loc0,t2q0,d3p1))
end//let
//
end(*let*)//end-of-[f0_flat(d3p0,err0)]
//
(* ****** ****** *)
//
fun
f0_free
(d3p0: d3pat1
,err0: &sint >> _): d3pat1 =
let
//
val nerr = err0
//
val t2q0 = d3p0.styp()
//
val-
D3P1free
(   d3p1   ) = d3p0.node()
//
val d3p1 =
(
  d3pat1_tryltck(d3p1, err0))
in//let
//
if // if
(err0=nerr)
then (d3p0) else
let
val loc0 = d3p0.lctn()
in//let
(
d3pat1_free_errck(loc0,t2q0,d3p1))
end//let
//
end(*let*)//end-of-[f0_free(d3p0,err0)]
//
(* ****** ****** *)
//
fun
f0_tapq
(d3p0: d3pat1
,err0: &sint >> _): d3pat1 =
let
//
val nerr = err0
//
val t2q0 = d3p0.styp()
//
val-
D3P1tapq
(d3f0, tjas) = d3p0.node()
//
val d3f0 =
(
  d3pat1_tryltck(d3f0, err0))
in//let
//
if // if
(err0=nerr)
then (d3p0) else
(
  d3pat1_tapq_errck
  (d3p0.lctn(), t2q0, d3f0, tjas))
//
end(*let*)//end-of-[f0_tapq(d3p0,err0)]
//
(* ****** ****** *)
//
fun
f0_dapp
(d3p0: d3pat1
,err0: &sint >> _): d3pat1 =
let
//
val nerr = err0
//
val t2q0 = d3p0.styp()
//
val-
D3P1dapp
(d3f0
,npf1, d3ps) = d3p0.node()
//
val d3f0 =
(
  d3pat1_tryltck(d3f0, err0))
val d3ps =
(
  d3pat1lst_tryltck(d3ps, err0))
in//let
//
if // if
(err0=nerr)
then (d3p0) else
let
val loc0 = d3p0.lctn()
in//let
(
  d3pat1_dapp_errck
  (loc0, t2q0, d3f0, npf1, d3ps))
end//let
//
end(*let*)//end-of-[f0_dapp(d3p0,err0)]
//
(* ****** ****** *)
//
fun
f0_tup0
(d3p0: d3pat1
,err0: &sint >> _): d3pat1 =
let
//
val nerr = err0
//
val t2q0 = d3p0.styp()
//
val-
D3P1tup0
( npf1, d3ps) = d3p0.node()
//
val d3ps =
(
  d3pat1lst_tryltck(d3ps, err0))
//
in//let
if // if
(err0=nerr)
then (d3p0) else
(
  d3pat1_tup0_errck
  (d3p0.lctn(), t2q0, npf1, d3ps))
end(*let*)//end-of-[f0_tup0(d3p0,err0)]
//
(* ****** ****** *)
//
fun
f0_argtp
(d3p0: d3pat1
,err0: &sint >> _): d3pat1 =
let
//
val nerr = err0
//
val t2q0 = d3p0.styp()
//
val-
D3P1argtp
(d3p1,t2q2) = d3p0.node()
//
val d3p1 =
(
  d3pat1_tryltck(d3p1, err0))
//
in//let
if // if
(err0=nerr)
then (d3p0) else
(
  d3pat1_argtp_errck
  (d3p0.lctn(), t2q0, d3p1, t2q2))
end(*let*)//end-of-[f0_argtp(d3p0,err0)]
//
(* ****** ****** *)
//
fun
f0_annot
(d3p0: d3pat1
,err0: &sint >> _): d3pat1 =
let
//
val nerr = err0
//
val t2q0 = d3p0.styp()
//
val-
D3P1annot
(d3p1
,s1e2
,s2e2,t2q2) = d3p0.node()
//
val d3p1 =
(
  d3pat1_tryltck(d3p1, err0))
//
in//let
if // if
(err0=nerr)
then (d3p0) else
let
val loc0 =
d3p0.lctn() in//let
(
d3pat1_annot_errck(
  loc0, t2q0, d3p1, s1e2, s2e2, t2q2))
end//let
end(*let*)//end-of-[f0_annot(d3p0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val loc0 = d3p0.lctn()
val (  ) =
prerrsln("d3pat1_tryltck: loc0 = ", loc0)
val (  ) =
prerrsln("d3pat1_tryltck: dpat = ", dpat)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[d3pat1_tryltck(dpat,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3exp1_tryltck
( dexp, err0 ) =
(
case+
dexp.node() of
//
(* ****** ****** *)
//
|D3E1var _ => dexp
//
(* ****** ****** *)
//
|D3E1int _ => dexp
|D3E1btf _ => dexp
|D3E1chr _ => dexp
|D3E1flt _ => dexp
|D3E1str _ => dexp
//
(* ****** ****** *)
//
|D3E1top _ => dexp
//
(* ****** ****** *)
//
|D3E1sapp _ => dexp
|D3E1sapq _ => dexp
//
(* ****** ****** *)
//
|D3E1tapp _ => dexp
|D3E1tapq _ => dexp
//
(* ****** ****** *)
//
|D3E1dap0 _ => (dexp)
|D3E1dapp _ =>
(
  f0_dapp(dexp, err0))
//
(* ****** ****** *)
//
|D3E1proj _ =>
(
  f0_proj(dexp, err0))
//
(* ****** ****** *)
//
|D3E1let0 _ => (dexp)
|D3E1let1 _ =>
(
  f0_let1(dexp, err0))
//
(* ****** ****** *)
//
|D3E1ift0 _ =>
(
  f0_ift0(dexp, err0))
//
|D3E1cas0 _ =>
(
  f0_cas0(dexp, err0))
//
(* ****** ****** *)
//
|D3E1seqn _ =>
(
  f0_seqn(dexp, err0))
//
(* ****** ****** *)
//
|D3E1tup0 _ =>
(
  f0_tup0(dexp, err0))
//
|D3E1tup1 _ =>
(
  f0_tup1(dexp, err0))
//
(* ****** ****** *)
//
|D3E1lam0 _ => (dexp)
|D3E1lam1 _ =>
(
  f0_lam1(dexp, err0))
//
(* ****** ****** *)
//
|D3E1addr _ => (dexp)
//
|D3E1flat _ =>
(
  f0_flat(dexp, err0))
//
(* ****** ****** *)
//
|D3E1free _ =>
(
  f0_free(dexp, err0))
//
(* ****** ****** *)
//
|D3E1dl0az _ =>
(
  f0_dl0az(dexp, err0))
|D3E1dl1az _ =>
(
  f0_dl1az(dexp, err0))
//
(* ****** ****** *)
//
|D3E1assgn _ =>
(
  f0_assgn(dexp, err0))
|D3E1xazgn _ =>
(
  f0_xazgn(dexp, err0))
|D3E1xchng _ =>
(
  f0_xchng(dexp, err0))
//
(* ****** ****** *)
//
|D3E1l0azy _ => (dexp)
|D3E1l0az1 _ =>
(
  f0_l0az1(dexp, err0))
//
|D3E1l1azy _ => (dexp)
|D3E1l1az1 _ =>
(
  f0_l1az1(dexp, err0))
//
(* ****** ****** *)
//
|D3E1dvdtp _ =>
(
  f0_dvdtp(dexp, err0))
//
(* ****** ****** *)
//
|D3E1delin _ =>
(
  f0_delin(dexp, err0))
|D3E1exlin _ =>
(
  f0_exlin(dexp, err0))
//
(* ****** ****** *)
//
|D3E1t2pck _ =>
(
  f0_t2pck(dexp, err0))
//
|D3E1t2ped _ =>
(
  f0_t2ped(dexp, err0))
//
(* ****** ****** *)
|D3E1none0 _ => ( dexp )
(* ****** ****** *)
//
| _(*otherwise*) =>
let
val () = err0 := err0+1 in
(
  d3exp1_errck(1(*lvl*), dexp)) end
//
(* ****** ****** *)
//
) where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dapp
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1dapp
(d3f0
,npf1, d3es) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3f0 =
(
d3exp1_tryltck(d3f0, err0))
val d3es =
d3exp1lst_tryltck(d3es, err0)
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
d3exp1_dapp_errck
( loc0
, t3q0
, d3f0(*fun*), npf1, d3es(*arg*)))
end//let
//
end(*let*)//end-of-[f0_dapp(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_proj
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1proj
(tknd
,lab1, dtup) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val dtup =
(
d3exp1_tryltck(dtup, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
  d3exp1_proj_errck
  (loc0, t3q0, tknd, lab1, dtup))
end//let
//
end(*let*)//end-of-[f0_proj(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_let1
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1let1
(dcls
,d3e1, dvts) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val dcls =
d3ecl1lst_tryltck(dcls, err0)
//
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
(*
val (  ) =
(
if // if
dvstp1lst_linq
  ( dvts ) then (err0:=err0+1))
*)
val dvts =
(
  dvstp1lst_trylinq(dvts, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
  d3exp1_let1_errck
  (loc0, t3q0, dcls, d3e1, dvts))
end//let
//
end(*let*)//end-of-[f0_let1(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_ift0
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1ift0
(d3e1
,dthn, dels) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3e1 =
(
d3exp1_tryltck(d3e1, err0))
val dthn =
d3exp1opt_tryltck(dthn, err0)
val dels =
d3exp1opt_tryltck(dels, err0)
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
  d3exp1_ift0_errck
  (loc0, t3q0, d3e1, dthn, dels))
end//let
//
end(*let*)//end-of-[f0_ift0(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_cas0
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1cas0
(tknd
,d3e1, dcls) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3e1 =
(
d3exp1_tryltck(d3e1, err0))
//
val dcls =
d3cls1lst_tryltck(dcls, err0)
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
  d3exp1_cas0_errck
  (loc0, t3q0, tknd, d3e1, dcls))
end//let
//
end(*let*)//end-of-[f0_cas0(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_seqn
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1seqn
(d3es, d3e1) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
val d3es =
d3exp1lst_tryltck(d3es, err0)
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
(
  d3exp1_seqn_errck
  (d3e0.lctn(), t3q0, d3es, d3e1))
//
end(*let*)//end-of-[f0_seqn(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_tup0
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1tup0
(npf1, d3es) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
val d3es =
d3exp1lst_tryltck(d3es, err0)
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
(
  d3exp1_tup0_errck
  (d3e0.lctn(), t3q0, npf1, d3es))
//
end(*let*)//end-of-[f0_tup0(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_tup1
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1tup1
(tknd
,npf1, d3es) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
val d3es =
d3exp1lst_tryltck(d3es, err0)
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val
loc0 = d3e0.lctn()
in//let
(
  d3exp1_tup1_errck
  (loc0, t3q0, tknd, npf1, d3es))
end//let
//
end(*let*)//end-of-[f0_tup1(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_lam1
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1lam1
(tknd
,f3as
,f3bs
,evts, sres
,arrw, d3e1
,vts1, vts2) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
(*
val f3as =
(
f3arg1lst_tryltck(f3as, err0))
*)
//
val f3bs =
(
f3axp1lst_tryltck(f3bs, err0))
//
//
val d3e1 =
(
  d3exp1_tryltck( d3e1, err0 ))
//
(*
val (  ) =
(
if // if
dvstp1lst_linq
  ( dvts ) then (err0:=err0+1))
*)
val vts1 =
(
  dvstp1lst_trylinq(vts1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val
loc0 = d3e0.lctn()
in//let
(
d3exp1_lam1_errck(
loc0, t3q0,
tknd, f3as, f3bs,
evts, sres, arrw, d3e1, vts1, vts2))
end//let
//
end(*let*)//end-of-[f0_lam1(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_flat
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1flat
(   d3e1   ) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
d3exp1_flat_errck(loc0, t3q0, d3e1))
end//let
//
end(*let*)//end-of-[f0_flat(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_free
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1free
(   d3e1   ) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
d3exp1_free_errck(loc0, t3q0, d3e1))
end//let
//
end(*let*)//end-of-[f0_free(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dl0az
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1dl0az
(   d3e1   ) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
d3exp1_dl0az_errck(loc0, t3q0, d3e1))
end//let
//
end(*let*)//end-of-[f0_dl0az(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_dl1az
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1dl1az
(   d3e1   ) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
d3exp1_dl1az_errck(loc0, t3q0, d3e1))
end//let
//
end(*let*)//end-of-[f0_dl1az(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_assgn
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1assgn
(d3el, d3er) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3el =
(
  d3exp1_tryltck(d3el, err0))
val d3er =
(
  d3exp1_tryltck(d3er, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
  d3exp1_assgn_errck
  (loc0, t3q0, d3el(*l*), d3er(*r*)))
end//let
//
end(*let*)//end-of-[f0_assgn(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_xazgn
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1xazgn
(d3el, d3er) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3el =
(
  d3exp1_tryltck(d3el, err0))
val d3er =
(
  d3exp1_tryltck(d3er, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
  d3exp1_xazgn_errck
  (loc0, t3q0, d3el(*l*), d3er(*r*)))
end//let
//
end(*let*)//end-of-[f0_xazgn(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_xchng
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1xchng
(d3el, d3er) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3el =
(
  d3exp1_tryltck(d3el, err0))
val d3er =
(
  d3exp1_tryltck(d3er, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
  d3exp1_xchng_errck
  (loc0, t3q0, d3el(*l*), d3er(*r*)))
end//let
//
end(*let*)//end-of-[f0_xchng(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_l0az1
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1l0az1
(dsym, evts
,d3e1, vts1) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
val vts1 =
(
  dvdtp1lst_trylinq(vts1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
//
(
d3exp1_l0az1_errck
(loc0, t3q0, dsym, evts, d3e1, vts1))
//
end//let
//
end(*let*)//end-of-[f0_l0az1(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_l1az1
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val t3q0 = d3e0.dtyp((*0*))
//
val-
D3E1l1az1
(dsym, evts
,d3e1, vts1
,d3es, vts2) = d3e0.node()
//
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
val vts1 =
(
  dvdtp1lst_trylinq(vts1, err0))
val vts2 =
(
  dvdtp1lst_trylinq(vts2, err0))
//
(*
val loc0 =
(
d3exp1_lctn$get(d3e0))//val(loc0)
val (  ) =
prerrsln("\
tryltck:f0_l1az1: loc0 = ", loc0)
val (  ) =
prerrsln("\
tryltck:f0_l1az1: evts = ", evts)
val (  ) =
prerrsln("\
tryltck:f0_l1az1: vts1 = ", vts1)
val (  ) =
prerrsln("\
tryltck:f0_l1az1: vts2 = ", vts2)
*)
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
//
(
d3exp1_l1az1_errck
(loc0, t3q0
,dsym, evts, d3e1, vts1, d3es, vts2))
//
end//let
//
end(*let*)//end-of-[f0_l1az1(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dvdtp
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1dvdtp
(d3e1, dvts) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 =
d3e0.lctn() in//let
(
  d3exp1_dvdtp_errck
  (loc0, t3q0, d3e1, dvts)) end//let
//
end(*let*)//end-of-[f0_dvdtp(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_delin
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
(*
HX-2025-11-05:
[t2pck] treated as error
*)
val (  ) =
(
  err0 := err0 + 1)
//
val-
D3E1delin
(d3e1, tlin) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 =
d3e0.lctn() in//let
(
  d3exp1_delin_errck
  (loc0, t3q0, d3e1, tlin)) end//let
//
end(*let*)//end-of-[f0_delin(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_exlin
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
(*
HX-2025-11-30:
[t2pck] treated as error
*)
val (  ) =
(
  err0 := err0 + 1)
//
val-
D3E1exlin
(d3e1, tlin) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 =
d3e0.lctn() in//let
(
  d3exp1_exlin_errck
  (loc0, t3q0, d3e1, tlin)) end//let
//
end(*let*)//end-of-[f0_exlin(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_t2pck
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
(*
HX-2025-11-05:
[t2pck] treated as error
*)
val (  ) =
(
  err0 := err0 + 1)
//
val-
D3E1t2pck
(d3e1
,t2q1, t2q2) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
  d3exp1_t2pck_errck
  (loc0, t3q0, d3e1, t2q1, t2q2))
end//let
//
end(*let*)//end-of-[f0_t2pck(d3e0,err0)]
//
(* ****** ****** *)
//
fun
f0_t2ped
( d3e0: d3exp1
, err0
: &sint >> sint): d3exp1 =
let
//
val nerr = err0
//
val-
D3E1t2ped
(d3e1
,t2q1, t2q2) = d3e0.node()
//
val t3q0 = d3e0.dtyp((*0*))
//
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
in//let
//
if // if
(err0=nerr)
then (d3e0) else
let
val loc0 = d3e0.lctn()
in//let
(
  d3exp1_t2ped_errck
  (loc0, t3q0, d3e1, t2q1, t2q2))
end//let
//
end(*let*)//end-of-[f0_t2ped(d3e0,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val loc0 = dexp.lctn()
val (  ) =
prerrsln("d3exp1_tryltck: loc0 = ", loc0)
val (  ) =
prerrsln("d3exp1_tryltck: dexp = ", dexp)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[d3exp1_tryltck(dexp,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3gpt1_tryltck
( dgpt, err0 ) =
(
//
case+
dgpt.node() of
//
|D3GPT1pat
(   d3p1   ) =>
let
//
val nerr = err0
//
val d3p1 =
d3pat1_tryltck(d3p1, err0)
//
in//let
if
(err0=nerr)
then (dgpt) else
(
d3gpt1
(dgpt.lctn(), D3GPT1pat(d3p1)))
end(*let*)//end-of-[D3GPT1pat(d3p1)]
//
|D3GPT1gua
(d3p1, d3gs) =>
let
//
val nerr = err0
//
val d3p1 =
d3pat1_tryltck(d3p1, err0)
(*
val d3gs =
d3gualst_tryltck(d3gs, err0)
*)
//
in//let
if // if
(err0=nerr)
then (dgpt) else
(
d3gpt1
(dgpt.lctn(), D3GPT1gua(d3p1,d3gs)))
end(*let*)//end-of-[D3GPT1gua(d3p1,d3gs)]
//
)(*case+*)//end-of-[d3gpt1_tryltck(dgpt,err0)]
//
(* ****** ****** *)
//
#implfun
d3cls1_tryltck
( dcls, err0 ) =
(
//
case+
dcls.node() of
|D3CLS1gpt
(   dgpt   ) => let
//
val nerr = err0
//
val dgpt =
(
  d3gpt1_tryltck(dgpt, err0))
//
in//let
if // if
(err0=nerr)
then (dcls)
else
let
val loc0 = dcls.lctn()
in//let
(
  d3cls1(loc0, D3CLS1gpt(dgpt)))
end//let
end(*let*)//end-of-[D3CLSgpt(dgpt)]
//
|D3CLS1cls
(dgpt, d3e1) =>
let
//
val nerr = err0
//
val dgpt =
(
  d3gpt1_tryltck(dgpt, err0))
val d3e1 =
(
  d3exp1_tryltck(d3e1, err0))
//
val dgrt =
  dcls.dgrt((*0*))
val vts1 =
  dcls.vts1((*0*))//inner:styp
val vts2 =
  dcls.vts2((*0*))//outer:dtyp
//
val (  ) =
(
dgrt_tryltck(dgpt, dgrt, err0))
//
val vts1 =
(
  dvstp1lst_trylinq(vts1, err0))
//
in//let
//
if // if
(err0=nerr)
then (dcls) else
let//1
val
loc0 = dcls.lctn() in//let1
d3cls1(loc0,
  D3CLS1cls(dgpt,d3e1),dgrt,vts1,vts2)
end//let1//endof(else)//endof(if(...))
//
end(*let*)//end-of-[D3CLScls(dgpt,d3e1)]
//
) where
{
//
fun
dgpt_freeq
(dgpt: d3gpt1): bool =
(
case+
dgpt.node() of
|D3GPT1pat
(   dpat   ) => d3pat1_freeq(dpat)
|D3GPT1gua
(dpat, d3gs) => d3pat1_freeq(dpat))
//
fun
dgrt_tryltck
( dgpt
: d3gpt1
, dgrt
: optn(d3typ1)
, err0: &sint >> _): void =
(
case+ dgrt of
|optn_nil((*0*)) => ((*void*))
|optn_cons(dtyp) => (
if
dgpt_freeq(dgpt)
then
(
if // if
d3typ1_nfrq(dtyp) then (err0:=err0+1))
else
if // if
d3typ1_linq(dtyp) then (err0:=err0+1)))
//
}(*where*)//end-of-[d3cls1_tryltck(dcls,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3axp1_tryltck
( daxp, err0 ) =
(
case+
daxp.node() of
//
|D3A1int _ => daxp
|D3A1btf _ => daxp
|D3A1chr _ => daxp
|D3A1flt _ => daxp
|D3A1str _ => daxp
//
|D3A1var _ => daxp
|D3A1lft _ => daxp
//
|D3A1none _ => daxp
//
|
D3A1t2pck _ =>
let
//
val () =
(err0 := err0 + 1)
//
val loc0 = daxp.lctn()
val t2q0 = daxp.styp()
//
in//let
(
d3axp1(loc0, t2q0,
  D3A1errck(1(*lvl*), daxp)))
end//let//end-of-[D3A1t2pck(...)]
//
|
D3A1argtp
(d3a1, t2q2) =>
let
val d3a1 =
d3axp1_tryltck(d3a1, err0) in daxp
end//let//end-of-[D3A1argtp(d2a1,...)]
//
|
D3A1annot
(d3a1
,s1e2
,s2e2, t2q2) =>
let
val d3a1 =
d3axp1_tryltck(d3a1, err0) in daxp
end//let//end-of-[D3A1annot(d2a1,...)]
//
) where
{
//
(*
val loc0 = daxp.lctn()
val (  ) =
prerrsln("d3axp1_tryltck: loc0 = ", loc0)
val (  ) =
prerrsln("d3axp1_tryltck: daxp = ", daxp)
*)
//
}(*where*)//end-of-[d3axp1_tryltck(daxp,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
f3axp1_tryltck
( faxp, err0 ) =
(
case+
faxp.node() of
|F3AXP1dapp
(npf1, d3as) =>
let
val nerr = err0
val d3as =
d3axp1lst_tryltck(d3as, err0)
in//let
if
(nerr = err0)
then faxp else
f3axp1_make_lctn$node
(faxp.lctn(), F3AXP1dapp(npf1, d3as))
end//let//end-of-[F3AXP1dapp(npf1,d3as)]
//
|F3AXP1sapp(s2vs, s2ps) => (  faxp  )
|F3AXP1mets(s2es(*mets*)) => (  faxp  )
//
) where
{
//
(*
val loc0 = faxp.lctn()
val (  ) =
prerrsln("f3axp1_tryltck: loc0 = ", loc0)
val () =
prerrsln("f3axp1_tryltck: faxp = ", faxp)
*)
//
}(*where*)//end-of-[f3axp1_tryltck(faxp,err0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_tryltck_dynexp.dats] *)
(***********************************************************************)
