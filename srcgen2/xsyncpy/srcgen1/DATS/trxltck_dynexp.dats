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
#symload <
with sint_lt$sint of 1099
#symload >
with sint_gt$sint of 1099
#symload =
with sint_eq$sint of 1099
#symload <=
with sint_lte$sint of 1099
#symload >=
with sint_gte$sint of 1099
#symload !=
with sint_neq$sint of 1099
//
#symload +
with sint_add$sint of 1099
#symload -
with sint_sub$sint of 1099
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
( d3es
: d3exp1lst): d3typ1lst =
(
list_map<x0><y0>(d3es))
where{
//
#typedef x0 = ( d3exp1 )
#typedef y0 = ( d3typ1 )
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
d3exp1_delinize
(d3e0: d3exp1
,env0: !envltck): d3exp1 =
let
//
val t2q0 =
envltck_dtyp$eval
(  env0 , t3q0  )
where{
val
t3q0 = d3e0.dtyp((*0*))}
//
val linq =
(
  s2typ1_linq(t2q0))
//
in//let
//
if // if
not(linq)
then d3e0 else
let
//
val loc0 =
d3e0.lctn((*0*))
val t2q1 =
s2typ1_t1pize(t2q0)
val t3q1 =
d3typ1_styp$make(t2q1)
//
in//let
d3exp1(
loc0, t3q1, D3E1delin(d3e0, t2q0))
end//let//end(else)//endof(if(...))
//
end//let//end-of-[d3exp1_delinize(...)]
//
(* ****** ****** *)
//
fun
d3exp1_exlinize
(d3e0: d3exp1
,trst: d3typ1
,env0: !envltck): d3exp1 =
let
//
val linq =
(
  d3typ1_linq(trst))
//
val (  ) =
prerrsln("\
d3exp1_exlinize: d3e0 = ", d3e0)
val (  ) =
prerrsln("\
d3exp1_exlinize: trst = ", trst)
val (  ) =
prerrsln("\
d3exp1_exlinize: linq = ", linq)
//
in//let
//
if // if
not(linq)
then d3e0 else
let
//
val loc0 = d3e0.lctn((*0*))
val t3q0 = d3e0.dtyp((*0*))
val trst =
(
  envltck_dtyp$eval(env0, trst))
//
in//let
d3exp1(
loc0, t3q0, D3E1exlin(d3e0, trst))
end//let//end(else)//endof(if(...))
//
end//let//end-of-[d3exp1_exlinize(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3axp1_t2pck
(d3a0: d3axp1
,styp: s2typ1
,env0: !envltck): d3axp1 =
let
//
val t2q0 =
d3axp1_styp$get(d3a0)
val ubtf =
s2typ1_lteq(t2q0, styp)
//
in//let
//
if ubtf
then d3a0 else
let
//
val
loc0 = d3a0.lctn()
in//let
//
d3axp1
( loc0
, styp, D3A1t2pck(d3a0, styp))
//
end//let
//
end where
{
//
(*
val loc0 = d3a0.lctn()
val (  ) =
prerrsln("d3axp1_t2pck: loc0 = ", loc0)
val (  ) =
prerrsln("d3axp1_t2pck: d3a0 = ", d3a0)
val (  ) =
prerrsln("d3axp1_t2pck: styp = ", styp)
*)
//
}(*where*)//end-of-[d3axp1_t2pck(d3a0,...)]
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
val t2q0 =
envltck_dtyp$eval
(  env0 , t3q0  )
where//end(val(t2q0))
{
val t3q0 = d3e0.dtyp()}
//
val ubtf =
(
s2typ1_lteq(t2q0, styp))
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
t3q0 = d3typ1_styp$make(styp)
//
in//let
(
d3exp1
( loc0
, t3q0
, D3E1t2pck(d3e0, t2q0, styp)))
end//let
//
end where
{
//
(*
val () =
prerrsln("d3exp1_t2pck: d3e0 = ", d3e0)
val () =
prerrsln("d3exp1_t2pck: styp = ", styp)
*)
//
}(*where*)//end-of-[d3exp1_t2pck(d3e0,...)]
//
(* ****** ****** *)
//
fun
d3fag1_aftck
(d3e0: d3exp1
,styp: s2typ1
,env0: !envltck): d3exp1 =
(
if
(
saftck
(d3e0
,styp
,env0) = 0)
then d3e0 else
let
//
val loc0 = d3e0.lctn((*0*))
val t3q0 = d3e0.dtyp((*0*))
//
in//let
d3exp1
( loc0
, t3q0, D3E1daft(d3e0, styp)) end
//
) where
{
//
fun
saftck
(d3e0: d3exp1
,styp: s2typ1
,env0: !envltck): sint =
(
case+
d3e0.node() of
//
|D3E1var _ =>
fs_var(d3e0, styp, env0)
|D3E1flat _ =>
fs_flat(d3e0, styp, env0)
|D3E1proj _ =>
fs_proj(d3e0, styp, env0)
//
|_(* otherwise *) => ( 1 )
)
//
and
fs_var
(d3e0: d3exp1
,styp: s2typ1
,env0: !envltck): sint =
let
val-
D3E1var
(   d2v1   ) = d3e0.node()
in//let
//
let
val taft =
d3typ1_styp$make
(     styp     )
val (  ) =
(
envltck_dvar$updt
(env0, d2v1, taft)) in (0) end
//
end//let//end-of-[fs_var(d3e0,...)]
//
(* ****** ****** *)
//
and
fs_flat
(d3e0: d3exp1
,styp: s2typ1
,env0: !envltck): sint =
let
//
val-
D3E1flat
(   dlft   ) = d3e0.node()
//
in//let
//
let
val styp =
s2typ1_lft(styp) in//let
(
  saftck(dlft, styp, env0)) end
//
end//let//end-of-[fs_flat(d3e0,...)]
//
(* ****** ****** *)
//
and
fs_proj
(d3e0: d3exp1
,styp: s2typ1
,env0: !envltck): sint =
let
//
val-
D3E1proj
(tknd
,lab1, d3e1) = d3e0.node()
//
in//let
//
let
val t3q1 =
d3e1.dtyp((*0*))
in//let
//
case+
t3q1.node() of
//
|
T3P1styp(t2q1) =>
let
val styp =
s2typ1_lab$fset
(t2q1, lab1, styp) in//let
(
  saftck(d3e1, styp, env0))
end//let//endof(T3P1styp(...))
//
|
_(*otherwise*) =>
let
val dtyp =
d3typ1_styp$make
(     styp     )
val dtyp =
d3typ1_lab$fset
(t3q1, lab1, dtyp) in//let
(
  daftck(d3e1, dtyp, env0)) end
//
end//let
//
end where
{
//
(*
val () =
prerrsln("fs_proj: d3e0 = ", d3e0)
*)
//
}(*where*)//end-of-[fs_proj(d3e0,...)]
//
(* ****** ****** *)
//
and 
daftck
(d3e0: d3exp1
,dtyp: d3typ1
,env0: !envltck): sint =
(
case+
d3e0.node() of
//
|D3E1var _ =>
fd_var(d3e0, dtyp, env0)
|D3E1flat _ =>
fd_flat(d3e0, dtyp, env0)
(*
|D3E1proj _ =>
fd_proj(d3e0, dtyp, env0)
*)
//
|_(* otherwise *) => ( 1 )
)(*case+*)//end-of-[daftck(d3e0,...)]
//
and
fd_var
(d3e0: d3exp1
,dtyp: d3typ1
,env0: !envltck): sint =
let
val-
D3E1var
(   d2v1   ) = d3e0.node()
in//let
//
let
val (  ) =
(
envltck_dvar$updt
(env0, d2v1, dtyp)) in (0) end
//
end//let//end-of-[fd_var(d3e0,...)]
//
and
fd_flat
(d3e0: d3exp1
,dtyp: d3typ1
,env0: !envltck): sint =
let
//
val-
D3E1flat
(   dlft   ) = d3e0.node()
//
in//let
//
let
val dtyp =
d3typ1_dlft$make(dtyp) in
(
  daftck(dlft, dtyp, env0)) end
//
end//let//end-of-[fd_flat(d3e0,...)]
//
(* ****** ****** *)
//
// (*
val loc0 = d3e0.lctn()
val (  ) =
prerrsln("d3fag1_aftck: loc0 = ", loc0)
val (  ) =
prerrsln("d3fag1_aftck: d3e0 = ", d3e0)
val (  ) =
prerrsln("d3fag1_aftck: styp = ", styp)
// *)
//
(* ****** ****** *)
//
}(*where*)//end-of-[d3fag1_aftck(d3e0,...)]
//
(* ****** ****** *)
//
fun
d3fag1_befck
(d3e0: d3exp1
,styp: s2typ1
,env0: !envltck): d3exp1 =
(
case+
styp.node() of
//
|T2P1arg1
(knd0, styp) =>
(
(*
HX-2025-11-07:
(knd0 = 0) means '~';
and no aftck is needed
*)
if
(knd0 = 0)
then d3e0 else
d3fag1_aftck
(d3e0, styp, env0)) where
{
val d3e0 =
d3exp1_t2pck(d3e0, styp, env0)
}
//
| _(*rest-of-s2typ1*) =>
(
d3exp1_t2pck(d3e0, styp, env0))
) where
{
//
(*
val () =
prerrsln("d3fag1_befck: d3e0 = ", d3e0)
val () =
prerrsln("d3fag1_befck: styp = ", styp)
*)
//
}(*where*)//end-of-[d3fag1_befck(d3e0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3pat1_trxltck
(d3p0, env0) =
let
//
(*
val () =
prerrsln("\
d3pat1_trxltck: loc0 = ", loc0)
val () =
prerrsln("\
d3pat1_trxltck: t2q0 = ", t2q0)
val () =
prerrsln("\
d3pat1_trxltck: d3p0 = ", d3p0)
*)
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
|D3P1argtp _ => f0_argtp(d3p0, env0)
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
//
(
case+
t2q1.node() of
//
|T2P1lft(t2q1) =>
d3axp1(loc0, t2q1, D3A1lft(d2v1))
//
|_(*non-T2P1lft*) =>
d3axp1(loc0, t2q1, D3A1var(d2v1)))
//
end//let//end-of-[f0_var(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_argtp
( d3p0: d3pat1
, env0: !envltck): d3axp1 =
let
//
val-
D3P1argtp
(d3p1, t2q2) = d3p0.node()
//
val d3a1 =
d3pat1_trxltck(d3p1, env0)
val t2q1 = d3a1.styp((*0*))
//
in//let
d3axp1
(loc0, t2q1, D3A1argtp(d3a1, t2q2))
end//let//end-of-[f0_argtp(d3p0,env0)]
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
,s1e2
,s2e2, t2q2) = d3p0.node()
//
val d3a1 =
d3pat1_trxltck(d3p1, env0)
val t2q1 = d3a1.styp((*0*))
//
in//let
d3axp1
(loc0, t2q1
,D3A1annot(d3a1, s1e2, s2e2, t2q2))
end//let//end-of-[f0_annot(d3p0,env0)]
//
(* ****** ****** *)
//
}(*where*)//end-of-[d3pat1_trxltck(d3e0,env0)]
//
(* ****** ****** *)
//
(*
HX-2025-11-17:
d3apt1: d3pat1 as arg!
*)
#implfun
d3apt1_trxltck
(d3p0, env0) =
(
case+
d3p0.node() of
//
|D3P1argtp _ =>
(
  f0_argtp(d3p0, env0))
|D3P1annot _ =>
(
  f0_annot(d3p0, env0))
//
|_(*non-annot*) =>
(
  f0_other(d3p0, env0))
//
) where
{
//
(* ****** ****** *)
//
fun
f0_other
( d3p0: d3pat1
, env0: envltck): d3axp1 =
(
d3axp1
( loc0
, t2q0, D3A1none(d3p0)))
where
{
//
val loc0 = d3p0.lctn((*void*))
val t2q0 = d3p0.styp((*void*))
//
(*
val (  ) =
prerrsln("f0_other: loc0 = ", loc0)
val (  ) =
prerrsln("f0_other: d3p0 = ", d3p0)
val (  ) =
prerrsln("f0_other: t2q0 = ", t2q0)
*)
//
}(*where*)//end-of-[f0_other(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_argtp
( d3p0: d3pat1
, env0: envltck): d3axp1 =
let
//
val-
D3P1argtp
(d3p1, t2q2) = d3p0.node()
//
(*
val (  ) =
(
prerrsln("\
d3apt1_trxltck:\
f0_argtp: t2q2 = ", t2q2))
*)
//
in//let
case+
t2q2.node() of
//
|T2P1arg1
(knd0, taft) =>
(
d3axp1_t2pck(d3a1, taft, env0))
where
{
val
d3a1 = d3pat1_trxltck(d3p1, env0)
}(*where*)//end-of-[T2P1arg1(...)]
//
|T2P1atx2
(tbef, taft) =>
(
d3axp1_t2pck(d3a1, taft, env0))
where
{
val
d3a1 = d3pat1_trxltck(d3p1, env0)
}(*where*)//end-of-[T2P1atx2(...)]
//
|
_(*otherwise*) => f0_other(d3p0, env0)
//
end(*let*)//end-of-[f0_argtp(d3p0,env0)]
//
(* ****** ****** *)
//
fun
f0_annot
( d3p0: d3pat1
, env0: envltck): d3axp1 =
let
//
val-
D3P1annot
(d3p1
,s1e2
,s2e2, t2q2) = d3p0.node()
//
(*
val (  ) =
(
prerrsln("\
d3apt1_trxltck:\
f0_annot: t2q2 = ", t2q2))
*)
//
in//let
//
case+
t2q2.node() of
//
|T2P1arg1
(knd0, taft) =>
(
d3axp1_t2pck(d3a1, taft, env0))
where
{
val
d3a1 = d3pat1_trxltck(d3p1, env0)
}(*where*)//end-of-[T2P1arg1(...)]
//
|T2P1atx2
(tbef, taft) =>
(
d3axp1_t2pck(d3a1, taft, env0))
where
{
val
d3a1 = d3pat1_trxltck(d3p1, env0)
}(*where*)//end-of-[T2P1atx2(...)]
//
|
_(*otherwise*) => f0_other(d3p0, env0)
//
end(*let*)//end-of-[f0_annot(d3p0,env0)]
//
(* ****** ****** *)
//
(*
val loc0 = d3p0.lctn()
val (  ) =
(
prerrsln("d3apt1_trxltck: loc0 = ", loc0))
val (  ) =
(
prerrsln("d3apt1_trxltck: d3p0 = ", d3p0))
*)
//
}(*where*)//end-of-[d3apt1_trxltck(d3p0,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3exp1_trxltck
(d3e0, env0) =
let
//
// (*
val () =
prerrsln("\
d3exp1_trxltck: loc0 = ", loc0)
val () =
prerrsln("\
d3exp1_trxltck: d3e0 = ", d3e0)
// *)
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
|D3E1proj _ => f0_proj(d3e0, env0)
//
(* ****** ****** *)
//
|D3E1let0 _ => f0_let0(d3e0, env0)
(*
|D3E1let1 _ => f0_let1(d3e0, env0)
*)
//
(* ****** ****** *)
//
|D3E1ift0 _ => f0_ift0(d3e0, env0)
//
(* ****** ****** *)
//
|D3E1seqn _ => f0_seqn(d3e0, env0)
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
(
d3exp1
(loc0,t3q0,D3E1errck(0(*lvl*),d3e0)))
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
val t3q1 =
envltck_dvar$take(env0, d2v1)
//
in//let
//
d3exp1(loc0, t3q1, D3E1var(d2v1))
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
(*
val (  ) =
prerrsln
("f0_dap0(ltck): t2f0 = ", t2f0)
*)
//
in//let
//
case+
t2f0.node() of
|T2P1fun1
(f2cl, npf1
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
//
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
val t3f0 = d3f0.dtyp((*0*))
val t2f0 =
(
envltck_dtyp$eval(env0, t3f0))
//
(*
val (  ) =
prerrsln
("f0_dapp(ltck): t3f0 = ", t3f0)
val (  ) =
prerrsln
("f0_dapp(ltck): t2f0 = ", t2f0)
*)
//
in//let
//
case+
t2f0.node() of
|
T2P1fun1
(f2cl
,npf1
,t2qs, t2q1) =>
let
//
val d3es =
loctn$d3fag1lst_tpcks$trxltck
(loc0, d3es(*fags*), t2qs, env0)
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
//
|
_(*non-T2P1fun*) =>
(
d3exp1(
loc0,t3q0,D3E1errck(0(*lvl*),d3e0)))
//
end//let//end-of-[f0_dapp(d3e0,env0)]
//
(* ****** ****** *)
//
fun
f0_proj
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1proj
(tknd
,lab1, d3e1) = d3e0.node()
//
val d3e1 =
(
  d3exp1_trxltck(d3e1, env0))
//
val t3q1 = d3e1.dtyp((*void*))
//
val t3q2 =
(
  d3typ1_lab$proj(t3q1, lab1))
//
// (*
val (  ) =
prerrsln
("f0_proj(ltck): d3e1 = ", d3e1)
val (  ) =
prerrsln
("f0_proj(ltck): t3q1 = ", t3q1)
val (  ) =
prerrsln
("f0_proj(ltck): t3q2 = ", t3q2)
// *)
//
in//let
//
let//2
//
val linq =
(
  d3typ1_linq(t3q2))
//
val trst =
(
if
not(linq)
then (t3q1) else
let
val t3q2 =
d3typ1_t1pize(t3q2)
in//let
d3typ1_lab$fset
(t3q1, lab1, t3q2) end)
//
in//let2
//
(
if ( // if
0 =
f1_dtyp$updt
( d3e1
, trst, env0)
) then dprj else
(
d3exp1_exlinize
(dprj, trst, env0))
) where // end-of-(if)
{
val
dprj =
d3exp1(loc0, t3q2,
D3E1proj(tknd, lab1, d3e1))}
//let2
end//let//end-of-(T3P1trcd(...)
//
end where
{
//
fun
f1_dtyp$updt
( d3e1: d3exp1
, trst: d3typ1
, env0: !envltck): (sint) =
(
case+
d3e1.node() of
//
|D3E1var
(   d2v1   ) =>
let
val (  ) =
envltck_dvar$updt
(env0, d2v1, trst) in 0 end
//
|D3E1flat
(   dlft   ) =>
let
val trst =
d3typ1_dlft$make(trst)
in//let
f1_dtyp$updt(dlft, trst, env0)
end//let
//
|D3E1proj
(tknd
,lab2, d3e2) =>
let
val t3q2 =
d3e2.dtyp((*0*))
val t3q2 =
(
d3typ1_lab$fset
(t3q2, lab2, trst))//val
in//let
(
f1_dtyp$updt(d3e2, t3q2, env0))
end(*let*)//end-of-[D3E1proj(...)]
//
|
_(*otherwise*) => (       1       )
) where
{
//
(*
//
val loc1 = d3e1.lctn((*void*))
//
val (  ) = prerrsln
("f1_dtyp$updt(ltck): loc1 = ", loc1)
val (  ) = prerrsln
("f1_dtyp$updt(ltck): d3e1 = ", d3e1)
val (  ) = prerrsln
("f1_dtyp$updt(ltck): trst = ", trst)
//
*)
//
}(*where*)//end-of-[f1_dtyp$updt(...)]
//
}(*where*)//end-of-[f0_proj(d3e0,env0)]
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
d3ecl1lst_trxltck(dcls,env0)
//
val d3e1 =
(
  d3exp1_trxltck(d3e1, env0))
(*
HX-2025-11-15:
This is needed as the
let-bound variables is to
be removed from the dtpstk!
*)
val t3q1 =
(
d3typ1_styp$make(t2q1))
where{
val t3q1 = d3e1.dtyp((*0*))
val t2q1 =
envltck_dtyp$eval(env0, t3q1)}
//
val (  ) =
(
envltck_dlet$dtnm(env0, dcls))
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
// (*
val (  ) =
prerrsln("\
d3exp1_trxltck:\
f0_let0: d2vs = ", d2vs)
val (  ) =
prerrsln("\
d3exp1_trxltck:\
f0_let0: vts0 = ", vts0)
// *)
//
in//let
(
d3exp1_dvdtp(dexp, vts2)
) where
{
//
val vts1 =
dvdtp1lst_d2vs$inner(vts0, d2vs)
val vts2 =
dvdtp1lst_d2vs$outer(vts0, d2vs)
//
// (*
val (  ) =
prerrsln
("f0_let0(ltck): vts1 = ", vts1)
val (  ) =
prerrsln
("f0_let0(ltck): vts2 = ", vts2)
// *)
//
val vts1 =
envltck_dvdtp1lst$eval
(     env0, vts1     )//val(vts1)
//
val (  ) =
(
  envltck_dvts$updt( env0, vts2 ))
//
val dexp =
d3exp1(loc0,
  t3q1, D3E1let1(dcls, d3e1, vts1))}
//
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
let
//
val
t3q0 =
(
case+ dthn of
|optn_nil
((*void*)) => t3q0
|optn_cons
(  dthn  ) => dthn.dtyp())
//
val
dexp =
(
d3exp1(
loc0,t3q0,
D3E1ift0(d3e1, dthn, dels)))
//
in//let
//
case+ dthn of
|optn_nil
((*void*)) => dexp
|optn_cons
(  dthn  ) =>
(
case-
dthn.node() of
| D3E1dvdtp(_, dvts) =>
(
  d3exp1_dvdtp(dexp, dvts))
where
{ val () =
  envltck_dvts$updt(env0, dvts) }
)
//
end//let
//
end//let//end-of-[f0_ift0(d3e0, env0)]
//
(* ****** ****** *)
//
fun
f0_seqn
( d3e0: d3exp1
, env0: !envltck): d3exp1 =
let
//
val-
D3E1seqn
(d3es, d3e1) = d3e0.node()
//
val d3es =
d3exp1lst_trxltck(d3es, env0)
val d3e1 =
(
  d3exp1_trxltck(d3e1, env0))
//
val t3q1 = d3e1.dtyp((*void*))
//
in//let
//
(
d3exp1
(loc0, t3q1, D3E1seqn(d3es, d3e1)))
//
end//let//end-of-[f0_seqn(d3e0, env0)]
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
val t3qs = d3es_t3qs$get(d3es)
val t2qs =
envltck_dtyplst$eval(env0, t3qs)
//
val t2q0 = t3q0.styp()
val t2q1 =
(
if
list_nilq
(  d3es  )
then (t2q0) // xats_void_t
else s2typ1_tup0(npf1, t2qs))//val
//
in//let
//
(
d3exp1
(loc0, t3q0, D3E1tup0(npf1, d3es)))
where
{
val
t3q0 = d3typ1(t2q0, T3P1styp(t2q1)) }
//
end(*let*)//end-of-[f0_tup0(d3e0,env0)]
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
val t3q1 = d3e1.dtyp((*0*))
//
val
t3q2 = d3typ1_out$flat(t3q1)
//
// (*
val (  ) =
prerrsln
("f0_flat(ltck): d3e1 = ", d3e1)
val (  ) =
prerrsln
("f0_flat(ltck): t3q1 = ", t3q1)
val (  ) =
prerrsln
("f0_flat(ltck): t3q2 = ", t3q2)
// *)
//
in//let
//
d3exp1(loc0, t3q2, D3E1flat(d3e1))
//
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
val t3ql = d3el.dtyp((*0*))
val t3qr = d3er.dtyp((*0*))
//
val d3el =
(
if ( // if
d3exp1_lftq(d3el))
then
let
val () =
envltck_dlft$updt
(env0, d3el, t3qr) in (d3el)
end//let//end(then)
else
d3exp1
( d3el.lctn(), t3qr
, D3E1errck(0(*lvl*), d3el)))
//
in//let
//
let
val d3el =
(
d3exp1_exlinize(d3el, t3ql, env0))
in(*let*)
(
d3exp1
(loc0, t3q0, D3E1assgn(d3el,d3er)))
end//let//endof(d3exp1_delinize(...))
//
end(*let*)//end-of-[f0_assgn(d3e0,env0)]
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
(
d3exp1
( loc0
, t3q0, D3E1t2ped(d3e1, t2q1, t2q2)))
end(*let*)//end-of-[f0_t2ped(d3e0,env0)]
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
(*
val (  ) =
prerrsln
("d31ift_trxltck: vts0 = ", vts0)
*)
//
}
) where
{
(*
val (  ) =
prerrsln("d31ift_trxltck: dopt = ", dopt)
*)
}(*where*)//end-of-[d31ift_trxltck(dopt,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
loctn$d3fag1lst_tpcks$trxltck
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
d3fag1_befck
(d3e0, t2q0, env0)) where
{
//
(*
val () =
prerrsln
("f0_dexp$t2q0: d3e0 = ", d3e0)
val () =
prerrsln
("f0_dexp$t2q0: t2q0 = ", t2q0)
*)
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
}(*where*)//end-of-[loctn$d3fag1lst_tpcks$trxltck(...)]
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
(
  d3apt1lst_trxltck(d3ps, env0))
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
// (*
val (  ) =
prerrsln("f3arg1_trxlctk: loc0 = ", loc0)
val (  ) =
prerrsln("f3arg1_trxlctk: farg = ", farg)
// *)
//
}(*where*)//end-of-[f3arg1_trxltck(farg,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trxltck_dynexp.dats] *)
(***********************************************************************)
