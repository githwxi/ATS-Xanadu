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
Tue 25 Jul 2023 05:33:23 PM EDT
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
_(*TRANS3a*) = "./trans3a.dats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/filpath.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trans3a.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
#symload tqas with d2cst_get_tqas
(* ****** ****** *)
#symload lctn with dimpl_get_lctn
#symload node with dimpl_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
//
fun
d3ecl_tmplocal
( tmps
: d3eclist
, dtmp: d3ecl): d3ecl =
(
case+ tmps of
|
list_nil() => ( dtmp )
|
list_cons _ => 
let
val
loc0 = dtmp.lctn()
in//let
d3ecl_make_node
( loc0
, D3Ctmplocal(dtmp, tmps)) end
) where
{
//
(*
val () =
prerrln
("d3ecl_tmplocal: tmps = ", tmps)
val () =
prerrln
("d3ecl_tmplocal: dtmp = ", dtmp)
*)
//
}(*where*)//end-of[d3ecl_tmplocal(...)]
//
(* ****** ****** *)

#implfun
trans3a_d3ecl
( env0, d3cl ) = let
//
(*
val
loc0 = d3cl.lctn()
val () =
prerrln
("trans3a_d3ecl: loc0 = ", loc0)
val () =
prerrln
("trans3a_d3ecl: d3cl = ", d3cl)
*)
//
in//let
//
case+
d3cl.node() of
//
|D3Cnone0 _ => d3cl
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
|
D3Cvardclst _ => f0_vardclst(env0, d3cl)
|
D3Cfundclst _ => f0_fundclst(env0, d3cl)
//
|
D3Cimplmnt0 _ => f0_implmnt0(env0, d3cl)
|
D3Ctmplocal _ => f0_tmplocal(env0, d3cl)
//
| _(*otherwise*) =>
let
  val loc0 = d3cl.lctn()
in//let
  d3ecl_make_node(loc0, D3Cnone2( d3cl ))
end (*let*) // end of [_(*otherwise*)] // temp
//
end where
{
//
(* ****** ****** *)
//
fun
f0_local0
( env0
: !tr3aenv
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
tr3aenv_pshloc1(env0)
//
val head =
trans3a_d3eclist(env0, head)
val body =
trans3a_d3eclist(env0, body)
//
in//let
//
let
//
val (  ) =
tr3aenv_pshloc2(env0)//enter
val (  ) = tr3aenv_locjoin(env0)
//
val body =
trans3a_tmplocal(env0, head, body)
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
( env0:
! tr3aenv
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
trans3a_d3eclistopt(env0, dopt)
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
( env0:
! tr3aenv
, d3cl: d3ecl): d3ecl =
let
//
val
loc0 = d3cl.lctn()
val-
D3Cstaload
( knd0
, tknd, gsrc
, fopt, dopt) = d3cl.node()
//
val dopt =
(
case+ dopt of
|
S3TALOADnone
( __s2ta__ ) => dopt
|
S3TALOADdpar
(shrd, dpar) =>
(
case+ fopt of
|optn_nil() => dopt
|optn_cons(fpth) =>
let
val fnm2 =
fpath_get_fnm2(fpth)
val opt2 =
the_d3tmpenv_pvsfind(fnm2)
in//let
//
case+ opt2 of
| ~
optn_vt_nil() =>
(
S3TALOADdpar
(shrd, dpar)) where
{
val dpar =
d3parsed_of_trans3a(dpar)
val (  ) =
the_d3tmpenv_pvsadd0(fnm2,dpar)
(*
val (  ) =
prerrln
("f0_staload(3a): dpar = ", dpar)
*)
} (* end-of-[optn_vt_nil(...)] *)
| ~
optn_vt_cons(dpar) =>
(
S3TALOADdpar(shrd, dpar)) where
{
(*
val (  ) =
prerrln
("f0_staload(3a): dpar = ", dpar)
*)
} (* end-of-[optn_vt_cons(...)] *)
//
end//let//end-of-[optn_cons(...)]
) (*case+*) // [S3TALOADdpar(...)]
) (*case+*) // end of [ val(dopt) ]
//
in//let
d3ecl_make_node
(loc0
,D3Cstaload(knd0,tknd,gsrc,fopt,dopt))
end(*let*)//end-of-[f0_staload(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_valdclst
( env0:
! tr3aenv
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
("f0_valdclst: loc0 = ", loc0)
val () =
prerrln
("f0_valdclst: d3cl = ", d3cl)
*)
//
val
d3vs =
trans3a_d3valdclist(env0, d3vs)
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
! tr3aenv
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
("f0_vardclst: loc0 = ", loc0)
val () =
prerrln
("f0_vardclst: d3cl = ", d3cl)
*)
//
val
d3vs =
trans3a_d3vardclist(env0, d3vs)
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
! tr3aenv
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
(*
val () =
prerrln
("f0_fundclst: loc0 = ", loc0)
val () =
prerrln
("f0_fundclst: d3cl = ", d3cl)
*)
//
val
d3fs =
trans3a_d3fundclist(env0, d3fs)
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
! tr3aenv
, d3cl: d3ecl): d3ecl =
let
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
val
f3as =
trans3a_f3arglst(env0, f3as)
//
val
dexp = trans3a_d3exp(env0, dexp)
//
in//let
//
let
val
dimp =
d3ecl
(
loc0,
D3Cimplmnt0
( tknd,stmp
, sqas,tqas,dimp,tias,f3as,sres,dexp))
in//let
(
tr3aenv_insert_d3ecl(env0, dimp); dimp)
end//let
//
end where
{
//
val
loc0 = d3cl.lctn((*void*)) // HX: enter
//
(*
val (  ) =
prerrln("f0_implmnt0(3a): loc0 = ", loc0)
val (  ) =
prerrln("f0_implmnt0(3a): d3cl = ", d3cl)
*)
//
}(*where*)//end of [f0_implmnt0(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_tmplocal
( env0:
! tr3aenv
, d3cl: d3ecl): d3ecl =
let
//
val-
D3Ctmplocal
( dimp, tmps) = d3cl.node()
//
val
dimp = trans3a_d3ecl(env0, dimp)
//
(*
val
(  ) =
prerrln
("f0_tmplocal(3a): dimp = ", dimp)
*)
//
in
let
//
val dtmp =
(
d3ecl
(loc0, D3Ctmplocal(dimp, tmps)))
//
in//let
(
tr3aenv_insert_d3ecl(env0, dtmp); dtmp)
end//let
end where // end-of-[let]
{
//
val
loc0 = d3cl.lctn((*void*)) // HX: enter
//
(*
val (  ) =
prerrln("f0_tmplocal(3a): loc0 = ", loc0)
val (  ) =
prerrln("f0_tmplocal(3a): d3cl = ", d3cl)
*)
//
}(*where*)//end of [f0_tmplocal(env0,d3cl)]
//
(* ****** ****** *)
//
}(*where*)//end of [trans3a_d3ecl(env0,d3cl)]

(* ****** ****** *)
//
#implfun
trans3a_tmplocal
( env0
, head, body ) =
let
//
val tmps =
(
list_filter(head))
where {
#typedef x0 = d3ecl
#impltmp
filter$test
<x0>(* x0 *) = d3ecl_impltmpq
}(*where*)//end of [val(tmps)]
//
in//let
//
let
val dres = list_vt_nil((*0*))
in//let
list_vt2t
(auxloop(env0,tmps,body,dres))
end//let//end-[trans3a_tmplocal]
//
end where
{
//
#vwtpdef
d3eclist_vt = ( list_vt(d3ecl) )
//
fun
auxloop
( env0:
! tr3aenv
, tmps: d3eclist
, body: d3eclist
, dres: d3eclist_vt): d3eclist_vt =
(
case+ body of
|
list_nil
((*void*)) =>
list_vt_reverse0(dres)
|
list_cons
(d3cl, body) =>
(
if
(
  d3ecl_impltmpq(d3cl))
then
let
//
val dtmp =
d3ecl_tmplocal(tmps, d3cl)
val dres =
(
  list_vt_cons(dtmp, dres))
//
val (  ) =
tr3aenv_insert_d3ecl(env0,dtmp)
//
in//let
(
auxloop(env0, tmps, body, dres))
end//end-of-then
else
let
val dres = 
(
  list_vt_cons(d3cl, dres))
in//let
(
auxloop(env0, tmps, body, dres))
end//end-of-else
)//end-of-[if(d3ecl_impltmpq(d3cl))]
)(*case+*)//end of [auxloop(env0,...)]
//
}(*where*)//end of [trans3a_tmplocal(env0,...)]
//
(* ****** ****** *)
//
#implfun
trans3a_d3valdcl
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
val dpat =
trans3a_d3pat(env0, dpat)
val tdxp =
trans3a_teqd3exp(env0, tdxp)
//
in//let
d3valdcl_make_args(loc0,dpat,tdxp,wsxp)
end//let
//(*let*)//end-of[trans3a_d3valdcl(env0,dval)]
//
(* ****** ****** *)
//
#implfun
trans3a_d3vardcl
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
trans3a_teqd3exp(env0, dini)
//
in//let
d3vardcl_make_args(loc0,dpid,vpid,sres,dini)
end//let
(*let*)//end-of-[trans3a_d3vardcl(env0,dvar)]
//
(* ****** ****** *)
//
#implfun
trans3a_d3fundcl
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
val f3as =
trans3a_f3arglst(env0, f3as)
val tdxp =
trans3a_teqd3exp(env0, tdxp)
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
prerrln("trans3a_d3fundcl: dfun = ", dfun)
*)
//
}(*where*)//end-of-[trans3a_d3fundcl(env0,dfun)]
//
(* ****** ****** *)
//
#implfun
trans3a_d3eclist
  (env0, dcls) =
(
  list_trans3a_fnp(env0, dcls, trans3a_d3ecl))
//
(* ****** ****** *)
//
#implfun
trans3a_d3valdclist
  (env0, d3vs) =
(
  list_trans3a_fnp(env0, d3vs, trans3a_d3valdcl))
#implfun
trans3a_d3vardclist
  (env0, d3vs) =
(
  list_trans3a_fnp(env0, d3vs, trans3a_d3vardcl))
//
(* ****** ****** *)
//
#implfun
trans3a_d3fundclist
  (env0, d3fs) =
(
  list_trans3a_fnp(env0, d3fs, trans3a_d3fundcl))
//
(* ****** ****** *)
//
#implfun
trans3a_d3eclistopt
  (env0, dopt) =
(
  optn_trans3a_fnp(env0, dopt, trans3a_d3eclist))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans3a_decl00.dats] *)
