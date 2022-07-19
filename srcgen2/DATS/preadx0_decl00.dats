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
Start Time: June 22nd, 2022
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
#staload "./../SATS/preadx0.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with sort0_get_lctn
#symload node with sort0_get_node
(* ****** ****** *)
#symload lctn with s0exp_get_lctn
#symload node with s0exp_get_node
(* ****** ****** *)
#symload lctn with d0pat_get_lctn
#symload node with d0pat_get_node
(* ****** ****** *)
#symload lctn with d0exp_get_lctn
#symload node with d0exp_get_node
(* ****** ****** *)
#symload lctn with s0tcn_get_lctn
#symload node with s0tcn_get_node
(* ****** ****** *)
#symload lctn with d0tst_get_lctn
#symload node with d0tst_get_node
(* ****** ****** *)
#symload lctn with d0ecl_get_lctn
#symload node with d0ecl_get_node
(* ****** ****** *)
//
fun
d0ecl_errck
(lvl: sint
,dcl: d0ecl): d0ecl =
(
d0ecl
(dcl.lctn(), D0Cerrck(lvl, dcl))
)//end-of-[d0ecl_errck(_,_)]
//
(* ****** ****** *)
fun
d0ecl_errvl_a1
(dcl: d0ecl): sint =
(
case+ dcl.node() of
|
D0Cerrck
(lvl, _) => lvl | _ => 0
)
#symload
d0ecl_errvl with d0ecl_errvl_a1
#symload errvl with d0ecl_errvl_a1
(* ****** ****** *)
//
#extern
fun
d0ecl_errvl_dcls
(dcls: d0eclist): sint
#symload
d0ecl_errvl with d0ecl_errvl_dcls
#symload errvl with d0ecl_errvl_dcls
//
#implfun
d0ecl_errvl_dcls(dcls) =
(
case+ dcls of
|
list_nil
((*nil*)) => 0(*lvl*)
|
list_cons
(dcl1,dcls) => max(errvl(dcl1),errvl(dcls)))
//
(* ****** ****** *)

fun
d0ecl_local_errck
( loc0
: loc_t
, tknd
: token
, dcs1
: d0eclist
, topt
: tokenopt
, dcs2
: d0eclist
, tend: token): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl_make_node
  ( loc0
  , D0Clocal(tknd, dcs1, topt, dcs2, tend)))
end (*let*) // end of [d0ecl_local_errck]

(* ****** ****** *)

fun
d0ecl_sortdef_errck
( loc0
: loc_t
, tknd
: token
, stid
: s0tid
, teq1: token
, def2: s0tdf): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl_make_node
  (loc0, D0Csortdef(tknd,stid,teq1,def2)))
end (*let*) // end of [d0ecl_sortdef_errck]

(* ****** ****** *)

fun
d0ecl_sexpdef_errck
( loc0
: loc_t
, tknd
: token
, seid
: s0eid
, smas
: s0maglst
, tres
: sort0opt
, teq1: token
, s0e2: s0exp): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl_make_node
  ( loc0
  , D0Csexpdef
    (tknd, seid, smas, tres, teq1, s0e2)))
end (*let*) // end of [d0ecl_sexpdef_errck]

(* ****** ****** *)

fun
d0ecl_abstype_errck
( loc0
: loc_t
, tknd
: token
, seid
: s0eid
, tmas
: t0maglst
, tres
: sort0opt
, tdef: a0tdf): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl_make_node
  ( loc0
  , D0Cabstype(tknd,seid,tmas,tres,tdef)))
end (*let*) // end of [d0ecl_abstype_errck]

(* ****** ****** *)

fun
d0ecl_absopen_errck
( loc: loc_t
, tknd: token
, sqid: s0qid): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
(lvl+1, d0ecl(loc, D0Cabsopen(tknd, sqid)))
end (*let*) // end of [d0ecl_absopen_errck]

(* ****** ****** *)

fun
d0ecl_absimpl_errck
( loc0
: loc_t
, tknd
: token
, sqid
: s0qid
, smas
: s0maglst
, tres
: sort0opt
, teq1: token
, s0e2: s0exp): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
(
lvl+1,
d0ecl_make_node
( loc0
, D0Cabsimpl(tknd,sqid,smas,tres,teq1,s0e2)))
end (*let*) // end of [d0ecl_absimpl_errck]

(* ****** ****** *)
//
fun
d0ecl_datasort_errck
( loc0
: loc_t
, tknd
: token
, d0ts
: d0tstlst) : d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
(lvl+1, d0ecl(loc0, D0Cdatasort(tknd, d0ts)))
end (*let*) // end of [d0ecl_datatype_errck]
//
(* ****** ****** *)
//
fun
d0ecl_datatype_errck
( loc0
: loc_t
, tknd
: token
, d0ts
: d0typlst
, wdcs
: wd0eclseq) : d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl(loc0, D0Cdatatype(tknd, d0ts, wdcs)))
end (*let*) // end of [d0ecl_datatype_errck]
//
(* ****** ****** *)
#extern
fun
preadx0_s0tcn: fpreadx0(s0tcn)
#extern
fun
preadx0_d0tst: fpreadx0(d0tst)
#extern
fun
preadx0_s0tcnlst: fpreadx0(s0tcnlst)
#extern
fun
preadx0_d0tstlst: fpreadx0(d0tstlst)
(* ****** ****** *)

#implfun
preadx0_s0tcn
(syn, err) =
(
case+
syn.node() of
|
S0TCNnode
(sid0, topt) =>
(
if
(err=e00)
then syn else
s0tcn
(syn.lctn(), S0TCNnode(sid0, topt))
) where
{
//
val e00 = err
//
val sid0 = preadx0_i0dnt(sid0, err)
val topt = preadx0_sort0opt(topt, err)
//
}(*where*)//end-of(if(err=e00))
)(*case+*)//end-of(preadx0_s0tcn(syn,err))

(* ****** ****** *)

#implfun
preadx0_d0tst
(syn, err) =
(
case+
syn.node() of
|
D0TSTnode
( tid0
, teq1
, tbar, tcns) =>
(
if
(err=e00)
then syn else
d0tst
( syn.lctn()
, D0TSTnode(tid0, teq1, tbar, tcns))
) where
{
//
val e00 = err
//
val tid0 =
preadx0_i0dnt(tid0, err)
//
val (  ) =
(
case+
teq1.node() of
| T_EQ0() => ((*void*))
| _(*non-T_EQ0*) => ( err := err+1 )
)
//
// HX: tbar: tokenopt
//
val tcns = preadx0_s0tcnlst(tcns, err)
//
}(*where*)//end-of(if(err=e00))
)(*case+*)//end-of(preadx0_d0tst(syn,err))
//
(* ****** ****** *)
//
#implfun
preadx0_s0tcnlst
(   lst, err   ) =
preadx0_synentlst_fun(lst,err,preadx0_s0tcn)
#implfun
preadx0_d0tstlst
(   lst, err   ) =
preadx0_synentlst_fun(lst,err,preadx0_d0tst)
//
(* ****** ****** *)

#implfun
preadx0_d0ecl
  (dcl, err) =
(
case+
dcl.node() of
//
|
D0Clocal _ =>
f0_local(dcl, err)
//
|
D0Csortdef _ =>
f0_sortdef(dcl, err)
|
D0Csexpdef _ =>
f0_sexpdef(dcl, err)
//
|
D0Cabstype _ =>
f0_abstype(dcl, err)
|
D0Cabsopen _ =>
f0_absopen(dcl, err)
|
D0Cabsimpl _ =>
f0_absimpl(dcl, err)
//
|
D0Cdatasort _ =>
f0_datasort(dcl, err)
//
|
D0Ctkskp _ =>
(err := err+1; d0ecl_errck(1, dcl))
|
D0Ctkerr(tok) =>
(
case+
tok.node() of
| T_EOF() => dcl
|
_(*non-T_EOF*) =>
(err := err+1; d0ecl_errck(1, dcl))
)
//
|
D0Cerrck _ =>
(err := err+1; d0ecl_errck(1, dcl))
//
| _(* otherwise *) => dcl // HX: placeholder
//
) where
{
//
(* ****** ****** *)
//
fun
f0_local
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Clocal
( tknd
, dcs1
, topt
, dcs2, tend) = dcl.node()
//
val dcs1 =
preadx0_d0eclist(dcs1, err)
val dcs2 =
preadx0_d0eclist(dcs2, err)
val (  ) =
(
case+ tend.node() of
| T_END() => ()
| T_ENDLOC() => () | _ => (err := err+1))
//
in
if
(err = e00)
then dcl else
d0ecl_local_errck
(dcl.lctn(), tknd, dcs1, topt, dcs2, tend)
end (*let*) // end of [ f0_local(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_sortdef
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Csortdef
( tknd
, stid
, teq1, def2) = dcl.node()
//
val stid =
preadx0_i0dnt(stid, err)
val (  ) =
(
case+
teq1.node() of
| T_EQ0() => ((*void*))
| _(*non-T_EQ0*) => (err := err+1)
)
val def2 = preadx0_s0tdf(def2, err)
//
in//let
if
(err = e00)
then dcl else
d0ecl_sortdef_errck
(dcl.lctn(), tknd, stid, teq1, def2)
end (*let*) // end of [f0_sortdef(dcl, err)]
//
(* ****** ****** *)
//
fun
f0_sexpdef
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Csexpdef
( tknd
, seid
, smas
, tres
, teq1, def2) = dcl.node()
//
val seid =
preadx0_i0dnt(seid, err)
val smas =
preadx0_s0maglst(smas, err)
val tres =
preadx0_sort0opt(tres, err)
val (  ) =
(
case+
teq1.node() of
| T_EQ0() => ((*void*))
| _(*non-T_EQ0*) => (err := err+1)
)
val def2 = preadx0_s0exp(def2, err)
//
in//let
if
(err = e00)
then dcl else
d0ecl_sexpdef_errck
(dcl.lctn(), tknd, seid, smas, tres, teq1, def2)
end (*let*) // end of [f0_sexpdef(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_abstype
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cabstype
( tknd
, seid
, tmas
, tres, tdef) = dcl.node()
//
val seid =
preadx0_i0dnt(seid, err)
val tmas =
preadx0_t0maglst(tmas, err)
val tres =
preadx0_sort0opt(tres, err)
//
val tdef = preadx0_a0tdf(tdef, err)
//
in//let
if
(err = e00)
then dcl else
d0ecl_abstype_errck
(dcl.lctn(), tknd, seid, tmas, tres, tdef)
end (*let*) // end of [f0_abstype(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_absopen
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cabsopen
(tknd, sqid) = dcl.node((*void*))
//
val sqid = preadx0_s0qid(sqid, err)
//
in
if
(err = e00)
then dcl else
d0ecl_absopen_errck(dcl.lctn(), tknd, sqid)
end (*let*) // end of [f0_absopen(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_absimpl
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cabsimpl
( tknd
, sqid
, smas
, tres
, teq1, s0e2) = dcl.node()
//
val sqid =
preadx0_s0qid(sqid, err)
val smas =
preadx0_s0maglst(smas, err)
val tres =
preadx0_sort0opt(tres, err)
//
val (  ) =
(
case+
teq1.node() of
| T_EQ0() => ()
| _(*else*)=> (err := err + 1))
//
val s0e2 = preadx0_s0exp(s0e2, err)
//
in//let
if
(err = e00)
then dcl else
d0ecl_absimpl_errck
(dcl.lctn(), tknd, sqid, smas, tres, teq1, s0e2)
end (*let*) // end of [f0_absimpl(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_datasort
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cdatasort
(tknd, d0ts) = dcl.node()
//
val d0ts = preadx0_d0tstlst(d0ts, err)
//
if
(err = e00)
then dcl else
d0ecl_datasort_errck(dcl.lctn(), tknd, d0ts)
end (*let*) // end of [f0_datasort(dcl,err)]
//
(* ****** ****** *)
//
} (*where*) // end of [preadx0_d0ecl(dcl,err)]

(* ****** ****** *)

#implfun
preadx0_d0eclist
  (dcls, err) =
(
case+ dcls of
|
list_nil() =>
list_nil((*nil*))
|
list_cons
(dcl1, dcs1) => let
//
val e00 = err
//
val
dcl1 = preadx0_d0ecl(dcl1, err)
val
dcs1 = preadx0_d0eclist(dcs1, err)
//
in//let
if
(err = e00)
then dcls else list_cons(dcl1, dcs1)
endlet // end of [list_cons(dcl1,dcls)]
) (*case*) // end-of-[preadx0_d0eclist(dcls,err)]

(* ****** ****** *)

#implfun
preadx0_a0tdf
  (tdf, err) =
let
val e00 = err
in//let
//
case+ tdf of
|
A0TDFsome() => tdf
|
A0TDFlteq(tok, s0e) =>
let
val s0e =
preadx0_s0exp(s0e, err)
in
if
(err = e00)
then tdf else A0TDFlteq(tok, s0e)
end (*let*) // end of [A0TDFlteq]
|
A0TDFeqeq(tok, s0e) =>
let
val s0e =
preadx0_s0exp(s0e, err)
in
if
(err = e00)
then tdf else A0TDFeqeq(tok, s0e)
end (*let*) // end of [A0TDFeqeq]
//
end (*let*)//end-of-[preadx0_a0tdf(tdf,err)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_preadx0_decl00.dats] *)
