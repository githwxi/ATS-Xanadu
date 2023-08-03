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
Tue 25 Jul 2023 05:33:23 PM EDT
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
_(*TRANS3a*) = "./trans3a.dats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trans3a.sats"
(* ****** ****** *)
#symload styp with d2var_get_styp
(* ****** ****** *)
#symload lctn with d3pat_get_lctn
#symload node with d3pat_get_node
#symload styp with d3pat_get_styp
(* ****** ****** *)
#symload lctn with d3exp_get_lctn
#symload node with d3exp_get_node
#symload styp with d3exp_get_styp
(* ****** ****** *)
#symload lctn with f3arg_get_lctn
#symload node with f3arg_get_node
(* ****** ****** *)
#symload lctn with d3gua_get_lctn
#symload node with d3gua_get_node
(* ****** ****** *)
#symload lctn with d3gpt_get_lctn
#symload node with d3gpt_get_node
(* ****** ****** *)

#implfun
trans3a_d3pat
(env0 , d3p0) =
let
//
(*
val
loc0 = d3p0.lctn()
val () =
prerrln
("trans3a_d3pat: loc0 = ", loc0)
val () =
prerrln
("trans3a_d3pat: d3p0 = ", d3p0)
*)
//
in//let
case+
d3p0.node() of
//
|D3Pvar _ => f0_var(env0, d3p0)
|D3Pany _ => f0_any(env0, d3p0)
//
|D3Pint _ => f0_int(env0, d3p0)
|D3Pbtf _ => f0_btf(env0, d3p0)
|D3Pchr _ => f0_chr(env0, d3p0)
|D3Pflt _ => f0_flt(env0, d3p0)
|D3Pstr _ => f0_str(env0, d3p0)
//
|D3Pcon _ => f0_con(env0, d3p0)
//
|D3Ptapq _ => f0_tapq(env0, d3p0)
//
|D3Pdap1 _ => f0_dap1(env0, d3p0)
|D3Pdapp _ => f0_dapp(env0, d3p0)
//
|D3Ptup0 _ => f0_tup0(env0, d3p0)
|D3Ptup1 _ => f0_tup1(env0, d3p0)
|D3Prcd2 _ => f0_rcd2(env0, d3p0)
//
|D3Pannot _ => f0_annot(env0, d3p0)
//
|
_(* otherwise *) => d3pat_none2(d3p0)
//
endlet where
{
//
(* ****** ****** *)
//
fun
f0_int
( env0:
! tr3aenv
, d3p0: d3pat): d3pat = d3p0//end-of-fun
fun
f0_btf
( env0:
! tr3aenv
, d3p0: d3pat): d3pat = d3p0//end-of-fun
fun
f0_chr
( env0:
! tr3aenv
, d3p0: d3pat): d3pat = d3p0//end-of-fun
fun
f0_flt
( env0:
! tr3aenv
, d3p0: d3pat): d3pat = d3p0//end-of-fun
fun
f0_str
( env0:
! tr3aenv
, d3p0: d3pat): d3pat = d3p0//end-of-fun
//
(* ****** ****** *)
//
fun
f0_con
( env0:
! tr3aenv
, d3p0: d3pat): d3pat = d3p0//end-of-fun
//
(* ****** ****** *)
//
fun
f0_var
( env0:
! tr3aenv
, d3p0: d3pat): d3pat =
(
d3pat_make_styp_node
( loc0
, t2p0, D3Pvar(d2v1))) where
{
//
val loc0 = d3p0.lctn()
val-
D3Pvar(d2v1) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val t2p0 = s2typ_hnfiz0(t2p0)
val t2p0 = trans3a_s2typ(env0, t2p0)
//
}(*where*)//end-of-[f0_var(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_any
( env0:
! tr3aenv
, d3p0: d3pat): d3pat =
(
d3pat_make_styp_node
( loc0
, t2p0, D3Pany((*0*)))) where
{
//
val loc0 = d3p0.lctn()
val-
D3Pany((*0*)) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val t2p0 = s2typ_hnfiz0(t2p0)
val t2p0 = trans3a_s2typ(env0, t2p0)
//
}(*where*)//end-of-[f0_any(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_tapq
( env0:
! tr3aenv
, d3p0: d3pat): d3pat =
let
//
val loc0 = d3p0.lctn()
//
val-
D3Ptapq
( d3p1, t2js) = d3p0.node()
//
val
t2p0 = d3p0.styp((*0*))
val
t2p0 = s2typ_hnfiz0(t2p0)
val
t2p0 = trans3a_s2typ(env0, t2p0)
//
val
d3p1 = trans3a_d3pat(env0, d3p1)
val
t2js = trans3a_t2jaglst(env0, t2js)
//
in//let
(
  d3pat
  (loc0, t2p0, D3Ptapq(d3p1, t2js)) )
end(*let*)//end-of-[f0_tapq(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_dap1
( env0:
! tr3aenv
, d3p0: d3pat): d3pat =
let
//
val loc0 = d3p0.lctn()
//
val-
D3Pdap1(d3f0) = d3p0.node()
//
val
t2p0 = d3p0.styp((*0*))
val
t2p0 = s2typ_hnfiz0(t2p0)
val
t2p0 = trans3a_s2typ(env0, t2p0)
//
val
d3f0 = trans3a_d3pat(env0, d3f0)
//
in//let
(
  d3pat(loc0, t2p0, D3Pdap1(d3f0)) )
end(*let*)//end-of-[f0_dap1(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! tr3aenv
, d3p0: d3pat): d3pat =
let
//
val loc0 = d3p0.lctn()
//
val-
D3Pdapp
( d3f0
, npf1, d3ps) = d3p0.node()
//
val
t2p0 = d3p0.styp((*0*))
val
t2p0 = s2typ_hnfiz0(t2p0)
val
t2p0 = trans3a_s2typ(env0, t2p0)
//
val
d3f0 = trans3a_d3pat(env0, d3f0)
val
d3ps = trans3a_d3patlst(env0, d3ps)
//
in//let
d3pat_make_styp_node
(loc0, t2p0, D3Pdapp(d3f0,npf1,d3ps))
end(*let*)//end-of-[f0_dapp(env0,d3p0)]
//
(* ****** ****** *)
//
fun
f0_tup0
( env0:
! tr3aenv
, d3p0: d3pat): d3pat =
let
//
val loc0 = d3p0.lctn()
val-
D3Ptup0
( npf1, d3ps) = d3p0.node()
//
val t2p0 =
d3p0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val d3ps =
trans3a_d3patlst(env0, d3ps)
//
in//let
d3pat(loc0, t2p0, D3Ptup0(npf1, d3ps))
end (*let*)//end-of-[ f0_tup0(env0,d3p0) ]
//
(* ****** ****** *)
//
fun
f0_tup1
( env0:
! tr3aenv
, d3p0: d3pat): d3pat =
let
//
val loc0 = d3p0.lctn()
val-
D3Ptup1
( knd0
, npf1, d3ps) = d3p0.node()
//
val t2p0 =
d3p0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val d3ps =
trans3a_d3patlst(env0, d3ps)
//
in//let
d3pat_make_styp_node
(loc0, t2p0, D3Ptup1(knd0, npf1, d3ps))
end (*let*)//end-of-[ f0_tup1(env0,d3p0) ]
//
(* ****** ****** *)
//
fun
f0_rcd2
( env0:
! tr3aenv
, d3p0: d3pat): d3pat =
let
//
val loc0 = d3p0.lctn()
val-
D3Prcd2
( knd0
, npf1, ldps) = d3p0.node()
//
val t2p0 =
d3p0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val ldps =
trans3a_l3d3plst(env0, ldps)
//
in//let
d3pat_make_styp_node
(loc0, t2p0, D3Prcd2(knd0, npf1, ldps))
end (*let*)//end-of-[ f0_rcd2(env0,d3p0) ]
//
(* ****** ****** *)
//
fun
f0_annot
( env0:
! tr3aenv
, d3p0: d3pat): d3pat =
let
//
val loc0 = d3p0.lctn()
//
val-
D3Pannot
( d3p1
, s1e2, s2e2) = d3p0.node()
//
val
t2p0 = d3p0.styp((*0*))
val
t2p0 = s2typ_hnfiz0(t2p0)
val
t2p0 = trans3a_s2typ(env0, t2p0)
//
val
d3p1 = trans3a_d3pat(env0, d3p1)
//
in//let
d3pat_make_styp_node
(loc0, t2p0, D3Pannot(d3p1,s1e2,s2e2))
end(*let*)//end of [f0_annot(env0,d3p0)]

(* ****** ****** *)
//
} (*where*)//end-of-[trans3a_d3pat(env0,d3p0)]

(* ****** ****** *)

#implfun
trans3a_d3exp
(env0 , d3e0) =
let
//
// (*
val
loc0 = d3e0.lctn()
val () =
prerrln
("trans3a_d3exp: loc0 = ", loc0)
val () =
prerrln
("trans3a_d3exp: d3e0 = ", d3e0)
// *)
//
in//let
case+
d3e0.node() of
//
|D3Evar _ => f0_var(env0, d3e0)
//
|D3Eint _ => f0_int(env0, d3e0)
|D3Ebtf _ => f0_btf(env0, d3e0)
|D3Echr _ => f0_chr(env0, d3e0)
|D3Eflt _ => f0_flt(env0, d3e0)
|D3Estr _ => f0_str(env0, d3e0)
//
|D3Econ _ => f0_con(env0, d3e0)
|D3Ecst _ => f0_cst(env0, d3e0)
//
|D3Etop _ => f0_top(env0, d3e0)
//
|D3Esapp _ => f0_sapp(env0, d3e0)
|D3Esapq _ => f0_sapq(env0, d3e0)
//
|D3Etapp _ => f0_tapp(env0, d3e0)
|D3Etapq _ => f0_tapq(env0, d3e0)
//
|D3Edap0 _ => f0_dap0(env0, d3e0)
|D3Edapp _ => f0_dapp(env0, d3e0)
//
|D3Epcon _ => f0_pcon(env0, d3e0)
|D3Eproj _ => f0_proj(env0, d3e0)
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
|D3Eaddr _ => f0_addr(env0, d3e0)
|D3Eflat _ => f0_flat(env0, d3e0)
//
|D3Eeval _ => f0_eval(env0, d3e0)
//
|D3Efold _ => f0_fold(env0, d3e0)
|D3Efree _ => f0_free(env0, d3e0)
//
|
D3Ewhere _ => f0_where(env0, d3e0)
//
|
D3Eassgn _ => f0_assgn(env0, d3e0)
//
|
_(* otherwise *) => d3exp_none2(d3e0)
//
endlet where
{
//
(* ****** ****** *)
//
fun
f0_int
( env0:
! tr3aenv
, d3e0: d3exp): d3exp = d3e0//end-of-fun
fun
f0_btf
( env0:
! tr3aenv
, d3e0: d3exp): d3exp = d3e0//end-of-fun
fun
f0_chr
( env0:
! tr3aenv
, d3e0: d3exp): d3exp = d3e0//end-of-fun
fun
f0_flt
( env0:
! tr3aenv
, d3e0: d3exp): d3exp = d3e0//end-of-fun
fun
f0_str
( env0:
! tr3aenv
, d3e0: d3exp): d3exp = d3e0//end-of-fun
//
(* ****** ****** *)
//
fun
f0_var
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
(
d3exp_make_styp_node
( loc0
, t2p0, D3Evar(d2v1))) where
{
//
val loc0 = d3e0.lctn()
val-
D3Evar(d2v1) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val t2p0 = s2typ_hnfiz0(t2p0)
val t2p0 = trans3a_s2typ(env0, t2p0)
//
}(*where*)//end-of-[ f0_var(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_con
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
(
d3exp_make_styp_node
( loc0
, t2p0, D3Econ(d2c1))) where
{
//
val loc0 = d3e0.lctn()
val-
D3Econ(d2c1) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val t2p0 = s2typ_hnfiz0(t2p0)
val t2p0 = trans3a_s2typ(env0, t2p0)
//
}(*where*)//end-of-[ f0_con(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_cst
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
(
d3exp_make_styp_node
( loc0
, t2p0, D3Ecst(d2c1))) where
{
//
val loc0 = d3e0.lctn()
val-
D3Ecst(d2c1) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val t2p0 = s2typ_hnfiz0(t2p0)
val t2p0 = trans3a_s2typ(env0, t2p0)
//
}(*where*)//end-of-[ f0_cst(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_top
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
(
d3exp_make_styp_node
( loc0
, t2p0, D3Etop(sym1))) where
{
//
val loc0 = d3e0.lctn()
val-
D3Etop(sym1) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val t2p0 = s2typ_hnfiz0(t2p0)
val t2p0 = trans3a_s2typ(env0, t2p0)
//
}(*where*)//end-of-[ f0_top(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_sapp
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Esapp
(d3f0, s2es) = d3e0.node()
//
val
d3f0 = trans3a_d3exp(env0, d3f0)
//
in//let
d3exp_make_styp_node
(loc0, d3f0.styp(), D3Esapp(d3f0,s2es))
end(*let*)//end-of-[ f0_sapp(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_sapq
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Esapq
(d3f0, t2ps) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val
t2ps =
trans3a_s2typlst(env0, t2ps)
//
val
d3f0 = trans3a_d3exp(env0, d3f0)
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
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Etapp
(d3f0, s2es) = d3e0.node()
//
val
d3f0 = trans3a_d3exp(env0, d3f0)
//
in//let
d3exp_make_styp_node
(loc0, d3f0.styp(), D3Etapp(d3f0,s2es))
end(*let*)//end-of-[ f0_tapp(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_tapq
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Etapq
(d3f0, t2js) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val
t2js =
trans3a_t2jaglst(env0, t2js)
//
val
d3f0 = trans3a_d3exp(env0, d3f0)
//
in//let
(
  d3exp_make_styp_node
  (loc0, t2p0, D3Etapq(d3f0, t2js)) )
end(*let*)//end-of-[ f0_tapq(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_dap0
( env0:
! tr3aenv
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
val t2p0 = s2typ_hnfiz0(t2p0)
val t2p0 = trans3a_s2typ(env0, t2p0)
//
val d3f0 = trans3a_d3exp(env0, d3f0)
//
}(*where*)//end-of-[ f0_dap0(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Edapp
( d3f0
, npf1, d3es) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val d3f0 =
trans3a_d3exp(env0, d3f0)
val d3es =
trans3a_d3explst(env0, d3es)
//
in//let
d3exp_make_styp_node
(loc0, t2p0, D3Edapp(d3f0, npf1, d3es))
end (*let*)//end-of-[ f0_dapp(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_pcon
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Epcon
( tknd
, dlab, dcon) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val
dcon = trans3a_d3exp(env0, dcon)
//
in//let
d3exp_make_styp_node
(loc0, t2p0, D3Epcon(tknd, dlab, dcon))
end (*let*)//end-of-[ f0_pcon(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_proj
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Eproj
( tknd
, dlab, dtup) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val
dtup = trans3a_d3exp(env0, dtup)
//
in//let
d3exp_make_styp_node
(loc0, t2p0, D3Eproj(tknd, dlab, dtup))
end (*let*)//end-of-[ f0_proj(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_let0
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Elet0
( dcls, d3e1) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val
dcls =
trans3a_d3eclist(env0, dcls)
val
d3e1 = trans3a_d3exp(env0, d3e1)
//
in//let
(
  d3exp_make_styp_node
  (loc0, t2p0, D3Elet0(dcls, d3e1)))
end (*let*)//end-of-[ f0_let0(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_ift0
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Eift0
(d3e1
,dthn, dels) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val d3e1 =
trans3a_d3exp(env0, d3e1)
val dthn =
trans3a_d3expopt(env0, dthn)
val dels =
trans3a_d3expopt(env0, dels)
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
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Ecas0
(tknd
,d3e1, d3cs) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val d3e1 =
trans3a_d3exp(env0, d3e1)
val d3cs =
trans3a_d3clslst(env0, d3cs)
//
in//let
d3exp_make_styp_node
(loc0, t2p0, D3Ecas0(tknd, d3e1, d3cs))
end (*let*) // end of [f0_cas0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_seqn
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Eseqn
( d3es, d3e1) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val
d3es =
trans3a_d3explst(env0, d3es)
val
d3e1 = trans3a_d3exp(env0, d3e1)
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
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Etup0
( npf1, d3es) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val d3es =
trans3a_d3explst(env0, d3es)
//
in//let
d3exp(loc0, t2p0, D3Etup0(npf1, d3es))
end (*let*)//end-of-[ f0_tup0(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_tup1
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Etup1
( knd0
, npf1, d3es) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val d3es =
trans3a_d3explst(env0, d3es)
//
in//let
d3exp_make_styp_node
(loc0, t2p0, D3Etup1(knd0, npf1, d3es))
end (*let*)//end-of-[ f0_tup1(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_rcd2
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Ercd2
( knd0
, npf1, ldes) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val ldes =
trans3a_l3d3elst(env0, ldes)
//
in//let
d3exp_make_styp_node
(loc0, t2p0, D3Ercd2(knd0, npf1, ldes))
end (*let*)//end-of-[ f0_rcd2(env0,d3e0) ]
//
(* ****** ****** *)
//
fun
f0_lam0
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Elam0
(tknd
,f3as,sres
,arrw,body) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val
f3as =
trans3a_f3arglst(env0, f3as)
(*
val
arrw =
trans3a_f1unarrw(env0, arrw)
*)
(*
val
sres = trans3a_s2res(env0, sres)
*)
val
body = trans3a_d3exp(env0, body)
//
in//let
d3exp_make_styp_node
( loc0, t2p0
, D3Elam0(tknd,f3as,sres,arrw,body))
end (*let*) // end of [f0_lam0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_fix0
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Efix0
(tknd
,d2v1
,f3as,sres
,arrw,body) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
(*
val
d2v1 =
trans3a_d2var(env0, d2v1)
*)
//
val
f3as =
trans3a_f3arglst(env0, f3as)
(*
val
arrw =
trans3a_f1unarrw(env0, arrw)
*)
(*
val
sres = trans3a_s2res(env0, sres)
*)
val
body = trans3a_d3exp(env0, body)
//
in//let
d3exp_make_styp_node
(
loc0,
t2p0,
D3Efix0
(tknd, d2v1, f3as, sres, arrw, body))
end (*let*) // end of [f0_fix0(env0,d3e0)]
//
(* ****** ****** *)
//
fun
f0_addr
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Eaddr(d3e1) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val
d3e1 = trans3a_d3exp(env0, d3e1)
//
in//let
(
  d3exp(loc0, t2p0, D3Eaddr(d3e1)) )
end (*let*) // end of [f0_addr(env0,...)]
//
(* ****** ****** *)
//
fun
f0_flat
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Eflat(d3e1) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val
d3e1 = trans3a_d3exp(env0, d3e1)
//
in//let
(
  d3exp(loc0, t2p0, D3Eflat(d3e1)) )
end (*let*) // end of [f0_flat(env0,...)]
//
(* ****** ****** *)
//
fun
f0_eval
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Eeval(d3e1) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val
d3e1 = trans3a_d3exp(env0, d3e1)
//
in//let
(
  d3exp(loc0, t2p0, D3Eeval(d3e1)) )
end (*let*) // end of [f0_eval(env0,...)]
//
(* ****** ****** *)
//
fun
f0_fold
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Efold(d3e1) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val
d3e1 = trans3a_d3exp(env0, d3e1)
//
in//let
(
  d3exp(loc0, t2p0, D3Efold(d3e1)) )
end (*let*) // end of [f0_fold(env0,...)]
//
(* ****** ****** *)
//
fun
f0_free
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Efree(d3e1) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val
d3e1 = trans3a_d3exp(env0, d3e1)
//
in//let
(
  d3exp(loc0, t2p0, D3Efree(d3e1)) )
end (*let*) // end of [f0_free(env0,...)]
//
(* ****** ****** *)
//
fun
f0_where
( env0:
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
val-
D3Ewhere
( d3e1, dcls) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val
dcls =
trans3a_d3eclist(env0, dcls)
val
d3e1 = trans3a_d3exp(env0, d3e1)
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
! tr3aenv
, d3e0: d3exp): d3exp =
let
//
val loc0 = d3e0.lctn()
//
val-
D3Eassgn
( d3el, d3er) = d3e0.node()
//
val t2p0 =
d3e0.styp((*0*))
val t2p0 =
s2typ_hnfiz0(t2p0)
val t2p0 =
trans3a_s2typ(env0, t2p0)
//
val
d3el = trans3a_d3exp(env0, d3el)
val
d3er = trans3a_d3exp(env0, d3er)
//
in//let
(
  d3exp_make_styp_node
  (loc0, t2p0, D3Eassgn(d3el, d3er)) )
end (*let*) // end of [f0_assgn(env0,...)]
//
(* ****** ****** *)
//
} (*where*)//end-of-[trans3a_d3exp(env0,d3e0)]

(* ****** ****** *)
//
#implfun
trans3a_f3arg
( env0, farg ) =
let
//
(*
val
loc0 = farg.lctn()
val () =
prerrln
("trans3a_f3arg: loc0 = ", loc0)
val () =
prerrln
("trans3a_f3arg: farg = ", farg)
*)
//
in//let
//
case+
farg.node() of
|
F3ARGdapp _ => f0_dyn0(env0,farg)
|
F3ARGsapp _ => f0_sapp(env0,farg)
|
F3ARGmets _ => f0_mets(env0,farg)
//
end where // end-of-let
{
//
(* ****** ****** *)
//
fun
f0_dyn0
( env0:
! tr3aenv
, farg: f3arg): f3arg =
let
//
val loc0 = farg.lctn()
//
val-
F3ARGdapp
(npf1, d3ps) = farg.node()
//
val d3ps =
trans3a_d3patlst(env0, d3ps)
//
in//let
  f3arg(loc0,F3ARGdapp(npf1,d3ps))
end (*let*) // end of [f0_dyn0(env0,farg)]
//
(* ****** ****** *)
//
fun
f0_sapp
( env0:
! tr3aenv
, farg: f3arg): f3arg = farg // end-of-fun
fun
f0_mets
( env0:
! tr3aenv
, farg: f3arg): f3arg = farg // end-of-fun
//
(* ****** ****** *)
//
} (*where*)//end of [trans3a_f3arg(env0,farg)]

(* ****** ****** *)
//
#implfun
trans3a_d3gua
  (env0, dgua) =
(
case+
dgua.node() of
|
D3GUAexp(d3e1) =>
let
val d3e1 =
trans3a_d3exp(env0, d3e1)
in//let
d3gua(loc0, D3GUAexp(d3e1))
end//let//end-of-[D3GUAexp(...)]
|
D3GUAmat(d3e1,d3p2) =>
let
val d3e1 =
trans3a_d3exp(env0, d3e1)
val d3p2 =
trans3a_d3pat(env0, d3p2)
in//let
d3gua(loc0, D3GUAmat(d3e1, d3p2))
end//let//end-of-[D3GUAmat(...)]
) where
{
//
  val loc0 = dgua.lctn()
//
  val (  ) =
  prerrln("trans3a_d3gua: dgua = ", dgua)
//
}(*where*)//end-of-[trans3a_d3gua(env0,...)]
//
(* ****** ****** *)
//
#implfun
trans3a_d3gpt
  (env0, dgpt) = let
//
val loc0 = dgpt.lctn()
//
(*
val
val () =
prerrln
("trans3a_d3gpt: dgpt = ", dgpt)
*)
//
in//let
//
case+
dgpt.node() of
//
|
D3GPTpat(d3p1) =>
d3gpt_make_node
( loc0
, D3GPTpat(d3p1)) where
{
val d3p1 =
trans3a_d3pat(env0, d3p1)
}
|
D3GPTgua(d3p1, d3gs) =>
d3gpt_make_node
( loc0
, D3GPTgua(d3p1, d3gs)) where
{
val
d3p1 = trans3a_d3pat(env0, d3p1)
val
d3gs = trans3a_d3gualst(env0, d3gs) }
//
end(*let*)//end-of-[trans3a_d3gpt(env0,dgpt)]
//
(* ****** ****** *)
//
#implfun
trans3a_d3cls
  (env0, d3c0) = let
//
val loc0 = d3c0.lctn()
//
(*
val
val () =
prerrln
("trans3a_d3cls: d3c0 = ", d3c0)
*)
//
in//let
//
case+
d3c0.node() of
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
trans3a_d3gpt(env0, dgpt)
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
val dgpt = trans3a_d3gpt(env0, dgpt)
val d3e1 = trans3a_d3exp(env0, d3e1)
//
}(*where*)//end of [D3CLScls(dgpt,d3e1)]
//
end(*let*)//end-of-[trans3a_d3cls(env0,d3c0)]
//
(* ****** ****** *)
//
#implfun
trans3a_teqd3exp
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
  d3e2 = trans3a_d3exp(env0, d3e2) } )
(*case+*)//end-of(trans3a_teqd3exp(env0,tdxp))
//
(* ****** ****** *)
//
#implfun
trans3a_d3patlst
  (env0, d3ps) =
(
  list_trans3a_fnp(env0, d3ps, trans3a_d3pat))
//
(* ****** ****** *)
//
#implfun
trans3a_d3explst
  (env0, d3es) =
(
  list_trans3a_fnp(env0, d3es, trans3a_d3exp))
//
#implfun
trans3a_d3expopt
( env0, dopt ) =
(
  optn_trans3a_fnp(env0, dopt, trans3a_d3exp))
//
(* ****** ****** *)
//
#implfun
trans3a_l3d3plst
( env0, ldps ) =
(
  list_trans3a_fnp(env0, ldps, trans3a_l3d3p))
//
#implfun
trans3a_l3d3elst
( env0, ldes ) =
(
  list_trans3a_fnp(env0, ldes, trans3a_l3d3e))
//
(* ****** ****** *)
//
#implfun
trans3a_f3arglst
( env0, f3as ) =
(
  list_trans3a_fnp(env0, f3as, trans3a_f3arg))
//
(* ****** ****** *)
//
#implfun
trans3a_d3gualst
( env0, d3gs ) =
(
  list_trans3a_fnp(env0, d3gs, trans3a_d3gua))
//
(* ****** ****** *)
//
#implfun
trans3a_d3clslst
( env0, d3cs ) =
(
  list_trans3a_fnp(env0, d3cs, trans3a_d3cls))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans3a_dynexp.dats] *)
