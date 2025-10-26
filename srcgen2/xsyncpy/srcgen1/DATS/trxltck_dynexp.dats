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
Sat Jul  5 02:08:23 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/trxltck.sats"
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
"prelude/SATS/gsyn000.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp2.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
s2typ_linq
(t2p0: s2typ): bool =
(
  sort2_linq(t2p0.sort()))
fun
d2var_linq
(d2v0: d2var): bool =
(
  s2typ_linq(d2v0.styp()))
//
fun
s2typ1_linq
(t2q0: s2typ1): bool =
(
  sort2_linq(t2q0.sort()))
//
#symload linq with sort2_linq
#symload linq with s2typ_linq
#symload linq with d2var_linq
#symload linq with s2typ1_linq
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3es_t3qs$get
(d3es
:d3exp1lst): d3typ1lst =
(
list_map<x0><y0>(d3es)
) where
{
//
#typedef x0 = (d3exp1)
#typedef y0 = (d3typ1)
//
#impltmp
map$fopr
<x0><y0>(x0) = d3exp1_dtyp$get(x0)
}(*where*)//end-of-[d3es_t3qs$get(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3exp1_t2pck
(d3e0: d3exp1
,styp: s2typ1
,env0: !envltck): d3exp1 =
let
//
val t3q0 =
d3e0.dtyp()
val t2q0 =
envltck_dtyp$eval
(  env0 , t3q0  )
val ubtf =
s2typ1_lteq(t2q0, styp)
//
in//let
//
if ubtf
then d3e0 else
let
//
val
loc0 = d3e0.lctn()
val
t3q0 =
d3typ1_styp$make(styp)
//
in//let
d3exp1
( loc0
, t3q0, D3E1t2pck(d3e0, t2q0, styp))
end//let
//
end//let//end-of-[d3exp1_t2pck(d3e0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3pat1_trxltck
(d3p0, env0) =
let
//
val () =
prerrsln("\
d3pat1_trxltck: loc0 = ", loc0)
val () =
prerrsln("\
d3pat1_trxltck: t2q0 = ", t2q0)
val () =
prerrsln("\
d3pat1_trxltck: d3p0 = ", d3p0)
//
in//let
//
case+
d3p0.node() of
//
|D3P1int(tint) =>
d3axp1
(loc0, t2q0, D3A1int(tint))
|D3P1btf(sbtf) =>
d3axp1
(loc0, t2q0, D3A1btf(sbtf))
|D3P1chr(tchr) =>
d3axp1
(loc0, t2q0, D3A1chr(tchr))
|D3P1flt(tflt) =>
d3axp1
(loc0, t2q0, D3A1flt(tflt))
|D3P1str(tstr) =>
d3axp1
(loc0, t2q0, D3A1str(tstr))
//
|D3P1var _ => f0_var(d3p0, env0)
//
|D3P1annot _ => f0_annot(d3p0, env0)
//
end where//end-of(case-of(d3p0.node())
{
//
(* ****** ****** *)
//
val loc0 = d3p0.lctn()
val t2q0 = d3p0.styp()
//
(* ****** ****** *)
//
fun
f0_var
( d3p0: d3pat1
, env0: !envltck): d3axp1 =
let
//
val-
D3P1var
(   d2v1   ) = d3p0.node()
//
val t3q1 =
envltck_dvar$take(env0, d2v1)
val t2q1 =
envltck_dtyp$eval(env0, t3q1)
//
in//let
d3axp1(loc0, t2q1, D3A1var(d2v1))
end//let//end-of-[f0_var(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_annot
( d3p0: d3pat1
, env0: !envltck): d3axp1 =
let
//
val-
D3P1annot
(d3p1
,s1e1, s2e1) = d3p0.node()
//
val d3a1 =
d3pat1_trxltck(d3p1, env0)
val t2q1 = d3a1.styp((*0*))
//
in//let
d3axp1
(loc0
,t2q1, D3A1annot(d3a1,s1e1,s2e1))
end//let//end-of-[f0_annot(d3p0,env0)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[d3pat1_trxltck(d3e0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3exp1_trxltck
(d3e0, env0) =
let
//
val () =
prerrsln("\
d3exp1_trxltck: loc0 = ", loc0)
val () =
prerrsln("\
d3exp1_trxltck: d3e0 = ", d3e0)
//
in//let
//
case+
d3e0.node() of
//
|D3E1int(tint) =>
d3exp1
(loc0, t3q0, D3E1int(tint))
|D3E1btf(sbtf) =>
d3exp1
(loc0, t3q0, D3E1btf(sbtf))
|D3E1chr(tchr) =>
d3exp1
(loc0, t3q0, D3E1chr(tchr))
|D3E1flt(tflt) =>
d3exp1
(loc0, t3q0, D3E1flt(tflt))
|D3E1str(tstr) =>
d3exp1
(loc0, t3q0, D3E1str(tstr))
//
(* ****** ****** *)
//
|D3E1cst _ => f0_cst(d3e0, env0)
|D3E1var _ => f0_var(d3e0, env0)
//
(* ****** ****** *)
//
|D3E1tapp _ => f0_tapp(d3e0, env0)
|D3E1tapq _ => f0_tapq(d3e0, env0)
//
(* ****** ****** *)
//
|D3E1dap0 _ => f0_dap0(d3e0, env0)
|D3E1dapp _ => f0_dapp(d3e0, env0)
//
(* ****** ****** *)
//
|D3E1let0 _ => f0_let0(d3e0, env0)
//
(* ****** ****** *)
//
|D3E1ift0 _ => f0_ift0(d3e0, env0)
//
(* ****** ****** *)
//
|D3E1tup0 _ => f0_tup0(d3e0, env0)
//
(* ****** ****** *)
//
|D3E1flat _ => f0_flat(d3e0, env0)
//
(* ****** ****** *)
//
|D3E1assgn _ => f0_assgn(d3e0, env0)
//
(* ****** ****** *)
//
|D3E1t2ped _ => f0_t2ped(d3e0, env0)
//
(* ****** ****** *)
//
|_(*otherwise*) =>
d3exp1
(loc0,t3q0,D3E1errck(0(*lvl*), d3e0))
//
(* ****** ****** *)
//
end where//end-of(case-of(d3e0.node())
{
//
(* ****** ****** *)
(* ****** ****** *)
//
val loc0 = d3e0.lctn()
//
val t3q0 =
(
d3typ1_styp$make(t2q0)
) where
{
val t2q0 = d3e0.styp() }
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_cst
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1cst
(   d2c1   ) = d3e0.node()
//
in//let
d3exp1(loc0, t3q0, D3E1cst(d2c1))
end//let//end-of-[f0_cst(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_var
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1var
(   d2v1   ) = d3e0.node()
//
in//let
//
(*
if
not(
linq(d2v1))
then
(
d3exp1
(loc0, t3q0, D3E1var(d2v1)))
else
*)
let
val t3q1 =
envltck_dvar$take(env0, d2v1)
in//let
d3exp1(loc0, t3q1, D3E1var(d2v1))
end//let
//
end//let//end-of-[f0_var(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_tapp
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1tapp
(d3f0, s2es) = d3e0.node()
val d3f0 =
(
  d3exp1_trxltck(d3f0, env0))
//
in//let
(
d3exp1
(loc0, t3q0, D3E1tapp(d3f0, s2es)))
end//let//end-of-[f0_tapp(d3e0,env0)]
//
fun
f0_tapq
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1tapq
(d3f0, t2js) = d3e0.node()
val d3f0 =
(
  d3exp1_trxltck(d3f0, env0))
//
in//let
(
d3exp1
(loc0, t3q0, D3E1tapq(d3f0, t2js)))
end//let//end-of-[f0_tapq(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_dap0
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1dap0
(   d3f0   ) = d3e0.node()
//
val d3f0 =
(
d3exp1_trxltck(d3f0, env0))
//
val t3f0 = d3f0.dtyp((*0*))
val t2f0 =
(
envltck_dtyp$eval(env0, t3f0))
//
// (*
val (  ) =
prerrsln
("f0_dap0(ltck): t2f0 = ", t2f0)
// *)
//
in//let
//
case+
t2f0.node() of
|T2P1fun1
(f2cl
,npf1
,t2qs, t2q1) =>
let
//
val
t3q1 =
d3typ1_styp$make(t2q1)
//
in//let
d3exp1(loc0, t3q1, D3E1dap0(d3f0))
end//let
|_(*non-T2P1fun*) =>
(
d3exp1(
loc0,t3q0,D3E1errck(0(*lvl*),d3e0)))
//
end//let//end-of-[f0_dap0(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_dapp
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1dapp
(d3f0
,npf1, d3es) = d3e0.node()
//
val d3f0 =
(
  d3exp1_trxltck(d3f0, env0))
//
val
t3f0 = d3f0.dtyp((*void*))
val
t2f0 =
envltck_dtyp$eval(env0, t3f0)
//
// (*
val (  ) =
prerrsln
("f0_dapp(ltck): t2f0 = ", t2f0)
// *)
//
in//let
//
case+
t2f0.node() of
|T2P1fun1
(f2cl
,npf1
,t2qs, t2q1) =>
let
//
val d3es =
loctn$d3exp1lst_tpcks$trxltck
(loc0, d3es(*args*), t2qs, env0)
//
in//let
//
let
val
t3q1 = d3typ1_styp$make(t2q1)
in//let
d3exp1
(loc0
,t3q1, D3E1dapp(d3f0, npf1, d3es))
end//let
//
end//let
|_(*non-T2P1fun*) =>
(
d3exp1(
loc0,t3q0,D3E1errck(0(*lvl*),d3e0)))
//
end//let//end-of-[f0_dapp(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_let0
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1let0
(dcls, d3e1) = d3e0.node()
//
val (  ) =
envltck_pshlet0(env0)//enter
//
val dcls =
d3ecl1lst_trxltck(dcls, env0)
//
val d3e1 =
(
  d3exp1_trxltck(d3e1, env0))
//
val t3q1 = d3e1.dtyp((*void*))
//
val d2vs = envltck_dvslet0(env0)
val vts0 = envltck_vtslet0(env0)
//
val (  ) = envltck_poplet0(env0)
//
in//
//
let
//
val (  ) =
prerrsln("\
d3exp1_trxltck: \
f0_let0: d2vs = ", d2vs)
val (  ) =
prerrsln("\
d3exp1_trxltck: \
f0_let0: vts0 = ", vts0)
//
val vts1 =
dvdtplst_d2vs$proj(vts0, d2vs)
//
val (  ) =
prerrsln("\
d3exp1_trxltck: \
f0_let0: vts1 = ", vts1)
//
in//let
d3exp1
(loc0, t3q1, D3E1let0(dcls, d3e1))
end//let
//
end//let//end-of-[f0_let0(d3e0, env0)]
//
(* ****** ****** *)
//
fun
f0_ift0
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1ift0
(d3e1
,dthn, dels) = d3e0.node()
//
val d3e1 =
(
  d3exp1_trxltck(d3e1, env0))
//
val dthn =
(
  d31ift_trxltck(dthn, env0))
val dels =
(
  d31ift_trxltck(dels, env0))
//
in//let
//
d3exp1
(loc0
,t3q0, D3E1ift0(d3e1, dthn, dels))
//
end//let//end-of-[f0_ift0(d3e0, env0)]
//
(* ****** ****** *)
//
fun
f0_tup0
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1tup0
(npf1, d3es) = d3e0.node()
//
val d3es =
d3exp1lst_trxltck(d3es, env0)
//
val t3qs =
d3es_t3qs$get(d3es)
val t2qs =
envltck_dtyplst$eval(env0, t3qs)
//
val t2q0 = t3q0.styp()
val t2q1 = s2typ1_tup0(npf1, t2qs)
//
val t3q0 =
d3typ1_make_styp$node(t2q0, T3P1styp(t2q1))
//
in//let
//
(
d3exp1
(loc0, t3q0, D3E1tup0(npf1, d3es)))
//
end//let//end-of-[f0_tup0(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_flat
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1flat
(   d3e1   ) = d3e0.node()
//
val d3e1 =
(
  d3exp1_trxltck(d3e1, env0))
//
in//let
d3exp1(loc0, t3q0, D3E1flat(d3e1))
end//let//end-of-[f0_flat(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_assgn
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1assgn
(d3el, d3er) = d3e0.node()
//
(*
HX-2025-07-13:
[d3er] must be
handled ahead of [d3el]!
*)
val d3er =
(
  d3exp1_trxltck(d3er, env0))
//
val d3el =
(
  d3exp1_trxltck(d3el, env0))
//
in//let
d3exp1
(loc0, t3q0, D3E1assgn(d3el, d3er))
end//let//end-of-[f0_assgn(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_t2ped
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1t2ped
(d3e1
,t2q1, t2q2) = d3e0.node()
//
val d3e1 =
(
  d3exp1_trxltck(d3e1, env0))
//
val d3e1 =
d3exp1_t2pck(d3e1, t2q2, env0)
//
in//let
d3exp1
(loc0
,t3q0, D3E1t2ped(d3e1, t2q1, t2q2))
end//let//end-of-[f0_t2ped(d3e0,env0)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[d3exp1_trxltck(d3e0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d31ift_trxltck
  (dopt, env0) =
(
case+ dopt of
|
optn_nil() => optn_nil()
|
optn_cons(dexp) =>
(
optn_cons(dexp)
) where
{
val dexp =
d3exp1_dvdtp(dexp, vts0)
} where
{
val (  ) =
envltck_pshift0(env0)//enter
//
val dexp =
(
  d3exp1_trxltck(dexp, env0))
//
val vts0 = envltck_vtsift0(env0)
//
val (  ) = envltck_popift0(env0)
//
val (  ) =
prerrsln
("d31ift_trxltck: vts0 = ", vts0)
//
}
) where
{
val () =
prerrsln("d31ift_trxltck: dopt = ", dopt)
}(*where*)//end-of-[d31ift_trxltck(dopt,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
loctn$d3exp1lst_tpcks$trxltck
  (loc0, d3es, t2qs, env0) =
(
f0_d3es$t2qs(d3es, t2qs, env0)
) where
{
//
fun
f0_dexp$t2q0
(d3e0: d3exp1
,t2q0: s2typ1
,env0: !envltck): d3exp1 =
(
d3exp1_t2pck
(d3e0, t2q0, env0)) where
{
//
val
d3e0 = d3exp1_trxltck(d3e0, env0) }
//
fun
f0_d3es$t2qs
(d3es: d3exp1lst
,t2qs: s2typ1lst
,env0: !envltck): d3exp1lst =
(
case+ d3es of
|list_nil() =>
(
case- t2qs of
|list_nil() => list_nil()
)
|list_cons
(d3e1, d3es) =>
(
case- t2qs of
|list_cons(t2q1, t2qs) =>
(list_cons(d3e1, d3es)) where
{
val d3e1 =
  f0_dexp$t2q0(d3e1, t2q1, env0)
val d3es =
  f0_d3es$t2qs(d3es, t2qs, env0) }
)
)(*case+*)//end-of-[f0_d3es$t2qs(d3es,t2qs,env0)]
//
}(*where*)//end-of-[loctn$d3exp1lst_tpcks$trxltck(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
f3arg1_trxltck
(farg, env0) =
(
case+
farg.node() of
//
|F3ARG1sapp
(s2vs, s2ps) =>
f3axp1
(loc0, F3AXP1sapp(s2vs, s2ps))
|F3ARG1mets
(   s2es   ) =>
(
 f3axp1(loc0, F3AXP1mets(s2es)))
//
|F3ARG1dapp
(npf1, d3ps) =>
let
//
val d3as =
d3pat1lst_trxltck(d3ps, env0)
//
in//let
f3axp1(loc0, F3AXP1dapp(npf1, d3as))
end//let
//
) where
{
//
val loc0 = farg.lctn()
//
val (  ) =
prerrsln("f3arg1_trxlctk: loc0 = ", loc0)
val (  ) =
prerrsln("f3arg1_trxlctk: farg = ", farg)
//
}(*where*)//end-of-[f3arg1_trxltck(farg,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trxltck_dynexp.dats] *)
(***********************************************************************)
