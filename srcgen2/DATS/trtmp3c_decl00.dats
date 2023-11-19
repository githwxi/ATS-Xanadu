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
Fri Nov 10 13:35:32 EST 2023
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
//
#staload
_(*Trtmp3c*) = "./trtmp3c.dats"
//
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trtmp3c.sats"
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
//
#implfun
trtmp3c_d3ecl
( env0, d3cl ) = let
//
(*
val
loc0 = d3cl.lctn()
val () =
prerrln
("trtmp3c_d3ecl: loc0 = ", loc0)
val () =
prerrln
("trtmp3c_d3ecl: d3cl = ", d3cl)
*)
//
in//let
//
case+
d3cl.node() of
//
|D3Cnone0 _ => d3cl
|D3Cnone1 _ => d3cl
|D3Cnone2 _ => d3cl
//
|D3Cd2ecl _ => d3cl
|D3Cerrck _ => d3cl
//
|D3Cstatic _ => d3cl
|D3Cextern _ => d3cl
//
|D3Clocal0 _ =>
(
f0_local0(env0, d3cl))
//
|
D3Cabsopen _ => (d3cl)
|
D3Cabsimpl _ => (d3cl)
//
|
D3Cinclude _ => f0_include(env0, d3cl)
|
D3Cstaload _ => f0_staload(env0, d3cl)
//
|
D3Cvaldclst _ => f0_valdclst(env0, d3cl)
//
|
D3Cfundclst _ => f0_fundclst(env0, d3cl)
//
|
D3Cimplmnt0 _ => f0_implmnt0(env0, d3cl)
//
| _(*otherwise*) =>
let
  val loc0 = d3cl.lctn()
in//let
  d3ecl_make_node(loc0, D3Cnone2( d3cl ))
end (*let*) // end of [_(*otherwise*)] // temp
//
endlet where
{
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_local0
( env0
: !tr3cenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Clocal0
(head, body) = d3cl.node()
//
val (  ) =
tr3cenv_pshloc1(env0)
val head =
trtmp3c_d3eclist(env0, head)
//
val (  ) =
tr3cenv_pshloc2(env0)
val body =
trtmp3c_d3eclist(env0, body)
//
in//let
//
let
//
val (  ) = tr3cenv_locjoin(env0)
//
in//let
  d3ecl(loc0, D3Clocal0(head, body))
end(*let*)
//
end(*let*)//end-of-[f0_local0(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_include
( env0
: !tr3cenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Cinclude
( knd0
, tknd, gsrc
, fopt, dopt) = d3cl.node()
//
val dopt =
trtmp3c_d3eclistopt(env0, dopt)
//
in//let
d3ecl_make_node
(loc0
,D3Cinclude(knd0,tknd,gsrc,fopt,dopt))
end(*let*)//end-of-[f0_include(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_staload
( env0
: !tr3cenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Cstaload
(knd0
,tknd, gsrc
,fopt, dopt) = d3cl.node()
//
(*
val () = prerrln
("f0_staload(3c): knd0 = ", knd0)
val () = prerrln
("f0_staload(3c): tknd = ", tknd)
val () = prerrln
("f0_staload(3c): gsrc = ", gsrc)
val () = prerrln
("f0_staload(3c): dopt = ", dopt)
*)
//
in//let
if
knd0 = 0 // static
then d3cl else // dynamic
let
val () =
tr3cenv_insert_decl(env0, d3cl) in d3cl
end//let
end(*let*)//end-of-[f0_staload(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_valdclst
( env0:
! tr3cenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Cvaldclst
(tknd, d3vs) = d3cl.node()
//
(*
val () =
prerrln
("f0_valdclst(3c): loc0 = ", loc0)
val () =
prerrln
("f0_valdclst(3c): d3cl = ", d3cl)
*)
//
val
d3vs =
(
  trtmp3c_d3valdclist(env0, d3vs))
//
in//let
  d3ecl(loc0, D3Cvaldclst(tknd, d3vs))
end(*let*)//end-of-[f0_valdclst(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( env0:
! tr3cenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Cvardclst
(tknd, d3vs) = d3cl.node()
//
(*
val () =
prerrln
("f0_vardclst(3c): loc0 = ", loc0)
val () =
prerrln
("f0_vardclst(3c): d3cl = ", d3cl)
*)
//
val
d3vs =
(
  trtmp3c_d3vardclist(env0, d3vs))
//
in//let
  d3ecl(loc0, D3Cvardclst(tknd, d3vs))
end(*let*)//end-of-[f0_vardclst(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( env0:
! tr3cenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Cfundclst
( tknd
, tqas
, d3cs, d3fs) = d3cl.node()
//
// (*
val () =
prerrln
("f0_fundclst(3c): loc0 = ", loc0)
val () =
prerrln
("f0_fundclst(3c): d3cl = ", d3cl)
// *)
//
val
d3fs =
(
case+ tqas of
|
list_cons _ => d3fs
|
list_nil((*fun*)) => 
(
  trtmp3c_d3fundclist(env0, d3fs)))
//
in//let
//
d3ecl_make_node
( loc0
, D3Cfundclst(tknd, tqas, d3cs, d3fs) )
//
end(*let*)//end-of-[f0_fundclst(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_implmnt0
( env0:
! tr3cenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Cimplmnt0
( tknd
, stmp
, sqas
, tqas
, dimp
, tias, f3as
, sres, dexp) = d3cl.node()
//
in//let
//
if
dimpl_tmpq(dimp)
then // if-then
(
  d3cl ) where // tmp
{
val () =
tr3cenv_insert_decl(env0, d3cl)
}
else // if-else
let
val
dexp = trtmp3c_d3exp(env0, dexp) in
d3ecl
(
loc0,
D3Cimplmnt0
( tknd,stmp
, sqas,tqas,dimp,tias,f3as,sres,dexp) )
end(*let*)//end-of-[if-then-else]
//
end(*let*)//end-of-[f0_implmnt0(env0,d3cl)]
//
(* ****** ****** *)
(* ****** ****** *)
//
} (*where*)//end-of-[trtmp3c_d3ecl(env0,d3cl)]
//
(* ****** ****** *)
//
#implfun
trtmp3c_impltmp
  (env0, d3cl) =
(
case+
d3cl.node() of
//
|
D3Cimplmnt0 _ => f0_implmnt0(env0, d3cl)
//
| _(*otherwise*) =>
let
  val loc0 = d3cl.lctn()
in//let
  d3ecl_make_node(loc0, D3Cnone2( d3cl ))
end (*let*) // end of [_(*otherwise*)] // temp
) where
{
//
(* ****** ****** *)
//
fun
f0_implmnt0
( env0:
! tr3cenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Cimplmnt0
( tknd
, stmp
, sqas
, tqas
, dimp
, tias, f3as
, sres, dexp) = d3cl.node()
//
in//let
//
let
val
dexp = trtmp3c_d3exp(env0, dexp) in
d3ecl
(
loc0,
D3Cimplmnt0
( tknd,stmp
, sqas,tqas,dimp,tias,f3as,sres,dexp) )
end(*let*)//end-of-[if-then-else]
//
end(*let*)//end-of-[f0_implmnt0(env0,d3cl)]
//
(* ****** ****** *)
//
val () =
(
  prerrln("trtmp3c_impltmp: d3cl = ", d3cl))
//
(* ****** ****** *)
//
}(*where*)//end-of-[trtmp3c_impltmp(env0,d3cl)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trtmp3c_d3valdcl
  (env0, dval) = let
//
val loc0 =
d3valdcl_get_lctn(dval)
val dpat =
d3valdcl_get_dpat(dval)
val tdxp =
d3valdcl_get_tdxp(dval)
val wsxp =
d3valdcl_get_wsxp(dval)
//
val tdxp =
trtmp3c_teqd3exp(env0, tdxp)
//
in//let
d3valdcl_make_args(loc0,dpat,tdxp,wsxp)
end where
{
(*
  val () =
  prerrln("trtmp3c_d3valdcl: dval = ", dval)
*)
}(*let*)//end-of[trtmp3c_d3valdcl(env0,dval)]
//
(* ****** ****** *)
//
#implfun
trtmp3c_d3vardcl
  (env0, dvar) =
let
//
val loc0 =
d3vardcl_get_lctn(dvar)
//
val dpid =
d3vardcl_get_dpid(dvar)
val vpid =
d3vardcl_get_vpid(dvar)
//
val sres =
d3vardcl_get_sres(dvar)
//
val dini =
d3vardcl_get_dini(dvar)
val dini =
trtmp3c_teqd3exp(env0, dini)
//
in//let
d3vardcl_make_args(loc0,dpid,vpid,sres,dini)
end where
{
(*
  val () =
  prerrln("trtmp3c_d3vardcl: dvar = ", dvar)
*)
}(*let*)//end-of-[trtmp3c_d3vardcl(env0,dvar)]
//
(* ****** ****** *)
//
#implfun
trtmp3c_d3fundcl
  (env0, dfun) = let
//
val loc0 =
d3fundcl_get_lctn(dfun)
//
val dvar =
d3fundcl_get_dpid(dfun)
val f3as =
d3fundcl_get_farg(dfun)
val sres =
d3fundcl_get_sres(dfun)
val tdxp =
d3fundcl_get_tdxp(dfun)
val wsxp =
d3fundcl_get_wsxp(dfun)
//
(*
val f3as =
trtmp3c_f3arglst(env0, f3as)
*)
val tdxp =
trtmp3c_teqd3exp(env0, tdxp)
//
in//let
//
d3fundcl(loc0,dvar,f3as,sres,tdxp,wsxp)
//
end where
{
//
(*
val () =
prerrln("trtmp3c_d3fundcl: dfun = ", dfun)
*)
//
}(*where*)//end-of-[trtmp3c_d3fundcl(env0,dfun)]
//
(* ****** ****** *)
//
#implfun
trtmp3c_d3eclist
( env0, dcls ) =
(
  list_trtmp3c_fnp(env0, dcls, trtmp3c_d3ecl))
//
(* ****** ****** *)
//
#implfun
trtmp3c_d3valdclist
( env0, d3vs ) =
(
  list_trtmp3c_fnp(env0, d3vs, trtmp3c_d3valdcl))
//
#implfun
trtmp3c_d3vardclist
( env0, d3vs ) =
(
  list_trtmp3c_fnp(env0, d3vs, trtmp3c_d3vardcl))
//
(* ****** ****** *)
//
#implfun
trtmp3c_d3fundclist
( env0, d3fs ) =
(
  list_trtmp3c_fnp(env0, d3fs, trtmp3c_d3fundcl))
//
(* ****** ****** *)
//
#implfun
trtmp3c_d3explstopt
  (env0, dopt) =
(
  optn_trtmp3c_fnp(env0, dopt, trtmp3c_d3explst))
//
(* ****** ****** *)
//
#implfun
trtmp3c_d3eclistopt
  (env0, dopt) =
(
  optn_trtmp3c_fnp(env0, dopt, trtmp3c_d3eclist))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trtmp3c_decl00.dats] *)
