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
Fri Nov 10 13:33:46 EST 2023
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
//
#staload
_(*Trtmp3c*) = "./trtmp3c.dats"
//
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trtmp3c.sats"
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
trtmp3c_d3exp
(env0 , d3e0) =
let
//
(*
val
loc0 = d3e0.lctn()
val () =
prerrln
("trtmp3c_d3exp: loc0 = ", loc0)
val () =
prerrln
("trtmp3c_d3exp: d3e0 = ", d3e0)
*)
//
in//let
//
case+
d3e0.node() of
//
|D3Evar _ => d3e0
//
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
|D3Econ _ => d3e0
|D3Ecst _ => d3e0
//
|D3Etop _ => d3e0
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
|D3Edap0 _ => f0_dap0(env0, d3e0)
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
|D3Eview _ => f0_view(env0, d3e0)
|D3Eflat _ => f0_flat(env0, d3e0)
//
(* ****** ****** *)
|D3Efree _ => f0_free(env0, d3e0)
(* ****** ****** *)
//
|D3Edp2tr _ => f0_dp2tr(env0, d3e0)
|D3Edl0az _ => f0_dl0az(env0, d3e0)
|D3Edl1az _ => f0_dl1az(env0, d3e0)
//
(* ****** ****** *)
//
|D3Ewhere _ => f0_where(env0, d3e0)
//
(* ****** ****** *)
//
|D3Eassgn _ => f0_assgn(env0, d3e0)
//
|D3El0azy _ => f0_l0azy(env0, d3e0)
|D3El1azy _ => f0_l1azy(env0, d3e0)
//
(* ****** ****** *)
//
|D3Eannot _ => f0_annot(env0, d3e0)
//
(* ****** ****** *)
//
|
D3Eextnam _ => f0_extnam(env0, d3e0)
//
(* ****** ****** *)
//
|
_(*otherwise*) => (d3exp_none2(d3e0))
//
(* ****** ****** *)
//
end where // end-of-[trtmp3c_d3exp(...)]
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_timp
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Etimp
( d3f0
, timp ) = d3e0.node()
//
val timp =
tr3cenv_timp_process(env0, timp)
//
in
(
  d3exp_make_styp_node
  (loc0, t2p0, D3Etimp(d3f0, timp)) )
end(*let*)//end-of-[ f0_timp(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_sapp
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Esapp
( d3f0
, s2es ) = d3e0.node()
//
val
d3f0 = trtmp3c_d3exp(env0, d3f0)
//
in//let
(
  d3exp_make_styp_node
  (loc0, t2p0, D3Esapp(d3f0, s2es)) )
end(*let*)//end-of-[ f0_sapp(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_sapq
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Esapq
( d3f0
, t2ps ) = d3e0.node()
//
val
d3f0 = trtmp3c_d3exp(env0, d3f0)
//
in//let
(
  d3exp_make_styp_node
  (loc0, t2p0, D3Esapq(d3f0, t2ps)) )
end(*let*)//end-of-[ f0_sapq(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_tapp
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Etapp
( d3f0
, s2es ) = d3e0.node((*0*))
//
val
d3f0 = trtmp3c_d3exp(env0, d3f0)
//
in//let
(
  d3exp_make_styp_node
  (loc0, t2p0, D3Etapp(d3f0, s2es)) )
end where // end-of-[f0_tapp(env0,d3e0)]
{
//
(*
val () = prerrln
("trtmp3c_d3exp: f0_tapp: d3e0 = ", d3e0)
*)
//
} (*where*) // end of [f0_tapp(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_tapq
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Etapq
( d3f0
, t2js ) = d3e0.node((*0*))
//
in//let
//
case+
d3f0.node() of
|
D3Ecst(d2c0) =>
let
//
val
timp =
tr3cenv_tapq_resolve
( env0, d2c0, t2js )//val(timp)
//
(*
// HX:
// It is merged into
// [tr3cenv_tapq_resolve]
val
timp =
tr3cenv_timp_resolve
( env0
, d2c0, t2js, timp )//val(timp)
*)
//
val timp =
tr3cenv_timp_process(env0, timp)
//
in//let
(
d3exp_make_styp_node
(loc0, t2p0, D3Etimp(d3e0, timp)) )
end//let
| _(*non-D3Ecst*) => (    d3e0    )
//
end where // end-of-[f0_tapq(env0,d3e0)]
{
//
(*
val () = prerrln
("trtmp3c_d3exp: f0_tapq: d3e0 = ", d3e0)
*)
//
} (*where*) // end of [f0_tapq(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_dap0
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
(
d3exp_make_styp_node
( loc0
, t2p0, D3Edap0(d3f0))) where
{
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Edap0
( d3f0 ) = d3e0.node((*0*))
//
val d3f0 = trtmp3c_d3exp(env0, d3f0)
//
}(*where*)//end-of-[ f0_dap0(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Edapp
( d3f0
, npf1
, d3es ) = d3e0.node((*0*))
//
val
d3f0 = trtmp3c_d3exp(env0, d3f0)
val
d3es = trtmp3c_d3explst(env0, d3es)
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
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Elet0
( dcls
, d3e1 ) = d3e0.node((*0*))
//
val // enter
(  ) = tr3cenv_pshlet0(env0)
//
val
dcls =
trtmp3c_d3eclist(env0, dcls)
val
d3e1 = trtmp3c_d3exp(env0, d3e1)
//
val (  ) = tr3cenv_poplet0(env0)
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
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Eift0
( d3e1
, dthn
, dels ) = d3e0.node((*0*))
//
val d3e1 =
  trtmp3c_d3exp(env0, d3e1)
val dthn =
  trtmp3c_d3expopt(env0, dthn)
val dels =
  trtmp3c_d3expopt(env0, dels)
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
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Ecas0
( tknd
, d3e1
, dcls ) = d3e0.node((*0*))
//
val d3e1 =
  trtmp3c_d3exp(env0, d3e1)
val dcls =
  trtmp3c_d3clslst(env0, dcls)
//
in//let
d3exp_make_styp_node
(loc0, t2p0, D3Ecas0(tknd, d3e1, dcls))
end (*let*) // end of [f0_cas0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_seqn
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Eseqn
( d3es, d3e1) = d3e0.node()
//
val
d3es =
(
  trtmp3c_d3explst(env0, d3es))
val
d3e1 = trtmp3c_d3exp(env0, d3e1)
//
in//let
d3exp(loc0, t2p0, D3Eseqn(d3es, d3e1))
end (*let*)//end-of-[ f0_seqn(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_tup0
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Etup0
( npf1
, d3es ) = d3e0.node((*0*))
//
val d3es =
  trtmp3c_d3explst(env0, d3es)
//
in//let
d3exp(loc0, t2p0, D3Etup0(npf1, d3es))
end (*let*) // end-of-[f0_tup0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_tup1
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Etup1
( knd0
, npf1
, d3es ) = d3e0.node((*0*))
//
val d3es =
  trtmp3c_d3explst(env0, d3es)
//
in//let
d3exp_make_styp_node
(loc0, t2p0, D3Etup1(knd0, npf1, d3es))
end (*let*) // end-of-[f0_tup1(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_rcd2
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Ercd2
( knd0
, npf1
, ldes ) = d3e0.node((*0*))
//
val ldes =
  trtmp3c_l3d3elst(env0, ldes)
//
in//let
d3exp_make_styp_node
(loc0, t2p0, D3Ercd2(knd0, npf1, ldes))
end (*let*) // end-of-[f0_rcd2(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_lam0
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Elam0
(tknd
,f3as,sres
,arrw,body) = d3e0.node()
//
(*
val f3as =
trtmp3c_f3arglst(env0, f3as)
val
arrw =
trtmp3c_f1unarrw(env0, arrw)
val
sres = trtmp3c_s2res(env0, sres)
*)
//
val
body = trtmp3c_d3exp(env0, body)
//
in//let
d3exp_make_styp_node
(loc0,t2p0
,D3Elam0(tknd, f3as, sres, arrw, body))
end (*let*) // end of [f0_lam0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_fix0
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Efix0
(tknd
,d2v1
,f3as,sres
,arrw,body) = d3e0.node()
//
(*
val
f3as =
trtmp3c_f3arglst(env0, f3as)
val
arrw =
trtmp3c_f1unarrw(env0, arrw)
val
sres = trtmp3c_s2res(env0, sres)
*)
//
val
body = trtmp3c_d3exp(env0, body)
//
in//let
d3exp_make_styp_node
(
loc0,
t2p0,
D3Efix0
( tknd, d2v1, f3as, sres, arrw, body) )
end (*let*) // end of [f0_fix0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_addr
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Eaddr(d3e1) = d3e0.node()
//
val
d3e1 = trtmp3c_d3exp(env0, d3e1)
//
in//let
(
  d3exp(loc0, t2p0, D3Eaddr(d3e1)) )
end (*let*) // end of [f0_addr(env0,...)]
//
(* ****** ****** *)
//
fun
f0_view
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Eview(d3e1) = d3e0.node()
//
val
d3e1 = trtmp3c_d3exp(env0, d3e1)
//
in//let
(
  d3exp(loc0, t2p0, D3Eview(d3e1)) )
end (*let*) // end of [f0_view(env0,...)]
//
(* ****** ****** *)
//
fun
f0_flat
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Eflat(d3e1) = d3e0.node()
//
(*
val
d3e1 = trtmp3c_d3exp(env0, d3e1)
*)
//
in//let
(
  d3exp(loc0, t2p0, D3Eflat(d3e1)) )
end (*let*) // end of [f0_flat(env0,...)]
//
(* ****** ****** *)
//
fun
f0_free
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Efree(d3e1) = d3e0.node()
//
val
d3e1 = trtmp3c_d3exp(env0, d3e1)
//
in//let
(
  d3exp(loc0, t2p0, D3Efree(d3e1)) )
end (*let*) // end of [f0_free(env0,...)]
//
(* ****** ****** *)
//
fun
f0_dp2tr
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Edp2tr
( d3e1 ) = d3e0.node((*0*))
//
val
d3e1 = trtmp3c_d3exp(env0, d3e1)
//
in//let
(
  d3exp(loc0, t2p0, D3Edp2tr(d3e1)) )
end (*let*) // end of [f0_dp2tr(env0,...)]
//
(* ****** ****** *)
//
fun
f0_dl0az
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Edl0az
( d3e1 ) = d3e0.node((*0*))
//
val
d3e1 = trtmp3c_d3exp(env0, d3e1)
//
in//let
(
  d3exp(loc0, t2p0, D3Edl0az(d3e1)) )
end (*let*) // end of [f0_dl0az(env0,...)]
//
fun
f0_dl1az
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Edl1az
( d3e1 ) = d3e0.node((*0*))
//
val
d3e1 = trtmp3c_d3exp(env0, d3e1)
//
in//let
(
  d3exp(loc0, t2p0, D3Edl1az(d3e1)) )
end (*let*) // end of [f0_dl1az(env0,...)]
//
(* ****** ****** *)
//
fun
f0_where
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Ewhere
( d3e1
, dcls ) = d3e0.node((*0*))
//
val // enter
(  ) = tr3cenv_pshlet0(env0)
//
val
dcls =
trtmp3c_d3eclist(env0, dcls)
//
val
d3e1 = trtmp3c_d3exp(env0, d3e1)
//
val (  ) = tr3cenv_poplet0(env0)
//
in//let
(
  d3exp_make_styp_node
  (loc0, t2p0, D3Ewhere(d3e1, dcls)))
end (*let*) // end of [f0_where(env0,...)]
//
(* ****** ****** *)
//
fun
f0_assgn
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Eassgn
( d3el
, d3er ) = d3e0.node((*0*))
//
(*
val
d3el = // HX: lft: skipped
(
  trtmp3c_d3exp(env0, d3el) )
*)
//
val
d3er =
(
  trtmp3c_d3exp(env0, d3er) )
//
in//let
(
  d3exp_make_styp_node
  (loc0, t2p0, D3Eassgn(d3el, d3er)) )
end (*let*) // end of [f0_assgn(env0,...)]
//
(* ****** ****** *)
//
fun
f0_l0azy
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3El0azy
( knd0
, d3e1 ) = d3e0.node((*0*))
//
val
d3e1 =
(
  trtmp3c_d3exp(env0, d3e1) )
//
in//let
(
  d3exp_make_styp_node
  (loc0, t2p0, D3El0azy(knd0, d3e1)) )
end (*let*) // end of [f0_l0azy(env0,...)]
//
(* ****** ****** *)
//
fun
f0_l1azy
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3El1azy
( knd0
, d3e1
, d3es ) = d3e0.node((*0*))
//
val
d3e1 =
(
  trtmp3c_d3exp(env0, d3e1) )
val d3es =
(
  trtmp3c_d3explst(env0, d3es) )
//
in//let
(
d3exp_make_styp_node
(loc0, t2p0, D3El1azy(knd0,d3e1,d3es)))
end (*let*) // end of [f0_l1azy(env0,...)]
//
(* ****** ****** *)
//
fun
f0_annot
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val t2p0 = d3e0.styp()
//
val-
D3Eannot
( d3e1
, s1e2
, s2e2 ) = d3e0.node((*0*))
//
val
d3e1 = trtmp3c_d3exp(env0, d3e1)
//
in//let
(
d3exp_make_styp_node
(loc0, t2p0, D3Eannot(d3e1,s1e2,s2e2)))
end (*let*) // end of [f0_annot(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_extnam
( env0:
! tr3cenv
, d3e0: d3exp): d3exp =
let
//
val-
D3Eextnam
( tknd, gnm1) = d3e0.node() in (d3e0) end
//
(* ****** ****** *)
(* ****** ****** *)
//
} (*where*)//end-of-[trtmp3c_d3exp(env0,d3e0)]

(* ****** ****** *)
//
#implfun
trtmp3c_d3gpt
  (env0, dgpt) = let
//
(*
val loc0 = dgpt.lctn()
val
val () =
prerrln
("trtmp3c_d3gpt: dgpt = ", dgpt)
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
end(*let*)//end-of-[trtmp3c_d3gpt(env0,dgpt)]
//
(* ****** ****** *)
//
#implfun
trtmp3c_d3cls
  (env0, dcls) = let
//
val loc0 = dcls.lctn()
//
(*
val
val () =
prerrln
("trtmp3c_d3cls: dcls = ", dcls)
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
trtmp3c_d3gpt(env0, dgpt)
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
val dgpt = trtmp3c_d3gpt(env0, dgpt)
val d3e1 = trtmp3c_d3exp(env0, d3e1)
//
}(*where*)//end of [D3CLScls(dgpt,d3e1)]
//
end(*let*)//end-of-[trtmp3c_d3cls(env0,dcls)]
//
(* ****** ****** *)
//
#implfun
trtmp3c_teqd3exp
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
  d3e2 = trtmp3c_d3exp(env0, d3e2) } )
(*case+*)//end-of(trtmp3c_teqd3exp(env0,tdxp))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trtmp3c_d3explst
  (env0, d3es) =
(
  list_trtmp3c_fnp(env0, d3es, trtmp3c_d3exp))
//
(* ****** ****** *)
//
#implfun
trtmp3c_d3expopt
( env0, dopt ) =
(
  optn_trtmp3c_fnp(env0, dopt, trtmp3c_d3exp))
//
(* ****** ****** *)
//
#implfun
trtmp3c_l3d3elst
( env0, ldes ) =
(
  list_trtmp3c_fnp(env0, ldes, trtmp3c_l3d3e))
//
(* ****** ****** *)
//
#implfun
trtmp3c_d3clslst
( env0, dcls ) =
(
  list_trtmp3c_fnp(env0, dcls, trtmp3c_d3cls))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3c_dynexp.dats] *)
