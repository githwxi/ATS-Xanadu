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
Mon Aug 15 17:35:46 EDT 2022
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
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/tread01.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with d1ecl_get_lctn
#symload node with d1ecl_get_node
(* ****** ****** *)
#symload lctn with q1arg_get_lctn
#symload node with q1arg_get_node
#symload lctn with s1qag_get_lctn
#symload node with s1qag_get_node
#symload lctn with t1qag_get_lctn
#symload node with t1qag_get_node
#symload lctn with t1iag_get_lctn
#symload node with t1iag_get_node
(* ****** ****** *)
#symload lctn with d1valdcl_get_lctn
#symload lctn with d1vardcl_get_lctn
#symload lctn with d1fundcl_get_lctn
#symload lctn with d1cstdcl_get_lctn
(* ****** ****** *)
//
fun
d1ecl_errck
(lvl: sint
,dcl: d1ecl): d1ecl =
(
d1ecl
(dcl.lctn(), D1Cerrck(lvl, dcl)))
//
(* ****** ****** *)
//
fun
d1ecl_static_errck
( loc0: loc_t
, tknd: token
, dcl1: d1ecl): d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
( lvl+1
, d1ecl(loc0, D1Cstatic(tknd, dcl1)) )
end (*let*)//end-of-[d1ecl_static_errck]
//
fun
d1ecl_extern_errck
( loc0: loc_t
, tknd: token
, dcl1: d1ecl): d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
( lvl+1
, d1ecl(loc0, D1Cextern(tknd, dcl1)) )
end (*let*)//end-of-[d1ecl_extern_errck]
//
(* ****** ****** *)
fun
d1ecl_define_errck
( loc0: loc_t
, tknd: token
, geid: token
, gmas: g1maglst
, gopt: g1expopt): d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(
lvl+1,
d1ecl_make_node
(loc0,D1Cdefine(tknd,geid,gmas,gopt)))
end (*let*)//end-of-[d1ecl_define_errck]
(* ****** ****** *)
//
fun
d1ecl_local0_errck
( loc0: loc_t
, dcs1: d1eclist
, dcs2: d1eclist): d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(lvl+1,d1ecl(loc0,D1Clocal0(dcs1,dcs2)))
end (*let*) // end of [d1ecl_local0_errck]
//
(* ****** ****** *)
//
fun
d1ecl_stacst0_errck
( loc0
: loc_t
, tknd
: token
, sid0
: token
, tmas
: t1maglst
, s1t1: sort1): d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(
lvl+1
,
d1ecl
(loc0,D1Cstacst0(tknd,sid0,tmas,s1t1)))
end (*let*) // end of [d1ecl_stacst0_errck]
//
(* ****** ****** *)
//
fun
d1ecl_sortdef_errck
( loc0
: loc_t
, tknd
: token
, tid0
: token
, stdf: s1tdf): d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(lvl+1,
 d1ecl(loc0,D1Csortdef(tknd,tid0,stdf)))
end (*let*) // end of [d1ecl_sortdef_errck]
//
(* ****** ****** *)
//
fun
d1ecl_sexpdef_errck
( loc0
: loc_t
, tknd
: token
, seid
: token
, smas
: s1maglst
, tres
: sort1opt
, sdef: s1exp): d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(
lvl+1,
d1ecl_make_node
( loc0
, D1Csexpdef(tknd,seid,smas,tres,sdef)))
end (*let*) // end of [d1ecl_sexpdef_errck]
//
(* ****** ****** *)
//
fun
d1ecl_abstype_errck
( loc0
: loc_t
, tknd
: token
, seid
: token
, tmas
: t1maglst
, tres
: sort1opt
, atdf: a1tdf): d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(
lvl+1,
d1ecl_make_node
( loc0
, D1Cabstype(tknd,seid,tmas,tres,atdf)))
end (*let*) // end of [d1ecl_abstype_errck]
//
(* ****** ****** *)
//
fun
d1ecl_absimpl_errck
( loc0
: loc_t
, tknd
: token
, sqid
: s1qid
, smas
: s1maglst
, tres
: sort1opt
, sdef: s1exp): d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(
lvl+1,
d1ecl_make_node
( loc0
, D1Cabsimpl(tknd,sqid,smas,tres,sdef)))
end (*let*) // end of [d1ecl_absimpl_errck]
//
(* ****** ****** *)
//
fun
d1ecl_symload_errck
( loc0: loc_t
, tknd: token
, deid: sym_t
, dqid: d1qid
, gopt: g1expopt): d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(
lvl+1,
d1ecl_make_node
(loc0, D1Csymload(tknd,deid,dqid,gopt)))
end (*let*) // end of [d1ecl_symload_errck]
//
(* ****** ****** *)
//
fun
d1ecl_include_errck
( loc0: loc_t
, tknd: token
, g1e1: g1exp) : d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(lvl+1, d1ecl(loc0, D1Cinclude(tknd, g1e1)))
end (*let*) // end of [d1ecl_include_errck]
//
(* ****** ****** *)
//
fun
d1ecl_staload_errck
( loc0: loc_t
, tknd: token
, g1e1: g1exp) : d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(lvl+1, d1ecl(loc0, D1Cstaload(tknd, g1e1)))
end (*let*) // end of [d1ecl_staload_errck]
//
(* ****** ****** *)
//
fun
d1ecl_dyninit_errck
( loc0: loc_t
, tknd: token
, g1e1: g1exp) : d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(lvl+1, d1ecl(loc0, D1Cdyninit(tknd, g1e1)))
end (*let*) // end of [d1ecl_dyninit_errck]
//
(* ****** ****** *)
//
fun
d1ecl_datasort_errck
( loc0
: loc_t
, tknd
: token
, d1ts
: d1tstlst) : d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(lvl+1,d1ecl(loc0,D1Cdatasort(tknd,d1ts)))
end (*let*) // end of [d1ecl_datasort_errck]
//
(* ****** ****** *)
//
fun
d1ecl_valdclst_errck
( loc0
: loc_t
, tknd
: token
, d1cs
: d1valdclist): d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(lvl+1, d1ecl(loc0,D1Cvaldclst(tknd,d1cs)))
end (*let*) // end of [d1ecl_valdclst_errck]
//
(* ****** ****** *)
//
fun
d1ecl_vardclst_errck
( loc0
: loc_t
, tknd
: token
, d1cs
: d1vardclist): d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(lvl+1, d1ecl(loc0,D1Cvardclst(tknd,d1cs)))
end (*let*) // end of [d1ecl_vardclst_errck]
//
(* ****** ****** *)
//
fun
d1ecl_fundclst_errck
( loc0
: loc_t
, tknd
: token
, tqas
: t1qaglst
, d1cs
: d1fundclist): d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
( lvl+1
, d1ecl(loc0,D1Cfundclst(tknd,tqas,d1cs)) )
end (*let*) // end of [d1ecl_fundclst_errck]
//
(* ****** ****** *)
//
fun
d1ecl_implmnt0_errck
( loc0
: loc_t
, tknd
: token
, sqas
: s1qaglst
, tqas
: t1qaglst
, dqid
: d1qid
, tias
: t1iaglst
, fags
: f1arglst
, sres: s1res
, body: d1exp): d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(
lvl+1
,
d1ecl_make_node
( loc0
, D1Cimplmnt0
  ( tknd
  , sqas,tqas,dqid,tias,fags,sres,body ) ))
end (*let*) // end of [d1ecl_implmnt0_errck]
//
(* ****** ****** *)
//
fun
d1ecl_excptcon_errck
( loc0
: loc_t
, tknd
: token
, tcns
: d1tcnlst) : d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
(lvl+1, d1ecl(loc0,D1Cexcptcon(tknd,tcns)))
end (*let*) // end of [d1ecl_excptcon_errck]
//
(* ****** ****** *)
//
fun
d1ecl_datatype_errck
( loc0
: loc_t
, tknd
: token
, d1ts
: d1typlst
, wdcs
: wd1eclseq) : d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
( lvl+1
, d1ecl(loc0,D1Cdatatype(tknd,d1ts,wdcs)) )
end (*let*) // end of [d1ecl_datatype_errck]
//
(* ****** ****** *)
//
fun
d1ecl_dynconst_errck
( loc0
: loc_t
, tknd
: token
, tqas
: t1qaglst
, d1cs
: d1cstdclist): d1ecl =
let
val lvl = 0
in//let
d1ecl_errck
( lvl+1
, d1ecl(loc0,D1Cdynconst(tknd,tqas,d1cs)) )
end (*let*) // end of [d1ecl_dynconst_errck]
//
(* ****** ****** *)

#implfun
tread01_d1ecl
  (d1cl, err) =
(
case+
d1cl.node() of
//
|
D1Cd0ecl _ => d1cl
//
|
D1Cstatic _ => f0_static(d1cl, err)
|
D1Cextern _ => f0_extern(d1cl, err)
//
|
D1Cdefine _ => f0_define(d1cl, err)
//
|
D1Clocal0 _ => f0_local0(d1cl, err)
//
|
D1Cabssort _ => d1cl//HX:fixity-less
|
D1Cstacst0 _ => f0_stacst0(d1cl, err)
//
|
D1Csortdef _ => f0_sortdef(d1cl, err)
//
|
D1Csexpdef _ => f0_sexpdef(d1cl, err)
//
|
D1Cabstype _ => f0_abstype(d1cl, err)
|
D1Cabsopen _ => d1cl//HX:fixity-less
|
D1Cabsimpl _ => f0_absimpl(d1cl, err)
//
|
D1Csymload _ => f0_symload(d1cl, err)
//
|
D1Cinclude _ => f0_include(d1cl, err)
|
D1Cstaload _ => f0_staload(d1cl, err)
|
D1Cdyninit _ => f0_dyninit(d1cl, err)
//
|
D1Cdatasort _ => f0_datasort(d1cl, err)
//
|
D1Cvaldclst _ => f0_valdclst(d1cl, err)
|
D1Cvardclst _ => f0_vardclst(d1cl, err)
|
D1Cfundclst _ => f0_fundclst(d1cl, err)
//
|
D1Cimplmnt0 _ => f0_implmnt0(d1cl, err)
//
|
D1Cexcptcon _ => f0_excptcon(d1cl, err)
|
D1Cdatatype _ => f0_datatype(d1cl, err)
//
|
D1Cdynconst _ => f0_dynconst(d1cl, err)
//
|
_(*otherwise*) =>
let
val lvl = 1
in//let
( err := err+1; d1ecl_errck(lvl, d1cl) )
endlet // end of [ _(* otherwise *) ]
//
) where // end of [case+(d1cl.node())]
{
(* ****** ****** *)
//
val loc0 = d1cl.lctn()
//
(* ****** ****** *)
//
fun
f0_static
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Cstatic
( tknd, dcl1) = dcl.node()
//
val dcl1 = tread01_d1ecl(dcl1, err)
//
in
if
(e00=err)
then dcl else
d1ecl_static_errck(dcl.lctn(),tknd,dcl1)
end (*let*) // end of [ f0_static(dcl,err) ]
//
fun
f0_extern
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Cextern
( tknd, dcl1) = dcl.node()
//
val dcl1 = tread01_d1ecl(dcl1, err)
//
in
if
(e00=err)
then dcl else
d1ecl_extern_errck(dcl.lctn(),tknd,dcl1)
end (*let*) // end of [ f0_extern(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_define
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Cdefine
( tknd
, geid
, gmas, gopt) = dcl.node()
//
val
gopt = tread01_g1expopt(gopt, err)
//
in//let
if
(e00=err)
then (dcl) else
d1ecl_define_errck
( dcl.lctn(), tknd, geid, gmas, gopt )
end (*let*) // end of [ f0_define(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_local0
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D1Clocal0
(dcs1, dcs2) = dcl.node()
//
val dcs1 =
tread01_d1eclist(dcs1, err)
val dcs2 =
tread01_d1eclist(dcs2, err)
//
in
if
(e00=err)
then dcl else
d1ecl_local0_errck( loc, dcs1, dcs2 )
end (*let*) // end of [ f0_local0(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_stacst0
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Cstacst0
( tknd
, sid0
, tmas, s1t1) = dcl.node()
//
val
tmas =
tread01_t1maglst(tmas, err)
val
s1t1 = tread01_sort1(s1t1, err)
//
in//let
if
(e00=err)
then dcl else
d1ecl_stacst0_errck
( dcl.lctn(), tknd, sid0, tmas, s1t1 )
end (*let*) // end of [f0_stacst0(dcl,err)]
//
(* ****** ****** *)

fun
f0_sortdef
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D1Csortdef
( tknd
, tid0, stdf) = dcl.node()
//
val
stdf = tread01_s1tdf(stdf, err)
//
in//let
if
(e00=err)
then dcl else
d1ecl_sortdef_errck(loc,tknd,tid0,stdf)
end (*let*) // end of [f0_sortdef(dcl,err)]

(* ****** ****** *)

fun
f0_sexpdef
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Csexpdef
( tknd
, seid, smas
, tres, sdef) = dcl.node()
//
val
smas =
tread01_s1maglst(smas, err)
val
tres =
tread01_sort1opt(tres, err)
val
sdef = tread01_s1exp(sdef, err)
//
in//let
if
(e00=err)
then (dcl) else
d1ecl_sexpdef_errck
( dcl.lctn(), tknd,seid,smas,tres,sdef )
end (*let*) // end of [f0_sexpdef(dcl,err)]

(* ****** ****** *)

fun
f0_abstype
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Cabstype
( tknd
, seid, tmas
, tres, atdf) = dcl.node()
//
val
smas =
tread01_t1maglst(tmas, err)
val
tres =
tread01_sort1opt(tres, err)
val
atdf = tread01_a1tdf(atdf, err)
//
in//let
if
(e00=err)
then (dcl) else
d1ecl_abstype_errck
( dcl.lctn(), tknd,seid,tmas,tres,atdf )
end (*let*) // end of [f0_abstype(dcl,err)]

(* ****** ****** *)

fun
f0_absimpl
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Cabsimpl
( tknd
, sqid, smas
, tres, sdef) = dcl.node()
//
val
smas =
tread01_s1maglst(smas, err)
val
tres =
tread01_sort1opt(tres, err)
val
sdef = tread01_s1exp(sdef, err)
//
in//let
if
(e00=err)
then (dcl) else
d1ecl_absimpl_errck
( dcl.lctn(), tknd,sqid,smas,tres,sdef )
end (*let*) // end of [f0_absimpl(dcl,err)]

(* ****** ****** *)

fun
f0_symload
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Csymload
( tknd
, deid
, dqid, gopt) = dcl.node()
//
val gopt =
tread01_g1expopt(gopt, err)
//
in//let
if
(e00=err)
then (dcl) else
d1ecl_symload_errck
( dcl.lctn(), tknd, deid, dqid, gopt )
end (*let*) // end of [f0_symload(dcl,err)]

(* ****** ****** *)
//
fun
f0_include
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Cinclude
(tknd, g1e1) = dcl.node()
//
val g1e1 = tread01_g1exp(g1e1, err)
//
if
(e00=err)
then (dcl) else
d1ecl_include_errck(dcl.lctn(),tknd,g1e1)
end (*let*) // end of [f0_include(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_staload
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Cstaload
(tknd, g1e1) = dcl.node()
//
val g1e1 = tread01_g1exp(g1e1, err)
//
if
(e00=err)
then (dcl) else
d1ecl_staload_errck(dcl.lctn(),tknd,g1e1)
end (*let*) // end of [f0_staload(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_dyninit
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Cdyninit
(tknd, g1e1) = dcl.node()
//
val
g1e1 = tread01_g1exp(g1e1, err)
//
if
(e00=err)
then (dcl) else
d1ecl_dyninit_errck(dcl.lctn(),tknd,g1e1)
end (*let*) // end of [f0_dyninit(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_datasort
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Cdatasort
(tknd, d1ts) = dcl.node()
//
val
d1ts = tread01_d1tstlst(d1ts, err)
//
if
(e00=err)
then (dcl) else
d1ecl_datasort_errck(dcl.lctn(),tknd,d1ts)
end (*let*) // end of [f0_datasort(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_valdclst
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Cvaldclst
( tknd, d1cs) = dcl.node()
//
val d1cs =
tread01_d1valdclist(d1cs, err)
//
in//let
if
(e00=err)
then (dcl) else
d1ecl_valdclst_errck(dcl.lctn(),tknd,d1cs)
end (*let*) // end of [f0_valdclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Cvardclst
( tknd, d1cs) = dcl.node()
//
val d1cs =
tread01_d1vardclist(d1cs, err)
//
in//let
if
(e00=err)
then (dcl) else
d1ecl_vardclst_errck(dcl.lctn(),tknd,d1cs)
end (*let*) // end of [f0_vardclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D1Cfundclst
( tknd
, tqas, d1cs) = dcl.node()
//
val tqas =
tread01_t1qaglst(tqas, err)
val d1cs =
tread01_d1fundclist(d1cs, err)
//
in//let
if
(e00=err)
then (dcl) else
d1ecl_fundclst_errck(loc, tknd, tqas, d1cs)
end (*let*) // end of [f0_fundclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_implmnt0
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Cimplmnt0
(tknd
,sqas,tqas
,dqid,tias
,fags,sres,body) = dcl.node()
//
val sqas =
  tread01_s1qaglst(sqas, err)
val tqas =
  tread01_t1qaglst(tqas, err)
//
val tias =
  tread01_t1iaglst(tias, err)
val fags =
  tread01_f1arglst(fags, err)
//
val sres = tread01_s1res(sres, err)
//
val body = tread01_d1exp(body, err)
//
in//let
if
(err=e00)
then (dcl) else
d1ecl_implmnt0_errck
( dcl.lctn(), tknd
, sqas, tqas, dqid, tias, fags, sres, body)
end (*let*) // end of [f0_implmnt0(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_excptcon
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
//
val-
D1Cexcptcon
(tknd, tcns) = dcl.node()
//
val
tcns = tread01_d1tcnlst(tcns, err)
//
if
(e00=err)
then (dcl) else
d1ecl_excptcon_errck(dcl.lctn(),tknd,tcns)
end (*let*) // end of [f0_excptcon(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_datatype
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D1Cdatatype
( tknd
, d1ts, wdcs) = dcl.node()
//
val
d1ts = tread01_d1typlst(d1ts, err)
val
wdcs = tread01_wd1eclseq(wdcs, err)
//
if
(e00=err)
then (dcl) else
d1ecl_datatype_errck(loc,tknd,d1ts,wdcs)
end (*let*) // end of [f0_datatype(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_dynconst
( dcl: d1ecl
, err: &sint >> _): d1ecl =
let
//
val e00 = err
val loc = dcl.lctn()
//
val-
D1Cdynconst
( tknd
, tqas, d1cs) = dcl.node()
//
val
tqas =
tread01_t1qaglst(tqas, err)
val
d1cs =
tread01_d1cstdclist(d1cs, err)
//
if
(e00=err)
then (dcl) else
d1ecl_dynconst_errck(loc,tknd,tqas,d1cs)
end (*let*) // end of [f0_dynconst(dcl,err)]
//
(* ****** ****** *)
//
(*
val (  ) =
prerrln("tread01_d1ecl: loc0 = ", loc0)
val (  ) =
prerrln("tread01_d1ecl: d1cl = ", d1cl)
*)
//
(* ****** ****** *)
//
} (*where*) // end of [tread01_d1ecl(d1cl,err)]

(* ****** ****** *)

#implfun
tread01_s1tcn
(syn, err) =
(
case+
syn.node() of
|
S1TCNnode
(sid0, tres) =>
(
if
(e00=err)
then (syn) else
s1tcn
(syn.lctn(), S1TCNnode(sid0, tres))
) where
{
//
val e00 = err
//
val tres = tread01_sort1opt(tres, err)
//
}(*where*)//end-of(if(e00=err))
)(*case+*)//end-of(tread01_s1tcn(syn,err))

(* ****** ****** *)
//
#implfun
tread01_d1tst
(syn, err) =
(
case+
syn.node() of
|
D1TSTnode
(tid0, tcns) =>
(
if
(e00=err)
then (syn) else
d1tst
(syn.lctn(), D1TSTnode(tid0, tcns))
) where
{
//
val e00 = err
//
val tcns = tread01_s1tcnlst(tcns, err)
//
}(*where*)//end-of(if(e00=err))
)(*case+*)//end-of(tread01_d1tst(syn,err))
//
(* ****** ****** *)

#implfun
tread01_d1tcn
  (syn, err) =
(
case+
syn.node() of
|
D1TCNnode
( s1us, deid
, s1es, sopt) =>
let
//
val e00 = err
//
val s1us =
tread01_s1unilst(s1us, err)
val s1es =
tread01_s1explst(s1es, err)
val sopt =
tread01_s1expopt(sopt, err)
//
in//let
if
(e00=err)
then (syn) else
d1tcn_make_node
(syn.lctn(),D1TCNnode(s1us,deid,s1es,sopt))
end
) (*case+*) // end-of-(tread01_d1tcn(syn,err))

(* ****** ****** *)
//
#implfun
tread01_d1typ
  (dtyp, err) = let
//
val e00 = err
//
val loc = dtyp.lctn()
//
val+
D1TYPnode
( deid, tmas
, tres, tcns) = dtyp.node()
//
val tmas =
tread01_t1maglst(tmas, err)
val tres =
tread01_sort1opt(tres, err)
val tcns =
tread01_d1tcnlst(tcns, err)
//
in//let
if
(e00=err)
then (dtyp)
else
d1typ_make_node
(loc, D1TYPnode(deid, tmas, tres, tcns))
end(*let*)//end-of-[tread01_d1typ(dtyp,err)]
//
(* ****** ****** *)
//
#implfun
tread01_q1arg
  (q1a0, err) =
(
case+
q1a0.node() of
|
Q1ARGsome(tok1,tres) =>
let
//
val e00 = err
//
val tres =
tread01_sort1opt(tres, err)
//
in//let
if
(e00=err)
then (q1a0) else
q1arg
( q1a0.lctn(), Q1ARGsome(tok1, tres) )
endlet // end of [Q1ARGsome(tok1,tres)]
) (*case+*)//end-of-[tread01_q1arg(q1a0,err)]

(* ****** ****** *)
//
#implfun
tread01_s1qag
  (s1q0, err) =
(
case+
s1q0.node() of
(*
|
S1QAGnone(tok) =>
*)
|
S1QAGsome(q1as) => 
let
//
val e00 = err
//
val q1as =
tread01_q1arglst(q1as, err)
in//let
if
(e00=err)
then (s1q0) else
s1qag(s1q0.lctn(), S1QAGsome(q1as))
endlet // end of [ S1QAGsome(q1as) ]
) (*case+*)//end-of-[tread01_s1qag(s1q0,err)]
//
(* ****** ****** *)
//
#implfun
tread01_t1qag
  (t1q0, err) =
(
case+
t1q0.node() of
(*
|
T1QAGnone(tok) =>
*)
|
T1QAGsome(q1as) => 
let
//
val e00 = err
//
val q1as =
tread01_q1arglst(q1as, err)
in//let
if
(e00=err)
then (t1q0) else
t1qag(t1q0.lctn(), T1QAGsome(q1as))
endlet // end of [ T1QAGsome(q1as) ]
) (*case+*)//end-of-[tread01_t1qag(t1q0,err)]
//
(* ****** ****** *)
//
#implfun
tread01_t1iag
  (t1i0, err) =
(
case+
t1i0.node() of
(*
|
T1IAGnone(tok) =>
*)
|
T1IAGsome(s1es) => 
let
//
val e00 = err
//
val s1es =
tread01_s1explst(s1es, err)
in//let
if
(e00=err)
then (t1i0) else
t1iag(t1i0.lctn(), T1IAGsome(s1es))
endlet // end of [ T1IAGsome(s1es) ]
) (*case+*)//end-of-[tread01_t1iag(t1i0,err)]
//
(* ****** ****** *)

#implfun
tread01_a1tdf
  (atdf, err) =
(
case+ atdf of
|
A1TDFsome
((*void*)) => atdf
|
A1TDFlteq(s1e1) =>
let
val e00 = err
val
s1e1 =
tread01_s1exp(s1e1, err)
in//let
if
(e00=err)
then atdf else A1TDFlteq(s1e1)
endlet // end of [A1TDFlteq(s1e1)]
|
A1TDFeqeq(s1e1) =>
let
val e00 = err
val
s1e1 =
tread01_s1exp(s1e1, err)
in//let
if
(e00=err)
then atdf else A1TDFeqeq(s1e1)
endlet // end of [A1TDFeqeq(s1e1)]
) (*case+*) // end of [tread01_a1tdf(atdf,err)]

(* ****** ****** *)
//
#implfun
tread01_teqd1exp
  (tdxp, err) =
(
case+ tdxp of
|
TEQD1EXPnone() => tdxp
|
TEQD1EXPsome(teq1, d1e2) =>
let
val e00 = err
val d1e2 = tread01_d1exp(d1e2, err)
in//letp
if
(e00=err)
then tdxp else TEQD1EXPsome(teq1, d1e2)
endlet // end of [ TEQD1EXPsome( _,_ ) ]
) (*case+*)//end-(tread01_teqd1exp(tdxp,err))
//
#implfun
tread01_wths1exp
  (wsxp, err) =
(
case+ wsxp of
|
WTHS1EXPnone() => wsxp
|
WTHS1EXPsome(twth, s1e1) =>
let
val e00 = err
val s1e1 = tread01_s1exp(s1e1, err)
in//let
if
(e00=err)
then wsxp else WTHS1EXPsome(twth, s1e1)
endlet // end of [ WTHS1EXPsome( _,_ ) ]
) (*case+*)//end-(tread01_wths1exp(wsxp,err))
//
(* ****** ****** *)
//
#implfun
tread01_d1valdcl
  (dval, err) =
let
//
val e00 = err
//
val loc = dval.lctn()
//
val
dpat = d1valdcl_get_dpat(dval)
val
tdxp = d1valdcl_get_tdxp(dval)
val
wsxp = d1valdcl_get_wsxp(dval)
//
val
dpat = tread01_d1pat(dpat,err)
val
tdxp = tread01_teqd1exp(tdxp,err)
val
wsxp = tread01_wths1exp(wsxp,err)
//
in//let
if
(e00=err)
then (dval)
else d1valdcl( loc, dpat, tdxp, wsxp )
endlet // end-of-[tread01_d1valdcl(out,dval)]
//
(* ****** ****** *)
//
#implfun
tread01_d1vardcl
  (dvar, err) =
let
//
val e00 = err
//
val loc = dvar.lctn()
//
val
dpid = d1vardcl_get_dpid(dvar)
val
vpid = d1vardcl_get_vpid(dvar)
val
sres = d1vardcl_get_sres(dvar)
val
dini = d1vardcl_get_dini(dvar)
//
val
sres = tread01_s1expopt(sres,err)
val
dini = tread01_teqd1exp(dini,err)
//
in//let
if
(e00=err)
then (dvar)
else d1vardcl(loc,dpid,vpid,sres,dini)
endlet // end-of-[tread01_d1vardcl(out,dvar)]
//
(* ****** ****** *)
//
#implfun
tread01_d1fundcl
  (dfun, err) =
let
//
val e00 = err
//
val loc = dfun.lctn()
//
val
dpid = d1fundcl_get_dpid(dfun)
val
farg = d1fundcl_get_farg(dfun)
val
sres = d1fundcl_get_sres(dfun)
val
tdxp = d1fundcl_get_tdxp(dfun)
val
wsxp = d1fundcl_get_wsxp(dfun)
//
val
farg =
tread01_f1arglst(farg, err)
val
sres = tread01_s1res(sres,err)
val
tdxp = tread01_teqd1exp(tdxp,err)
val
wsxp = tread01_wths1exp(wsxp,err)
//
in//let
if
(e00=err)
then (dfun)
else d1fundcl(loc,dpid,farg,sres,tdxp,wsxp)
endlet // end-of-[tread01_d1fundcl(out,dfun)]
//
(* ****** ****** *)
//
#implfun
tread01_d1cstdcl
  (dcst, err) =
let
//
val e00 = err
//
val loc = dcst.lctn()
//
val
dpid = d1cstdcl_get_dpid(dcst)
val
darg = d1cstdcl_get_darg(dcst)
val
sres = d1cstdcl_get_sres(dcst)
val
dres = d1cstdcl_get_dres(dcst)
//
val
darg =
tread01_d1arglst(darg, err)
val
sres = tread01_s1res(sres, err)
val
dres = tread01_teqd1exp(dres, err)
//
in//let
if
(e00=err)
then (dcst)
else d1cstdcl(loc, dpid, darg, sres, dres)
endlet // end-of-[tread01_d1cstdcl(out,dcst)]
//
(* ****** ****** *)
//
#implfun
tread01_d1eclist
  (  dcls, err  ) =
list_tread01_fnp(dcls, err, tread01_d1ecl)
//
(* ****** ****** *)
//
#implfun
tread01_s1tcnlst
  (  tcns, err  ) =
list_tread01_fnp(tcns, err, tread01_s1tcn)
#implfun
tread01_d1tstlst
  (  d1ts, err  ) =
list_tread01_fnp(d1ts, err, tread01_d1tst)
//
(* ****** ****** *)
//
#implfun
tread01_d1tcnlst
  (  tcns, err  ) =
list_tread01_fnp(tcns, err, tread01_d1tcn)
#implfun
tread01_d1typlst
  (  d1ts, err  ) =
list_tread01_fnp(d1ts, err, tread01_d1typ)
//
(* ****** ****** *)
//
#implfun
tread01_q1arglst
  (  q1as, err  ) =
list_tread01_fnp(q1as, err, tread01_q1arg)
#implfun
tread01_s1qaglst
  (  sqas, err  ) =
list_tread01_fnp(sqas, err, tread01_s1qag)
#implfun
tread01_t1qaglst
  (  tqas, err  ) =
list_tread01_fnp(tqas, err, tread01_t1qag)
#implfun
tread01_t1iaglst
  (  tias, err  ) =
list_tread01_fnp(tias, err, tread01_t1iag)
//
(* ****** ****** *)
//
#implfun
tread01_wd1eclseq
  (  wdcs, err  ) =
(
case+ wdcs of
|
WD1CSnone() => wdcs
|
WD1CSsome(d1cs) =>
let
//
val e00 = err
//
val
d1cs = tread01_d1eclist(d1cs, err)
in//let
if
(e00=err) then wdcs else WD1CSsome(d1cs)
endlet // end of [ WD1CSsome( d1cs ) ]
) (*case+*) // end of [tread01_wd1eclseq(wdcs,err)]
//
(* ****** ****** *)
#implfun
tread01_d1valdclist
  (  d1vs, err  ) =
list_tread01_fnp(d1vs, err, tread01_d1valdcl)
(* ****** ****** *)
#implfun
tread01_d1vardclist
  (  d1vs, err  ) =
list_tread01_fnp(d1vs, err, tread01_d1vardcl)
(* ****** ****** *)
#implfun
tread01_d1fundclist
  (  d1fs, err  ) =
list_tread01_fnp(d1fs, err, tread01_d1fundcl)
(* ****** ****** *)
#implfun
tread01_d1cstdclist
  (  d1cs, err  ) =
list_tread01_fnp(d1cs, err, tread01_d1cstdcl)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_tread01_decl00.dats] *)
