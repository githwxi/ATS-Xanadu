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
Sun 11 Sep 2022 02:56:28 PM EDT
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
_(*TRANS12*) = "./trans12.dats"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#staload "./../SATS/trans12.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d1pat_get_lctn
#symload node with d1pat_get_node
(* ****** ****** *)
#symload lctn with f1arg_get_lctn
#symload node with f1arg_get_node
(* ****** ****** *)
#symload lctn with d1exp_get_lctn
#symload node with d1exp_get_node
(* ****** ****** *)
#symload lctn with d2var_get_lctn
#symload name with d2var_get_name
#symload stmp with d2var_get_stmp
(* ****** ****** *)
//
(*
HX-2020-07:
A nullary constructor C can
be written as C (versus C())
*)
//
fun
d2pat_dap0
(d2f0: d2pat): d2pat =
d2pat
(d2f0.lctn(), D2Pdap0(d2f0))
//
fun
d2exp_dap0
(d2f0: d2exp): d2exp =
d2exp
(d2f0.lctn(), D2Edap0(d2f0))
//
(* ****** ****** *)
//
fun
my_d2pat_sapp
( loc0: loc_t
, d2f0: d2pat
, s2vs: s2varlst): d2pat =
(
case-
d2f0.node() of
|
D2Pdap0(d2f0) =>
d2pat_dap0
(
d2pat_sapp(loc0, d2f0, s2vs))
|
_ (* non-D2Pdap0 *) =>
(
d2pat_sapp(loc0, d2f0, s2vs))
) (*case-*) // end of [my_d2pat_sapp]
//
(* ****** ****** *)
//
fun
my_d2exp_sapp
( loc0: loc_t
, d2e1: d2exp
, s2es: s2explst): d2exp =
(
case-
d2e1.node() of
|
D2Edap0(d2e1) =>
d2exp_dap0
(
d2exp_sapp(loc0, d2e1, s2es)
)
|
_(* non-D2Edap0 *) =>
d2exp_sapp(loc0, d2e1, s2es)
) (*case-*) // end-of-[my_d2exp_sapp]
//
(* ****** ****** *)
//
fun
my_d2exp_tapp
( loc0: loc_t
, d2e1: d2exp
, s2es: s2explst): d2exp =
(
case-
d2e1.node() of
|
D2Edap0(d2e1) =>
d2exp_dap0
(
d2exp_tapp(loc0, d2e1, s2es)
)
|
_ (* non-D2Edap0 *) =>
d2exp_tapp(loc0, d2e1, s2es)
) (*case-*) // end-of-[my_d2exp_tapp]
//
(* ****** ****** *)
//
fun
my_d2exp_dapp
( loc0: loc_t
, d2f0: d2exp
, npf1: (sint)
, d2as: d2explst): d2exp =
(
case+
d2f0.node() of
|
D2Edap0(d2f0) =>
d2exp_dapp(loc0, d2f0, npf1, d2as)
|
_ (*non-D2Edap0*) =>
d2exp_dapp(loc0, d2f0, npf1, d2as)
)
//
(* ****** ****** *)
//
#implfun
trans12_d1pid
( env0,dpid ) = let
//
val loc0 = dpid.lctn()
val sym1 = dpatid_sym(dpid)
//
in//let
  d2var_new2_name(loc0, sym1)
end (*let*) // end of [trans12_d1pid(env0,dpid)]
//
(* ****** ****** *)

local
//
(* ****** ****** *)
//
fun
isBTF
( sym
: sym_t): bool =
(
if
(sym=TRUE_symbl)
then true else
(
if
(sym=FALSE_symbl)
then true else false)
) where
{
// HX-2022-11-05: nothing
} (*where*) // end of [isBTF]
//
fun
isANY
( sym
: sym_t): bool =
(
if
(sym=WCARD_symbl)
then true else false
) where
{
// HX-2022-11-05: nothing
} (*where*) // end of [isANY]
//
(* ****** ****** *)
//
fun
isBANG
(d1p: d1pat): bool =
(
case+
d1p.node() of
|
D1Pid0(sym) =>
if
(sym=BANG_symbl)
then true else false
|
_(* non-D1Pid0 *) => false
) (*case+*) // end of [isBANG]
//
fun
isFLAT
(d1p: d1pat): bool =
(
case+
d1p.node() of
|
D1Pid0(sym) =>
if
(sym=PFLAT_symbl)
then true else false
|
_(* non-D1Pid0 *) => false
) (*case+*) // end of [isFLAT]
//
fun
isFREE
(d1p: d1pat): bool =
(
case+
d1p.node() of
|
D1Pid0(sym) =>
if
(sym=PFREE_symbl)
then true else false
|
_(* non-D1Pid0 *) => false
) (*case+*) // end of [isFLAT]
//
(* ****** ****** *)
//
fun
f0_id0
( env0:
! tr12env
, d1p0: d1pat): d2pat =
let
//
val loc0 = d1p0.lctn()
//
val-
D1Pid0(sym1) = d1p0.node()
//
val
dopt =
tr12env_find_d2itm(env0,sym1)
//
in//let
case+ dopt of
| ~
optn_vt_nil() =>
f0_id0_d1sym(env0, d1p0, sym1)
| ~
optn_vt_cons(d2i1) =>
f0_id0_d2itm(env0, d1p0, d2i1)
end (*let*) // end of [f0_id0(env0,d1p0)]
//
and
f0_id0_d1sym
( env0:
! tr12env
, d1p0: d1pat
, sym1: sym_t): d2pat =
let
  val
  loc0 = d1p0.lctn()
in//let
//
if
isBTF(sym1)
then
d2pat_btf(loc0, sym1)
else
(
if
isANY(sym1)
then
d2pat_any(loc0, sym1)
else
(
d2pat_var(loc0, d2v1) where
{
val d2v1 =
d2var_new2_name(loc0, sym1)}))//HX:var!
//
end (*let*) // end of [f0_id0_d1sym(...)]
//
and
f0_id0_d2itm
( env0:
! tr12env
, d1p0: d1pat
, d2i1: d2itm): d2pat =
(
case- d2i1 of
|
D2ITMvar(d2v1) =>
f0_id0_d2var(env0, d1p0, d2v1)
(*
|
D2ITMcon(d2cs) =>
f0_id0_d2con(env0, d1e0, d2cs)
|
D2ITMcst(d2cs) =>
f0_id0_d2cst(env0, d1e0, d2cs)
|
D2ITMsym(_, dpis) =>
f0_id0_d2sym(env0, d1e0, dpis)
*)
) (*case+*) // end of [f0_id0_d2itm(...)]
//
and
f0_id0_d2var
( env0:
! tr12env
, d1p0: d1pat
, d2v1: d2var): d2pat =
(
f0_id0_d1sym(env0, d1p0, d2v1.name()))
//
(* ****** ****** *)
//
fun
f0_main
( env0:
! tr12env
, d1p0: d1pat): d2pat =
let
(*
val
loc0 = d1p0.lctn()
val () =
prerrln
("f0_main: d1p0 = ", d1p0)
*)
//
in//let
//
case+
d1p0.node() of
//
|
D1Pid0 _ => f0_id0(env0, d1p0)
//
|
D1Pint(tok) =>
let
val loc0 = d1p0.lctn()
in//let
d2pat_make_node(loc0, D2Pint(tok))
end (*let*) // end of [D1Pint(tok)]
|
D1Pchr(tok) =>
let
val loc0 = d1p0.lctn()
in//let
d2pat_make_node(loc0, D2Pchr(tok))
end (*let*) // end of [D1Pchr(tok)]
|
D1Pflt(tok) =>
let
val loc0 = d1p0.lctn()
in//let
d2pat_make_node(loc0, D2Pflt(tok))
end (*let*) // end of [D1Pflt(tok)]
|
D1Pstr(tok) =>
let
val loc0 = d1p0.lctn()
in//let
d2pat_make_node(loc0, D2Pstr(tok))
end (*let*) // end of [D1Pstr(tok)]
//
|D1Pb0sh _  => d2pat_none1(d1p0)
|D1Pb1sh _  => f0_b1sh(env0, d1p0)
//
|D1Pl1st _  => f0_l1st(env0, d1p0)
|D1Pl2st _  => f0_l2st(env0, d1p0)
//
|D1Pt1up _  => f0_t1up(env0, d1p0)
|D1Pt2up _  => f0_t2up(env0, d1p0)
//
|D1Pr1cd _  => f0_r1cd(env0, d1p0)
|D1Pr2cd _  => f0_r2cd(env0, d1p0)
//
|D1Panno _  => f0_anno(env0, d1p0)
//
| _(* otherwise *) => d2pat_none1(d1p0)
//
end where
{
//
(* ****** ****** *)
//
fun
f0_b1sh
( env0:
! tr12env
, d1p0: d1pat): d2pat =
(
trans12_d1pat(env0, d1p1)) where
{
  val-D1Pb1sh(d1p1) = d1p0.node()
} (*where*) // end of [f0_b1sh(env0,d1p0)]
//
(* ****** ****** *)
//
fun
f0_a1pp
( env0:
! tr12env
, d1p0: d1pat): d2pat =
let
//
val loc0 = d1p0.lctn()
//
val-
D1Pa1pp
(d1f0,d1p1) = d1p0.node()
//
in//let
if
isBANG(d1f0)
then
let
val
d2p1 =
trans12_d1pat(env0, d1p1)
in
d2pat(loc0, D2Pbang(d2p1))
end // then
else
(
if
isFLAT(d1f0)
then
let
val
d2p1 =
trans12_d1pat(env0, d1p1)
in
d2pat(loc0, D2Pflat(d2p1))
end // then
else
(
if
isFREE(d1f0)
then
let
val
d2p1 =
trans12_d1pat(env0, d1p1)
in
d2pat(loc0, D2Pfree(d2p1))
end // then
else
(
case+
d1p1.node() of
//
|
D1Psarg(s1as) =>
let
//
val d2f0 =
trans12_d1pat(env0, d1f0)
val s2vs =
trans12_s1arglst(env0, s1as)
//
(*
val () =
println("f0_app1: d2f0 = ", d2f0)
val () =
println("f0_app1: s2vs = ", s2vs)
(*
//HX: s2vs needs to be re-sorted!
*)
*)
//
in
  my_d2pat_sapp(loc0, d2f0, s2vs)
end (*let*) // end of [D1Psarg(s1as)]
//
|
_(*d1pat-rest*) => f0_a1pp_rest(env0,d1p0)
)
) (* end-of-[else] *) // end-of-(if)
) (* end-of-[else] *) // end-of-(if)
end (*let*) // end of [f0_a1pp(env0,d1p0)]
//
and
f0_a1pp_rest
( env0:
! tr12env
, d1p0: d1pat): d2pat =
let
//
val-
D1Pa1pp
( d1f0
, d1p1) = d1p0.node()
//
val d2p1 = f0_main(env0, d1f0)
//
in//let
  d2pat_none1(d1p0)
end (*let*) // end of [f0_a1pp_rest(_, _)]
//
(* ****** ****** *)
//
fun
f0_l1st
( env0:
! tr12env
, d1p0: d1pat): d2pat =
let
val-
D1Pl1st(d1ps)=d1p0.node()
in//let
//
if
list_singq(d1ps)
then // if-then
let
val-
list_cons(d1p1, _) = d1ps
in
  trans12_d1pat(env0, d1p1)
end (*let*) // end of [then]
else // if-else
let
//
val d2ps =
  trans12_d1patlst(env0, d1ps)
//
in//let
let
val npf1 = -1
val loc0 = d1p0.lctn()
in//let
  d2pat(loc0, D2Ptup0(npf1, d2ps))
end//let
end (*let*) // end of [else]
//
end (*let*) // end of [f0_l1st(env0,d1p0)]
//
fun
f0_l2st
( env0:
! tr12env
, d1p0: d1pat): d2pat =
let
//
val-
D1Pl2st
(dps1, dps2) = d1p0.node()
//
val loc0 = d1p0.lctn()
val npf1 = list_length(dps1)
val dps1 =
  trans12_d1patlst(env0, dps1)
val dps2 =
  trans12_d1patlst(env0, dps2)
val d2ps = list_append(dps1, dps2)
in//let
  d2pat(loc0, D2Ptup0(npf1, d2ps))
end (*let*) // end of [f0_l2st(env0,d1p0)]
//
(* ****** ****** *)
//
fun
f0_t1up
( env0:
! tr12env
, d1p0: d1pat): d2pat =
let
//
val loc0 = d1p0.lctn()
//
val-
D1Pt1up
(tknd, d1ps) = d1p0.node()
//
val npf1 = -1
val d2ps =
trans12_d1patlst(env0, d1ps)
//
in//let
d2pat(loc0, D2Ptup1(tknd, npf1, d2ps))
end (*let*) // end of [f0_t1up(env0,d1p0)]
//
(* ****** ****** *)
//
fun
f0_t2up
( env0:
! tr12env
, d1p0: d1pat): d2pat =
let
//
val loc0 = d1p0.lctn()
//
val-
D1Pt2up
( tknd
, dps1, dps2) = d1p0.node()
//
val dps1 =
trans12_d1patlst(env0, dps1)
val dps2 =
trans12_d1patlst(env0, dps2)
//
val npf1 = list_length(dps1)
val d2ps = list_append(dps1, dps2)
//
in//let
d2pat(loc0, D2Ptup1(tknd, npf1, d2ps))
end (*let*) // end of [f0_t2up(env0,d1p0)]
//
(* ****** ****** *)
//
fun
f0_r1cd
( env0:
! tr12env
, d1p0: d1pat): d2pat =
let
//
val loc0 = d1p0.lctn()
//
val-
D1Pr1cd
(tknd, ldps) = d1p0.node()
//
val npf1 = -1
val ldps =
trans12_l1d1plst(env0, ldps)
//
in//let
d2pat(loc0, D2Prcd2(tknd, npf1, ldps))
end (*let*) // end of [f0_r1cd(env0,d1p0)]
//
(* ****** ****** *)
//
fun
f0_r2cd
( env0:
! tr12env
, d1p0: d1pat): d2pat =
let
//
val loc0 = d1p0.lctn()
//
val-
D1Pr2cd
( tknd
, lxs1, lxs2) = d1p0.node()
//
val lxs1 =
trans12_l1d1plst(env0, lxs1)
val lxs2 =
trans12_l1d1plst(env0, lxs2)
//
val npf1 = list_length(lxs1)
val ldps = list_append(lxs1, lxs2)
//
in//let
d2pat(loc0, D2Prcd2(tknd, npf1, ldps))
end (*let*) // end of [f0_r2cd(env0,d1p0)]
//
(* ****** ****** *)
//
fun
f0_anno
( env0:
! tr12env
, d1p0: d1pat): d2pat =
let
//
val loc0 = d1p0.lctn()
//
val-
D1Panno
(d1p1, s1e2) = d1p0.node()
//
val d2p1 =
trans12_d1pat(env0, d1p1)
val s2e2 =
trans12_s1exp_impr(env0, s1e2)
//
in//let
  d2pat(loc0, D2Panno(d2p1, s1e2, s2e2))
end (*let*) // end of [f0_anno(env0,d1p0)]
//
(* ****** ****** *)
//
} (*where*) // end of [f0_main(env0,d1p0)]
//
in//local
//
#implfun
trans12_d1pat
( env0,d1p0 ) = let
//
(*
val
loc0 = d1p0.lctn()
val () =
prerrln
("trans12_d1pat: d1p0 = ", d1p0)
*)
//
in//let
//
f1_d2pat
(env0, f0_main(env0, d1p0))
//
end where
{
//
fun
f1_d2pat
( env0:
! tr12env
, d2p0: d2pat): d2pat =
(
case+
d2p0.node() of
|
D2Psym0(d1p0, d2is) =>
let
val-
D1Pid0(sym1) = d1p0.node()
in//let
f0_id0_d1sym(env0, d1p0, sym1)
end
| _(* non-D2Psym0 *) => ( d2p0 )
) (*case+*) // end-of-[f1_d2pat(env0,d2p0)]
//
} (*where*) // end of [trans12_d1pat(env0,d1p0)
//
end (*local*) // end of [ local(trans12_d1pat) ]

(* ****** ****** *)

#implfun
trans12_f1arg
( env0,f1a0 ) =
(
//
case+
f1a0.node() of
|
F1ARGdyn0 _ => f0_dyn0(env0, f1a0)
|
F1ARGsta0 _ => f0_sta0(env0, f1a0)
|
F1ARGmet0 _ => f0_met0(env0, f1a0)
//
) where
{
//
(* ****** ****** *)
//
fun
f0_sta0
( env0:
! tr12env
, f1a0: f1arg): f2arg =
let
//
val-
F1ARGsta0
(  s1qs  ) = f1a0.node()
//
val
(s2vs, s2ps) =
trans12_s1qualst(env0, s1qs)
//
in
//
f2arg(f1a0.lctn(), F2ARGsta0(s2vs, s2ps))
//
end (*let*) // end of [f0_sta0(env0,f1a0)]
//
(* ****** ****** *)
//
fun
f0_dyn0
( env0
: !tr12env
, f1a0: f1arg): f2arg =
let
//
var
npf1: sint = -1
//
val-
F1ARGdyn0
(  d1p0  ) = f1a0.node()
//
val
d2ps =
(
case+
d1p0.node() of
|
D1Pl1st
( d1ps ) =>
trans12_d1patlst(env0, d1ps)
|
D1Pl2st
(dps1, dps2) =>
(
npf1 :=
list_length(dps1);
list_append(dps1, dps2)
) where
{
val
dps1 =
trans12_d1patlst(env0, dps1)
val
dps2 =
trans12_d1patlst(env0, dps2) }
| _(*non-D1Plist*) =>
(
list_sing(trans12_d1pat(env0, d1p0)))
) : d2patlst // end of [val]
//
in//let
//
f2arg(f1a0.lctn(), F2ARGdyn0(npf1, d2ps))
//
end (*let*) // end of [f0_dyn0(env0,f1a0)]
//
(* ****** ****** *)
//
fun
f0_met0
( env0:
! tr12env
, f1a0: f1arg): f2arg =
let
//
val-
F1ARGmet0
(  s1es  ) = f1a0.node()
//
in//let
let
val s2es =
trans12_s1explst(env0, s1es)
in//let
  f2arg(f1a0.lctn(), F2ARGmet0(s2es))
end (*let*)
end (*let*) // end of [f0_met0(env0,f1a0)]
//
(* ****** ****** *)
//
} (*where*) // end of [trans12_f1arg(env0,f1a0)]

(* ****** ****** *)

#implfun
trans12_d1exp
( env0,d1e0 ) = let
//
(*
val
loc0 = d1e0.lctn()
val () =
prerrln
("trans12_d1exp: d1e0 = ", d1e0)
*)
//
in//let
//
case+
d1e0.node() of
//
|
D1Eid0 _ => f0_id0(env0, d1e0)
//
|
D1Eint(tok) =>
let
val loc0 = d1e0.lctn()
in//let
d2exp_make_node(loc0, D2Eint(tok))
end (*let*) // end of [D1Eint(tok)]
|
D1Echr(tok) =>
let
val loc0 = d1e0.lctn()
in//let
d2exp_make_node(loc0, D2Echr(tok))
end (*let*) // end of [D1Echr(tok)]
|
D1Eflt(tok) =>
let
val loc0 = d1e0.lctn()
in//let
d2exp_make_node(loc0, D2Eflt(tok))
end (*let*) // end of [D1Eflt(tok)]
|
D1Estr(tok) =>
let
val loc0 = d1e0.lctn()
in//let
d2exp_make_node(loc0, D2Estr(tok))
end (*let*) // end of [D1Estr(tok)]
//
|
D1Eb0sh _ => d2exp_none1(d1e0)
|
D1Eb1sh _ => f0_b1sh(env0, d1e0)
//
|
D1Ea1pp _ => f0_a1pp(env0, d1e0)
|
D1Ea2pp _ => f0_a2pp(env0, d1e0)
//
|
D1El1st _ => f0_l1st(env0, d1e0)
|
D1El2st _ => f0_l2st(env0, d1e0)
//
|
D1Es1eq _ => f0_s1eq(env0, d1e0)
|
D1Es2eq _ => f0_s2eq(env0, d1e0)
//
| D1Eif0 _ => f0_if0(env0, d1e0)
(*
| D1Eif1 _ => f0_if1(env0, d1e0)
*)
//
|D1Elet0 _ => f0_let0(env0, d1e0)
|
D1Ewhere _ => f0_where(env0, d1e0)
//
|D1Et1up _ => f0_t1up(env0, d1e0)
|D1Et2up _ => f0_t2up(env0, d1e0)
//
|D1Er1cd _ => f0_r1cd(env0, d1e0)
|D1Er2cd _ => f0_r2cd(env0, d1e0)
//
|D1Elam0 _ => f0_lam0(env0, d1e0)
|D1Efix0 _ => f0_fix0(env0, d1e0)
//
|D1Eanno _ => f0_anno(env0, d1e0)
//
| _(* otherwise *) => d2exp_none1(d1e0)
//
end where
{
//
(* ****** ****** *)
//
fun
isBTF
( sym
: sym_t): bool =
(
if
(sym=TRUE_symbl)
then true else
(
if
(sym=FALSE_symbl)
then true else false)
) where
{
// HX-2022-11-05: nothing
} (*where*) // end of [isBTF]
//
fun
isTOP
( sym
: sym_t): bool =
(
if
(sym=WCARD_symbl)
then true else false
) where
{
// HX-2022-11-05: nothing
} (*where*) // end of [isTOP]
//
(* ****** ****** *)
//
fun
f0_id0
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val loc0 = d1e0.lctn()
val-
D1Eid0(sym1) = d1e0.node()
val
dopt =
tr12env_find_d2itm(env0,sym1)
//
in//let
case+ dopt of
| ~
optn_vt_nil() =>
f0_id0_d1sym(env0, d1e0, sym1)
| ~
optn_vt_cons(d2i1) =>
f0_id0_d2itm(env0, d1e0, d2i1)
end (*let*) // end of [f0_id0(env0,d1e0)]
//
and
f0_id0_d1sym
( env0:
! tr12env
, d1e0: d1exp
, sym1: sym_t): d2exp =
let
  val
  loc0 = d1e0.lctn()
in//let
if
isBTF(sym1)
then
d2exp_btf(loc0, sym1)
else
(
if
isTOP(sym1)
then
d2exp_top(loc0, sym1)
else (d2exp_none1(d1e0))) // HX:error
end (*let*) // end of [f0_id0_d1sym(...)]
//
and
f0_id0_d2itm
( env0:
! tr12env
, d1e0: d1exp
, d2i1: d2itm): d2exp =
(
case- d2i1 of
| D2ITMvar(d2v1) =>
  f0_id0_d2var(env0, d1e0, d2v1)
(*
| D2ITMcon(d2cs) =>
  f0_id0_d2con(env0, d1e0, d2cs)
| D2ITMcst(d2cs) =>
  f0_id0_d2cst(env0, d1e0, d2cs)
| D2ITMsym(_, dpis) =>
  f0_id0_d2sym(env0, d1e0, dpis)
*)
) (*case+*) // end of [f0_id0_d2itm(...)]
//
and
f0_id0_d2var
( env0:
! tr12env
, d1e0: d1exp
, d2v1: d2var): d2exp =
(
  d2exp_var(d1e0.lctn(), d2v1)
)
//
(* ****** ****** *)
//
fun
f0_b1sh
( env0:
! tr12env
, d1e0: d1exp): d2exp =
(
trans12_d1exp(env0, d1e1)) where
{
  val-D1Eb1sh(d1e1) = d1e0.node()
} (*where*) // end of [f0_b1sh(env0,d1e0)]
//
(* ****** ****** *)
//
fun
isAMP0
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(sym) =>
if
(sym=AMP_symbl)
then true else false
|
_(* non-D1Eid0 *) => false
) (*case+*) // end of [isAMP0]
fun
isBANG
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(sym) =>
if
(sym=BANG_symbl)
then true else false
|
_(* non-D1Eid0 *) => false
) (*case+*) // end of [isBANG]
fun
isADDR
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(sym) =>
if
(sym=DADDR_symbl)
then true else false
|
_(* non-D1Eid0 *) => false
) (*case+*) // end of [isADDR]
fun
isEVAL
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(sym) =>
if
(sym=DEVAL_symbl)
then true else false
|
_(* non-D1Eid0 *) => false
) (*case+*) // end of [isEVAL]
fun
isFOLD
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(sym) =>
if
(sym=DFOLD_symbl)
then true else false
|
_(* non-D1Eid0 *) => false
) (*case+*) // end of [isFOLD]
fun
isFREE
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(sym) =>
if
(sym=DFREE_symbl)
then true else false
|
_(* non-D1Eid0 *) => false
) (*case+*) // end of [isFREE]
fun
isLAZY
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(sym) =>
if
(sym=DLAZY_symbl)
then true else false
|
_(* non-D1Eid0 *) => false
) (*case+*) // end of [isLAZY]
fun
isLLAZY
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(sym) =>
if
(sym=DLLAZY_symbl)
then true else false
|
_(* non-D1Eid0 *) => false
) (*case+*) // end of [isLLAZY]
//
fun
f0_a1pp
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val loc0 = d1e0.lctn()
//
val-
D1Ea1pp
(d1f0, d1e1) = d1e0.node()
//
in//let
//
if
isAMP0(d1e1)
then
let
val d2e1 =
trans12_d1exp(env0, d1e1)
in//let
d2exp(loc0, D2Eaddr(d2e1))
end (*let*) // end-of-then
else
(
if
isBANG(d1e1)
then
let
val d2e1 =
trans12_d1exp(env0, d1e1)
in//let
d2exp(loc0, D2Eeval(d2e1))
end (*let*) // end-of-then
else
(
if
isADDR(d1e1)
then
let
val d2e1 =
trans12_d1exp(env0, d1e1)
in//let
d2exp(loc0, D2Eaddr(d2e1))
end (*let*) // end-of-then
else
(
if
isEVAL(d1e1)
then
let
val d2e1 =
trans12_d1exp(env0, d1e1)
in//let
d2exp(loc0, D2Eeval(d2e1))
end (*let*) // end-of-then
else
(
case+
d1e1.node() of
//
|
D1Esarg(s1es) =>
let
val d2f0 =
trans12_d1exp(env0, d1f0)
val s2es =
trans12_s1explst(env0, s1es)
in
  my_d2exp_sapp(loc0, d2f0, s2es)
end (*let*) // end of [D1Esarg(s1es)]
|
D1Etarg(s1es) =>
let
val d2f0 =
trans12_d1exp(env0, d1f0)
val s2es =
trans12_s1explst(env0, s1es)
in
  my_d2exp_tapp(loc0, d2f0, s2es)
end (*let*) // end of [D1Etarg(s1es)]
|
_(*d1exp-rest*) => f0_a1pp_rest(env0,d1e0)
) (*else*) // end-of-if(isEVAL)
) (*else*) // end-of-if(isADDR)
) (*else*) // end-of-if(isBANG)
) (*else*) // end-of-if(isAMP0)
//
end (*let*) // end of [f0_a1pp(env0,d1e0)]

and
f0_a1pp_rest
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val loc0 = d1e0.lctn()
//
val
D1Ea1pp
(d1f0,d1e1) = d1e0.node()
//
val d2f0 =
trans12_d1exp(env0, d1f0)
//
val npf1 =
(
case+
d1e1.node() of
|
D1El2st
(des1, des2) =>
list_length<d1exp>(des1)
|
_(* non-D2Elist *) => -1): int
//
val d2es =
(
case+
d1e1.node() of
|
D1El1st(d1es) =>
trans12_d1explst(env0, d1es)
|
D1El2st(des1, des2) =>
(
list_append(des1, des2)) where
{
val
des1 = trans12_d1explst(env0, des1)
val
des2 = trans12_d1explst(env0, des2)
}
|
_(* non-D2Elist *) =>
list_sing(trans12_d1exp(env0, d1e1))
) : d2explst // end of [ val(d2es) ]
//
in
//
my_d2exp_dapp(loc0, d2f0, npf1, d2es)
//
end (*let*) // end of [f0_a1pp_rest(_,_)]

(* ****** ****** *)

fun
f0_a2pp
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val loc0 = d1e0.lctn()
//
val-
D1Ea2pp
( d1f0
, d1e1, d1e2) = d1e0.node()
//
in
//
if
ASSGNq(d1f0)
then
let
//
val
d2e1 = trans12_d1exp(env0, d1e1)
val
d2e2 = trans12_d1exp(env0, d1e2)
//
in//let
//
case+
d2e1.node() of
|
D2Edapp
( d2f1
, npf1, darg) =>
(
case+
d2f1.node() of
|
D2Ebrckt(dpis, d2es) =>
let
//
(*
HX: A[idx] := itm
*)
//
val d2es =
list_extend(d2es, d2e2)
val d2f1 =
d2exp_make_node
( loc0
, D2Ebrckt(dpis, d2es) )
in//let
d2exp_make_node
( loc0
, D2Edapp(d2f1, npf1, darg) )
end // end of [D2Ebrckt]
|
_(*non-D2Ebrckt*) =>
(
d2exp_make_node
(loc0, D2Eassgn(d2e1, d2e2)))
) (*case+*) // end(D2Edapp)
|
_(* non-D2Edapp *) =>
(
d2exp_make_node
(loc0, D2Eassgn(d2e1, d2e2)))
//
end (*let*) // end-of-then(ASSGN)
//
else 
let
val
d2f0 = trans12_d1exp(env0, d1f0)
val
d2e1 = trans12_d1exp(env0, d1e1)
val
d2e2 = trans12_d1exp(env0, d1e2)
in//let
d2exp_a2pp(loc0, d2f0, d2e1, d2e2)
end (*let*) // end-of-else(~ASSGN)
//
end where
{
//
fun
ASSGNq
(d1e: d1exp): bool =
(
case+
d1e.node() of
|
D1Eid0(sym) =>
( sym = ASSGN_symbl )
|
_ (* non-D1Eid0 *) => false)
//
} (*where*) // end of [f0_a2pp(env0,d1e0)]

(* ****** ****** *)
//
fun
f0_l1st
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
val-
D1El1st
( d1es ) = d1e0.node()
in//let
//
if
list_singq(d1es)
then // if-then
let
val-
list_cons(d1e1, _) = d1es
in
  trans12_d1exp(env0, d1e1)
end (*let*) // end of [then]
else // if-else
let
//
val d2es =
  trans12_d1explst(env0, d1es)
//
in//let
let
val npf1 = -1
val loc0 = d1e0.lctn()
in//let
  d2exp(loc0, D2Etup0(npf1, d2es))
end//let
end (*let*) // end of [else]
//
end (*let*) // end of [f0_l1st(env0,d1e0)]
//
fun
f0_l2st
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val-
D1El2st
(des1, des2) = d1e0.node()
//
val loc0 = d1e0.lctn()
val npf1 = list_length(des1)
val des1 =
  trans12_d1explst(env0, des1)
val des2 =
  trans12_d1explst(env0, des2)
val d2es = list_append(des1, des2)
in//let
  d2exp(loc0, D2Etup0(npf1, d2es))
end (*let*) // end of [f0_l2st(env0,d1e0)]
//
(* ****** ****** *)
//
fun
f0_if0//inv-less
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val loc0 = d1e0.lctn()
//
val-
D1Eif0
(d1e1
,opt2,opt3) = d1e0.node()
//
val
d2e1 = trans12_d1exp(env0, d1e1)
val
opt2 = trans12_d1expopt(env0, opt2)
val
opt3 = trans12_d1expopt(env0, opt3)
//
in//let
  d2exp(loc0, D2Eif0(d2e1, opt2, opt3))
end (*let*) // end of [f0_let0(env0,d1e0)]
//
(* ****** ****** *)
//
fun
f0_let0
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val-
D1Elet0
(d1cs, d1e1) = d1e0.node()
//
val
d2cs =
trans12_d1eclist(env0, d1cs)
//
val
d2e1 = trans12_d1exp(env0, d1e1)
//
in//let
let
val npf1 = -1
val loc0 = d1e0.lctn()
in//let
  d2exp(loc0, D2Elet0(d2cs, d2e1))
end//let
end (*let*) // end of [f0_let0(env0,d1e0)]
//
fun
f0_where
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val-
D1Ewhere
(d1e1, d1cs) = d1e0.node()
//
val
d2cs =
trans12_d1eclist(env0, d1cs)
//
val
d2e1 = trans12_d1exp(env0, d1e1)
//
in//let
let
val npf1 = -1
val loc0 = d1e0.lctn()
in//let
  d2exp(loc0, D2Ewhere(d2e1, d2cs))
end//let
end (*let*) // end of [f0_where(env0,d1e0)]
//
(* ****** ****** *)
//
fun
f0_s1eq
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val loc0 = d1e0.lctn()
//
val-
D1Es1eq
( d1es ) = d1e0.node()
//
in
  trans12_d1expseq(env0, loc0, d1es)
end (*let*) // end of [f0_s1eq(env0,d1e0)]
//
fun
f0_s2eq
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val loc0 = d1e0.lctn()
//
val-
D1Es2eq
(des1, des2) = d1e0.node()
//
val d1es = list_append(des1, des2)
//
in
  trans12_d1expseq(env0, loc0, d1es)
end (*let*) // end of [f0_s2eq(env0,d1e0)]
//
(* ****** ****** *)
//
fun
f0_t1up
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val-
D1Et1up
(tknd, d1es) = d1e0.node()
//
val d2es =
  trans12_d1explst(env0, d1es)
//
in//let
let
val npf1 = -1
val loc0 = d1e0.lctn()
in//let
d2exp(loc0, D2Etup1(tknd, npf1, d2es))
end//let
end (*let*) // end of [f0_t1up(env0,d1e0)]
//
fun
f0_t2up
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val-
D1Et2up
( tknd
, des1, des2) = d1e0.node()
//
val loc0 = d1e0.lctn()
val npf1 = list_length(des1)
val des1 =
  trans12_d1explst(env0, des1)
val des2 =
  trans12_d1explst(env0, des2)
//
val d2es = list_append(des1, des2)
//
in//let
d2exp(loc0, D2Etup1(tknd, npf1, d2es))
end (*let*) // end of [f0_t2up(env0,d1e0)]
//
(* ****** ****** *)
//
fun
f0_r1cd
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val-
D1Er1cd
(tknd, ldes) = d1e0.node()
//
val ldes =
  trans12_l1d1elst(env0, ldes)
in//let
let
val npf1 = -1
val loc0 = d1e0.lctn()
in//let
d2exp(loc0, D2Ercd2(tknd, npf1, ldes))
end//let
end (*let*) // end of [f0_r1cd(env0,d1e0)]
//
fun
f0_r2cd
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val-
D1Er2cd
( tknd
, lds1, lds2) = d1e0.node()
//
val loc0 = d1e0.lctn()
val npf1 = list_length(lds1)
val lds1 =
  trans12_l1d1elst(env0, lds1)
val lds2 =
  trans12_l1d1elst(env0, lds2)
//
val ldes = list_append(lds1, lds2)
//
in//let
d2exp(loc0, D2Ercd2(tknd, npf1, ldes))
end (*let*) // end of [f0_r2cd(env0,d1e0)]
//
(* ****** ****** *)

fun
f0_lam0
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val loc0 = d1e0.lctn()
//
val-
D1Elam0
(tknd
,f1as,sres
,arrw,body) = d1e0.node()
//
val () =
tr12env_pshlam0(env0)//enter
//
val
f2as =
trans12_f1arglst(env0, f1as)
val () =
tr12env_add0_f2arglst(env0,f2as)
(*
val
arrw =
trans12_f1unarrw(env0, arrw)
*)
val
sres = trans12_s1res(env0, sres)
val
body = trans12_d1exp(env0, body)
//
val//exit
((*void*)) = tr12env_poplam0(env0)
//
in//let
d2exp_make_node
( loc0
, D2Elam0(tknd,f2as,sres,arrw,body))
end (*let*) // end of [f0_lam0(env0,d1e0)]

(* ****** ****** *)

fun
f0_fix0
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val loc0 = d1e0.lctn()
//
val-
D1Efix0
(tknd
,tok1
,f1as,sres
,arrw,body) = d1e0.node()
//
//
val () =
tr12env_pshlam0(env0)//enter
//
val
d2v1 =
trans12_d1pid(env0, tok1)
val () =
tr12env_add0_d2var(env0,d2v1)
//
val
f2as =
trans12_f1arglst(env0, f1as)
val () =
tr12env_add0_f2arglst(env0,f2as)
(*
val
arrw =
trans12_f1unarrw(env0, arrw)
*)
val
sres = trans12_s1res(env0, sres)
val
body = trans12_d1exp(env0, body)
//
val//exit
((*void*)) = tr12env_poplam0(env0)
//
in//let
d2exp_make_node
(
loc0,
D2Efix0
(tknd, d2v1, f2as, sres, arrw, body))
end (*let*) // end of [f0_fix0(env0,d1e0)]

(* ****** ****** *)

fun
f0_anno
( env0:
! tr12env
, d1e0: d1exp): d2exp =
let
//
val loc0 = d1e0.lctn()
//
val-
D1Eanno
(d1e1, s1e2) = d1e0.node()
//
val d2e1 =
trans12_d1exp(env0, d1e1)
val s2e2 =
trans12_s1exp_impr(env0, s1e2)
//
in//let
  d2exp(loc0, D2Eanno(d2e1, s1e2, s2e2))
end (*let*) // end of [f0_anno(env0,d1e0)]

(* ****** ****** *)
//
} (*where*) // end of [trans12_d1exp(env0,d1e0)]

(* ****** ****** *)
//
#implfun
trans12_s1eff
( env0,seff ) =
(
case+ seff of
|
S1EFFnone
((*void*)) => S2EFFnone()
|
S1EFFsome(s1es) =>
S2EFFsome(s2es) where
{
val s2es = trans12_s1explst(env0, s1es)
}
) (*case+*) // end of [trans12_s1eff(...)]
//
(* ****** ****** *)
//
#implfun
trans12_s1res
( env0,sres ) =
(
case+ sres of
|
S1RESnone() => S2RESnone()
|
S1RESsome(seff,s1e1) =>
S2RESsome(seff,s2e1) where
{
val seff = trans12_s1eff(env0, seff)
val s2e1 = trans12_s1exp(env0, s1e1)
}
) (*case+*) // end of [trans12_s1res(...)]
//
(* ****** ****** *)
//
#implfun
trans12_teqd1exp
  (env0, tdxp) =
(
case+ tdxp of
|
TEQD1EXPnone() =>
TEQD2EXPnone((*void*))
|
TEQD1EXPsome(teq1, d1e2) =>
TEQD2EXPsome(teq1, d2e2) where
{ val
  d2e2 = trans12_d1exp(env0, d1e2) }
) (*case+*)//end-of(trans12_teqd0exp(...))
//
(* ****** ****** *)
//
#implfun
trans12_wths1exp
  (env0, tdxp) =
(
case+ tdxp of
|
WTHS1EXPnone() =>
WTHS2EXPnone((*void*))
|
WTHS1EXPsome(twth, s1e2) =>
WTHS2EXPsome(twth, s2e2) where
{ val
  s2e2 = trans12_s1exp(env0, s1e2) }
) (*case+*)//end-of(trans12_wths1exp(...))
//
(* ****** ****** *)
//
#implfun
trans12_d1patlst
( env0, d1ps ) =
list_trans12_fnp(env0, d1ps, trans12_d1pat)
//
(* ****** ****** *)
//
#implfun
trans12_d1pidopt
( env0, dopt ) =
optn_trans12_fnp(env0, dopt, trans12_d1pid)
//
#implfun
trans12_d1patopt
( env0, dopt ) =
optn_trans12_fnp(env0, dopt, trans12_d1pat)
//
(* ****** ****** *)
//
#implfun
trans12_f1arglst
( env0, f1as ) =
list_trans12_fnp(env0, f1as, trans12_f1arg)
//
(* ****** ****** *)
//
#implfun
trans12_d1explst
( env0, d1es ) =
list_trans12_fnp(env0, d1es, trans12_d1exp)
//
#implfun
trans12_d1expopt
( env0, dopt ) =
optn_trans12_fnp(env0, dopt, trans12_d1exp)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans12_dynexp.dats] *)
