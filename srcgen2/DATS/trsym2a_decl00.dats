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
_(*TRSYM2A*) = "./trsym2a.dats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
#staload "./../SATS/trsym2a.sats"
(* ****** ****** *)

local

(* ****** ****** *)
in(* in-of-local *)
(* ****** ****** *)

#implfun
trsym2a_d2ecl
( env0, dcl0 ) =
let
//
val () =
prerrln
("trsym2a_d2ecl: dcl0 = ", dcl0)
//
in//let
case+
dcl0.node() of
//
|
D2Cstatic(tknd,dcl1) =>
let
val () =
trsym2a_d2ecl(env0, dcl1)
endlet//end-of(D2Cstatic(_,_))
|
D2Cextern(tknd,dcl1) =>
let
val () =
trsym2a_d2ecl(env0, dcl1)
endlet//end-of(D2Cextern(_,_))
//
|
D2Clocal0(dcs1,dcs2) =>
let
val () =
trsym2a_d2eclist(env0, dcs1)
val () =
trsym2a_d2eclist(env0, dcs2)
endlet // end of [D2Clocal0(...)]
//
|
D2Cvaldclst
(tknd, d2vs) => let
val () =
  trsym2a_d2valdclist(env0, d2vs)
endlet // end-of-(D2Cvaldclst(_,_,_))
|
D2Cvardclst
(tknd, d2vs) => let
val () =
  trsym2a_d2vardclist(env0, d2vs)
endlet // end-of-(D2Cvardclst(_,_,_))
//
|
D2Cfundclst
( tknd
, tqas, d2fs) => let
(*
val () =
  trsym2a_t2qaglst(env0, tqas)
*)
val () =
  trsym2a_d2fundclist(env0, d2fs)
endlet // end-of-(D2Cfundclst(_,_,_))
//
|
D2Cimplmnt0
( tknd
, sqas, tqas
, dimp
, tias, f2as
, sres, dexp) =>
let
val () =
trsym2a_d2exp(env0, dexp)
val () =
trsym2a_f2arglst(env0, f2as)
endlet where
{
val () =
trsym2a_dimpl_filt(env0,dimp,f2as,dexp)
val () =
trsym2a_dimpl_tpck(env0,dimp,f2as,dexp)
}(*where*)//end-of-(D2Cimplmnt0(...8...))
//
| D2Cnone0() => ( (*void*) )
| D2Cnone1(d1cl) => ( (*void*) )
//
| _(* otherwise *) => (   (*skipped*)   )
//
end(*let*)//end-of(trsym2a_d2ecl(env0,dcl0))
//
endloc(*local*)//end-of(local(trsym2a_d2ecl))

(* ****** ****** *)
//
#implfun
trsym2a_teqd2exp
  (env0, tdxp) =
(
case+ tdxp of
|
TEQD2EXPnone() => ()
|
TEQD2EXPsome(teq1, d2e2) =>
let
val () = trsym2a_d2exp(env0, d2e2)
end
) (*case+*)//end-of(trsym2a_teqd0exp(...))
//
(* ****** ****** *)
//
#implfun
trsym2a_d2valdcl
(env0, dval) =
let
//
val (  ) =
trsym2a_d2pat(env0, dpat)
//
val (  ) =
trsym2a_teqd2exp(env0, tdxp)
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
} (*where*)//end-of-[trsym2a_d2valdcl(env0,dval)]
//
(* ****** ****** *)
//
#implfun
trsym2a_d2vardcl
(env0, dvar) =
let
//
val (  ) =
trsym2a_teqd2exp(env0, dini)
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
} (*where*)//end-of-[trsym2a_d2vardcl(env0,dval)]
//
(* ****** ****** *)
//
#implfun
trsym2a_d2fundcl
(env0, dfun) =
let
//
val (  ) =
trsym2a_f2arglst(env0, fags)
//
val (  ) =
trsym2a_teqd2exp(env0, tdxp)
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
} (*where*)//end-of-[trsym2a_d2fundcl(env0,dfun)]
//
(* ****** ****** *)
//
#implfun
trsym2a_d2eclist
( env0, d2cs ) =
(
  list_trsym2a_fnp(env0, d2cs, trsym2a_d2ecl))
//
(* ****** ****** *)
//
#implfun
trsym2a_d2valdclist
( env0, d2vs ) =
(
  list_trsym2a_fnp(env0, d2vs, trsym2a_d2valdcl))
//
#implfun
trsym2a_d2vardclist
( env0, d2vs ) =
(
  list_trsym2a_fnp(env0, d2vs, trsym2a_d2vardcl))
//
(* ****** ****** *)
//
#implfun
trsym2a_d2fundclist
( env0, d2fs ) =
(
  list_trsym2a_fnp(env0, d2fs, trsym2a_d2fundcl))
//
(* ****** ****** *)
//
#implfun
trsym2a_d2eclistopt
( env0, dopt ) =
(
  optn_trsym2a_fnp(env0, dopt, trsym2a_d2eclist))
//
(* ****** ****** *)

#implfun
trsym2a_dimpl_filt
( env0
, dimp, f2as, dexp) =
(
case-
dimp.node() of
|
DIMPLall1
(dqid, d2cs) =>
(
if
list_singq(d2cs)
then
let
val d2c1 =
d2cs.head((*void*))
val tjas = list_nil()
in(*let*)
dimpl_set_node
( dimp
, DIMPLone0(d2c1, tjas))
end // then
else
let
val dopt =
f0_filt(d2cs, f2as, dexp)
in//let
//
if
list_singq(dopt)
then let
val d2c1 =
dopt.head((*void*))
val tjas = list_nil()
in(*let*)
dimpl_set_node
(dimp, DIMPLone0(d2c1, tjas))
end // then
else
(
dimpl_set_node
(dimp, DIMPLopt2(dqid, d2cs, dopt)))
//
end (*let*) // end of [D1MPLall1(...)]
//
(*
| _(*non-D2IMPLall1*) => ( (*unreachable*) )
*)
)
) where
{
//
val () =
prerrln
("trsym2a_dimpl_filt: dimp = ", dimp)
val () =
prerrln
("trsym2a_dimpl_filt: f2as = ", f2as)
val () =
prerrln
("trsym2a_dimpl_filt: dexp = ", dexp)
//
fun
f0_filt
( d2cs
: d2cstlst
, f2as
: f2arglst, dexp: d2exp): d2cstlst = d2cs
//
} (*where*) // end-of-[trsym2a_dimpl_filt(env0,...)]

(* ****** ****** *)

#implfun
trsym2a_implmnt0_tpck
( env0 , d2cl ) =
let
//
val-
D2Cimplmnt0
( tknd
, sqas, tqas
, dimp
, tias, f2as
, sres, dexp) = d2cl.node()
//
in//let
//
(
case+
dimp.node() of
|
DIMPLone0 _ => ()
|
_(*non-DIMPLone0*) => ((*skipped*))
) where { // end-of-case
//
val () =
prerrln
("trsym2a_implmnt0_tpck: dimp = ", dimp)
val () =
prerrln
("trsym2a_implmnt0_tpck: f2as = ", f2as)
val () =
prerrln
("trsym2a_implmnt0_tpck: dexp = ", dexp) }
//
end (*let*) // end-of-[trsym2a_dimpl_tpck(env0,...)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trsym2a_decl00.dats] *)
