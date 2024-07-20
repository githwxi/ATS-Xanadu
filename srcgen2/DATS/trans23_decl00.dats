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
Sun 19 Feb 2023 09:40:11 AM EST
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
_(*TRANS23*) = "./trans23.dats"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/filpath.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
#staload "./../SATS/trsym2b.sats"
(* ****** ****** *)
#staload "./../SATS/trans23.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with simpl_get_lctn
#symload node with simpl_get_node
(* ****** ****** *)
#symload lctn with dimpl_get_lctn
#symload node with dimpl_get_node
(* ****** ****** *)
#symload lctn with d2ecl_get_lctn
#symload node with d2ecl_get_node
(* ****** ****** *)
//
fun
s3taload_from_fpath
( fpth: fpath
, dpar: d2parsed )
: @(sint,d3parsed) =
let
//
val fnm2 =
fpath_get_fnm2(fpth)
val opt2 =
the_d3parenv_pvsfind(fnm2)
//
in//in-of-let
//
case+ opt2 of
| ~
optn_vt_nil() =>
let
//
(*
// HX: nothing yet
*)
//
in(*let*)
(0, dpar) where
{
val dpar =
d2parsed_of_trans2a(dpar)
val (  ) =
d2parsed_at_trsym2b(dpar)
val dpar =
d3parsed_of_trans23(dpar)
val (  ) =
the_d3parenv_pvsadd0(fnm2, dpar) }
end//let//end-of-[ optn_vt_nil() ]
//
| ~
optn_vt_cons(dpar) => @(1(*shr*),dpar)
//
end where
{
(*
  val () =
  prerrln
  ("s3taload_from_fpath: dpar = ", dpar)
*)
}(*where*)//end-of-[s3taload_from_fpath(...)]
//
(* ****** ****** *)
//
#implfun
trans23_d2ecl
( env0, d2cl ) = let
//
(*
val
loc0 = d2cl.lctn()
val () =
prerrln
("trans23_d2ecl: loc0 = ", loc0)
val () =
prerrln
("trans23_d2ecl: d2cl = ", d2cl)
*)
//
in//let
//
case+
d2cl.node() of
//
|D2Cnone0 _ =>
let
val
loc0 = d2cl.lctn()
in//let
d3ecl_none0( loc0 )
end//end-of-[D2Cnone0]
//
|D2Cd1ecl _ =>
let
val
loc0 = d2cl.lctn()
in//let
d3ecl_make_node
(loc0, D3Cd2ecl(d2cl))
end//end-of-[D2Cd1ecl]
//
//
|D2Cstatic _ =>
(
  f0_static(env0, d2cl))
|D2Cextern _ =>
(
  f0_extern(env0, d2cl))
//
|D2Clocal0 _ =>
(
  f0_local0(env0, d2cl))
//
|
D2Cabssort _ =>
d3ecl_make_node
(d2cl.lctn(), D3Cd2ecl(d2cl))
|
D2Cstacst0 _ =>
d3ecl_make_node
(d2cl.lctn(), D3Cd2ecl(d2cl))
//
|
D2Csortdef _ =>
d3ecl_make_node
(d2cl.lctn(), D3Cd2ecl(d2cl))
|
D2Csexpdef _ =>
d3ecl_make_node
(d2cl.lctn(), D3Cd2ecl(d2cl))
//
|
D2Cabstype _ =>
d3ecl_make_node
(d2cl.lctn(), D3Cd2ecl(d2cl))
//
|
D2Csymload _ =>
d3ecl_make_node
(d2cl.lctn(), D3Cd2ecl(d2cl))
//
|
D2Cabsopen _ => f0_absopen(env0, d2cl)
|
D2Cabsimpl _ => f0_absimpl(env0, d2cl)
//
|
D2Cinclude _ => f0_include(env0, d2cl)
|
D2Cstaload _ => f0_staload(env0, d2cl)
//
(* ****** ****** *)
//
|
D2Cdyninit _ => f0_dyninit(env0, d2cl)
|
D2Cextcode _ => f0_extcode(env0, d2cl)
//
(* ****** ****** *)
//
|
D2Cvaldclst _ => f0_valdclst(env0, d2cl)
|
D2Cvardclst _ => f0_vardclst(env0, d2cl)
|
D2Cfundclst _ => f0_fundclst(env0, d2cl)
//
|
D2Cimplmnt0 _ => f0_implmnt0(env0, d2cl)
//
|
D2Cexcptcon _ => f0_excptcon(env0, d2cl)
|
D2Cdatatype _ => f0_datatype(env0, d2cl)
//
|
D2Cdynconst _ => f0_dynconst(env0, d2cl)
//
| _(*otherwise*) =>
let
  val loc0 = d2cl.lctn()
in//let
  d3ecl_make_node(loc0, D3Cnone1( d2cl ))
end (*let*) // end of [_(*otherwise*)] // temp
//
end where {
//
(* ****** ****** *)
//
fun
f0_static
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
//
val
loc0 = d2cl.lctn()
val-
D2Cstatic
(tknd, dcl1) =  d2cl.node()
val
dcl1 = trans23_d2ecl(env0, dcl1)
in//let
  d3ecl(loc0, D3Cstatic(tknd, dcl1))
end (*let*) // end of [f0_static(env0,d2cl)]
//
fun
f0_extern
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
//
val
loc0 = d2cl.lctn()
val-
D2Cextern
(tknd, dcl1) = d2cl.node()
val
dcl1 = trans23_d2ecl(env0, dcl1)
in//let
  d3ecl(loc0, D3Cextern(tknd, dcl1))
end (*let*) // end of [f0_extern(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_local0
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
//
val
loc0 = d2cl.lctn()
val-
D2Clocal0
(head, body) = d2cl.node()
//
val (  ) =
tr23env_pshloc1(env0)
val head =
trans23_d2eclist(env0, head)
val (  ) =
tr23env_pshloc2(env0)
val body =
trans23_d2eclist(env0, body)
//
val (  ) = tr23env_locjoin(env0)
//
in//let
  d3ecl(loc0, D3Clocal0(head, body))
end (*let*) // end of [f0_local0(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_absopen
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
val
loc0 = d2cl.lctn()
val-
D2Cabsopen
(tknd, simp) = d2cl.node()
//
val () =
(
case+
simp.node() of
|SIMPLone1
(s2c1) =>
tr23env_insert_any(env0,s2c1)
|_(*otherwise*) => ( (*void*) ))
//
in//let
d3ecl(loc0, D3Cabsopen(tknd, simp))
end (*let*) // end of [f0_absopen(...)]
//
fun
f0_absimpl
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
val
loc0 = d2cl.lctn()
val-
D2Cabsimpl
( tknd
, simp, sexp) = d2cl.node()
//
val () =
(
case+
simp.node() of
|SIMPLone1
(s2c1) =>
tr23env_insert_any(env0,s2c1)
//
|SIMPLopt2
(sqid,scs1,scs2) =>
(
case+ scs2 of
|list_nil() => ()
|list_cons(s2c1, _) =>
tr23env_insert_any(env0,s2c1))
//
|SIMPLall1
(sqid, s2cs) => ((*deadcode*)))
//
in//let
d3ecl_make_node
(loc0, D3Cabsimpl(tknd, simp, sexp))
end (*let*) // end of [f0_absimpl(...)]
//
(* ****** ****** *)
//
fun
f0_include
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
val
loc0 = d2cl.lctn()
val-
D2Cinclude
( knd0
, tknd, gsrc
, fopt, dopt) = d2cl.node()
//
val dopt =
(
case+ dopt of
|
optn_nil() => optn_nil(*nil*)
|
optn_cons(dcls) =>
optn_cons
(trans23_d2eclist(env0, dcls)))
//
in//let
d3ecl_make_node
(loc0,
 D3Cinclude
 (knd0, tknd, gsrc, fopt, dopt))
end (*let*) // end of [f0_include(...)]
//
(* ****** ****** *)
//
fun
f0_staload
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
//
val
loc0 = d2cl.lctn()
//
val-
D2Cstaload
( knd0
, tknd, gsrc
, fopt, dopt) = d2cl.node()
//
val dopt =
(
case+ dopt of
|
S2TALOADnone
( (*void*) ) =>
S3TALOADnone(dopt)
|
S2TALOADfenv
( __fenv__ ) =>
S3TALOADnone(dopt)
|
S2TALOADdpar
(shrd, dpar) =>
let
val
stadyn =
d2parsed_get_stadyn(dpar)
in//let
if
stadyn <= 0
then
(
  S3TALOADnone(dopt) )
else
(
case+ fopt of
|optn_nil() =>
(
  S3TALOADnone(dopt) )
|optn_cons(fpth) =>
(
S3TALOADdpar(shd2, dpar)) where
{
val
(shd2, dpar) = // shrd = shd2
s3taload_from_fpath(fpth, dpar)})
endlet//end-of-[S2TALOADdpar(...)]
) : s3taloadopt//end-of-[val(dopt)]
//
in//let
//
(
  d3ecl_make_node
  ( loc0,
    D3Cstaload
    (knd0, tknd, gsrc, fopt, dopt) ) )
end (*let*) // end of [f0_staload(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-20:
Sat 20 Jul 2024 02:26:43 PM EDT
*)
//
fun
f0_dyninit
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
//
val-
D2Cdyninit
(tknd, g1e1) = d2cl.node()
//
in//let
  d3ecl(loc0, D3Cdyninit(tknd, g1e1))
end where
{
//
val loc0 = d2cl.lctn((*void*))
//
(*
val () = prerrln
("trans23_d2ecl: f0_dyninit: d2cl = ", d2cl)
*)
//
} (*where*) // end of [f0_dyninit(env0,d2cl)]
//
(* ****** ****** *)
//
(*
HX-2024-07-20:
Sat 20 Jul 2024 02:26:43 PM EDT
*)
//
fun
f0_extcode
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
//
val-
D2Cextcode
(tknd, g1e1) = d2cl.node()
//
in//let
  d3ecl(loc0, D3Cextcode(tknd, g1e1))
end where
{
//
val loc0 = d2cl.lctn((*void*))
//
(*
val () = prerrln
("trans23_d2ecl: f0_extcode: d2cl = ", d2cl)
*)
//
} (*where*) // end of [f0_extcode(env0,d2cl)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
f0_valdclst
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
//
val-
D2Cvaldclst
(tknd, d2vs) = d2cl.node()
//
val
d3vs =
trans23_d2valdclist(env0, d2vs)
//
in//let
  d3ecl(loc0, D3Cvaldclst(tknd, d3vs))
end where
{
//
val loc0 = d2cl.lctn()
(*
val (  ) =
prerrln("f0_valdclst(23): d2cl = ", d2cl)
*)
//
}(*where*) // end of [f0_valdclst(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
//
val-
D2Cvardclst
(tknd, d2vs) = d2cl.node()
//
val
d3vs =
trans23_d2vardclist(env0, d2vs)
//
in//let
  d3ecl(loc0, D3Cvardclst(tknd, d3vs))
end where
{
//
val loc0 = d2cl.lctn()
(*
val (  ) =
prerrln("f0_vardclst(23): d2cl = ", d2cl)
*)
//
}(*where*) // end of [f0_vardclst(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
//
val-
D2Cfundclst
( tknd
, tqas
, d2cs, d2fs) = d2cl.node()
//
val
d3fs =
trans23_d2fundclist(env0, d2fs)
//
in//let
d3ecl_make_node
( loc0
, D3Cfundclst(tknd, tqas, d2cs, d3fs) )
end where
{
//
val loc0 = d2cl.lctn()
(*
val (  ) =
prerrln("f0_fundclst(23): d2cl = ", d2cl)
*)
//
}(*where*) // end of [f0_fundclst(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_implmnt0
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
//
val-
D2Cimplmnt0
( tknd
, sqas, tqas
, dimp//dcst
, tias, f2as
, sres, dexp) = d2cl.node()
//
val stmp =
  the_d3imp_stamp_new((*0*))
//
val f3as =
  trans23_f2arglst(env0, f2as)
//
val dexp = trans23_d2exp(env0, dexp)
//
in//let
d3ecl
(
loc0,
D3Cimplmnt0
( tknd,stmp
, sqas,tqas,dimp,tias,f3as,sres,dexp) )
end where // end-of-[let]
{
//
val loc0 = d2cl.lctn()
//
(*
val (  ) =
prerrln("f0_implmnt0(23): loc0 = ", loc0)
val (  ) =
prerrln("f0_implmnt0(23): d2cl = ", d2cl)
*)
//
} (*where*) // end of [f0_implmnt0(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_excptcon
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
val-D2Cexcptcon _ = d2cl.node()
in//let
d3ecl_make_node(d2cl.lctn(), D3Cd2ecl(d2cl))
end (*let*) // end of [f0_excptcon(env0,d2cl)]
//
fun
f0_datatype
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
val-D2Cdatatype _ = d2cl.node()
in//let
d3ecl_make_node(d2cl.lctn(), D3Cd2ecl(d2cl))
end (*let*) // end of [f0_datatype(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_dynconst
( env0:
! tr23env
, d2cl: d2ecl): d3ecl =
let
//
val
loc0 = d2cl.lctn()
val-D2Cdynconst _ = d2cl.node()
in//let
d3ecl_make_node(d2cl.lctn(), D3Cd2ecl(d2cl))
end (*let*) // end of [f0_dynconst(env0,d2cl)]
//
(* ****** ****** *)
//
} (*where*) // end of [trans23_d2ecl(env0,d2cl)]

(* ****** ****** *)
(* ****** ****** *)

#implfun
trans23_teqd2exp
  (env0, tdxp) =
(
case+ tdxp of
|
TEQD2EXPnone() =>
TEQD3EXPnone((*void*))
|
TEQD2EXPsome(teq1, d2e2) =>
TEQD3EXPsome(teq1, d3e2) where
{ val
  d3e2 = trans23_d2exp(env0, d2e2) }
) (*case+*)//end-of(trans23_teqd2exp(...))

(* ****** ****** *)

#implfun
trans23_d2valdcl
  (env0, dval) = let
//
val loc0 =
d2valdcl_get_lctn(dval)
val dpat =
d2valdcl_get_dpat(dval)
val tdxp =
d2valdcl_get_tdxp(dval)
val wsxp =
d2valdcl_get_wsxp(dval)
//
val dpat =
trans23_d2pat(env0, dpat)
//
val tdxp =
(
case tdxp of
|
TEQD2EXPnone() =>
TEQD3EXPnone(*void*)
|
TEQD2EXPsome(teq1, dexp) =>
TEQD3EXPsome(teq1, dexp) where
{
val tpat = dpat.styp((*0*))
val dexp =
trans23_d2exp_tpck(env0, dexp, tpat)}
)
//
in//let
d3valdcl_make_args(loc0,dpat,tdxp,wsxp)
end//let
(*let*)//end-of-[trans23_d2valdcl(env0,dval)]

(* ****** ****** *)

#implfun
trans23_d2vardcl
  (env0, dvar) = let
//
val loc0 =
d2vardcl_get_lctn(dvar)
val dpid =
d2vardcl_get_dpid(dvar)
val vpid =
d2vardcl_get_vpid(dvar)
val sres =
d2vardcl_get_sres(dvar)
val dini =
d2vardcl_get_dini(dvar)
//
val dini =
trans23_teqd2exp(env0, dini)
//
in//let
d3vardcl_make_args(loc0,dpid,vpid,sres,dini)
end//let
(*let*)//end-of-[trans23_d2vardcl(env0,dvar)]

(* ****** ****** *)

#implfun
trans23_d2fundcl
  (env0, dfun) = let
//
val loc0 =
d2fundcl_get_lctn(dfun)
//
val dvar =
d2fundcl_get_dpid(dfun)
val f2as =
d2fundcl_get_farg(dfun)
val sres =
d2fundcl_get_sres(dfun)
val tdxp =
d2fundcl_get_tdxp(dfun)
val wsxp =
d2fundcl_get_wsxp(dfun)
//
(*
val (  ) = prerrln
("trans23_d2fundcl: f2as = ", f2as)
val (  ) = prerrln
("trans23_d2fundcl: tdxp = ", tdxp)
*)
//
val f3as =
trans23_f2arglst(env0, f2as)
val tdxp =
trans23_teqd2exp(env0, tdxp)
//
(*
val f2cl = F2CLfun((*void*))
*)
//
(*
val (  ) = prerrln
("trans23_d2fundcl: f3as = ", f3as)
val (  ) = prerrln
("trans23_d2fundcl: tdxp = ", tdxp)
*)
//
in//let
d3fundcl(loc0,dvar,f3as,sres,tdxp,wsxp)
end//let
(*let*)//end-of-[trans23_d2fundcl(env0,dfun)]

(* ****** ****** *)
(* ****** ****** *)

#implfun
trans23_d2eclist
  (env0, dcls) =
(
list_trans23_fnp(env0, dcls, trans23_d2ecl))

(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans23_d2valdclist
  (env0, d2vs) =
(
list_trans23_fnp(env0, d2vs, trans23_d2valdcl))
//
#implfun
trans23_d2vardclist
  (env0, d2vs) =
(
list_trans23_fnp(env0, d2vs, trans23_d2vardcl))
//
(* ****** ****** *)
//
#implfun
trans23_d2fundclist
  (env0, d2fs) =
(
list_trans23_fnp(env0, d2fs, trans23_d2fundcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans23_d2eclistopt
  (  env0,dopt  ) =
(
optn_trans23_fnp(env0, dopt, trans23_d2eclist))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_trans23_decl00.dats] *)
