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
#staload "./../SATS/filpath.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/gmacro1.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/trans12.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
#symload name with symbl_get_name
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload node with g1exp_get_node
(* ****** ****** *)
#symload lctn with s1qid_get_lctn
#symload lctn with d1qid_get_lctn
(* ****** ****** *)
#symload lctn with sort1_get_lctn
#symload node with sort1_get_node
(* ****** ****** *)
#symload lctn with t1arg_get_lctn
#symload node with t1arg_get_node
(* ****** ****** *)
#symload lctn with t1mag_get_lctn
#symload node with t1mag_get_node
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
#symload lctn with s1uni_get_lctn
#symload node with s1uni_get_node
(* ****** ****** *)
#symload lctn with d1tcn_get_lctn
#symload node with d1tcn_get_node
(* ****** ****** *)
#symload lctn with d1typ_get_lctn
#symload node with d1typ_get_node
(* ****** ****** *)
#symload lctn with d1pat_get_lctn
#symload node with d1pat_get_node
(* ****** ****** *)
#symload lctn with d1exp_get_lctn
#symload node with d1exp_get_node
(* ****** ****** *)
#symload lctn with q1arg_get_lctn
#symload node with q1arg_get_node
(* ****** ****** *)
#symload lctn with s1qag_get_lctn
#symload node with s1qag_get_node
#symload lctn with t1qag_get_lctn
#symload node with t1qag_get_node
(* ****** ****** *)
#symload lctn with t1iag_get_lctn
#symload node with t1iag_get_node
(* ****** ****** *)
#symload lctn with a1typ_get_lctn
#symload node with a1typ_get_node
(* ****** ****** *)
#symload lctn with d1arg_get_lctn
#symload node with d1arg_get_node
(* ****** ****** *)
#symload lctn with d1ecl_get_lctn
#symload node with d1ecl_get_node
(* ****** ****** *)
#symload lctn with s2cst_get_lctn
(* ****** ****** *)
#symload name with s2var_get_name
(* ****** ****** *)
#symload node with dimpl_get_node
(* ****** ****** *)
//
//
fun
fint_rep_bas
( rep
: strn
, bas
: sint): sint =
gseq_foldl
<strn><cgtz><sint>(rep, 0) where
{
#impltmp
foldl$fopr
<cgtz><sint>(r0, c0) = r0*bas+(c0-'0')
}
//
(* ****** ****** *)
//
fun
sort2_ofknd
(knd0: sint): sort2 =
(
if
(knd0=TYPESORT)
then the_sort2_type else
if
(knd0=VWTPSORT)
then the_sort2_vwtp else
if
(knd0=TBOXSORT)
then the_sort2_tbox else
if
(knd0=VTBXSORT)
then the_sort2_vtbx else
if
(knd0=PROPSORT)
then the_sort2_prop else
if
(knd0=VIEWSORT)
then the_sort2_view else
if
(knd0=TFLTSORT)
then the_sort2_tflt else
if
(knd0=VTFTSORT)
then the_sort2_vtft else S2Tnone0()
)
//
(* ****** ****** *)
//
fun
abstype_sort2
(tknd: token): sort2 =
(
  sort2_ofknd(knd0)) where
{
  val-T_ABSTYPE(knd0) = tknd.node()
} (*where*) // end of [abstype_sort2(tknd)]
//
(* ****** ****** *)
//
fun
sexpdef_sort2
(tknd: token): sort2 =
(
  sort2_ofknd(knd0)) where
{
  val-T_SEXPDEF(knd0) = tknd.node()
} (*where*) // end of [sexpdef_sort2(tknd)]
//
(* ****** ****** *)

local
//
fun
DLRDT
(nm0: strn): strn =
strn_tabulate_cfr
( n0 + 2
, lam i0 => fopr i0
) where
{
val n0 =
strn_length(nm0)
fun
fopr(i0: sint): char =
if
i0 = 0 then '$' else
(
if
i0 <= n0
then nm0[i0-1] else '.') }
//
fun
iseq0
(x0: g1exp): bool =
(
case+
x0.node() of
| G1Eid0(sym) =>
  (sym = $SYM.EQ0_symbl)
| _(*non-G1Eid0*) => false)
//
in(*in-of-local*)

#implfun
g1exp_nmspace
  (g1e0) =
(
case+
g1e0.node() of
|
G1Ea2pp
(x0, x1, x2) =>
(
if
iseq0(x0)
then
(
case+
x1.node() of
|
G1Eid0(sym) =>
let
val nm0 =
$SYM.symbl_get_name(sym)
in//let
optn_cons
(
$SYM.symbl_make_name(DLRDT(nm0)))
end (*let*) // end of [G1Eid0(sym)]
|
_(*non-G1Eid0*) => optn_nil(*void*))
else optn_nil((*void*)) // not(iseq0)
)
|
_(*non-G2Ea2pp*) => optn_nil((*void*))
) (*case+*) // end of [g1exp_nmspace(g1e0)]
//
end (*local*) // end of [local(g1exp_nmspace)]

(* ****** ****** *)

#implfun
trans12_q1arg
( env0,q1a0 ) =
(
case+
q1a0.node() of
|
Q1ARGsome(tok1, opt2) =>
let
//
val
opt2 =
trans12_sort1opt(env0,opt2)
//
val s2t2 =
(
case+ opt2 of
| optn_nil() =>
( // S2Tnone0()
  the_sort2_type (*void*) )
| optn_cons(s2t2) => s2t2 ): sort2
//
in//let
//
let
  val sid1 = sexpid_sym(tok1)
in//let
  s2var_make_idst(sid1, s2t2) endlet
//
end (*let*) // end of [Q1ARGsome(...)]
) where
{
(*
val () =
prerrln("trans12_q1arg: q1a0 = ", q1a0)
*)
//
} (*where*) // end of [trans12_q1arg(...)]

(* ****** ****** *)
//
#implfun
trans12_s1qag
  (env0, s1qa) =
let
val
loc0 = s1qa.lctn()
in//let
case+
s1qa.node() of
|
S1QAGsome(q1as) =>
s2qag_make_s2vs
(  loc0, s2vs  ) where
{
val s2vs =
trans12_q1arglst(env0, q1as) }
end (*let*) // end of [trans12_s1qag(...)]
//
(* ****** ****** *)
//
#implfun
trans12_t1qag
  (env0, t1qa) =
let
val
loc0 = t1qa.lctn()
in//let
case+
t1qa.node() of
|
T1QAGsome(q1as) =>
t2qag_make_s2vs
(  loc0, s2vs  ) where
{
val s2vs =
trans12_q1arglst(env0, q1as) }
end (*let*) // end of [trans12_t1qag(...)]
//
(* ****** ****** *)
//
#implfun
trans12_t1iag
  (env0, t1ia) = let
//
val
loc0 = t1ia.lctn()
//
in//let
case+
t1ia.node() of
|
T1IAGsome(s1es) =>
t2iag_make_s2es
(  loc0, s2es  ) where
{
val s2es =
trans12_s1explst(env0, s1es) }
end (*let*) // end-of-[trans12_t1iag(...)]
//
(* ****** ****** *)

local

fun
f0_a1typ
( env0:
! tr12env
, a1t0
: a1typ): s2exp =
(
case+
a1t0.node() of
|
A1TYPsome
(s1e1, topt) =>
trans12_s1exp(env0, s1e1))
//
fun
f0_a1typlst
( env0:
! tr12env
, a1ts
: a1typlst): s2explst =
(
list_map_e1nv
( a1ts, env0 )) where
{
//
#typedef x0 = a1typ
#typedef y0 = s2exp
#vwtpdef e1 = tr12env
//
#impltmp
map$fopr_e1nv
< x0><y0 ><e1>
(  x0 , e1  ) = f0_a1typ(e1, x0)
//
} (*where*) // end of [f0_a1typlst(...)]

(* ****** ****** *)
in//local
(* ****** ****** *)

#implfun
trans12_d1arg
( env0,darg ) = let
//
val
loc0 = darg.lctn()
//
(*
val () =
prerrln
("trans12_d1arg: darg = ", darg)
*)
//
in
case+
darg.node() of
|
D1ARGdyn1(dpid) =>
let
//
val
loc1 = dpid.lctn()
val
sym1 = dpatid_sym(dpid)
//
val
s1e1 =
s1exp(loc1, S1Eid0(sym1))
//
val
s2e1 =
trans12_s1exp(env0, s1e1)
//
in//let
(
  d2arg(loc0, D2ARGdyn1(s2e1)) )
end (*let*) // end of [D1ARGdyn1]
|
D1ARGsta0(s1qs) =>
let
val
(s2vs, s2ps) =
trans12_s1qualst(env0, s1qs)
in//let
d2arg(loc0, D2ARGsta0(s2vs, s2ps))
end (*let*) // end of [D1ARGsta0]
|
D1ARGdyn2(a1ts,aopt) =>
let
//
val npf1 =
(
case+ aopt of
|
optn_nil() => (-1)
|
optn_cons _ => list_length(a1ts)
) : sint // rend of [ val(npf1) ]
//
val
s2es = f0_a1typlst(env0, a1ts)
val
s2es =
(
case+ aopt of
|
optn_nil() => s2es
|
optn_cons(ats2) =>
(
list_append(s2es, ses2)) where
{
val
ses2 = f0_a1typlst(env0, ats2) }
) : s2explst//end-[optn_cons(ats2)]
//
in//let
  d2arg(loc0, D2ARGdyn2(npf1, s2es))
end (*let*) // end of [D1ARGdyn2(...)]
//
end (*let*) // end of [trans12_d1arg(...)]

end (*local*)//end-of-[local(trans12_d1arg)]

(* ****** ****** *)
//
fun
s2taload_from_fpath
( fpth : fpath
, dpar : d1parsed)
: @(sint,d2parsed) =
let
//
val fnm2 =
fpath_get_fnm2(fpth)
val opt2 =
the_d2parenv_pvsfind(fnm2)
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
d2parsed_of_trans12(dpar)
val (  ) =
the_d2parenv_pvsadd0(fnm2, dpar) }
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
  ("s2taload_from_fpath: dpar = ", dpar)
*)
}(*where*)//end-of-[s2taload_from_fpath(...)]
//
(* ****** ****** *)

#implfun
trans12_d1ecl
( env0,d1cl ) = let
//
(*
val loc0 =
d1cl.lctn((*0*))
val (  ) = prerrln
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
D1Cdefine _ => f0_define(env0, d1cl)
|
D1Cmacdef _ => f0_macdef(env0, d1cl)
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
|
D1Cabsopen _ => f0_absopen(env0, d1cl)
|
D1Cabsimpl _ => f0_absimpl(env0, d1cl)
//
|
D1Csymload _ => f0_symload(env0, d1cl)
//
|
D1Cinclude _ => f0_include(env0, d1cl)
|
D1Cstaload _ => f0_staload(env0, d1cl)
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
|
D1Cexcptcon _ => f0_excptcon(env0, d1cl)
|
D1Cdatatype _ => f0_datatype(env0, d1cl)
//
|
D1Cimplmnt0 _ => f0_implmnt0(env0, d1cl)
//
|
D1Cdynconst _ => f0_dynconst(env0, d1cl)
//
|D1Cnone0 // HX: it is an unharmful decl
 ( (*void*) ) => d2ecl_none0(d1cl.lctn())
//
|_(*otherwise*) =>
let
  val loc0 = d1cl.lctn()
in//let
  d2ecl_make_node(loc0, D2Cnone1( d1cl ))
end (*let*) // end of [_(*otherwise*)] // temp
//
end where
{
//
(* ****** ****** *)
//
fun
f0_define
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Cdefine
( tknd, gid0
, gmas, def1) = d1cl.node()
//
val sym0 = gexpid_sym(gid0)
//
val
def1 = trans11_gmdef(gmas, def1)
//
val () =
tr12env_add0_g1mac(env0, sym0, def1)
//
in//let
  d2ecl_make_node(loc0, D2Cd1ecl( d1cl ))
end (*let*) // end of [f0_define(env0,d1cl)]
//
(* ****** ****** *)
//
fun
f0_macdef
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Cmacdef
( tknd, gid0
, gmas, def1) = d1cl.node()
//
val sym0 = gexpid_sym(gid0)
//
in//let
  d2ecl_make_node(loc0, D2Cd1ecl( d1cl ))
end (*let*) // end of [f0_macdef(env0,d1cl)]
//
(* ****** ****** *)
//
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
//
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
val tres = S2Tfun1(s2ts, tres)
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
//
val-
D1Csexpdef
( tknd
, tok1
, smas
, topt, sdef) = d1cl.node()
//
(*
val () =
prerrln("f0_sexpdef: smas = ", smas)
val () =
prerrln("f0_sexpdef: topt = ", topt)
val () =
prerrln("f0_sexpdef: sdef = ", sdef)
*)
//
val
( ) = tr12env_pshlam0(env0)
//
val
svss =
trans12_s1maglst(env0, smas)
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
(
trans12_s1exp_stck
(env0 , sdef , s2t1)
) where
{ val s2t1 =
  trans12_sort1(env0, s1t1) }
) : s2exp // end of [val(sdef)]
//
val
sdef =
(
(
case+ tres of
|
S2Tnone0() => sdef
|
_(*non-S2Tnone0*) =>
(
  s2exp_stck(loc0,sdef,tres) )
) where
{
val tres = sexpdef_sort2(tknd)
}
) : s2exp // end of [val(sdef)]
//
(*
val () =
prerrln
( "f0_sexpdef: sdef = ", sdef )
*)
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
sdef = s2exp_lam1(s2vs, sdef)
} (*where*) // end-(list_cons)
) (*case+*) // end-of-[auxslam]
} (*where*) // end-of-[val(sdef)]
//
val () = tr12env_poplam0(env0)
//
val s2c1 = s2c1 where
{
//
val s2t2 = sdef.sort()
val sid1 = sexpid_sym(tok1)
val tdef = s2exp_stpize(sdef)
//
val s2c1 =
s2cst_make_idst(loc0, sid1, s2t2)
//
val (  ) = s2cst_set_sexp(s2c1,sdef)
val (  ) = s2cst_set_styp(s2c1,tdef)
//
(*
val (  ) =
prerrln("f0_sexpdef: s2c1 = ", s2c1)
val (  ) =
prerrln("f0_sexpdef: sdef = ", sdef)
val (  ) =
prerrln("f0_sexpdef: tdef = ", tdef)
*)
//
} (*where*) // end of [val(s2c1)=s2c1]
//
in//let
//
(
d2ecl_make_node
(loc0, D2Csexpdef(s2c1, sdef))) where
{
val () = tr12env_add1_s2cst(env0, s2c1) }
//
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
  abstype_sort2(tknd)
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
S2Tfun1
(s2ts, f1_stss(stss, tres)))
}
//
(*
val () =
prerrln
("f0_abstype: tfun = ", tfun)
*)
//
in//let
let
val s2c1 =
s2cst_make_idst(loc0, sid1, tfun)
val atdf =
trans12_a1tdf_stck(env0, atdf, tres)
in//let
let
  val () =
  tr12env_add1_s2cst( env0, s2c1 )
in//let
  d2ecl(loc0, D2Cabstype(s2c1, atdf))
end (*let*)
end (*let*)
end (*let*) // end of [f0_abstype(env0,d1cl)]
//
(* ****** ****** *)
//
local
//
#typedef
s2vss = list(s2varlst)
//
(* ****** ****** *)
//
fun
f2_svar
( s2v1: s2var
, s2t1: sort2): void =
(
case+
s2v1.sort() of
|
S2Tnone0() =>
s2v1.sort(s2t1)
|
_(*non-S2Tnone0*) => ())
//
and
f2_s2vs
( s2vs
: s2varlst
, s2ts
: sort2lst): void =
(
case+ s2vs of
|
list_nil() => ()
|
list_cons(s2v1, s2vs) =>
(
case+ s2ts of
|
list_nil() => ()
|
list_cons(s2t1, s2ts) =>
(
  f2_s2vs(s2vs, s2ts)) where
{
  val () = f2_svar(s2v1, s2t1) }
)
)
//
fun
f2_svss
( svss: s2vss
, tres: sort2): void =
(
case+ svss of
|
list_nil() => ()
|
list_cons
(s2vs, svss) =>
(
case+ tres of
|
S2Tfun1(s2ts, tres) =>
let
val () =
f2_s2vs(s2vs, s2ts)
in//let
f2_svss(svss, tres) end
|_(*non-S2Tfun1*) => ((*void*))))
//
(* ****** ****** *)
//
fun
f1_sqid
( env0:
! tr12env
, sqid: s1qid): simpl =
simpl
(sqid.lctn()
,SIMPLall1(sqid,s2cs)) where
{
val s2cs =
(
case+ sqid of
|
S1QIDnone(tok1) =>
let
val sid1 =
sexpid_sym(tok1)
val opt1 =
tr12env_find_s2itm(env0, sid1)
in//
case+ opt1 of
| ~
optn_vt_nil() =>
list_nil((*void*))
| ~
optn_vt_cons(s2i1) =>
(
case+ s2i1 of
|
S2ITMcst
( s2cs ) => s2cs | _ => list_nil()
) (*case+*) // end of [optn_vt_cons]
end (*let*) // end of [S1QIDnone(tok1)]
|
S1QIDsome(tqua, tok1) =>
let
val sid1 =
sexpid_sym(tok1)
val opt1 =
tr12env_qfind_s2itm(env0, tqua, sid1)
//
in//let
//
case+ opt1 of
| ~
optn_vt_nil() =>
list_nil((*void*))
| ~
optn_vt_cons(s2i1) =>
(
case+ s2i1 of
|
S2ITMcst
( s2cs ) => s2cs | _ => list_nil()
) (*case+*) // end of [optn_vt_cons]
//
end (*let*) // end of [S1QIDsome(...)]
) : s2cstlst // end-of-val-(   s2cs   )
} (* where *) // end of [f1_sqid(env0,sqid)]
//
fun
f1_smas
( env0:
! tr12env
, smas
: s1maglst): s2vss =
(
list_map_e1nv
< x0><y0 ><e1>
( smas, env0 )) where
{
#typedef x0 = s1mag
#vwtpdef e1 = tr12env
#typedef y0 = s2varlst
#impltmp
map$fopr_e1nv
< x0><y0 ><e1>
(   x0, e1   ) = trans12_s1mag(e1, x0)
} (* where *) // end of [f1_smas(env0,...)]
//
(* ****** ****** *)
//
fun
f1_lams
( env0:
! tr12env
, svss
: s2vss
, tres
: sort1opt
, s1e2: s1exp): s2exp =
(
case+ svss of
|
list_nil() =>
(
case tres of
|
optn_nil() =>
trans12_s1exp_impr(env0, s1e2)
|
optn_cons(s1t1) =>
trans12_s1exp_stck
( env0
, s1e2,trans12_sort1(env0,s1t1))
)
|
list_cons(s2vs, svss) =>
let
//
val () = 
tr12env_add0_s2varlst
(   env0  ,  s2vs   ) in//let
//
(
  s2exp_lam1(s2vs, s2e2) ) where
{ val
  s2e2 =
  f1_lams(env0, svss, tres, s1e2) }
end (*let*) // end of [list_cons(s2vs,svss)
)
//
(* ****** ****** *)
in//local
(* ****** ****** *)

fun
f0_absopen
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
val
loc0 = d1cl.lctn()
val-
D1Cabsopen
(tknd, sqid) = d1cl.node()
in//let
let
//
val
simp = f1_sqid(env0, sqid)
//
val
simp =
(
case-
simp.node() of
(*
|
SIMPLone1 _ => simp
*)
|
SIMPLall1
(sqid, s2cs) =>
if
list_singq(s2cs)
then
simpl_make_node
( simp.lctn()
, SIMPLone1(s2cs.head())) else simp)
//
in//let
  d2ecl(loc0, D2Cabsopen(tknd, simp))
end (*let*)
end (*let*) // end of [f0_absopen(env0,d1cl)]

(* ****** ****** *)

fun
f0_absimpl
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
//
val-
D1Cabsimpl
( tknd
, sqid
, smas
, tres
, sdef) = d1cl.node()
//
val
sqid = f1_sqid(env0, sqid)
val
svss = f1_smas(env0, smas)
//
val () =
let
val-
SIMPLall1
(sqid, s2cs) = sqid.node()
in//let
if
list_singq(s2cs)
then // HX: sort-checking
let
  val
  s2c1 = s2cs.head((*nil*))
in
  f2_svss(svss, s2c1.sort())
end // then // end-of-[ if ]
end (*let*) // end of [val()]
//
val () =
tr12env_pshlam0(env0)
val
sdef =
f1_lams(env0,svss,tres,sdef)
//
val () = tr12env_poplam0(env0)
//
val sqid =
let
val-
SIMPLall1
(sqid, s2cs) = sqid.node()
in//let
//
if//if1
list_singq(s2cs)
then
let//if1
val s2c1 = s2cs.head()
in(*let*)
simpl
(sqid.lctn(), SIMPLone1(s2c1))
end//then
else//if1
let
val sopt =
list_filter<x0>(s2cs) where
{ #typedef x0 = s2cst
  #impltmp
  filter$test<x0>(s2c1) =
  (sdef.sort() <= s2c1.sort()) }
in//let
//
if//if2
list_singq(sopt)
then
let//if2
val s2c1 = sopt.head()
in(*let*)
  simpl
  (sqid.lctn(), SIMPLone1(s2c1))
end//then
else//if2
(
  simpl
  ( sqid.lctn()
  , SIMPLopt2(sqid, s2cs, sopt)))
// end of [ if2-then-else ]
//
end (*let*) // end of [ if1(s2cs) ]
//
end (*let*) // end of [ val(sqid) ]
//
in//let
d2ecl(loc0, D2Cabsimpl(tknd, sqid, sdef))
end (*let*) // end of [f0_absimpl(env0,d1cl)]

(* ****** ****** *)

end (*local*) // end of [f0(absopen/absimpl)]
//
(* ****** ****** *)
//
fun
f0_symload
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Csymload
( tknd
, sym1
, dqid, gopt) = d1cl.node()
//
val dopt =
(
case+ dqid of
|
D1QIDnone(tok1) =>
let
val
did1 = dexpid_sym(tok1)
in//let
tr12env_find_d2itm(env0,did1)
end (*let*) // D1QIDnone(...)
|
D1QIDsome(tqua,tok1) =>
let
val
did1 = dexpid_sym(tok1)
in//let
tr12env_qfind_d2itm(env0, tqua, did1)
end (*let*) // D1QIDsome(...)
) : d2itmopt_vt // end-of-[val(dopt)]
//
val dptm =
(
case+ dopt of
| ~
optn_vt_nil
( (*void*) ) =>
D2PTMnone(dqid)
| ~
optn_vt_cons
(   ditm   ) =>
let
val pval = f1_pval(gopt)
in//let
  D2PTMsome(pval, ditm) end): d2ptm
//
val d2ps = let
//
val opt1 =
tr12env_find_d2itm(env0, sym1)
//
in (* in-of-let *)
//
case+ opt1 of
| ~
optn_vt_nil() =>
list_nil((*void*))
| ~
optn_vt_cons(d2i1) =>
(
case+ d2i1 of
|
D2ITMsym(_, d2ps) => d2ps
|
_(*non-D2ITMsym*) =>
list_sing(D2PTMsome(0, d2i1)))
//
end : d2ptmlst // end of [val(d2ps)]
//
in//let
//
let
val
ditm =
D2ITMsym
(sym1, list_cons(dptm, d2ps))
//
(*
val () =
prerrln("f0_symload: ditm = ", ditm)
*)
//
val () =
tr12env_add0_d2itm(env0, sym1, ditm)
in
  d2ecl_make_node
  (loc0, D2Csymload(tknd, sym1, dptm))
end//let
//
end where
{
//
fun
f1_pval
(gopt: g1expopt): sint =
(
case+ gopt of
|optn_nil
 ((*void*)) => 0 // default
|optn_cons(gexp) =>
(
case+
gexp.node() of
|G1Eint(tint) =>
(
(*
prerrln(
"f1_pval: tint = ", tint);
*)
case-
tint.node() of
| T_INT01(rep) =>
  fint_rep_bas(rep, 10)
| T_INT02(bas, rep) =>
  fint_rep_bas(rep, bas)
| T_INT03(bas, rep, _) =>
  fint_rep_bas(rep, bas) )
|_(*non-G1Eint*) => ( -1 ) // HX:error
)
) where
{
(*
val () = prerrln
("f0_symload: f1_pval: gopt = ", gopt)
*)
} (*where*) // end of [ f1_pval(gopt) ]
//
} (*where*) // end of [f0_symload(env0,d1cl)]
//
(* ****** ****** *)
//
fun
f0_include
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Cinclude
( knd0
, tknd, gsrc
, fopt, dopt) = d1cl.node()
//
(*
val () =
prerrln(
"f0_include(12): dopt = ", dopt)
*)
//
val dopt =
(
case+ dopt of
|
optn_nil() => optn_nil(*nil*)
|
optn_cons(dcls) =>
optn_cons
(trans12_d1eclist(env0, dcls)))
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
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
val-
D1Cstaload
( knd0
, tknd, gsrc
, fopt, dopt) = d1cl.node()
//
var
dres:
s2taloadopt = S2TALOADnone(*0*)
//
val dopt =
(
case+ fopt of
|
optn_nil() =>
optn_nil((*void*))
|
optn_cons(fpth) =>
let
  val-
  optn_cons@(shrd, dpar) = dopt
in//let
optn_cons
(s2taload_from_fpath(fpth, dpar))
end // let
) :
optn@(sint,d2parsed)//[val(dopt)]
//
val gsym =
(
case+
g1exp_nmspace
 (  gsrc  ) of
|optn_nil() =>
($SYM.DLRDT_symbl)
|optn_cons( gsym ) => gsym): sym_t
//
(*
val (  ) =
prerrln("f0_staload: gsym = ", gsym)
val (  ) =
prerrln("f0_staload: gsrc = ", gsrc)
*)
//
val (  ) =
(
case+ dopt of
//
|optn_nil() =>
let
val
gopt = f1_geid(gsrc)
in//let
//
case+ gopt of
|
optn_nil() => ()
|
optn_cons(sym0) =>
let
//
val
name = sym0.name()
val
sym1 =
symbl(strn_append(name, "."))
val
sopt =
tr12env_find_s2qua(env0, sym1)
//
in//let
case+ sopt of
| ~
optn_vt_nil() => ()
| ~
optn_vt_cons(s2i0) =>
(
case+ s2i0 of
|S2ITMenv(envs) =>
(
tr12env_add1_f2env
(env0, gsym, fenv)) where
{val-
 // HX: [envs] not empty
 list_cons(fenv, _) = envs
 val () =
 (dres := S2TALOADfenv(fenv)) }
|_(* non-S2ITMenv *) => ((*0*)))
endlet//end-of-[optn_cons(sym0)]
//
end (*let*) // end of [optn_nil()]
//
|optn_cons
@(shrd, dpar) =>
tr12env_add1_f2env
(env0, gsym, fenv) where
{
//
val
fenv = f2env_of_d2parsed(dpar)
//
val () =
(dres := S2TALOADdpar(shrd, dpar)) }
)
//
in//let
d2ecl_make_node
(
loc0,
D2Cstaload(knd0, tknd, gsrc, fopt, dres))
end where // end-of-[f0_staload(env0,...)]
{
fun
f1_geid
(gexp: g1exp): optn(sym_t) =
(
case+
gexp.node() of
|G1Eid0(sym1) =>
optn_cons(sym1)
|G1Ea2pp
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
G1Eid0(sym2) =>
optn_cons(sym2)
| _ => optn_nil((*void*)))//if
| _(*non-G1Eid0*) => optn_nil())
//
| _(* otherwise *) => optn_nil()) // f1_geid
//
} (*where*) // end of [f0_staload(env0, d1cl)]
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
tfun = S2Tfun1(targ, s2t0)
val
s2c1 =
s2cst_make_idst(loc1, sid1, tfun)
//
(*
val () =
prerrln("f2_d1t0: tok1 = ", tok1)
val () =
prerrln("f2_d1t0: tfun = ", tfun)
val () =
prerrln("f2_d1t0: s2c1 = ", s2c1)
*)
//
in//let
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
val recq =
(
case+
tknd.node() of
| T_VAL(vlk) =>
  valkind_recq(vlk)
| _(*else*) => false): bool
//
val d2ps =
list_trans12_fnp
(env0, d1vs, f1_dval) where
{
fun
f1_dval
( env0:
! tr12env
, dval: d1valdcl): d2pat =
let
val
dpat =
d1valdcl_get_dpat(dval)
in//let
trans12_d1pat(env0,dpat) end
} (*where*)//end-of-(f1_dval)
//
(*
val () =
prerrln("f0_valdclst:tknd = ", tknd)
val () =
prerrln("f0_valdclst:recq = ", recq)
val () =
prerrln("f0_valdclst:d2ps = ", d2ps)
*)
//
val (  ) =
if
(recq) then
tr12env_add0_d2ps(env0, d2ps)
//
val d2vs =
trans12_d1valdclist(env0, d2ps, d1vs)
//
val (  ) =
if
not(recq)
then tr12env_add0_d2ps(env0, d2ps)
//
in//let
  d2ecl(loc0, D2Cvaldclst(tknd, d2vs))
end (*let*) // end of [f0_valdclst(env0,d1cl)]

(* ****** ****** *)

local

fun
f1_add0_d2vs
( env0:
! tr12env
, d2vs
: d2vardclist): void =
(
case+ d2vs of
|
list_nil() => ((*void*))
|
list_cons(d2v1, d2vs) =>
(
f1_add0_d2vs
(env0, d2vs)) where
{
//
val dpid =
d2vardcl_get_dpid(d2v1)
val vpid =
d2vardcl_get_vpid(d2v1)
//
val (  ) = //HX:non-recursive
tr12env_add0_d2var(env0, dpid)
val (  ) = //HX:non-recursive
tr12env_add0_d2varopt(env0, vpid) }
//
) (*case+*) // end of [f1_add0_d2vs(...)]

in//local

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
val (  ) = f1_add0_d2vs(env0, d2vs)
//
in//let
  d2ecl(loc0, D2Cvardclst(tknd, d2vs))
end (*let*) // end of [f0_vardclst(env0,d1cl)]

end (*local*) // end of [ local(f0_vardclst) ]

(* ****** ****** *)
//
fun
f0_fundclst
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
//
val-
D1Cfundclst
( tknd
, tqas, d1fs) = d1cl.node()
//
val recq =
(
case+
tknd.node() of
| T_FUN(fnk) =>
  funkind_recq(fnk)
| _(*else*) => false): bool
//
val d2vs =
list_trans12_fnp
(env0, d1fs, f1_dfun) where
{
fun
f1_dfun
( env0:
! tr12env
, dfun: d1fundcl): d2var =
let
val
dpid =
d1fundcl_get_dpid(dfun)
in//let
trans12_d1pid(env0,dpid) end
} (*where*)//end-of-(f1_dfun)
//
(*
val () =
prerrln
("f0_fundclst: tknd = ", tknd)
val () =
prerrln
("f0_fundclst: recq = ", recq)
val () =
prerrln
("f0_fundclst: d2vs = ", d2vs)
*)
//
val (  ) =
if
recq then
(
tr12env_add0_d2vs(env0, d2vs)) 
//
val (  ) = // enter
tr12env_pshlam0(env0) // enter
//
val tqas =
(
 trans12_t1qaglst(env0, tqas))
val (  ) =
(
 tr12env_add0_tqas(env0, tqas))
//
val d2fs =
trans12_d1fundclist
( env0
, d2vs(*names*), d1fs(*impls*))
//
val (  ) =
tr12env_poplam0(env0) // leave
//
val (  ) =
if
not(recq) then
(
  tr12env_add0_d2vs(env0, d2vs))
//
val d2cs =
(
  list_map(d2vs)
) where
{
//
#typedef x0 = d2var
#typedef y0 = d2cst
//
#impltmp
map$fopr
<x0><y0>
(  x0  )=d2cst_make_dvar(x0,tqas) }
//
val () =
(
 if//HX: [d2cs] only for templates!
 list_consq(tqas)
 then tr12env_add1_d2cs(env0, d2cs))
//
(*
val () =
prerrln("f0_fundclst: d2cs = ", d2cs)
*)
//
in//let
d2ecl_make_node
( loc0
, D2Cfundclst(tknd, tqas, d2cs, d2fs) )
end (*let*) // end of [f0_fundclst(env0,d1cl)]
//
(* ****** ****** *)
//
fun
f0_excptcon
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
val
loc0 = d1cl.lctn()
val-
D1Cexcptcon
( tknd, tcns) = d1cl.node()
//
val d2cs =
trans12_d1tcnlst
(env0, tcns, s2c0, svss) where
{
  val svss = list_nil(*void*)
  val s2c0 = the_s2cst_excptn()
}
//
in//let
//
let
val () =
tr12env_add1_d2conlst(env0, d2cs)
in//let
  d2ecl(loc0, D2Cexcptcon(d1cl, d2cs))
end (*let*)
//
end (*let*) // end of [f0_excptcon(env0,d1cl)]
//
(* ****** ****** *)
//
fun
f0_datatype
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
//
val-
D1Cdatatype
( tknd
, d1ts, wdcs) = d1cl.node()
//
val
s2cs =
trans12_d1typlst
(env0, d1ts, s2t0) where
{
val s2t0 =
(
case-
tknd.node() of
|
T_DATATYPE(knd0) =>
if
sortlin(knd0) = 0
then the_sort2_tbox
else the_sort2_vtbx):sort2 }
//
val
dcls = f0_wdeclseq(env0, wdcs)
//
val () = // HX: processing [d2cs]
trans12_d1tsclst(env0, d1ts, s2cs)
//
in//let
  d2ecl(loc0, D2Cdatatype(d1cl, s2cs))
end (*let*) // end of [f0_datatype(env0,d1cl)]
//
and
f0_wdeclseq
( env0:
! tr12env
, wdcs: wd1eclseq): d2eclist =
(
case+ wdcs of
|
WD1CSnone
((*void*)) => list_nil()
|
WD1CSsome
(  d1cs  ) => trans12_d1eclist(env0, d1cs)
) (*case+*) // end of [f0_wdeclseq(env0,wdcs)]
//
(* ****** ****** *)

local
//
fun
f1_dqid
( env0:
! tr12env
, dqid: d1qid): dimpl =
(
if
list_singq(d2cs)
then
let
val
d2c1 = d2cs.head()
in
dimpl
(loc0,DIMPLone1(d2c1))
end
else
dimpl
(loc0, DIMPLall1(dqid, d2cs))
) where
{
//
val loc0 = dqid.lctn()
//
(*
val () =
prerrln("f1_dqid: loc0 = ", loc0)
val () =
prerrln("f1_dqid: dqid = ", dqid)
*)
//
val d2cs =
(
case+ dqid of
|
D1QIDnone(tok1) =>
let
  val sym1 = dexpid_sym(tok1)
  val opt1 =
  tr12env_find_d2itm(env0, sym1)
in//let
//
case+ opt1 of
| ~
optn_vt_nil() =>
list_nil((*void*))
| ~
optn_vt_cons(d2i1) =>
(
case+ d2i1 of
|
D2ITMcst
( d2cs ) => d2cs | _ => list_nil()
) (*case+*) // end of [optn_vt_cons]
//
end (*let*) // end of [D1QIDnone(tok1)]
|
D1QIDsome(tqua, tok1) =>
let
val
sym1 = dexpid_sym(tok1)
val
opt1 =
tr12env_qfind_d2itm(env0, tqua, sym1)
in//let
//
case+ opt1 of
| ~
optn_vt_nil
((*0*)) => list_nil((*void*))
| ~
optn_vt_cons(d2i1) =>
(
case+ d2i1 of
|
D2ITMcst(d2cs)=>d2cs | _ => list_nil())
//
end (*let*) // end of [ D1QIDsome(...) ]
) : d2cstlst // end-of-val-(    d2cs    )
//
} (* where *) // end of [f1_dqid(env0,dqid)]
//
in//local
//
fun
f0_implmnt0
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val-
D1Cimplmnt0
( tknd
, sqas, tqas
, dqid
, tias, f1as
, sres, dexp) = d1cl.node()
//
val dimp = f1_dqid(env0, dqid)
//
in//let
case+
dimp.node() of
| DIMPLone1 _ =>
(
  f0_implmnt0_one1(env0, d1cl, dimp) )
|
_(* DIMPLall1 *) =>
(
  f0_implmnt0_all1(env0, d1cl, dimp) )
end where
{
//
val loc0 = d1cl.lctn()
//
(*
val (  ) =
prerrln("f0_implmnt0(12): loc0 = ", loc0)
val (  ) =
prerrln("f0_implmnt0(12): d2cl = ", d1cl)
*)
//
} (*where*)//end-of-[f0_implmnt0(env0,d1cl)]

(* ****** ****** *)

and
f0_implmnt0_one1
( env0:
! tr12env
, d1cl: d1ecl
, dimp: dimpl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
//
val d2c1 =
(
case-
dimp.node() of
|DIMPLone1(d2c1) => d2c1)
//
val-
D1Cimplmnt0
( tknd
, sqas, tqas
, dqid
, tias, f1as
, sres, dexp) = d1cl.node()
//
(*
val sqas =
trans12_s1qaglst(env0, sqas)
val tqas =
trans12_t1qaglst(env0, tqas)
*)
//
in//let
  f0_implmnt0_all1(env0, d1cl, dimp)
end (*end*)//end-[f0_implmnt0_one1(env0,...)]

(* ****** ****** *)

and
f0_implmnt0_all1
( env0:
! tr12env
, d1cl: d1ecl
, dimp: dimpl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
//
val-
D1Cimplmnt0
( tknd
, sqas, tqas
, dqid
, tias, f1as
, sres, dexp) = d1cl.node()
//
val sqas =
trans12_s1qaglst(env0, sqas)
val tqas =
trans12_t1qaglst(env0, tqas)
//
val (  ) =
tr12env_pshlam0(env0)//enter
val (  ) =
tr12env_add0_sqas(env0, sqas)
val (  ) =
tr12env_add0_tqas(env0, tqas)
//
val tias =
  trans12_t1iaglst(env0, tias)
val f2as =
  trans12_f1arglst(env0, f1as)
//
val (  ) =
tr12env_add0_f2as( env0, f2as )
//
val
sres = trans12_s1res(env0, sres)
val
dexp = trans12_d1exp(env0, dexp)
//
// HX: poplam0: pshlam0 exit
val (  ) = tr12env_poplam0(env0)
//
(*
val () =
prerrln("f0_implmnt0: dimp = ", dimp)
val () =
prerrln("f0_implmnt0: sqas = ", sqas)
val () =
prerrln("f0_implmnt0: tqas = ", tqas)
val () =
prerrln("f0_implmnt0: tias = ", tias)
val () =
prerrln("f0_implmnt0: f2as = ", f2as)
val () =
prerrln("f0_implmnt0: sres = ", sres)
val () =
prerrln("f0_implmnt0: dexp = ", dexp)
*)
//
in//let
d2ecl
(
loc0,
D2Cimplmnt0
(tknd,sqas,tqas,dimp,tias,f2as,sres,dexp))
end where // end-of-let
{
//
(*
val () =
prerrln("f0_implmnt0_all1: d1cl = ", d1cl)
*)
//
} (*where*)//end-[f0_implmnt0_all1(env0,...)]
//
end (*local*) // end of [local(f0_implmnt0...)]

(* ****** ****** *)
//
fun
f0_dynconst
( env0:
! tr12env
, d1cl: d1ecl): d2ecl =
let
//
val
loc0 = d1cl.lctn()
//
val-
D1Cdynconst
( tknd
, tqas, d1cs) = d1cl.node()
//
val
tqas =
trans12_t1qaglst(env0, tqas)
//
val
d2cs =
trans12_d1cstdclist(env0,tknd,d1cs,tqas)
//
in//let
d2ecl(loc0, D2Cdynconst(tknd, tqas, d2cs))
end (*let*) // end of [f0_dynconst(env0,d1cl)]
//
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
) (*case+*)
// end of [trans12_a1tdf_stck(env0,atdf,tres)]
//
(* ****** ****** *)

local
//
(*
datatype
d1typ_node =
|
D1TYPnode of
( token
, t1maglst
, sort1opt(*res*), d1tcnlst)
*)
//
fun
f0_t1as
( env0:
! tr12env
, t1as
: t1arglst): sort2lst =
(
list_map_e1nv
< x0><y0 ><e1>(t1as, env0)) where
{
//
#typedef x0 = t1arg
#typedef y0 = sort2
#vwtpdef e1 = tr12env
//
#impltmp
map$fopr_e1nv
< x0><y0 ><e1>
(   x0, e1   ) =
(
case+
x0.node() of
|
T1ARGsome
(s1t1, topt) => trans12_sort1(e1, s1t1))
}
//
fun
f0_tmas
( env0:
! tr12env
, tmas
: t1maglst
, tres: sort2): sort2 =
(
case+ tmas of
|
list_nil() => tres
|
list_cons(t1ma, tmas) =>
(
case+
t1ma.node() of
|
T1MAGlist(t1as) =>
S2Tfun1
(f0_t1as(env0,t1as),f0_tmas(env0,tmas,tres))
)
) (*case+*) // end of [f0_tmas(env0,tmas,tres)]
//
fun
f1_s2vs
( env0:
! tr12env
, t1as
: t1arglst
, s2ts
: sort2lst): s2varlst =
(
case+ t1as of
|
list_nil() => list_nil()
|
list_cons(t1a1, t1as) =>
let
val-
list_cons(s2t1, s2ts) = s2ts
in//let
//
case+
t1a1.node() of
T1ARGsome(s1t1, topt) =>
let
val s2v1 =
s2var_make_idst
( sym1 , s2t1 ) where
{
val sym1 =
(
case+ topt of
|optn_nil
((*void*)) => the_symbl_nil
|optn_cons
(  tok1  ) => sexpid_sym(tok1)
) : sym_t // end of [val(sid1)]
}
//
val (  ) =
tr12env_add0_s2var(env0, s2v1)
//
in//let
list_cons
(s2v1, f1_s2vs(env0, t1as, s2ts))
end (*let*) // end of [T1ARGsome(...)]
//
end (*let*) // end of [list_cons(...)]
) (*case+*) where
{
(*
val () =
prerrln
("trans12_d1typ: f1_s2vs: t1as = ", t1as)
*)
}(*where*)//end-of-[f1_s2vs(env0,t1as,s2ts)]
//
fun
f1_svss
( env0:
! tr12env
, tmas
: t1maglst
, tres: sort2): s2varlstlst =
(
case+ tmas of
|
list_nil() => list_nil()
|
list_cons(t1ma, tmas) =>
//
let
val-
S2Tfun1(s2ts, tres) = tres
in//let
case+
t1ma.node() of
T1MAGlist(t1as) =>
let
val s2vs =
f1_s2vs(env0, t1as, s2ts)
in//let
list_cons
(s2vs, f1_svss(env0, tmas, tres))
end (*let*) // end of [T1MAGlist(...)]
//
end (*let*) // end of [list_cons(...)]
//
) (*case+*) where
{
(*
val () =
prerrln
("trans12_d1typ: f1_svss: tmas = ", tmas)
*)
}(*where*)//end-of-[f1_svss(env0,tmag,tres)]
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
(*
#implfun
trans12_d1typ
(env0, d1t0, s2t0) =
let//let1
//
val+
D1TYPnode
( tok0, tmas
, sres, tcns) = d1t0.node()
//
val
sres =
(
case+ sres of
|
optn_nil() =>
(
  s2t0//tbox|vtbx
)
|
optn_cons(s1t0) =>
(
trans12_sort1(env0, s1t0)
)
) : sort2 // end-of-val(sres)
//
val () = tr12env_pshlam0(env0)
//
in//let1
//
let//let2
//
val
ltok = tok0.lctn()
val
sid0 = sexpid_sym(tok0)
val
s2t0 =
f0_tmas(env0, tmas, sres)
val
svss =
f1_svss(env0, tmas, s2t0)
val
s2c0 =
s2cst_make_idst(ltok, sid0, s2t0)
//
in//let2
//
s2c0 where
{
val
d2cs =
trans12_d1tcnlst
(env0, tcns, s2c0, svss)
val () = tr12env_poplam0(env0)
val () = s2cst_set_d2cs(s2c0, d2cs)
}
//
end//let2
//
end(*let1*) // end of [trans12_d1typ(env0,...)]
//
*)
//
#implfun
trans12_d1typ
(env0, d1t0, s2t0) =
let//let1
//
val+
D1TYPnode
( tok0, tmas
, sres, tcns) = d1t0.node()
//
val
sres =
(
case+ sres of
|
optn_nil() =>
(
  s2t0//tbox|vtbx
)
|
optn_cons(s1t0) =>
(
trans12_sort1(env0, s1t0)
)
) : sort2 // end-of-val(sres)
//
in//let1
//
let//let2
//
val
ltok = tok0.lctn()
val
sid0 = sexpid_sym(tok0)
val
s2t0 =
f0_tmas(env0, tmas, sres)
val
s2c0 =
s2cst_make_idst(ltok, sid0, s2t0)
//
in//let2
//
let
val () =
tr12env_add1_s2cst(env0, s2c0) in s2c0
end//let
//
end//let2
//
end(*let1*) // end of [trans12_d1typ(env0,...)]
//
(* ****** ****** *)
//
#implfun
trans12_d1tsc
(env0, d1t0, s2c0) =
let//let1
//
val+
D1TYPnode
( tok0, tmas
, sres, tcns) = d1t0.node()
//
val () = tr12env_pshlam0(env0)
//
in//let1
//
let//let2
//
val
s2t0 = s2c0.sort()
val
svss = f1_svss(env0, tmas, s2t0)
//
in//let2
//
let
val
d2cs =
trans12_d1tcnlst
(env0, tcns, s2c0, svss)
val () = tr12env_poplam0(env0)
val () = s2cst_set_d2cs(s2c0, d2cs)
val () = tr12env_add1_d2cs(env0, d2cs)
end//let
//
end//let2
//
end(*let1*) // end of [trans12_d1tsc(env0,...)]
//
end (*local*) // end of [ local(trans12_d1typ) ]

(* ****** ****** *)

local

(* ****** ****** *)
#typedef
s2vss = list(s2varlst)
#typedef
s2ess = list(s2explst)
(* ****** ****** *)
(*
datatype
d1tcn_node =
|
D1TCNnode of
( s1unilst
, token(*d0eid*)
, s1explst(*indices*)
, s1expopt(*argtypes*) )
*)
(* ****** ****** *)
//
fun
f1_s2vs
( s2vs
: s2varlst) : s2explst =
(
list_map<x0><y0>(s2vs)) where
{
#typedef x0 = s2var
#typedef y0 = s2exp
#impltmp
map$fopr<x0><y0>(x0) = s2exp_var(x0)
} (*case+*) (* end of [ f1_s2vs(s2vs) ] *)
//
fun
f1_svss
( svss
: s2vss): s2explstlst =
(
list_map<x0><y0>(svss)) where
{
#typedef x0 = s2varlst
#typedef y0 = s2explst
#impltmp map$fopr<x0><y0> = f1_s2vs }
//(*case+*) (* end of [ f1_svss(svss) ] *)
//
(* ****** ****** *)

fun
f1_sres
( loc0: loc_t
, s2e0: s2exp
, sess: s2ess) : s2exp =
(
case+ sess of
|
list_nil() => s2e0
|
list_cons
(s2es, sess) =>
(
  f1_sres(loc0, s2e0, sess)
) where
{
  val
  s2e0 =
  s2exp_apps(loc0, s2e0, s2es) }
) (*case+*) // end of [ f1_sres(loc0,...) ]

(* ****** ****** *)

fun
f0_sarg
( env0
: !tr12env
, sopt
: s1expopt
, npf1
: &sint >> _): s2explst =
(
case+ sopt of
|
optn_nil
((*void*)) =>
list_nil(*void*)
|
optn_cons(s1e0) =>
(
case+
s1e0.node() of
|
S1El1st(s1es) =>
trans12_s1explst_impr
(   env0   ,   s1es   )
|
S1El2st(ses1, ses2) =>
(
list_append(ses1, ses2)) where
{
val () =
(npf1 := list_length(ses1))
val
ses1 =
trans12_s1explst_impr(env0,ses1)
val
ses2 =
trans12_s1explst_prgm(env0,ses2)
}
|
_(*non-S1Elist*) =>
list_sing(trans12_s1exp_impr(env0,s1e0))
)
) (*case+*) // end of [f0_sarg(env0, ...)]

fun
f0_idxs
( env0:
! tr12env
, svss: s2vss
, s1is: s1explst): s2ess =
(
case+ s1is of
|
list_nil _ => f1_svss(svss)
|
list_cons _ => f0_s1is(env0, s1is)
) (*case+*) // end of [f0_idxs(env0, ...)]

and
f0_s1is
( env0:
! tr12env
, s1is: s1explst): s2ess =
(
case+ s1is of
|
list_nil() =>
list_nil(*void*)
|
list_cons(s1i0, s1is) =>
(
case+
s1i0.node() of
//
|
S1El1st(s1es) =>
(
list_cons
(s2es
,f0_s1is(env0, s1is))) where
{
val s2es =
trans12_s1explst(env0, s1es) }
//
|
S1El2st(ses1, ses2) =>
(
list_cons
(s2es
,f0_s1is(env0, s1is))) where
{
//
val ses1 =
trans12_s1explst(env0, ses1)
val ses2 =
trans12_s1explst(env0, ses2)
//
val s2es = list_append(ses1, ses2) }
//
|
_(* non-S1Elist *) =>
let
val s2es =
list_sing
(trans12_s1exp(env0, s1i0))
in//let
list_cons(s2es, f0_s1is(env0, s1is))
end (*let*) // end of [non-S1Elist(...)]
)
) (*case*) // end of [ f0_s1is(env0,s1is) ]

in (* in-of-local *)

#implfun
trans12_d1tcn
( env0
, t1cn
, s2c0, tqas, svss) =
(
d2con_make_idtp
(tok0, tqas, s2e0) where
{
//
val () =
tr12env_pshlam0(env0)
//
val
s2e0 = f0_s1us(env0, s1us)
//
val () = tr12env_poplam0(env0) }
) where
{
//
val+
D1TCNnode
( s1us
, tok0
, s1is, sarg) = t1cn.node()
//
val
ltok = tok0.lctn()
//
fun
f0_s1us
( env0:
! tr12env
, s1us: s1unilst): s2exp =
(
//
case+ s1us of
|
list_nil() =>
let
//
var npf1: sint = -1
//
val sess =
f0_idxs(env0, svss, s1is)
val sarg =
f0_sarg(env0, sarg, npf1)
//
val s2e0 =
s2exp_cst(s2c0)
val s2e0 =
f1_sres(ltok, s2e0, sess)
//
in
s2exp_fun1_nil(npf1,sarg,s2e0)
end (*let*) // end of [list_nil]
|
list_cons(s1u1, s1us) =>
let
//
val
(s2vs, s2ps) =
let
val+
S1UNIsome(s1qs) = s1u1.node()
in
  trans12_s1qualst(env0, s1qs)
end (*let*) // end-of-val(s2vs,s2ps)
//
in
  s2exp_uni0
  (s2vs, s2ps, f0_s1us(env0, s1us))
end (*let*) // end of [list_cons(_,_)'
//
) (*case+*) // end of [f0_s1us(env0,...)]
//
(*
val () =
prerrln("trans12_d1tcn: tok0 = ", tok0)
*)
(*
val () =
prerrln("trans12_d1tcn: s1us = ", s1us)
*)
//
} (*where*) // end of [trans12_d1tcn(env0,...)]

end (*local*) // end of [ local(trans12_d1tcn) ]

(* ****** ****** *)

#implfun
trans12_d1valdcl
( env0
, dpat, dval) =
let
//
val loc0 =
d1valdcl_get_lctn(dval)
//
(*
val dpat =
d1valdcl_get_dpat(dval)
val dpat =
trans12_d1pat(env0, dpat)
*)
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
in//let
d2valdcl_make_args(loc0, dpat, tdxp, wsxp)
end//let
(*let*)//end-of-[trans12_d1valdcl(env0,dval)]

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
in//let
d2vardcl_make_args(loc0,dpid,vpid,sres,dini)
end//let
(*let*)//end-of-[trans12_d1vardcl(env0,dvar)]

(* ****** ****** *)

#implfun
trans12_d1fundcl
( env0
, dvar, dfun) = let
//
val loc0 =
d1fundcl_get_lctn(dfun)
//
(*
val dpid =
d1fundcl_get_dpid(dfun)
*)
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
(*
val dpid =
trans12_d1pid(env0, dpid)
*)
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
tr12env_add0_f2arglst(env0, farg)
//
val
tdxp = trans12_teqd1exp(env0, tdxp)
//
val () = tr12env_poplam0(env0)//exit
//
in//let
(
  d2fundcl_make_args
  (loc0, dvar, farg, sres, tdxp, wsxp) )
end//let
(*let*)//end-of-[trans12_d1fundcl(env0,dfun)]

(* ****** ****** *)

local

(* ****** ****** *)
//
fun
f1_f2cl
(i0: sint): f2clknd =
( if
  (i0 = 0)
  then F2CLfun()
  else F2CLclo(1(*lin*)))
//
(* ****** ****** *)

fun
f1_sres
( i0: sint
, sres: s2res): s2exp =
(
case+ sres of
|
S2RESnone() => s2exp_none0()
|
S2RESsome(seff, s2e1) => s2e1
)

(* ****** ****** *)

fun
f1_d2a1
( i0: sint
, d2a1: d2arg
, sres: s2res): s2exp =
let
val
fres = f1_sres(i0, sres)
in//let
//
case+
d2a1.node() of
|
D2ARGsta0
(s2vs, s2ps) =>
s2exp_uni0(s2vs, s2ps, fres)
|
D2ARGdyn1(s2e1) =>
s2exp_fun1_full
( f2cl
, npf1, s2es, fres) where
{
val npf1 = (-1)
val f2cl = f1_f2cl(i0)
val s2es = list_sing(s2e1) }
|
D2ARGdyn2(npf1, s2es) =>
let
val f2cl = f1_f2cl(i0)
in//let
  s2exp_fun1_full
  (f2cl, npf1, s2es, fres) end
//
end (*let*) // end of [f1_d2a1(...)]

(* ****** ****** *)

fun
f1_d2as
( i0: sint
, d2as
: d2arglst
, sres: s2res): s2exp =
(
case+ d2as of
|
list_nil() => f1_sres(i0, sres)
|
list_cons
(d2a1, d2as) =>
(
//
case+ d2as of
|
list_nil() =>
f1_d2a1(i0, d2a1, sres)
|
list_cons _ =>
(
case+
d2a1.node() of
|
D2ARGsta0
(s2vs, s2ps) =>
let
val
fres =
f1_d2as(i0+0, d2as, sres)
in//let
  s2exp_uni0(s2vs, s2ps, fres)
end (*let*) // end of [D2ARGsta0(...)]
|
D2ARGdyn1(s2e1) =>
let
val npf1 = (-1)
val f2cl = f1_f2cl(i0)
val s2es = list_sing(s2e1)
val
fres = f1_d2as(i0+1, d2as, sres)
in//let
s2exp_fun1_full(f2cl, npf1, s2es, fres)
end (*let*) // end of [D2ARGdyn1(s2e1)]
|
D2ARGdyn2
(npf1, s2es) =>
let
val f2cl = f1_f2cl(i0)
val
fres = f1_d2as(i0+1, d2as, sres)
in//let
s2exp_fun1_full(f2cl, npf1, s2es, fres)
end (*let*) // end of [D2ARGdyn2(npf1,s2es)]
//
) (*case+*) // end of [list_cons]
//
) (*case+*) // end of [list_cons]
) (*case+*) // end of [f1_d2as(i0,d2as,sres)]

in//local

#implfun
trans12_d1cstdcl
( env0
, tknd
, dcst, tqas) = let
//
val loc0 =
d1cstdcl_get_lctn(dcst)
//
val dpid =
d1cstdcl_get_dpid(dcst)
//
val darg =
d1cstdcl_get_darg(dcst)
//
val sres =
d1cstdcl_get_sres(dcst)
val dres =
d1cstdcl_get_dres(dcst)
//
val () =
tr12env_pshlam0(env0)//enter
//
val () =
tr12env_add0_tqas(env0, tqas)
//
val
d2as =
trans12_d1arglst( env0 , darg )
//
val
sres = trans12_s1res(env0, sres)
val // d1res = teqd1exp
dres = trans12_teqd1exp(env0, dres)
//
val () = tr12env_poplam0(env0)//exit
//
val
d2c1 =
let
val
sfun = f1_d2as(0, d2as, sres)
in//let
  d2cst_make_idtp(dpid, tqas, sfun)
end (*let*) // end of [ val(d2c1) ]
//
(*
val () =
prerrln
("trans12_d1cstdcl: d2as = ", d2as)
val () =
prerrln
("trans12_d1cstdcl: sres = ", sres)
val () =
prerrln
("trans12_d1cstdcl: d2c1 = ", d2c1)
*)
//
in//let
let
  val () =
  tr12env_add1_d2cst( env0 , d2c1 )
in//let
  d2cstdcl(loc0, d2c1, d2as, sres, dres)
end//let
end//let
(*let*)//end-of-[trans12_d1cstdcl(env0,...)]

end (*local*)//end-[local(trans12_d1cstdcl)]

(* ****** ****** *)

#implfun
trans12_d1eclist
  (env0, dcls) =
(
list_trans12_fnp(env0, dcls, trans12_d1ecl))

(* ****** ****** *)
//
#implfun
trans12_q1arglst
  (env0, q1as) =
list_trans12_fnp(env0, q1as, trans12_q1arg)
#implfun
trans12_s1qaglst
  (env0, sqas) =
list_trans12_fnp(env0, sqas, trans12_s1qag)
#implfun
trans12_t1qaglst
  (env0, tqas) =
list_trans12_fnp(env0, tqas, trans12_t1qag)
#implfun
trans12_t1iaglst
  (env0, tias) =
list_trans12_fnp(env0, tias, trans12_t1iag)
//
(* ****** ****** *)
//
#implfun
trans12_d1arglst
  (env0, d1as) =
list_trans12_fnp(env0, d1as, trans12_d1arg)
//
(* ****** ****** *)

#implfun
trans12_d1typlst
(env0, d1ts, s2t0) =
(
list_map_e1nv
< x0><y0 ><e1>
( d1ts, env0 )) where
{
//
#typedef x0 = d1typ
#typedef y0 = s2cst
#vwtpdef e1 = tr12env
//
#impltmp
map$fopr_e1nv
< x0><y0 ><e1>
(   x0, e1   ) = trans12_d1typ(e1, x0, s2t0)
//
} (*where*) // end of [trans12_d1typlst(...)]

(* ****** ****** *)
//
#implfun
trans12_d1tsclst
(env0, d1ts, s2cs) =
(
case+ d1ts of
|
list_nil() => ((*void*))
|
list_cons(d1t1, d1ts) =>
(
case- s2cs of
|
list_cons(s2c1, s2cs) =>
let
val () =
trans12_d1tsc(env0, d1t1, s2c1)
in//let
trans12_d1tsclst(env0, d1ts, s2cs) end
)
) (*case+*) // end of [trans12_d1tsclst(...)]
//
(* ****** ****** *)

local

fun
f1_s2vs
( s2vs
: s2varlst): s2varlst =
(
case+
s2vs of
|
list_nil
((*void*)) => list_nil()
|
list_cons
(s2v1, s2vs) =>
(
if
(
s2v1.name()
=
the_symbl_nil)
then f1_s2vs(s2vs)
else list_cons(s2v1, f1_s2vs(s2vs))
)
) (*case+*) // end of [f1_s2vs(s2vs)]

(* ****** ****** *)

fun
f1_tqas
( s2c0
: s2cst
, svss
: s2varlstlst): t2qaglst =
(
case+
svss of
|
list_nil() =>
list_nil((*void*))
|
list_cons
(s2vs, svss) =>
(
case s2vs of
|list_nil _ =>
(
f1_tqas(s2c0, svss))
|
list_cons _ =>
let
val
s2vs = f1_s2vs(s2vs)
val
tqa1 = t2qag(s2c0.lctn(), s2vs)
in//let
list_cons(tqa1, f1_tqas(s2c0, svss))
end (*let*) // end of [list_cons(_,_)]
)
) (*case+*) // end of [f0_tqas(s2c0,svss)]

in(*in-of-local*)

#implfun
trans12_d1tcnlst
( env0
, tcns, s2c0, svss) =
(
list_map_e1nv
< x0><y0 ><e1>
( tcns, env0 )) where
{
#typedef x0 = d1tcn
#typedef y0 = d2con
#vwtpdef e1 = tr12env
//
val
tqas = f1_tqas(s2c0, svss)
//
#impltmp
map$fopr_e1nv
< x0><y0 ><e1>(x0, e1) =
trans12_d1tcn(e1, x0, s2c0, tqas, svss)
//
} (*where*) // end of [trans12_d1tcnlst(...)]

end (*local*) // end-[local(trans12_d1tcnlst)]

(* ****** ****** *)
//
#implfun
trans12_d1eclistopt
  (  env0,dopt  ) =
(
optn_trans12_fnp(env0, dopt, trans12_d1eclist))
//
(* ****** ****** *)
//
(*
#implfun
trans12_d1valdclist
  (env0, d1vs) =
(
list_trans12_fnp(env0, d1vs, trans12_d1valdcl))
*)
//
#implfun
trans12_d1valdclist
( env0
, d2ps, d1fs) =
(
case+ d1fs of
|
list_nil() => list_nil()
|
list_cons(d1f1, d1fs) =>
let
val-
list_cons(d2p1, d2ps) = d2ps
val
d2f1 =
trans12_d1valdcl(env0, d2p1, d1f1)
in//let
list_cons
( d2f1
, trans12_d1valdclist(env0, d2ps, d1fs))
end (*let*) // end of [ list_cons( ... ) ]
) (*case+*) // end of [trans12_d1valdclist(...)]
//
(* ****** ****** *)

#implfun
trans12_d1vardclist
  (env0, d1vs) =
(
list_trans12_fnp(env0, d1vs, trans12_d1vardcl))

(* ****** ****** *)
//
(*
#implfun
trans12_d1fundclist
  (env0, d1fs) =
(
list_trans12_fnp(env0, d1fs, trans12_d1fundcl))
*)
//
#implfun
trans12_d1fundclist
( env0
, d2vs, d1fs) =
(
case+ d1fs of
|
list_nil() => list_nil()
|
list_cons(d1f1, d1fs) =>
let
val-
list_cons(d2v1, d2vs) = d2vs
val
d2f1 =
trans12_d1fundcl(env0, d2v1, d1f1)
in//let
list_cons
( d2f1
, trans12_d1fundclist(env0, d2vs, d1fs))
end (*let*) // end of [ list_cons( ... ) ]
) (*case+*) // end of [trans12_d1fundclist(...)]
//
(* ****** ****** *)
//
#implfun
trans12_d1cstdclist
  (env0, tknd
  ,d1cs, tqas) =
(
list_map_e1nv
< x0>< y0><e1>(d1cs, env0)) where
{
//
#vwtpdef
e1 = tr12env
#typedef
x0 = d1cstdcl
#typedef
y0 = d2cstdcl
//
#impltmp
map$fopr_e1nv
<x0 >< y0><e1>
  (x0, e1) = trans12_d1cstdcl(e1,tknd,x0,tqas)
//
} (*where*) // end of [trans12_d1cstdclist(...)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_trans12_decl00.dats] *)
