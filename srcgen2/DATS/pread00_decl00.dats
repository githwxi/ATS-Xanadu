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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Start Time: June 22nd, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/pread00.sats"
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
#symload lctn with s0qua_get_lctn
#symload node with s0qua_get_node
(* ****** ****** *)
#symload lctn with s0tcn_get_lctn
#symload node with s0tcn_get_node
(* ****** ****** *)
#symload lctn with d0tst_get_lctn
#symload node with d0tst_get_node
(* ****** ****** *)
#symload lctn with s0uni_get_lctn
#symload node with s0uni_get_node
(* ****** ****** *)
#symload lctn with d0tcn_get_lctn
#symload node with d0tcn_get_node
(* ****** ****** *)
#symload lctn with d0typ_get_lctn
#symload node with d0typ_get_node
(* ****** ****** *)
#symload lctn with d0pat_get_lctn
#symload node with d0pat_get_node
(* ****** ****** *)
#symload lctn with d0exp_get_lctn
#symload node with d0exp_get_node
(* ****** ****** *)
#symload lctn with s0qag_get_lctn
#symload node with s0qag_get_node
(* ****** ****** *)
#symload lctn with t0qag_get_lctn
#symload node with t0qag_get_node
(* ****** ****** *)
#symload lctn with d0ecl_get_lctn
#symload node with d0ecl_get_node
(* ****** ****** *)
#symload lctn with d0cstdcl_get_lctn
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
(lvl, _) => lvl | _ => (0))
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
d0ecl_nonfix_errck
( loc0
: loc_t
, tknd
: token
, oprs
: i0dntlst): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
(
lvl+1,d0ecl(loc0,D0Cnonfix(tknd,oprs)))
end (*let*)//end-of-[d0ecl_nonfix_errck]

(* ****** ****** *)
//
fun
d0ecl_fixity_errck
( loc0: loc_t
, tknd: token
, oprs
: i0dntlst
, prec: precopt): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl_make_node
  (loc0, D0Cfixity(tknd, oprs, prec)) )
end (*let*)//end-of-[d0ecl_fixity_errck]
//
(* ****** ****** *)
//
fun
d0ecl_static_errck
( loc0: loc_t
, tknd: token
, dcl1: d0ecl): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl(loc0, D0Cstatic(tknd, dcl1)) )
end (*let*)//end-of-[d0ecl_static_errck]
//
fun
d0ecl_extern_errck
( loc0: loc_t
, tknd: token
, dcl1: d0ecl): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl(loc0, D0Cextern(tknd, dcl1)) )
end (*let*)//end-of-[d0ecl_extern_errck]
//
(* ****** ****** *)
//
fun
d0ecl_define_errck
( loc0
: loc_t
, tknd
: token
, geid
: g0eid
, gmas
: g0maglst
, gedf: g0edf): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl_make_node
  ( loc0
  , D0Cdefine(tknd,geid,gmas,gedf)) )
end (*let*)//end-of-[d0ecl_define_errck]
//
fun
d0ecl_macdef_errck
( loc0
: loc_t
, tknd
: token
, geid
: g0eid
, gmas
: g0maglst
, dedf: d0edf): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl_make_node
  ( loc0
  , D0Cmacdef(tknd,geid,gmas,dedf)) )
end (*let*)//end-of-[d0ecl_macdef_errck]
//
(* ****** ****** *)
//
fun
d0ecl_local0_errck
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
(
lvl+1
,
d0ecl_make_node
( loc0
, D0Clocal0(tknd,dcs1,topt,dcs2,tend)))
end (*let*) // end of [d0ecl_local0_errck]
//
(* ****** ****** *)
//
fun
d0ecl_abssort_errck
( loc0: loc_t
, tknd: token
, tid0: s0tid): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl( loc0, D0Cabssort(tknd,tid0)) )
end (*let*) // end of [d0ecl_abssort_errck]
//
(* ****** ****** *)
//
fun
d0ecl_stacst0_errck
( loc0: loc_t
, tknd: token
, sid0: s0tid
, tmas: t0maglst
, tcln: token
, s0t1: sort0): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
(
lvl+1
,
d0ecl
( loc0
, D0Cstacst0(tknd,sid0,tmas,tcln,s0t1)))
end (*let*) // end of [d0ecl_stacst0_errck]
//
(* ****** ****** *)
//
fun
d0ecl_sortdef_errck
( loc0
: loc_t
, tknd
: token
, tid0
: s0tid
, teq1: token
, def2: s0tdf): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
(
lvl+1
,
d0ecl_make_node
(loc0, D0Csortdef(tknd,tid0,teq1,def2)))
end (*let*) // end of [d0ecl_sortdef_errck]
//
(* ****** ****** *)
//
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
(
lvl+1,
d0ecl_make_node
( loc0
, D0Csexpdef
  (tknd, seid, smas, tres, teq1, s0e2)))
end (*let*) // end of [d0ecl_sexpdef_errck]
//
(* ****** ****** *)
//
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
//
(* ****** ****** *)
//
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
//
(* ****** ****** *)
//
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
//
(* ****** ****** *)
//
fun
d0ecl_symload_errck
( loc0
: loc_t
, tknd
: token
, symb
: s0ymb
, twth
: token
, dqid
: d0qid
, gopt
: g0expopt) : d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
(
lvl+1,
d0ecl_make_node
(loc0, D0Csymload(tknd,symb,twth,dqid,gopt)))
end (*let*) // end of [d0ecl_symload_errck]
//
(* ****** ****** *)
//
fun
d0ecl_include_errck
( loc0: loc_t
, knd0: sint
, tknd: token
, g0e1: g0exp) : d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl(loc0, D0Cinclude(knd0, tknd, g0e1)))
end (*let*) // end of [d0ecl_include_errck]
//
(* ****** ****** *)
//
fun
d0ecl_staload_errck
( loc0: loc_t
, knd0: sint
, tknd: token
, g0e1: g0exp) : d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl(loc0, D0Cstaload(knd0, tknd, g0e1)))
end (*let*) // end of [d0ecl_staload_errck]
//
(* ****** ****** *)
//
fun
d0ecl_dyninit_errck
( loc0: loc_t
, tknd: token
, g0e1: g0exp) : d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
(lvl+1, d0ecl(loc0, D0Cdyninit(tknd, g0e1)))
end (*let*) // end of [d0ecl_dyninit_errck]
//
(* ****** ****** *)
//
fun
d0ecl_extcode_errck
( loc0: loc_t
, tknd: token
, g0e1: g0exp) : d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
(lvl+1, d0ecl(loc0, D0Cextcode(tknd, g0e1)))
end (*let*) // end of [d0ecl_extcode_errck]
//
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
end (*let*) // end of [d0ecl_datasort_errck]
//
(* ****** ****** *)
//
fun
d0ecl_valdclst_errck
( loc0
: loc_t
, tknd
: token
, d0cs
: d0valdclist): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
(lvl+1, d0ecl(loc0, D0Cvaldclst(tknd, d0cs)))
end (*let*) // end of [d0ecl_valdclst_errck]
//
(* ****** ****** *)
//
fun
d0ecl_vardclst_errck
( loc0
: loc_t
, tknd
: token
, d0cs
: d0vardclist): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
(lvl+1, d0ecl(loc0, D0Cvardclst(tknd, d0cs)))
end (*let*) // end of [d0ecl_vardclst_errck]
//
(* ****** ****** *)
//
fun
d0ecl_fundclst_errck
( loc0
: loc_t
, tknd
: token
, tqas
: t0qaglst
, d0cs
: d0fundclist): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl(loc0, D0Cfundclst(tknd, tqas, d0cs)))
end (*let*) // end of [d0ecl_fundclst_errck]
//
(* ****** ****** *)
//
fun
d0ecl_implmnt0_errck
( loc0
: loc_t
, tknd
: token
, sqas
: s0qaglst
, tqas
: t0qaglst
, dqid
: d0qid
, tias
: t0iaglst
, fags
: f0arglst
, sres: s0res
, teq1
: token, body: d0exp): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
(
lvl+1
,
d0ecl_make_node
( loc0
, D0Cimplmnt0
  ( tknd, sqas, tqas
  , dqid, tias, fags, sres, teq1, body) ))
end (*let*) // end of [d0ecl_implmnt0_errck]
//
(* ****** ****** *)
//
fun
d0ecl_excptcon_errck
( loc0: loc_t
, tknd: token
, tbar: tokenopt
, d0ts: d0tcnlst) : d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl(loc0, D0Cexcptcon(tknd, tbar, d0ts)))
end (*let*) // end of [d0ecl_excptcon_errck]
//
(* ****** ****** *)
//
fun
d0ecl_datatype_errck
( loc0: loc_t
, tknd: token
, d0ts: d0typlst
, wdcs: wd0eclseq) : d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl(loc0, D0Cdatatype(tknd, d0ts, wdcs)))
end (*let*) // end of [d0ecl_datatype_errck]
//
(* ****** ****** *)
//
fun
d0ecl_dynconst_errck
( loc0: loc_t
, tknd: token
, tqas: t0qaglst
, d0cs: d0cstdclist): d0ecl =
let
val lvl = 0
in//let
d0ecl_errck
( lvl+1
, d0ecl(loc0, D0Cdynconst(tknd, tqas, d0cs)))
end (*let*) // end of [d0ecl_dynconst_errck]
//
(* ****** ****** *)
#extern
fun
pread00_s0tcn: fpread00(s0tcn)
#extern
fun
pread00_d0tst: fpread00(d0tst)
#extern
fun
pread00_s0tcnlst: fpread00(s0tcnlst)
#extern
fun
pread00_d0tstlst: fpread00(d0tstlst)
(* ****** ****** *)

#implfun
pread00_s0tcn
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
then (syn) else
s0tcn
(syn.lctn(), S0TCNnode(sid0, topt))
) where
{
//
val e00 = err
//
val sid0 = pread00_i0dnt(sid0, err)
val topt = pread00_sort0opt(topt, err)
//
}(*where*)//end-of(if(err=e00))
)(*case+*)//end-of(pread00_s0tcn(syn,err))

(* ****** ****** *)

#implfun
pread00_d0tst
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
then (syn) else
d0tst
( syn.lctn()
, D0TSTnode(tid0, teq1, tbar, tcns))
) where
{
//
val e00 = err
//
val tid0 =
pread00_i0dnt(tid0, err)
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
val tcns = pread00_s0tcnlst(tcns, err)
//
}(*where*)//end-of(if(err=e00))
)(*case+*)//end-of(pread00_d0tst(syn,err))
//
(* ****** ****** *)
//
#implfun
pread00_s0tcnlst
(   lst, err   ) =
list_pread00_fnp(lst,err,pread00_s0tcn)
#implfun
pread00_d0tstlst
(   lst, err   ) =
list_pread00_fnp(lst,err,pread00_d0tst)
//
(* ****** ****** *)
#extern
fun
pread00_s0uni: fpread00(s0uni)
#extern
fun
pread00_d0tcn: fpread00(d0tcn)
#extern
fun
pread00_d0typ: fpread00(d0typ)
#extern
fun
pread00_s0unilst: fpread00(s0unilst)
#extern
fun
pread00_d0tcnlst: fpread00(d0tcnlst)
#extern
fun
pread00_d0typlst: fpread00(d0typlst)
#extern
fun
pread00_wd0eclseq: fpread00(wd0eclseq)
(* ****** ****** *)
//
#implfun
pread00_s0uni
  (s0u, err) = let
//
val e00 = err
//
in//let
//
case+
s0u.node() of
|
S0UNInone
(  tok  ) =>
(err:=err+1; s0u)
|
S0UNIsome
(tbeg, s0qs, tend) =>
let
val s0qs =
pread00_s0qualst(s0qs, err)
val (  ) =
(
case+
tend.node() of
| T_RBRACE() => ()
| _(*non-T_RBRACE*) => (err := err+1)
)
in//let
if
(err=e00)
then (s0u) else s0uni
(s0u.lctn(), S0UNIsome(tbeg,s0qs,tend))
end(*let*)//end-of-[ S0UNIsome(_,_,_) ]
//
end(*let*)//end-of-[pread00_s0uni(s0u,err)]
//
(* ****** ****** *)
//
#implfun
pread00_d0tcn
  (tcn, err) = let
//
val e00 = err
//
val loc = tcn.lctn()
//
val+
D0TCNnode
( s0us, deid
, s0es, sres) = tcn.node()
//
val deid =
pread00_i0dnt(deid, err)
val s0us =
pread00_s0unilst(s0us, err)
val s0es =
pread00_s0explst(s0es, err)
val sres =
pread00_s0expopt(sres, err)
//
in//let
if
(err=e00)
then (tcn) else
d0tcn_make_node
(loc, D0TCNnode(s0us, deid, s0es, sres))
end(*let*)//end-of-[pread00_d0tcn(tcn,err)]
//
(* ****** ****** *)
//
#implfun
pread00_d0typ
  (d0t, err) = let
//
val e00 = err
//
val loc = d0t.lctn()
//
val+
D0TYPnode
( deid
, tmas, tres
, teq1, tcns) = d0t.node()
//
val deid =
pread00_i0dnt(deid, err)
val tmas =
pread00_t0maglst(tmas, err)
val tres =
pread00_sort0opt(tres, err)
//
val (  ) =
(
case+
teq1.node() of
| T_EQ0() => ((*void*))
| _(*non-T_EQ0*) => ( err := err+1 )
)
//
val tcns = pread00_d0tcnlst(tcns, err)
//
in//let
if
(err=e00)
then (d0t) else
d0typ_make_node
(loc, D0TYPnode(deid,tmas,tres,teq1,tcns))
end(*let*)//end-of-[pread00_d0typ(d0t,err)]
//
(* ****** ****** *)
//
#implfun
pread00_s0unilst
(   lst, err   ) =
list_pread00_fnp(lst,err,pread00_s0uni)
//
(* ****** ****** *)
//
#implfun
pread00_d0tcnlst
(   lst, err   ) =
list_pread00_fnp(lst,err,pread00_d0tcn)
//
(* ****** ****** *)
//
#implfun
pread00_d0typlst
(   lst, err   ) =
list_pread00_fnp(lst,err,pread00_d0typ)
//
(* ****** ****** *)
//
#implfun
pread00_wd0eclseq
 (wdcs, err) =
(
case+ wdcs of
|
WD0CSnone
((*void*)) => wdcs
|
WD0CSsome
(tbeg
,topt,d0cs,tend) =>
let
//
val e00 = err
//
val d0cs =
pread00_d0eclist(d0cs, err)
val (  ) =
(
case+ topt of
|
optn_nil() =>
(
case+
tend.node() of
| T_ENDWHR() => ()
| _(*non-T_ENDWHR*) => (err:=err+1)
)
|
optn_cons _ =>
(
case+
tend.node() of
|
T_RBRACE() => ()
|
_(*non-T_RBRACE*) => (err:=err+1)
)
) (*case+*)//end-of(val())
in
//
if(err=e00)
  then wdcs
  else WD0CSsome(tbeg,topt,d0cs,tend)
// end of [if]
endlet // end of [WD0CSsome(_,_,_,_)]
) (*case+*)//end-of(pread00_wd0eclseq)
//
(* ****** ****** *)
#extern
fun
pread00_q0arg: fpread00(q0arg)
#extern
fun
pread00_s0qag: fpread00(s0qag)
#extern
fun
pread00_t0qag: fpread00(t0qag)
#extern
fun
pread00_t0iag: fpread00(t0iag)
(* ****** ****** *)
#extern
fun
pread00_a0typ: fpread00(a0typ)
#extern
fun
pread00_d0arg: fpread00(d0arg)
(* ****** ****** *)
#extern
fun
pread00_q0arglst: fpread00(q0arglst)
#extern
fun
pread00_s0qaglst: fpread00(s0qaglst)
#extern
fun
pread00_t0qaglst: fpread00(t0qaglst)
#extern
fun
pread00_t0iaglst: fpread00(t0iaglst)
(* ****** ****** *)
#extern
fun
pread00_a0typlst: fpread00(a0typlst)
#extern
fun
pread00_d0arglst: fpread00(d0arglst)
(* ****** ****** *)
#extern
fun
pread00_d0valdcl: fpread00(d0valdcl)
#extern
fun
pread00_d0vardcl: fpread00(d0vardcl)
#extern
fun
pread00_d0fundcl: fpread00(d0fundcl)
#extern
fun
pread00_d0cstdcl: fpread00(d0cstdcl)
(* ****** ****** *)
#extern
fun
pread00_teqd0exp: fpread00(teqd0exp)
#extern
fun
pread00_wths0exp: fpread00(wths0exp)
(* ****** ****** *)
#extern
fun
pread00_d0valdclist: fpread00(d0valdclist)
#extern
fun
pread00_d0vardclist: fpread00(d0vardclist)
#extern
fun
pread00_d0fundclist: fpread00(d0fundclist)
#extern
fun
pread00_d0cstdclist: fpread00(d0cstdclist)
(* ****** ****** *)
//
#implfun
pread00_q0arg
  (q0a, err) =
(
case+
q0a.node() of
|
Q0ARGsome(sid0, topt) =>
let
//
val e00 = err
//
val sid0 =
pread00_i0dnt(sid0, err)
val topt =
pread00_sort0opt(topt, err)
//
in//let
if
(err=e00)
then (q0a) else q0arg
(q0a.lctn(), Q0ARGsome(sid0, topt))
endlet // end of [Q0ARGsome(sid0,topt)]
) (*case+*)//end-of-[pread00_q0arg(q0a,err)]
(* ****** ****** *)
//
#implfun
pread00_s0qag
  (s0q, err) =
(
case+
s0q.node() of
|
S0QAGnone(tok) =>
(err := err+1; s0q)
|
S0QAGsome
(tbeg,q0as,tend) => 
let
//
val e00 = err
//
val q0as =
pread00_q0arglst(q0as, err)
val (  ) =
(
case+
tend.node() of
| T_RBRACE() => ()
| _(*non-T_RBRACE*) => (err:=err+1))
in//let
if
(err=e00)
then (s0q) else s0qag
(s0q.lctn(), S0QAGsome(tbeg,q0as,tend))
endlet // end of [ S0QAGsome(_, _, _) ]
) (*case+*)//end-of-[pread00_s0qag(s0q,err)]
//
(* ****** ****** *)
//
#implfun
pread00_t0qag
  (t0q, err) =
(
case+
t0q.node() of
|
T0QAGnone(tok) =>
(err := err+1; t0q)
|
T0QAGsome
(tbeg,q0as,tend) => 
let
//
val e00 = err
//
val q0as =
pread00_q0arglst(q0as, err)
val (  ) =
(
case+
tend.node() of
| T_GT0() => ()
| T_LTGT() => ()
| _(*non-T_GT0*) => (err := err+1))
in//let
if
(err=e00)
then (t0q) else t0qag
(t0q.lctn(), T0QAGsome(tbeg,q0as,tend))
endlet // end of [ T0QAGsome(_, _, _) ]
) (*case+*)//end-of-[pread00_t0qag(t0q,err)]
//
(* ****** ****** *)
//
#implfun
pread00_t0iag
  (t0i, err) =
(
case+
t0i.node() of
|
T0IAGnone(tok) =>
(err := err+1; t0i)
|
T0IAGsome
(tbeg,s0es,tend) => 
let
//
val e00 = err
//
val s0es =
pread00_s0explst(s0es, err)
val (  ) =
(
case+
tend.node() of
| T_GT0() => ((*void*))
| T_LTGT() => ((*void*))
| _(*non-T_GT0*) => (err := err+1))
in//let
if
(err=e00)
then (t0i) else t0iag
(t0i.lctn(), T0IAGsome(tbeg,s0es,tend))
endlet // end of [ T0IAGsome(_, _, _) ]
) (*case+*)//end-of-[pread00_t0iag(t0i,err)]
//
(* ****** ****** *)
//
#implfun
pread00_a0typ
  (atp, err) =
(
case+
atp.node() of
|
A0TYPsome
(s0e1, topt) =>
let
val e00 = err
val loc = atp.lctn()
val s0e1 = pread00_s0exp(s0e1, err)
in//let
if
(err=e00)
then (atp)
else a0typ(loc,A0TYPsome(s0e1,topt))
endlet // end of [ A0TYPsome(_, _) ]
) (*case+*)//end-of-[pread00_a0typ(t0i,err)]
(* ****** ****** *)
//
#implfun
pread00_d0arg
  (dag, err) =
(
case+
dag.node() of
|
D0ARGnone(tok) =>
(err := err + 1; dag)
|
D0ARGsta0
(tbeg,s0qs,tend) =>
let
//
val e00 = err
//
val s0qs =
pread00_s0qualst(s0qs, err)
val (  ) =
(
case+
tend.node() of
|
T_RBRACE() => ((*void*))
|
_(*non-T_RBRACE*) => (err := err+1)
)
in//let
if
(err=e00)
then (dag) else d0arg
(dag.lctn(), D0ARGsta0(tbeg,s0qs,tend))
endlet // end of [ D0ARGsta0(_, _, _) ]
|
D0ARGdyn1(dpid) =>
let
//
val e00 = err
//
val loc = dag.lctn()
//
val dpid =
pread00_i0dnt(dpid, err)
in//let
if
(err=e00)
then (dag) else
d0arg_make_node( loc, D0ARGdyn1(dpid) )
endlet // end of [ D0ARGdyn1 ( dpid ) ]
|
D0ARGdyn2
(tbeg
,atps,opt2,tend) =>
let
//
val e00 = err
//
val loc = dag.lctn()
//
val atps =
pread00_a0typlst(atps, err)
val opt2 =
(
case+ opt2 of
|
optn_nil() => opt2
|
optn_cons(atps) =>
let
val e00 = err
val atps =
pread00_a0typlst(atps, err)
in
if
(err=e00)
then opt2 else optn_cons(atps)
endlet // end of [optn_cons(atps)]
) : a0typlstopt // end of [val(opt2)]
//
in//let
if
(err=e00)
then (dag) else
d0arg_make_node
(loc,D0ARGdyn2(tbeg, atps, opt2, tend))
endlet // end of [ D0ARGdyn2(_,_,_,_) ]
) (*case+*)//end-of-[pread00_d0arg(t0i,err)]
//
(* ****** ****** *)

#implfun
pread00_d0ecl
  (dcl, err) =
(
case+
dcl.node() of
//
|
D0Cnonfix _ => f0_nonfix(dcl, err)
|
D0Cfixity _ => f0_fixity(dcl, err)
//
|
D0Cstatic _ => f0_static(dcl, err)
|
D0Cextern _ => f0_extern(dcl, err)
//
|
D0Cdefine _ => f0_define(dcl, err)
|
D0Cmacdef _ => f0_macdef(dcl, err)
//
|
D0Clocal0 _ => f0_local0(dcl, err)
//
|
D0Cabssort _ => f0_abssort(dcl, err)
|
D0Cstacst0 _ => f0_stacst0(dcl, err)
//
|
D0Csortdef _ => f0_sortdef(dcl, err)
|
D0Csexpdef _ => f0_sexpdef(dcl, err)
//
|
D0Cabstype _ => f0_abstype(dcl, err)
|
D0Cabsopen _ => f0_absopen(dcl, err)
|
D0Cabsimpl _ => f0_absimpl(dcl, err)
//
|
D0Csymload _ => f0_symload(dcl, err)
//
|
D0Cinclude _ => f0_include(dcl, err)
|
D0Cstaload _ => f0_staload(dcl, err)
//
(* ****** ****** *)
//
|
D0Cdyninit _ => f0_dyninit(dcl, err)
//
|
D0Cextcode _ => f0_extcode(dcl, err)
//
(* ****** ****** *)
//
|
D0Cdatasort _ => f0_datasort(dcl, err)
//
|
D0Cvaldclst _ => f0_valdclst(dcl, err)
|
D0Cvardclst _ => f0_vardclst(dcl, err)
|
D0Cfundclst _ => f0_fundclst(dcl, err)
//
|
D0Cimplmnt0 _ => f0_implmnt0(dcl, err)
//
|
D0Cexcptcon _ => f0_excptcon(dcl, err)
|
D0Cdatatype _ => f0_datatype(dcl, err)
//
|
D0Cdynconst _ => f0_dynconst(dcl, err)
//
(* ****** ****** *)
//
| // HX: ignored for now and
D0Ctkerr(tok) => ( dcl ) // catch later
|
D0Ctkskp(tok) =>
let
val lvl = 1
in//let
(err := err + 1; d0ecl_errck(lvl, dcl))
end (*let*) // end of [ D0Ctkskp(tok) ]
//
(* ****** ****** *)
//
(*
HX-2025-04-19:
For if-guarded declarations!
*)
//
|D0Cendif _ => ( dcl )
//
|D0Cthen0 _ => ( dcl )
|D0Celse1 _ => ( dcl )
//
|D0Cifexp(tok, g0e) =>
let
//
val lvl = 0
val e00 = err
val g0e = pread00_g0exp(g0e, err)
//
in//let
if
(err=e00)
then (dcl) else
d0ecl_errck
( lvl+1
, d0ecl_make_node
  (dcl.lctn(), D0Cifexp(tok, g0e)))
end//let//end-of-[D0Cifexp(tok,g0e)]
//
|D0Celsif(tok, g0e) =>
let
//
val lvl = 0
val e00 = err
val g0e = pread00_g0exp(g0e, err)
//
in//let
if
(err=e00)
then (dcl) else
d0ecl_errck
( lvl+1
, d0ecl_make_node
  (dcl.lctn(), D0Celsif(tok, g0e)))
end//let//end-of-[D0Celsif(tok,g0e)]
//
(* ****** ****** *)
//
|
_(*otherwise*) =>
let
val lvl = 1
in//let
(err := err + 1; d0ecl_errck(lvl, dcl))
end (*let*) // end of [ _(*otherwise*) ]
//
) where // end-of-[ case+of(dcl.node()) ]
{
//
(* ****** ****** *)
//
fun
f0_nonfix
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cnonfix
(tknd, oprs) = dcl.node()
//
val oprs =
pread00_i0dntlst(oprs, err)
//
in
if
(err=e00)
then (dcl) else
d0ecl_nonfix_errck(dcl.lctn(),tknd,oprs)
end (*let*) // end of [f0_nonfix(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_fixity
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cfixity
( tknd
, oprs, prec) = dcl.node()
//
val oprs =
pread00_i0dntlst(oprs, err)
//
val
prec = f1_precopt(prec, err)
//
in//let
if
(err=e00)
then (dcl) else
d0ecl_fixity_errck
( dcl.lctn(),  tknd,  oprs,  prec )
end (*let*) // end of [f0_fixity(dcl,err)]
//
and
f1_tokint
( tok
: token
, err: &sint >> _):token =
(
case+
tok.node() of
| T_INT01 _ => tok
| T_INT02 _ => tok
| T_INT03 _ =>
  (err := err+1; tok)
|
_(*non-T_INT??*) =>
 ( err := err + 1; tok ) )
and
f1_tokopr
( tok
: token
, err: &sint >> _):token =
(
case+
tok.node() of
| T_IDALP _ => tok
| T_IDSYM _ => tok
|
_(*non-T_ID???*) =>
 ( err := err + 1; tok ) )
//
and
f1_precopt
( prec
: precopt
, err: &sint >> _):precopt =
(
case+ prec of
|
PRECnil0() => prec
|
PRECint1(tint) =>
let
val tint =
f1_tokint(tint, err) in prec end
|
PRECopr2(opr1, pmod) =>
let
val opr1 =
  pread00(opr1, err)
val pmod =
  f1_precmod(pmod, err) in prec end
) (*case+*)//end-of-[f1_precopt(prec,err)]
//
and
f1_precmod
( pmod
: precmod
, err: &sint >> _):precmod =
(
case+ pmod of
|
PMODnone() => pmod
|
PMODsome
( tbeg
, pint, tend) => pmod where
{
val pint = f1_precint(pint, err)
val (  ) =
(
case+
tend.node() of
|
T_RPAREN() => ()
|
_(*otherwise*) => (err := err+1))
} (*where*)//end-of-(PMODsome)
) (*case+*)//end-of-[f1_precmod(pmod,err)]
//
and
f1_precint
( pint
: precint
, err: &sint >> _):precint =
(
case+ pint of
|
PINTint1(tint) =>
let
val tint =
f1_tokint(tint, err) in pint end
|
PINTopr2(topr,tint) =>
let
val topr =
f1_tokopr(topr, err)
val tint =
f1_tokint(tint, err) in pint end
) (*case+*)// end-of-[f1_precint(pint,err)]
//
(* ****** ****** *)
//
fun
f0_static
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cstatic
( tknd, dcl1) = dcl.node()
//
val dcl1 = pread00_d0ecl(dcl1, err)
//
in
if
(err=e00)
then (dcl) else
d0ecl_static_errck(dcl.lctn(), tknd, dcl1)
end (*let*) // end of [ f0_static(dcl,err) ]
//
fun
f0_extern
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cextern
( tknd, dcl1) = dcl.node()
//
val dcl1 = pread00_d0ecl(dcl1, err)
//
in
if
(err=e00)
then (dcl) else
d0ecl_extern_errck(dcl.lctn(), tknd, dcl1)
end (*let*) // end of [ f0_extern(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_define
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cdefine
( tknd
, geid
, gmas, gedf) = dcl.node()
//
val geid =
pread00_i0dnt( geid, err )
val gmas =
pread00_g0maglst(gmas, err)
//
val gedf =
(
case+ gedf of
| 
G0EDFnone() => gedf
|
G0EDFsome(topt,g0e1) =>
let
val e00 = err
val
g0e1 =
pread00_g0exp( g0e1, err )
in//let
if
(err=e00)
then gedf else
G0EDFsome(topt, g0e1) end): g0edf
//
in//let
if
(err=e00)
then (dcl) else
d0ecl_define_errck
(dcl.lctn(), tknd, geid, gmas, gedf)
end (*let*) // end of [ f0_define(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_macdef
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cmacdef
( tknd
, geid
, gmas, dedf) = dcl.node()
//
val geid =
pread00_i0dnt( geid, err )
val gmas =
pread00_g0maglst(gmas, err)
//
val dedf =
(
case+ dedf of
| 
D0EDFnone() => dedf
|
D0EDFsome(topt,d0e1) =>
let
val e00 = err
val
d0e1 =
pread00_d0exp( d0e1, err )
in//let
if
(err=e00)
then dedf else
D0EDFsome(topt, d0e1) end): d0edf
//
in//let
if
(err=e00)
then (dcl) else
d0ecl_macdef_errck
(dcl.lctn(), tknd, geid, gmas, dedf)
end (*let*) // end of [ f0_macdef(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_local0
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Clocal0
( tknd
, dcs1
, topt
, dcs2, tend) = dcl.node()
//
val dcs1 =
pread00_d0eclist(dcs1, err)
val dcs2 =
pread00_d0eclist(dcs2, err)
val (  ) =
(
case+ tend.node() of
| T_END() => ()
| T_ENDLOC() => () | _ => (err := err+1))
//
in
if
(err=e00)
then (dcl) else
d0ecl_local0_errck
(dcl.lctn(), tknd, dcs1, topt, dcs2, tend)
end (*let*) // end of [ f0_local0(dcl,err) ]
//
(* ****** ****** *)
//
fun
f0_abssort
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cabssort
(tknd, tid0) = dcl.node()
//
val tid0 =
pread00_i0dnt( tid0, err )
//
in//let
if
(err=e00)
then (dcl) else
d0ecl_abssort_errck(dcl.lctn(), tknd, tid0)
end (*let*) // end of [f0_abssort(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_stacst0
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cstacst0
( tknd
, sid0
, tmas
, tcln, s0t1) = dcl.node()
//
val sid0 =
pread00_i0dnt(sid0, err)
val tmas =
pread00_t0maglst(tmas, err)
val (  ) =
(
case+
tcln.node() of
| T_CLN() => ((*void*))
| _(*non-T_CLN*) => (err := err+1)
)
val s0t1 = pread00_sort0(s0t1, err)
//
in//let
if
(err=e00)
then (dcl) else
d0ecl_stacst0_errck
(dcl.lctn(), tknd, sid0, tmas, tcln, s0t1)
end (*let*) // end of [f0_stacst0(dcl,err)]
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
, tid0
, teq1, def2) = dcl.node()
//
val tid0 =
pread00_i0dnt(tid0, err)
val (  ) =
(
case+
teq1.node() of
| T_EQ0() => ((*void*))
| _(*non-T_EQ0*) => (err := err+1)
)
val def2 = pread00_s0tdf(def2, err)
//
in//let
if
(err=e00)
then (dcl) else
d0ecl_sortdef_errck
(dcl.lctn(), tknd, tid0, teq1, def2)
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
val loc = dcl.lctn()
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
pread00_i0dnt(seid, err)
val smas =
pread00_s0maglst(smas, err)
val tres =
pread00_sort0opt(tres, err)
val (  ) =
(
case+
teq1.node() of
| T_EQ0() => ((*void*))
| _(*non-T_EQ0*) => (err := err+1)
)
val def2 = pread00_s0exp(def2, err)
//
in//let
if
(err=e00)
then (dcl) else
d0ecl_sexpdef_errck
(loc, tknd, seid, smas, tres, teq1, def2)
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
pread00_i0dnt(seid, err)
val tmas =
pread00_t0maglst(tmas, err)
val tres =
pread00_sort0opt(tres, err)
//
val tdef = pread00_a0tdf(tdef, err)
//
in//let
if
(err=e00)
then (dcl) else
d0ecl_abstype_errck
( dcl.lctn(), tknd,seid,tmas,tres,tdef )
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
val sqid = pread00_s0qid(sqid, err)
//
in
if
(err=e00)
then (dcl) else
d0ecl_absopen_errck(dcl.lctn(),tknd,sqid)
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
pread00_s0qid(sqid, err)
val smas =
pread00_s0maglst(smas, err)
val tres =
pread00_sort0opt(tres, err)
//
val (  ) =
(
case+
teq1.node() of
| T_EQ0() => ()
| _(*else*)=> (err := err + 1))
//
val s0e2 = pread00_s0exp(s0e2, err)
//
in//let
if
(err=e00)
then (dcl) else
d0ecl_absimpl_errck
(dcl.lctn(),tknd,sqid,smas,tres,teq1,s0e2)
end (*let*) // end of [f0_absimpl(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_symload
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Csymload
( tknd
, symb, twth
, dqid, gopt) = dcl.node()
//
val symb = pread00_s0ymb(symb, err)
val dqid = pread00_d0qid(dqid, err)
val gopt = pread00_g0expopt(gopt, err)
//
if
(err=e00)
then (dcl) else
d0ecl_symload_errck
( dcl.lctn(), tknd,symb,twth,dqid,gopt )
end (*let*) // end of [f0_symload(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_include
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val loc = dcl.lctn()
//
val-
D0Cinclude
( knd0
, tknd, g0e1) = dcl.node()
//
val g0e1 = pread00_g0exp(g0e1, err)
//
if
(err=e00)
then (dcl) else
d0ecl_include_errck(loc,knd0,tknd,g0e1)
end (*let*) // end of [f0_include(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_staload
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val loc = dcl.lctn()
//
val-
D0Cstaload
( knd0
, tknd, g0e1) = dcl.node()
//
val g0e1 = pread00_g0exp(g0e1, err)
//
if
(err=e00)
then (dcl) else
d0ecl_staload_errck(loc,knd0,tknd,g0e1)
end (*let*) // end of [f0_staload(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_dyninit
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cdyninit
(tknd, g0e1) = dcl.node()
//
val g0e1 = pread00_g0exp(g0e1, err)
//
if
(err=e00)
then (dcl) else
d0ecl_dyninit_errck(dcl.lctn(),tknd,g0e1)
end (*let*) // end of [f0_dyninit(dcl,err)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-20:
Sat 20 Jul 2024 01:36:19 PM EDT
*)
//
fun
f0_extcode
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cextcode
(tknd, g0e1) = dcl.node()
//
val g0e1 = pread00_g0exp(g0e1, err)
//
if
(err=e00)
then (dcl) else
d0ecl_extcode_errck(dcl.lctn(),tknd,g0e1)
end (*let*) // end of [f0_extcode(dcl,err)]
//
(* ****** ****** *)
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
val d0ts = pread00_d0tstlst(d0ts, err)
//
if
(err=e00)
then (dcl) else
d0ecl_datasort_errck(dcl.lctn(),tknd,d0ts)
end (*let*) // end of [f0_datasort(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_valdclst
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cvaldclst
( tknd, d0cs) = dcl.node()
//
val d0cs =
pread00_d0valdclist(d0cs, err)
//
in//let
if
(err=e00)
then (dcl) else
d0ecl_valdclst_errck(dcl.lctn(),tknd,d0cs)
end (*let*) // end of [f0_valdclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_vardclst
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cvardclst
( tknd, d0cs) = dcl.node()
//
val d0cs =
pread00_d0vardclist(d0cs, err)
//
in//let
if
(err=e00)
then (dcl) else
d0ecl_vardclst_errck(dcl.lctn(),tknd,d0cs)
end (*let*) // end of [f0_vardclst(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_fundclst
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val loc = dcl.lctn()
//
val-
D0Cfundclst
( tknd
, tqas, d0cs) = dcl.node()
//
val tqas =
pread00_t0qaglst(tqas, err)
val d0cs =
pread00_d0fundclist(d0cs, err)
//
in//let
if
(err=e00)
then (dcl) else
d0ecl_fundclst_errck(loc, tknd, tqas, d0cs)
end (*let*) // end of [f0_fundclst(dcl,err)]
//
(* ****** ****** *)

fun
f0_implmnt0
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val-
D0Cimplmnt0
( tknd
, sqas, tqas
, dqid, tias
, fags, sres
, teq1, body) = dcl.node()
//
val sqas =
  pread00_s0qaglst(sqas, err)
val tqas =
  pread00_t0qaglst(tqas, err)
//
val dqid =
  pread00_d0qid(dqid, err)
val tias =
  pread00_t0iaglst(tias, err)
val fags =
  pread00_f0arglst(fags, err)
//
val sres = pread00_s0res(sres, err)
//
val (  ) =
(
case+
teq1.node() of
|
T_EQ0() => ((*void*))
| _(*non-T_EQ0*) => (err := err+1)
)
//
val body = pread00_d0exp(body, err)
//
in//let
if
(err=e00)
then (dcl) else
d0ecl_implmnt0_errck
( dcl.lctn(), tknd, sqas
, tqas, dqid, tias, fags, sres, teq1, body)
end (*let*) // end of [f0_implmnt0(dcl,err)]

(* ****** ****** *)
//
fun
f0_excptcon
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val loc = dcl.lctn()
//
val-
D0Cexcptcon
( tknd
, tbar, d0ts) = dcl.node()
//
val d0ts = pread00_d0tcnlst(d0ts, err)
//
if
(err=e00)
then (dcl) else
d0ecl_excptcon_errck(loc, tknd, tbar, d0ts)
end (*let*) // end of [f0_excptcon(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_datatype
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val loc = dcl.lctn()
//
val-
D0Cdatatype
( tknd
, d0ts, wdcs) = dcl.node()
//
val d0ts = pread00_d0typlst(d0ts, err)
val wdcs = pread00_wd0eclseq(wdcs, err)
//
if
(err=e00)
then (dcl) else
d0ecl_datatype_errck(loc, tknd, d0ts, wdcs)
end (*let*) // end of [f0_datatype(dcl,err)]
//
(* ****** ****** *)
//
fun
f0_dynconst
( dcl: d0ecl
, err: &sint >> _): d0ecl =
let
//
val e00 = err
//
val loc = dcl.lctn()
//
val-
D0Cdynconst
( tknd
, tqas, d0cs) = dcl.node()
//
val tqas =
pread00_t0qaglst(tqas, err)
val d0cs =
pread00_d0cstdclist(d0cs, err)
//
in
if
(err=e00)
then (dcl) else
d0ecl_dynconst_errck(loc, tknd, tqas, d0cs)
end (*let*) // end of [f0_dynconst(dcl, err)]
//
(* ****** ****** *)
(*
val (  ) = // HX: for debugging
(
  prerrsln( "pread00_d0ecl: dcl = ", dcl ) )
*)
(* ****** ****** *)
//
} (*where*) // end of [pread00_d0ecl(dcl,err)]

(* ****** ****** *)
//
#implfun
pread00_d0eclist
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
dcl1 = pread00_d0ecl(dcl1, err)
val
dcs1 = pread00_d0eclist(dcs1, err)
//
in//let
if
(err=e00)
then dcls else list_cons(dcl1, dcs1)
endlet // end of [list_cons(dcl1,dcls)]
) (*case*)//end-of-[pread00_d0eclist(dcls,err)]
//
(* ****** ****** *)

#implfun
pread00_a0tdf
  (tdf0, err) =
let
val e00 = err
in//let
//
case+ tdf0 of
|
A0TDFsome() => tdf0
|
A0TDFlteq(tok1, s0e2) =>
let
val s0e2 =
pread00_s0exp(s0e2, err)
in
if
(err=e00)
then tdf0 else A0TDFlteq(tok1, s0e2)
end (*let*)//end of [A0TDFlteq(_,_)]
|
A0TDFeqeq(tok1, s0e2) =>
let
val s0e2 =
pread00_s0exp(s0e2, err)
in
if
(err=e00)
then tdf0 else A0TDFeqeq(tok1, s0e2)
end (*let*)//end of [A0TDFeqeq(_,_)]
//
end (*let*)//end-of-[pread00_a0tdf(tdf0,err)]

(* ****** ****** *)
//
#implfun
pread00_teqd0exp
  (tdxp, err) =
(
case+ tdxp of
|
TEQD0EXPnone() => tdxp
|
TEQD0EXPsome(teq1, d0e2) =>
let
val e00 = err
val d0e2 = pread00_d0exp(d0e2, err)
in//letp
if
(err=e00)
then tdxp else TEQD0EXPsome(teq1, d0e2)
endlet // end of [TEQD0EXPsome(_,_)]
) (*case+*)//end-(pread00_teqd0exp(tdxp,err))
//
#implfun
pread00_wths0exp
  (wsxp, err) =
(
case+ wsxp of
|
WTHS0EXPnone() => wsxp
|
WTHS0EXPsome(twth, s0e1) =>
let
val e00 = err
val d0e2 = pread00_s0exp(s0e1, err)
in//letp
if
(err=e00)
then wsxp else WTHS0EXPsome(twth, s0e1)
endlet // end of [WTHS0EXPsome(_,_)]
) (*case+*)//end-(pread00_wths0exp(wsxp,err))
//
(* ****** ****** *)
//
#implfun
pread00_d0valdcl
  (dval, err) =
let
//
val e00 = err
//
val loc = dval.lctn()
//
val
dpat = pread00_d0pat(dpat,err)
val
tdxp = pread00_teqd0exp(tdxp,err)
val
wsxp = pread00_wths0exp(wsxp,err)
//
in//let
if
(err=e00)
then (dval)
else d0valdcl(loc,dpat,tdxp,wsxp)
end where
{
  val dpat = d0valdcl_get_dpat(dval)
  val tdxp = d0valdcl_get_tdxp(dval)
  val wsxp = d0valdcl_get_wsxp(dval)
} (*where*)//end-of-[pread00_d0valdcl(out,dval)]
//
(* ****** ****** *)
//
#implfun
pread00_d0vardcl
  (dvar, err) =
let
//
val e00 = err
//
val loc = dvar.lctn()
//
val
dpid = pread00_i0dnt(dpid,err)
val
vpid = pread00_i0dntopt(vpid,err)
val
sres = pread00_s0expopt(sres,err)
val
dini = pread00_teqd0exp(dini,err)
//
in//let
if
(err=e00)
then (dvar) else
d0vardcl(loc, dpid,vpid,sres,dini )
end where
{
  val dpid = d0vardcl_get_dpid(dvar)
  val vpid = d0vardcl_get_vpid(dvar)
  val sres = d0vardcl_get_sres(dvar)
  val dini = d0vardcl_get_dini(dvar)
} (*where*)//end-of-[pread00_d0vardcl(out,dvar)]
//
(* ****** ****** *)
//
#implfun
pread00_d0fundcl
  (dfun, err) =
let
//
val e00 = err
//
val loc = dfun.lctn()
//
val dpid =
  pread00_i0dnt(dpid, err)
val fags =
  pread00_f0arglst(fags, err)
val sres = pread00_s0res(sres, err)
val tdxp = pread00_teqd0exp(tdxp, err)
val wsxp = pread00_wths0exp(wsxp, err)
//
in//let
if
(err=e00)
then (dfun) else
d0fundcl_make_args
(loc, dpid, fags, sres, tdxp, wsxp)
end where
{
  val dpid = d0fundcl_get_dpid(dfun)
  val fags = d0fundcl_get_farg(dfun)
  val sres = d0fundcl_get_sres(dfun)
  val tdxp = d0fundcl_get_tdxp(dfun)
  val wsxp = d0fundcl_get_wsxp(dfun)
} (*where*)//end-of-[pread00_d0fundcl(out,dfun)]
//
(* ****** ****** *)
//
#implfun
pread00_d0cstdcl
  (dcst, err) =
let
//
val e00 = err
//
val loc = dcst.lctn()
//
val dpid =
  pread00_i0dnt(dpid, err)
val dags =
  pread00_d0arglst(dags, err)
val sres = pread00_s0res(sres, err)
val dres = pread00_d0res(dres, err)
//
in//let
if
(err=e00)
then (dcst) else
d0cstdcl(loc,dpid, dags, sres, dres)
end where
{
  val dpid = d0cstdcl_get_dpid(dcst)
  val dags = d0cstdcl_get_darg(dcst)
  val sres = d0cstdcl_get_sres(dcst)
  val dres = d0cstdcl_get_dres(dcst)
} (*where*)//end-of-[pread00_d0cstdcl(out,dcst)]
//
(* ****** ****** *)
#implfun
pread00_q0arglst
  (  lst, err  ) =
list_pread00_fnp(lst, err, pread00_q0arg)
(* ****** ****** *)
#implfun
pread00_s0qaglst
  (  lst, err  ) =
list_pread00_fnp(lst, err, pread00_s0qag)
(* ****** ****** *)
#implfun
pread00_t0qaglst
  (  lst, err  ) =
list_pread00_fnp(lst, err, pread00_t0qag)
(* ****** ****** *)
#implfun
pread00_t0iaglst
  (  lst, err  ) =
list_pread00_fnp(lst, err, pread00_t0iag)
(* ****** ****** *)
#implfun
pread00_a0typlst
  (  lst, err  ) =
list_pread00_fnp(lst, err, pread00_a0typ)
#implfun
pread00_d0arglst
  (  lst, err  ) =
list_pread00_fnp(lst, err, pread00_d0arg)
(* ****** ****** *)
#implfun
pread00_d0valdclist
  (  lst, err  ) =
list_pread00_fnp(lst, err, pread00_d0valdcl)
(* ****** ****** *)
#implfun
pread00_d0vardclist
  (  lst, err  ) =
list_pread00_fnp(lst, err, pread00_d0vardcl)
(* ****** ****** *)
#implfun
pread00_d0fundclist
  (  lst, err  ) =
list_pread00_fnp(lst, err, pread00_d0fundcl)
(* ****** ****** *)
#implfun
pread00_d0cstdclist
  (  lst, err  ) =
list_pread00_fnp(lst, err, pread00_d0cstdcl)
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_pread00_decl00.dats] *)
(***********************************************************************)
