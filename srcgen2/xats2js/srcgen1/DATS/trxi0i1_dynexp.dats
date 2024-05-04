(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
//
Tue 19 Mar 2024 01:11:37 PM EDT
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
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#include
"./../HATS/xats2js_dats.hats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/trxi0i1.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/trxi0i1.dats"
//
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with i0pat_get_lctn
#symload node with i0pat_get_node
(* ****** ****** *)
#symload lctn with i0exp_get_lctn
#symload node with i0exp_get_node
(* ****** ****** *)
(* ****** ****** *)
fun
i1val_int
( loc: loc_t
, tok: token): i1val =
(
i1val_make_node(loc,I1Vint(tok)))
(* ****** ****** *)
fun
i1val_btf
( loc: loc_t
, sym: sym_t): i1val =
(
i1val_make_node(loc,I1Vbtf(sym)))
(* ****** ****** *)
fun
i1val_chr
( loc: loc_t
, tok: token): i1val =
(
i1val_make_node(loc,I1Vchr(tok)))
(* ****** ****** *)
fun
i1val_flt
( loc: loc_t
, tok: token): i1val =
(
i1val_make_node(loc,I1Vflt(tok)))
(* ****** ****** *)
fun
i1val_str
( loc: loc_t
, tok: token): i1val =
(
i1val_make_node(loc,I1Vstr(tok)))
(* ****** ****** *)
(* ****** ****** *)
fun
i1val_reg
( loc0: loc_t
, ireg: i1reg): i1val =
(
i1val_make_node(loc0,I1Vreg(ireg)))
(* ****** ****** *)
(* ****** ****** *)
//
fun
i1val_dapp
( env0:
! envi0i1
, loc0: loc_t
, i1f0: i1val
, i1vs: i1valist): i1val =
(
i1val_reg(loc0, ireg)) where
{
//
val ireg = i1reg_new0((*void*))
val ibfi = I1BFIdapp(i1f0, i1vs)
val ilet = I1LETnew1(ireg, ibfi)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_dapp(env0,...)]
//
(* ****** ****** *)
//
fun
i1val_tup0
( env0:
! envi0i1
, loc0: loc_t
, i1vs: i1valist): i1val =
(
i1val_reg(loc0, ireg)) where
{
//
val ibfi = I1BFItup0( i1vs )
val ireg = i1reg_new0((*void*))
val ilet = I1LETnew1(ireg, ibfi)
//
val (  ) =
(
  envi0i1_insert_ilet(env0, ilet) )
}(*where*)//end-of-[i1val_tup0(env0,...)]
//
(* ****** ****** *)
(* ****** ****** *)

#implfun
trxi0i1_i0pat
( env0, ipat ) =
(
case+
ipat.node() of
//
|I0Pint _ => I1BNDnone()
|I0Pbtf _ => I1BNDnone()
|I0Pchr _ => I1BNDnone()
|I0Pflt _ => I1BNDnone()
|I0Pstr _ => I1BNDnone()
//
|_(*else*) => f0_main(env0, ipat)
//
) where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_main
( env0:
! envi0i1
, ipat: i0pat): i1bnd =
let
//
val loc0 = ipat.lctn()
//
val ireg = i1reg_new0()
val ival =
i1val(loc0, I1Vreg(ireg))
//
in
//
I1BNDsome(ireg, dvvs) where
{
val dvvs =
trxi0i1_i0bnd(env0, ipat, ival) }
//
end // end-of-[f0_main(env0,ipat)]
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
prerrln("trxi0i1_i0pat: ipat = ", ipat)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[trxi0i1_i0pat(env0,ipat)]

(* ****** ****** *)
(* ****** ****** *)

#implfun
trxi0i1_i0bnd
( env0
, ipat, ival ) =
(
case+
ipat.node() of
//
|I0Pint _ => list_nil()
|I0Pbtf _ => list_nil()
|I0Pchr _ => list_nil()
|I0Pflt _ => list_nil()
|I0Pstr _ => list_nil()
//
|I0Pvar _ =>
(
f0_var(env0, ipat, ival))
|I0Pany _ => list_nil((*0*))
//
|_(*else*) => list_nil( (*void*) )
//
) where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_var
( env0:
! envi0i1
, ipat: i0pat
, ival: i1val): d2sublst =
(
list_sing(@(dvar, ival))
) where
{
//
val-
I0Pvar(dvar) = ipat.node((*0*))
//
val ((*nil*)) =
envi0i1_insert_dvar(env0, dvar, ival)
}(*where*)//end-of-[f0_var(env0, ...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
prerrln("trxi0i1_i0bnd: ipat = ", ipat)
val () =
prerrln("trxi0i1_i0bnd: ival = ", ival)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[trxi0i1_i0bnd(env0,ipat)]

(* ****** ****** *)
(* ****** ****** *)

#implfun
trxi0i1_i0exp
( env0, iexp ) =
(
case+
iexp.node() of
//
|I0Eint _ => f0_int(env0, iexp)
|I0Ebtf _ => f0_btf(env0, iexp)
|I0Echr _ => f0_chr(env0, iexp)
|I0Eflt _ => f0_flt(env0, iexp)
|I0Estr _ => f0_str(env0, iexp)
//
|I0Evar _ => f0_var(env0, iexp)
//
|I0Edapp _ => f0_dapp(env0, iexp)
//
|I0Etup0 _ => f0_tup0(env0, iexp)
//
|I0Elam0 _ => f0_lam0(env0, iexp)
//
|
_(*otherwise*) => i1val_none1(iexp)
//
) where
{
//
(* ****** ****** *)
//
fun
f0_int
( env0:
! envi0i1
, iexp: i0exp): i1val =
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
( env0:
! envi0i1
, iexp: i0exp): i1val =
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
( env0:
! envi0i1
, iexp: i0exp): i1val =
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
( env0:
! envi0i1
, iexp: i0exp): i1val =
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
( env0:
! envi0i1
, iexp: i0exp): i1val =
(
  i1val_str(loc, tok) ) where
{
  val loc = iexp.lctn()
  val-I0Estr(tok) = iexp.node() }
//
(* ****** ****** *)
//
fun
f0_var
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Evar(d2v1) = iexp.node()
//
in//let
  envi0i1_search_dvar(env0, d2v1)
end where
{
//
val () =
(
prerr("trxi0i1_i0exp:");
prerrln("f0_var(01): iexp = ", iexp))
//
}(*where*)//end-of-[f0_dapp(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_dapp
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Edapp
(i0f0, i0es) = iexp.node()
//
val i1f0 =
trxi0i1_i0exp(env0, i0f0)
val i1vs =
trxi0i1_i0explst(env0, i0es)
//
in//let
i1val_dapp(env0, loc0, i1f0, i1vs)
end where
{
//
val () =
(
prerr("trxi0i1_i0exp:");
prerrln("f0_dapp(01): iexp = ", iexp))
//
}(*where*)//end-of-[f0_dapp(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_tup0
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Etup0(i0es) = iexp.node()
val i1vs =
trxi0i1_i0explst(env0, i0es)
//
in
(
  i1val_tup0(env0, loc0, i1vs) )
end where
{
//
val () =
(
prerr("trxi0i1_i0exp:");
prerrln("f0_tup0(01): iexp = ", iexp))
//
}(*where*)//end-of-[f0_tup0(env0,iexp)]
//
(* ****** ****** *)
//
fun
f0_lam0
( env0:
! envi0i1
, iexp: i0exp): i1val =
let
//
val loc0 = iexp.lctn()
//
val-
I0Elam0
(tknd
,fias,body) = iexp.node()
//
val (  ) =
envi0i1_pshlam0(env0)
//
val fjas =
trxi0i1_fiarglst(env0, fias)
//
val
iret =
trxi0i1_i0exp(env0, body)
val
ilts = envi0i1_poplam0( env0 )
//
val icmp = I1CMPcons(ilts, iret)
//
in//let
(
  i1val_make_node
  (loc0, I1Vlam0(tknd, fjas, icmp)))
end(*let*)//end-of-[f0_lam0(env0,iexp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
prerrln("trxi0i1_i0exp: iexp = ", iexp)
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[trxi0i1_i0exp(env0,iexp)]

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_i0explst
( env0, i0es ) =
(
  list_trxi0i1_fnp(env0, i0es, trxi0i1_i0exp))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trxi0i1_fiarglst
( env0, fias ) =
(
  list_trxi0i1_fnp(env0, fias, trxi0i1_fiarg))
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trxi0i1_dynexp.dats] *)
(***********************************************************************)
