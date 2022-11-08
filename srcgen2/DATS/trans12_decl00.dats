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
Sun 11 Sep 2022 03:17:27 PM EDT
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
_(*TRANS12*) = "./trans12.dats"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans12.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with sort1_get_lctn
#symload node with sort1_get_node
(* ****** ****** *)
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
(* ****** ****** *)
#symload lctn with s1tdf_get_lctn
#symload node with s1tdf_get_node
(* ****** ****** *)
#symload lctn with s1tcn_get_lctn
#symload node with s1tcn_get_node
(* ****** ****** *)
#symload lctn with d1tst_get_lctn
#symload node with d1tst_get_node
(* ****** ****** *)
#symload lctn with d1pat_get_lctn
#symload node with d1pat_get_node
(* ****** ****** *)
#symload lctn with d1exp_get_lctn
#symload node with d1exp_get_node
(* ****** ****** *)
#symload lctn with d1ecl_get_lctn
#symload node with d1ecl_get_node
(* ****** ****** *)
//
fun
abstknd_sort2
(tknd: token): sort2 =
(
if
(knd0=PROPSORT)
then the_sort2_prop else
if
(knd0=VIEWSORT)
then the_sort2_view else
if
(knd0=TBOXSORT)
then the_sort2_tbox else
if
(knd0=TYPESORT)
then the_sort2_type else
if
(knd0=VTBXSORT)
then the_sort2_vtbx else
if
(knd0=VWTPSORT)
then the_sort2_vwtp else S2Tnone0()
) where
{
  val-T_ABSTYPE(knd0) = tknd.node()
} (*where*) // end of [abstknd_sort2(tknd)]
//
(* ****** ****** *)

#implfun
trans12_d1ecl
( env0,d1cl ) = let
//
(*
val
loc0 = d1cl.lctn()
val () =
prerrln
("trans12_d1ecl: d1cl = ", d1cl)
*)
//
in//let
//
case+
d1cl.node() of
//
|D1Cd0ecl _ =>
let
val loc0 = d1cl.lctn()
in//let
d2ecl(loc0, D2Cd1ecl(d1cl))
end (*let*) // end of [D1Cd0ecl]
//
|
D1Cstatic
(tknd, dcl1) =>
let
val loc0 = d1cl.lctn()
val dcl1 =
trans12_d1ecl(env0, dcl1)
in//let
d2ecl(loc0, D2Cstatic(tknd, dcl1))
end (*let*) // end of [D1Cstatic]
|
D1Cextern
(tknd, dcl1) =>
let
val loc0 = d1cl.lctn()
val dcl1 =
trans12_d1ecl(env0, dcl1)
in//let
d2ecl(loc0, D2Cextern(tknd, dcl1))
end (*let*) // end of [D1Cextern]
//
|
D1Clocal0 _ => f0_local0(env0, d1cl)
//
|
D1Cabssort _ => f0_abssort(env0, d1cl)
|
D1Cstacst0 _ => f0_stacst0(env0, d1cl)
//
|
D1Csortdef _ => f0_sortdef(env0, d1cl)
//
|
D1Csexpdef _ => f0_sexpdef(env0, d1cl)
//
|
D1Cabstype _ => f0_abstype(env0, d1cl)
//
|
D1Cdatasort _ => f0_datasort(env0, d1cl)
//
|
D1Cvaldclst _ => f0_valdclst(env0, d1cl)
|
D1Cvardclst _ => f0_vardclst(env0, d1cl)
|
D1Cfundclst _ => f0_fundclst(env0, d1cl)
//
|_(*otherwise*) =>
let
val loc0 = d1cl.lctn()
in//let
  d2ecl_make_node( loc0, D2Cnone1( d1cl ) )
end (*let*) // end of [_(*otherwise*)] // temp
//
end where
{
//
(* ****** ****** *)
fun
f0_local0
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Clocal0
(head, body) = d1cl.node()
//
val (  ) =
tr12env_pshloc1(env0)
val head =
trans12_d1eclist(env0, head)
val (  ) =
tr12env_pshloc2(env0)
val body =
trans12_d1eclist(env0, body)
//
val (  ) = tr12env_locjoin(env0)
//
in//let
d2ecl(loc0, D2Clocal0(head, body))
end (*let*) // end of [f0_local0(env0,d1cl)]
(* ****** ****** *)
//
fun
f0_abssort
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Cabssort
(tknd, tok1) = d1cl.node()
//
in//let
//
let
val tid1 =
  sortid_sym(tok1)
val tabs =
  t2abs_make_name(tid1)
val s2tx =
  S2TEXsrt(S2Tbas(T2Btabs(tabs)))
//
in
d2ecl_make_node
(loc0, D2Cabssort(tid1)) where
{
val () =
tr12env_add0_s2tex(env0, tid1, s2tx) }
end (*let*)
//
end (*let*) // end of [f0_abssort(env0,d1cl)]
//
(* ****** ****** *)
//
fun
f0_stacst0
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Cstacst0
( tknd
, tok1
, tmas, tres) = d1cl.node()
//
fun
auxtfun
( tres
: sort2
, stss
: sort2lstlst): sort2 =
(
case+ stss of
|
list_nil() => tres
|
list_cons(s2ts, stss) =>
(
  auxtfun(tres, stss)) where
{
val tres = S2Tf1un(s2ts, tres)
}
)
//
in//let
//
let
//
val
sid1 = sexpid_sym(tok1)
val
stss =
trans12_t1maglst(env0, tmas)
//
val s2t2 =
(
  auxtfun(tres, stss)
) where
{ val
  tres =
  trans12_sort1(env0, tres) }
//
val s2c1 =
s2cst_make_idst(loc0, sid1, s2t2)
//
in//let
//
d2ecl_make_node
(loc0, D2Cstacst0(s2c1, s2t2)) where
{
val () = tr12env_add1_s2cst(env0, s2c1) }
//
end (*let*)
//
end (*let*) // end of [f0_stacst0(env0,d1cl)]
//
(* ****** ****** *)
//
fun
f0_sortdef
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Csortdef
( tknd
, tok1, stdf) = d1cl.node()
//
in//let
//
case+
stdf.node() of
|
S1TDFsort(s1t1) =>
let
val s2t1 =
trans12_sort1(env0, s1t1)
val s2tx = S2TEXsrt(s2t1)
in//let
d2ecl_make_node
( loc0
, D2Csortdef(tid1, s2tx)) where
{
val
tid1 = sortid_sym(tok1)
val () =
tr12env_add0_s2tex(env0, tid1, s2tx) }
end (*let*) // end of [S1TDFsort(s1t1)]
//
|
S1TDFtsub(s1a1, s1es) =>
let
val
(s2v1, sps1) =
trans12_s1arg_tsub
(   env0, s1a1   )
//
val () =
tr12env_pshlam0(env0)
val () =
tr12env_add0_s2var
(     env0, s2v1     )
val sps2 =
trans12_s1explst_stck1
(  env0, s1es, s2t0  ) where
{
  val s2t0 = the_sort2_bool }
val () = tr12env_poplam0(env0)
//
val s2ps =
list_append(sps1, sps2)
val s2tx = S2TEXsub(s2v1, s2ps)
in//let
d2ecl_make_node
( loc0
, D2Csortdef(tid1, s2tx)) where
{
val
tid1 = sortid_sym(tok1)
val () =
tr12env_add0_s2tex(env0, tid1, s2tx) }
end (*let*) // end of [S1TDFtsub(s1a1,s1es)]
//
end (*let*) // end of [f0_sortdef(env0,d1cl)]
//
(* ****** ****** *)
//
fun
f0_sexpdef
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Csexpdef
( tknd
, tok1
, smas
, topt, sdef) = d1cl.node()
//
(*
val () =
prerrln
("f0_sexpdef: smas=", smas)
val () =
prerrln
("f0_sexpdef: sdef=", sdef)
*)
//
val
svss =
trans12_s1maglst(env0, smas)
//
val () =
tr12env_pshlam0(env0)
//
val () =
auxloop(env0, svss) where
{
fun
auxloop
( env0:
! tr12env
, svss: s2varlstlst): void =
(
case+ svss of
|
list_nil() => ()
|
list_cons(s2vs, svss) =>
(
  auxloop(env0, svss)) where
{
val () =
tr12env_add0_s2varlst(env0,s2vs)
}
) (*case+*)
} (*where*)//end-of-[auxloop(env0,svss)]
//
val
sdef =
(
case+ topt of
|
optn_nil() =>
trans12_s1exp(env0, sdef)
|
optn_cons(s1t1) =>
let
val s2t1 =
trans12_sort1(env0, s1t1)
in//let
trans12_s1exp_stck(env0, sdef, s2t1)
endlet // end of [optn_cons]
)
//
(*
val () =
prerrln
("f0_sexpdef: sdef=", sdef)
*)
//
val () = tr12env_poplam0(env0)
//
val sdef =
(
auxslam
(sdef, svss)) where
{
fun
auxslam
( sdef
: s2exp
, svss
: s2varlstlst): s2exp =
(
case+ svss of
|
list_nil() => sdef
|
list_cons(s2vs, svss) =>
(
auxslam(sdef, svss)) where
{
val
sdef = s2exp_lam0(s2vs, sdef) }
) (*case+*) // end-of-[auxslam]
} (*where*) // end-of-[val sdef]
//
(*
val () =
prerrln
("f0_sexpdef: sdef=", sdef)
*)
//
val s2c1 =
s2cst_make_idst
(loc0, sid1, s2t2) where
{
  val s2t2 = sdef.sort()
  val sid1 = sexpid_sym(tok1) }
//
in//let
d2ecl_make_node
( loc0
, D2Csexpdef(s2c1, sdef)) where
{ val () =
  tr12env_add1_s2cst(env0, s2c1) }
end (*let*) // end of [f0_sexpdef(env0,d1cl)]
//
(* ****** ****** *)
//
fun
f0_abstype
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Cabstype
( tknd // kind
, tok1
, tmas
, topt, atdf) = d1cl.node()
//
val
sid1 = sexpid_sym(tok1)
val
stss =
trans12_t1maglst(env0, tmas)
//
val tres =
(
case topt of
| optn_nil() =>
  abstknd_sort2(tknd)
| optn_cons(s1t1) =>
  trans12_sort1(env0, s1t1)
) : sort2 //  end-of-val(tres)
//
val tfun =
f1_stss(stss, tres) where
{
fun
f1_stss
( stss
: sort2lstlst
, tres: sort2): sort2 =
(
case+ stss of
|
list_nil() => tres
|
list_cons
(s2ts, stss) =>
S2Tf1un
(s2ts, f1_stss(stss, tres)))
}
//
val () =
prerrln
("f0_abstype: tfun = ", tfun)
//
in//let
let
val s2c1 =
s2cst_make_idst(loc0, sid1, tfun)
val atdf =
trans12_a1tdf_stck(env0, atdf, tres)
in//let
  d2ecl(loc0, D2Cabstype(s2c1, atdf))
end (*let*)
end (*let*) // end of [f0_abstype(env0,d1cl)]
//
(* ****** ****** *)
//
fun
f0_datasort
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Cdatasort
( tknd
, d1ts) = d1cl.node()
//
val s2ts = f1_d1ts(d1ts)
//
in//let
d2ecl_make_node
(loc0, D2Cdatasort(d1cl, s2ts))
end where
{
//
fun
f1_d1t0
(d1t0: d1tst): sort2 =
let
//
val
D1TSTnode
(tok1, tcns) = d1t0.node()
//
val tid1 = sortid_sym(tok1)
//
local
val
s2td =
t2dat_make_name(tid1)
in//local
val
s2t1 = S2Tbas(T2Btdat(s2td))
end//local
//
in//let
(
  s2t1 ) where
{
  val () =
  tr12env_add0_s2tex
  (env0, tid1, S2TEXsrt(s2t1)) }
end (*let*) // end of [f1_d1t0(d1t0)]
//
fun
f1_d1ts
(d1ts: d1tstlst): sort2lst =
list_map<x0><y0>(d1ts) where
{
 #typedef x0 = d1tst
 #typedef y0 = sort2
 #impltmp map$fopr<x0><y0> = f1_d1t0 }
//
(* ****** ****** *)
//
fun
f2_d1t0
( env0:
! tr12env
, d1t0: d1tst
, s2t0: sort2): void =
let
//
val-
S2Tbas(s2tb) = s2t0
val-
T2Btdat(tdat) = s2tb
//
fun
loop
( env0:
! tr12env
, tcns
: s1tcnlst
, s2cs
: s2cstlst_vt): void =
(
//
case+ tcns of
|
list_nil() =>
let
val s2cs =
list_vt2t
(list_vt_reverse0(s2cs))
in//let
t2dat_set_s2cs(tdat, s2cs)
end (*let*) // list_nil
|
list_cons(tcn1, tcns) =>
let
//
val+
S1TCNnode
( tok1
, topt) = tcn1.node()
//
val
sid1 = sexpid_sym(tok1)
//
val
targ =
(
case+ topt of
|
optn_nil() => list_nil()
|
optn_cons(s1t1) =>
(
case+ s1t1.node() of
|
S1Tlist(s1ts) =>
trans12_sort1lst(env0, s1ts)
| _(*non-S1Tlist*) =>
(
  list_sing(s2t1)) where
{ val
  s2t1 =
  trans12_sort1(env0, s1t1) }
) : sort2lst // end of [val(targ)]
)
val
loc1 = tcn1.lctn()
val
tfun = S2Tf1un(targ, s2t0)
val
s2c1 =
s2cst_make_idst(loc1, sid1, tfun)
(*
val () =
println!("f2_d1t0: tok1 = ", tok1)
val () =
println!("f2_d1t0: tfun = ", tfun)
val () =
println!("f2_d1t0: s2c1 = ", s2c1)
*)
in
  loop(env0, tcns, s2cs) where
{
//
val
s2cs = list_vt_cons(s2c1, s2cs)
//
val () = tr12env_add1_s2cst(env0, s2c1) }
end // end of [list_cons]
) (*case+*) // end of [ loop(env0,tcns) ]
in//let
//
loop
(env0, tcns, s2cs) where
{
val s2cs = list_vt_nil()
val+D1TSTnode(tok0, tcns) = d1t0.node() }
//
end (*let*) // end of [f2_d1t0(d1t0,s2t0)]
//
fun
f2_d1ts
( env0:
! tr12env
, d1ts: d1tstlst
, s2ts: sort2lst): void =
(
case+ d1ts of
|
list_nil() => ()
|
list_cons(d1t1, d1ts) =>
let
val-
list_cons
(s2t1, s2ts) = s2ts
val () =
f2_d1t0(env0, d1t1, s2t1)
in//let
f2_d1ts(env0, d1ts, s2ts) end 
) (*case+*) // end of [f2_d1ts(env0,...)]
//
} (*where*) // end of [f0_datasort(env0,d1cl)]
//
(* ****** ****** *)

fun
f0_valdclst
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Cvaldclst
(tknd, d1vs) = d1cl.node()
//
val d2vs =
trans12_d1valdclist(env0, d1vs)
//
in//let
  d2ecl(loc0, D2Cvaldclst(tknd, d2vs))
end (*let*) // end of [f0_valdclst(env0,d1cl)]

(* ****** ****** *)

fun
f0_vardclst
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Cvardclst
(tknd, d1vs) = d1cl.node()
//
val d2vs =
trans12_d1vardclist(env0, d1vs)
//
in//let
  d2ecl(loc0, D2Cvardclst(tknd, d2vs))
end (*let*) // end of [f0_vardclst(env0,d1cl)]

(* ****** ****** *)

fun
f0_fundclst
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Cfundclst
( tknd
, tqas, d1fs) = d1cl.node()
//
val tqas =
trans12_t1qaglst(env0, tqas)
val d2fs =
trans12_d1fundclist(env0, d1fs)
//
in//let
  d2ecl(loc0, D2Cfundclst(tknd, tqas, d2fs))
end (*let*) // end of [f0_fundclst(env0,d1cl)]

(* ****** ****** *)
//
} (*where*) // end of [trans12_d1ecl(env0,d1cl)]

(* ****** ****** *)
//
#implfun
trans12_a1tdf_stck
(env0, atdf, tres) =
(
case+ atdf of
|
A1TDFsome() =>
A2TDFsome()
|
A1TDFlteq(s1e1) =>
A2TDFlteq
(s2exp_impr(loc0, s2e1)) where
{
val loc0 = s1e1.lctn()
val s2e1 =
trans12_s1exp_stck(env0, s1e1, tres)
}
|
A1TDFeqeq(s1e1) =>
A2TDFeqeq
(s2exp_impr(loc0, s2e1)) where
{
val loc0 = s1e1.lctn()
val s2e1 =
trans12_s1exp_stck(env0, s1e1, tres)
}
) (*case+*) // end of [trans12_a1tdf_stck(env0,...)]
//
(* ****** ****** *)

#implfun
trans12_d1valdcl
  (env0, dval) =
let
//
val loc0 =
d1valdcl_get_lctn(dval)
//
val dpat =
d1valdcl_get_dpat(dval)
val dpat =
trans12_d1pat(env0, dpat)
//
val tdxp =
d1valdcl_get_tdxp(dval)
val tdxp =
trans12_teqd1exp(env0, tdxp)
//
val wsxp =
d1valdcl_get_wsxp(dval)
val wsxp =
trans12_wths1exp(env0, wsxp)
//
val (  ) = //HX:non-recursive
tr12env_add0_d2pat(env0, dpat)
//
in//let
d2valdcl_make_args(loc0, dpat, tdxp, wsxp)
end (*let*)//end-of-[trans12_d1valdcl(env0,dval)]

(* ****** ****** *)

#implfun
trans12_d1vardcl
  (env0, dvar) =
let
//
val loc0 =
d1vardcl_get_lctn(dvar)
//
val dpid =
d1vardcl_get_dpid(dvar)
val dpid =
trans12_d1pid(env0, dpid)
//
val vpid =
d1vardcl_get_vpid(dvar)
val vpid =
trans12_d1pidopt(env0, vpid)
//
val sres =
d1vardcl_get_sres(dvar)
val sres =
trans12_s1expopt(env0, sres)
//
val dini =
d1vardcl_get_dini(dvar)
val dini =
trans12_teqd1exp(env0, dini)
//
val (  ) = //HX:non-recursive
tr12env_add0_d2var(env0, dpid)
val (  ) = //HX:non-recursive
tr12env_add0_d2varopt(env0, vpid)
//
in//let
d2vardcl_make_args(loc0,dpid,vpid,sres,dini)
end (*let*) // end of [trans12_d1vardcl(env0, dvar)]

(* ****** ****** *)

#implfun
trans12_d1fundcl
  (env0, dfun) =
let
//
val loc0 =
d1fundcl_get_lctn(dfun)
//
val dpid =
d1fundcl_get_dpid(dfun)
//
val farg =
d1fundcl_get_farg(dfun)
val sres =
d1fundcl_get_sres(dfun)
//
val wsxp =
d1fundcl_get_wsxp(dfun)
val tdxp =
d1fundcl_get_tdxp(dfun)
//
val () =
tr12env_pshlam0(env0)//enter
//
val dpid =
trans12_d1pid(env0, dpid)
//
val wsxp =
trans12_wths1exp(env0, wsxp)
//
val farg =
trans12_f1arglst(env0, farg)
//
val
sres = trans12_s1res(env0, sres)
//
val () =
tr12env_add0_f2arglst(env0,farg)
//
val
tdxp = trans12_teqd1exp(env0, tdxp)
//
val () = tr12env_poplam0(env0)//exit
//
in//let
d2fundcl(loc0, dpid, farg, sres, tdxp, wsxp)
end (*let*)//end-of-[trans12_d1fundcl(env0,dfun)]

(* ****** ****** *)

#implfun
trans12_d1eclist
  (env0, dcls) =
(
list_trans12_fnp(env0, dcls, trans12_d1ecl))

(* ****** ****** *)
//
#implfun
trans12_d1eclistopt
  (  env0,dopt  ) =
(
optn_trans12_fnp(env0, dopt, trans12_d1eclist))
//
(* ****** ****** *)

#implfun
trans12_d1valdclist
  (env0, d1vs) =
(
list_trans12_fnp(env0, d1vs, trans12_d1valdcl))

(* ****** ****** *)

#implfun
trans12_d1vardclist
  (env0, d1vs) =
(
list_trans12_fnp(env0, d1vs, trans12_d1vardcl))

(* ****** ****** *)

#implfun
trans12_d1fundclist
  (env0, d1fs) =
(
list_trans12_fnp(env0, d1fs, trans12_d1fundcl))

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans12_decl00.dats] *)
