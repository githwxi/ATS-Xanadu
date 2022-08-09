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
Tue Jul 26 12:37:48 EDT 2022
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
_(*TRANS01*) = "./trans01.dats"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/xfixity.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with i0dnt_get_lctn
#symload node with i0dnt_get_node
(* ****** ****** *)
#symload lctn with s0tdf_get_lctn
#symload node with s0tdf_get_node
(* ****** ****** *)
#symload lctn with d0pat_get_lctn
#symload node with d0pat_get_node
(* ****** ****** *)
#symload lctn with d0exp_get_lctn
#symload node with d0exp_get_node
(* ****** ****** *)
#symload lctn with d0ecl_get_lctn
#symload node with d0ecl_get_node
(* ****** ****** *)
#symload lctn with q0arg_get_lctn
#symload node with q0arg_get_node
#symload lctn with s0qag_get_lctn
#symload node with s0qag_get_node
#symload lctn with t0qag_get_lctn
#symload node with t0qag_get_node
(* ****** ****** *)
//
#implfun
trans01_q0arg
  (tenv, q0a0) =
(
case+
q0a0.node() of
|
Q0ARGsome(sid0, tres) =>
let
val sid0 =
trans01_i0dnt(tenv, sid0)
val tres =
trans01_sort0opt(tenv, tres)
in//let
q1arg_make_node
(q0a0.lctn(),Q1ARGsome(sid0,tres))
end (*let*)//end-of(Q0ARGsome(_,_))
)
//
(* ****** ****** *)
//
#implfun
trans01_s0qag
  (tenv, sqa0) =
(
case+
sqa0.node() of
|
S0QAGnone(tok) =>
let
val
q1as = list_nil() in
s1qag_make_node
(sqa0.lctn(),S1QAGsome(q1as))
end // end of [S0QAGnone(tok)]
|
S0QAGsome
(tbeg,q0as,tend) =>
let
val
q1as =
trans01_q0arglst(tenv, q0as)
in//let
s1qag_make_node
(sqa0.lctn(),S1QAGsome(q1as))
end (*let*)//end-of(S0QAGsome(...))
)
//
(* ****** ****** *)
//
#implfun
trans01_t0qag
  (tenv, tqa0) =
(
case+
tqa0.node() of
|
T0QAGnone(tok) =>
let
val
q1as = list_nil() in
t1qag_make_node
(tqa0.lctn(),T1QAGsome(q1as))
end // end of [T0QAGnone(tok)]
|
T0QAGsome
(tbeg,q0as,tend) =>
let
val
q1as =
trans01_q0arglst(tenv, q0as)
in//let
t1qag_make_node
(tqa0.lctn(),T1QAGsome(q1as))
end (*let*)//end-of(T0QAGsome(...))
)
//
(* ****** ****** *)

#implfun
trans01_d0ecl
(tenv, d0cl) = let
//
// (*
val
loc0 = d0cl.lctn()
val () =
prerrln
("trans01_decl: d0cl = ", d0cl)
// *)
//
in//let
//
case+
d0cl.node() of
//
|
D0Cfixity _ =>
f0_fixity(tenv, d0cl)
|
D0Cnonfix _ =>
f0_nonfix(tenv, d0cl)
//
|
D0Cstatic _ =>
f0_static(tenv, d0cl)
|
D0Cextern _ =>
f0_extern(tenv, d0cl)
//
|
D0Cabssort _ =>
f0_abssort(tenv, d0cl)
|
D0Cstacst0 _ =>
f0_stacst0(tenv, d0cl)
//
|
D0Csortdef _ =>
f0_sortdef(tenv, d0cl)
|
D0Csexpdef _ =>
f0_sexpdef(tenv, d0cl)
//
|
D0Cabstype _ =>
f0_abstype(tenv, d0cl)
|
D0Cabsopen _ =>
f0_absopen(tenv, d0cl)
|
D0Cabsimpl _ =>
f0_absimpl(tenv, d0cl)
//
|
D0Cdatasort _ =>
f0_datasort(tenv, d0cl)
//
|
D0Cvaldclst _ =>
f0_valdclst(tenv, d0cl)
|
D0Cvardclst _ =>
f0_vardclst(tenv, d0cl)
//
|
D0Cdatatype _ =>
f0_datatype(tenv, d0cl)
//
|
D0Cdynconst _ =>
f0_dynconst(tenv, d0cl)
//
|
_ (*otherwise*) => d1ecl_none1(d0cl)
//
end where
{
(* ****** ****** *)
//
fun
f0_fixity
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
val-
D0Cfixity
(tknd
,id0s,popt)= d0cl.node()
//
val-
T_SRP_FIXITY
(  knd0  ) = tknd.node()
//
val pval =
prcdv_encode
( h1precopt(tenv,popt) )
//
val fxty =
(
if
(knd0=KINFIX0)
then
FIXTYinf(pval, ASSOCnon)
else
(
if
(knd0=KINFIXL)
then
FIXTYinf(pval, ASSOClft)
else
(
if
(knd0=KINFIXR)
then
FIXTYinf(pval, ASSOCrgt)
else
(
if
(knd0=KPREFIX)
then FIXTYpre(pval) else
(
if
(knd0=KPSTFIX)
then
FIXTYpos(pval) else FIXTYnon())))
)
//
) : fixty // end of [ val(fxty) ]
//
fun
loop
( tenv:
! tr01env
, id0s: i0dntlst): void =
(
case+ id0s of
|
list_nil() => ()
|
list_cons
(id0, id0s) => let
val tok =
trans01_i0dnt(tenv, id0)
val sym =
(
case-
tok.node() of
|
T_IDALP(nam) => symbl(nam)
|
T_IDSYM(nam) => symbl(nam)
|
T_IDDLR(nam) => symbl(nam)): sym_t
//
in//let
loop(tenv, id0s) where
{
val () =
tr01env_insert_any(tenv, sym, fxty)
}
endlet//end-of-[list_cons(id0,ids)]
) (*case+*) // end of [loop(tenv,ids)]
//
in
let
val () = loop(tenv, id0s)
in
d1ecl_make_node(loc0, D1Cd0ecl(d0cl))
end
end where // end-of-let
{
//
fun
h1signint
(pint: precint): sint =
(
case+ pint of
|
PINTint1
( tint ) => token2sint(tint)
|
PINTopr2
(topr,tint) =>
(
case-
topr.node() of
|
T_IDSYM("+") => 0+token2sint(tint)
|
T_IDSYM("-") => 0-token2sint(tint)
) (*case-*) // end of [PINTopr2(_,_)]
) (*case+*) // end of [h1signint(pint)]
//
fun
h1precopt
( tenv:
! tr01env
, popt: precopt): sint =
(
case+ popt of
|
PRECnil0() => 0
|
PRECint1(tint) =>
token2sint(tint)
|
PRECopr2(topr,pmod) =>
(
case+ pmod of
|
PMODnone() => pval
|
PMODsome
(tbeg,pint,tend) =>
pval+h1signint(pint)) where
{
//
val tok =
trans01_i0dnt(tenv,topr)
//
val sym =
(
case-
tok.node() of
|
T_IDALP(nam) => symbl(nam)
|
T_IDSYM(nam) => symbl(nam)
) : sym_t//end-of-[val(sym)]
//
val
fopt =
tr01env_search_opt(tenv, sym)
//
val pval =
(
case+ fopt of
| ~
optn_vt_cons(fxty) =>
(
prcdv_decode(fixty_prcdv(fxty))
)
//
| ~
optn_vt_nil((*nil*)) => 0 where
{
val () =
let
val nam = sym.name()
in//let
prerr
("TRANS01-WARN1:", tok.lctn());
prerrln
(":[",nam,"] is a non-operator!")
endlet // end-of-[ val () ]
} (*where*)//end-of-(optn_vt_nil())
)
//
} (*where*)//end-of-[PMODsome(_,_,_)]
) (*case+*)//end-of-[h1precopt(tenv,popt)]
//
} (*where*)//end-of-[f0_fixity(tenv,d0cl)]
//
(* ****** ****** *)
//
fun
f0_nonfix
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
val-
D0Cnonfix
(tknd, id0s) = d0cl.node()
//
fun
loop
( tenv:
! tr01env
, id0s: i0dntlst): void =
(
case+ id0s of
|
list_nil() => ()
|
list_cons
(id0, id0s) => let
//
val tok =
trans01_i0dnt(tenv, id0)
val sym =
(
case-
tok.node() of
|
T_IDALP(nam) => symbl(nam)
|
T_IDSYM(nam) => symbl(nam)): sym_t
//
in
loop(tenv, id0s) where
{
val () =
tr01env_insert_any(tenv,sym,FIXTYnon)
}
endlet//end-of-[list_cons(id0,ids)]
) (*case+*) // end of [loop(tenv,ids)]
//
in
let
val () = loop(tenv, id0s)
in
d1ecl_make_node(loc0, D1Cd0ecl(d0cl))
end
end (*let*)//end-of-[f0_nonfix(tenv,d0cl)]
//
(* ****** ****** *)
//
fun
f0_static
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
val-
D0Cstatic
(tknd, dcl1) = d0cl.node()
//
val
dcl1 = trans01_d0ecl(tenv, dcl1)
//
in
d1ecl(loc0, D1Cstatic(tknd, dcl1))
end (* let *) // end of [f0_static]
//
fun
f0_extern
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
val-
D0Cextern
(tknd, dcl1) = d0cl.node()
//
val
dcl1 = trans01_d0ecl(tenv, dcl1)
//
in
d1ecl(loc0, D1Cextern(tknd, dcl1))
end (* let *) // end of [f0_extern]
//
(* ****** ****** *)

fun
f0_abssort
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
val-
D0Cabssort
(tknd, tid0) = d0cl.node()
//
val
tid0 = trans01_i0dnt(tenv, tid0)
//
in
d1ecl(loc0, D1Cabssort(tknd, tid0))
end // end of [f0_abssort]

(* ****** ****** *)

fun
f0_stacst0
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
val-
D0Cstacst0
(tknd
,sid0, tmas
,tcln, s0t1) = d0cl.node()
//
val
sid0 =
trans01_i0dnt(tenv, sid0)
val
tmas =
trans01_t0maglst(tenv, tmas)
//
val
s1t1 = trans01_sort0(tenv, s0t1)
//
in
d1ecl_make_node
( loc0
, D1Cstacst0(tknd, sid0, tmas, s1t1))
end // end of [f0_stacst0]

(* ****** ****** *)

fun
f0_sortdef
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val-
D0Csortdef
( tknd
, tid0
, teq1, stdf) = d0cl.node()
//
val tid0 =
trans01_i0dnt(tenv, tid0)
//
val stdf =
(
case+
stdf.node() of
|
S0TDFsort
(  s0t1  ) =>
let
val
s1t1 =
trans01_sort0(tenv, s0t1)
in
s1tdf
(stdf.lctn(), S1TDFsort(s1t1))
end
|
S0TDFtsub
( tbeg
, s0a1, tbar
, s0es, tend) =>
let
val
s1a1 =
trans01_s0arg(tenv, s0a1)
val
s1es =
trans01_s0explst(tenv, s0es)
in
s1tdf
(stdf.lctn(),S1TDFtsub(s1a1,s1es))
endlet // end of [S0TDFtsub]
) : s1tdf // end of [ val(stdf) ]
//
(*
val () =
println!("f0_sortdef: tid0 = ", tid0)
val () =
println!("f0_sortdef: stdf = ", stdf)
*)
//
in
d1ecl_make_node
(d0cl.lctn(), D1Csortdef(tknd, tid0, stdf))
end // end of [f0_sortdef]

(* ****** ****** *)

fun
f0_sexpdef
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
(*
val () =
println!
("trans01_d0ecl: d0cl = ", d0cl)
*)
//
val-
D0Csexpdef
( tknd
, seid
, smas
, tres
, teq1, s0e2) = d0cl.node()
//
val
seid =
trans01_i0dnt(tenv, seid)
val
smas =
trans01_s0maglst(tenv, smas) 
val
tres =
trans01_sort0opt(tenv, tres)
//
val
s1e2 = trans01_s0exp(tenv, s0e2)
//
(*
val () =
println!("f0_sexpdef: seid = ", seid)
val () =
println!("f0_sexpdef: smas = ", smas)
val () =
println!("f0_sexpdef: tres = ", tres)
val () =
println!("f0_sexpdef: s1e2 = ", s1e2)
*)
//
in
d1ecl_make_node
(loc0, D1Csexpdef(tknd,seid,smas,tres,s1e2))
end (*let*) // end of [f0_sexpdef(tenv,d0cl]

(* ****** ****** *)

fun
f0_abstype
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
(*
val () =
println!
("trans01_d0ecl: d0cl = ", d0cl)
*)
//
val-
D0Cabstype
(tknd
,seid, tmas
,tres, atdf) = d0cl.node()
//
val seid =
trans01_i0dnt(tenv, seid)
val tmas =
trans01_t0maglst(tenv, tmas)
val tres =
trans01_sort0opt(tenv, tres)
//
val atdf =
(
case+ atdf of
|
A0TDFsome() => A1TDFsome()
|
A0TDFlteq(tknd, s0e1) =>
A1TDFlteq(trans01_s0exp(tenv,s0e1))
|
A0TDFeqeq(tknd, s0e1) =>
A1TDFeqeq(trans01_s0exp(tenv,s0e1))
) : a1tdf // end of [ val(atdf) ]
//
in//let
d1ecl_make_node
(loc0,D1Cabstype(tknd,seid,tmas,tres,atdf))
end (*let*) // end of [f0_abstype(tenv,d0cl)]

(* ****** ****** *)

fun
f0_absopen
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
(*
val () =
println!
("trans01_d0ecl: d0cl = ", d0cl)
*)
//
val-
D0Cabsopen
(tknd, sqid) = d0cl.node()
//
val sqid = trans01_s0qid(tenv, sqid)
//
in//let
d1ecl_make_node(loc0,D1Cabsopen(tknd,sqid))
end (*let*) // end of [f0_absopen(tenv,d0cl)]

(* ****** ****** *)

fun
f0_absimpl
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
(*
val () =
println!
("trans01_d0ecl: d0cl = ", d0cl)
*)
//
val-
D0Cabsimpl
(tknd
,sqid
,smas, tres
,teq1, s0e2) = d0cl.node()
//
val sqid =
trans01_s0qid(tenv, sqid)
val smas =
trans01_s0maglst(tenv, smas)
val tres =
trans01_sort0opt(tenv, tres)
val s1e2 = trans01_s0exp(tenv, s0e2)
//
in//let
d1ecl_make_node
(loc0
,D1Cabsimpl(tknd,sqid,smas,tres,s1e2))
end (*let*) // end of [f0_absopen(tenv,d0cl)]

(* ****** ****** *)

fun
f0_datasort
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
(*
val () =
println!
("trans01_d0ecl: d0cl = ", d0cl)
*)
//
val-
D0Cdatasort
(tknd, d0ts) = d0cl.node()
//
val d1ts =
trans01_d0tstlst(tenv, d0ts)
//
in//let
  d1ecl(loc0, D1Cdatasort(tknd, d1ts))
end (*let*) // end of [f0_datasort(tenv,d0cl)]

(* ****** ****** *)

fun
f0_valdclst
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
(*
val () =
println!
("trans01_d0ecl: d0cl = ", d0cl)
*)
//
val-
D0Cvaldclst
(tknd, d0vs) = d0cl.node()
//
val d1vs =
trans01_d0valdclist(tenv, d0vs)
//
in//let
  d1ecl(loc0, D1Cvaldclst(tknd, d1vs))
end (*let*) // end of [f0_valdclst(tenv,d0cl)]

(* ****** ****** *)

fun
f0_vardclst
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
(*
val () =
println!
("trans01_d0ecl: d0cl = ", d0cl)
*)
//
val-
D0Cvardclst
(tknd, d0vs) = d0cl.node()
//
val d1vs =
trans01_d0vardclist(tenv, d0vs)
//
in//let
  d1ecl(loc0, D1Cvardclst(tknd, d1vs))
end (*let*) // end of [f0_vardclst(tenv,d0cl)]

(* ****** ****** *)

fun
f0_datatype
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
(*
val () =
println!
("trans01_d0ecl: d0cl = ", d0cl)
*)
//
val-
D0Cdatatype
(tknd
,d0ts, wdcs) = d0cl.node()
//
val d1ts = trans01_d0typlst(tenv, d0ts)
val wdcs = trans01_wd0eclseq(tenv, wdcs)
//
in//let
  d1ecl(loc0, D1Cdatatype(tknd, d1ts, wdcs))
end (*let*) // end of [f0_datatype(tenv,d0cl)]

(* ****** ****** *)

fun
f0_dynconst
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
(*
val () =
println!
("trans01_d0ecl: d0cl = ", d0cl)
*)
//
val-
D0Cdynconst
(tknd
,tqas, d0cs) = d0cl.node()
//
val tqas =
trans01_t0qaglst(tenv, tqas)
val d1cs =
trans01_d0cstdclist(tenv, d0cs)
//
in//let
  d1ecl(loc0, D1Cdynconst(tknd, tqas, d1cs))
end (*let*) // end of [f0_dynconst(tenv,d0cl)]

(* ****** ****** *)

} (*where*) // end of [trans01_d0ecl(tenv,d0cl)]

(* ****** ****** *)

#implfun
trans01_d0valdcl
  (tenv, dval) =
let
//
val loc0 =
d0valdcl_get_lctn(dval)
//
val dpat =
d0valdcl_get_dpat(dval)
val dpat =
trans01_d0pat(tenv, dpat)
//
val tdxp =
d0valdcl_get_tdxp(dval)
val tdxp =
trans01_teqd0exp(tenv, tdxp)
//
val wsxp =
d0valdcl_get_wsxp(dval)
val wsxp =
trans01_wths0exp(tenv, wsxp)
//
in//let
d1valdcl_make_args(loc0, dpat, tdxp, wsxp)
end (*let*)//end-of-[trans01_d0valdcl(tenv,dval)]

(* ****** ****** *)

#implfun
trans01_d0vardcl
  (tenv, dvar) =
let
//
val loc0 =
d0vardcl_get_lctn(dvar)
//
val dpid =
d0vardcl_get_dpid(dvar)
val dpid =
trans01_i0dnt(tenv, dpid)
//
val vpid =
d0vardcl_get_vpid(dvar)
val vpid =
trans01_i0dntopt(tenv, vpid)
//
val sres =
d0vardcl_get_sres(dvar)
val sres =
trans01_s0expopt(tenv, sres)
//
val dini =
d0vardcl_get_dini(dvar)
val dini =
trans01_teqd0exp(tenv, dini)
//
in//let
d1vardcl_make_args(loc0,dpid,vpid,sres,dini)
end (*let*)//end-of-[trans01_d0vardcl(tenv,dvar)]

(* ****** ****** *)

#implfun
trans01_d0cstdcl
  (tenv, dcst) =
let
//
val loc0 =
d0cstdcl_get_lctn(dcst)
val dpid =
d0cstdcl_get_dpid(dcst)
val darg =
d0cstdcl_get_darg(dcst)
val sres =
d0cstdcl_get_sres(dcst)
val dres =
d0cstdcl_get_dres(dcst)
//
val dpid =
trans01_i0dnt(tenv, dpid)
val darg =
trans01_d0arglst(tenv, darg)
//
val sres = trans01_s0res(tenv, sres)
val dres = trans01_d0res(tenv, dres)
//
in//let
d1cstdcl_make_args(loc0,dpid,darg,sres,dres)
end (*let*)//end-of-[trans01_d0cstdcl(tenv,dcst)]

(* ****** ****** *)

#implfun
trans01_d0eclist
  (tenv, dcls) =
list_trans01_fnp(tenv, dcls, trans01_d0ecl)

(* ****** ****** *)

#implfun
trans01_q0arglst
  (tenv, q0as) =
list_trans01_fnp(tenv, q0as, trans01_q0arg)
#implfun
trans01_s0qaglst
  (tenv, sqas) =
list_trans01_fnp(tenv, sqas, trans01_s0qag)
#implfun
trans01_t0qaglst
  (tenv, tqas) =
list_trans01_fnp(tenv, tqas, trans01_t0qag)
#implfun
trans01_t0iaglst
  (tenv, tias) =
list_trans01_fnp(tenv, tias, trans01_t0iag)

(* ****** ****** *)
//
#implfun
trans01_wd0eclseq
  (tenv, wdcs) =
(
case+ wdcs of
|
WD0CSnone() => WD1CSnone()
|
WD0CSsome
(twhr,topt,dcls,tend) =>
WD1CSsome(trans01_d0eclist(tenv, dcls))
) (*case+*)//end-of[trans01_wd0eclseq(tenv,wdcs)]
//
(* ****** ****** *)
//
#implfun
trans01_d0valdclist
  (  tenv,dcls  ) =
list_trans01_fnp(tenv, dcls, trans01_d0valdcl)
#implfun
trans01_d0vardclist
  (  tenv,dcls  ) =
list_trans01_fnp(tenv, dcls, trans01_d0vardcl)
#implfun
trans01_d0fundclist
  (  tenv,dcls  ) =
list_trans01_fnp(tenv, dcls, trans01_d0fundcl)
#implfun
trans01_d0cstdclist
  (  tenv,dcls  ) =
list_trans01_fnp(tenv, dcls, trans01_d0cstdcl)
//
(* ****** ****** *)
//
#implfun
trans01_d0eclistopt
  (  tenv,opt0  ) =
optn_trans01_fnp(tenv, opt0, trans01_d0eclist)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_trans01_decl00.dats] *)
