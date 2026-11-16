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
Sat Oct 31 02:55:03 PM EDT 2026
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
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
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
//
#staload "./../SATS/trxi0i1.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/trxi0i1.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with i0pat_lctn$get
#symload ityp with i0pat_ityp$get
#symload node with i0pat_node$get
(* ****** ****** *)
#symload lctn with i0exp_lctn$get
#symload node with i0exp_node$get
(* ****** ****** *)
#symload lctn with fiarg_lctn$get
#symload node with fiarg_node$get
(* ****** ****** *)
//
#symload lctn with i0gua_lctn$get
#symload lctn with i0gpt_lctn$get
#symload lctn with i0cls_lctn$get
//
#symload node with i0gua_node$get
#symload node with i0gpt_node$get
#symload node with i0cls_node$get
//
(* ****** ****** *)
#symload lctn with i1val_lctn$get
#symload node with i1val_node$get
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_i00
(loc:loc_t
,i00:(sint)): i1val =
(
i1val_make_node(loc,I1Vi00(i00)))
//
fun
i1val_b00
(loc:loc_t
,b00:(bool)): i1val =
(
i1val_make_node(loc,I1Vb00(b00)))
//
fun
i1val_c00
(loc:loc_t
,c00:(char)): i1val =
(
i1val_make_node(loc,I1Vc00(c00)))
//
fun
i1val_f00
(loc:loc_t
,f00:(dflt)): i1val =
(
i1val_make_node(loc,I1Vf00(f00)))
//
fun
i1val_s00
(loc:loc_t
,s00:(strn)): i1val =
(
i1val_make_node(loc,I1Vs00(s00)))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_int
(loc: loc_t
,tok: token): i1val =
(
i1val_make_node(loc,I1Vint(tok)))
//
fun
i1val_btf
(loc: loc_t
,sym: sym_t): i1val =
(
i1val_make_node(loc,I1Vbtf(sym)))
//
fun
i1val_chr
(loc: loc_t
,tok: token): i1val =
(
i1val_make_node(loc,I1Vchr(tok)))
//
fun
i1val_flt
(loc: loc_t
,tok: token): i1val =
(
i1val_make_node(loc,I1Vflt(tok)))
//
fun
i1val_str
(loc: loc_t
,tok: token): i1val =
(
i1val_make_node(loc,I1Vstr(tok)))
//
(* ****** ****** *)
//
fun
i1val_top
(loc: loc_t
,sym: sym_t): i1val =
(
i1val_make_node(loc,I1Vtop(sym)))
//
(* ****** ****** *)
//
fun
i1val_tnm
(loc0: loc_t
,itnm: i1tnm): i1val =
(
i1val_make_node(loc0,I1Vtnm(itnm)))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_addr
(ival: i1val): i1val =
let
val loc0 = ival.lctn() in
i1val_make_node(loc0,I1Vaddr(ival))
end//let//end-of-[i1val_addr(ival)]
//
fun
i1val_aexp
(iexp: i0exp): i1val =
let
val loc0 = iexp.lctn() in
i1val_make_node(loc0,I1Vaexp(iexp))
end//let//end-of-[i1val_aexp(iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun
i1val_timp
( env0:
! envi0i1
, loc0: loc_t
, i0f0: i0exp
, timp: t1imp
  (* impltmp *)): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val ityp = i0f0.ityp((*0*))
val itnm = i1tnm_new1(ityp)
//
val iins = I1INStimp(i0f0, timp)
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_ilet$insert(env0, ilet) )
  }(*where*)//end-of-[i1val_timp(env0,...)]
*)
//
fun
i1val_timp
( env0:
! envi0i1
, loc0: loc_t
, i0f0: i0exp
, timp: t1imp): i1val =
(
i1val_make_node(loc0,I1Vtimp(i0f0,timp)))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_dap0
( env0:
! envi0i1
, loc0: loc_t
, ityp: i0typ
, i1f0: i1val): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val
itnm = i1tnm_new1(ityp)
//
val i1vs = list_nil((*0*))
val iins = I1INSdapp(i1f0, i1vs)
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_ilet$insert(env0, ilet) )
}(*where*)//end-of-[i1val_dap0(env0,...)]
//
(* ****** ****** *)
//
fun
i1val_dapp
( env0:
! envi0i1
, loc0: loc_t
, ityp: i0typ
, i1f0: i1val
, i1vs: i1valist): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val
itnm = i1tnm_new1(ityp)
//
val iins = I1INSdapp(i1f0, i1vs)
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_ilet$insert(env0, ilet) )
}(*where*)//end-of-[i1val_dapp(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_ift0
( env0:
! envi0i1
, loc0: loc_t
, i0t1: i0typ
, i1v1: i1val
, ithn: i1cmpopt
, iels: i1cmpopt): i1val =
(
i1val_tnm(loc0, itnm)) where
{
//
val
itnm = i1tnm_new1(i0t1)
val
iins =
(
  I1INSift0(i1v1, ithn, iels))
val ilet = I1LETnew1(itnm, iins)
//
val (  ) =
(
  envi0i1_ilet$insert(env0, ilet) )
}(*where*)//end-of-[i1val_ift0(env0,...)]
//
(* ****** ****** *)
//
fun
i1val_rturn
( env0:
! envi0i1
, loc0: loc_t
, ical: (i0cal)
, icmp: (i1cmp)): i1val =
(
i1val_nil(loc0)) where
{
val (  ) =
let
//
val ilet =
I1LETnew0(
  I1INSrturn(ical, icmp)) in
//
envi0i1_ilet$insert(env0, ilet) end
}(*where*)//end-of-[i1val_rturn(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0pat_trxi0i1
(ipat, env0) =
(
case+
ipat.node() of
//
|I0Pint _ => f0_nil(ipat)
|I0Pbtf _ => f0_nil(ipat)
|I0Pchr _ => f0_nil(ipat)
|I0Pflt _ => f0_nil(ipat)
|I0Pstr _ => f0_nil(ipat)
//
|_(*else*) => f0_main(ipat, env0)
//
) where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_nil
(ipat: i0pat) =
let
val
ityp = ipat.ityp()
val
itnm = i1tnm_new1(ityp)
in//let
(
I1BNDcons
(itnm, ipat, list_nil(*void*)))
end(*let*)//end-of-[f0_nil(ipat)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_main
(
ipat: i0pat,
env0: !envi0i1): i1bnd =
let
//
val loc0 = ipat.lctn()
//
val ityp = ipat.ityp()
val
itnm = i1tnm_new1(ityp)
val ival =
i1val(loc0, I1Vtnm(itnm))
//
in//let
//
(
I1BNDcons
(itnm, ipat, dvvs))
where{
val dvvs =
i0bnd_trxi0i1(ipat, ival, env0)}
//
end(*let*)//end-of-[f0_main(ipat,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
val () =
prerrsln("i0pat_trxi0i1: ipat = ", ipat)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[i0pat_trxi0i1(ipat,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0bnd_trxi0i1
(ipat
,ival, env0) =
(
case+
ipat.node() of
//
(* ****** ****** *)
//
|I0Pint _ => list_nil()
|I0Pbtf _ => list_nil()
|I0Pchr _ => list_nil()
|I0Pflt _ => list_nil()
|I0Pstr _ => list_nil()
//
(* ****** ****** *)
//
|
I0Pvar _ =>
(
f0_var(ipat, ival, env0))
|
I0Pany _ => list_nil((*0*))
//
(* ****** ****** *)
|_(*else*) => list_nil( (*void*) )
(* ****** ****** *)
//
) where
{
//
(* ****** ****** *)
//
fun
f0_var
(
ipat: i0pat,
ival: i1val,
env0: !envi0i1): d2sublst =
(
list_sing(@(dvar, ival)))
where
{
//
val-
I0Pvar(dvar) = ipat.node((*0*))
//
val ((*nil*)) =
envi0i1_dvar$insert(env0, dvar, ival)
}(*where*)//end-of-[f0_var(ipat,ival,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end[i0bnd_trxi0i1(ipat,ival,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0exp_trxi0i1
( iexp, env0 ) =
(
case+
iexp.node() of
//
(* ****** ****** *)
//
|I0Eint _ => f0_int(iexp, env0)
|I0Ebtf _ => f0_btf(iexp, env0)
|I0Echr _ => f0_chr(iexp, env0)
|I0Eflt _ => f0_flt(iexp, env0)
|I0Estr _ => f0_str(iexp, env0)
//
(* ****** ****** *)
//
|I0Ei00 _ => f0_i00(iexp, env0)
|I0Eb00 _ => f0_b00(iexp, env0)
|I0Ec00 _ => f0_c00(iexp, env0)
|I0Ef00 _ => f0_f00(iexp, env0)
|I0Es00 _ => f0_s00(iexp, env0)
//
(* ****** ****** *)
|I0Etop _ => f0_top(iexp, env0)
(* ****** ****** *)
//
(*
|I0Econ _ => f0_con(iexp, env0)
|I0Ecst _ => f0_cst(iexp, env0)
*)
|I0Evar _ => f0_var(iexp, env0)
//
(* ****** ****** *)
//
|I0Etimp _ => f0_timp(iexp, env0)
//
(* ****** ****** *)
//
|I0Edap0 _ => f0_dap0(iexp, env0)
|I0Edapp _ => f0_dapp(iexp, env0)
//
(* ****** ****** *)
//
|I0Eift0 _ => f0_ift0(iexp, env0)
(*
|I0Ecas0 _ => f0_cas0(iexp, env0)
*)
//
(* ****** ****** *)
//
|I0Eseqn _ => f0_seqn(iexp, env0)
//
(* ****** ****** *)
//
|I0Erturn _ => f0_rturn(iexp, env0)
//
(* ****** ****** *)
//
|I0Eannot _ => f0_annot(iexp, env0)
|I0Et2ped _ => f0_t2ped(iexp, env0)
//
(* ****** ****** *)
//
|I0Enone0 _ => f0_none0(iexp, env0)
//
(* ****** ****** *)
(* ****** ****** *)
| _(*otherwise*) => i1val_none1(iexp)
(* ****** ****** *)
(* ****** ****** *)
//
) where {
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_int
(
iexp: i0exp,
env0: !envi0i1): i1val =
(
  i1val_int(loc, tok) ) where
{
  val loc = iexp.lctn()
  val-I0Eint(tok) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_btf
(
iexp: i0exp,
env0: !envi0i1): i1val =
(
  i1val_btf(loc, sym) ) where
{
  val loc = iexp.lctn()
  val-I0Ebtf(sym) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_chr
(
iexp: i0exp,
env0: !envi0i1): i1val =
(
  i1val_chr(loc, tok) ) where
{
  val loc = iexp.lctn()
  val-I0Echr(tok) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_flt
(
iexp: i0exp,
env0: !envi0i1): i1val =
(
  i1val_flt(loc, tok) ) where
{
  val loc = iexp.lctn()
  val-I0Eflt(tok) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_str
(
iexp: i0exp,
env0: !envi0i1): i1val =
(
  i1val_str(loc, tok) ) where
{
  val loc = iexp.lctn()
  val-I0Estr(tok) = iexp.node() }
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_i00
(
iexp: i0exp,
env0: !envi0i1): i1val =
(
  i1val_i00(loc, i00) ) where
{
  val loc = iexp.lctn()
  val-I0Ei00(i00) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_b00
(
iexp: i0exp,
env0: !envi0i1): i1val =
(
  i1val_b00(loc, b00) ) where
{
  val loc = iexp.lctn()
  val-I0Eb00(b00) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_c00
(
iexp: i0exp,
env0: !envi0i1): i1val =
(
  i1val_c00(loc, c00) ) where
{
  val loc = iexp.lctn()
  val-I0Ec00(c00) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_f00
(
iexp: i0exp,
env0: !envi0i1): i1val =
(
  i1val_f00(loc, f00) ) where
{
  val loc = iexp.lctn()
  val-I0Ef00(f00) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_s00
(
iexp: i0exp,
env0: !envi0i1): i1val =
(
  i1val_s00(loc, s00) ) where
{
  val loc = iexp.lctn()
  val-I0Es00(s00) = iexp.node() }
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_top
(
iexp: i0exp,
env0: !envi0i1): i1val =
(
  i1val_top(loc, sym) ) where
{
  val loc = iexp.lctn()
  val-I0Etop(sym) = iexp.node() }
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_var
(
iexp: i0exp,
env0: !envi0i1): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Evar(i0v1) = iexp.node()
//
val d2v1 = i0v1.dvar((*0*))
//
in//let
envi0i1_dvar$search(env0, d2v1)
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln(
  "f0_var(i0i1): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_var(iexp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_timp
(
iexp: i0exp,
env0: !envi0i1): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Etimp
(i0f0, timp) = iexp.node()
//
val
timp =
(
  t0imp_trxi0i1(timp, env0))
//
in//let
(
i1val_timp(env0,loc0,i0f0,timp))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln(
  "f0_timp(i0i1): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_timp(iexp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_dap0
(
iexp: i0exp,
env0: !envi0i1): i1val =
let
//
val loc0 = iexp.lctn()
val ityp = iexp.ityp()
//
val-
I0Edap0(i0f0) = iexp.node()
//
val i1f0 =
(
  i0exp_trxi0i1(i0f0, env0))
//
in//let
(
i1val_dap0(env0,loc0,ityp,i1f0))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln(
  "f0_dap0(i0i1): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_dap0(iexp,env0)]
//
(* ****** ****** *)
//
fun
f0_dapp
(
iexp: i0exp,
env0: !envi0i1): i1val =
let
//
val loc0 = iexp.lctn()
val ityp = iexp.ityp()
//
val-
I0Edapp
(i0f0
,npf1, i0es) = iexp.node()
//
val i1f0 =
i0exp_trxi0i1(i0f0, env0)
val i1vs =
f1_npf1$i0es(npf1, i0es, env0)
//
in//let
(
i1val_dapp(
  env0, loc0, ityp, i1f0, i1vs))
end where
{
//
(*
val () =
(
prerr("trxi0i1_i0exp:");
prerrsln(
  "f0_dapp(i0i1): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_dapp(iexp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_ift0
(
iexp: i0exp,
env0: !envi0i1): i1val =
let
//
val loc0 =
i0exp_lctn$get(iexp)
val i0t1 =
i0exp_ityp$get(iexp)
//
val-
I0Eift0
(
i0e1,
ithn, iels) = iexp.node()
//
val i1v1 =
i0exp_trxi0i1(i0e1, env0)
//
val ithn =
(
case+ ithn of
|
optn_nil() => optn_nil()
|
optn_cons(i0e2) =>
optn_cons
(i0blk_trxi0i1(i0e2, env0)))
//
val iels =
(
case+ iels of
|
optn_nil() => optn_nil()
|
optn_cons(i0e2) =>
optn_cons
(i0blk_trxi0i1(i0e2, env0)))
//
in//let
(
i1val_ift0(env0,
  loc0, i0t1, i1v1, ithn, iels))
end where
{
//
(*
val () =
(
prerr("i0exp_trxi0i1:");
prerrsln(
  "f0_ift0(i0i1): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_ift0(iexp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_seqn
(
iexp: i0exp,
env0: !envi0i1): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Eseqn
(i0es, i0e1) = iexp.node()
//
val () =
(
  f1_i0es(i0es, env0))
where{
//
fun
f1_i0es
( i0es: i0explst
, env0: !envi0i1): void =
(
case+ i0es of
|
list_nil
( (*void*) ) => ((*0*))
|
list_cons
(i0e1, i0es) =>
(
  f1_i0es(i0es, env0))
where{
  val _(*i1v1*) =
  i0exp_trxi0i1(i0e1, env0) }
)
//
}(*where*)//end-[val(f1_i0es)]
//
in//let
(
  i0exp_trxi0i1( i0e1, env0 ))
end where
{
//
(*
val () =
(
prerr("i0exp_trxi0i1:");
prerrsln(
  "f0_seqn(i0i1): iexp = ", iexp))
*)
//
}(*where*)//end-of-[f0_seqn(iexp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_rturn
(
iexp: i0exp,
env0: !envi0i1): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Erturn
(
ical, i0e1) = iexp.node()
//
val icmp =
(
  i0blk_trxi0i1(i0e1, env0))
//
in//let
(
i1val_rturn(env0,loc0,ical,icmp))
end(*let*)//end-of-[f0_rturn(iexp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_annot
(
iexp: i0exp,
env0: !envi0i1): i1val =
(
i0exp_trxi0i1(i0e1, env0)
) where
{
val-
I0Eannot(i0e1, _, _) = iexp.node()
}(*where*)//end-of-[f0_annot(iexp,env0)]
//
fun
f0_t2ped
(
iexp: i0exp,
env0: !envi0i1): i1val =
(
i0exp_trxi0i1(i0e1, env0)
) where
{
val-
I0Et2ped(i0e1, t2p2) = iexp.node()
}(*where*)//end-of-[f0_t2ped(iexp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_none0
(
iexp: i0exp,
env0: !envi0i1): i1val =
(
  i1val_nil(loc0)) where
{
  val loc0 = iexp.lctn((*0*))
  val-I0Enone0() = iexp.node((*0*))
}(*where*)//end-of-[f0_none0(iexp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
} where {
//
(* ****** ****** *)
//
fun
f1_npf1$i0es
(
npf1: sint,
i0es: i0explst,
env0: !envi0i1): i1valist =
(
if
(npf1 <= 0)
then
i0explst_trxi0i1(i0es, env0)
else
(
case+ i0es of
|list_nil
( (*0*) ) => list_nil(*0*)
|list_cons
(i0e1, i0es) =>
let
//
val npf1 = npf1-1
//
in//let
(
f1_npf1$i0es(npf1, i0es, env0))
end//let//end-of-[list_cons(...)]
)
)(*end-of-[f1_npf1$i0es(npf1,i0es,env0)]*)
//
(* ****** ****** *)
//
(*
fun
f1_npf1$lies
(
npf1: sint,
lies: l0i0elst,
env0: !envi0i1): l1i1vlst =
(
if
(npf1 <= 0)
then
l0i0elst_trxi0i1(lies, env0)
else
(
case+ lies of
|list_nil
( (*0*) ) => list_nil(*0*)
|list_cons
(lie1, lies) =>
let
//
val npf1 = npf1-1
//
in//let
(
f1_npf1$lies(npf1, lies, env0))
end//let//end-of-[list_cons(...)]
)
)(*end-of-[f1_npf1$lies(npf1,lies,env0)]*)
*)
//
(* ****** ****** *)
//
}(*where*)//end-of-[i0exp_trxi0i1(iexp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t0imp_trxi0i1
(timp, env0) =
let
//
val stmp =
t0imp_stmp$get(timp)
val node =
t0imp_node$get(timp)
//
in//let
//
(
t1imp_make_node(stmp, node)
) where
{
//
val node =
(
case+ node of
|T0IMPall1
(dcst
,t2js, dcls) =>
(
case+ dcls of
|optn_nil() =>
(
T1IMPall1(dcst, t2js, optn_nil()))
|optn_cons(dcl1) =>
(
T1IMPall1(dcst, t2js,
optn_cons(i0dcl_trxi0i1(dcl1, env0))))
)
//
|T0IMPallx
(dcst
,t2js, dcls) =>
(
case+ dcls of
//
|optn_nil() =>
(
T1IMPallx(dcst, t2js, optn_nil()))
//
(*
HX-202-01-30:
ONLY the first one is chosen!
*)
|optn_cons(dcl1) =>
(
T1IMPallx(dcst, t2js,
optn_cons(i0dcl_trxi0i1(dcl1, env0)))))
) : t1imp_node // end-of-[  val(node)  ]
//
}(*where*)//end(t1imp_make_node(stmp,node))
//
end(*let*)//end-of-[t0imp_trxi0i1(timp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0blk_trxi0i1
( iexp, env0 ) =
(
I1CMPcons(ilts, ival)
) where
{
val () =
(
  envi0i1_pshblk0(env0))
//
val ival =
(
  i0exp_trxi0i1(iexp, env0))
//
val ilts = envi0i1_popblk0(env0)
//
}(*where*)//end-of-[i0blk_trxi0i1(iexp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
fiarglst_trxi0i1
( fias, env0 ) =
(
case+ fias of
|list_nil
( (*0*) ) =>
list_nil((*void*))
|list_cons
(fia1, fias) =>
(
case+
fia1.node() of
//
|FIARGsapp _ =>
fiarglst_trxi0i1(fias, env0)
|FIARGmets _ =>
fiarglst_trxi0i1(fias, env0)
//
|FIARGdapp _ =>
(
  list_cons(fja1, fjas))
where
{
//
val fja1 = f0_dapp(fia1, env0)
//
val fjas =
(
  fiarglst_trxi0i1(fias, env0))
//
}(*where*)//end-[FIARGdapp(...)]
)
) where // end-of-[case+of(fia1)]
{
//
fun
f0_dapp
(
fia1: fiarg,
env0: !envi0i1): fjarg =
let
//
val loc0 = fia1.lctn()
//
val-
FIARGdapp
(npf1, i0ps) = fia1.node()
//
in//let
(
fjarg
(loc0, FJARGdarg(i1bs))) where
{
val
i1bs = i0patlst_trxi0i1(i0ps, env0)} end
}(*where+*)//end-[fiarglst_trxi0i1(fias,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen2_DATS_trxi0i1_dynexp.dats] *)
(***********************************************************************)
(***********************************************************************)
