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
#staload "./../SATS/filpath.sats"
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
#staload "./../SATS/parsing.sats"
(* ****** ****** *)
#staload "./../SATS/preadx0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
#symload name with drpth_get_name
#symload name with symbl_get_name
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with i0dnt_get_lctn
#symload node with i0dnt_get_node
(* ****** ****** *)
#symload lctn with s0ymb_get_lctn
#symload node with s0ymb_get_node
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
//
#symload lctn with q0arg_get_lctn
#symload node with q0arg_get_node
//
#symload lctn with s0qag_get_lctn
#symload node with s0qag_get_node
#symload lctn with t0qag_get_lctn
#symload node with t0qag_get_node
//
#symload lctn with t0iag_get_lctn
#symload node with t0iag_get_node
//
(* ****** ****** *)
#symload lctn with a0typ_get_lctn
#symload node with a0typ_get_node
#symload lctn with d0arg_get_lctn
#symload node with d0arg_get_node
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
q1as = list_nil(*void*)
in//let
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
q1as = list_nil(*void*)
in//let
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
//
#implfun
trans01_t0iag
  (tenv, tia0) =
(
case+
tia0.node() of
|
T0IAGnone(tok) =>
let
val
s1es = list_nil(*void*)
in//let
t1iag_make_node
(tia0.lctn(),T1IAGsome(s1es))
end // end of [T0IAGnone(tok)]
|
T0IAGsome
(tbeg,s0es,tend) =>
let
val
s1es =
trans01_s0explst(tenv, s0es)
in//let
t1iag_make_node
(tia0.lctn(),T1IAGsome(s1es))
end (*let*)//end-of(T0IAGsome(...))
)
//
(* ****** ****** *)

#implfun
trans01_a0typ
( tenv,a0t0 ) = let
//
val
loc0 = a0t0.lctn()
//
in//let
//
case+
a0t0.node() of
|
A0TYPsome(s0e1, topt) =>
let
val
s1e1 =
trans01_s0exp(tenv, s0e1)
in
a1typ_make_node
(loc0, A1TYPsome(s1e1, topt))
end // end of [A0TYPsome(s0e1,opt2)]
//
end (*let*) // end of [trans01_a0typ(tenv,a0tp)]

(* ****** ****** *)

#implfun
trans01_d0arg
( tenv,d0a0 ) = let
//
val
loc0 = d0a0.lctn()
//
in//let
//
case+
d0a0.node() of
//
|
D0ARGnone(tok) =>
let
val loc = tok.lctn()
val tok =
token_make_node
(loc, T0IDALP_NONE(*val*))
in//let
d1arg_make_node(loc0, D1ARGdyn1(tok))
end (*let*) // end of [D0ARGnone(tok)]
//
|
D0ARGsta0
(_, s0qs, _) =>
let
val
s1qs =
trans01_s0qualst(tenv, s0qs)
in
d1arg_make_node(loc0, D1ARGsta0(s1qs))
end (*let*) // end of [D0ARGsta0(...)]
//
|
D0ARGdyn1
( dpid ) => let
val
dpid =
trans01_i0dnt(tenv, dpid)
in//let
d1arg_make_node(loc0, D1ARGdyn1(dpid))
end (*let*) // end of [D0ARGdyn1(dpid)]
|
D0ARGdyn2
(tbeg,a0ts
,aopt,tend) => let
//
val a1ts =
trans01_a0typlst(tenv, a0ts)
val aopt =
optn_trans01_fnp
(tenv, aopt, trans01_a0typlst)
//
in//let
d1arg_make_node(loc0, D1ARGdyn2(a1ts, aopt))
end (*let*) // end of [D0ARGdyn2(_,a0ts,aopt,_)]
//
end (*let*) // end of [trans01_d0arg(tenv,d0a0)]

(* ****** ****** *)
//
fun
s1taload_from_fpath
( fpth: fpath)
: @(sint, d1parsed) =
let
//
val fnm2 =
fpath_get_fnm2(fpth)
val opt2 =
the_d1parenv_pvsfind(fnm2)
//
in//in-of-let
//
case+ opt2 of
| ~
optn_vt_nil() =>
let
//
val fnm1 =
fpath_get_fnm1(fpth)
val knd1 =
let
val knd1 =
  fname_stadyn(fnm1)
in//let
if
knd1 < 0 then 0 else knd1
end // end of [ val(knd1) ]
//
(*
val (  ) =
prerrln(
"s1taload_from_fpath:\
 knd1 = ", knd1 (*stadyn*)  )
val (  ) =
prerrln(
"s1taload_from_fpath:\
 fnm1 = ", fnm1 (*fname1*)  )
*)
//
val
dpar =
d0parsed_from_fpath(knd1, fnm1)
//
// HX-2023-06-10: for 
val // basic error checking
dpar = d0parsed_of_preadx0(dpar)
//
in(*let*)
(0, dpar) where
{
val
dpar = d1parsed_of_trans01(dpar)
val (  ) =
the_d1parenv_pvsadd0(fnm2, dpar) }
end//let//end-of-[ optn_vt_nil() ]
//
| ~
optn_vt_cons(dpar) => @(1(*shr*),dpar)
//
end where
{
//
(*
  val () =
  prerrln
  ("s1taload_from_fpath: fpth = ", fpth)
*)
//
}(*where*)//end-of-[s1taload_from_fpath(fpth)]
//
(* ****** ****** *)

#implfun
trans01_d0ecl
( tenv,d0cl ) = let
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
D0Cdefine _ =>
f0_define(tenv, d0cl)
|
D0Cmacdef _ =>
f0_macdef(tenv, d0cl)
//
|
D0Clocal0
( tbeg
, dcs1, topt
, dcs2, tend) => let
//
val loc0 = d0cl.lctn()
//
val (  ) =
  tr01env_pshloc1(tenv)
val dcs1 =
  trans01_d0eclist(tenv, dcs1)
val (  ) =
  tr01env_pshloc2(tenv)
val dcs2 =
  trans01_d0eclist(tenv, dcs2)
//
val (  ) = tr01env_locjoin(tenv)
//
in // let
  d1ecl(loc0, D1Clocal0(dcs1, dcs2))
end (*let*)//end-(D0Clocal(_,_,_,_,_))
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
D0Csymload _ =>
f0_symload(tenv, d0cl)
//
|
D0Cinclude _ =>
f0_include(tenv, d0cl)
|
D0Cstaload _ =>
f0_staload(tenv, d0cl)
//
|
D0Cdyninit _ =>
f0_dyninit(tenv, d0cl)
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
|
D0Cfundclst _ =>
f0_fundclst(tenv, d0cl)
//
|
D0Cimplmnt0 _ =>
f0_implmnt0(tenv, d0cl)
//
|
D0Cexcptcon _ =>
f0_excptcon(tenv, d0cl)
|
D0Cdatatype _ =>
f0_datatype(tenv, d0cl)
//
|
D0Cdynconst _ =>
f0_dynconst(tenv, d0cl)
//
|D0Ctkerr(tok) =>
(
case+ tok.node() of
|T_EOF() =>
 d1ecl_none0(d0cl.lctn())
|_(*else*) => d1ecl_none1(d0cl))
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
(*
val () =
prerrln
("f0_fixity: pval = ", pval)
*)
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
tr01env_insmix_any(tenv, sym, fxty)
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
) where
{
(*
  val () =
  prerrln("h1signint: pint = ", pint)
*)
} (*where*) // end of [h1signint(pint)]
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
end (*let*)//end-of-[f0_static(tenv,d0cl)]
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
end (*let*)//end-of-[f0_extern(tenv,d0cl)]
//
(* ****** ****** *)
//
fun
f0_define
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
val-
D0Cdefine
( tknd
, geid
, gmas, gedf) = d0cl.node()
//
val
geid =
trans01_i0dnt(tenv, geid)
val
gmas =
trans01_g0maglst(tenv, gmas)
//
val
gedf =
(
case+ gedf of
|
G0EDFnone() =>
optn_nil((*void*))
|
G0EDFsome(topt,g0e1) =>
optn_cons
(trans01_g0exp(tenv, g0e1))
) : g1expopt // end of [val(gedf)]
//
in
d1ecl_make_node
( loc0
, D1Cdefine(tknd, geid, gmas, gedf))
end (*let*)//end-of-[f0_define(tenv,d0cl)]
//
(* ****** ****** *)
//
fun
f0_macdef
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
val-
D0Cmacdef
( tknd
, geid
, gmas, dedf) = d0cl.node()
//
val
geid =
trans01_i0dnt(tenv, geid)
val
gmas =
trans01_g0maglst(tenv, gmas)
//
val
dedf =
(
case+ dedf of
|
D0EDFnone() =>
optn_nil((*void*))
|
D0EDFsome(topt,d0e1) =>
optn_cons
(trans01_d0exp(tenv, d0e1))
) : d1expopt // end of [val(dedf)]
//
in
d1ecl_make_node
( loc0
, D1Cmacdef(tknd, geid, gmas, dedf))
end (*let*)//end-of-[f0_macdef(tenv,d0cl)]
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
end (*let*)//end-of-[f0_abssort(tenv,d0cl)]

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
end (*let*)//end-of-[f0_stacst0(tenv,d0cl)]

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
prerrln("f0_sortdef: tid0 = ", tid0)
val () =
prerrln("f0_sortdef: stdf = ", stdf)
*)
//
in
d1ecl_make_node
(d0cl.lctn(), D1Csortdef(tknd, tid0, stdf))
end (*let*) // end-of-[f0_sortdef(tenv,d0cl)]

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
prerrln
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
prerrln("f0_sexpdef: seid = ", seid)
val () =
prerrln("f0_sexpdef: smas = ", smas)
val () =
prerrln("f0_sexpdef: tres = ", tres)
val () =
prerrln("f0_sexpdef: s1e2 = ", s1e2)
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
prerrln
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
prerrln
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
prerrln
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
f0_symload
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
(*
val () =
prerrln
("trans01_d0ecl: d0cl = ", d0cl)
*)
//
val-
D0Csymload
(tknd
,symb, twth
,dqid, gopt) = d0cl.node()
//
val deid =
(
case+
symb.node() of
|
S0YMBi0dnt(deid) =>
let
val
tok =
trans01_i0dnt(tenv, deid)
in//let
(
case-
tok.node() of
|
T_IDALP(nam) => symbl(nam)
|
T_IDSYM(nam) => symbl(nam)
|
T_IDDLR(nam) => symbl(nam))
endlet // end of [S0YMBi0dnt]
|
S0YMBbrckt
( tlb,trb ) => symbl("[]")): sym_t
//
val dqid = trans01_d0qid(tenv,dqid)
//
val gopt = trans01_g0expopt(tenv,gopt)
//
in//let
d1ecl_make_node
(loc0,D1Csymload(tknd, deid, dqid, gopt))
end (*let*) // end of [f0_symload(tenv,d0cl)]

(* ****** ****** *)

local

(* ****** ****** *)
fun
xstrunqtize
( src0
: strn, ln: sint): strn =
let
(*
val ln =
strn_length(src0)
*)
in//let
strn_tabulate_cfr
( ln-2
, lam i0 => src0[i0+1]
) end//let//[xstrunqtize(src0,ln)]
(* ****** ****** *)
fun
xstrnormize(base: strn): strn = base
fun
xstrevalize(base: strn): strn = base
(* ****** ****** *)

fun
f0_g1e1
(g1e1: g1exp): fnameopt =
let
(*
val () =
prerrln
("f0_g1e1: g1e1 = ", g1e1)
*)
in
case+
g1e1.node() of
|G1Estr _ => f1_gstr(g1e1)
|_(*non-G1Estr*) => optn_nil()
endlet // end of [f0_g1e1(g1e1)]
//
and
f1_gstr
(g1e1: g1exp): fnameopt =
(
  f1_tokn(tok1)) where
{
  val-
  G1Estr(tok1) = g1e1.node() }
//
and
f1_tokn
(tok1: token): fnameopt =
(
case+
tok1.node() of
|
T_STRN1_clsd(base, ln) =>
( optn_cons
  (FNMbase(base))) where
{ val base =
  xstrunqtize(base, ln)
  val base = xstrnormize(base)
  val base = xstrevalize(base) }
|
_(*otherwise*) => optn_nil((*void*))
)

in(*in-of-local*)

fun
f0_include
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val-
D0Cinclude
( knd0
, tknd, g0e1) = d0cl.node()
//
val g1e1 =
  trans01_g0exp(tenv, g0e1)
//
in//let
let
//
val opt0 =
f0_g1e1(g1e1): fnameopt
val opt1 =
(
case+ opt0 of
|optn_nil() =>
 optn_nil()
|optn_cons(fnm0) =>
 fsrch_combined(fnm0)): fpathopt
//
val (  ) =
prerrln("f0_include: g1e1 = ", g1e1)
val (  ) =
prerrln("f0_include: opt0 = ", opt0)
val (  ) =
prerrln("f0_include: opt1 = ", opt1)
//
val dopt =
(
case+ opt1 of
|
optn_nil() =>
optn_nil()
|
optn_cons(fpth) =>
let
//
val fnm1 =
fpath_get_fnm1(fpth)
//
val knd1 =
(
if
knd0 <= 0
then knd0 else
let
val knd1 =
fname_stadyn(fnm1) in
if
knd1 < 0
then knd0 else knd1 end)
//
val dpar =
d0parsed_from_fpath(knd1, fnm1)
//
in//in-of-let
trans01_d0eclistopt
(tenv, d0parsed_get_parsed(dpar)) end
) : optn(d1eclist) // end-of-[val(dopt)]
//
in//let
d1ecl_make_node
(loc0,
 D1Cinclude(knd0, tknd, g1e1, opt1, dopt))
end//let
end where
{
//
val loc0 = d0cl.lctn()
//
// (*
val () =
prerrln
("trans01_d0ecl: f0_include: d0cl = ", d0cl)
// *)
//
} (*where*) // end of [f0_include(tenv,d0cl)]

end (*local*) // end of [f0_include(tenv,d0cl)]

(* ****** ****** *)

local

(* ****** ****** *)
fun
xstrunqtize
( src0
: strn, ln: sint): strn =
let
(*
val ln =
strn_length(src0)
*)
in//let
strn_tabulate_cfr
( ln-2
, lam i0 => src0[i0+1]
) end//let//[xstrunqtize(src0,ln)]
(* ****** ****** *)
fun
xstrnormize(base: strn): strn = base
fun
xstrevalize(base: strn): strn = base
(* ****** ****** *)

fun
f0_g1e1
(g1e1: g1exp): fnameopt =
let
(*
val () =
prerrln
("f0_g1e1: g1e1 = ", g1e1)
*)
in
case+
g1e1.node() of
|G1Estr _ => f1_gstr(g1e1)
|G1Ea2pp _ => f1_a2pp(g1e1)
|_(*otherwise*) => optn_nil()
endlet // end of [f0_g1e1(g1e1)]
//
and
f1_gstr
(g1e1: g1exp): fnameopt =
(
  f1_tokn(tok1)) where
{
  val-
  G1Estr(tok1) = g1e1.node() }
//
and
f1_tokn
(tok1: token): fnameopt =
(
case+
tok1.node() of
|
T_STRN1_clsd(base, ln) =>
( optn_cons
  (FNMbase(base))) where
{ val base =
  xstrunqtize(base, ln)
  val base = xstrnormize(base)
  val base = xstrevalize(base) }
|
_(*otherwise*) => optn_nil((*void*))
)
and
f1_a2pp
(gapp: g1exp): fnameopt =
(
case-
gapp.node() of
|
G1Ea2pp
(g1f0,g1e1,g1e2) =>
(
case+
g1f0.node() of
|
G1Eid0(id0) =>
if
(id0 != EQ0_symbl)
then optn_nil(*0*) else
(
case+
g1e2.node() of
|
G1Estr _ =>
f1_gstr(g1e2) | _ => optn_nil())
|
_(* non-G1Eid0 *) => optn_nil())
) (*case-*) // end of [f1_a2pp(gapp)] 

in(*in-of-local*)

fun
f0_staload
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val-
D0Cstaload
( knd0
, tknd, g0e1) = d0cl.node()
//
val g1e1 =
  trans01_g0exp(tenv, g0e1)
//
in//let
//
let
//
val opt0 =
f0_g1e1(g1e1): fnameopt
val opt1 =
(
case+ opt0 of
|optn_nil() =>
 optn_nil()
|optn_cons(fnm0) =>
 fsrch_combined(fnm0)): fpathopt
//
val (  ) =
prerrln("f0_staload: g1e1 = ", g1e1)
val (  ) =
prerrln("f0_staload: opt0 = ", opt0)
val (  ) =
prerrln("f0_staload: opt1 = ", opt1)
//
val dopt =
(
case+ opt1 of
|
optn_nil() =>
optn_nil((*void*))
|
optn_cons(fpth) =>
optn_cons(s1taload_from_fpath(fpth))
) : optn@(sint, d1parsed) // [val(dopt)]
//
in//let
d1ecl
(loc0,
 D1Cstaload(knd0, tknd, g1e1, opt1, dopt))
end//let
//
end where
{
//
val loc0 = d0cl.lctn()
//
(*
val () =
prerrln
("trans01_d0ecl: f0_staload: d0cl = ", d0cl)
*)
} (*where*) // end of [f0_staload(tenv,d0cl)]

end (*local*) // end of [f0_staload(tenv,d0cl)]

(* ****** ****** *)

fun
f0_dyninit
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val-
D0Cdyninit
(tknd, g0e1) = d0cl.node()
//
val g1e1 = trans01_g0exp(tenv, g0e1)
//
in//let
  d1ecl(loc0, D1Cdyninit(tknd, g1e1))
end where
{
//
val loc0 = d0cl.lctn()
//
val () = prerrln
("trans01_d0ecl: f0_dyninit: d0cl = ", d0cl)
//
} (*where*) // end of [f0_dyninit(tenv,d0cl)]

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
prerrln
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
prerrln
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
prerrln
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
f0_fundclst
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
(*
val () =
prerrln
("trans01_d0ecl: d0cl = ", d0cl)
*)
//
val-
D0Cfundclst
(tknd
,tqas, d0fs) = d0cl.node()
//
val tqas =
trans01_t0qaglst(tenv, tqas)
val d1fs =
trans01_d0fundclist(tenv, d0fs)
//
in//let
d1ecl(loc0, D1Cfundclst(tknd, tqas, d1fs))
end (*let*) // end of [f0_fundclst(tenv,d0cl)]

(* ****** ****** *)

fun
f0_implmnt0
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
val-
D0Cimplmnt0
( tknd
, sqas, tqas
, dqid, tias
, f0as, sres
, teq1, body) = d0cl.node()
//
val sqas =
trans01_s0qaglst(tenv, sqas)
val tqas =
trans01_t0qaglst(tenv, tqas)
//
val dqid =
  trans01_d0qid( tenv, dqid )
//
val tias =
trans01_t0iaglst(tenv, tias)
val f1as =
trans01_f0arglst(tenv, f0as)
//
val sres =
  trans01_s0res( tenv, sres )
val body =
  trans01_d0exp( tenv, body )
//
in//let
d1ecl_make_node
( loc0
, D1Cimplmnt0
  (tknd,sqas,tqas,dqid,tias,f1as,sres,body))
end where // end-of-let
{
//
  val
  ( ) = prerrln("f0_implmnt0: d0cl = ", d0cl)
//
} (*where*) // end of [f0_implmnt0(tenv,d0cl)]

(* ****** ****** *)

fun
f0_excptcon
( tenv:
! tr01env
, d0cl: d0ecl): d1ecl =
let
//
val loc0 = d0cl.lctn()
//
(*
val () =
prerrln
("trans01_d0ecl: d0cl = ", d0cl)
*)
//
val-
D0Cexcptcon
(tknd
,topt, tcns) = d0cl.node()
//
val tcns = trans01_d0tcnlst(tenv, tcns)
//
in//let
d1ecl_make_node(loc0,D1Cexcptcon(tknd,tcns))
end (*let*) // end of [f0_excptcon(tenv,d0cl)]

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
prerrln
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
prerrln
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
trans01_d0fundcl
  (tenv, dfun) =
let
//
val loc0 =
d0fundcl_get_lctn(dfun)
//
val dpid =
d0fundcl_get_dpid(dfun)
val dpid =
trans01_i0dnt(tenv, dpid)
//
val wsxp =
d0fundcl_get_wsxp(dfun)
val wsxp =
trans01_wths0exp(tenv, wsxp)
//
val farg =
d0fundcl_get_farg(dfun)
val farg =
trans01_f0arglst(tenv, farg)
//
val sres =
d0fundcl_get_sres(dfun)
val sres =
trans01_s0res(tenv, sres)
//
val tdxp =
d0fundcl_get_tdxp(dfun)
val tdxp =
trans01_teqd0exp(tenv, tdxp)
//
in//let
d1fundcl(loc0, dpid, farg, sres, tdxp, wsxp)
end (*let*)//end-of-[trans01_d0fundcl(tenv,dfun)]

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
trans01_a0typlst
  (tenv, a0ts) =
list_trans01_fnp(tenv, a0ts, trans01_a0typ)
#implfun
trans01_d0arglst
  (tenv, d0as) =
list_trans01_fnp(tenv, d0as, trans01_d0arg)
//
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
(
  list_trans01_fnp(tenv, dcls, trans01_d0valdcl))
#implfun
trans01_d0vardclist
  (  tenv,dcls  ) =
(
  list_trans01_fnp(tenv, dcls, trans01_d0vardcl))
#implfun
trans01_d0fundclist
  (  tenv,dcls  ) =
(
  list_trans01_fnp(tenv, dcls, trans01_d0fundcl))
#implfun
trans01_d0cstdclist
  (  tenv,dcls  ) =
(
  list_trans01_fnp(tenv, dcls, trans01_d0cstdcl))
//
(* ****** ****** *)
//
#implfun
trans01_d0eclistopt
  (  tenv,dopt  ) =
(
  optn_trans01_fnp(tenv, dopt, trans01_d0eclist))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans01_decl00.dats] *)
