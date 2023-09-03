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
Wed Aug 23 13:53:22 EDT 2023
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
_(*Trtmp3b*) = "./trtmp3b.dats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trtmp3b.sats"
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
(* ****** ****** *)
#symload lctn with d3gpt_get_lctn
#symload node with d3gpt_get_node
(* ****** ****** *)
#symload lctn with d3cls_get_lctn
#symload node with d3cls_get_node
(* ****** ****** *)
//
#implfun
trtmp3b_d3exp
(env0 , d3e0) =
let
//
// (*
val
loc0 = d3e0.lctn()
val () =
prerrln
("trtmp3b_d3exp: loc0 = ", loc0)
val () =
prerrln
("trtmp3b_d3exp: d3e0 = ", d3e0)
// *)
//
in//let
//
case+
d3e0.node() of
//
(*
|D3Eint _ => d3e0
|D3Ebtf _ => d3e0
|D3Echr _ => d3e0
|D3Eflt _ => d3e0
|D3Estr _ => d3e0
//
|D3Ei00 _ => d3e0
|D3Eb00 _ => d3e0
|D3Ec00 _ => d3e0
|D3Ef00 _ => d3e0
|D3Es00 _ => d3e0
//
|D3Evar _ => d3e0
|D3Econ _ => d3e0
|D3Ecst _ => d3e0
//
|D3Etop _ => d3e0
//
*)
//
|D3Edap0 _ => f0_dap0(env0, d3e0)
|D3Edapp _ => f0_dapp(env0, d3e0)
//
|D3Elet0 _ => f0_let0(env0, d3e0)
//
|D3Eift0 _ => f0_ift0(env0, d3e0)
|D3Ecas0 _ => f0_cas0(env0, d3e0)
//
|D3Ewhere _ => f0_where(env0, d3e0)
//
| _(* otherwise *) => d3exp_none2(d3e0)
//
endlet where
{
//
(* ****** ****** *)
//
fun
f0_dap0
( env0:
! tr3benv
, d3e0: d3exp): d3exp =
(
d3exp_make_styp_node
( loc0
, t2p0, D3Edap0(d3f0))) where
{
//
val
loc0 = d3e0.lctn()
val-
D3Edap0(d3f0) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
//
val d3f0 = trtmp3b_d3exp(env0, d3f0)
//
}(*where*)//end-of-[ f0_dap0(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! tr3benv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Edapp
( d3f0
, npf1, d3es) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
//
val
d3f0 = trtmp3b_d3exp(env0, d3f0)
val
d3es = trtmp3b_d3explst(env0, d3es)
//
in//let
d3exp_make_styp_node
(loc0, t2p0, D3Edapp(d3f0, npf1, d3es))
end (*let*)//end-of-[ f0_dapp(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_let0
( env0:
! tr3benv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Elet0
( dcls, d3e1) = d3e0.node()
//
val // enter
(  ) = tr3benv_pshlet0(env0)
//
val
dcls =
trtmp3b_d3eclist(env0, dcls)
val
d3e1 = trtmp3b_d3exp(env0, d3e1)
//
val (  ) = tr3benv_poplet0(env0)
//
in//let
(
  d3exp_make_styp_node
  (loc0, t2p0, D3Elet0(dcls, d3e1)))
end (*let*) // end of [f0_let0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_ift0
( env0:
! tr3benv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Eift0
(d3e1
,dthn, dels) = d3e0.node()
//
val d3e1 =
trtmp3b_d3exp(env0, d3e1)
val dthn =
trtmp3b_d3expopt(env0, dthn)
val dels =
trtmp3b_d3expopt(env0, dels)
//
in//let
d3exp_make_styp_node
(loc0, t2p0, D3Eift0(d3e1, dthn, dels))
end (*let*) // end of [f0_ift0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_cas0
( env0:
! tr3benv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Ecas0
(tknd
,d3e1, dcls) = d3e0.node()
//
val d3e1 =
trtmp3b_d3exp(env0, d3e1)
val dcls =
trtmp3b_d3clslst(env0, dcls)
//
in//let
d3exp_make_styp_node
(loc0, t2p0, D3Ecas0(tknd, d3e1, dcls))
end (*let*) // end of [f0_cas0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_where
( env0:
! tr3benv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Ewhere
( d3e1, dcls) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
//
val // enter
(  ) = tr3benv_pshlet0(env0)
//
val
dcls =
trtmp3b_d3eclist(env0, dcls)
//
val
d3e1 = trtmp3b_d3exp(env0, d3e1)
//
val (  ) = tr3benv_poplet0(env0)
//
in//let
(
  d3exp_make_styp_node
  (loc0, t2p0, D3Ewhere(d3e1, dcls)))
end (*let*) // end of [f0_where(env0,...)]
//
(* ****** ****** *)
//
} (*where*)//end-of-[trtmp3b_d3exp(env0,d3e0)]
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3gpt
  (env0, dgpt) = let
//
(*
val loc0 = dgpt.lctn()
val
val () =
prerrln
("trtmp3b_d3gpt: dgpt = ", dgpt)
*)
//
in//let
//
case+
dgpt.node() of
//
|
D3GPTpat(d3p1) => dgpt//nothing
|
D3GPTgua(d3p1, d3gs) => dgpt//nothing
//
end(*let*)//end-of-[trtmp3b_d3gpt(env0,dgpt)]
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3cls
  (env0, dcls) = let
//
val loc0 = dcls.lctn()
//
(*
val
val () =
prerrln
("trtmp3b_d3cls: dcls = ", dcls)
*)
//
in//let
//
case+
dcls.node() of
|
D3CLSgpt
(  dgpt  ) =>
(
d3cls_make_node
( loc0
, D3CLSgpt(dgpt))) where
{
//
val
dgpt =
trtmp3b_d3gpt(env0, dgpt)
//
}(*where*)//end-of-[D3CLSgpt(...)]
|
D3CLScls
(dgpt,d3e1) =>
(
d3cls_make_node
( loc0
, D3CLScls(dgpt, d3e1))) where
{
//
val dgpt = trtmp3b_d3gpt(env0, dgpt)
val d3e1 = trtmp3b_d3exp(env0, d3e1)
//
}(*where*)//end of [D3CLScls(dgpt,d3e1)]
//
end(*let*)//end-of-[trtmp3b_d3cls(env0,dcls)]
//
(* ****** ****** *)
//
#implfun
trtmp3b_teqd3exp
  (env0, tdxp) =
(
case+ tdxp of
|
TEQD3EXPnone() =>
TEQD3EXPnone((*void*))
|
TEQD3EXPsome(teq1, d3e2) =>
TEQD3EXPsome(teq1, d3e2) where
{ val
  d3e2 = trtmp3b_d3exp(env0, d3e2) } )
(*case+*)//end-of(trtmp3b_teqd3exp(env0,tdxp))
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3explst
( env0, d3es ) =
(
  list_trtmp3b_fnp(env0, d3es, trtmp3b_d3exp))
//
#implfun
trtmp3b_d3expopt
( env0, dopt ) =
(
  optn_trtmp3b_fnp(env0, dopt, trtmp3b_d3exp))
//
(* ****** ****** *)
//
#implfun
trtmp3b_d3clslst
( env0, dcls ) =
(
  list_trtmp3b_fnp(env0, dcls, trtmp3b_d3cls))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3b_dynexp.dats] *)
