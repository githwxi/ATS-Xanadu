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
Tue Nov 28 12:33:03 EST 2023
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
//
#include
"./../HATS/libxinterp.hats"
//
(* ****** ****** *)
//
#include
"./../HATS/xinterp_dats.hats"
//
(* ****** ****** *)
#staload "./../SATS/intrep0.sats"
(* ****** ****** *)
#staload "./../SATS/xinterp.sats"
(* ****** ****** *)
#staload
_(*DATS*)="./../DATS/xinterp.dats"
(* ****** ****** *)
#symload tknd with d2cst_get_tknd
(* ****** ****** *)
#symload lctn with irpat_get_lctn
#symload node with irpat_get_node
(* ****** ****** *)
#symload lctn with irexp_get_lctn
#symload node with irexp_get_node
(* ****** ****** *)
#symload lctn with irdcl_get_lctn
#symload node with irdcl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
fun
irval_fcast
(xs: irvalist): irval =
let
val-list_cons(x1, xs) = xs in x1
end//let//end-of-[irval_fcast(xs)]
//
(* ****** ****** *)
//
fun
irexp_lam0
( loc0
: loctn
, tknd
: token
, fias
: fiarglst
, ire1: irexp): irexp =
(
case+ fias of
|
list_nil() => ire1
|
list_cons _ =>
irexp_make_node
( loc0
, IRElam0(tknd, fias, ire1)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xinterp_irexp
  (env0, ire0) =
(
case+
ire0.node() of
//
|IREint(tok) =>
(
 IRVint(token2dint(tok)))
|IREbtf(sym) =>
(
 IRVbtf(symbl2dbtf(sym)))
|IREchr(tok) =>
(
 IRVchr(token2dchr(tok)))
|IREstr(tok) =>
(
 IRVstr(token2dstr(tok)))
//
|IREvar _ => f0_var(env0, ire0)
|IREcon _ => f0_con(env0, ire0)
|IREcst _ => f0_cst(env0, ire0)
//
(* ****** ****** *)
//
|IREtimp _ => f0_timp(env0, ire0)
//
(* ****** ****** *)
//
|IREdapp _ => f0_dapp(env0, ire0)
//
(* ****** ****** *)
//
|IRElet0 _ => f0_let0(env0, ire0)
//
(* ****** ****** *)
//
|IREift0 _ => f0_ift0(env0, ire0)
|IREcas0 _ => f0_cas0(env0, ire0)
//
(* ****** ****** *)
|IREseqn _ => f0_seqn(env0, ire0)
(* ****** ****** *)
//
|IREtup0 _ => f0_tup0(env0, ire0)
|IREtup1 _ => f0_tup1(env0, ire0)
//
(* ****** ****** *)
//
|IRElam0 _ => f0_lam0(env0, ire0)
|IREfix0 _ => f0_fix0(env0, ire0)
//
(* ****** ****** *)
//
|IREaddr _ => f0_addr(env0, ire0)
(*
|IREview _ => f0_view(env0, ire0)
*)
|IREflat _ => f0_flat(env0, ire0)
//
(* ****** ****** *)
|IREfree _ => f0_free(env0, ire0)
(* ****** ****** *)
//
|
IREdp2tr _ => f0_dp2tr(env0, ire0)
//
|
IREdl0az _ => f0_dl0az(env0, ire0)
|
IREdl1az _ => f0_dl1az(env0, ire0)
//
(* ****** ****** *)
//
|
IREwhere _ => f0_where(env0, ire0)
//
(* ****** ****** *)
//
|
IREassgn _ => f0_assgn(env0, ire0)
//
(* ****** ****** *)
//
|
IREl0azy _ => f0_l0azy(env0, ire0)
|
IREl1azy _ => f0_l1azy(env0, ire0)
//
(* ****** ****** *)
|
IREnone0 _ => f0_none0(env0, ire0)
(* ****** ****** *)
//
|
_(*otherwise*) =>
( $raise
  XINTERP_IREXP(ire0)) where
{
//
val loc0 = ire0.lctn((*void*))
//
val (  ) =
prerrln
( "xinterp_irexp: loc0 = ", loc0 )
val (  ) =
prerrln
( "xinterp_irexp: ire0 = ", ire0 ) }
//
) where // end of [case+of(ire0.node)]
{
//
(* ****** ****** *)
excptcon
XINTERP_IREXP of irexp
(* ****** ****** *)
//
fun
f0_var
( env0:
! xintenv
, ire0: irexp): irval =
let
val-
IREvar(d2v0) = ire0.node()
in//let
//
(
case+ opt0 of
| ~
optn_nil((*0*)) =>
the_irvar_search(d2v0)
| ~
optn_cons(irv0) => irv0) where
{
val opt0 =
xintenv_d2vrch_opt(env0, d2v0) }
//
end(*let*)//end-of-[f0_var(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_con
( env0:
! xintenv
, ire0: irexp): irval =
(
IRVcon(d2c0) ) where
{
val-
IREcon(d2c0) = ire0.node()
}
//
(* ****** ****** *)
//
fun
f0_cst
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREcst(d2c0) = ire0.node()
//
// (*
val () =
prerrln
("f0_cst: d2c0 = ", d2c0)
val () =
prerrln
("f0_cst: tknd = ", d2c0.tknd())
// *)
//
in//let
//
if
(
d2cst_castq(d2c0)
)
then // if-then
IRVfun(
lam(xs) =>
irval_fcast(xs)) else
(
case+ opt0 of
| ~
optn_nil((*0*)) =>
the_ircst_search(d2c0)
| ~
optn_cons(irv0) => irv0) where
{
val opt0 =
xintenv_d2crch_opt(env0, d2c0) }
//
end(*let*)//end-of-[f0_cst(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_timp
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREtimp
(dcst, ird0) = ire0.node()
//
in//let
//
(
f1_impl(env0, ird0)) where
{
//
fun
f1_impl
( env0:
! xintenv
, ird0: irdcl): irval =
(
case+
ird0.node() of
//
|IRDtmpsub
(svts, ird1) =>
f1_impl(env0, ird1)
|IRDimplmnt0 _ =>
f2_impl(env0, ird0)
//
|_(*otherise*) => IRVnone0(*0*))
//
and
f2_impl
( env0:
! xintenv
, ird0: irdcl): irval =
let
val
IRDimplmnt0
( tknd
, stmp
, sqas, tqas
, dimp, t2is
, fias, ire1) = ird0.node()
in//let
//
case+ fias of
|
list_nil() =>
(
xinterp_irexp
(env0 , ire1))//nil
|
list_cons(fia1, fias) =>
let
//
val
fenv =
(
  xintenv_irsnap(env0))
in//let
//
(
IRVlam0(fia1, body, fenv)) where
{
//
val loc0 = ird0.lctn()
val body =
  irexp_lam0(loc0,tknd,fias,ire1)
} endlet // end-of-[list_cons( ... )]
//
end(*let*)//end-of-[f2_impl(env0,ire0)]
//
}
//
end(*let*)//end-of-[f0_timp(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREdapp
( irf0, ires) = ire0.node()
//
val irf0 =
(
  xinterp_irexp(env0, irf0))
val irvs =
(
  xinterp_irexplst(env0, ires))
//
in//let
//
case+ irf0 of
//
|IRVfun _ => f1_fun(irf0, irvs)
//
|IRVcon _ => f1_con(irf0, irvs)
//
|IRVlam0 _ => f1_lam0(irf0, irvs)
|IRVfix0 _ => f1_fix0(irf0, irvs)
//
|_(*otherwise*) =>
(
$raise XINTERP_IREXP(ire0)) where
{
//
val () =
prerrln
("\
xinterp_irexp:f0_dapp: irf0 = ", irf0)
val () =
prerrln
("\
xinterp_irexp:f0_dapp: ire0 = ", ire0)
//
}
//
end where
{
//
(* ****** ****** *)
//
fun
f1_fun
( irf0: irval
, irvs: irvalist): irval =
let
val-
IRVfun
(fopr) = irf0 in fopr(irvs)//val-
end(*let*)//end-of-[f1_con(irf0,irvs)]
//
(* ****** ****** *)
//
fun
f1_con
( irf0: irval
, irvs: irvalist): irval =
let
val-
IRVcon(d2c1) = irf0
in//let
(
  IRVcapp(d2c1, irvs)) where
{
val irvs = a1rsz_make_list(irvs) }
end(*let*)//end-of-[f1_fun(irf0,irvs)]
//
(* ****** ****** *)
//
fun
f1_lam0
( irf0: irval
, irvs: irvalist): irval =
let
//
val-
IRVlam0
( farg
, body, fenv) = irf0
//
val
env1 =
xintenv_make_dapp(env0, fenv)
//
val () =
fiarg_match(env1, farg, irvs)
//
in//let
//
let
val
dres =
xinterp_irexp
( env1, body )
val () =
xintenv_free_dapp(env1) in dres end
//
end(*let*)//end-of-[f1_lam0(irf0,irvs)]
//
(* ****** ****** *)
//
fun
f1_fix0
( irf0: irval
, irvs: irvalist): irval =
let
//
val-
IRVfix0
( dpid
, farg
, body, fenv) = irf0
//
val
env1 =
xintenv_make_dapp(env0, fenv)
//
val () =
irvar_match(env1, dpid, irf0)
val () =
fiarg_match(env1, farg, irvs)
//
in//let
//
let
val
dres =
xinterp_irexp
( env1, body )
val () =
xintenv_free_dapp(env1) in dres end
//
end(*let*)//end-of-[f1_fix0(irf0,irvs)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[f0_dapp(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_let0
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IRElet0
( irds, ire1) = ire0.node()
//
val () =
xintenv_pshlet0(env0)
val () =
xinterp_irdclist(env0, irds)
//
in//let
let
val
dres =
xinterp_irexp
(env0 , ire1)
val () =
xintenv_poplet0(env0) in dres end
end(*let*)//end-of-[f0_let0(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_ift0
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREift0
( ire1
, ithn, iels) = ire0.node()
val irv1 =
(
  xinterp_irexp(env0, ire1))
//
in//let
//
case- irv1 of
|IRVbtf(btf) =>
(
case+ dopt of
|
optn_nil() =>
IRVnil( (*0*) ) // HX: for void
|
optn_cons(ire2) =>
xinterp_irexp(env0, ire2)) where
{
val
dopt = bool_ifval(btf,ithn,iels) }
//
end(*let*)//end-of-[f0_ift0(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_cas0
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREcas0
( tknd
, ire1, dcls) = ire0.node()
val irv1 =
(
  xinterp_irexp(env0, ire1))
//
in//let
(
case+ dopt of
| optn_nil((*0*)) =>
( $raise
  XINTERP_IREXP(ire0) )
| optn_cons(dres) => dres//case+
) where
{
val dopt =
xinterp_irclslst(env0,dcls,irv1) }
end(*let*)//end-of-[f0_cas0(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_seqn
( env0:
! xintenv
, ire0: irexp): irval =
let
val () =
foreach(env0, ires)
in//let
xinterp_irexp(env0, ire1)
end where // end-of-let
{
//
fun
foreach
( env0: !xintenv
, ires: irexplst): void =
(
case+ ires of
|
list_nil
( (*nil*) ) => ( (*void*) )
|
list_cons
(ire1, ires) =>
(
foreach(env0, ires)) where
{
val
irv1 = xinterp_irexp(env0, ire1)
}
)
//
val-
IREseqn(ires, ire1) = ire0.node()
//
}(*let*)//end-of-[f0_seqn(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_tup0
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREtup0(ires) = ire0.node()
//
in//let
(
  IRVtup0(irvs)) where
{
val
irvs =
xinterp_irexplst(env0, ires)
val irvs = a1rsz_make_list(irvs) }
//
end(*let*)//end-of-[f0_tup0(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_tup1
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREtup1
(trec, ires) = ire0.node()
//
in//let
(
IRVtup1(trec, irvs)) where
{
val
irvs =
xinterp_irexplst(env0, ires)
val irvs = a1rsz_make_list(irvs) }
//
end(*let*)//end-of-[f0_tup1(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_lam0
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IRElam0
( tknd
, fias, ire1) = ire0.node()
//
in//let
//
case+ fias of
|
list_nil() =>
xinterp_irexp(env0, ire1)
|
list_cons
(fia1, fias) =>
let
//
val
fenv =
(
  xintenv_irsnap(env0))
//
in//let
(
  IRVlam0(fia1, body, fenv)
) where
{
val loc0 = ire0.lctn()
val body =
  irexp_lam0(loc0,tknd,fias,ire1)
} endlet//end-of-[list_cons( ... )]
//
end(*let*)//end-of-[f0_lam0(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_fix0
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREfix0
( tknd
, d2v0
, fias, ire1) = ire0.node()
//
in//let
//
case+ fias of
|
list_nil() =>
(*
HX-2023-12-14:
this should not happen!
*)
xinterp_irexp(env0, ire1)
|
list_cons
(fia1, fias) =>
let
//
val
fenv =
(
  xintenv_irsnap(env0))
//
in//let
(
  IRVfix0
  (d2v0, fia1, body, fenv)
) where
{
val loc0 = ire0.lctn()
val body =
  irexp_lam0(loc0,tknd,fias,ire1)
} endlet//end-of-[list_cons( ... )]
//
end(*let*)//end-of-[f0_fix0(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_addr
( env0:
! xintenv
, ire0: irexp): irval =
(
case-
irel.node() of
|
IREflat(ire1) => 
(
  xinterp_irexp(env0, ire1) )
) where
{
val-IREaddr(irel) = ire0.node() }
//(*where*)//end-of[f0_addr(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_flat
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREflat(ire1) = ire0.node()
val
irv1 =
(
  xinterp_irexp(env0, ire1))
//
in//let
//
(
case- irv1 of
|
IRVlft(lval) => irlft_deget(lval))
//
end(*let*)//end-of-[f0_flat(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_free
( env0:
! xintenv
, ire0: irexp): irval =
(
  IRVnil((*void*))) where
{
val-IREfree(irel) = ire0.node() }
//(*where*)//end-of[f0_free(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_dp2tr
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREdp2tr
( ire1 ) = ire0.node((*0*))
val
irv1 =
(
  xinterp_irexp(env0, ire1))
//
in//let
//
(
case- irv1 of
|
IRVlft(lval) => irlft_deget(lval))
//
end(*let*)//end-of-[f0_dp2tr(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_dl0az
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREdl0az
( ire1 ) = ire0.node((*0*))
val
irv1 =
(
  xinterp_irexp(env0, ire1))
//
in//let
//
case- irv1 of
|
IRVl0azy(body, fenv) =>
let
//
val
env1 =
xintenv_make_dapp(env0, fenv)
//
in//let
//
let
val
dres =
xinterp_irexp
( env1, body )
val () =
xintenv_free_dapp(env1) in dres end
end//let//end-of-[IRVl0az(body,...)]
//
end(*let*)//end-of-[f0_dl0az(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_dl1az
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREdl1az
( ire1 ) = ire0.node((*0*))
val
irv1 =
(
  xinterp_irexp(env0, ire1))
//
in//let
//
case- irv1 of
|
IRVl1azy
( body
, ires, fenv) =>
let
//
val
env1 =
xintenv_make_dapp(env0, fenv)
//
in//let
//
let
val
dres =
xinterp_irexp
( env1, body )
val () =
xintenv_free_dapp(env1) in dres end
end//let//end-of-[IRVl1az(body,...)]
//
end(*let*)//end-of-[f0_dl1az(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_where
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREwhere
( ire1, irds) = ire0.node()
//
val () =
xintenv_pshlet0(env0)
val () =
xinterp_irdclist(env0, irds)
//
in//let
let
val
dres =
xinterp_irexp
(env0 , ire1)
val () =
xintenv_poplet0(env0) in dres end
end(*let*)//end-of-[f0_where(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_assgn
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREassgn
( irel, irer) = ire0.node()
//
in//let
//
(
case+ irvl of
|IRVlft(lval) =>
(
irlft_deset
(lval, irvr); IRVnil(*void*))
) where
{
val irvl =
(
case-
irel.node() of
|
IREflat(ire1) =>
(
  xinterp_irexp(env0, ire1) )
|
IREdp2tr(ire1) =>
(
  xinterp_irexp(env0, ire1) )
)
val irvr =
(
  xinterp_irexp(env0, irer) ) }//whr
//
end(*let*)//end-of-[f0_assgn(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_l0azy
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREl0azy
( ire1 ) = ire0.node((*0*))
//
in//let
//
(
IRVl0azy(ire1, fenv)) where
{
val fenv = xintenv_irsnap(env0) }
//
end(*let*)//end-of-[f0_l0azy(env0,ire0)]
//
fun
f0_l1azy
( env0:
! xintenv
, ire0: irexp): irval =
let
//
val-
IREl1azy
( ire1, ires) = ire0.node()
//
in//let
//
(
IRVl1azy
( ire1, ires, fenv )) where
{
val fenv = xintenv_irsnap(env0) }
//
end(*let*)//end-of-[f0_l1azy(env0,ire0)]
//
(* ****** ****** *)
//
fun
f0_none0
( env0:
! xintenv
, ire0: irexp): irval =
(
  IRVnil((*void*))) where
{
//
val-IREnone0() = ire0.node((*0*))
//
}(*where*)//end-of-[f0_none0(env0,ire0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
// (*
val loc0 = ire0.lctn()
val (  ) =
prerrln("xinterp_irexp: loc0 = ", loc0)
val (  ) =
prerrln("xinterp_irexp: ire0 = ", ire0)
// *)
//
(* ****** ****** *)
(* ****** ****** *)
//
} (*where*)//end of [xinterp_irexp(env0,ire0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xinterp_irexplst
( env0, ires ) =
(
list_xinterp_fnp
(env0, ires, xinterp_irexp))//xinterp_irexplst
//
#implfun
xinterp_irexpopt
( env0, dopt ) =
(
optn_xinterp_fnp
(env0, dopt, xinterp_irexp))//xinterp_irexpopt
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
irgpt_valck
( env0
, dgpt, irv0 ) =
(
case-
dgpt.node() of
|
IRGPTpat(irp1) =>
irpat_valck(irp1, irv0))//case+
(*case+*)//end[xinterp_ircls(env0,ircl)]
//
#implfun
irgpt_match
( env0
, dgpt, irv0 ) =
(
case-
dgpt.node() of
|
IRGPTpat(irp1) =>
irpat_match(env0,irp1,irv0)//case+
)(*case+*)//end[xinterp_ircls(env0,ircl)]
//
(* ****** ****** *)
//
#implfun
ircls_valck
( env0
, ircl, irv0 ) =
(
case+
ircl.node() of
|IRCLSgpt
(  dgpt  ) =>
(
  irgpt_valck(env0, dgpt, irv0) )
|IRCLScls
(dgpt, ire1) =>
(
  irgpt_valck(env0, dgpt, irv0) )
)(*case+*)//end[xinterp_ircls(env0,ircl)]
//
(* ****** ****** *)
//
#implfun
ircls_match
( env0
, ircl, irv0 ) =
(
case+
ircl.node() of
|IRCLSgpt
(  dgpt  ) =>
(
  irgpt_match(env0, dgpt, irv0) )
|IRCLScls
(dgpt, ire1) =>
(
  irgpt_match(env0, dgpt, irv0) )
)(*case+*)//end[xinterp_ircls(env0,ircl)]
//
(* ****** ****** *)
//
#implfun
xinterp_ircls
( env0, ircl ) =
(
case+
ircl.node() of
|IRCLSgpt(dgpt) =>
(
  optn_nil((*void*)))
|IRCLScls(dgpt, ire1) =>
optn_cons(xinterp_irexp(env0, ire1))
)(*case+*)//end[xinterp_ircls(env0,ircl)]
//
(* ****** ****** *)
//
#implfun
xinterp_irclslst
( env0
, dcls, irv0 ) =
(
case+ dcls of
|
list_nil
((*void*)) =>
(
  optn_nil((*void*)))
|
list_cons
(ircl, dcls) =>
let
val
test =
ircls_valck(env0, ircl, irv0)
in//let
if
test
then
let
val () =
xintenv_pshlet0(env0)
val () =
ircls_match(env0, ircl, irv0)
val
dopt = xinterp_ircls(env0, ircl)
in//let
let
val () =
xintenv_poplet0(env0) in dopt end
end//let//then
else
xinterp_irclslst(env0, dcls, irv0)
end//let//end-of-[list_cons(ircl,dcls)]
) where
{
//
(*
val () =
prerrln("xinterp_irclslst: dcls = ", dcls)
val () =
prerrln("xinterp_irclslst: irv0 = ", irv0)
*)
//
}(*where*)//end[xinterp_irclslst(env0,dcls,irv0)]
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xinterp_srcgen1_DATS_xintrep_dynexp.dats] *)
