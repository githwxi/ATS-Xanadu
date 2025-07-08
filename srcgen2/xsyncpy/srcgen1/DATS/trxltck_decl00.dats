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
Sat Jul  5 02:11:10 PM EDT 2025
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
#implfun
d3ecl1_trxltck
(d3cl, env0) =
let
//
val loc0 = d3cl.lctn()
//
val () =
prerrsln("\
d3ecl_trxltck: loc0 = ", loc0)
val () =
prerrsln("\
d3ecl_trxltck: d3cl = ", d3cl)
//
in//let
//
case+
d3cl.node() of
//
|D3C1static _ =>
(
  f0_static(d3cl, env0))
|D3C1extern _ =>
(
  f0_extern(d3cl, env0))
//
|D3C1dclst0 _ =>
(
  f0_dclst0(d3cl, env0))
|D3C1local0 _ =>
(
  f0_local0(d3cl, env0))
//
|D3C1include _ =>
(
  f0_include(d3cl, env0))
|D3C1staload _ =>
(
  f0_staload(d3cl, env0))
//
|D3C1valdclst _ =>
(
 f0_valdclst(d3cl, env0))
|D3C1vardclst _ =>
(
 f0_vardclst(d3cl, env0))
//
|_(*otherwise*) =>
d3ecl1(loc0, D3C1errck(0(*lvl*), d3cl))
//
end where
{
//
(* ****** ****** *)
//
val loc0 = d3cl.lctn()
//
(* ****** ****** *)
//
fun
f0_static
(d3c0: d3ecl1
,env0: !envltck): d3ecl1 =
let
val-
D3C1static
(tknd, d3c1) = d3c0.node()
in//let
//
(
d3ecl1
(loc0, D3C1static(tknd, d3c1)))
where{
val d3c1 = d3ecl1_trxltck(d3c1, env0)
}(*where*)
//
end//let//end-of-[f0_static(d3c0,env0)]
//
fun
f0_extern
(d3c0: d3ecl1
,env0: !envltck): d3ecl1 =
let
val-
D3C1extern
(tknd, d3c1) = d3c0.node()
in//let
//
(
d3ecl1
(loc0, D3C1extern(tknd, d3c1)))
where{
val d3c1 = d3ecl1_trxltck(d3c1, env0)
}(*where*)
//
end//let//end-of-[f0_extern(d3c0,env0)]
//
(* ****** ****** *)
//
fun
f0_dclst0
(d3c0: d3ecl1
,env0: !envltck): d3ecl1 =
let
//
val-
D3C1dclst0
(   d3cs   ) = d3c0.node()
val d3cs =
d3ecl1lst_trxltck(d3cs, env0)
//
in//let
//
(
d3ecl1(loc0, D3C1dclst0(d3cs)))
//
end//let//end-of-[f0_dclst0(d3c0,env0)]
//
(* ****** ****** *)
//
fun
f0_local0
(d3c0: d3ecl1
,env0: !envltck): d3ecl1 =
let
//
val-
D3C1local0
(head, body) = d3c0.node()
val head =
d3ecl1lst_trxltck(head, env0)
val body =
d3ecl1lst_trxltck(body, env0)
//
in//let
//
(
d3ecl1
(loc0, D3C1local0(head, body)))
//
end//let//end-of-[f0_local0(d3c0,env0)]
//
(* ****** ****** *)
//
fun
f0_include
(d3c0: d3ecl1
,env0: !envltck): d3ecl1 =
let
//
val-
D3C1include
(sd01
,tknd, gexp
,fopt, dopt) = d3c0.node()
//
val
dopt =
d3ecl1lstopt_trxltck(dopt, env0)
//
in//let
//
d3ecl1
( loc0
, D3C1include
  (sd01, tknd, gexp, fopt, dopt))
//
end//let//end-of-[f0_include(d3c0,env0)]
//
(* ****** ****** *)
//
fun
f0_staload
(d3c0: d3ecl1
,env0: !envltck): d3ecl1 =
let
//
val-
D3C1staload
(sd01
,tknd, gexp
,fopt, dopt) = d3c0.node()
//
val
dopt =
s3taload1opt_trxltck(dopt, env0)
//
in//let
//
d3ecl1
( loc0
, D3C1staload
  (sd01, tknd, gexp, fopt, dopt))
//
end//let//end-of-[f0_staload(d3c0,env0)]
//
(* ****** ****** *)
//
fun
f0_valdclst
(d3cl: d3ecl1
,env0: !envltck): d3ecl1 =
let
//
val-
D3C1valdclst
( tknd, d3vs) = d3cl.node()
//
val d3vs =
d3valdcl1lst_trxltck(d3vs, env0)
//
in//let
(
d3ecl1(loc0,D3C1valdclst(tknd,d3vs)))
end//let
//
fun
f0_vardclst
(d3cl: d3ecl1
,env0: !envltck): d3ecl1 =
let
//
val-
D3C1vardclst
( tknd, d3vs) = d3cl.node()
//
val d3vs =
d3vardcl1lst_trxltck(d3vs, env0)
//
in//let
(
d3ecl1(loc0,D3C1vardclst(tknd,d3vs)))
end//let
//
(* ****** ****** *)
//
}(*where*)//end-of-[d3ecl1_trxltck(d3cl,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
teqd3exp1_trxltck
  (tdxp, env0) =
(
case+ tdxp of
|
TEQD3EXP1none() =>
TEQD3EXP1none((*void*))
|
TEQD3EXP1some(teq1, d3e2) =>
TEQD3EXP1some(teq1, d3e2) where
{ val
  d3e2 = d3exp1_trxltck(d3e2, env0) }
)(*case+*)//endof(teqd3exp_trxltck(tdxp,env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3valdcl1_trxltck
  (dval, env0) = let
//
val loc0 =
d3valdcl1_lctn$get(dval)
val dpat =
d3valdcl1_dpat$get(dval)
val tdxp =
d3valdcl1_tdxp$get(dval)
val wsxp =
d3valdcl1_wsxp$get(dval)
//
val (  ) =
(
  d3pat1_trxltck(dpat, env0))
//
val tdxp =
(
  teqd3exp1_trxltck(tdxp, env0))
//
in//let
d3valdcl1_make_args(loc0,dpat,tdxp,wsxp)
end//let
(*let*)//end-of-[d3valdcl1_trxltck(dval,env0)]
//
(* ****** ****** *)
//
#implfun
d3vardcl1_trxltck
  (dvar, env0) = let
//
val loc0 =
d3vardcl1_lctn$get(dvar)
val dpid =
d3vardcl1_dpid$get(dvar)
val vpid =
d3vardcl1_vpid$get(dvar)
val sres =
d3vardcl1_sres$get(dvar)
val dini =
d3vardcl1_dini$get(dvar)
//
val dini =
teqd3exp1_trxltck(dini, env0)
//
in//let
(
d3vardcl1(loc0, dpid, vpid, sres, dini))
end//let
(*let*)//end-of-[d3vardcl1_trxltck(dvar,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
s3taload1opt_trxltck
(dopt, env0) =
(
//
case dopt of
|
S3TALOAD1none
(   dopt   ) => S3TALOAD1none(dopt)
|
S3TALOAD1dpar
(shrd, dpar) => S3TALOAD1dpar(shrd, dpar)
//
) where
{
//
val (  ) =
prerrsln("s3taload1opt_trxltck: dopt = ", dopt)
//
}(*where*)//end-of-[s3taload1opt_trxltck(d3cl,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trxltck_decl00.dats] *)
(***********************************************************************)
