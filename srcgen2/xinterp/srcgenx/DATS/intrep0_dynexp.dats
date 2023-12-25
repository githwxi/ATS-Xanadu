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
//
Sat Nov 25 12:26:57 EST 2023
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
"./../HATS/libxinterp.hats"
//
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
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/intrep0.dats"
//
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
//
#symload lctn with d3gua_get_lctn
#symload node with d3gua_get_node
//
#symload lctn with d3gpt_get_lctn
#symload node with d3gpt_get_node
//
#symload lctn with d3cls_get_lctn
#symload node with d3cls_get_node
//
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
#symload stmp with timpl_get_stmp
#symload node with timpl_get_node
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
trxd3ir_d3pat
(env0 , d3p0) =
(
case+
d3p0.node() of
//
|D3Pany
((*0*)) =>
irpat(loc0, IRPany(   ))
|D3Pvar
( d2v ) =>
irpat(loc0, IRPvar(d2v))
//
|D3Pint
( tok ) =>
let
val int =
token2dint(tok)
in//let
irpat(loc0, IRPint(int))
end//let//end-of(D3Pchr)
//
|D3Pbtf
( sym ) =>
let
val btf =
symbl2dbtf(sym)
in//let
irpat(loc0, IRPbtf(btf))
end//let//end-of(D3Pbtf)
//
|D3Pchr
( tok ) =>
let
val chr =
token2dchr(tok)
in//let
irpat(loc0, IRPchr(chr))
end//let//end-of(D3Pchr)
//
|D3Pflt
( tok ) =>
irpat(loc0, IRPflt(tok))
|D3Pstr
( tok ) =>
irpat(loc0, IRPstr(tok))
//
|D3Pdapp _ => f0_dapp(env0, d3p0)
//
|D3Ptup0 _ => f0_tup0(env0, d3p0)
|D3Ptup1 _ => f0_tup1(env0, d3p0)
|D3Prcd2 _ => f0_rcd2(env0, d3p0)
//
|
D3Pannot _ => f0_annot(env0, d3p0)
//
|_(*otherwise*) => irpat_none1(d3p0)
//
) where
{
//
(* ****** ****** *)
//
val loc0 = d3p0.lctn()
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! trdienv
, d3p0: d3pat): irpat =
let
//
val-
D3Pdapp
( d3f0
, npf1, d3ps) = d3p0.node()
//
val d3ps =
(
  pfrmv_npf1_d3ps(npf1, d3ps))
val irps =
(
  trxd3ir_d3patlst(env0, d3ps))
//
val d3f0 =
(
f0_detapq(d3f0)) where
{
fun
f0_detapq
( d3f0
: d3pat): d3pat =
(
case+
d3f0.node() of
|D3Ptapq
(d3f1, t2js) =>
(
f0_detapq(d3f1)) | _ => d3f0) }
//
in
//
case+
d3f0.node() of
|
D3Pcon(d2c1) =>
irpat(loc0, IRPcapp(d2c1, irps))
//
end where
{
val () =
prerrln
("\
trxd3ir_d3pat:f0_dapp: d3p0 = ", d3p0)
}(*where*)//end-of-[f0_dapp(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_tup0
( env0:
! trdienv
, d3p0: d3pat): irpat =
let
//
val-
D3Ptup0
( npf1, d3ps) = d3p0.node()
//
val d3ps =
(
  pfrmv_npf1_d3ps(npf1, d3ps))
//
val irps =
(
  trxd3ir_d3patlst(env0, d3ps))
//
in//let
(
  irpat( loc0, IRPtup0( irps ) ) )
end(*let*)//end-of-[f0_tup0(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_tup1
( env0:
! trdienv
, d3p0: d3pat): irpat =
let
//
val-
D3Ptup1
( tknd
, npf1, d3ps) = d3p0.node()
//
val d3ps =
(
  pfrmv_npf1_d3ps(npf1, d3ps))
//
val irps =
(
  trxd3ir_d3patlst(env0, d3ps))
//
in//let
(
  irpat(loc0, IRPtup1(tknd, irps)))
end(*let*)//end-of-[f0_tup1(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_rcd2
( env0:
! trdienv
, d3p0: d3pat): irpat =
let
//
val-
D3Prcd2
( tknd
, npf1, ldps) = d3p0.node()
//
val ldps =
(
  pfrmv_npf1_ldps(npf1, ldps))
//
val lirs =
(
  trxd3ir_l3d3plst(env0, ldps))
//
in//let
(
  irpat(loc0, IRPrcd2(tknd, lirs)))
end(*let*)//end-of-[f0_rcd2(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_annot
( env0:
! trdienv
, d3p0: d3pat): irpat =
(
trxd3ir_d3pat(env0, d3p1)) where
{
  val-
  D3Pannot
  (d3p1, s1e2, s2e2) = d3p0.node()
}(*where*)//end of [f0_annot(env0,d3p0)]
//
(* ****** ****** *)
//
val () =
prerrln("trxd3ir_d3pat: d3p0 = ", d3p0)
//
(* ****** ****** *)
//
}(*where*) // end of [trxd3ir_d3pat(...)]
//
(* ****** ****** *)
//
#implfun
trxd3ir_d3exp
(env0 , d3e0) =
(
case+
d3e0.node() of
//
|D3Eint
( tok ) =>
irexp(loc0, IREint(tok))
|D3Ebtf
( sym ) =>
irexp(loc0, IREbtf(sym))
|D3Echr
( tok ) =>
irexp(loc0, IREchr(tok))
|D3Eflt
( tok ) =>
irexp(loc0, IREflt(tok))
|D3Estr
( tok ) =>
irexp(loc0, IREstr(tok))
//
|D3Evar
( d2v ) =>
irexp(loc0, IREvar(d2v))
//
|D3Econ
( d2c ) =>
irexp(loc0, IREcon(d2c))
|D3Ecst
( d2c ) =>
irexp(loc0, IREcst(d2c))
//
|D3Etimp _ => f0_timp(env0, d3e0)
//
|D3Etapp _ => f0_tapp(env0, d3e0)
|D3Etapq _ => f0_tapq(env0, d3e0)
//
|D3Edapp _ => f0_dapp(env0, d3e0)
//
|D3Elet0 _ => f0_let0(env0, d3e0)
//
|D3Eift0 _ => f0_ift0(env0, d3e0)
|D3Ecas0 _ => f0_cas0(env0, d3e0)
//
|D3Eseqn _ => f0_seqn(env0, d3e0)
//
|D3Etup0 _ => f0_tup0(env0, d3e0)
|D3Etup1 _ => f0_tup1(env0, d3e0)
|D3Ercd2 _ => f0_rcd2(env0, d3e0)
//
|D3Elam0 _ => f0_lam0(env0, d3e0)
|D3Efix0 _ => f0_fix0(env0, d3e0)
//
|D3Ewhere _ => f0_where(env0, d3e0)
//
|_(* otherwise *) => irexp_none1(d3e0)
) where
{
//
(* ****** ****** *)
//
val loc0 = d3e0.lctn()
//
(* ****** ****** *)
//
fun
f0_timp
( env0:
! trdienv
, d3e0: d3exp): irexp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Etimp
( dcst, timp) = d3e0.node()
//
val dimp =
(
case+
timp.node() of
|TIMPLall1
(dcst, dcls) =>
(
case+ dcls of
|list_nil( ) =>
(
 d3ecl_none0(loc0))
|list_cons(dcl1, _) => dcl1)
|TIMPLallx
(dcst, dcls) =>
(
case+ dcls of
|list_nil( ) =>
(
 d3ecl_none0(loc0))
|list_cons(dcl1, _) => dcl1)
) : d3ecl//end-of-[val(dimp)]
//
in//let
//
irexp_make_node
(loc0, IREtimp(dcst, dimp)) where
{ val
  dimp = trxd3ir_d3ecl(env0, dimp) }
//
end(*let*)//end-of-[f0_timp(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_tapp
( env0:
! trdienv
, d3e0: d3exp): irexp =
(
trxd3ir_d3exp(env0, d3f0)
) where
{
//
val-
D3Etapp
( d3f0, s2es) = d3e0.node()
}(*where*)//end-of-[f0_tapp(env0,d3e0)]
//
fun
f0_tapq
( env0:
! trdienv
, d3e0: d3exp): irexp =
(
trxd3ir_d3exp(env0, d3f0)
) where
{
//
val-
D3Etapq
( d3f0, t2js) = d3e0.node()
}(*where*)//end-of-[f0_tapq(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! trdienv
, d3e0: d3exp): irexp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Edapp
( d3f0
, npf1, d3es) = d3e0.node()
//
val d3es =
(
pfrmv_npf1_d3es(npf1, d3es) )
//
val irf0 =
(
  trxd3ir_d3exp(env0, d3f0) )
val ires =
(
  trxd3ir_d3explst(env0, d3es) )
//
in//let
//
(
irexp(loc0, IREdapp(irf0, ires)))
//
end(*let*)//end-of-[f0_dapp(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_let0
( env0:
! trdienv
, d3e0: d3exp): irexp =
let
//
val-
D3Elet0
( dcls, d3e1) = d3e0.node()
//
val irds =
trxd3ir_d3eclist(env0, dcls)
val ire1 =
(
  trxd3ir_d3exp(env0, d3e1))
//
in//let
(
  irexp_make_node
  (loc0, IRElet0( irds, ire1 )))
end(*let*)//end-of-[f0_let0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_ift0
( env0:
! trdienv
, d3e0: d3exp): irexp =
let
//
val-
D3Eift0
( d3e1
, dthn, dels) = d3e0.node()
//
val ire1 =
trxd3ir_d3exp(env0, d3e1)
val ithn =
trxd3ir_d3expopt(env0, dthn)
val iels =
trxd3ir_d3expopt(env0, dels)
//
in//let
irexp_make_node
(loc0, IREift0(ire1, ithn, iels))
end(*let*)//end-of-[f0_ift0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_cas0
( env0:
! trdienv
, d3e0: d3exp): irexp =
let
//
val-
D3Ecas0
( tknd
, d3e1, dcls) = d3e0.node()
//
val ire1 =
trxd3ir_d3exp(env0, d3e1)
val dcls =
trxd3ir_d3clslst(env0, dcls)
//
in//let
irexp_make_node
(loc0, IREcas0(tknd, ire1, dcls))
end(*let*)//end-of-[f0_cas0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_seqn
( env0:
! trdienv
, d3e0: d3exp): irexp =
let
//
val-
D3Eseqn
( d3es, d3e1) = d3e0.node()
//
val ires =
trxd3ir_d3explst
(  env0, d3es  )
val ire1 =
(
  trxd3ir_d3exp(env0, d3e1) )
//
in//let
(
  irexp_make_node
  (loc0, IREseqn( ires, ire1 )) )
end(*let*)//end-of-[f0_seqn(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_tup0
( env0:
! trdienv
, d3e0: d3exp): irexp =
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
val ires =
(
  trxd3ir_d3explst(env0, d3es))
//
in//let
(
  irexp(loc0, IREtup0(  ires  )) )
end(*let*)//end-of-[f0_tup0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_tup1
( env0:
! trdienv
, d3e0: d3exp): irexp =
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
val ires =
(
  trxd3ir_d3explst(env0, d3es))
//
in//let
(
  irexp(loc0, IREtup1(tknd, ires)))
end(*let*)//end-of-[f0_tup1(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_rcd2
( env0:
! trdienv
, d3e0: d3exp): irexp =
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
val lirs =
(
  trxd3ir_l3d3elst(env0, ldes))
//
in//let
(
  irexp(loc0, IRErcd2(tknd, lirs)))
end(*let*)//end-of-[f0_rcd2(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_lam0
( env0:
! trdienv
, d3e0: d3exp): irexp =
let
//
val-
D3Elam0
(tknd
,f3as,sres
,arrw,body) = d3e0.node()
//
val fias =
trxd3ir_f3arglst(env0, f3as)
//
val
body = trxd3ir_d3exp(env0, body)
//
in//let
(
  irexp_make_node
  (loc0, IRElam0(tknd, fias, body)))
end(*let*)//end-of-[f0_lam0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_fix0
( env0:
! trdienv
, d3e0: d3exp): irexp =
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
trxd3ir_f3arglst(env0, f3as)
//
val
body = trxd3ir_d3exp(env0, body)
//
in//let
//
irexp_make_node
(loc0, IREfix0(tknd,d2v1,fias,body))
//
end(*let*)//end-of-[f0_fix0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_where
( env0:
! trdienv
, d3e0: d3exp): irexp =
let
//
val-
D3Ewhere
( d3e1, dcls) = d3e0.node()
//
val irds =
trxd3ir_d3eclist(env0, dcls)
val ire1 =
(
  trxd3ir_d3exp(env0, d3e1))
//
in//let
(
  irexp_make_node
  (loc0, IREwhere( ire1, irds )))
end(*let*)//end-of-[f0_where(env0,d3e0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
val (  ) =
prerrln("trxd3ir_d3exp: d3e0 = ", d3e0)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*) // end of [trxd3ir_d3exp(...)]
//
(* ****** ****** *)
//
#implfun
trxd3ir_d3gua
  (env0, dgua) =
(
case+
dgua.node() of
|
D3GUAexp(d3e1) =>
let
val ire1 =
trxd3ir_d3exp(env0, d3e1)
in//let
irgua(loc0, IRGUAexp(ire1))
end//let//end-of-[D3GUAexp(...)]
|
D3GUAmat(d3e1,d3p2) =>
let
val ire1 =
trxd3ir_d3exp(env0, d3e1)
val irp2 =
trxd3ir_d3pat(env0, d3p2)
in//let
irgua(loc0, IRGUAmat(ire1, irp2))
end//let//end-of-[D3GUAmat(...)]
) where
{
//
val loc0 = dgua.lctn( (*void*) )
//
(*
val (  ) =
prerrln("trans3a_d3gua: dgua = ", dgua)
*)
//
}(*where*)//end-of-[trans3a_d3gua(env0,...)]
//
(* ****** ****** *)
//
#implfun
trxd3ir_d3gpt
  (env0, dgpt) = let
//
val loc0 = dgpt.lctn()
//
(*
val
val () =
prerrln
("trxd3ir_d3gpt: dgpt = ", dgpt)
*)
//
in//let
//
case+
dgpt.node() of
//
|
D3GPTpat(d3p1) =>
irgpt_make_node
( loc0
, IRGPTpat(irp1)) where
{
val irp1 =
trxd3ir_d3pat(env0, d3p1)
}
|
D3GPTgua(d3p1, d3gs) =>
irgpt_make_node
( loc0
, IRGPTgua(irp1, irgs)) where
{
val
irp1 = trxd3ir_d3pat(env0, d3p1)
val
irgs = trxd3ir_d3gualst(env0, d3gs) }
//
end(*let*)//end-of-[trxd3ir_d3gpt(env0,dgpt)]
//
(* ****** ****** *)
//
#implfun
trxd3ir_d3cls
(env0 , d3cl) =
(
case+
d3cl.node() of
|
D3CLSgpt(dgpt) =>
(
ircls
(loc0, IRCLSgpt(dgpt))
) where
{
val loc0 =
d3cl.lctn((*void*))
val dgpt =
trxd3ir_d3gpt(env0, dgpt) }
//
|
D3CLScls(dgpt, d3e1) =>
(
ircls
( loc0
, IRCLScls(dgpt, ire1))
) where
{
val loc0 =
d3cl.lctn((*void*))
val dgpt =
trxd3ir_d3gpt(env0, dgpt)
val ire1 =
trxd3ir_d3exp(env0, d3e1) }
) where
{
//
val loc0 = d3cl.lctn( (*void*) )
//
(*
val (  ) =
prerrln("trxd3ir_d3cls: loc0 = ", loc0)
val (  ) =
prerrln("trxd3ir_d3cls: d3cl = ", d3cl)
*)
//
}(*where*)//end-of-[trxd3ir_d3cls(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3ir_teqd3exp
  (env0, tdxp) =
(
case+ tdxp of
|
TEQD3EXPnone() =>
TEQIREXPnone((*void*))
|
TEQD3EXPsome(teq1, d3e2) =>
TEQIREXPsome(teq1, ire2) where
{ val
  ire2 = trxd3ir_d3exp(env0, d3e2) } )
(*case+*)//end-of(trxd3ir_teqd3exp(env0,tdxp))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxd3ir_d3patlst
( env0, d3ps ) =
(
  list_trxd3ir_fnp(env0, d3ps, trxd3ir_d3pat))
//
(* ****** ****** *)
//
#implfun
trxd3ir_d3explst
( env0, d3es ) =
(
  list_trxd3ir_fnp(env0, d3es, trxd3ir_d3exp))
//
#implfun
trxd3ir_d3expopt
( env0, dopt ) =
(
  optn_trxd3ir_fnp(env0, dopt, trxd3ir_d3exp))
//
(* ****** ****** *)
//
#implfun
trxd3ir_l3d3plst
( env0, ldps ) =
(
  list_trxd3ir_fnp(env0, ldps, trxd3ir_l3d3p))
//
#implfun
trxd3ir_l3d3elst
( env0, ldes ) =
(
  list_trxd3ir_fnp(env0, ldes, trxd3ir_l3d3e))
//
(* ****** ****** *)
//
#implfun
trxd3ir_f3arglst
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
fia1 =
f0_dyn0(env0, f3a1)
val
fias =
trxd3ir_f3arglst(env0, f3as)
//
}(*where*)//end-[F3ARGdapp(...)]
|
F3ARGsapp _ =>
trxd3ir_f3arglst(env0, f3as)
|
F3ARGmets _ =>
trxd3ir_f3arglst(env0, f3as)
)
) where // end-of-[case+of(f3a1)]
{
//
fun
f0_dyn0
( env0:
! trdienv
, f3a1: f3arg): fiarg =
let
//
val-
F3ARGdapp
(npf1, d3ps) = f3a1.node()
//
val d3ps =
pfrmv_npf1_d3ps(npf1, d3ps)
//
in//let
FIARG(trxd3ir_d3patlst(env0, d3ps))
end//let//end-of-[f0_dyn0(env0,f3a1)]
//
} (*where+*)//end-[trxd3ir_f3arglst(env0,f3as)]
//
(* ****** ****** *)
//
#implfun
trxd3ir_d3gualst
( env0, d3gs ) =
(
  list_trxd3ir_fnp(env0, d3gs, trxd3ir_d3gua))
//
#implfun
trxd3ir_d3clslst
( env0, dcls ) =
(
  list_trxd3ir_fnp(env0, dcls, trxd3ir_d3cls))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_intrep0_dynexp.dats] *)
