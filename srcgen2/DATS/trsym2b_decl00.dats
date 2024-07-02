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
Sun 12 Feb 2023 12:17:13 PM EST
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
_(*TRSYM2B*) = "./trsym2b.dats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
#staload "./../SATS/trsym2b.sats"
(* ****** ****** *)
#symload lctn with d2cst_get_lctn
#symload styp with d2cst_get_styp
#symload xtyp with d2cst_get_xtyp
#symload xtyp with d2cst_set_xtyp
(* ****** ****** *)
#symload node with d2ecl_get_lctn
#symload node with d2ecl_get_node
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

local

fun
my_d2cst_set_xtyp
  (d2c1: d2cst): void =
(
  d2c1.xtyp(xt2p)) where
{
//
val xt2p =
s2typ_subst0(t2p1, svts)
//
(*
val (  ) = prerrln
("\
my_d2cst_set_xtyp: d2c1 = ", d2c1)
val (  ) = prerrln
("\
my_d2cst_set_xtyp: t2p1 = ", t2p1)
val (  ) = prerrln
("\
my_d2cst_set_xtyp: xt2p = ", xt2p)
*)
//
} where // end of [where]
{
//
val loc1 = d2c1.lctn((*void*))
val tqas = d2c1.tqas((*void*))
val t2p1 = d2c1.styp((*void*))
//
val svts =
(
  s2vts_make_lctn_tqas(loc1, tqas))
//
}(*where*)//end-[my_d2cst_set_xtyp]

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

#implfun
trsym2b_d2ecl
( env0, dcl0 ) =
let
//
(*
val
loc = dcl0.lctn()
val () =
prerrln
("trsym2b_d2ecl: loc0 = ", loc0)
val () =
prerrln
("trsym2b_d2ecl: dcl0 = ", dcl0)
*)
//
in//let
case+
dcl0.node() of
//
(*
|D2Cnone0 _ => ()
|D2Cd1ecl _ => ()
|D2Cerrck _ => ()
*)
|
D2Cstatic
(tknd, dcl1) =>
let
val () =
trsym2b_d2ecl(env0, dcl1)
endlet//end-of(D2Cstatic(_,_))
|
D2Cextern
(tknd, dcl1) =>
let
val () =
trsym2b_d2ecl(env0, dcl1)
endlet//end-of(D2Cextern(_,_))
//
|
D2Clocal0
(dcs1, dcs2) =>
let
val () =
trsym2b_d2eclist(env0, dcs1)
val () =
trsym2b_d2eclist(env0, dcs2)
endlet // end of [D2Clocal0(...)]
//
(*
|D2Cabssort _ => ( (*void*) )
|D2Cstacst0 _ => ( (*void*) )
*)
//
(*
|D2Csortdef _ => ( (*void*) )
|D2Csexpdef _ => ( (*void*) )
*)
//
(*
|D2Cabstype _ => ( (*void*) )
*)
//
(*
|D2Csymload _ => ( (*void*) )
*)
//
(*
|D2Cabsopen _ => ( (*void*) )
|D2Cabsimpl _ => ( (*void*) )
*)
//
(*
|D2Cdatasort _ => ( (*void*) )
|D2Cexcptcon _ => ( (*void*) )
|D2Cdatatype _ => ( (*void*) )
*)
//
|
D2Cinclude
( knd0
, tknd, gsrc
, fopt, dopt) =>
let
val () =
trsym2b_d2eclistopt(env0, dopt)
endlet // end of [D2Cinclude(...)]
//
|
D2Cstaload
( knd0
, tknd, gsrc
, fopt, dopt) => ((*_skipped_*))
//
|
D2Cvaldclst
(tknd, d2vs) => let
val () =
  trsym2b_d2valdclist(env0, d2vs)
endlet // end-of-(D2Cvaldclst(_,_,_))
|
D2Cvardclst
(tknd, d2vs) => let
val () =
  trsym2b_d2vardclist(env0, d2vs)
endlet // end-of-(D2Cvardclst(_,_,_))
//
|
D2Cfundclst
( tknd
, tqas
, d2cs, d2fs) => let
//
(*
val () =
prerrln(
"\
trsym2b_d2ecl: \
D2Cfundclst: d2cs = ", d2cs)
val () =
prerrln(
"\
trsym2b_d2ecl: \
D2Cfundclst: tqas = ", tqas)
*)
//
val () =
(
  list_foreach(d2cs)) where
{
  #impltmp
  foreach$work
  <d2cst>(d2c1) =
  (
    my_d2cst_set_xtyp(d2c1) )
} where
{
//
// HX-2023-08-15:
// this part is evaluated first!
//
  val () =
  trsym2b_d2fundclist(env0, d2fs) }
//
endlet // end-of-(D2Cfundclst(_,_,_))
//
|
D2Cimplmnt0 _ => f0_implmnt0(env0,dcl0)
//
|
_(*otherwise*) => ( (* __skipped__ *) )
//
end where
{
//
fun
f0_implmnt0
( env0:
! tr2aenv
, dcl0: d2ecl): void =
let
//
val
loc0 = dcl0.lctn()
//
(*
val () =
prerrln
("f0_implmnt0: loc0 = ", loc0)
*)
//
val-
D2Cimplmnt0
( tknd
, sqas, tqas
, dimp//dcst
, tias, f2as
, sres, dexp) = dcl0.node()
//
(*
val () =
prerrln
("f0_implmnt0: dcl0 = ", dcl0)
*)
//
val () =
trsym2b_f2arglst(env0, f2as)
//
val () = trsym2b_d2exp(env0, dexp)
//
in//let
  // nothing else for [f0_implmnt0]
end//let//end-of-[f0_implmnt0(env0,...)]
//
}(*where*)//end-of(trsym2b_d2ecl(env0,dcl0))
//
endloc(*local*)//end-of(local(trsym2b_d2ecl))

(* ****** ****** *)
//
#implfun
trsym2b_teqd2exp
  (env0, tdxp) =
(
case+ tdxp of
|
TEQD2EXPnone() => ()
|
TEQD2EXPsome(teq1, d2e2) =>
let
val () = trsym2b_d2exp(env0, d2e2)
end
) (*case+*)//end-of(trsym2b_teqd0exp(...))
//
(* ****** ****** *)
//
#implfun
trsym2b_d2valdcl
(env0, dval) =
let
//
val (  ) =
trsym2b_d2pat(env0, dpat)
//
val (  ) =
trsym2b_teqd2exp(env0, tdxp)
//
endlet where
{
//
  val dpat = d2valdcl_get_dpat(dval)
  val tdxp = d2valdcl_get_tdxp(dval)
//
(*
  val wsxp = d2valdcl_get_wsxp(dval)
*)
//
} (*where*)//end-of-[trsym2b_d2valdcl(env0,dval)]
//
(* ****** ****** *)
//
#implfun
trsym2b_d2vardcl
(env0, dvar) =
let
//
val (  ) =
trsym2b_teqd2exp(env0, dini)
//
endlet where
{
//
(*
  val dpid = d2vardcl_get_dpid(dvar)
  val vpid = d2vardcl_get_vpid(dvar)
  val sres = d2vardcl_get_sres(dvar)
*)
//
  val dini = d2vardcl_get_dini(dvar)
//
} (*where*)//end-of-[trsym2b_d2vardcl(env0,dval)]
//
(* ****** ****** *)
//
#implfun
trsym2b_d2fundcl
(env0, dfun) =
let
//
val (  ) =
trsym2b_f2arglst(env0, fags)
//
val (  ) =
trsym2b_teqd2exp(env0, tdxp)
//
endlet where
{
//
(*
  val dpid = d2fundcl_get_dpid(dfun)
*)
//
  val fags = d2fundcl_get_farg(dfun)
(*
  val sres = d2fundcl_get_sres(dfun)
*)
  val tdxp = d2fundcl_get_tdxp(dfun)
//
(*
  val wsxp = d2fundcl_get_wsxp(dfun)
*)
//
} (*where*)//end-of-[trsym2b_d2fundcl(env0,dfun)]
//
(* ****** ****** *)
//
#implfun
trsym2b_d2eclist
( env0, d2cs ) =
(
  list_trsym2b_fnp(env0, d2cs, trsym2b_d2ecl))
//
(* ****** ****** *)
//
#implfun
trsym2b_d2valdclist
( env0, d2vs ) =
(
  list_trsym2b_fnp(env0, d2vs, trsym2b_d2valdcl))
//
#implfun
trsym2b_d2vardclist
( env0, d2vs ) =
(
  list_trsym2b_fnp(env0, d2vs, trsym2b_d2vardcl))
//
(* ****** ****** *)
//
#implfun
trsym2b_d2fundclist
( env0, d2fs ) =
(
  list_trsym2b_fnp(env0, d2fs, trsym2b_d2fundcl))
//
(* ****** ****** *)
//
#implfun
trsym2b_d2eclistopt
( env0, dopt ) =
(
  optn_trsym2b_fnp(env0, dopt, trsym2b_d2eclist))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_trsym2b_decl00.dats] *)
