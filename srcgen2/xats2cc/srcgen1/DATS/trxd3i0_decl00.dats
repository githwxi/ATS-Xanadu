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
Sat Mar 14 07:45:28 PM EDT 2026
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
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
#staload
"./../../../SATS/staexp2.sats"
#staload
"./../../../SATS/statyp2.sats"
#staload
"./../../../SATS/dynexp2.sats"
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/trxd3i0.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3ecl_trxd3i0
(d3cl, env0) =
let
//
val () =
prerrsln("\
d3ecl_trxd3i0: d3cl = ", d3cl)
//
in//let
//
case+
d3cl.node() of
(* ****** ****** *)
(* ****** ****** *)
//
|D3Cdclst0 _ =>
(
  f0_dclst0(d3cl, env0))
//
|D3Clocal0 _ =>
(
  f0_local0(d3cl, env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
|D3Cinclude _ =>
(
  f0_include(d3cl, env0))
//
|D3Cstaload _ =>
(
  f0_staload(d3cl, env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
|D3Cvaldclst _ =>
(
  f0_valdclst(d3cl, env0))
|D3Cvardclst _ =>
(
  f0_vardclst(d3cl, env0))
//
(* ****** ****** *)
//
|D3Cfundclst _ =>
(
  f0_fundclst(d3cl, env0))
//
(* ****** ****** *)
//
|D3Cimplmnt0 _ =>
(
  f0_implmnt0(d3cl, env0))
//
(* ****** ****** *)
(* ****** ****** *)
|_(* otherwise *) => i0dcl_none1(d3cl)
(* ****** ****** *)
(* ****** ****** *)
//
end where//let//endof(d3ecl_trxd3i0(...))
{
//
(* ****** ****** *)
//
fun
f0_dclst0
(
d3cl: d3ecl,
env0: !envd3i0): i0dcl =
let
//
val loc0 = d3cl.lctn()
val-
D3Cdclst0
(   dcls   ) = d3cl.node()
//
val
dcls =
d3eclist_trxd3i0(dcls, env0)
//
in//let
//
(
  i0dcl(loc0, I0Ddclst0( dcls )))
//
end//let//end-of-[f0_dclst0(d3cl, env0)]
//
(* ****** ****** *)
//
fun
f0_local0
(
d3cl: d3ecl,
env0: !envd3i0): i0dcl =
let
//
val loc0 = d3cl.lctn()
val-
D3Clocal0
(head, body) = d3cl.node()
//
val
head =
d3eclist_trxd3i0(head, env0)
val
body =
d3eclist_trxd3i0(body, env0)
//
in//let
//
i0dcl(loc0, I0Dlocal0(head, body))
//
end//let//end-of-[f0_local0(d3cl,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_include
( 
d3cl: d3ecl,
env0: !envd3i0): i0dcl =
let
//
val loc0 = d3cl.lctn()
//
val-
D3Cinclude
( knd0
, tknd, gsrc
, fopt, dopt) = d3cl.node()
//
val dopt =
(
case+ dopt of
|
optn_nil() => optn_nil(*nil*)
|
optn_cons(dcls) =>
optn_cons
(d3eclist_trxd3i0(dcls, env0)))
//
in//let
(
i0dcl_make_node
( loc0
, I0Dinclude
  (knd0, tknd, gsrc, fopt, dopt) ))
end//let//end-of-[f0_include(d3cl,env0)]
//
(* ****** ****** *)
//
fun
f0_staload
(
d3cl: d3ecl,
env0: !envd3i0): i0dcl =
(
i0dcl_make_node
(loc0, I0Dd3ecl(d3cl))
) where
{
//
val loc0 = d3cl.lctn((*0*))
//
val-
D3Cstaload
( knd0
, tknd, gsrc
, fopt, sopt) = d3cl.node((*0*)) }
(*where*)//end-of-[f0_staload(d3cl,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_valdclst
( 
d3cl: d3ecl,
env0: !envd3i0): i0dcl =
let
//
val loc0 = d3cl.lctn()
val-
D3Cvaldclst
(tknd, d3vs) = d3cl.node()
//
val
i0vs =
d3valdclist_trxd3i0(d3vs, env0)
//
in//let
(
i0dcl(loc0, I0Dvaldclst(tknd, i0vs)))
end where
{
//
(*
val loc0 = d3cl.lctn()
val (  ) =
prerrsln("f0_valdclst(d3i0): d3cl = ", d3cl)
*)
//
}(*where*) // end of [f0_valdclst(d3cl,env0)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( 
d3cl: d3ecl,
env0: !envd3i0): i0dcl =
let
//
val loc0 = d3cl.lctn()
val-
D3Cvardclst
(tknd, d3vs) = d3cl.node()
//
val
i0vs =
d3vardclist_trxd3i0(d3vs, env0)
//
in//let
(
i0dcl(loc0, I0Dvardclst(tknd, i0vs)))
end where
{
//
(*
val loc0 = d3cl.lctn()
val (  ) =
prerrsln("f0_vardclst(d3i0): d3cl = ", d3cl)
*)
//
}(*where*) // end of [f0_vardclst(d3cl,env0)]
//
(* ****** ****** *)
//
fun
f0_fundclst
(
d3cl: d3ecl,
env0: !envd3i0): i0dcl =
let
//
val loc0 = d3cl.lctn()
//
val-
D3Cfundclst
( tknd
, tqas
, d2cs, d3fs) = d3cl.node()
//
val (  ) =
f0_d3fs$insert(env0, d3fs)
//
val i0fs =
d3fundclist_trxd3i0(d3fs, env0)
//
in//let
(
i0dcl_make_node
( loc0
, I0Dfundclst(tknd, tqas, d2cs, i0fs)))
//
end where
{
//
fun
f0_d3fs$insert
( env0: !envd3i0
, d3fs: d3fundclist): void =
(
case+ d3fs of
|
list_nil() => ((*0*))
|
list_cons
(d3f1, d3fs) =>
(
f0_d3fs$insert(env0, d3fs)
) where
{
//
val
dpid = d3fundcl_get_dpid(d3f1)
val
ivar = d2fix_trxd3i0(dpid, env0)
//
val (  ) =
envd3i0_dvar$insert(env0, dpid, ivar)}
)(*case+*)//end(f0_d3fs$insert(env0,d3fs))
//
(*
//
val loc0 = d3cl.lctn((*void*))
val (  ) =
prerrsln("f0_fundclst(d3i0): d3cl = ", d3cl)
*)
//
}(*where*) // end of [f0_fundclst(d3cl,env0)]
//
(* ****** ****** *)
//
fun
f0_implmnt0
(
d3cl: d3ecl,
env0: !envd3i0): i0dcl =
let
//
val loc0 = d3cl.lctn()
//
val-
D3Cimplmnt0
( tknd
, stmp
, sqas, tqas
, dimp//dcst
, tias, f3as
, sres, dexp) = d3cl.node()
//
val lvl0 =
(
  envd3i0_getlvl0(  env0  ))
//
val (  ) =
(
  envd3i0_pshlam0(  env0  ))
//
val fias =
(
f3arglst_trxd3i0(f3as, env0))
//
val dexp =
(
  d3exp_trxd3i0( dexp, env0 ))
//
val i0vs =
(
  envd3i0_lamenv$get(  env0  ))
val (  ) = envd3i0_poplam0(env0)
//
in//let
//
let
//
val i0vt =
i0varfst_mklst(i0vs)
val i0vs =
list_make_lstrm
(i0varfst_strmize(i0vt))
//
val (  ) =
(
envd3i0_i0vs$insert(env0, i0vs))
//
val (  ) =
prerrsln("\
f0_implmnt0(d3i0): i0vs = ", i0vs)
//
in//let
(
i0dcl_make_node
(
loc0,
I0Dimplmnt0(
  tknd,lvl0,stmp,dimp,fias,dexp,i0vs)))
end//let
//
end where // end-of-[f0_implmnt0(d3cl,env0)]
{
(*
//
val loc0 = d3cl.lctn((*void*))
val (  ) =
prerrsln("f0_implmnt0(d3i0): d3cl = ", d3cl)
//
*)
}(*where*) // end-of-[f0_implmnt0(d3cl,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
}(*where*)//end-of-[d3ecl_trxd3i0(d3cl,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
teqd3exp_trxd3i0
  (tdxp, env0) =
(
case+ tdxp of
|
TEQD3EXPnone() =>
TEQI0EXPnone((*void*))
|
TEQD3EXPsome(teq1, d3e2) =>
TEQI0EXPsome(teq1, i0e2) where
{ val
  i0e2 = d3exp_trxd3i0(d3e2, env0) }
)(*case+*)//end-of-(teqd3exp_trxd3i0(tdxp...))
//
#implfun
teqd3rex_trxd3i0
  (tdxp, env0) =
(
case+ tdxp of
|
TEQD3EXPnone() =>
TEQI0EXPnone((*void*))
|
TEQD3EXPsome(teq1, d3e2) =>
TEQI0EXPsome(teq1, i0e2) where
{ val
  i0e2 = d3rex_trxd3i0(d3e2, env0) }
)(*case+*)//end-of-(teqd3rex_trxd3i0(tdxp...))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3valdcl_trxd3i0
  (dval, env0) = let
//
val loc0 =
d3valdcl_get_lctn(dval)
val dpat =
d3valdcl_get_dpat(dval)
val tdxp =
d3valdcl_get_tdxp(dval)
//
val ipat =
d3pat_trxd3i0(dpat, env0)
//
val tdxp =
teqd3exp_trxd3i0(tdxp, env0)
//
in//let
(
  i0valdcl_make_args(loc0,ipat,tdxp))
end(*let*)//end(d3valdcl_trxd3i0(dval,env0))
//
(* ****** ****** *)
//
#implfun
d3vardcl_trxd3i0
  (dvar, env0) = let
//
val loc0 =
d3vardcl_get_lctn(dvar)
val dpid =
d3vardcl_get_dpid(dvar)
val dini =
d3vardcl_get_dini(dvar)
//
val dini =
teqd3exp_trxd3i0(dini, env0)
//
val (  ) =
envd3i0_dvar$insert
( env0, dpid, ivar ) where
{
val ivar =
(
  d2var_trxd3i0(dpid, env0))
}(*where*)//end(envd3i0_dvar$insert)
//
in//let
  i0vardcl_make_args(loc0, dpid, dini)
end(*let*)//end(d3vardcl_trxd3i0(dvar,env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3fundcl_trxd3i0
  (dfun, env0) =
let
//
val lvl0 =
(
  envd3i0_getlvl0(env0))
//
val (  ) =
(
  envd3i0_pshlam0(env0))
//
val fias =
f3arglst_trxd3i0(f3as, env0)
val tdxp =
teqd3rex_trxd3i0(tdxp, env0)
//
val i0vs =
(
envd3i0_lamenv$get(  env0  ))
val (  ) =
(
  envd3i0_poplam0(   env0   ))
//
in//let
//
let
//
val i0vt =
i0varfst_mklst(i0vs)
val i0vs =
list_make_lstrm
(i0varfst_strmize(i0vt))
//
val (  ) =
(
envd3i0_i0vs$insert(env0, i0vs))
//
val (  ) =
prerrsln("\
d3fundcl_trxd3i0: i0vs = ", i0vs)
//
in//let
(
i0fundcl_make_args(loc0,
  lvl0, dpid, d2vs, fias, tdxp, i0vs))
end//let
//
end where
{
//
val loc0 = d3fundcl_get_lctn(dfun)
val dpid = d3fundcl_get_dpid(dfun)
val d2vs = d3fundcl_get_d2vs(dfun)
val f3as = d3fundcl_get_farg(dfun)
val tdxp = d3fundcl_get_tdxp(dfun)
//
(*
val (  ) =
prerrsln("d3fundcl_trxd3i0: loc0 = ", loc0)
val (  ) =
prerrsln("d3fundcl_trxd3i0: dpid = ", dpid)
val (  ) =
prerrsln("d3fundcl_trxd3i0: f3as = ", f3as)
val (  ) =
prerrsln("d3fundcl_trxd3i0: tdxp = ", tdxp)
*)
//
}(*where*)//endof(d3fundcl_trxd3i0(dfun,env0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_trxd3i0_decl00.dats] *)
(***********************************************************************)
