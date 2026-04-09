(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Sat Mar 14 07:27:49 PM EDT 2026
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
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/trxd3i0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2var_trxd3i0
(dvar, env0) =
(
i0var_make_dvar$info
( dvar
, lvl0, bvk0, ityp ))
where
{
val lvl0 =
(
envd3i0_getlvl0(env0))
val bvk0 =
(
envd3i0_getbvk0(env0))
val t2p0 = dvar.styp()
val ityp = s2typ_trxd3i0(t2p0, env0)
}(*where*)//endof(d2var_trxd3i0(...))
//
#implfun
d2fix_trxd3i0
(dvar, env0) =
(
i0var_make_dvar$info
( dvar
, lvl0, bvk0, ityp ))
where
{
val bvk0 = I0BVKfix
val lvl0 =
(
envd3i0_getlvl0(env0))
val t2p0 = dvar.styp()
val ityp = s2typ_trxd3i0(t2p0, env0)
}(*where*)//endof(d2fix_trxd3i0(...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3pat_trxd3i0
(d3p0, env0) =
let
//
val () =
prerrsln("\
d3pat_trxd3i0: d3p0 = ", d3p0)
//
in//let
//
case+
d3p0.node() of
//
(* ****** ****** *)
//
|D3Pany _ =>
(
  f0_any(d3p0, env0))
|D3Pvar _ =>
(
  f0_var(d3p0, env0))
//
(* ****** ****** *)
//
|D3Pint _ =>
(
  f0_int(d3p0, env0))
|D3Pbtf _ =>
(
  f0_btf(d3p0, env0))
|D3Pchr _ =>
(
  f0_chr(d3p0, env0))
|D3Pflt _ =>
(
  f0_flt(d3p0, env0))
|D3Pstr _ =>
(
  f0_str(d3p0, env0))
//
(* ****** ****** *)
//
|D3Pcon _ =>
(
  f0_con(d3p0, env0))
//
(* ****** ****** *)
//
|D3Pbang _ =>
(
  f0_bang(d3p0, env0))
|D3Pflat _ =>
(
  f0_flat(d3p0, env0))
|D3Pfree _ =>
(
  f0_free(d3p0, env0))
//
(* ****** ****** *)
//
|D3Ptapq _ =>
(
  f0_tapq(d3p0, env0))
//
(* ****** ****** *)
//
|D3Pdap1 _ =>
(
  f0_dap1(d3p0, env0))
|D3Pdapp _ =>
(
  f0_dapp(d3p0, env0))
//
(* ****** ****** *)
//
|D3Ptup0 _ =>
(
  f0_tup0(d3p0, env0))
(*
|D3Ptup1 _ =>
(
  f0_tup1(d3p0, env0))
|D3Prcd2 _ =>
(
  f0_rcd2(d3p0, env0))
*)
//
(* ****** ****** *)
//
|D3Pargtp _ =>
(
  f0_argtp(d3p0, env0))
|D3Pannot _ =>
(
  f0_annot(d3p0, env0))
//
(* ****** ****** *)
//
end where//let//endof(d3pat_trxd3i0)
{
//
(* ****** ****** *)
//
fun
f0_any
(d3p0: d3pat
,env0: !envd3i0): i0pat =
let
//
val-
D3Pany() = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pany(*0*)))
end(*let*)//end-of-[f0_any(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_var
(d3p0: d3pat
,env0: !envd3i0): i0pat =
let
//
val-
D3Pvar
(   d2v1   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val (  ) =
(
envd3i0_dvar$insert
( env0, d2v1, i0v1 )) where
{
val
lvl0 = envd3i0_getlvl0(env0)
val
bvk0 = envd3i0_getbvk0(env0)
val i0v1 =
(
i0var(d2v1, lvl0, bvk0, i0t0))}
//
in//let
(
i0pat(loc0, i0t0, I0Pvar(d2v1)))
end(*let*)//end-of-[f0_var(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_int
(d3p0: d3pat
,env0: !envd3i0): i0pat =
let
//
val-
D3Pint
(   tint   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pint(tint)))
end(*let*)//end-of-[f0_int(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_btf
(d3p0: d3pat
,env0: !envd3i0): i0pat =
let
//
val-
D3Pbtf
(   sym1   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pbtf(sym1)))
end(*let*)//end-of-[f0_btf(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_chr
(d3p0: d3pat
,env0: !envd3i0): i0pat =
let
//
val-
D3Pchr
(   tchr   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pchr(tchr)))
end(*let*)//end-of-[f0_chr(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_flt
(d3p0: d3pat
,env0: !envd3i0): i0pat =
let
//
val-
D3Pflt
(   tflt   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pflt(tflt)))
end(*let*)//end-of-[f0_flt(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_str
(d3p0: d3pat
,env0: !envd3i0): i0pat =
let
//
val-
D3Pstr
(   tstr   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pstr(tstr)))
end(*let*)//end-of-[f0_str(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_con
(d3p0: d3pat
,env0: !envd3i0): i0pat =
let
//
val-
D3Pcon
(   dcon   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pcon(dcon)))
end(*let*)//end-of-[f0_con(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_bang
(d3p0: d3pat
,env0: !envd3i0): i0pat =
let
//
val-
D3Pbang
(   d3p1   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
val i0p1 =
(
  d3pat_trxd3i0(d3p1, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pbang(i0p1)))
end(*let*)//end-of-[f0_bang(d3p0,env0)]
//
fun
f0_flat
(d3p0: d3pat
,env0: !envd3i0): i0pat =
let
//
val-
D3Pflat
(   d3p1   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
val i0p1 =
(
  d3pat_trxd3i0(d3p1, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pflat(i0p1)))
end(*let*)//end-of-[f0_flat(d3p0,env0)]
//
fun
f0_free
(d3p0: d3pat
,env0: !envd3i0): i0pat =
let
//
val-
D3Pfree
(   d3p1   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
val i0p1 =
(
  d3pat_trxd3i0(d3p1, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pfree(i0p1)))
end(*let*)//end-of-[f0_free(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_tapq
(d3p0: d3pat
,env0: !envd3i0): i0pat =
let
//
val-
D3Ptapq
(d3f0, tjgs) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
val i0f0 =
(
  d3pat_trxd3i0(d3f0, env0))
val ijgs =
(
  t2jaglst_trxd3i0(tjgs, env0))
//
in//let
(
i0pat_make_ityp$node(
loc0, i0t0, I0Ptapq(i0f0, ijgs)))
end(*let*)//end-of-[f0_tapq(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_dap1
(d3p0: d3pat
,env0: !envd3i0): i0pat =
let
//
val-
D3Pdap1
(   d3f0   ) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
val i0f0 =
(
  d3pat_trxd3i0(d3f0, env0))
//
in//let
(
i0pat(loc0, i0t0, I0Pdap1(i0f0)))
end(*let*)//end-of-[f0_dap1(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_dapp
(d3p0: d3pat
,env0: !envd3i0): i0pat =
let
//
val-
D3Pdapp
(d3f0
,npf1, d3ps) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
val i0f0 =
(
  d3pat_trxd3i0(d3f0, env0))
val i0ps =
(
  d3patlst_trxd3i0(d3ps, env0))
//
in//let
(
i0pat_make_ityp$node(loc0,
  i0t0, I0Pdapp(i0f0,npf1,i0ps)))
end(*let*)//end-of-[f0_dapp(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_tup0
(
d3p0: d3pat,
env0: !envd3i0): i0pat =
let
//
val-
D3Ptup0
(npf1, d3ps) = d3p0.node()
//
val t2p0 = d3p0.styp((*0*))
val loc0 = d3p0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0ps =
d3patlst_trxd3i0(d3ps, env0)
//
in//let
//
(
if // if
list_singq(i0ps)
then list_head(i0ps)
else
i0pat(loc0, i0t0, I0Ptup0(i0ps)))
//
end(*let*)//end-of-[f0_tup0(d3p0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_argtp
(
d3p0: d3pat,
env0: !envd3i0): i0pat =
(
d3pat_trxd3i0(d3p1, env0)
) where
{
//
val-
D3Pargtp
( d3p1, t2p2) = d3p0.node((*0*))
//
}(*where*)//end-of-[f0_argtp(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_annot
(
d3p0: d3pat,
env0: !envd3i0): i0pat =
(
d3pat_trxd3i0(d3p1, env0)
) where
{
//
val-
D3Pannot
( d3p1
, s1e2, s2e2) = d3p0.node((*0*))
//
}(*where*)//end-of-[f0_annot(d3p0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[d3pat_trxd3i0(d3p0,env0)]
//
(* ****** ****** *)
//
#implfun
l3d3p_trxd3i0
(ld3p, env0) =
let
//
val+
D3LAB
(lab0, d3p1) = ld3p
//
in//let
I0LAB(lab0, d3pat_trxd3i0(d3p1, env0))
end(*let*)//end-of-[l3d3p_trxd3i0(ld3p,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3exp_trxd3i0
(d3e0, env0) =
let
//
val () =
prerrsln("\
d3exp_trxd3i0: d3e0 = ", d3e0)
//
in//let
//
case+
d3e0.node() of
//
(* ****** ****** *)
//
|D3Eint _ =>
(
  f0_int(d3e0, env0))
|D3Ebtf _ =>
(
  f0_btf(d3e0, env0))
|D3Echr _ =>
(
  f0_chr(d3e0, env0))
|D3Eflt _ =>
(
  f0_flt(d3e0, env0))
|D3Estr _ =>
(
  f0_str(d3e0, env0))
//
(* ****** ****** *)
//
|D3Etop _ =>
(
  f0_top(d3e0, env0))
//
(* ****** ****** *)
//
|D3Evar _ =>
(
  f0_var(d3e0, env0))
//
(* ****** ****** *)
//
|D3Econ _ =>
(
  f0_con(d3e0, env0))
|D3Ecst _ =>
(
  f0_cst(d3e0, env0))
(* ****** ****** *)
//
|D3Esapp _ =>
(
  f0_sapp(d3e0, env0))
|D3Esapq _ =>
(
  f0_sapq(d3e0, env0))
//
(* ****** ****** *)
//
|D3Etapp _ =>
(
  f0_tapp(d3e0, env0))
|D3Etapq _ =>
(
  f0_tapq(d3e0, env0))
//
(* ****** ****** *)
//
|D3Edap0 _ =>
(
  f0_dap0(d3e0, env0))
|D3Edapp _ =>
(
  f0_dapp(d3e0, env0))
//
(* ****** ****** *)
//
|D3Epcon _ =>
(
  f0_pcon(d3e0, env0))
|D3Eproj _ =>
(
  f0_proj(d3e0, env0))
//
(* ****** ****** *)
//
|D3Elet0 _ =>
(
  f0_let0(d3e0, env0))
//
(* ****** ****** *)
//
|D3Eift0 _ =>
(
  f0_ift0(d3e0, env0))
//
|D3Ecas0 _ =>
(
  f0_cas0(d3e0, env0))
//
(* ****** ****** *)
//
|D3Eseqn _ =>
(
  f0_seqn(d3e0, env0))
//
(* ****** ****** *)
//
|D3Etup0 _ =>
(
  f0_tup0(d3e0, env0))
|D3Etup1 _ =>
(
  f0_tup1(d3e0, env0))
|D3Ercd2 _ =>
(
  f0_rcd2(d3e0, env0))
//
(* ****** ****** *)
//
|D3Elam0 _ =>
(
  f0_lam0(d3e0, env0))
|D3Efix0 _ =>
(
  f0_fix0(d3e0, env0))
//
(* ****** ****** *)
//
|D3Ewhere _ =>
(
  f0_where(d3e0, env0))
//
(* ****** ****** *)
//
|D3Et2ped _ =>
(
  f0_t2ped(d3e0, env0))
//
(* ****** ****** *)
//
|
_(*others*) =>
(
  i0exp_none1(  d3e0  ))
//
(* ****** ****** *)
//
end where
{
//
(* ****** ****** *)
//
fun
f0_int
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Eint
(   tint   ) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0exp(loc0, i0t0, I0Eint(tint)))
end(*let*)//end-of-[f0_int(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_btf
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Ebtf
(   sym1   ) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0exp(loc0, i0t0, I0Ebtf(sym1)))
end(*let*)//end-of-[f0_btf(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_chr
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Echr
(   tchr   ) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0exp(loc0, i0t0, I0Echr(tchr)))
end(*let*)//end-of-[f0_chr(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_flt
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Eflt
(   tflt   ) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0exp(loc0, i0t0, I0Eflt(tflt)))
end(*let*)//end-of-[f0_flt(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_str
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Estr
(   tstr   ) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0exp(loc0, i0t0, I0Estr(tstr)))
end(*let*)//end-of-[f0_str(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_top
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Etop
(   sym1   ) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0exp(loc0, i0t0, I0Etop(sym1)))
end(*let*)//end-of-[f0_top(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_var
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Evar
(   d2v1   ) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
(*
HX: local or envir?
*)
val i0v1 =
envd3i0_dvar$search(env0, d2v1)
val (  ) =
envd3i0_denv$insert(env0, i0v1)
//
val (  ) =
prerrsln
("f0_var(d3i0): d3e0 = ", d3e0)
val (  ) =
prerrsln
("f0_var(d3i0): i0v1 = ", i0v1)
//
in//let
//
(
i0exp(loc0, i0t0, I0Evar(i0v1)))
//
end(*let*)//end-of-[f0_var(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_con
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Econ
(   d2c1   ) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0exp(loc0, i0t0, I0Econ(d2c1)))
end(*let*)//end-of-[f0_con(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_cst
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Ecst
(   d2c1   ) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
in//let
(
i0exp(loc0, i0t0, I0Ecst(d2c1)))
end(*let*)//end-of-[f0_cst(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_sapp
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Esapp
(d3f0, s2es) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0f0 =
(
  d3exp_trxd3i0(d3f0, env0))
//
in//let
//
i0exp(
loc0, i0t0, I0Esapp(i0f0, s2es))
//
end(*let*)//end-of-[f0_sapp(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_sapq
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Esapq
(d3f0, t2ps) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0f0 =
(
  d3exp_trxd3i0(d3f0, env0))
val i0ts =
(
s2typlst_trxd3i0(t2ps, env0))
//
in//let
//
i0exp(
loc0, i0t0, I0Esapq(i0f0, i0ts))
//
end(*let*)//end-of-[f0_sapq(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_tapp
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Etapp
(d3f0, s2es) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0f0 =
(
  d3exp_trxd3i0(d3f0, env0))
//
in//let
//
i0exp(
loc0, i0t0, I0Etapp(i0f0, s2es))
//
end(*let*)//end-of-[f0_tapp(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_tapq
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Etapq
(d3f0, tjgs) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0f0 =
(
  d3exp_trxd3i0(d3f0, env0))
val ijgs =
(
t2jaglst_trxd3i0(tjgs, env0))
//
in//let
//
i0exp(
loc0, i0t0, I0Etapq(i0f0, ijgs))
//
end(*let*)//end-of-[f0_tapq(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_dap0
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Edap0
(   d3f0   ) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0f0 =
(
  d3exp_trxd3i0(d3f0, env0))
//
in//let
(
i0exp(loc0, i0t0, I0Edap0(i0f0)))
end(*let*)//end-of-[f0_dap1(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_dapp
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Edapp
(d3f0
,npf1, d3es) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0f0 =
(
  d3exp_trxd3i0(d3f0, env0))
val i0es =
(
d3explst_trxd3i0(d3es, env0))
//
in//let
(
i0exp(loc0,
i0t0, I0Edapp(i0f0, npf1, i0es)))
end(*let*)//end-of-[f0_dapp(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_pcon
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Epcon
(tknd
,lab1, dcon) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val icon =
(
  d3exp_trxd3i0(dcon, env0))
//
in//let
(
i0exp(loc0,
i0t0, I0Epcon(tknd, lab1, icon)))
end(*let*)//end-of-[f0_pcon(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_proj
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Eproj
(tknd
,lab1, dtup) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val itup =
(
  d3exp_trxd3i0(dtup, env0))
//
in//let
(
i0exp(loc0,
i0t0, I0Eproj(tknd, lab1, itup)))
end(*let*)//end-of-[f0_proj(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_let0
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Elet0
(dcls, d3e1) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val (  ) = // HX: lvl0+0
(
  envd3i0_pshlet0(  env0  ))
val icls =
(
d3eclist_trxd3i0(dcls, env0))
//
in//let
//
let
val i0e1 =
(
  d3exp_trxd3i0(d3e1, env0))
val i0vs =
(
  envd3i0_letenv$get( env0 ))
val (  ) =
(
  envd3i0_poplet0(   env0   ))
//
val (  ) =
envd3i0_i0vs$insert(env0, i0vs)
//
in//let
(
i0exp(
loc0, i0t0, I0Elet0(icls, i0e1)))
end//let
//
end(*let*)//end-of-[f0_let0(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_ift0
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Eift0
(d3e1
,dthn, dels) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0e1 =
(
  d3exp_trxd3i0(d3e1, env0))
val ithn =
(
  d3expopt_trxd3i0(dthn, env0))
val iels =
(
  d3expopt_trxd3i0(dels, env0))
//
in//let
//
(
i0exp(loc0,
i0t0, I0Eift0(i0e1, ithn, iels)))
//
end(*let*)//end-of-[f0_ift0(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_cas0
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Ecas0
(tknd
,d3e1, d3cs) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0e1 =
(
  d3exp_trxd3i0(d3e1, env0))
//
val i0cs =
(
d3clslst_trxd3i0(d3cs, env0))
//
in//let
//
(
i0exp(loc0,
  i0t0, I0Ecas0(tknd,i0e1,i0cs)))
//
end(*let*)//end-of-[f0_cas0(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_seqn
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Eseqn
(d3es, d3e1) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0es =
(
d3explst_trxd3i0(d3es, env0))
//
in//let
//
let
val
i0e1 = d3exp_trxd3i0(d3e1, env0)
in//let
(
i0exp(
loc0, i0t0, I0Eseqn(i0es, i0e1)))
end//let
//
end(*let*)//end-of-[f0_seqn(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_tup0
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Etup0
(npf1, d3es) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0es =
(
d3explst_trxd3i0(d3es, env0))
//
in//let
//
(
i0exp(
loc0, i0t0, I0Etup0(npf1, i0es)))
//
end(*let*)//end-of-[f0_tup0(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_tup1
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Etup1
(tknd
,npf1, d3es) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0es =
(
d3explst_trxd3i0(d3es, env0))
//
in//let
//
(
i0exp(loc0,
i0t0, I0Etup1(tknd, npf1, i0es)))
//
end(*let*)//end-of-[f0_tup1(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_rcd2
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Ercd2
(tknd
,npf1, ldes) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val lies =
(
l3d3elst_trxd3i0(ldes, env0))
//
in//let
//
(
i0exp(loc0,
i0t0, I0Ercd2(tknd, npf1, lies)))
//
end(*let*)//end-of-[f0_rcd2(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_lam0
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Elam0
(tknd
,f3as, sres
,arrw, d3e1) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val lvl0 =
(
  envd3i0_getlvl0(  env0  ))
val (  ) = // HX: lvl0+1
(
  envd3i0_pshlam0(  env0  ))
//
val fias =
(
f3arglst_trxd3i0(f3as, env0))
val i0e1 =
(
  d3ret_trxd3i0( d3e1, env0 ))
//
val i0vs =
(
  envd3i0_lamenv$get( env0 ))
val (  ) =
(
  envd3i0_poplam0(   env0   ))
//
in//let
//
let
//
val i0vt =
i0varfst_mklst(i0vs)
val i0vs =
list_make_lstrm
(i0varfst_strmize(i0vt))
//
val (  ) =
prerrsln("\
f0_lam0(d3i0): i0vs = ", i0vs)
//
val (  ) =
(
envd3i0_i0vs$insert(env0, i0vs))
//
in//let
(
i0exp
(
loc0,
i0t0,
I0Elam0(
  lvl0, tknd, fias, i0e1, i0vs)))
end//let
//
end(*let*)//end-of-[f0_lam0(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_fix0
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Efix0
(tknd
,dpid
,f3as, sres
,arrw, d3e1) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val lvl0 =
(
  envd3i0_getlvl0(  env0  ))
val (  ) = // HX: lvl0+1
(
  envd3i0_pshlam0(  env0  ))
//
val (  ) =
(
envd3i0_dvar$insert
( env0, dpid, ivar )) where
{
val ivar =
(
  d2fix_trxd3i0(dpid, env0))}
//
val fias =
(
f3arglst_trxd3i0(f3as, env0))
val i0e1 =
(
  d3ret_trxd3i0( d3e1, env0 ))
//
val i0vs =
(
  envd3i0_lamenv$get( env0 ))
val (  ) =
(
  envd3i0_poplam0(   env0   ))
//
in//let
//
let
//
val i0vt =
i0varfst_mklst(i0vs)
val i0vs =
list_make_lstrm
(i0varfst_strmize(i0vt))
//
val (  ) =
prerrsln("\
f0_fix0(d3i0): i0vs = ", i0vs)
//
val (  ) =
(
envd3i0_i0vs$insert(env0, i0vs))
//
in//let
(
i0exp
(
loc0,
i0t0,
I0Efix0(lvl0,
  tknd, dpid, fias, i0e1, i0vs)))
end//let
//
end(*let*)//end-of-[f0_fix0(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_where
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Ewhere
(d3e1, dcls) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val icls =
(
d3eclist_trxd3i0(dcls, env0))
//
in//let
//
let
val
i0e1 = d3exp_trxd3i0(d3e1, env0)
in//let
(
i0exp(
loc0, i0t0, I0Ewhere(i0e1, icls)))
end//let
//
end(*let*)//end-of-[f0_where(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_t2ped
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Et2ped
(d3e1, t2p2) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0e1 =
(
  d3exp_trxd3i0(d3e1, env0))
//
in//let
//
(
i0exp(
loc0, i0t0, I0Et2ped(i0e1, t2p2)))
//
end(*let*)//end-of-[f0_t2ped(d3e0,env0)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[d3exp_trxd3i0(d3e0,env0)]
//
(* ****** ****** *)
//
#implfun
l3d3e_trxd3i0
(ld3e, env0) =
let
//
val+
D3LAB
(lab0, d3e1) = ld3e
//
in//let
I0LAB(lab0, d3exp_trxd3i0(d3e1, env0))
end(*let*)//end-of-[l3d3e_trxd3i0(ld3e,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
f3arg_trxd3i0
(f3a0, env0) =
(
case+
f3a0.node() of
//
|F3ARGsapp
(s2vs, s2ps) =>
let
val loc0 = f3a0.lctn()
in//let
fiarg_make_node
(loc0, FIARGsapp(s2vs, s2ps))
end(*let*)//end-of-[F3ARGsapp( ... )]
|F3ARGmets
(   s2es   ) =>
let
val loc0 = f3a0.lctn()
in//let
(
  fiarg(loc0, FIARGmets(s2es)))
end(*let*)//end-of-[F3ARGmets( ... )]
//
|F3ARGdapp
(npf1, d3ps) =>
(
fiarg_make_node
(loc0, FIARGdapp(npf1, i0ps)))
where
{
val loc0 = f3a0.lctn()
val i0ps = d3patlst_trxd3i0(d3ps, env0)}
)(*case+*)//end-of-[f3arg_trxd3i0(f3a0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3ret_trxd3i0
(d3e0, env0) =
(
case+
d3e0.node() of
(* ****** ****** *)
//
|D3Elet0 _ =>
(
  f0_let0(d3e0, env0))
//
(* ****** ****** *)
//
|D3Eift0 _ =>
(
  f0_ift0(d3e0, env0))
//
|D3Ecas0 _ =>
(
  f0_cas0(d3e0, env0))
//
(* ****** ****** *)
//
|D3Ewhere _ =>
(
  f0_where(d3e0, env0))
//
(* ****** ****** *)
//
|D3Et2ped _ =>
(
  f0_t2ped(d3e0, env0))
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
let
val ical = I0CALlam()
in//let
i0exp_rturn(
  ical, d3exp_trxd3i0(d3e0, env0))
end//let
//
(* ****** ****** *)
//
) where//end-of-(case+(d3e0.node()))
{
//
(* ****** ****** *)
//
//
fun
f0_let0
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Elet0
(dcls, d3e1) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val (  ) = // HX: lvl0+0
(
  envd3i0_pshlet0(  env0  ))
val icls =
(
d3eclist_trxd3i0(dcls, env0))
//
in//let
//
let
val i0e1 =
(
  d3ret_trxd3i0(d3e1, env0))
val i0vs =
(
  envd3i0_letenv$get( env0 ))
val (  ) =
(
  envd3i0_poplet0(   env0   ))
//
val (  ) =
envd3i0_i0vs$insert(env0, i0vs)
//
in//let
(
i0exp(
loc0, i0t0, I0Elet0(icls, i0e1)))
end//let
//
end(*let*)//end-of-[f0_let0(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_ift0
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Eift0
(d3e1
,dthn, dels) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0e1 =
(
  d3exp_trxd3i0(d3e1, env0))
val ithn =
(
  d3retopt_trxd3i0(dthn, env0))
val iels =
(
  d3retopt_trxd3i0(dels, env0))
//
in//let
//
(
i0exp(loc0,
i0t0, I0Eift0(i0e1, ithn, iels)))
//
end(*let*)//end-of-[f0_ift0(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_cas0
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Ecas0
(tknd
,d3e1, d3cs) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0e1 =
(
  d3exp_trxd3i0(d3e1, env0))
//
val i0cs =
(
d3rclist_trxd3i0(d3cs, env0))
//
in//let
//
(
i0exp(loc0,
  i0t0, I0Ecas0(tknd,i0e1,i0cs)))
//
end(*let*)//end-of-[f0_cas0(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_where
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Ewhere
(d3e1, dcls) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val icls =
(
d3eclist_trxd3i0(dcls, env0))
//
in//let
//
let
val
i0e1 = d3exp_trxd3i0(d3e1, env0)
in//let
(
i0exp(
loc0, i0t0, I0Ewhere(i0e1, icls)))
end//let
//
end(*let*)//end-of-[f0_where(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_t2ped
(d3e0: d3exp
,env0: !envd3i0): i0exp =
let
//
val-
D3Et2ped
(d3e1, t2p2) = d3e0.node()
//
val t2p0 = d3e0.styp((*0*))
val loc0 = d3e0.lctn((*0*))
val i0t0 =
(
  s2typ_trxd3i0(t2p0, env0))
//
val i0e1 =
(
  d3ret_trxd3i0(d3e1, env0))
//
in//let
//
(
i0exp(
loc0, i0t0, I0Et2ped(i0e1, t2p2)))
//
end(*let*)//end-of-[f0_t2ped(d3e0,env0)]
//
(* ****** ****** *)
//
val () =
prerrsln("d3ret_trxd3i0: d3e0 = ", d3e0)
//
(* ****** ****** *)
//
}(*where*)//end-of-[d3ret_trxd3i0(d3e0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trxd3i0_dynexp.dats] *)
(***********************************************************************)
