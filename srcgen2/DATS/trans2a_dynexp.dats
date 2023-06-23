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
Sun 20 Nov 2022 11:00:59 AM EST
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
_(*TRANS2A*) = "./trans2a.dats"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
(* ****** ****** *)
#symload node with token_get_node
(* ****** ****** *)
#symload node with s2exp_get_node
#symload node with s2typ_get_node
(* ****** ****** *)
#symload styp with d2var_get_styp
#symload styp with d2var_set_styp
(* ****** ****** *)
#symload lctn with d2pat_get_lctn
#symload node with d2pat_get_node
#symload styp with d2pat_get_styp
#symload styp with d2pat_set_styp
(* ****** ****** *)
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
#symload styp with d2exp_get_styp
#symload styp with d2exp_set_styp
(* ****** ****** *)
#symload lctn with d2gua_get_lctn
#symload node with d2gua_get_node
#symload lctn with d2gpt_get_lctn
#symload node with d2gpt_get_node
#symload lctn with d2cls_get_lctn
#symload node with d2cls_get_node
(* ****** ****** *)
#symload s2vs with s2qag_get_s2vs
#symload s2vs with t2qag_get_s2vs
(* ****** ****** *)
//
fun
s2typ_new0_x2tp
( loc0: loc_t ): s2typ =
s2typ_xtv(x2t2p_make_lctn(loc0))
//
(* ****** ****** *)
//
fn0
s2typ_subst0
( t2p0: s2typ
, svts: s2vts): s2typ =
(
case+ svts of
|list_nil() => t2p0 // identity
|list_cons _ => s2typ_subst0(t2p0, svts)
)
//
(* ****** ****** *)
//
fun
d2pat_make_styp_node
( loc0: loc_t
, t2p0: s2typ
, node: d2pat_node): d2pat =
let
val
d2p0 = d2pat(loc0, node)
in
  (d2p0.styp(t2p0); d2p0) end
//
fun
d2exp_make_styp_node
( loc0: loc_t
, t2p0: s2typ
, node: d2exp_node): d2exp =
let
val
d2e0 = d2exp(loc0, node)
in
  (d2e0.styp(t2p0); d2e0) end
//
#symload
d2pat with d2pat_make_styp_node
#symload
d2exp with d2exp_make_styp_node
//
(* ****** ****** *)
//
#implfun
trans2a_d2pat
( env0, d2p0 ) =
let
//
(*
val
loc0 = d2p0.lctn()
val () =
prerrln
("trans2a_d2pat: loc0 = ", loc0)
val () =
prerrln
("trans2a_d2pat: d2p0 = ", d2p0)
*)
//
in//let
//
case+
d2p0.node() of
//
|D2Pvar _ => f0_var(env0, d2p0)
//
|D2Pany _ => f0_any(env0, d2p0)
//
|D2Pint _ => f0_int(env0, d2p0)
|D2Pi00 _ => f0_i00(env0, d2p0)
//
|D2Pbtf _ => f0_btf(env0, d2p0)
|D2Pb00 _ => f0_b00(env0, d2p0)
//
|D2Pcon _ => f0_con(env0, d2p0)
//
|D2Psym0 _ => f0_sym0(env0, d2p0)
//
|D2Pdapp _ => f0_dapp(env0, d2p0)
//
|D2Ptup0 _ => f0_tup0(env0, d2p0)
|D2Ptup1 _ => f0_tup1(env0, d2p0)
|D2Prcd2 _ => f0_rcd2(env0, d2p0)
//
|D2Pannot _ => f0_annot(env0, d2p0)
//
|D2Perrck _ => f0_errck(env0, d2p0)
//
| _(*otherwise*) => d2pat_none2(d2p0)
//
endlet where
{
//
(* ****** ****** *)
//
fun
f0_int
( env0:
! tr2aenv
, d2p0: d2pat): d2pat =
(
d2pat_make_styp_node
( loc0
, t2p0, D2Pint(tok))) where
{
val loc0 = d2p0.lctn()
val-
D2Pint(tok) = d2p0.node()
val t2p0 = the_s2typ_sint() }
//
fun
f0_i00
( env0:
! tr2aenv
, d2p0: d2pat): d2pat =
(
d2pat_make_styp_node
( loc0
, t2p0, D2Pi00(int))) where
{
val loc0 = d2p0.lctn()
val-
D2Pi00(int) = d2p0.node()
val t2p0 = the_s2typ_sint() }
//
(* ****** ****** *)
//
fun
f0_btf
( env0:
! tr2aenv
, d2p0: d2pat): d2pat =
(
d2pat_make_styp_node
( loc0
, t2p0, D2Pbtf(sym))) where
{
val loc0 = d2p0.lctn()
val-
D2Pbtf(sym) = d2p0.node()
val t2p0 = the_s2typ_bool() }
//
fun
f0_b00
( env0:
! tr2aenv
, d2p0: d2pat): d2pat =
(
d2pat_make_styp_node
( loc0
, t2p0, D2Pb00(btf))) where
{
val loc0 = d2p0.lctn()
val-
D2Pb00(btf) = d2p0.node()
val t2p0 = the_s2typ_bool() }
//
(* ****** ****** *)
//
fun
f0_any
( env0:
! tr2aenv
, d2p0: d2pat): d2pat =
(
d2pat_make_styp_node
(loc0,t2p0,D2Pany())) where
{
//
val loc0 = d2p0.lctn()
//
val-D2Pany() = d2p0.node()
//
val t2p0 = s2typ_new0_x2tp(loc0) }
//(*where*) // end-of-[f0_any(env0,...)]
//
(* ****** ****** *)
//
fun
f0_var
( env0:
! tr2aenv
, d2p0: d2pat): d2pat =
(
d2pat_make_styp_node
( loc0
, t2p0, D2Pvar(d2v1))) where
{
//
val loc0 = d2p0.lctn()
val-
D2Pvar(d2v1) = d2p0.node()
//
val t2p0 =
let
val t2p0 = d2v1.styp((*nil*))
in//let
(
case+
t2p0.node() of
|T2Pnone0() =>
let
val
xtp1 = x2t2p(d2v1)
val
t2p0 = s2typ_xtv(xtp1)
in//let
  (d2v1.styp(t2p0); t2p0) end
//(*let*) // end-of-[T2Pnone0]
| _(* non-T2Pnone0 *) => t2p0) end }
//
(* ****** ****** *)
//
fun
f0_con
( env0:
! tr2aenv
, d2p0: d2pat): d2pat =
let
(*
val
t2p0 = d2c1.styp()
*)
in//let
d2pat_make_styp_node
( loc0
, t2p0, D2Pcon(d2c1))
end where // end-of-[let]
{
//
val loc0 = d2p0.lctn()
//
val-
D2Pcon(d2c1) = d2p0.node()
//
val t2p0 =
d2con2a_s2typ( loc0, d2c1 )
//
(*
val (  ) =
prerrln("f0_con: d2c1 = ", d2c1)
val (  ) =
prerrln("f0_con: tqas = ", d2c1.tqas())
*)
} (*where*) // end of [f0_con(env0,...)]
//
(* ****** ****** *)
//
fun
f0_sym0
( env0:
! tr2aenv
, d2p0: d2pat): d2pat =
let
//
val loc0 = d2p0.lctn()
val-
D2Psym0
(drpt,
 d1p1, d2is) = d2p0.node()
//
val t2p0 = s2typ_new0_x2tp(loc0)
//
in//let
d2pat_make_styp_node
(loc0, t2p0, D2Psym0(drpt,d1p1,d2is))
end (*let*) // end of [f0_sym0(env0,...)]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! tr2aenv
, d2p0: d2pat): d2pat =
let
val loc0 = d2p0.lctn()
val-
D2Pdapp
( d2f0
, npf1, d2ps) = d2p0.node()
//
val
tres =
s2typ_new0_x2tp(loc0)
val
d2ps =
trans2a_d2patlst(env0, d2ps)
//
val tfun =
let
val f2cl =
s2typ_f2cl(F2CLfun())
val
t2ps =
s2typlst_of_d2patlst(d2ps)
in//let
s2typ_make_node
(sort2_none0()
,T2Pfun1(f2cl,npf1,t2ps,tres))
end (*let*) // end-of-[val(tfun)]
//
val d2f0 =
trans2a_d2pat_tpck(env0,d2f0,tfun)
//
in//let
//
d2pat_make_styp_node
(loc0, tres, D2Pdapp(d2f0,npf1,d2ps))
//
end (*let*) // end of [f0_dapp(env0,...)]
//
(* ****** ****** *)
//
fun
f0_tup0
( env0:
! tr2aenv
, d2p0: d2pat): d2pat =
(
d2pat_make_styp_node
( loc0, t2p0
, D2Ptup0(npf1, d2ps))) where
{
val loc0 = d2p0.lctn()
val-
D2Ptup0
(npf1, d2ps) = d2p0.node()
val
d2ps = trans2a_d2patlst(env0, d2ps)
val
t2p0 =
(
case+ d2ps of
|list_nil() =>
the_s2typ_void()
|list_cons _ =>
s2typ_tup0(npf1, s2typlst(d2ps))): s2typ
} (*where*) // end of [f0_tup0(env0,d2p0)]
//
(* ****** ****** *)
//
fun
f0_tup1
( env0:
! tr2aenv
, d2p0: d2pat): d2pat =
(
d2pat_make_styp_node
(
loc0, t2p0,
D2Ptup1(tknd, npf1, d2ps))) where
{
val loc0 = d2p0.lctn()
val-
D2Ptup1
( tknd
, npf1, d2ps) = d2p0.node()
val
d2ps =
trans2a_d2patlst(env0, d2ps)
val
trcd =
(
case-
tknd.node() of
|T_TRCD10(0) => TRCDflt0(*void*)
|T_TRCD10(_) => TRCDbox0(*void*)
)
val
t2p0 =
s2typ_tup1(trcd, npf1, s2typlst(d2ps))
} (*where*) // end of [f0_tup1(env0,d2p0)]
//
(* ****** ****** *)
//
fun
f0_rcd2
( env0:
! tr2aenv
, d2p0: d2pat): d2pat =
(
d2pat_make_styp_node
(
loc0, t2p0,
D2Prcd2(tknd, npf1, ldps))) where
{
val loc0 = d2p0.lctn()
val-
D2Prcd2
( tknd
, npf1, ldps) = d2p0.node()
val
ldps =
trans2a_l2d2plst(env0, ldps)
val
trcd =
(
case-
tknd.node() of
|T_TRCD20(0) => TRCDflt0(*void*)
|T_TRCD20(_) => TRCDbox0(*void*)
)
val
t2p0 =
s2typ_rcd2(trcd, npf1, l2t2plst(ldps))
} (*where*) // end of [f0_rcd2(env0,d2p0)]
//
(* ****** ****** *)

fun
f0_annot
( env0:
! tr2aenv
, d2p0: d2pat): d2pat =
let
//
val loc0 = d2p0.lctn()
val-
D2Pannot
( d2p1
, s1e2, s2e2) = d2p0.node()
//
val t2p2 = s2exp_stpize(s2e2)
val t2p2 = s2typ_hnfiz0(t2p2)
//
val d2p1 =
trans2a_d2pat_tpck(env0, d2p1, t2p2)
//
in//let
d2pat_make_styp_node
(loc0, t2p2, D2Pannot(d2p1,s1e2,s2e2))
end (*let*) // end of [f0_annot(env0,...)]

(* ****** ****** *)
//
fun
f0_errck
( env0:
! tr2aenv, d2p0: d2pat): d2pat = (d2p0)
//
(* ****** ****** *)
//
} (*where*)//end-of-[trans2a_d2pat(env0,d2p0)]
//
(* ****** ****** *)
//
#implfun
trans2a_l2d2p
( env0,ld2p ) =
let
//
val+
D2LAB
(lab0, d2p1) = ld2p
//
in//let
D2LAB(lab0, trans2a_d2pat(env0, d2p1))
end (*let*)//end-of-[trans2a_l2d2p(env0,ld2p)]
//
(* ****** ****** *)
//
#implfun
trans2a_d2exp
( env0, d2e0 ) =
let
//
(*
val
loc0 = d2e0.lctn()
val () =
prerrln
("trans2a_d2exp: loc0 = ", loc0)
val () =
prerrln
("trans2a_d2exp: d2e0 = ", d2e0)
*)
//
in//let
//
case+
d2e0.node() of
//
|D2Eint _ => f0_int(env0, d2e0)
|D2Ei00 _ => f0_i00(env0, d2e0)
//
|D2Ebtf _ => f0_btf(env0, d2e0)
|D2Eb00 _ => f0_b00(env0, d2e0)
//
|D2Estr _ => f0_str(env0, d2e0)
|D2Es00 _ => f0_s00(env0, d2e0)
//
|D2Evar _ => f0_var(env0, d2e0)
//
|D2Econ _ => f0_con(env0, d2e0)
|D2Ecst _ => f0_cst(env0, d2e0)
//
|D2Esym0 _ => f0_sym0(env0, d2e0)
//
|D2Etapp _ => f0_tapp(env0, d2e0)
//
|D2Edapp _ => f0_dapp(env0, d2e0)
//
|D2Elet0 _ => f0_let0(env0, d2e0)
//
|D2Eift0 _ => f0_ift0(env0, d2e0)
|D2Ecas0 _ => f0_cas0(env0, d2e0)
//
|D2Eseqn _ => f0_seqn(env0, d2e0)
//
|D2Etup0 _ => f0_tup0(env0, d2e0)
|D2Etup1 _ => f0_tup1(env0, d2e0)
|D2Ercd2 _ => f0_rcd2(env0, d2e0)
//
|D2Elam0 _ => f0_lam0(env0, d2e0)
|D2Efix0 _ => f0_fix0(env0, d2e0)
//
|D2Ewhere _ => f0_where(env0, d2e0)
//
|D2Eassgn _ => f0_assgn(env0, d2e0)
|D2Ebrckt _ => f0_brckt(env0, d2e0)
|D2Edtsel _ => f0_dtsel(env0, d2e0)
//
|D2Eraise _ => f0_raise(env0, d2e0)
//
|D2Eannot _ => f0_annot(env0, d2e0)
//
|D2Eerrck _ => f0_errck(env0, d2e0)
//
| _(*otherwise*) => d2exp_none2(d2e0)
//
endlet where
{
//
(* ****** ****** *)
//
fun
f0_int
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
( loc0
, t2p0, D2Eint(tok))) where
{
val loc0 = d2e0.lctn()
val-
D2Eint(tok) = d2e0.node()
val t2p0 = the_s2typ_sint() }
//
fun
f0_i00
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
( loc0
, t2p0, D2Ei00(int))) where
{
val loc0 = d2e0.lctn()
val-
D2Ei00(int) = d2e0.node()
val t2p0 = the_s2typ_sint() }
//
(* ****** ****** *)
//
fun
f0_btf
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
( loc0
, t2p0, D2Ebtf(sym))) where
{
val loc0 = d2e0.lctn()
val-
D2Ebtf(sym) = d2e0.node()
val t2p0 = the_s2typ_bool() }
//
fun
f0_b00
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
( loc0
, t2p0, D2Eb00(btf))) where
{
val loc0 = d2e0.lctn()
val-
D2Eb00(btf) = d2e0.node()
val t2p0 = the_s2typ_bool() }
//
(* ****** ****** *)
//
fun
f0_str
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
( loc0
, t2p0, D2Estr(tok))) where
{
val loc0 = d2e0.lctn()
val-
D2Estr(tok) = d2e0.node()
val t2p0 = the_s2typ_strn() }
//
fun
f0_s00
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
( loc0
, t2p0, D2Es00(str))) where
{
val loc0 = d2e0.lctn()
val-
D2Es00(str) = d2e0.node()
val t2p0 = the_s2typ_strn() }
//
(* ****** ****** *)
//
fun
f0_var
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
( loc0
, t2p0, D2Evar(d2v1))) where
{
//
val loc0 = d2e0.lctn()
//
val-
D2Evar(d2v1) = d2e0.node()
//
val t2p0 =
let
val
t2p0 = d2v1.styp((*nil*))
in//let
(
case+
t2p0.node() of
|T2Plft(t2p1) => t2p1
|_(*non-T2Plft*) => t2p0) endlet
//
} (*where*) // end of [f0_var(env0,...)]
//
(* ****** ****** *)
//
fun
f0_con
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
let
(*
val
t2p0 = d2c1.styp()
*)
in//let
d2exp_make_styp_node
( loc0
, t2p0, D2Econ(d2c1))
end where // end-of-[let]
{
//
val loc0 = d2e0.lctn()
//
val-
D2Econ(d2c1) = d2e0.node()
//
val t2p0 =
d2con2a_s2typ(loc0, d2c1)
//
(*
val (  ) = prerrln
("f0_con: d2c1 = ", d2c1)
val (  ) = prerrln
("f0_con: tqas = ", d2c1.tqas())
*)
//
}(*where*) // end of [f0_con(env0,...)]
//
(* ****** ****** *)
//
fun
f0_cst
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
let
(*
val
t2p0 = d2c1.styp()
*)
in//let
d2exp_make_styp_node
( loc0
, t2p0, D2Ecst(d2c1))
end where // end-of-[let]
{
//
val loc0 = d2e0.lctn()
//
val-
D2Ecst(d2c1) = d2e0.node()
//
val t2p0 =
d2cst2a_s2typ( loc0, d2c1 )
//
(*
val (  ) = prerrln
("f0_cst: d2c1 = ", d2c1)
val (  ) = prerrln
("f0_cst: tqas = ", d2c1.tqas())
*)
}(*where*) // end of [f0_cst(env0,...)]
//
(* ****** ****** *)
//
fun
f0_sym0
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Esym0
(drxp,d1e1,dpis) = d2e0.node()
//
val t2p0 = s2typ_new0_x2tp(loc0)
//
in//let
d2exp_make_styp_node
(loc0, t2p0, D2Esym0(drxp,d1e1,dpis))
end (*let*) // end of [f0_sym0(env0,...)]
//
(* ****** ****** *)
//
local
//
fun
f1_root
(d2f0: d2exp): d2exp =
(
case+
d2f0.node() of
|
D2Etapp
(d2f0, _) => f1_root(d2f0)
|_(*non-D2Etapp*) => (d2f0))
//
fun
f1_make
( d2e0: d2exp
, d2f0: d2exp): d2exp =
(
case+
d2e0.node() of
|
D2Etapp
(d2e1, s2es) => let
val
d2e1 =
f1_make(d2e1, d2f0)
in//let
d2exp_make_styp_node
( d2e1.lctn()
, d2e1.styp()
, D2Etapp(d2e1, s2es) )
end(*let*)//end-of-[D2Etapp]
|_(*non-D2Etapp*) => ( d2f0 ))
//
fun
f1_type
( d2e0: d2exp): s2typ =
let
val d2f0 = f1_root(d2e0)
in
case+
d2f0.node() of
|
D2Econ(d2c0) =>
let
val
tqas = d2c0.tqas()
val
tfun = d2c0.styp() in//let
f1_tqas_tfun(d2e0, tqas, tfun)
end(*let*)//end of [D2Econ(d2c0)]
|
D2Ecst(d2c0) =>
let
val
tqas = d2c0.tqas()
val
tfun = d2c0.styp() in//let
f1_tqas_tfun(d2e0, tqas, tfun)
end(*let*)//end of [D2Ecst(d2c0)]
|
_ (* otherwise *) => s2typ_none0()
end
//
and
f1_tqas
( d2e0: d2exp
, tqas: t2qas): s2vts =
let
val
loc0 = d2e0.lctn()
val
svts = list_nil(*0*)
in
  f2_tqas
  (loc0, tqas, svts) where
{ val
  @(tqas, svts) =
    f2_main(d2e0, tqas, svts) }
end where // end of [f1_tqas(...)]
{
//
fun
f2_main
( d2e0: d2exp
, tqas: t2qas
, svts: s2vts)
: @(t2qas, s2vts) =
(
case+ tqas of
|
list_nil() => @(tqas, svts)
|
list_cons _ =>
(
case+
d2e0.node() of
|D2Etapp
(d2e1, s2es) =>
let
//
val+
@(tqas, svts) =
  f2_main(d2e1, tqas, svts)
//
in//let
case+ tqas of
|list_nil() => @(tqas, svts)
|list_cons
(tqa1, tqas) =>
let
val
loc0 = d2e0.lctn()
val
s2vs = tqa1.s2vs()
in//let
  @(tqas, svts) where
{
val svts =
f2_s2vs(loc0, s2vs, s2es, svts) }
end(*let*) // end-of-[ list_cons ]
end(*let*) // end-of-[D2Etapp(...)]
//
| _(*non-D2Etapp*) => @(tqas, svts)
//
) (*case+*) // end of [ list_cons ]
//
) (*case+*) // end of [f2_main(...)]
//
and
f2_s2vs
( loc0
: loc_t
, s2vs
: s2varlst
, s2es
: s2explst
, svts: s2vts): s2vts =
(
case+ s2vs of
|list_nil
((*void*)) => svts
|list_cons
(s2v1, s2vs) =>
(
case+ s2es of
//
|
list_nil() =>
(
list_cons
(
@(s2v1, t2p1), svts)) where
{
val
t2p1 = s2typ_new0_x2tp(loc0)
val svts =
f2_s2vs(loc0, s2vs, s2es, svts) }
//
|
list_cons(s2e1, ses2) =>
(
list_cons
(
@(s2v1, t2p1), svts)) where
{
//
val t2p1 =
(
case+
s2e1.node() of
|S2Eany _ =>
 s2typ_new0_x2tp(loc0)
|_(*else*) => s2exp_stpize(s2e1))
//
val s2es =
(
case+
s2e1.node() of
|S2Eany(k0) =>
 if k0 <= 1 // sing
 then s2es else ses2 | _ => ses2)
//
val svts =
  f2_s2vs(loc0, s2vs, s2es, svts) }
//
) (*case+*) // end-of-[list_cons]
) (*case+*) // end of [f2_s2vs(...)]
//
fun
f2_tqas
( loc0: loc_t
, tqas: t2qas
, svts: s2vts): s2vts = svts // f2_tqas
//
} (*where*)//end-of-[f1_tqas(d2e0,tqas)]
//
and
f1_tqas_tfun
( d2e0: d2exp
, tqas: t2qas
, tfun: s2typ): s2typ =
let
val
svts = f1_tqas(d2e0, tqas)
in//let
  s2typ_subst0(tfun, svts) end//let
//
in//local

fun
f0_tapp
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Etapp
(d2f0, s2es) = d2e0.node()
//
in//let
//
( f1_make
  (d2e0, d2f0) ) where
{
//
  val d2f0 = f1_root(d2f0)
  val tfun = f1_type(d2e0)
//
  val
  d2f0 =
  trans2a_d2exp(env0, d2f0)
//
  val t2p0 = d2f0.styp((*void*))
  val ubtf =
  unify2a_s2typ(env0, tfun, t2p0) }
//
end (*let*) // end of [f0_tapp(env0,...)]
//
end (*local*)//end of [f0_tapp(env0,...)] 
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Edapp
( d2f0
, npf1, d2es) = d2e0.node()
//
val
tres =
s2typ_new0_x2tp(loc0)
val
d2es =
trans2a_d2explst(env0, d2es)
//
val tfun =
let
val f2cl =
s2typ_new0_x2tp(loc0)
val
t2ps =
s2typlst_of_d2explst(d2es)
in//let
s2typ_make_node
(sort2_none0()
,T2Pfun1(f2cl,npf1,t2ps,tres))
end (*let*) // end-of-[val(tfun)]
//
(*
val () =
prerrln("f0_dapp: d2f0 = ", d2f0)
val () =
prerrln("f0_dapp: tfun = ", tfun)
*)
//
val d2f0 =
trans2a_d2exp_tpck(env0,d2f0,tfun)
//
in//let
//
d2exp_make_styp_node
(loc0, tres, D2Edapp(d2f0,npf1,d2es))
//
end (*let*) // end of [f0_dapp(env0,...)]
//
(* ****** ****** *)
//
fun
f0_let0
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
let
val loc0 = d2e0.lctn()
val-
D2Elet0
( d2cs, d2e1) = d2e0.node()
//
val
(  ) = tr2aenv_pshlet0(env0)
//
val d2cs =
trans2a_d2eclist(env0, d2cs)
//
val
d2e1 = trans2a_d2exp(env0, d2e1)
//
val (  ) = tr2aenv_poplet0(env0)
//
in//let
d2exp_make_styp_node
( loc0
, d2e1.styp(), D2Elet0(d2cs, d2e1))
end (*let*) // end of [f0_let0(env0,...)]
//
(* ****** ****** *)
//
fun
f0_ift0
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
let
val loc0 = d2e0.lctn()
val-
D2Eift0
( d2e1
, dthn, dels) = d2e0.node()
//
val t2p1 = the_s2typ_bool()
val d2e1 =
trans2a_d2exp_tpck(env0, d2e1, t2p1)
//
val t2p0 =
(
case+ dels of
|
optn_nil() => the_s2typ_void()
|
optn_cons _ =>
(
case+ dthn of
|
optn_nil() => the_s2typ_void()
|
optn_cons _ => s2typ_new0_x2tp(loc0))
)
//
val dthn =
(
case+ dthn of
|
optn_nil() => optn_nil()
|
optn_cons(d2e2) =>
optn_cons(
trans2a_d2exp_tpck(env0, d2e2, t2p0))
)
val dels =
(
case+ dels of
|
optn_nil() => optn_nil()
|
optn_cons(d2e3) =>
optn_cons(
trans2a_d2exp_tpck(env0, d2e3, t2p0))
)
//
in//let
d2exp_make_styp_node
(loc0, t2p0, D2Eift0(d2e1, dthn, dels))
end (*let*) // end of [f0_ift0(env0,...)]
//
(* ****** ****** *)
//
fun
f0_cas0
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Ecas0
( tknd
, d2e1, d2cs) = d2e0.node()
//
val d2e1 =
trans2a_d2exp(env0, d2e1)
val targ = d2e1.styp((*void*))
val tres = s2typ_new0_x2tp(loc0)
//
in//let
let
val d2cs =
trans2a_d2clslst_tpck1
(env0, d2cs, targ, tres)
in//let
  d2exp_make_styp_node
  (loc0,tres,D2Ecas0(tknd,d2e1,d2cs))
end (*let*)
end (*let*) // end of [f0_cas0(env0,...)]
//
(* ****** ****** *)
//
fun
f0_seqn
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
( loc0
, d2e1.styp()
, D2Eseqn(d2es, d2e1))) where
{
val loc0 = d2e0.lctn()
val-
D2Eseqn
(d2es, d2e1) = d2e0.node()
val
d2es =
trans2a_d2explst_tpck1
(env0, d2es, the_s2typ_void())
val
d2e1 = trans2a_d2exp(env0, d2e1)
} (*where*) // end of [f0_seqn(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_tup0
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
( loc0, t2p0
, D2Etup0(npf1, d2es))) where
{
val loc0 = d2e0.lctn()
val-
D2Etup0
(npf1, d2es) = d2e0.node()
val
d2es = trans2a_d2explst(env0, d2es)
val
t2p0 =
(
case+ d2es of
|list_nil() =>
the_s2typ_void()
|list_cons _ =>
s2typ_tup0(npf1, s2typlst(d2es))): s2typ
} (*where*) // end of [f0_tup0(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_tup1
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
(
loc0, t2p0,
D2Etup1(tknd, npf1, d2es))) where
{
val loc0 = d2e0.lctn()
val-
D2Etup1
( tknd
, npf1, d2es) = d2e0.node()
val
d2es =
trans2a_d2explst(env0, d2es)
val
trcd =
(
case-
tknd.node() of
|T_TRCD10(0) => TRCDflt0(*void*)
|T_TRCD10(_) => TRCDbox0(*void*)
)
val
t2p0 =
s2typ_tup1(trcd, npf1, s2typlst(d2es))
} (*where*) // end of [f0_tup1(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_rcd2
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
(
loc0, t2p0,
D2Ercd2(tknd, npf1, ldes))) where
{
val loc0 = d2e0.lctn()
val-
D2Ercd2
( tknd
, npf1, ldes) = d2e0.node()
val
ldes =
trans2a_l2d2elst(env0, ldes)
val
trcd =
(
case-
tknd.node() of
|T_TRCD20(0) => TRCDflt0(*void*)
|T_TRCD20(_) => TRCDbox0(*void*)
)
val
t2p0 =
s2typ_rcd2(trcd, npf1, l2t2plst(ldes))
} (*where*) // end of [f0_rcd2(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_lam0
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
(
loc0,
tfun,
D2Elam0
( tknd, f2as
, sres, arrw, dexp))) where
{
//
val loc0 = d2e0.lctn()
//
val-
D2Elam0
( tknd
, f2as, sres
, arrw, dexp) = d2e0.node()
//
val f2as =
trans2a_f2arglst(env0, f2as)
//
val dexp =
(
case+ sres of
|
S2RESnone((*void*)) =>
trans2a_d2exp(env0, dexp)
|
S2RESsome(seff, sexp) =>
let
val
tres =
s2exp_stpize(sexp) in
trans2a_d2exp_tpck(env0,dexp,tres)
end (*let*) // end of [ S2RESsome ]
) : (d2exp) // end of [ val(dexp) ]
//
val f2cl = F2CLfun(*void*)
val tres = dexp.styp((*void*))
val tfun =
s2typ_fun1_f2arglst(f2as, f2cl, tres)
(*
val (  ) = prerrln
("trans2a_d2exp: f0_lam0: tfun = ", tfun)
*)
//
} (*where*) // end of [f0_lam0(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_fix0
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
(
d2exp_make_styp_node
(
loc0,
tfun,
D2Efix0
( tknd
, dvar, f2as
, sres, arrw, dexp))) where
{
//
val loc0 = d2e0.lctn()
//
val-
D2Efix0
( tknd
, dvar
, f2as, sres
, arrw, dexp) = d2e0.node()
//
val f2as =
trans2a_f2arglst(env0, f2as)
//
val tres =
(
case+ sres of
|
S2RESnone((*0*)) =>
s2typ_new0_x2tp(loc0)
|
S2RESsome(seff, s2e1) =>
s2typ_hnfiz0(s2exp_stpize(s2e1))
) : s2typ // end of [ val(tres) ]
//
val f2cl = F2CLfun(*void*)
val tfun =
s2typ_fun1_f2arglst(f2as,f2cl,tres)
//
val (  ) = dvar.styp(tfun)
val dexp =
trans2a_d2exp_tpck(env0, dexp, tres)
//
(*
val (  ) = prerrln
("trans2a_d2exp: f0_fix0: tfun = ", tfun)
*)
//
} (*where*) // end of [f0_fix0(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_where
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
let
val loc0 = d2e0.lctn()
val-
D2Ewhere
( d2e1, d2cs) = d2e0.node()
//
val
(  ) = tr2aenv_pshlet0(env0)
//
val d2cs =
trans2a_d2eclist(env0, d2cs)
//
val
d2e1 = trans2a_d2exp(env0, d2e1)
//
val (  ) = tr2aenv_poplet0(env0)
//
in//let
d2exp_make_styp_node
( loc0
, d2e1.styp(), D2Ewhere(d2e1, d2cs))
end (*let*) // end of [f0_where(env0,...)]
//
(* ****** ****** *)
//
fun
f0_assgn
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Eassgn
(d2el, d2er) = d2e0.node()
//
val
d2el =
trans2a_d2exp(env0, d2el)
val
t2pl = d2el.styp((*void*))
//
val t2p0 = the_s2typ_void()
//
val
d2er =
trans2a_d2exp_tpck(env0,d2er,t2pl)
//
in//let
d2exp_make_styp_node
( loc0, t2p0, D2Eassgn(d2el, d2er) )
end (*let*) // end of [f0_assgn(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_brckt
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
let
val loc0 = d2e0.lctn()
val-
D2Ebrckt
( dpis, d2es) = d2e0.node()
val d2es =
trans2a_d2explst(env0, d2es)
val t2p0 = s2typ_new0_x2tp(loc0)
in//let
d2exp_make_styp_node
( loc0, t2p0, D2Ebrckt(dpis, d2es))
end (*let*) // end of [f0_brckt(env0,...)]
//
(* ****** ****** *)
//
fun
f0_dtsel
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
let
val loc0 = d2e0.lctn()
val-
D2Edtsel
( tknd
, lab1, dpis
, npf1, darg) = d2e0.node()
val darg =
trans2a_d2explstopt(env0, darg)
val t2p0 = s2typ_new0_x2tp(loc0)
in//let
d2exp_make_styp_node
( loc0, t2p0
, D2Edtsel(tknd,lab1,dpis,npf1,darg))
end (*let*) // end of [f0_dtsel(env0,...)]
//
(* ****** ****** *)
//
fun
f0_raise
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
let
//
val loc0 = d2e0.lctn()
//
val-
D2Eraise(d2e1) = d2e0.node()
//
val t2p1 = the_s2typ_excptn()
val d2e1 =
trans2a_d2exp_tpck(env0,d2e1,t2p1)
//
in//let
//
d2exp_make_styp_node
(loc0, t2p0, D2Eraise(d2e1)) where
{
  val t2p0 = s2typ_new0_x2tp(loc0) }
//
end (*let*) // end of [f0_raise(env0,...)]
//
(* ****** ****** *)

fun
f0_annot
( env0:
! tr2aenv
, d2e0: d2exp): d2exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Eannot
( d2e1
, s1e2, s2e2) = d2e0.node()
//
val t2p2 = s2exp_stpize(s2e2)
val t2p2 = s2typ_hnfiz0(t2p2)
//
val d2e1 =
trans2a_d2exp_tpck(env0, d2e1, t2p2)
//
in//let
d2exp_make_styp_node
(loc0, t2p2, D2Eannot(d2e1,s1e2,s2e2))
end (*let*) // end of [f0_annot(env0,...)]

(* ****** ****** *)
//
fun
f0_errck
( env0:
! tr2aenv, d2e0: d2exp): d2exp = (d2e0)
//
(* ****** ****** *)
//
} (*where*) // end of [trans2a_d2exp(env0,d2e0)]
//
(* ****** ****** *)
//
#implfun
trans2a_l2d2e
( env0,ld2e ) =
let
//
val+
D2LAB
(lab0, d2e1) = ld2e
//
in//let
D2LAB(lab0, trans2a_d2exp(env0, d2e1))
end (*let*) // end-of-[trans2a_l2d2e(env0,ld2e)]
//
(* ****** ****** *)
//
#implfun
trans2a_f2arg
( env0, farg ) =
let
//
(*
val
loc0 = farg.lctn()
val () =
prerrln
("trans2a_f2arg: loc0 = ", loc0)
val () =
prerrln
("trans2a_f2arg: farg = ", farg)
*)
//
in//let
//
case+
farg.node() of
|
F2ARGdyn0(npf1, d2ps) =>
let
val loc0 = farg.lctn()
val d2ps =
trans2a_d2patlst(env0, d2ps)
in//let
f2arg(loc0,F2ARGdyn0(npf1,d2ps))
end (*let*) // end of [F2ARGdyn0]
| _(* otherwise *) => (  farg  )
//
end (*let*) // end of [trans2a_f2arg(env0,farg)]
//
(* ****** ****** *)
//
#implfun
trans2a_d2gua
  (env0, dgua) =
(
case+
dgua.node() of
//
|D2GUAexp(d2e1) =>
d2gua
(loc0, D2GUAexp(d2e1)) where
{
val loc0 = dgua.lctn()
val
t2p1 = the_s2typ_bool()
val
d2e1 =
trans2a_d2exp_tpck(env0, d2e1, t2p1) }
//
|D2GUAmat(d2e1, d2p2) =>
d2gua
( loc0
, D2GUAmat(d2e1, d2p2)) where
{
val loc0 = dgua.lctn()
val
d2e1 = 
trans2a_d2exp(env0, d2e1)
val
t2p1 = d2e1.styp((*void*))
val
d2p2 =
trans2a_d2pat_tpck(env0, d2p2, t2p1) }
//
) (*case+*) // end of [trans2a_d2gua(env0,...)]
//
(* ****** ****** *)
//
#implfun
trans2a_d2gpt_tpck
( env0
, dgpt, targ) =
(
case+
dgpt.node() of
//
|
D2GPTpat(d2p1) =>
let
val
loc0 = dgpt.lctn()
val
d2p1 =
trans2a_d2pat_tpck
(env0 , d2p1 , targ) in
d2gpt(loc0, D2GPTpat(d2p1)) end
//
|
D2GPTgua
( d2p1, d2gs ) =>
let
val
loc0 = dgpt.lctn()
val
d2p1 =
trans2a_d2pat_tpck
(env0 , d2p1 , targ)
val
d2gs =
trans2a_d2gualst(env0, d2gs) in
d2gpt(loc0, D2GPTgua(d2p1, d2gs)) end
//
) (*case+*) // end of [trans2a_d2gpt_tpck(env0,...)]
//
(* ****** ****** *)
//
#implfun
trans2a_d2cls_tpck
( env0, dcls
, targ, tres) =
(
case+
dcls.node() of
//
|
D2CLSgpt(dgpt) =>
let
val
loc0 = dcls.lctn()
val dgpt =
trans2a_d2gpt_tpck
(env0, dgpt, targ) in
d2cls(loc0, D2CLSgpt(dgpt)) end
//
|
D2CLScls
( dgpt, d2e1 ) =>
let
val
loc0 = dcls.lctn()
val
dgpt =
trans2a_d2gpt_tpck
(env0 , dgpt , targ)
val
d2e1 =
trans2a_d2exp_tpck
(env0 , d2e1 , tres) in
d2cls(loc0, D2CLScls(dgpt, d2e1)) end
//
) (*case+*) // end of [trans2a_d2cls_tpck(env0,...)]
//
(* ****** ****** *)
//
#implfun
trans2a_d2patlst
( env0, d2ps ) =
list_trans2a_fnp(env0, d2ps, trans2a_d2pat)
//
(* ****** ****** *)
//
#implfun
trans2a_l2d2plst
( env0, ldps ) =
list_trans2a_fnp(env0, ldps, trans2a_l2d2p)
//
(* ****** ****** *)
//
#implfun
trans2a_d2expopt
( env0, dopt ) =
optn_trans2a_fnp(env0, dopt, trans2a_d2exp)
//
#implfun
trans2a_d2explst
( env0, d2es ) =
list_trans2a_fnp(env0, d2es, trans2a_d2exp)
//
(* ****** ****** *)
//
#implfun
trans2a_l2d2elst
( env0, ldes ) =
list_trans2a_fnp(env0, ldes, trans2a_l2d2e)
//
(* ****** ****** *)
//
#implfun
trans2a_f2arglst
( env0, f2as ) =
list_trans2a_fnp(env0, f2as, trans2a_f2arg)
//
(* ****** ****** *)
//
#implfun
trans2a_d2gualst
( env0, d2gs ) =
list_trans2a_fnp(env0, d2gs, trans2a_d2gua)
//
(* ****** ****** *)
//
#implfun
trans2a_d2pat_tpck
(env0, d2p0, t2p0) =
let
//
val d2p0 =
trans2a_d2pat(env0, d2p0)
val ubtf =
unify2a_s2typ(env0, d2p0.styp(), t2p0)
//
in//let
if
ubtf then d2p0 else
let
val loc0 = d2p0.lctn() in
d2pat(loc0, t2p0, D2Pt2pck(d2p0,t2p0)) end
end where
{
//
(*
val () =
prerrln("trans2a_d2pat_tpck: d2p0 = ", d2p0)
val () =
prerrln("trans2a_d2pat_tpck: t2p0 = ", t2p0)
*)
//
} (*where*) // end of [trans2a_d2pat_tpck(...)]
//
(* ****** ****** *)
//
#implfun
trans2a_d2exp_tpck
(env0, d2e0, t2p0) =
let
val d2e0 =
trans2a_d2exp(env0,d2e0)
val ubtf =
unify2a_s2typ(env0,d2e0.styp(),t2p0)
in//let
if
ubtf then d2e0 else
let
val loc0 = d2e0.lctn() in
d2exp(loc0, t2p0, D2Et2pck(d2e0,t2p0)) end
end where
{
//
(*
val () =
prerrln("trans2a_d2exp_tpck: d2e0 = ", d2e0)
val () =
prerrln("trans2a_d2exp_tpck: t2p0 = ", t2p0)
*)
//
} (*where*) // end of [trans2a_d2exp_tpck(...)]
//
(* ****** ****** *)
//
#implfun
trans2a_d2explst_tpck1
( env0
, d2es, t2p0 ) =
(
list_map_e1nv
<x0><y0><e1>(d2es, env0)) where
{
#typedef x0 = d2exp
#typedef y0 = d2exp
#vwtpdef e1 = tr2aenv
#impltmp
map$fopr_e1nv<x0><y0><e1>
(x0, e1) = trans2a_d2exp_tpck(e1, x0, t2p0)
} (*where*)//end of [trans2a_d2explst_tpck1(...)]
//
(* ****** ****** *)
//
#implfun
trans2a_d2patlst_tpcks
( env0
, d2ps, t2ps ) =
(
case+ d2ps of
|
list_nil() =>
list_nil((*void*))
|
list_cons(d2p1, d2ps) =>
(
case+ t2ps of
|
list_nil() =>
let
val t2p1 = s2typ_none0()
val d2p1 =
trans2a_d2pat_tpck(env0, d2p1, t2p1)
in//let
list_cons(d2p1, d2ps) where
{
val d2ps =
trans2a_d2patlst_tpcks(env0, d2ps, t2ps)
}
end//let//end-of-[list_nil()]
|
list_cons(t2p1, t2ps) =>
let
val d2p1 =
trans2a_d2pat_tpck(env0, d2p1, t2p1)
in//let
list_cons(d2p1, d2ps) where
{
val d2ps =
trans2a_d2patlst_tpcks(env0, d2ps, t2ps)
}
end//let//end-of-[list_cons(t2p1, t2ps)]
)
) where
{
(*
val () =
prerrln("trans2a_d2patlst_tpcks: d2ps = ", d2ps)
val () =
prerrln("trans2a_d2patlst_tpcks: t2ps = ", t2ps)
*)
}(*where*)//end of [trans2a_d2patlst_tpcks(...)]

(* ****** ****** *)
//
#implfun
trans2a_d2clslst_tpck1
( env0, dcls
, targ, tres ) =
(
list_map_e1nv
<x0><y0><e1>(dcls, env0)) where
{
#typedef x0 = d2cls
#typedef y0 = d2cls
#vwtpdef e1 = tr2aenv
#impltmp
map$fopr_e1nv<x0><y0><e1>
(x0, e1) = trans2a_d2cls_tpck(e1,x0,targ,tres)
} (*where*)//end of [list_trans2a_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
//
#implfun
trans2a_d2explstopt
( env0, dopt ) =
optn_trans2a_fnp(env0, dopt, trans2a_d2explst)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans2a_dynexp.dats] *)
