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
Wed Dec 27 18:03:19 EST 2023
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
_(*TRANS34*) = "./trans34.dats"
(* ****** ****** *)
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp4.sats"
(* ****** ****** *)
#staload "./../SATS/trans34.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload node with s2typ_get_node
(* ****** ****** *)
#symload styp with d2var_get_styp
(* ****** ****** *)
#symload lctn with f3arg_get_lctn
#symload node with f3arg_get_node
(* ****** ****** *)
#symload lctn with d3ecl_get_lctn
#symload node with d3ecl_get_node
(* ****** ****** *)
(* ****** ****** *)
//
fun
d4exp_dvts
( d4e0: d4exp
, dvts: d2vts): d4exp =
let
//
  val loc0 = d4e0.lctn()
  val t2p0 = d4e0.styp()
//
in//let
(
d4exp_make_tpnd
(loc0,t2p0,D4Edvts(d4e0, dvts)))
end//let//end-of-[d4exp_dvts(...)]
//
(* ****** ****** *)
//
fun
d4exp_farg
( d4e0: d4exp
, f4as: f4arglst): d4exp =
let
//
  val loc0 = d4e0.lctn()
  val t2p0 = d4e0.styp()
//
in//let
(
d4exp_make_tpnd
(loc0,t2p0,D4Efarg(d4e0, f4as)))
end//let//end-of-[d4exp_farg(...)]
//
(* ****** ****** *)
//
fun
d4exp_get_dvts
( d4e0: d4exp): d2vts =
(
case+
d4e0.node() of
|
D4Edvts(_, dvts) => dvts
|
_(* non-D4Edvts *) => list_nil())
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3ecl
  (env0, d3cl) =
(
case+
d3cl.node() of
//
|D3Clocal0 _ =>
(
  f0_local0(env0, d3cl))
//
|D3Cvaldclst _ =>
(
  f0_valdclst(env0, d3cl))
|D3Cvardclst _ =>
(
  f0_vardclst(env0, d3cl))
//
|D3Cfundclst _ =>
(
  f0_fundclst(env0, d3cl))
//
| _(*otherwise*) =>
let
  val loc0 = d3cl.lctn((*0*))
in//let
  d4ecl_make_node(loc0, D4Cnone1( d3cl ))
end (*let*) // end of [_(*otherwise*)] // temp
//
) where
{
//
(* ****** ****** *)
//
fun
f0_local0
( env0: 
! tr34env
, d3cl: d3ecl): d4ecl =
let
//
val loc0 = d3cl.lctn()
//
val-
D3Clocal0
(head, body) = d3cl.node()
//
val
head =
trans34_d3eclist(env0, head)
val
body =
trans34_d3eclist(env0, body)
//
in//let
//
(
d4ecl(loc0, D4Clocal0(head, body)))
//
end//let//end-of-[f0_local0(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_valdclst
( env0:
! tr34env
, d3cl: d3ecl): d4ecl =
let
//
val-
D3Cvaldclst
(tknd, d3vs) = d3cl.node()
//
val
d4vs =
trans34_d3valdclist(env0, d3vs)
//
in//let
  d4ecl(loc0, D4Cvaldclst(tknd, d4vs))
end where
{
//
val loc0 = d3cl.lctn()
(*
val (  ) =
prerrln("f0_valdclst(34): d3cl = ", d3cl)
*)
//
}(*where*) // end of [f0_valdclst(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( env0:
! tr34env
, d3cl: d3ecl): d4ecl =
let
//
val-
D3Cvardclst
(tknd, d3vs) = d3cl.node()
//
val
d4vs =
trans34_d3vardclist(env0, d3vs)
//
in//let
  d4ecl(loc0, D4Cvardclst(tknd, d4vs))
end where
{
//
val loc0 = d3cl.lctn()
(*
val (  ) =
prerrln("f0_vardclst(34): d3cl = ", d3cl)
*)
//
}(*where*) // end of [f0_vardclst(env0,d3cl)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( env0:
! tr34env
, d3cl: d3ecl): d4ecl =
let
//
val-
D3Cfundclst
( tknd
, tqas
, d2cs, d3fs) = d3cl.node()
//
val
d4fs =
trans34_d3fundclist(env0, d3fs)
//
in//let
d4ecl_make_node
( loc0
, D4Cfundclst(tknd, tqas, d2cs, d4fs) )
end where
{
//
val loc0 = d3cl.lctn()
(*
val (  ) =
prerrln("f0_fundclst(34): d3cl = ", d3cl)
*)
//
}(*where*) // end of [f0_fundclst(env0,d3cl)]
//
(* ****** ****** *)
(* ****** ****** *)
//
val () =
(
  prerrln("trans34_d3ecl: d3cl = ", d3cl) )
//
} (*where*) // end-of-[trans34_d3ecl(env0,d3cl)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_teqd3exp
  (env0, tdxp) =
(
case+ tdxp of
|
TEQD3EXPnone() =>
TEQD4EXPnone((*void*))
|
TEQD3EXPsome(teq1, d3e2) =>
TEQD4EXPsome(teq1, d4e2) where
{ val
  d4e2 = trans34_d3exp(env0, d3e2) }
)(*case+*)//end-of-(trans23_teqd3exp(env0,tdxp))
//
(* ****** ****** *)
//
#implfun
trans34_d3valdcl
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
trans34_d3pat(env0, dpat)
//
val tdxp =
(
  trans34_teqd3exp(env0, tdxp))
//
val darg =
(
case+ tdxp of
|TEQD4EXPnone() =>
(
  d4exp_none0(loc0))
|
TEQD4EXPsome(teq0, dexp) =>
let
val () =
tr34env_insert_dpat(env0, dpat)
in//let
trans34_d4arg_dpat(env0, dexp, dpat)
end//let//end-of-[TEQD4EXPsome(teq0,d4e1)]
)
//
in//let
d4valdcl_make_args(loc0,dpat,darg,tdxp,wsxp)
end(*let*)//end-of-[trans34_d3valdcl(env0,dval)]
//
(* ****** ****** *)
//
#implfun
trans34_d3vardcl
  (env0, dvar) = let
//
val loc0 =
d3vardcl_get_lctn(dvar)
val dpid =
d3vardcl_get_dpid(dvar)
val vpid =
d3vardcl_get_vpid(dvar)
val sres =
d3vardcl_get_sres(dvar)
val dini =
d3vardcl_get_dini(dvar)
//
val dini =
trans34_teqd3exp(env0, dini)
//
in//let
d4vardcl_make_args(loc0,dpid,vpid,sres,dini)
end(*let*)//end-of-[trans34_d3vardcl(env0,dvar)]
//
(* ****** ****** *)
//
#implfun
trans34_d3fundcl
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
val (  ) = // enter
tr34env_pshlam0(env0)//enter
//
(*
val (  ) = prerrln
("trans34_d3fundcl: f3as = ", f3as)
val (  ) = prerrln
("trans34_d3fundcl: tdxp = ", tdxp)
*)
//
val f4as =
trans34_f3arglst(env0, f3as)
//
val tdxp =
(
case+ tdxp of
|
TEQD3EXPnone
( (*void*) ) =>
TEQD4EXPnone((*void*))
|
TEQD3EXPsome
(teq1, d3e2) =>
(
TEQD4EXPsome
(teq1, d4e2)) where
{
//
val tres =
f0_tres(f3as, dvar.styp())
//
(*
val (  ) = prerrln(
"f0_d3fundcl(34): dvar = ", dvar)
val (  ) = prerrln(
"f0_d3fundcl(34): tres = ", tres)
*)
//
val (  ) =
tr34env_insert_farglst(env0, f4as)
//
val d4e2 =
(
  d4exp_farg(d4e2, f4as)) where
{
val
d4e2 =
trans34_d3exp_tpck(env0,d3e2,tres)
val
f4as = trans34_f4aftlst(env0,f4as)}
}
) (*case+*) // end-of-[ val(tdxp) ]
//
(*
val (  ) = prerrln
("trans34_d3fundcl: f3as = ", f3as)
val (  ) = prerrln
("trans34_d3fundcl: tdxp = ", tdxp)
*)
//
in//let
//
let
//
val dvts =
tr34env_getlam0(env0)
//
val tdxp =
(
case+ dvts of
|
list_nil() => tdxp
|
list_cons _ =>
let
val-
TEQD4EXPsome
(teq1, d4e2) = tdxp
in//let
TEQD4EXPsome
( teq1
, d4exp_dvts(d4e2, dvts)) end)
//
val dvts =
(
case+ tdxp of
|
TEQD4EXPnone() =>
list_nil((*void*))
|
TEQD4EXPsome
(teq1, d4e2) =>
d4exp_get_dvts(d4e2)): d2vts
//
val d2vs =
(
  tr34env_lamvars(env0))
val dvts =
(
   d2vts_drop_vars(dvts, d2vs))
//
val (  ) =
prerrln("\
trans34_d3fundcl: d2vs = ", d2vs)
val (  ) =
prerrln("\
trans34_d3fundcl: dvts = ", dvts)
//
val (  ) =
  tr34env_poplam0(env0)
val (  ) =
  tr34env_d2vins_dvts(env0, dvts)
//
in//let
//
d4fundcl
( loc0,dvar
, f4as,sres, tdxp,wsxp, d2vs,dvts)
end//let
//
end where
{
//
fun
f0_tres
( f3as
: f3arglst
, tres: s2typ): s2typ =
(
case+ f3as of
|list_nil() => tres
|list_cons(f3a1, f3as) =>
(
case+
f3a1.node() of
|F3ARGdapp _ =>
let
val-
T2Pfun1
(f3cl,npf1
,t2ps,tres) =
tres.node() in
f0_tres(f3as, tres) end//F3ARGdapp
//
|F3ARGsapp _ =>
(*
let
val-
T2Puni0
(s2vs,tres) =
tres.node() in
f0_tres(f3as, tres) end//F3ARGsapp
*)
f0_tres(f3as, tres) where
{
val tres =
(
case+
tres.node() of
|
T2Puni0
(s2vs,tres) => tres | _ => tres) }
//
|F3ARGmets _ => f0_tres(f3as, tres))
)(*case+*)//end-of-[f0_tres(f3as,tres)]
//
}(*where*)//end-of-[trans34_d3fundcl(env0,dfun)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3eclist
  (env0, dcls) =
(
  list_trans34_fnp(env0, dcls, trans34_d3ecl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d4ecl_fold
  ( env0 , d4cl ) =
(
case+
d4cl.node() of
|D4Cvaldclst _ =>
(
  f0_valdclst(env0, d4cl))
|
_(*non-D4Cvaldclst*) => ((*void*))
) where
{
//
fun
f0_valdclst
( env0:
! tr34env
, d4cl: d4ecl): void =
let
//
val-
D4Cvaldclst
(tknd, d4vs) = d4cl.node()
//
in//let
(
foreach(env0, d4vs)) where
{
fun
foreach
( env0:
! tr34env
, d4vs: d4valdclist): void =
(
case+ d4vs of
|list_nil() => ()
|list_cons(d4v1, d4vs) =>
(
  foreach(env0, d4vs)) where
{ val () =
  trans34_d4valdcl_fold(env0, d4v1) }
)(*case+*)
}(*where*)//end-of-[foreach(env0,d4vs)]
end(*let*)//end-of-[f0_valdclst( ... )]
//
val (  ) = prerrln
  ("trans34_d4ecl_fold: d4cl = ", d4cl)
//
}(*where*) // end-of-[trans34_d4ecl_fold(...)]
//
(* ****** ****** *)

#implfun
trans34_d4valdcl_fold
  ( env0 , dval ) =
let
val darg =
(
  d4valdcl_get_darg(dval))
val darg =
trans34_d4exp_fold(env0, darg)
in//let
(
  d4valdcl_set_darg(dval, darg))
end where
{
//
val (  ) = prerrln
  ("trans34_d4valdcl_fold: dval = ", dval)
//
}(*where*) // end-of-[trans34_d4ecl_fold(...)]

(* ****** ****** *)
//
#implfun
trans34_d4eclist_fold
  ( env0 , dcls ) =
(
list_foreach_e1nv
<x0><e1>(dcls, env0)) where
{
(*
HX-2024-03-01:
tqdes = list(tqd4e)
*)
#typedef x0 = d4ecl
#vwtpdef e1 = tr34env
#impltmp
foreach$work_e1nv<x0><e1>
(d4cl, env0) = trans34_d4ecl_fold(env0, d4cl)
} (*where*) // end of [list_trans34_fnp(e1,xs,fopr)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3valdclist
  (env0, d3vs) =
(
list_trans34_fnp(env0, d3vs, trans34_d3valdcl))
//
#implfun
trans34_d3vardclist
  (env0, d3vs) =
(
list_trans34_fnp(env0, d3vs, trans34_d3vardcl))
//
(* ****** ****** *)
//
#implfun
trans34_d3fundclist
  (env0, d3fs) =
(
list_trans34_fnp(env0, d3fs, trans34_d3fundcl))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
trans34_d3eclistopt
  (  env0,dopt  ) =
(
optn_trans34_fnp(env0, dopt, trans34_d3eclist))
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans34_decl00.dats] *)
