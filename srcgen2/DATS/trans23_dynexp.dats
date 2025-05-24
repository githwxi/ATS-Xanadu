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
Sun 19 Feb 2023 09:42:43 AM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME "\
ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload
_(*TRANS23*) = "./trans23.dats"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trans23.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload node with s2typ_get_node
(* ****** ****** *)
#symload lctn with d2var_get_lctn
#symload styp with d2var_get_styp
#symload styp with d2var_set_styp
(* ****** ****** *)
#symload lctn with d2con_get_lctn
#symload styp with d2con_get_styp
(* ****** ****** *)
#symload lctn with d2cst_get_lctn
#symload styp with d2cst_get_styp
(* ****** ****** *)
#symload lctn with d2pat_get_lctn
#symload node with d2pat_get_node
#symload styp with d2pat_get_styp
(* ****** ****** *)
#symload lctn with d2exp_get_lctn
#symload node with d2exp_get_node
#symload styp with d2exp_get_styp
(* ****** ****** *)
#symload dpat with d2rpt_get_dpat
#symload dexp with d2rxp_get_dexp
(* ****** ****** *)
#symload lctn with f2arg_get_lctn
#symload node with f2arg_get_node
(* ****** ****** *)
#symload lctn with d2gua_get_lctn
#symload lctn with d2gpt_get_lctn
#symload lctn with d2cls_get_lctn
#symload node with d2gpt_get_node
#symload node with d2gua_get_node
#symload node with d2cls_get_node
(* ****** ****** *)
#symload styp with d3pat_get_styp
#symload styp with d3pat_set_styp
(* ****** ****** *)
#symload styp with d3exp_get_styp
#symload styp with d3exp_set_styp
(* ****** ****** *)
#symload d3exp with d3exp_make_node
#symload d3exp with d3exp_make_tpnd
(* ****** ****** *)
(* ****** ****** *)
//
fn0
s2typ_new0_x2tp
( loc0: loc_t ): s2typ =
(
s2typ_xtv
(x2t2p_make_lctn(loc0)))
//
(* ****** ****** *)
//
fn0
s2typ_subst0
( t2p0: s2typ
, svts: s2vts): s2typ =
(
case+ svts of
|list_nil() => ( t2p0 )
|list_cons _ =>
(
s2typ_subst0(t2p0, svts))
)(*case+*) // s2typ_subst0
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun
<a:t0>
<b:t0>
list_ziprev
( xs: list(a)
, ys: list(b)): list@(a, b)
//
#impltmp
<a:t0>
<b:t0>
list_ziprev
  (xs, ys) =
(
  ziprev(xs, ys)) where
{
fun
ziprev(xs, ys) =
(
case+ xs of
|
list_nil() => list_nil()
|
list_cons(x1, xs) =>
(
case+ ys of
|
list_nil() => list_nil()
|
list_cons(y1, ys) =>
list_cons
((x1, y1), ziprev(xs, ys))))
}(*where*)//end-of-(list_ziprev)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans23_d2pat
( env0, d2p0 ) =
let
//
val loc0 = d2p0.lctn()
val t2p0 = d2p0.styp()
//
(*
val (  ) = prerrsln
("trans23_d2pat: loc0 = ", loc0)
val (  ) = prerrsln
("trans23_d2pat: d2p0 = ", d2p0)
*)
//
in//let
//
case+
d2p0.node() of
//
|
D2Pany() =>
(
  f0_any(env0, d2p0))
|
D2Pvar(d2v) =>
(
  f0_var(env0, d2p0))
//
(* ****** ****** *)
//
|
D2Pint(tok) =>
(
d3pat_make_tpnd
(loc0, t2p0, D3Pint(tok)))
|
D2Pbtf(sym) =>
(
d3pat_make_tpnd
(loc0, t2p0, D3Pbtf(sym)))
|
D2Pchr(tok) =>
(
d3pat_make_tpnd
(loc0, t2p0, D3Pchr(tok)))
|
D2Pflt(tok) =>
(
d3pat_make_tpnd
(loc0, t2p0, D3Pflt(tok)))
|
D2Pstr(tok) =>
(
d3pat_make_tpnd
(loc0, t2p0, D3Pstr(tok)))
//
(* ****** ****** *)
//
|D2Pcon _ => f0_con(env0, d2p0)
//
(*
|D2Psym0 _ => f0_sym0(env0, d2p0)
*)
//
|D2Pcons _ => f0_cons(env0, d2p0)
//
|D2Pbang _ => f0_bang(env0, d2p0)
|D2Pflat _ => f0_flat(env0, d2p0)
|D2Pfree _ => f0_free(env0, d2p0)
//
(*
HX-2024-10-04:
[D2Pdap0] should have
been eliminated at this point!
*)
|D2Pdap0 _ => f0_dap0(env0, d2p0)
|D2Pdap1 _ => f0_dap1(env0, d2p0)
|D2Pdapp _ => f0_dapp(env0, d2p0)
//
|D2Prfpt _ => f0_rfpt(env0, d2p0)
//
|D2Ptup0 _ => f0_tup0(env0, d2p0)
|D2Ptup1 _ => f0_tup1(env0, d2p0)
//
|D2Pannot _ => f0_annot(env0, d2p0)
//
| _(*otherwise*) => d3pat_none1(d2p0)
//
endlet where
{
//
(* ****** ****** *)
//
fun
f0_any
( env0:
! tr23env
, d2p0: d2pat): d3pat =
let
//
val
loc0 = d2p0.lctn()
val
t2p0 = d2p0.styp()
//
val-
D2Pany() = d2p0.node()
//
(*
val () =
prerrsln
("\
trans23_d2pat: \
D2Pany: t2p0 = ", t2p0)
*)
//
in//let
  d3pat(loc0, t2p0, D3Pany(*0*))
end//let//end-of-[f0_any(env0,d2p0)]
//
(* ****** ****** *)
//
fun
f0_var
( env0:
! tr23env
, d2p0: d2pat): d3pat =
let
//
val
loc0 = d2p0.lctn()
//
val-
D2Pvar
(d2v0) = d2p0.node()
//
val
t2p0 = d2v0.styp((*0*))
val
t2p0 = s2typ_hnfiz0(t2p0)
//
//
(*
val () =
prerrsln
("f0_var(23): d2p0 = ", d2p0)
val () =
prerrsln
("f0_var(23): t2p0 = ", t2p0)
*)
//
in//let
//
let
//
val (  ) = d2v0.styp(t2p0)
//
val t2p0 =
(
case+
t2p0.node() of
|T2Plft(t2p1) => t2p1
|_(*otherwise*) => t2p0): s2typ
//
in//let
  d3pat(loc0, t2p0, D3Pvar(d2v0))
end//let
//
end//let//end-of-[f0_var(env0,d2p0)]
//
(* ****** ****** *)
//
fun
f0_con
( env0:
! tr23env
, d2p0: d2pat): d3pat =
let
//
val loc0 = d2p0.lctn()
val-
D2Pcon(d2c1) = d2p0.node()
//
val (t2js, t2p0) =
d2con23_tjagize(loc0, d2c1)
//
val
d3p0 =
(
  d3pat_make_tpnd
  (loc0, t2p0, D3Pcon(d2c1)))
//
in//let
//
case+ t2js of
|list_nil _ => d3p0
|list_cons _ =>
(
  d3pat_make_tpnd
  (loc0, t2p0, D3Ptapq(d3p0, t2js)))
//
end(*let*)//end-of-[f0_con(env0,d2p0)]
//
(* ****** ****** *)
//
fun
f0_bang
( env0:
! tr23env
, d2p0: d2pat): d3pat =
let
//
val loc0 = d2p0.lctn()
val-
D2Pbang(d2p1) = d2p0.node()
//
val
d3p1 = trans23_d2pat(env0, d2p1)
//
in//let
let
val
t2p1 = d3p1.styp((*void*)) in//let
  d3pat(loc0, t2p1, D3Pbang( d3p1 ))
end//let
end(*let*)//end-of-[f0_bang(env0,d2p0)]
//
(* ****** ****** *)
//
fun
f0_flat
( env0:
! tr23env
, d2p0: d2pat): d3pat =
let
//
val loc0 = d2p0.lctn()
val-
D2Pflat(d2p1) = d2p0.node()
//
val
d3p1 = trans23_d2pat(env0, d2p1)
//
in//let
let
val
t2p1 = d3p1.styp((*void*)) in//let
  d3pat(loc0, t2p1, D3Pflat( d3p1 ))
end//let
end(*let*)//end-of-[f0_flat(env0,d2p0)]
//
(* ****** ****** *)
//
fun
f0_free
( env0:
! tr23env
, d2p0: d2pat): d3pat =
let
//
val loc0 = d2p0.lctn()
val-
D2Pfree(d2p1) = d2p0.node()
//
val
d3p1 = trans23_d2pat(env0, d2p1)
//
in//let
let
val
t2p1 = d3p1.styp((*void*)) in//let
  d3pat(loc0, t2p1, D3Pfree( d3p1 ))
end//let
end(*let*)//end-of-[f0_free(env0,d2p0)]
//
(* ****** ****** *)
//
(*
fun
f0_sym0
( env0:
! tr23env
, d2p0: d2pat): d3pat =
let
val loc0 = d2p0.lctn()
//
val-
D2Psym0
( drpt
, d1p1, dpis) = d2p0.node()
//
in//let
  trans23_d2pat(env0, drpt.dpat())
end (*let*)//end-of-[f0_sym0(env0,d2p0)]
*)
//
(* ****** ****** *)
//
fun
f0_cons
( env0:
! tr23env
, d2p0: d2pat): d3pat =
let
val loc0 = d2p0.lctn()
//
val-
D2Pcons
( drpt, d2cs) = d2p0.node()
//
in//let
  trans23_d2pat(env0, drpt.dpat())
end (*let*)//end-of-[f0_cons(env0,d2p0)]
//
(* ****** ****** *)
//
fun
f0_dap0
( env0:
! tr23env
, d2p0: d2pat): d3pat =
let
//
val loc0 = d2p0.lctn()
//
val tres = s2typ_none0()
//
in//let
(
d3pat(loc0, tres, D3Pnone1(d2p0)))
end (*let*) // end of [f0_dap0(env0,d2p0)]
//
(* ****** ****** *)
//
fun
f0_dap1
( env0:
! tr23env
, d2p0: d2pat): d3pat =
let
//
val loc0 = d2p0.lctn()
//
val-
D2Pdap1(d2f0) = d2p0.node()
//
val
d3f0 =
trans23_d2pat(env0, d2f0)
val
d3f0 = d3pat_sapqize(d3f0)
//
val tfun = d3f0.styp((*nil*))
//
val tres =
(
case+
tfun.node() of
| T2Pfun1
(_, _, _, tres) => tres
| _
(*non-T2Pfun1*) => s2typ_none0())
//
in//let
  d3pat(loc0, tres, D3Pdap1(d3f0))
end (*let*) // end of [f0_dap1(env0,d2p0)]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! tr23env
, d2p0: d2pat): d3pat =
let
//
val loc0 = d2p0.lctn()
//
val-
D2Pdapp
( d2f0
, npf1, d2ps) = d2p0.node()
//
val
d3f0 =
trans23_d2pat(env0, d2f0)
val
d3f0 = d3pat_sapqize(d3f0)
//
val d3ps =
trans23_d2patlst(env0, d2ps)
//
val tfun = d3f0.styp((*nil*))
(*
val tfun = s2typ_hnfiz0(tfun)
*)
//
val targ =
(
case+
tfun.node() of
|
T2Pfun1
( f2cl, npf1
, t2ps, tres) => t2ps
|_ (*else*) => list_nil()): s2typlst
val tres =
(
case+
tfun.node() of
|
T2Pfun1
( f2cl
, npf1, t2ps, tres) => tres
| _(* non-T2Pfun1 *) => tfun): s2typ
//
(*
val () =
prerrsln
("trans23_d2pat:f0_dapp:tfun = ",tfun)
val () =
prerrsln
("trans23_d2pat:f0_dapp:targ = ",targ)
val () =
prerrsln
("trans23_d2pat:f0_dapp:tres = ",tres)
*)
//
in//let
let
val d3ps =
trans23_d3patlst_tpcks
(env0, loc0, d3ps, targ)
in
  d3pat_make_tpnd
  (loc0, tres, D3Pdapp(d3f0,npf1,d3ps))
end (*let*)
end (*let*) // end of [f0_dapp(env0,d2p0)]
//
(* ****** ****** *)
//
fun
f0_rfpt
( env0:
! tr23env
, d2p0: d2pat): d3pat =
(
d3pat_make_tpnd
( loc0
, t2p2//HX:t2p0=t2p2
, D3Prfpt
  (d3p1, tkas, d3p2))) where
{
//
val loc0 = d2p0.lctn()
//
val-
D2Prfpt
(d2p1
,tkas, d2p2) = d2p0.node()
//
val
d3p2 =
trans23_d2pat(env0, d2p2)
val
t2p2 = d3p2.styp((*void*))
val // HX: [d2p1] is
d3p1 = // supposed to be a d2var
trans23_d2pat_tpck(env0, d2p1, t2p2)
//
} (*where*) // end-of-[f0_rfpt(env0,d2p0)]
//
(* ****** ****** *)
//
fun
f0_tup0
( env0:
! tr23env
, d2p0: d2pat): d3pat =
(
d3pat_make_tpnd
( loc0, t2p0
, D3Ptup0(npf1, d3ps))) where
{
//
val loc0 = d2p0.lctn()
//
val-
D2Ptup0
(npf1, d2ps) = d2p0.node()
//
val
d3ps = trans23_d2patlst(env0, d2ps)
//
val
t2p0 =
(
case+ d3ps of
|list_nil() =>
the_s2typ_void() (* HX: (): void *)
|list_cons _ =>
s2typ_tup0(npf1, s2typlst(d3ps))): s2typ
//
} (*where*) // end of [f0_tup0(env0,d2p0)]
//
(* ****** ****** *)
//
fun
f0_tup1
( env0:
! tr23env
, d2p0: d2pat): d3pat =
(
d3pat_make_tpnd
(
loc0, t2p0,
D3Ptup1
(tknd, npf1, d3ps))) where
{
//
val loc0 = d2p0.lctn((*0*))
//
val-
D2Ptup1
( tknd
, npf1, d2ps) = d2p0.node()
//
val
d3ps =
trans23_d2patlst(env0, d2ps)
//
val
trcd =
(
case-
tknd.node() of
|T_TRCD10(0) => TRCDflt0(*void*)
|T_TRCD10(_) => TRCDbox0(*void*))
//
val
t2p0 =
s2typ_tup1(trcd, npf1, s2typlst(d3ps))
//
} (*where*) // end of [f0_tup1(env0,d2p0)]
//
(* ****** ****** *)
//
fun
f0_annot
( env0:
! tr23env
, d2p0: d2pat): d3pat =
let
//
val loc0 = d2p0.lctn()
val-
D2Pannot
( d2p1
, s1e2, s2e2) = d2p0.node()
//
(*
val
t2p2 = s2exp_stpize(s2e2)
val
t2p2 = s2typ_hnfiz0(t2p2)
*)
val
t2p2 = d2p0.styp((*void*))
//
(*
val () =
prerrsln
("f0_annot(23): t2p2 = ", t2p2)
*)
//
val d3p1 =
(
case+
d2p1.node() of
|
D2Pvar _ => 
trans23_d2pat(env0, d2p1)
|
_(*non-D2Pvar*) =>
trans23_d2pat_tpck(env0, d2p1, t2p2)
) : d3pat // end of [val(d3p1)]
//
in//let
d3pat_make_tpnd
(loc0, t2p2, D3Pannot(d3p1,s1e2,s2e2))
end (*let*) // end of [f0_annot(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
} (*where*)//end-of-[trans23_d3pat(env0,d3p0)]

(* ****** ****** *)
//
#implfun
trans23_l2d2p
( env0,ld2p ) =
let
//
val+
D2LAB
(lab0, d2p1) = ld2p
//
in//let
D3LAB(lab0, trans23_d2pat(env0, d2p1))
end (*let*)//end-of-[trans23_l2d2p(env0,ld2p)]
//
(* ****** ****** *)
//
#implfun
trans23_d2exp
( env0, d2e0 ) =
let
//
val loc0 = d2e0.lctn()
val t2p0 = d2e0.styp()
//
(*
val (  ) = prerrsln
("trans23_d2exp: d2e0 = ", d2e0)
*)
//
in//let
//
case+
d2e0.node() of
//
|D2Evar _ =>
(
  f0_var(env0, d2e0))
//
(* ****** ****** *)
//
|D2Eint(tok) =>
(
d3exp_make_tpnd
(loc0, t2p0, D3Eint(tok)))
|D2Ebtf(sym) =>
(
d3exp_make_tpnd
(loc0, t2p0, D3Ebtf(sym)))
|D2Echr(tok) =>
(
d3exp_make_tpnd
(loc0, t2p0, D3Echr(tok)))
|D2Eflt(tok) =>
(
d3exp_make_tpnd
(loc0, t2p0, D3Eflt(tok)))
|D2Estr(tok) =>
(
d3exp_make_tpnd
(loc0, t2p0, D3Estr(tok)))
//
|D2Ei00(int) =>
(
d3exp_make_tpnd
(loc0, t2p0, D3Ei00(int)))
|D2Eb00(btf) =>
(
d3exp_make_tpnd
(loc0, t2p0, D3Eb00(btf)))
|D2Ec00(chr) =>
(
d3exp_make_tpnd
(loc0, t2p0, D3Ec00(chr)))
|D2Ef00(flt) =>
(
d3exp_make_tpnd
(loc0, t2p0, D3Ef00(flt)))
|D2Es00(str) =>
(
d3exp_make_tpnd
(loc0, t2p0, D3Es00(str)))
//
|D2Etop _ => f0_top(env0, d2e0)
//
(* ****** ****** *)
//
|D2Econ _ => f0_con(env0, d2e0)
|D2Ecst _ => f0_cst(env0, d2e0)
//
(* ****** ****** *)
//
|D2Econs _ => f0_cons(env0, d2e0)
|D2Ecsts _ => f0_csts(env0, d2e0)
//
(* ****** ****** *)
//
|D2Esym0 _ => f0_sym0(env0, d2e0)
//
|D2Esapp _ => f0_sapp(env0, d2e0)
//
|D2Etapp _ => f0_tapp(env0, d2e0)
//
|D2Edap0 _ => f0_dap0(env0, d2e0)
|D2Edapp _ => f0_dapp(env0, d2e0)
//
|D2Eproj _ => f0_proj(env0, d2e0)
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
|D2Etry0 _ => f0_try0(env0, d2e0)
//
|D2Eaddr _ => f0_addr(env0, d2e0)
|D2Eview _ => f0_view(env0, d2e0)
//
|D2Eeval _ => f0_eval(env0, d2e0)
//
|D2Efold _ => f0_fold(env0, d2e0)
|D2Efree _ => f0_free(env0, d2e0)
//
|D2Ewhere _ => f0_where(env0, d2e0)
//
|D2Eassgn _ => f0_assgn(env0, d2e0)
//
|D2Eraise _ => f0_raise(env0, d2e0)
//
|D2El0azy _ => f0_l0azy(env0, d2e0)
|D2El1azy _ => f0_l1azy(env0, d2e0)
//
|D2Eannot _ => f0_annot(env0, d2e0)
//
|D2Elabck _ => f0_labck(env0, d2e0)
|D2Et2pck _ => f0_t2pck(env0, d2e0)
//
|D2Enone0 _ => f0_none0(env0, d2e0)
//
|
D2Eextnam _ => f0_extnam(env0, d2e0)
//
|
D2Esynext _ => f0_synext(env0, d2e0)
//
|
_(*otherwise*) => (d3exp_none1(d2e0))
//
end where // end-of-[trans23_d2exp(...)]
{
//
(* ****** ****** *)
//
fun
f0_top
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
//
val-
D2Etop(sym1) = d2e0.node()
//
in//let
(
d3exp_make_tpnd
( loc0
, t2p0, D3Etop(sym1))) where
{ val
  t2p0 = s2typ_new0_x2tp(loc0) }
end (*let*) // end of [f0_top(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_var
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
//
val-
D2Evar(d2v1) = d2e0.node()
//
val t2p1 = d2v1.styp((*0*))
//
val d3e1 =
d3exp_make_tpnd
( loc0, t2p1, D3Evar(d2v1) )
//
in//let
(
case+
t2p1.node() of
| T2Plft(t2p1) =>
d3exp_make_tpnd
( loc0, t2p1, D3Eflat(d3e1) )
| _(*non-T2Plft*) => ( d3e1 ) )
//
end (*let*) // end of [f0_var(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_con
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
val loc0 = d2e0.lctn()
//
val-
D2Econ(d2c1) = d2e0.node()
//
in//let
  d2con23_tapqize(loc0, d2c1) endlet
//(*let*)//end-of-[f0_con(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_cst
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
val loc0 = d2e0.lctn()
//
val-
D2Ecst(d2c1) = d2e0.node()
//
in//let
  d2cst23_tapqize(loc0, d2c1) endlet
//(*let*)//end-of-[f0_cst(env0,d2e0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_cons
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
val loc0 = d2e0.lctn()
//
val-
D2Econs(d2cs) = d2e0.node()
//
in//let
case+ d2cs of
| list_nil() =>
(
  d3exp_none1(d2e0))
| list_cons(d2c1, _) =>
(
  d2con23_tapqize(loc0, d2c1)) endlet
//(*let*)//end-of-[f0_cons(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_csts
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
val loc0 = d2e0.lctn()
//
val-
D2Ecsts(d2cs) = d2e0.node()
//
in//let
case+ d2cs of
| list_nil() =>
(
  d3exp_none1(d2e0))
| list_cons(d2c1, _) =>
(
  d2cst23_tapqize(loc0, d2c1)) endlet
//(*let*)//end-of-[f0_csts(env0,d2e0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_sym0
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
val loc0 = d2e0.lctn()
//
val-
D2Esym0
( drxp
, d1e1, dpis) = d2e0.node()
//
in//let
  trans23_d2exp(env0, drxp.dexp())
end (*let*)//end-of-[f0_sym0(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_sapp
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
//
val-
D2Esapp
(d2f0, s2es) = d2e0.node()
//
val d3f0 =
(
  trans23_d2exp(env0, d2f0))
//
val tfun = d2f0.styp((*nil*))
val tfun = s2typ_hnfiz0(tfun)
//
val d3f1 =
(
case+
tfun.node() of
|
T2Puni0
(s2vs, t2p1) =>
let
val t2ps =
f1_t2ps(s2vs, s2es)
val svts =
list_ziprev(s2vs, t2ps)
val t2p1 =
s2typ_subst0(t2p1, svts)
in//let
d3exp_make_tpnd
(loc0
,t2p1, D3Esapq(d3f0,t2ps))
endlet//end-of-[T2Pfun(...)]
|
_(*non-T2Puni0*) =>
let
val () =
d3f0.styp(tfun) in d3f0 end )
//
where { // end-of-case
//
fun
f1_t2ps
( s2vs: s2varlst
, s2es: s2explst): s2typlst =
(
case+ s2vs of
|
list_nil() =>
list_nil( (*void*) )
|
list_cons(s2v1, s2vs) =>
(
f1_t2ps_cons(s2v1, s2vs, s2es)))
//(*case+*)//end of [f1_sapq(...)]
//
and
f1_t2ps_cons
( s2v1: s2var
, s2vs: s2varlst
, s2es: s2explst): s2typlst =
(
case+ s2es of
|list_nil
((*nil*)) =>
list_cons
( t2p1
, f1_t2ps(s2vs, s2es)) where
{
  val
  t2p1 = s2typ_new0_x2tp(loc0) }
//
|list_cons
(s2e1, s2es) =>
if
s2exp_imprq(s2e1)
then
list_cons
( t2p1
, f1_t2ps(s2vs, s2es)) where
{
  val t2p1 = s2exp_stpize(s2e1) }
else
(
  f1_t2ps_cons(s2v1, s2vs, s2es) )
) (*case+*)//end-of-[f1_t2ps_cons()]
} (*where*)//end-of-case(tfun.node())
//
in//let
let
val t2p1 =
d3f1.styp((*0*)) in
(
  d3exp_make_tpnd
  (loc0, t2p1, D3Esapp(d3f1, s2es)) )
end (*let*)
end (*let*)//end-of-[f0_sapp(env0,d2e0)]
//
(* ****** ****** *)
//
(*
fun
f0_tapp
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
//
val-
D2Etapp
(d2f0, s2es) = d2e0.node()
//
val d3f0 = trans23_d2exp(env0, d2f0)
//
in//let
let
val
val
t2p0 = d3f0.styp() in
(
  d3exp_make_tpnd
  (loc0, t2p0, D3Etapp(d3f0,s2es))) end
end (*let*) // end of [f0_tapp(env0,d2e0)]
*)
//
(* ****** ****** *)
//
local
//
(* ****** ****** *)
//
fun
f1_root
(d2f0: d2exp): d2exp =
(
case+
d2f0.node() of
|D2Etapp
(d2f1, s2es) =>
f1_root( d2f1 ) | _ => d2f0 )
//
fun
f1_d2fs
( d2f0: d2exp
, d2fs: d2explst): d2explst =
(
case+
d2f0.node() of
|D2Etapp
(d2f1, _) =>
f1_d2fs(d2f1, d2fs) where
{
val
d2fs = list_cons(d2f0, d2fs) }
| _(* non-D2Etapp *) => ( d2fs ) )
//
(* ****** ****** *)
//
fun
f1_tapp
( d3f0: d3exp
, d2f1: d2exp): d3exp =
let
//
val
loc1 = d2f1.lctn((*0*))
val
t2p0 = d3f0.styp((*0*))
//
val-
D2Etapp
(_, s2es) = d2f1.node((*0*))
//
in//let
d3exp
(loc1,t2p0,D3Etapp(d3f0,s2es))
endlet // end of [ f1_tapp(...) ]
//
(* ****** ****** *)
//
fun
f1_unif
( env0:
! tr23env
, t2j1: t2jag
, d2f1: d2exp): void =
let
//
val
t2ps =
t2jag_get_t2ps(t2j1)
val
s2es =
(
case-
d2f1.node() of
|D2Etapp(_, s2es) => s2es)
//
in//let
f2_t2ps_s2es(env0, t2ps, s2es)
end where
{
//
fun
f2_t2p1_s2e1
( env0:
! tr23env
, t2p1: s2typ
, s2e1: s2exp): void =
let
val utbf =
unify23_s2typ
( env0
, t2p1, s2exp_stpize(s2e1))
endlet
//
fun
f2_t2ps_s2es
( env0:
! tr23env
, t2ps: s2typlst
, s2es: s2explst): void =
(
case+ t2ps of
|list_nil() => ()
|list_cons(t2p1, t2ps) =>
(
case+ s2es of
|list_nil() => ()
|list_cons(s2e1, s2es) =>
let
val () =
f2_t2p1_s2e1(env0, t2p1, s2e1)
in//let
f2_t2ps_s2es(env0, t2ps, s2es)
end(*let*)
)
) (*case+*) // end-[f2_t2ps_s2es]
//
} (*where*) // end of [f1_unif(...)]
//
(* ****** ****** *)
//
fun
f1_wind
( env0:
! tr23env
, d3f0: d3exp
, t2js: t2jaglst
, d2fs: d2explst): d3exp =
(
case+ t2js of
|list_nil
((*void*)) =>
(
case+ d2fs of
|list_nil
((*void*)) => (d3f0)
|list_cons
(d2f1, d2fs) =>
let
//
val
d3f0 =
f1_tapp(d3f0, d2f1)
//
in//let
let
val
d3f0 = d3exp_none2(d3f0)
in//let
f1_wind
(env0, d3f0, t2js, d2fs) endlet
end (*let*)//end-[list_cons(...)]
)
//
|list_cons
(t2j1, t2js) =>
(
case+ d2fs of
|list_nil
((*void*)) => (d3f0)
|list_cons
(d2f1, d2fs) =>
let
//
val
d3f0 =
f1_tapp(d3f0, d2f1)
//
val
utbf = // HX: fail-safe!
f1_unif(env0, t2j1, d2f1)
//
in//let
f1_wind(env0, d3f0, t2js, d2fs)
end (*let*)//end-[list_cons(...)]
)
) (*case+*) // end of [ f1_wind(...) ]
//
in//local
//
fun
f0_tapp
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
//
val-
D2Etapp _ = d2e0.node()
//
val d2f0 =
f1_root(d2e0)
val d2fs =
f1_d2fs(d2e0, list_nil)
//
val d3f0 =
trans23_d2exp(env0, d2f0)
//
val t2js =
(
case+
d3f0.node() of
|
D3Etapq
(_, t2js) => t2js
|
_(*else*) => list_nil(*nil*))
//
(*
val () =
(
  prerrsln
  ("f0_tapp: d3f0 = ", d3f0) )
val () =
(
  prerrsln
  ("f0_tapp: t2js = ", t2js) )
val () =
(
  prerrsln
  ("f0_tapp: d2fs = ", d2fs) )
*)
//
in
(
  f1_wind(env0, d3f0, t2js, d2fs)  )
end (*let*) // end of [ f0_tapp(...) ]
//
end (*local*)//end of [f0_tapp(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_dap0
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
//
val-
D2Edap0(d2f0) = d2e0.node()
//
val d3f0 =
  trans23_d2exp(env0, d2f0)
val tfun = d3exp_get_styp(d3f0)
//
val tres =
(
case+
tfun.node() of
| T2Pfun1
( f2cl
, npf1, t2ps, tres) => tres
| _(* non-T2Pfun1 *) => tfun): s2typ
//
in//let
  d3exp(loc0, tres, D3Edap0( d3f0 ))
end (*let*) // end of [f0_dap0(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
//
val-
D2Edapp
( d2f0
, npf1, d2es) = d2e0.node()
//
val
d3f0 =
trans23_d2exp(env0, d2f0)
//
val
d3f0 = d3exp_sapqize(d3f0)
//
val d3es =
trans23_d2explst(env0, d2es)
//
val tfun = d3f0.styp((*nil*))
//
(*
HX-2024-08-24:
[d3exp_sapqize] does it:
val tfun = s2typ_hnfiz0(tfun)
*)
//
val targ =
(
case+
tfun.node() of
| T2Pfun1
( f2cl, npf1
, t2ps, tres) => t2ps
|_ (*else*) => list_nil()): s2typlst
val tres =
(
case+
tfun.node() of
| T2Pfun1
( f2cl
, npf1, t2ps, tres) => tres
| _(* non-T2Pfun1 *) => tfun): s2typ
//
(*
val () =
prerrsln
("trans23_d2exp:f0_dapp:tfun = ",tfun)
val () =
prerrsln
("trans23_d2exp:f0_dapp:targ = ",targ)
val () =
prerrsln
("trans23_d2exp:f0_dapp:tres = ",tres)
*)
//
in//let
let
val d3es =
trans23_d3explst_tpcks
(env0, loc0, d3es, targ)
in
  d3exp_make_tpnd
  (loc0, tres, D3Edapp(d3f0,npf1,d3es))
end (*let*)
end (*let*) // end of [f0_dapp(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_proj
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
//
val-
D2Eproj
( tknd
, drxp
, dlab
, dtup) = d2e0.node()
//
val dtup =
trans23_d2exp(env0, dtup)
//
val
ttup = dtup.styp((*nil*))
val
ttup = s2typ_hnfiz0(ttup)
//
in//let

if
s2typ_dataq(ttup)
then
let(*let*)
//
val tprj =
s2typ_new0_x2tp(loc0)
//
in//let
d3exp_make_tpnd
(loc0
,tprj
,D3Epcon(tknd,dlab,dtup)) end//then
else
let(*let*)
//
val tprj =
(
case+ topt of
| ~
optn_vt_nil() =>
s2typ_none0( (*void*) )
| ~
optn_vt_cons(tprj) => tprj)
where
{val
 topt =
 s2typ_prjout$opt(ttup,dlab)}
//
in//let
d3exp_make_tpnd
(loc0
,tprj,D3Eproj(tknd,dlab,dtup)) end//else
end (*let*) // end of [f0_proj(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_let0
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
val loc0 = d2e0.lctn()
val-
D2Elet0
( dcls, d2e1) = d2e0.node()
//
val
(  ) = tr23env_pshlet0(env0)
//
val dcls =
trans23_d2eclist(env0, dcls)
//
val
d3e1 = trans23_d2exp(env0, d2e1)
//
val (  ) = tr23env_poplet0(env0)
//
in//let
d3exp_make_tpnd
( loc0
, d3e1.styp(), D3Elet0(dcls, d3e1))
end (*let*) // end of [f0_let0(env0,...)]
//
(* ****** ****** *)
//
fun
f0_ift0
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
val loc0 = d2e0.lctn()
val-
D2Eift0
(d2e1
,dthn, dels) = d2e0.node()
//
val d3e1 =
trans23_d2exp_tpck
( env0, d2e1, t2p1 ) where
{
val t2p1 = the_s2typ_bool()
}
//
val dthn =
trans23_d2expopt(env0, dthn)
//
val tres =
(
case+ dthn of
|
optn_nil() => the_s2typ_void()
|
optn_cons(d3e2) =>
(
case+ dels of
|
optn_nil() => the_s2typ_void()
|
optn_cons(d3e3) => d3e2.styp((*0*))))
//
in//let
//
case+ dels of
|
optn_nil() =>
let
val dels = optn_nil()
val dthn =
(
case+ dthn of
|
optn_nil() => dthn
|
optn_cons(d3e2) =>
optn_cons
(
trans23_d3exp_tpck(env0, d3e2, tres))
)
in
d3exp_make_tpnd
(loc0, tres, D3Eift0(d3e1, dthn, dels))
end
|
optn_cons(d2e3) =>
let
val dels =
optn_cons
(
trans23_d2exp_tpck(env0, d2e3, tres))
in
d3exp_make_tpnd
(loc0, tres, D3Eift0(d3e1, dthn, dels))
end
//
end (*let*) // end of [f0_ift0(env0,...)]
//
(* ****** ****** *)
//
fun
f0_cas0
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Ecas0
( tknd
, d2e1, dcls) = d2e0.node()
//
val d3e1 =
trans23_d2exp(env0, d2e1)
val tres = s2typ_new0_x2tp(loc0)
//
in//let
let
val dcls =
trans23_d2clslst_tpck1
(env0, dcls, d3e1, tres)
in//let
  d3exp_make_tpnd
  (loc0,tres,D3Ecas0(tknd,d3e1,dcls))
end (*let*)
end (*let*) // end of [f0_cas0(env0,...)]
//
(* ****** ****** *)
//
fun
f0_seqn
( env0:
! tr23env
, d2e0: d2exp): d3exp =
(
d3exp_make_tpnd
( loc0
, d3e1.styp()
, D3Eseqn(d3es, d3e1))) where
{
val loc0 = d2e0.lctn()
val-
D2Eseqn
(d2es, d2e1) = d2e0.node()
//
val d3es =
trans23_d2explst_tpck1
(env0, d2es, the_s2typ_void((*0*)))
//
val d3e1 = trans23_d2exp(env0, d2e1)
//
} (*where*) // end of [f0_seqn(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_tup0
( env0:
! tr23env
, d2e0: d2exp): d3exp =
(
d3exp_make_tpnd
( loc0, t2p0
, D3Etup0(npf1, d3es))) where
{
val loc0 = d2e0.lctn()
val-
D2Etup0
(npf1, d2es) = d2e0.node()
val
d3es = trans23_d2explst(env0, d2es)
val
t2p0 =
(
case+ d3es of
|list_nil() =>
the_s2typ_void()
|list_cons _ =>
s2typ_tup0(npf1, s2typlst(d3es))): s2typ
} (*where*) // end of [f0_tup0(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_tup1
( env0:
! tr23env
, d2e0: d2exp): d3exp =
(
d3exp_make_tpnd
( loc0, t2p0
, D3Etup1
  (tknd, npf1, d3es))) where
{
val loc0 = d2e0.lctn()
val-
D2Etup1
( tknd
, npf1, d2es) = d2e0.node()
val
d3es = trans23_d2explst(env0, d2es)
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
s2typ_tup1(trcd , npf1 , s2typlst(d3es))
} (*where*) // end of [f0_tup1(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_rcd2
( env0:
! tr23env
, d2e0: d2exp): d3exp =
(
d3exp_make_tpnd
( loc0, t2p0
, D3Ercd2
  (tknd, npf1, ldes))) where
{
val loc0 = d2e0.lctn()
val-
D2Ercd2
( tknd
, npf1, ldes) = d2e0.node()
val
ldes = trans23_l2d2elst(env0, ldes)
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
s2typ_rcd2(trcd , npf1 , l2t2plst(ldes))
} (*where*) // end of [f0_rcd2(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_lam0
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
val t2p0 = d2e0.styp()
//
val-
D2Elam0
( tknd
, f2as, sres
, arrw, dexp) = d2e0.node()
//
val f3as =
(
  trans23_f2arglst(env0, f2as))
//
val dexp =
(
case+ sres of
|
S2RESnone((*void*)) =>
trans23_d2exp(env0, dexp)
|
S2RESsome(seff, sexp) =>
let
val
tres =
s2exp_stpize(sexp) in
trans23_d2exp_tpck(env0,dexp,tres)
end (*let*) // end of [ S2RESsome ]
) : (d3exp) // end of [ val(dexp) ]
//
val tres = dexp.styp((*void*))
val tfun =
s2typ_fun1_f3arglst(f3as,t2p0,tres)
//
in//let
//
d3exp_make_tpnd
( loc0
, tfun
, D3Elam0( tknd,f3as,sres,arrw,dexp ))
//
end (*let*) // end of [f0_lam0(env0,...)]
//
(* ****** ****** *)
//
fun
f0_fix0
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
val t2p0 = d2e0.styp()
//
val-
D2Efix0
( tknd
, d2v0
, f2as, sres
, arrw, dexp) = d2e0.node()
//
val f3as =
(
  trans23_f2arglst(env0, f2as))
//
val dexp =
(
case+ sres of
|
S2RESnone((*void*)) =>
trans23_d2exp(env0, dexp)
|
S2RESsome(seff, sexp) =>
let
val
tres =
s2exp_stpize(sexp) in
trans23_d2exp_tpck(env0,dexp,tres)
end (*let*) // end of [ S2RESsome ]
) : (d3exp) // end of [ val(dexp) ]
//
val tres = dexp.styp((*void*))
val tfun =
s2typ_fun1_f3arglst(f3as,t2p0,tres)
//
in//let
//
d3exp_make_tpnd
(
loc0,
tfun,
D3Efix0
(tknd, d2v0, f3as, sres, arrw, dexp) )
//
end (*let*) // end of [f0_fix0(env0,...)]
//
(* ****** ****** *)
//
fun
f0_try0
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
//
val-
D2Etry0
( tknd
, d2e1, dcls) = d2e0.node()
//
val
d3e1 =
trans23_d2exp(env0, d2e1)
val
tres = d3e1.styp((*void*))
//
val
darg =
let
val darg =
d3exp_none0(loc0)
val targ =
the_s2typ_excptn() in
(darg.styp(targ); darg) end//val
//
in//let
let
val dcls =
trans23_d2clslst_tpck1
(env0, dcls, darg, tres)
in//let
(
  d3exp_make_tpnd
  (loc0,tres,D3Etry0(tknd,d3e1,dcls)))
end (*let*)
end (*let*) // end of [f0_try0(env0,...)]
//
(* ****** ****** *)
//
fun
f0_addr
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Eaddr(d2e1) = d2e0.node()
//
val
d3e1 = trans23_d2exp(env0, d2e1)
//
in//let
let
val telt = d3e1.styp((*void*))
val t2p0 = the_s2typ_p2tr1(telt)
in//let
(
  d3exp(loc0, t2p0, D3Eaddr( d3e1 )))
end (*let*)
end (*let*) // end of [f0_addr(env0,...)]
//
(* ****** ****** *)
//
fun
f0_view
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Eview(d2e1) = d2e0.node()
//
val
d3e1 = trans23_d2exp(env0, d2e1)
//
in//let
let
val telt = d3e1.styp((*void*))
val t2p0 = the_s2typ_p2at1(telt)
in//let
(
  d3exp(loc0, t2p0, D3Eview( d3e1 )))
end (*let*)
end (*let*) // end of [f0_view(env0,...)]
//
(* ****** ****** *)
//
fun
f0_eval
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Eeval(d2e1) = d2e0.node()
//
val
d3e1 = trans23_d2exp(env0, d2e1)
//
in//let
//
let
//
val t2p1 = d3e1.styp((*0*))
val t2p1 = s2typ_hnfiz0(t2p1)
(*
val (  ) =
prerrsln("f0_eval(23): loc0 = ", loc0)
val (  ) =
prerrsln("f0_eval(23): d3e1 = ", d3e1)
val (  ) =
prerrsln("f0_eval(23): t2p1 = ", t2p1)
*)
//
in//let
//
if
isP2TR(t2p1)
then
(
case-
t2p1.node() of
|T2Papps
(t2f1, t2ps) =>
let
val-
list_cons(telt, _) = t2ps
in//let
(
d3exp(loc0, telt, D3Edp2tr(d3e1)))
end (*let*) // end-of-[isP2TR(t2p1)]
)
else
(
if
isL0AZY(t2p1)
then
(
case-
t2p1.node() of
|T2Papps
(t2f1, t2ps) =>
let
val-
list_cons(telt, _) = t2ps
in//let
(
d3exp(loc0, telt, D3Edl0az(d3e1)))
end (*let*) // end-of-[isL0AZY(t2p1)]
)
else
(
if
isL1AZY(t2p1)
then
(
case-
t2p1.node() of
|T2Papps
(t2f1, t2ps) =>
let
val-
list_cons(telt, _) = t2ps
in//let
(
d3exp(loc0, telt, D3Edl1az(d3e1)))
end (*let*) // end-of-[isL1AZY(t2p1)]
) (* end-of-then *)
else
(
let
val
t2p0 = s2typ_new0_x2tp(loc0)
in//let
(
  d3exp(loc0, t2p0, D3Eeval( d3e1 )))
end//let
) (* else *) // end-of-[ if(isL1AZY) ]
) (* else *) // end-of-[ if(isL0AZY) ]
) (* else *) // end-of-[ if(isP2TR1) ]
//
end//let
//
end where // end-of-let
{
//
fun
isP2TR
(t2p1:s2typ): bool = s2typ_p2tr1q(t2p1)
//
fun
isL0AZY
(t2p1:s2typ): bool = s2typ_l0azy1q(t2p1)
fun
isL1AZY
(t2p1:s2typ): bool = s2typ_l1azy1q(t2p1)
//
} (*where*) // end of [f0_eval(env0,...)]
//
(* ****** ****** *)
//
fun
f0_fold
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Efold
(  d2e1  ) = d2e0.node()
//
val
d3e1 =
trans23_d2exp(env0, d2e1)
//
val
t2p0 = the_s2typ_void((*0*))
//
in//let
(
  d3exp(loc0, t2p0, D3Efold( d3e1 )))
end (*let*) // end of [f0_fold(env0,...)]
//
(* ****** ****** *)
//
fun
f0_free
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Efree
(  d2e1  ) = d2e0.node()
//
val
d3e1 =
trans23_d2exp(env0, d2e1)
//
val
t2p0 = the_s2typ_void((*0*))
//
in//let
(
  d3exp(loc0, t2p0, D3Efree( d3e1 )))
end (*let*) // end of [f0_free(env0,...)]
//
(* ****** ****** *)
//
fun
f0_where
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Ewhere
( d2e1, dcls) = d2e0.node()
//
val
(  ) = tr23env_pshlet0(env0)
//
val dcls =
trans23_d2eclist(env0, dcls)
//
val
d3e1 = trans23_d2exp(env0, d2e1)
//
val (  ) = tr23env_poplet0(env0)
//
in//let
(
d3exp_make_tpnd
( loc0
, d3e1.styp(), D3Ewhere(d3e1, dcls)) )
end (*let*) // end of [f0_where(env0,...)]
//
(* ****** ****** *)
//
fun
f0_assgn
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Eassgn
(d2el, d2er) = d2e0.node()
//
val
d3el =
trans23_d2exp(env0, d2el)
val
t2pl = d3el.styp((*void*))
//
(*
(*
HX-2024-01-22:
It is handled in [unify2a]
*)
val
t2pl =
s2typ_hnfiz0(t2pl)//val(t2pl)
val
t2pl =
(
case+
t2pl.node() of
|T2Ptop0(t2pl) => t2pl
|T2Ptop1(t2pl) => t2pl
|_(*otherise*) => t2pl): s2typ
*)
//
val t2p0 = the_s2typ_void((*0*))
//
val
d3er =
trans23_d2exp_tpck(env0,d2er,t2pl)
//
in//let
(
  d3exp_make_tpnd
  (loc0, t2p0, D3Eassgn(d3el, d3er)))
end (*let*) // end of [f0_assgn(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_raise
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Eraise
(tknd, d2e1) = d2e0.node()
//
val t2p1 = the_s2typ_excptn()
//
in//let
let
(*
val
t2p0 = d2e0.styp((*0*))
*)
val
t2p0 = s2typ_new0_x2tp(loc0)
in//let
d3exp_make_tpnd
( loc0
, t2p0, D3Eraise( tknd , d3e1) )
end where // end-of-let
{
val
d3e1 =
trans23_d2exp_tpck(env0, d2e1, t2p1)
}
end (*let*) // end of [f0_raise(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_l0azy
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
val-
D2El0azy
(dsym, d2e1) = d2e0.node()
//
val
d3e1 = trans23_d2exp(env0, d2e1)
//
in//let
(
d3exp_make_tpnd
( loc0
, t2p0, D3El0azy( dsym , d3e1) )
) where
{
  val
  t2p0 = the_s2typ_l0azy1(d3e1.styp())
}
end (*let*) // end of [f0_l0azy(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_annot
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
//
val-
D2Eannot
(d2e1
,s1e2, s2e2) = d2e0.node()
//
val t2p2 = s2exp_stpize(s2e2)
val t2p2 = s2typ_hnfiz0(t2p2)
//
(*
val () =
prerrsln("f0_annot(23): t2p2 = ", t2p2)
*)
//
val d3e1 =
trans23_d2exp_tpck(env0,d2e1,t2p2)
//
in//let
(
  d3exp_make_tpnd
  ( loc0
  , t2p2, D3Eannot(d3e1,s1e2,s2e2)) )
end (*let*) // end of [f0_annot(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_l1azy
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
val-
D2El1azy
(dsym
,d2e1, d2es) = d2e0.node()
//
val
d3e1 = trans23_d2exp(env0, d2e1)
val
d3es =
trans23_d2explst_tpck1
(env0, d2es, the_s2typ_void((*0*)))
//
in//let
(
d3exp_make_tpnd
( loc0
, t2p0, D3El1azy(dsym,d3e1,d3es))
) where
{
  val
  t2p0 = the_s2typ_l1azy1(d3e1.styp())
}
end (*let*) // end of [f0_l1azy(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_labck
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
val-
D2Elabck
(d2e1, lab2) = d2e0.node()
//
val
d3e1 =
(
 trans23_d2exp(env0, d2e1))
//
val t2p1 =
(
 s2typ_hnfiz0(d3e1.styp()))
//
in//let
//
if
s2typ_dataq
(   t2p1   )
then d3e1 else // if
let//let
val topt =
(
s2typ_prjout$opt(t2p1, lab2))
in//let
(
case+ topt of
| ~
optn_vt_nil() =>
(
d3exp_make_tpnd
( loc0
, t2p1, D3Elabck(d3e1, lab2)))
| ~optn_vt_cons(tprj) => (d3e1)) end//let
//
end (*let*) // end of [f0_labck(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_t2pck
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val-
D2Et2pck
(d2e1, t2p2) = d2e0.node()
//
in//let
trans23_d2exp_tpck(env0, d2e1, t2p2)
end (*let*) // end of [f0_t2pck(env0,d2e0)]
//
(* ****** ****** *)
//
fun
f0_none0
( env0:
! tr23env, d2e0: d2exp): d3exp =
let
val t2p0 = the_s2typ_void((*0*))
in//let
d3exp(d2e0.lctn(), t2p0, D3Enone0(*0*))
end (*let*) // end of [f0_none0(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_extnam
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
//
val-
D2Eextnam
(tknd, gnm1) = d2e0.node()
//
in//let
//
d3exp_make_tpnd
( loc0
, t2p0, D3Eextnam(tknd, gnm1))
where
{
  val t2p0 = s2typ_new0_x2tp(loc0) }
//
end (*let*) // end of [f0_extnam(env0,...)]
//
(* ****** ****** *)
//
(*
HX-2024-07-24:
Sat 20 Jul 2024 11:43:47 AM EDT
*)
//
fun
f0_synext
( env0:
! tr23env
, d2e0: d2exp): d3exp =
let
//
val loc0 = d2e0.lctn()
//
val-
D2Esynext
(tknd, gexp) = d2e0.node()
//
in//let
//
d3exp_make_tpnd
( loc0
, t2p0, D3Esynext(tknd, gexp))
where
{
  val t2p0 = s2typ_new0_x2tp(loc0) }
//
end (*let*) // end of [f0_synext(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[trans23_d2exp(env0,d2e0)]

(* ****** ****** *)
//
#implfun
trans23_l2d2e
( env0,ld2e ) =
let
//
val+
D2LAB
(lab0, d2e1) = ld2e
//
in//let
D3LAB(lab0, trans23_d2exp(env0, d2e1))
end(*let*)//end-of-[trans23_l2d2e(env0,ld2e)]
//
(* ****** ****** *)
//
#implfun
trans23_f2arg
( env0, farg ) =
let
//
val loc0 = farg.lctn()
//
(*
val () =
prerrsln
("trans23_f2arg: loc0 = ", loc0)
val () =
prerrsln
("trans23_f2arg: farg = ", farg)
*)
//
in//let
//
case+
farg.node() of
//
|
F2ARGdapp(npf1, d2ps) =>
let
val loc0 = farg.lctn()
val d3ps =
trans23_d2patlst(env0, d2ps)
in//let
f3arg(loc0,F3ARGdapp(npf1,d3ps))
end (*let*) // end of [F2ARGdapp]
//
|
F2ARGsapp
(s2vs, s2ps) =>
(
  f3arg(loc0,F3ARGsapp(s2vs,s2ps)))
|
F2ARGmets
(   s2es   ) => f3arg(loc0,F3ARGmets(s2es))
//
end(*let*)//end-of-[trans23_f2arg(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans23_d2gua
(env0 , dgua) =
(
case+
dgua.node() of
//
|D2GUAexp(d2e1) =>
d3gua
(loc0, D3GUAexp(d3e1)) where
{
val loc0 = dgua.lctn()
val
t2p1 = the_s2typ_bool()
val
d3e1 =
trans23_d2exp_tpck(env0, d2e1, t2p1) }
//
|D2GUAmat(d2e1, d2p2) =>
d3gua
(loc0
,D3GUAmat(d3e1, d3p2)) where
{
val loc0 = dgua.lctn()
val
d3e1 = 
trans23_d2exp(env0, d2e1)
val
t2p1 = d3e1.styp((*void*))
val
d3p2 =
trans23_d2pat_tpck(env0, d2p2, t2p1) }
//
)(*case+*)//end-of-[trans23_d2gua(env0,...)]
//
(* ****** ****** *)
//
#implfun
trans23_d2gpt_tpck
( env0
, dgpt, targ) =
(
case+
dgpt.node() of
//
|D2GPTpat
(  d2p1  ) =>
let
val
loc0 = dgpt.lctn()
val
d3p1 =
trans23_d2pat_tpck
(env0 , d2p1 , targ) in
d3gpt(loc0, D3GPTpat(d3p1)) end
//
|D2GPTgua
(d2p1, d2gs) =>
let
val
loc0 = dgpt.lctn()
val
d3p1 =
trans23_d2pat_tpck
(env0 , d2p1 , targ)
val
d3gs =
trans23_d2gualst(env0, d2gs) in
d3gpt(loc0, D3GPTgua(d3p1, d3gs)) end
//
)(*case+*)//end-of-[trans23_d2gpt_tpck(...)]
//
(* ****** ****** *)
//
#implfun
trans23_d2cls_tpck
( env0, dcls
, darg, tres) =
(
case+
dcls.node() of
//
|D2CLSgpt
(  dgpt  ) =>
let
//
val
loc0 = dcls.lctn()
val
targ = darg.styp()
//
val dgpt =
trans23_d2gpt_tpck
(env0, dgpt, targ) in
d3cls(loc0, D3CLSgpt(dgpt)) end
//
|D2CLScls
(dgpt, d2e1) =>
let
//
val
loc0 = dcls.lctn()
val
targ = darg.styp()
//
val dgpt =
trans23_d2gpt_tpck
(env0 , dgpt , targ)
val d3e1 =
trans23_d2exp_tpck
(env0 , d2e1 , tres) in
d3cls(loc0, D3CLScls(dgpt, d3e1)) end
//
)(*case+*)//end-of-[trans23_d2cls_tpck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans23_d2patlst
  (env0, d2ps) =
(
list_trans23_fnp(env0, d2ps, trans23_d2pat))
//
#implfun
trans23_l2d2plst
  (env0, ldps) =
(
list_trans23_fnp(env0, ldps, trans23_l2d2p))
//
(* ****** ****** *)
//
#implfun
trans23_d2explst
  (env0, d2es) =
(
list_trans23_fnp(env0, d2es, trans23_d2exp))
//
#implfun
trans23_d2expopt
  (env0, dopt) =
(
optn_trans23_fnp(env0, dopt, trans23_d2exp))
//
#implfun
trans23_l2d2elst
  (env0, ldes) =
(
list_trans23_fnp(env0, ldes, trans23_l2d2e))
//
(* ****** ****** *)

#implfun
trans23_f2arglst
  (env0, f2as) =
(
list_trans23_fnp(env0, f2as, trans23_f2arg))

(* ****** ****** *)

#implfun
trans23_d2gualst
  (env0, d2gs) =
(
list_trans23_fnp(env0, d2gs, trans23_d2gua))

(* ****** ****** *)
(* ****** ****** *)

#implfun
trans23_d2pat_tpck
(env0, d2p0, t2p0) =
let
val
d3p0 = trans23_d2pat(env0, d2p0)
in
trans23_d3pat_tpck(env0,d3p0,t2p0)
end(*let*) // end of [trans23_d2pat_tpck(...)]

(* ****** ****** *)

#implfun
trans23_d2exp_tpck
(env0, d2e0, t2p0) =
let
val
d3e0 = trans23_d2exp(env0, d2e0)
in//let
trans23_d3exp_tpck(env0,d3e0,t2p0)
end(*let*) // end-of-[trans23_d2exp_tpck(...)]

(* ****** ****** *)
(* ****** ****** *)

#implfun
trans23_d3pat_tpck
(env0, d3p0, t2p0) =
let
val ubtf =
unify23_s2typ(env0,d3p0.styp(),t2p0)
in//let
if
ubtf then d3p0 else
let
val loc0 = d3p0.lctn() in
d3pat(loc0, t2p0, D3Pt2pck(d3p0,t2p0)) end
end where
{
//
(*
val () =
prerrsln("trans23_d3pat_tpck: d3p0 = ", d3p0)
val () =
prerrsln("trans23_d3pat_tpck: t2p0 = ", t2p0)
val () = prerrsln("\
trans23_d3pat_tpck: d3p0.styp() = ", d3p0.styp())
*)
//
}(*where*) // end-of-[trans23_d3pat_tpck(...)]

(* ****** ****** *)

#implfun
trans23_d3exp_tpck
(env0, d3e0, t2p0) =
let
//
val t2p1 = d3e0.styp()
val ubtf =
unify23_s2typ(env0, t2p1, t2p0)
//
in//let
//
if
ubtf
then d3e0 else
let
val
loc0 = d3e0.lctn()
in//let
d3exp
(loc0, t2p0, D3Et2pck(d3e0, t2p0))
end//let
//
end where
{
//
(*
val
loc0 = d3e0.lctn((*void*))
val () = prerrsln
  ("trans23_d3exp_tpck: loc0 = ", loc0)
val () = prerrsln
  ("trans23_d3exp_tpck: d3e0 = ", d3e0)
val () = prerrsln
  ("trans23_d3exp_tpck: t2p0 = ", t2p0)
*)
//
}(*where*) // end-of-[trans23_d3exp_tpck(...)]

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans23_d2patlst_tpck1
( env0 , d2ps , t2p0 ) =
(
case+ d2ps of
|
list_nil() => list_nil()
|
list_cons(d2p1, d2ps) =>
list_cons(d2p1, d2ps) where
{
val d2p1 =
trans23_d2pat_tpck(env0, d2p1, t2p0)
val d2ps =
trans23_d2patlst_tpck1(env0, d2ps, t2p0)
}
)(*case+*) // end of [trans23_d2patlst_tpck1(...)]
//
#implfun
trans23_d3patlst_tpck1
( env0 , d3ps , t2p0 ) =
(
case+ d3ps of
|
list_nil() => list_nil()
|
list_cons(d3p1, d3ps) =>
list_cons(d3p1, d3ps) where
{
val d3p1 =
trans23_d3pat_tpck(env0, d3p1, t2p0)
val d3ps =
trans23_d3patlst_tpck1(env0, d3ps, t2p0)
}
)(*case+*) // end of [trans23_d3patlst_tpck1(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans23_d3patlst_tpcks
( env0
, loc0, d3ps , t2ps ) =
(
case+ d3ps of
|
list_nil() =>
(
case+ t2ps of
|
list_nil() =>
list_nil((*void*))
|
list_cons(t2p1, t2ps) =>
list_cons(d3p1, d3ps) where
{
//
val
d3p1 = d3pat_none0(loc0)
//
val d3p1 =
trans23_d3pat_tpck(env0, d3p1, t2p1)
val d3ps =
trans23_d3patlst_tpcks(env0,loc0,d3ps,t2ps) }
)
|
list_cons(d3p1, d3ps) =>
(
case+ t2ps of
|
list_nil() =>
list_cons(d3p1, d3ps) where
{
//
val
t2p1 = s2typ_none0((*void*))
//
val d3p1 =
trans23_d3pat_tpck(env0, d3p1, t2p1)
val d3ps =
trans23_d3patlst_tpcks(env0,loc0,d3ps,t2ps) }
|
list_cons(t2p1, t2ps) =>
list_cons(d3p1, d3ps) where
{
val d3p1 =
trans23_d3pat_tpck(env0, d3p1, t2p1)
val d3ps =
trans23_d3patlst_tpcks(env0,loc0,d3ps,t2ps) }
)
)(*case+*) // end of [trans23_d3patlst_tpcks(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans23_d2explst_tpck1
( env0 , d2es , t2p0 ) =
(
case+ d2es of
|
list_nil() => list_nil()
|
list_cons(d2e1, d2es) =>
list_cons(d3e1, d3es) where
{
val d3e1 =
trans23_d2exp_tpck(env0, d2e1, t2p0)
val d3es =
trans23_d2explst_tpck1(env0, d2es, t2p0) }
)(*case+*) // end of [trans23_d2explst_tpck1(...)]
//
#implfun
trans23_d3explst_tpck1
( env0 , d3es , t2p0 ) =
(
case+ d3es of
|
list_nil() => list_nil()
|
list_cons(d3e1, d3es) =>
list_cons(d3e1, d3es) where
{
val d3e1 =
trans23_d3exp_tpck(env0, d3e1, t2p0)
val d3es =
trans23_d3explst_tpck1(env0, d3es, t2p0) }
)(*case+*) // end of [trans23_d3explst_tpck1(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans23_d3explst_tpcks
( env0
, loc0, d3es , t2ps ) =
(
case+ d3es of
|
list_nil() =>
(
case+ t2ps of
|
list_nil() =>
list_nil((*void*))
|
list_cons(t2p1, t2ps) =>
list_cons(d3e1, d3es) where
{
//
val
d3e1 = d3exp_none0(loc0)
//
val d3e1 =
trans23_d3exp_tpck(env0, d3e1, t2p1)
val d3es =
trans23_d3explst_tpcks(env0,loc0,d3es,t2ps) }
)
|
list_cons(d3e1, d3es) =>
(
case+ t2ps of
|
list_nil() =>
list_cons(d3e1, d3es) where
{
//
val
t2p1 = s2typ_none0((*void*))
//
val d3e1 =
trans23_d3exp_tpck(env0, d3e1, t2p1)
val d3es =
trans23_d3explst_tpcks(env0,loc0,d3es,t2ps) }
|
list_cons(t2p1, t2ps) =>
list_cons(d3e1, d3es) where
{
val d3e1 =
trans23_d3exp_tpck(env0, d3e1, t2p1)
val d3es =
trans23_d3explst_tpcks(env0,loc0,d3es,t2ps) }
)
)(*case+*) // end of [trans23_d3explst_tpcks(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans23_d2clslst_tpck1
( env0
, dcls , darg , tres ) =
(
list_map_e1nv
<x0><y0><e1>(dcls, env0)) where
{
#typedef x0 = d2cls
#typedef y0 = d3cls
#vwtpdef e1 = tr23env
#impltmp
map$fopr_e1nv<x0><y0><e1>
(x0, e1) = trans23_d2cls_tpck(e1,x0,darg,tres)
} (*where*) // end of [list_trans23_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans23_d2explstopt
( env0, dopt ) =
(
  optn_trans23_fnp(env0, dopt, trans23_d2explst))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_trans23_dynexp.dats] *)
(***********************************************************************)
