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
itnm = i1tnm_new0(ityp)
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
itnm = i1tnm_new0(ityp)
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
(* ****** ****** *)
| _(*otherwise*) => i1val_none1(iexp)
(* ****** ****** *)
(* ****** ****** *)
//
) where
{
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
}(*where*)//end-of-[i0exp_trxi0i1(iexp,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2cc_srcgen2_DATS_trxi0i1_dynexp.dats] *)
(***********************************************************************)
(***********************************************************************)
