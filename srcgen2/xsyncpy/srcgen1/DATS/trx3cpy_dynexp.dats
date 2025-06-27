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
Sun Jun  1 10:05:49 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/trx3cpy.sats"
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
"./../../../SATS/dynexp3.sats"
//
#symload lctn with d3pat_get_lctn
#symload lctn with d3exp_get_lctn
#symload lctn with d3gua_get_lctn
#symload lctn with d3gpt_get_lctn
//
#symload node with d3pat_get_node
#symload node with d3exp_get_node
#symload node with d3gua_get_node
#symload node with d3gpt_get_node
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3pat_trx3cpy
(d3p0, env0) =
(
case+
d3p0.node() of
//
|D3Pint(tint) =>
d3pat1(loc0, D3P1int(tint))
|D3Pbtf(sbtf) =>
d3pat1(loc0, D3P1btf(sbtf))
|D3Pchr(tchr) =>
d3pat1(loc0, D3P1chr(tchr))
|D3Pflt(tflt) =>
d3pat1(loc0, D3P1flt(tflt))
|D3Pstr(tstr) =>
d3pat1(loc0, D3P1str(tstr))
//
|D3Pdapp _ => f0_dapp(d3p0, env0)
//
|
_(*otherwise*) =>
(
  d3pat1(loc0, t2p0, D3P1d3pat(d3p0)))
) where
{
//
(* ****** ****** *)
//
val loc0 = d3p0.lctn()
val t2p0 = d3p0.styp()
//
(* ****** ****** *)
//
fun
f0_dapp
(d3p0: d3pat
,env0: !env3cpy): d3pat1 =
let
val-
D3Pdapp
(d3f0
,npf1, d3ps) = d3p0.node()
//
val d3f0 =
(
  d3pat_trx3cpy(d3f0, env0))
//
val d3ps =
(
  d3patlst_trx3cpy(d3ps, env0))
//
in//let
//
d3pat1
(loc0, t2p0, D3P1dapp(d3f0,npf1,d3ps))
//
end//let
//
(* ****** ****** *)
//
(*
val (  ) =
printsln("d3pat_trx3cpy: loc0 = ", loc0)
val (  ) =
printsln("d3pat_trx3cpy: d3p0 = ", d3p0)
*)
//
}(*where*)//end-of-[d3pat_trx3cpy(d3p0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3exp_trx3cpy
(d3e0, env0) =
(
case+
d3e0.node() of
//
|D3Eint(tint) =>
d3exp1(loc0, D3E1int(tint))
|D3Ebtf(sbtf) =>
d3exp1(loc0, D3E1btf(sbtf))
|D3Echr(tchr) =>
d3exp1(loc0, D3E1chr(tchr))
|D3Eflt(tflt) =>
d3exp1(loc0, D3E1flt(tflt))
|D3Estr(tstr) =>
d3exp1(loc0, D3E1str(tstr))
//
|D3Evar(d2v1) =>
d3exp1(loc0, D3E1var(d2v1))
|D3Econ(d2c1) =>
d3exp1(loc0, D3E1con(d2c1))
|D3Ecst(d2c1) =>
d3exp1(loc0, D3E1cst(d2c1))
//
|D3Esapp _ => f0_sapp(d3e0, env0)
|D3Esapq _ => f0_sapq(d3e0, env0)
//
|D3Etapp _ => f0_tapp(d3e0, env0)
|D3Etapq _ => f0_tapq(d3e0, env0)
//
|D3Edap0 _ => f0_dap0(d3e0, env0)
|D3Edapp _ => f0_dapp(d3e0, env0)
//
|D3Eift0 _ => f0_ift0(d3e0, env0)
|D3Ecas0 _ => f0_cas0(d3e0, env0)
//
|D3Eseqn _ => f0_seqn(d3e0, env0)
//
|D3Etup0 _ => f0_tup0(d3e0, env0)
|D3Etup1 _ => f0_tup1(d3e0, env0)
//
|D3Elam0 _ => f0_lam0(d3e0, env0)
|D3Efix0 _ => f0_fix0(d3e0, env0)
//
|
D3Eannot _ => f0_annot(d3e0, env0)
//
|
_(*otherwise*) =>
(
d3exp1(loc0, t2p0, D3E1d3exp(d3e0)))
) where
{
//
(* ****** ****** *)
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
(* ****** ****** *)
//
fun
f0_sapp
(d3e0: d3exp
,env0: !env3cpy): d3exp1 =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Esapp
(d3f0, s2es) = d3e0.node()
//
val d3f0 =
(
  d3exp_trx3cpy(d3f0, env0))
//
in//let
d3exp1
(loc0, t2p0, D3E1sapp(d3f0, s2es))
end//let
//
(* ****** ****** *)
//
fun
f0_sapq
(d3e0: d3exp
,env0: !env3cpy): d3exp1 =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Esapq
(d3f0, t2ps) = d3e0.node()
//
val d3f0 =
(
  d3exp_trx3cpy(d3f0, env0))
//
in//let
d3exp1
(loc0, t2p0, D3E1sapq(d3f0, t2ps))
end//let
//
(* ****** ****** *)
//
fun
f0_tapp
(d3e0: d3exp
,env0: !env3cpy): d3exp1 =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Etapp
(d3f0, s2es) = d3e0.node()
//
val d3f0 =
(
  d3exp_trx3cpy(d3f0, env0))
//
in//let
d3exp1
(loc0, t2p0, D3E1tapp(d3f0, s2es))
end//let
//
(* ****** ****** *)
//
fun
f0_tapq
(d3e0: d3exp
,env0: !env3cpy): d3exp1 =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Etapq
(d3f0, tjas) = d3e0.node()
//
val d3f0 =
(
  d3exp_trx3cpy(d3f0, env0))
//
in//let
d3exp1
(loc0, t2p0, D3E1tapq(d3f0, tjas))
end//let
//
(* ****** ****** *)
//
fun
f0_dap0
(d3e0: d3exp
,env0: !env3cpy): d3exp1 =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Edap0
(   d3f0   ) = d3e0.node()
//
val d3f0 =
(
  d3exp_trx3cpy(d3f0, env0))
//
in//let
d3exp1(loc0, t2p0, D3E1dap0(d3f0))
end//let
//
(* ****** ****** *)
//
fun
f0_dapp
(d3e0: d3exp
,env0: !env3cpy): d3exp1 =
let
val-
D3Edapp
(d3f0
,npf1, d3es) = d3e0.node()
//
val d3f0 =
(
  d3exp_trx3cpy(d3f0, env0))
//
val d3es =
(
  d3explst_trx3cpy(d3es, env0))
//
in//let
//
d3exp1
( loc0
, t2p0, D3E1dapp(d3f0,npf1,d3es))
//
end//let
//
(* ****** ****** *)
//
fun
f0_ift0
(d3e0: d3exp
,env0: !env3cpy): d3exp1 =
let
val-
D3Eift0
(d3e1
,dthn, dels) = d3e0.node()
//
val d3e1 =
(
  d3exp_trx3cpy(d3e1, env0))
//
val dthn =
(
  d3expopt_trx3cpy(dthn, env0))
val dels =
(
  d3expopt_trx3cpy(dels, env0))
//
in//let
//
d3exp1
( loc0
, t2p0, D3E1ift0(d3e1,dthn,dels))
//
end//let
//
(* ****** ****** *)
//
fun
f0_cas0
(d3e0: d3exp
,env0: !env3cpy): d3exp1 =
let
//
val-
D3Ecas0
(tknd
,d3e1, d3cs) = d3e0.node()
//
val d3e1 =
(
  d3exp_trx3cpy(d3e1, env0))
//
val d3cs =
(
  d3clslst_trx3cpy(d3cs, env0))
//
in//let
//
d3exp1
( loc0
, t2p0, D3E1cas0(tknd,d3e1,d3cs))
//
end//let
//
(* ****** ****** *)
//
fun
f0_seqn
(d3e0: d3exp
,env0: !env3cpy): d3exp1 =
let
//
val-
D3Eseqn
(d3es, d3e1) = d3e0.node()
//
val d3es =
d3explst_trx3cpy(d3es, env0)
//
in//let
//
let
val d3e1 =
(
  d3exp_trx3cpy(d3e1, env0))
in//let
d3exp1
(loc0, t2p0, D3E1seqn(d3es,d3e1))
end//let
//
end//let
//
(* ****** ****** *)
//
fun
f0_tup0
(d3e0: d3exp
,env0: !env3cpy): d3exp1 =
let
//
val-
D3Etup0
(npf1, d3es) = d3e0.node()
//
val d3es =
d3explst_trx3cpy(d3es, env0)
//
in//let
//
d3exp1
(loc0, t2p0, D3E1tup0(npf1,d3es))
//
end//let
//
fun
f0_tup1
(d3e0: d3exp
,env0: !env3cpy): d3exp1 =
let
//
val-
D3Etup1
(tknd
,npf1, d3es) = d3e0.node()
//
val d3es =
d3explst_trx3cpy(d3es, env0)
//
in//let
//
d3exp1
( loc0
, t2p0, D3E1tup1(tknd,npf1,d3es))
//
end//let
//
(* ****** ****** *)
//
fun
f0_lam0
(d3e0: d3exp
,env0: !env3cpy): d3exp1 =
let
//
val-
D3Elam0
( tknd
, f3as, sres
, arrw, dexp) = d3e0.node()
//
val f3as =
f3arglst_trx3cpy(f3as, env0)
//
in//let
//
let
val dexp =
(
  d3exp_trx3cpy(dexp, env0))
in//let
d3exp1
( loc0
, t2p0
, D3E1lam0
  (tknd, f3as, sres, arrw, dexp))
end//let
//
end(*let*)//end-of-[f0_lam0(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_fix0
(d3e0: d3exp
,env0: !env3cpy): d3exp1 =
let
//
val-
D3Efix0
( tknd
, dpid
, f3as, sres
, arrw, dexp) = d3e0.node()
//
val f3as =
f3arglst_trx3cpy(f3as, env0)
//
in//let
//
let
val dexp =
(
  d3exp_trx3cpy(dexp, env0))
in//let
d3exp1
( loc0
, t2p0
, D3E1fix0
  (tknd,dpid,f3as,sres,arrw,dexp))
end//let
//
end(*let*)//end-of-[f0_fix0(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_try0
(d3e0: d3exp
,env0: !env3cpy): d3exp1 =
let
//
val-
D3Etry0
(tknd
,d3e1, dcls) = d3e0.node()
//
val d3e1 =
(
d3exp_trx3cpy(d3e1, env0))
val dcls =
d3clslst_trx3cpy(dcls, env0)
//
in//let
//
d3exp1
( loc0
, t2p0, D3E1try0(tknd,d3e1,dcls))
//
end(*let*)//end-of-[f0_try0(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_annot
(d3e0: d3exp
,env0: !env3cpy): d3exp1 =
let
//
val-
D3Eannot
(d3e1
,s1e2, s2e2) = d3e0.node()
//
val d3e1 =
(
d3exp_trx3cpy(d3e1, env0))
//
in//let
d3exp1
( loc0
, t2p0, D3E1annot(d3e1,s1e2,s2e2))
end(*let*)//end-of-[f0_annot(d3e0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val (  ) =
printsln("d3exp_trx3cpy: loc0 = ", loc0)
val (  ) =
printsln("d3exp_trx3cpy: t2p0 = ", t2p0)
val (  ) =
printsln("d3exp_trx3cpy: d3e0 = ", d3e0)
*)
//
(* ****** ****** *)
//
}(*where*)//end-of-[d3exp_trx3cpy(d3e0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
//
#implfun
f3arg_trx3cpy
(farg, env0) =
let
//
val loc0 = farg.lctn()
//
(*
val () =
prerrsln("\
f3arg_trx3cpy: loc0 = ", loc0)
val () =
prerrsln("\
f3arg_trx3cpy: farg = ", farg)
*)
//
in//let
//
case+
farg.node() of
//
|
F3ARGdapp
(npf1, d3ps) =>
let
val loc0 = farg.lctn()
val d3ps =
(
  d3patlst_trx3cpy(d3ps, env0))
in//let
f3arg1(loc0,F3ARG1dapp(npf1,d3ps))
end(*let*)//end-of-[F3ARG1dapp(...)]
//
|
F3ARGsapp
(s2vs, s2ps) =>
(
f3arg1(loc0,F3ARG1sapp(s2vs,s2ps)))
|
F3ARGmets
(   s2es   ) =>
(
f3arg1(loc0, F3ARG1mets(  s2es  )))
//
end(*let*)//end-of-[f3arg_trx3cpy(f3a0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3gua_trx3cpy
(dgua, env0) =
let
//
val loc0 = dgua.lctn()
//
(*
val () =
prerrsln("\
d3gua_trx3cpy: loc0 = ", loc0)
val () =
prerrsln("\
d3gua_trx3cpy: dgua = ", dgua)
*)
//
in//let
//
case+
dgua.node() of
//
|D3GUAexp(d3e1) =>
(
d3gua1
(loc0, D3GUA1exp(d3e1)))
where{
val d3e1 =
d3exp_trx3cpy(d3e1, env0)}
//
|D3GUAmat(d3e1, d3p2) =>
(
d3gua1
(loc0, D3GUA1mat(d3e1, d3p2)))
where
{
val
d3e1 = d3exp_trx3cpy(d3e1, env0)
val
d3p2 = d3pat_trx3cpy(d3p2, env0)}
//
end(*let*)//end-of-[d3gua_trx3cpy(dgua,env0)]
//
(* ****** ****** *)
//
#implfun
d3gpt_trx3cpy
(dgpt, env0) =
let
//
val loc0 = dgpt.lctn()
//
in//let
//
case+
dgpt.node() of
//
|D3GPTpat
(  d3p1  ) =>
let
val
d3p1 =
d3pat_trx3cpy(d3p1, env0)
in//let
d3gpt1(loc0, D3GPT1pat(d3p1))
end//let
//
|D3GPTgua
(d3p1, d3gs) =>
let
val
d3p1 =
d3pat_trx3cpy(d3p1, env0)
val
d3gs =
d3gualst_trx3cpy(d3gs, env0)
in//let
(
d3gpt1(loc0, D3GPT1gua(d3p1, d3gs)))
end//let
//
end(*let*)//end-of-[d3gpt_trx3cpy(dgpt,env0)]
//
(* ****** ****** *)
//
#implfun
d3cls_trx3cpy
(dcls, env0) =
let
//
val loc0 = dcls.lctn()
//
in//let
//
case+
dcls.node() of
//
|D3CLSgpt
(   dgpt   ) =>
let
val
dgpt =
d3gpt_trx3cpy(dgpt, env0)
in//let
d3cls1(loc0, D3CLS1gpt(dgpt))
end//let
//
|D3CLScls
(dgpt, d3e1) =>
let
//
val dgpt =
d3gpt_trx3cpy(dgpt, env0)
val d3e1 =
d3exp_trx3cpy(d3e1, env0)
in//let
(
d3cls1(loc0, D3CLS1cls(dgpt, d3e1)))
end//let
//
end(*let*)//end-of-[d3cls_trx3cpy(dcls,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trx3cpy_dynexp.dats] *)
(***********************************************************************)
