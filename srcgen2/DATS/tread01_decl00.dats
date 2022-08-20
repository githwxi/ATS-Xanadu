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
_(*otherwise*) =>
let
val lvl = 1
in//let
(err := err+1; d1ecl_errck(lvl, d1cl))
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
(err=e00)
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
(err=e00)
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
(err=e00)
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
(err=e00)
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
(err=e00)
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
(err=e00)
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
(err=e00)
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
(err=e00)
then (dcl) else
d1ecl_absimpl_errck
( dcl.lctn(), tknd,sqid,smas,tres,sdef )
end (*let*) // end of [f0_absimpl(dcl,err)]

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
tread01_d1eclist
  (  dcls, err  ) =
list_tread01_fnp(dcls, err, tread01_d1ecl)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_tread01_decl00.dats] *)
