(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun 20 Nov 2022 11:06:32 AM EST
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
_(*TRANS2a*) = "./trans2a.dats"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
(* ****** ****** *)
#symload name with s2cst_get_name
#symload name with s2var_get_name
(* ****** ****** *)
#symload node with s2typ_get_node
(* ****** ****** *)
#symload styp with d2var_get_styp
(* ****** ****** *)
#symload styp with d2cst_get_styp
#symload styp with d2cst_set_styp
(* ****** ****** *)
#symload styp with d2pat_get_styp
#symload styp with d2exp_get_styp
(* ****** ****** *)
#symload lctn with simpl_get_lctn
#symload node with simpl_get_node
(* ****** ****** *)
#symload lctn with dimpl_get_lctn
#symload node with dimpl_get_node
(* ****** ****** *)
#symload dpid with d2fundcl_get_dpid
(* ****** ****** *)
//
fn0
s2typ_new0_x2tp
( loc0: loc_t ): s2typ =
(
s2typ_xtv
(x2t2p_make_lctn(loc0)))//fn0
//
(* ****** ****** *)
//
fun
d2pat_make_tpnd
( loc0: loc_t
, t2p0: s2typ
, node: d2pat_node): d2pat =
let
val
d2p0 = d2pat(loc0, node)
in//let
  (d2p0.styp(t2p0); d2p0) endlet
//
fun
d2exp_make_tpnd
( loc0: loc_t
, t2p0: s2typ
, node: d2exp_node): d2exp =
let
val
d2e0 = d2exp(loc0, node)
in//let
  (d2e0.styp(t2p0); d2e0) endlet
//
#symload d2pat with d2pat_make_tpnd
#symload d2exp with d2exp_make_tpnd
//
(* ****** ****** *)
//
#implfun
trans2a_d2ecl
( env0, d2cl ) = let
//
(*
val
loc0 = d2cl.lctn()
val () =
prerrln
("trans2a_d2ecl: loc0 = ", loc0)
val () =
prerrln
("trans2a_d2ecl: d2cl = ", d2cl)
*)
//
in//let
//
case+
d2cl.node() of
//
|D2Cnone0 _ => d2cl
|D2Cd1ecl _ => d2cl
|D2Cerrck _ => d2cl
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
|D2Cabssort _ => (d2cl)
|D2Cstacst0 _ => (d2cl)
//
|D2Csortdef _ => (d2cl)
|D2Csexpdef _ => (d2cl)
//
|D2Cabstype _ => (d2cl)
//
|D2Csymload _ => (d2cl)
//
|D2Cdatasort _ => (d2cl)
//
|D2Cexcptcon _ => (d2cl)
|D2Cdatatype _ => (d2cl)
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
D2Cdynconst _ => f0_dynconst(env0, d2cl)
//
| _(*otherwise*) =>
let
  val loc0 = d2cl.lctn()
in//let
  d2ecl_make_node(loc0, D2Cnone2( d2cl ))
end (*let*) // end of [_(*otherwise*)] // temp
//
end where
{
//
(* ****** ****** *)
//
fun
f0_static
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
//
val
loc0 = d2cl.lctn()
val-
D2Cstatic
(tknd, dcl1) =  d2cl.node()
//
(*
val () =
prerrln
("f0_static(2a): d2cl = ", d2cl)
*)
//
val
dcl1 = trans2a_d2ecl(env0, dcl1)
//
in//let
  d2ecl(loc0, D2Cstatic(tknd, dcl1))
end (*let*) // end of [f0_static(env0,d2cl)]
//
fun
f0_extern
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
//
val
loc0 = d2cl.lctn()
val-
D2Cextern
(tknd, dcl1) = d2cl.node()
//
(*
val () =
prerrln
("f0_extern(2a): d2cl = ", d2cl)
*)
//
val
dcl1 = trans2a_d2ecl(env0, dcl1)
//
in//let
  d2ecl(loc0, D2Cextern(tknd, dcl1))
end (*let*) // end of [f0_extern(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_local0
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
//
val
loc0 = d2cl.lctn()
val-
D2Clocal0
(head, body) = d2cl.node()
//
val (  ) =
tr2aenv_pshloc1(env0)
val head =
trans2a_d2eclist(env0, head)
val (  ) =
tr2aenv_pshloc2(env0)
val body =
trans2a_d2eclist(env0, body)
//
val (  ) = tr2aenv_locjoin(env0)
//
in//let
  d2ecl(loc0, D2Clocal0(head, body))
end (*let*) // end of [f0_local0(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_absopen
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
//
val-
D2Cabsopen
( tknd, simp) = d2cl.node()
//
in//let
//
case+
simp.node() of
//
|SIMPLone1
(   s2c1   ) => d2cl
where {
val () =
tr2aenv_s2cins_any(env0,s2c1)}
//
|SIMPLopt2
(sqid,scs1,scs2) =>
(
case+ scs2 of
|
list_nil() => d2cl
|
list_cons(s2c1, _) => d2cl
where {
val () =
tr2aenv_s2cins_any(env0,s2c1)})
//
end where
{
(*
  val () =
  prerrln("f0_absopen(2a): d2cl = ", d2cl)
*)
} (*where*) // end of [f0_absopen(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_absimpl
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
//
val-
D2Cabsimpl
( tknd
, simp, sdef) = d2cl.node()
//
in//let
//
let
val () =
(
case+
simp.node() of
//
|SIMPLone1
(   s2c1   ) =>
let
val
sdef =
s2exp_stpize(sdef)
val () =
s2abs_set_styp(s2c1,sdef)
val () =
tr2aenv_s2cins_any(env0,s2c1)
end//let//end-of-[SIMPLone1(...)]
//
|SIMPLopt2
(sqid,scs1,scs2) =>
(
case+ scs2 of
|list_nil() => ()
|list_cons(s2c1, _) =>
let
val
sdef =
s2exp_stpize(sdef)
val () =
s2abs_set_styp(s2c1,sdef)
val () =
tr2aenv_s2cins_any(env0,s2c1) end)
//let//end-of-[SIMPLopt2(sqid,...)]
//
|
SIMPLall1
(sqid, s2cs) => ((*deadcode*))//case+
)
in//let
d2cl end(*let*) // end-of-[case+(simp)]
//
end where
{
(*
  val () =
  prerrln("f0_absimpl(2a): d2cl = ", d2cl)
*)
} (*where*) // end of [f0_absimpl(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_include
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
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
(trans2a_d2eclist(env0, dcls)))
//
in//let
d2ecl_make_node
(loc0,
 D2Cinclude
 (knd0, tknd, gsrc, fopt, dopt))
end (*let*) // end of [f0_include(...)]
//
(* ****** ****** *)
//
fun
f0_staload
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
val-
D2Cstaload
( knd0
, tknd, gsrc
, fopt, dopt) = d2cl.node() in d2cl
end (*let*) // end of [f0_staload(...)]
//
(* ****** ****** *)
//
fun
f0_valdclst
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
//
val
loc0 = d2cl.lctn()
val-
D2Cvaldclst
(tknd, d2vs) = d2cl.node()
//
(*
val () =
prerrln
("f0_valdclst(2a): loc0 = ", loc0)
val () =
prerrln
("f0_valdclst(2a): d2cl = ", d2cl)
*)
//
val d2vs =
(
  trans2a_d2valdclist(env0, d2vs) )
//
in//let
  d2ecl(loc0, D2Cvaldclst(tknd, d2vs))
end (*let*) // end of [f0_valdclst(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
//
val
loc0 = d2cl.lctn()
val-
D2Cvardclst
(tknd, d2vs) = d2cl.node()
//
(*
val () =
prerrln
("f0_vardclst(2a): loc0 = ", loc0)
val () =
prerrln
("f0_vardclst(2a): d2cl = ", d2cl)
*)
//
val d2vs =
(
  trans2a_d2vardclist(env0, d2vs) )
//
in//let
  d2ecl(loc0, D2Cvardclst(tknd, d2vs))
end (*let*) // end of [f0_vardclst(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
//
val
loc0 = d2cl.lctn()
val-
D2Cfundclst
( tknd
, tqas
, d2cs, d2fs) = d2cl.node()
//
(*
val () =
prerrln
("f0_fundclst(2a): loc0 = ", loc0)
val () =
prerrln
("f0_fundclst(2a): d2cl = ", d2cl)
*)
//
val d2fs =
(
  trans2a_d2fundclist(env0, d2fs) )
//
val (  ) = f1_d2cs_d2fs(d2cs, d2fs)
//
in//let
//
d2ecl_make_node
( loc0
, D2Cfundclst(tknd, tqas, d2cs, d2fs) )
//
end where
{
//
fun
f1_d2cs_d2fs
( d2cs
: d2cstlst
, d2fs
: d2fundclist): void =
(
case+ d2cs of
|list_nil() =>
( (*nothing*) )
|list_cons(d2c1, d2cs) =>
(
  f1_d2cs_d2fs(d2cs, d2fs)
) where
{
 val-
 list_cons
 (d2f1, d2fs) = d2fs
 val d2v1 = d2fundcl_get_dpid(d2f1)
 val (  ) = d2c1.styp(d2v1.styp((*0*))) }
)(*case+*) // end-of-[ f1_d2cs_d2fs(...) ]
//
}(*where*) // end of [f0_fundclst(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_implmnt0
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
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
//
in//let
//
case+
dimp.node() of
|
DIMPLone1(d2c0) =>
let
//
val
(svts, tfun) =
trans2a_d2cst_elim
( env0
, loc0, d2c0, tqas, tias)
val
(f2as, tres) =
trans2a_f2arglst_elim
( env0, loc0, f2as, tfun)
//
val
dimp =
if
not
(
d2cst_tempq(d2c0)
) then (dimp) else
let
val
loc1 =
dimp.lctn((*0*))
val svts =
list_reverse(svts) in//let
dimpl_make_node
(loc1, DIMPLone2(d2c0, svts))
end(*let*)//end-of-[val(dimp)]
//
local
//
val dexp =
trans2a_d2exp(env0, dexp)
val ubtf =
unify2a_s2typ
(env0, dexp.styp(), tres) in//loc
//
val dexp =
d2exp(loc0,tres,D2Et2pck(dexp,tres))
end (*loc*) // end-of-local[val(dexp)]
//
val
dexp =
(
case+ sres of
|S2RESnone() => dexp
|S2RESsome(seff, sexp) =>
let
val
tann = s2exp_stpize(sexp)
val
ubtf =
unify2a_s2typ(env0,tres,tann)
in//let
(*
if
ubtf then dexp else
*)
d2exp(loc0,tann,D2Et2pck(dexp,tann))
end (*let*) // end of [S2RESsome(...)]
)
in//let
d2ecl
(
loc0,
D2Cimplmnt0
( tknd
, sqas,tqas,dimp,tias,f2as,sres,dexp))
end//let//end-of-[DIMPLone1]
|
_ (*non-DIMPone1*) =>
let
//
val
f2as =
trans2a_f2arglst(env0, f2as)
//
val
dexp =
(
case+ sres of
|S2RESnone() =>
trans2a_d2exp(env0, dexp)
|S2RESsome(seff, sexp) =>
let
val
tres = s2exp_stpize(sexp)
in//let
  trans2a_d2exp_tpck(env0,dexp,tres)
end (*let*) // end of [S2RESsome(...)]
)
//
in
//
d2ecl
(
loc0,
D2Cimplmnt0
( tknd
, sqas,tqas,dimp,tias,f2as,sres,dexp) )
//
end//let//end-of-[ non-DIMPone1( ... ) ]
//
end where
{
//
val loc0 = d2cl.lctn()
//
(*
val (  ) =
prerrln("f0_implmnt0(2a): loc0 = ", loc0)
val (  ) =
prerrln("f0_implmnt0(2a): d2cl = ", d2cl)
*)
//
} (*where*) // end of [f0_implmnt0(env0,d2cl)]
//
(* ****** ****** *)
//
fun
f0_dynconst
( env0:
! tr2aenv
, d2cl: d2ecl): d2ecl =
let
//
(*
val
loc0 = d2cl.lctn()
*)
//
val-
D2Cdynconst
(tknd,tqas,d2cs) = d2cl.node() in d2cl endlet
//
(* ****** ****** *)
//
} (*where*) // end of [trans2a_d2ecl(env0,d2cl)]
//
(* ****** ****** *)
//
(*
#implfun
trans2a_teqd2exp
  (env0, tdxp) =
(
case+ tdxp of
|
TEQD2EXPnone() =>
TEQD2EXPnone((*void*))
|
TEQD2EXPsome(teq1, d2e2) =>
TEQD2EXPsome(teq1, d2e2) where
{ val
  d2e2 = trans2a_d2exp(env0, d2e2) }
) (*case+*)//end-of(trans2a_teqd2exp(...))
*)
//
(* ****** ****** *)

#implfun
trans2a_d2valdcl
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
trans2a_d2pat(env0, dpat)
//
(*
val tdxp = ...
(*handled in trans2a_d2valdclist*)
*)
//
in//let
(
  d2valdcl_make_args(loc0,dpat,tdxp,wsxp) )
end//let
(*let*)//end-of-[trans2a_d2valdcl(env0,dval)]

(* ****** ****** *)

#implfun
trans2a_d2vardcl
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
val tres =
(
case+ sres of
|optn_nil
((*void*)) =>
s2typ_new0_x2tp(loc0)
|optn_cons
(  s2e1  ) =>
s2typ_hnfiz0(s2exp_stpize(s2e1))
) : s2typ // end-of-[ val(tres) ]
val (  ) =
let
val tlft =
s2typ_lft(tres) in dpid.styp(tlft)
end (*let*)
//
val dini =
(
case+ dini of
|
TEQD2EXPnone
( (*void*) ) =>
TEQD2EXPnone((*void*))
|
TEQD2EXPsome
(teq1, d2e2) =>
(
TEQD2EXPsome
(teq1, d2e2)) where
{
val d2e2 =
trans2a_d2exp_tpck(env0,d2e2,tres)
//
(*
HX-2023-08-05: for trans23
*)
val d2e2 =
d2exp(loc0,tres,D2Et2pck(d2e2,tres))
//
} (*where*) // end of [TEQD2EXPsome]
) : teqd2exp // end of [ val( dini ) ]
//
in//let
(
  d2vardcl(loc0, dpid, vpid, sres, dini) )
end//let
(*let*)//end-of-[trans2a_d2vardcl(env0,dvar)]

(* ****** ****** *)

#implfun
trans2a_d2fundcl
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
val f2cl = F2CLfun(*void*)
//
val f2as =
trans2a_f2arglst(env0, f2as)
//
val tres =
(
case+ sres of
|
S2RESnone((*0*)) =>
s2typ_new0_x2tp(loc0)
|
S2RESsome(seff, s2e1) =>
s2typ_hnfiz0(s2exp_stpize(s2e1))
) : s2typ // end of [ val(tres) ]
//
val tfun =
s2typ_fun1_f2arglst(f2as,f2cl,tres)
//
(*
val (  ) = prerrln
("trans2a_d2fundcl: dfun = ", dfun)
val (  ) = prerrln
("trans2a_d2fundcl: tfun = ", tfun)
*)
//
(*
HX-2023:
type-checking the body of the function
is performed in [ trans2a_d2fundclist ]
*)
//
in//let
//
let
val (  ) =
d2var_set_styp(dvar, tfun) in//let
d2fundcl(loc0,dvar,f2as,sres,tdxp,wsxp)
end
//
end where
{
//
(*
val () =
prerrln("trans2a_d2fundcl: dfun = ", dfun)
*)
//
}(*where*)//end-of-[trans2a_d2fundcl(env0,dfun)]

(* ****** ****** *)
//
#implfun
trans2a_d2eclist
  (env0, dcls) =
(
  list_trans2a_fnp(env0, dcls, trans2a_d2ecl))
//
(* ****** ****** *)
//
#implfun
trans2a_s2qaglst
  (env0, sqas) =
(
  list_trans2a_fnp(env0, sqas, trans2a_s2qag))
#implfun
trans2a_t2qaglst
  (env0, tqas) =
(
  list_trans2a_fnp(env0, tqas, trans2a_t2qag))
//
#implfun
trans2a_t2iaglst
  (env0, tias) =
(
  list_trans2a_fnp(env0, tias, trans2a_t2iag))
//
(* ****** ****** *)
//
#implfun
trans2a_d2arglst
  (env0, d2as) =
(
  list_trans2a_fnp(env0, d2as, trans2a_d2arg))
//
(* ****** ****** *)
//
local
//
fun
f0_d2valdcl
( env0:
! tr2aenv
, dval
: d2valdcl): d2valdcl =
let
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
(* ****** ****** *)
//
val tdxp =
(
case+ tdxp of
|
TEQD2EXPnone
( (*void*) ) =>
TEQD2EXPnone((*void*))
|
TEQD2EXPsome
(teq1, d2e2) =>
(
TEQD2EXPsome
(teq1, d2e2)) where
{
//
val tres = dpat.styp((*0*))
//
(*
val (  ) = prerrln
("f0_d2valdcl(2a): dpat = ", dpat)
val (  ) = prerrln
("f0_d2valdcl(2a): tres = ", tres)
*)
//
val d2e2 =
trans2a_d2exp_tpck(env0,d2e2,tres)
//
(*
HX-2023-08-05: for trans23
*)
val d2e2 =
d2exp(loc0,tres,D2Et2pck(d2e2,tres))
//
} (*where*) // end-of-[TEQD2EXPsome]
) : teqd2exp // end-of-[ val( tdxp ) ]
//
(* ****** ****** *)
//
in//let
d2valdcl_make_args(loc0,dpat,tdxp,wsxp)
end//let//end-of-[f0_d2valdcl(env0,...)]
//
in//local
//
#implfun
trans2a_d2valdclist
  (env0, dcls) =
(
list_trans2a_fnp
(env0, dcls, f0_d2valdcl)) where
{
//
val dcls =
list_trans2a_fnp(env0,dcls,trans2a_d2valdcl)}
//
endloc // end of [local(trans2a_d2valdclist)]
//
(* ****** ****** *)
//
#implfun
trans2a_d2vardclist
  (env0, dcls) =
list_trans2a_fnp(env0, dcls, trans2a_d2vardcl)
//
(* ****** ****** *)
//
local
//
fun
f0_tres
( f2as
: f2arglst
, tres: s2typ): s2typ =
(
case+ f2as of
|list_nil() => tres
|list_cons(f2a1, f2as) =>
(
case+
f2a1.node() of
|F2ARGdapp _ =>
let
val-
T2Pfun1
(f2cl,npf1
,t2ps,tres) =
tres.node() in
f0_tres(f2as, tres) end//F2ARGdapp
//
|F2ARGsapp _ =>
(*
let
val-
T2Puni0
(s2vs,tres) =
tres.node() in
f0_tres(f2as, tres) end//F2ARGsapp
*)
f0_tres(f2as, tres) where
{
val tres =
(
case+
tres.node() of
|
T2Puni0
(s2vs,tres) => tres | _ => tres) }
//
|F2ARGmets _ => f0_tres(f2as, tres))
) (*case+*) // end-of-[f0_tres(...)]
//
fun
f0_d2fundcl
( env0:
! tr2aenv
, dfun
: d2fundcl): d2fundcl =
let
//
val loc0 =
d2fundcl_get_lctn(dfun)
val dvar =
d2fundcl_get_dpid(dfun)
val f2as =
d2fundcl_get_farg(dfun)
val tdxp =
d2fundcl_get_tdxp(dfun)
val sres =
d2fundcl_get_sres(dfun)
val wsxp =
d2fundcl_get_wsxp(dfun)
//
(* ****** ****** *)
//
val tdxp =
(
case+ tdxp of
|
TEQD2EXPnone
( (*void*) ) =>
TEQD2EXPnone((*void*))
|
TEQD2EXPsome
(teq1, d2e2) =>
(
TEQD2EXPsome
(teq1, d2e2)) where
{
//
val tres =
f0_tres(f2as, dvar.styp())
(*
val (  ) = prerrln
("f0_d2fundcl(2a): dvar = ", dvar)
val (  ) = prerrln
("f0_d2fundcl(2a): tres = ", tres)
*)
val d2e2 =
trans2a_d2exp_tpck(env0,d2e2,tres)
//
(*
HX-2023-08-05: for trans23
*)
val d2e2 =
d2exp(loc0,tres,D2Et2pck(d2e2,tres))
//
} (*where*) // end-of-[TEQD2EXPsome]
) : teqd2exp // end-of-[ val( tdxp ) ]
//
(* ****** ****** *)
//
in//let
d2fundcl(loc0,dvar,f2as,sres,tdxp,wsxp)
end//let//end-of-[f0_d2fundcl(env0,...)]
//
in//local
//
#implfun
trans2a_d2fundclist
  (env0, dcls) =
(
list_trans2a_fnp
(env0, dcls, f0_d2fundcl)) where
{
//
val dcls =
list_trans2a_fnp(env0,dcls,trans2a_d2fundcl)}
//
endloc // end of [local(trans2a_d2fundclist)]
//
(* ****** ****** *)
//
#implfun
trans2a_d2cstdclist
  (env0, dcls) =
list_trans2a_fnp(env0, dcls, trans2a_d2cstdcl)
//
(* ****** ****** *)
//
#implfun
trans2a_d2eclistopt
( env0, dopt ) =
optn_trans2a_fnp(env0, dopt, trans2a_d2eclist)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans2a_decl00.dats] *)
