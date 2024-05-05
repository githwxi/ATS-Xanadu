(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Thu 14 Mar 2024 08:10:28 PM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
//
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
#include
"./../HATS/xats2js_dats.hats"
(* ****** ****** *)
//
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/dynexp3.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/trxd3i0.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/trxd3i0.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
(* ****** ****** *)
#symload lctn with f3arg_get_lctn
#symload node with f3arg_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#static
fun
<itm:type>
pfrmv_npf1_itms
( npf1
: sint
, itms
: list(itm)): list(itm)
#impltmp
<  itm  >
pfrmv_npf1_itms
  (npf1, itms) =
(
  loop(npf1, itms)) where
{
fun
loop
( npf1: sint
, itms: list(itm)): list(itm) =
if
(npf1 <= 0)
then itms else
(
case+ itms of
|
list_nil
( (*0*) ) => list_nil()
|
list_cons
(_, itms) => loop(npf1-1, itms))
}
//
(* ****** ****** *)
fun
pfrmv_npf1_t2ps
( npf1
: sint
, t2ps
: s2typlst): s2typlst =
pfrmv_npf1_itms<s2typ>(npf1, t2ps)
(* ****** ****** *)
//
fun
pfrmv_npf1_d3ps
( npf1
: sint
, d3ps
: d3patlst): d3patlst =
pfrmv_npf1_itms<d3pat>(npf1, d3ps)
fun
pfrmv_npf1_ldps
( npf1
: sint
, ldps
: l3d3plst): l3d3plst =
pfrmv_npf1_itms<l3d3p>(npf1, ldps)
//
(* ****** ****** *)
//
fun
pfrmv_npf1_d3es
( npf1
: sint
, d3es
: d3explst): d3explst =
pfrmv_npf1_itms<d3exp>(npf1, d3es)
fun
pfrmv_npf1_ldes
( npf1
: sint
, ldes
: l3d3elst): l3d3elst =
pfrmv_npf1_itms<l3d3e>(npf1, ldes)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3pat
(env0 , d3p0) =
(
case+
d3p0.node() of
//
|D3Pany
((*0*)) =>
i0pat(loc0, I0Pany(   ))
|D3Pvar
( d2v ) =>
i0pat(loc0, I0Pvar(d2v))
//
|D3Pint
( tok ) =>
i0pat(loc0, I0Pint(tok))
|D3Pbtf
( sym ) =>
i0pat(loc0, I0Pbtf(sym))
|D3Pchr
( tok ) =>
i0pat(loc0, I0Pchr(tok))
|D3Pflt
( tok ) =>
i0pat(loc0, I0Pflt(tok))
|D3Pstr
( tok ) =>
i0pat(loc0, I0Pstr(tok))
//
|D3Pannot _ => f0_annot(env0, d3p0)
//
|_(* otherwise *) => i0pat_none1(d3p0)
//
) where
{
//
(* ****** ****** *)
//
val loc0 = d3p0.lctn((*0*))
//
(* ****** ****** *)
//
fun
f0_annot
( env0:
! envd3i0
, d3p0: d3pat): i0pat =
(
trxd3i0_d3pat(env0, d3p1)
) where
{
//
val loc0 = d3p0.lctn((*0*))
//
val-
D3Pannot
( d3p1
, s1e2, s2e2) = d3p0.node((*0*))
//
} (*where*) // end of [f0_annot(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
val (  ) =
prerrln("trxd3i0_d3pat: d3p0 = ", d3p0)
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*) // end of [trxd3i0_d3pat(...)]
//
(* ****** ****** *)
//
#implfun
trxd3i0_l3d3p
( env0,ld3p ) =
let
//
val+
D3LAB
(lab0, d3p1) = ld3p
//
in//let
I0LAB(lab0, trxd3i0_d3pat(env0, d3p1))
end (*let*)//end-of-[trxd3i0_l3d3p(env0,ld3p)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3exp
(env0 , d3e0) =
(
case+
d3e0.node() of
//
(* ****** ****** *)
//
|D3Eint
( tok ) =>
i0exp(loc0, I0Eint(tok))
|D3Ebtf
( sym ) =>
i0exp(loc0, I0Ebtf(sym))
|D3Echr
( tok ) =>
i0exp(loc0, I0Echr(tok))
|D3Eflt
( tok ) =>
i0exp(loc0, I0Eflt(tok))
|D3Estr
( tok ) =>
i0exp(loc0, I0Estr(tok))
//
(* ****** ****** *)
//
|D3Evar
( d2v ) =>
i0exp(loc0, I0Evar(d2v))
//
(* ****** ****** *)
//
|D3Econ
( d2c ) =>
i0exp(loc0, I0Econ(d2c))
|D3Ecst
( d2c ) =>
i0exp(loc0, I0Ecst(d2c))
//
(* ****** ****** *)
//
|D3Etimp _ => f0_timp(env0, d3e0)
//
(* ****** ****** *)
//
|D3Esapp _ => f0_sapp(env0, d3e0)
|D3Esapq _ => f0_sapq(env0, d3e0)
//
(* ****** ****** *)
//
|D3Etapp _ => f0_tapp(env0, d3e0)
|D3Etapq _ => f0_tapq(env0, d3e0)
//
(* ****** ****** *)
//
|D3Edapp _ => f0_dapp(env0, d3e0)
//
(* ****** ****** *)
//
|D3Elet0 _ => f0_let0(env0, d3e0)
//
(* ****** ****** *)
//
|D3Eift0 _ => f0_ift0(env0, d3e0)
|D3Ecas0 _ => f0_cas0(env0, d3e0)
//
(* ****** ****** *)
//
|D3Eseqn _ => f0_seqn(env0, d3e0)
//
(* ****** ****** *)
//
|D3Etup0 _ => f0_tup0(env0, d3e0)
|D3Etup1 _ => f0_tup1(env0, d3e0)
|D3Ercd2 _ => f0_rcd2(env0, d3e0)
//
(* ****** ****** *)
//
|D3Elam0 _ => f0_lam0(env0, d3e0)
|D3Efix0 _ => f0_fix0(env0, d3e0)
//
(* ****** ****** *)
//
|D3Eaddr _ => f0_addr(env0, d3e0)
|D3Eflat _ => f0_flat(env0, d3e0)
//
(* ****** ****** *)
//
|D3Ewhere _ => f0_where(env0, d3e0)
//
(* ****** ****** *)
//
|D3Eassgn _ => f0_assgn(env0, d3e0)
//
(* ****** ****** *)
//
|_(* otherwise *) => i0exp_none1(d3e0)
//
) where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
val loc0 = d3e0.lctn((*0*))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_timp
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Etimp
(d3e1, timp) = d3e0.node()
//
val i0e1 =
(
  trxd3i0_d3exp(env0, d3e1))
val timp =
(
  trxd3i0_timpl(env0, timp))
//
in//let
(
i0exp(loc0,I0Etimp(i0e1, timp)))
end//let//end-of-[f0_timp(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_sapp
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
(
trxd3i0_d3exp(env0, d3f0)
) where
{
//
val-
D3Esapp
( d3f0, s2es) = d3e0.node()
}
//
fun
f0_sapq
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
(
trxd3i0_d3exp(env0, d3f0)
) where
{
//
val-
D3Esapq
( d3f0, t2ps) = d3e0.node()
}
//
(* ****** ****** *)
//
fun
f0_tapp
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Etapp
( d3f0, s2es) = d3e0.node()
val i0f0 = 
(
  trxd3i0_d3exp(env0, d3f0))
in//let
(
  i0exp(loc0, I0Etapp(i0f0)) )
end//let//end-of-[f0_tapp(env0,d3e0)]
//
fun
f0_tapq
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Etapq
( d3f0, t2ps) = d3e0.node()
val i0f0 = 
(
  trxd3i0_d3exp(env0, d3f0))
in//let
(
  i0exp(loc0, I0Etapp(i0f0)) )
end//let//end-of-[f0_tapq(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Edapp
( d3f0
, npf1, d3es) = d3e0.node()
//
val
i0f0 =
trxd3i0_d3exp(env0, d3f0)
//
val d3es =
(
  pfrmv_npf1_d3es(npf1, d3es))
//
val i0es =
(
  trxd3i0_d3explst(env0, d3es))
//
in//let
(
i0exp(loc0, I0Edapp(i0f0, i0es)))
end (*let*) // end of [f0_dapp(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_let0
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val-
D3Elet0
( dcls, d3e1) = d3e0.node()
//
val dcls =
trxd3i0_d3eclist(env0, dcls)
val i0e1 =
(
  trxd3i0_d3exp(env0, d3e1))
//
in//let
(
  i0exp_make_node
  (loc0, I0Elet0( dcls, i0e1 )))
end(*let*)//end-of-[f0_let0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_ift0
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val-
D3Eift0
( d3e1
, dthn, dels) = d3e0.node()
//
val i0e1 =
trxd3i0_d3exp(env0, d3e1)
val ithn =
trxd3i0_d3expopt(env0, dthn)
val iels =
trxd3i0_d3expopt(env0, dels)
//
in//let
i0exp_make_node
(loc0, I0Eift0(i0e1, ithn, iels))
end(*let*)//end-of-[f0_ift0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_cas0
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val-
D3Ecas0
( tknd
, d3e1, dcls) = d3e0.node()
//
val i0e1 =
trxd3i0_d3exp(env0, d3e1)
val dcls =
trxd3i0_d3clslst(env0, dcls)
//
in//let
i0exp_make_node
(loc0, I0Ecas0(tknd, i0e1, dcls))
end(*let*)//end-of-[f0_cas0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_seqn
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val-
D3Eseqn
( d3es, d3e1) = d3e0.node()
//
val i0es =
trxd3i0_d3explst
(  env0, d3es  )
val i0e1 =
(
  trxd3i0_d3exp(env0, d3e1) )
//
in//let
(
  i0exp_make_node
  (loc0, I0Eseqn( i0es, i0e1 )) )
end(*let*)//end-of-[f0_seqn(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_tup0
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val-
D3Etup0
( npf1, d3es) = d3e0.node()
//
val d3es =
(
  pfrmv_npf1_d3es(npf1, d3es))
//
val i0es =
(
  trxd3i0_d3explst(env0, d3es))
//
in//let
if
list_singq(i0es)
then list_head(i0es)
else
(
  i0exp(loc0, I0Etup0(  i0es  )) )
end(*let*)//end-of-[f0_tup0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_tup1
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val-
D3Etup1
( tknd
, npf1, d3es) = d3e0.node()
//
val d3es =
(
  pfrmv_npf1_d3es(npf1, d3es))
//
val i0es =
(
  trxd3i0_d3explst(env0, d3es))
//
in//let
(
  i0exp(loc0, I0Etup1(tknd, i0es)))
end(*let*)//end-of-[f0_tup1(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_rcd2
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val-
D3Ercd2
( tknd
, npf1, ldes) = d3e0.node()
//
val ldes =
(
  pfrmv_npf1_ldes(npf1, ldes))
//
val li0s =
(
  trxd3i0_l3d3elst(env0, ldes))
//
in//let
(
  i0exp(loc0, I0Ercd2(tknd, li0s)))
end(*let*)//end-of-[f0_rcd2(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_lam0
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val-
D3Elam0
(tknd
,f3as,sres
,arrw,body) = d3e0.node()
//
val fias =
trxd3i0_f3arglst(env0, f3as)
//
val
body = trxd3i0_d3exp(env0, body)
//
in//let
(
  i0exp_make_node
  (loc0, I0Elam0(tknd, fias, body)))
end(*let*)//end-of-[f0_lam0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_fix0
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val-
D3Efix0
(tknd
,d2v1
,f3as,sres
,arrw,body) = d3e0.node()
//
val
fias =
trxd3i0_f3arglst(env0, f3as)
//
val
body = trxd3i0_d3exp(env0, body)
//
in//let
//
i0exp_make_node
(loc0, I0Efix0(tknd,d2v1,fias,body))
//
end(*let*)//end-of-[f0_fix0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_addr
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val-
D3Eaddr(d3e1) = d3e0.node()
//
val i0e1 =
(
  trxd3i0_d3exp(env0, d3e1))
//
in//let
(
  i0exp(loc0, I0Eaddr( i0e1 )) )
end(*let*)//end-of-[f0_addr(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_flat
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val-
D3Eflat(d3e1) = d3e0.node()
//
val i0e1 =
(
  trxd3i0_d3exp(env0, d3e1))
//
in//let
(
  i0exp(loc0, I0Eflat( i0e1 )) )
end(*let*)//end-of-[f0_flat(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_where
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val-
D3Ewhere
( d3e1, dcls) = d3e0.node()
//
val dcls =
trxd3i0_d3eclist(env0, dcls)
val i0e1 =
(
  trxd3i0_d3exp(env0, d3e1))
//
in//let
(
  i0exp_make_node
  (loc0, I0Ewhere( i0e1, dcls )))
end(*let*)//end-of-[f0_where(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_assgn
( env0:
! envd3i0
, d3e0: d3exp): i0exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Eassgn
(d3el, d3er) = d3e0.node()
//
val i0el =
trxd3i0_d3exp(env0, d3el)
val i0er =
trxd3i0_d3exp(env0, d3er)
//
in//let
(
  i0exp(loc0, I0Eassgn(i0el, i0er)))
end (*let*) // end of [f0_assgn(env0,d3e0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
val (  ) =
prerrln("trxd3i0_d3exp: d3e0 = ", d3e0)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*) // end of [trxd3i0_d3exp(...)]
//
(* ****** ****** *)
//
#implfun
trxd3i0_l3d3e
( env0,ld3e ) =
let
//
val+
D3LAB
(lab0, d3e1) = ld3e
//
in//let
I0LAB(lab0, trxd3i0_d3exp(env0, d3e1))
end (*let*)//end-of-[trxd3i0_l3d3e(env0,ld3e)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3patlst
( env0, d3ps ) =
(
  list_trxd3i0_fnp(env0, d3ps, trxd3i0_d3pat))
//
(* ****** ****** *)
//
#implfun
trxd3i0_d3explst
( env0, d3es ) =
(
  list_trxd3i0_fnp(env0, d3es, trxd3i0_d3exp))
//
#implfun
trxd3i0_d3expopt
( env0, dopt ) =
(
  optn_trxd3i0_fnp(env0, dopt, trxd3i0_d3exp))
//
(* ****** ****** *)
//
#implfun
trxd3i0_l3d3plst
( env0, ldps ) =
(
  list_trxd3i0_fnp(env0, ldps, trxd3i0_l3d3p))
//
#implfun
trxd3i0_l3d3elst
( env0, ldes ) =
(
  list_trxd3i0_fnp(env0, ldes, trxd3i0_l3d3e))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_f3arglst
( env0, f3as ) =
(
case+ f3as of
|
list_nil
( (*0*) ) =>
list_nil((*void*))
|
list_cons
(f3a1, f3as) =>
(
case+
f3a1.node() of
|
F3ARGdapp _ =>
list_cons(fia1, fias) where
{
//
val
fia1 = f0_dapp(env0, f3a1)
val
fias =
trxd3i0_f3arglst(env0, f3as)
//
}(*where*)//end-[F3ARGdapp(...)]
|
F3ARGsapp _ =>
trxd3i0_f3arglst(env0, f3as)
|
F3ARGmets _ =>
trxd3i0_f3arglst(env0, f3as)
)
) where // end-of-[case+of(f3a1)]
{
//
fun
f0_dapp
( env0:
! envd3i0
, f3a1: f3arg): fiarg =
let
//
val loc0 = f3a1.lctn()
//
val-
F3ARGdapp
(npf1, d3ps) = f3a1.node()
//
val d3ps =
pfrmv_npf1_d3ps(npf1, d3ps)
//
in//let
(
fiarg
(loc0, FIARGdapp(i0ps))) where
{
val
i0ps = trxd3i0_d3patlst(env0, d3ps)}
end//let//end-of-[f0_dapp(env0,f3a1)]
//
}(*where+*)//end-[trxd3i0_f3arglst(env0,f3as)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3i0_d3gualst
( env0, d3gs) =
(
  list_trxd3i0_fnp(env0, d3gs, trxd3i0_d3gua))
//
#implfun
trxd3i0_d3clslst
( env0, dcls) =
(
  list_trxd3i0_fnp(env0, dcls, trxd3i0_d3cls))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_trxd3i0_dynexp.dats] *)
(***********************************************************************)
