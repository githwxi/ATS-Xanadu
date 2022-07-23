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
Start Time: June 21st, 2022
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
#symload lctn with t0qua_get_lctn
(* ****** ****** *)
#symload lctn with f0arg_get_lctn
#symload node with f0arg_get_node
(* ****** ****** *)
#symload lctn with d0ecl_get_lctn
#symload node with d0ecl_get_node
(* ****** ****** *)
//
fun
d0pat_errck
(lvl: sint
,d0p: d0pat): d0pat =
(
d0pat
(d0p.lctn(), D0Perrck(lvl, d0p))
)//end-of-[d0pat_errck(_,_)]
//
(* ****** ****** *)
fun
d0pat_errvl_a1
(d0p: d0pat): sint =
(
case+ d0p.node() of
|
D0Perrck
(lvl, _) => lvl | _ => 0
)
#symload
d0pat_errvl with d0pat_errvl_a1
#symload errvl with d0pat_errvl_a1
(* ****** ****** *)
fun
d0pat_errvl_a2
(de1: d0pat
,de2: d0pat): sint =
gmax
(errvl(de1),errvl(de2))
#symload
d0pat_errvl with d0pat_errvl_a2
#symload errvl with d0pat_errvl_a2
(* ****** ****** *)
//
#extern
fun
d0pat_errvl_d0ps
(d0ps: d0patlst): sint
#symload
d0pat_errvl with d0pat_errvl_d0ps
#symload errvl with d0pat_errvl_d0ps
//
#implfun
d0pat_errvl_d0ps(d0ps) =
(
case+ d0ps of
|
list_nil
((*nil*)) => 0
|
list_cons
(d0p1,d0ps) =>
gmax(errvl(d0p1), errvl(d0ps)))
//
(* ****** ****** *)
#extern
fun
l0d0p_errvl
(ld0p: l0d0p): sint
#extern
fun
l0d0p_errvl_ldps
(ldps: l0d0plst): sint
(* ****** ****** *)
#symload errvl with l0d0p_errvl
#symload errvl with l0d0p_errvl_ldps
(* ****** ****** *)
//
#implfun
l0d0p_errvl(ld0p) =
(
  d0pat_errvl(d0p)) where
{
  val+
  D0LAB(lab, tok, d0p) = ld0p
}
//
#implfun
l0d0p_errvl_ldps(ldps) =
(
case+ ldps of
|
list_nil
((*nil*)) => 0
|
list_cons
(ldp1,ldps) =>
gmax(errvl(ldp1), errvl(ldps)))
//
(* ****** ****** *)
//
#extern
fun
d0pat_errvl_drp0
(drp0: d0pat_RPAREN): sint
#symload errvl with d0pat_errvl_drp0
//
#implfun
d0pat_errvl_drp0
(     drp0     ) =
(
case+ drp0 of
|
d0pat_RPAREN_cons0
(      tpar      ) => 0
|
d0pat_RPAREN_cons1
(tbeg, d0ps, tend) => errvl(d0ps)
)
//
(* ****** ****** *)
//
#extern
fun
d0pat_errvl_ldrb
(ldrb: l0d0p_RBRACE): sint
#symload errvl with d0pat_errvl_ldrb
//
#implfun
d0pat_errvl_ldrb
(     ldrb     ) =
(
case+ ldrb of
|
l0d0p_RBRACE_cons0
(      tbra      ) => 0
|
l0d0p_RBRACE_cons1
(tbeg, ldps, tend) => errvl(ldps)
)
//
(* ****** ****** *)
//
fun
d0pat_apps_errck
( loc
: loc_t
, d0ps
: d0patlst): d0pat =
let
  val lvl = d0pat_errvl(d0ps)
in//let
d0pat_errck
(lvl+1, d0pat(loc,D0Papps(d0ps)))
end (*let*) // end of [d0pat_apps_errck]
//
(* ****** ****** *)
//
fun
d0pat_lpar_errck
( loc
: loc_t
, tbeg
: token
, d0ps
: d0patlst
, drp0
: d0pat_RPAREN): d0pat =
let
  val lvl =
  gmax(errvl(d0ps),errvl(drp0))
in//let
d0pat_errck
( lvl+1
, d0pat(loc,D0Plpar(tbeg, d0ps, drp0)))
end (*let*) // end of [d0pat_lpar_errck]
//
(* ****** ****** *)
//
fun
d0pat_tup1_errck
( loc
: loc_t
, tbeg
: token
, topt
: tokenopt
, d0ps
: d0patlst
, tend
: d0pat_RPAREN): d0pat =
let
  val lvl =
  gmax(errvl(d0ps),errvl(tend))
in//let
d0pat_errck
(lvl+1,
 d0pat_make_node
 (loc,D0Ptup1(tbeg, topt, d0ps, tend)))
end (*let*) // end of [d0pat_tup1_errck]
//
(* ****** ****** *)
//
fun
d0pat_rcd2_errck
( loc
: loc_t
, tbeg
: token
, topt
: tokenopt
, ldps
: l0d0plst
, tend
: l0d0p_RBRACE): d0pat =
let
  val lvl =
  gmax(errvl(ldps),errvl(tend))
in//let
d0pat_errck
(lvl+1,
 d0pat_make_node
 (loc,D0Prcd2(tbeg, topt, ldps, tend)))
end (*let*) // end of [d0pat_rcd2_errck]
//
(* ****** ****** *)
//
fun
d0pat_anno_errck
( loc
: loc_t
, d0p1: d0pat
, s0e2: s0exp): d0pat =
let
  val lvl = d0pat_errvl(d0p1)
in//let
d0pat_errck
(lvl+1, d0pat(loc,D0Panno(d0p1,s0e2)))
end (*let*) // end of [d0pat_anno_errck]
//
(* ****** ****** *)
//
fun
d0exp_errck
(lvl: sint
,d0e: d0exp): d0exp =
(
d0exp
(d0e.lctn(), D0Eerrck(lvl, d0e))
)//end-of-[d0exp_errck(_,_)]
//
(* ****** ****** *)
fun
d0exp_errvl_a1
(d0e: d0exp): sint =
(
case+ d0e.node() of
|
D0Eerrck
(lvl, _) => lvl | _ => 0
)
#symload
d0exp_errvl with d0exp_errvl_a1
#symload errvl with d0exp_errvl_a1
(* ****** ****** *)
fun
d0exp_errvl_a2
(de1: d0exp
,de2: d0exp): sint =
gmax
(errvl(de1),errvl(de2))
#symload
d0exp_errvl with d0exp_errvl_a2
#symload errvl with d0exp_errvl_a2
(* ****** ****** *)
fun
d0exp_errvl_a3
(de1: d0exp
,de2: d0exp
,de3: d0exp): sint =
gmax
(errvl(de1)
,errvl(de2),errvl(de3))
#symload
d0exp_errvl with d0exp_errvl_a3
#symload errvl with d0exp_errvl_a3
(* ****** ****** *)
//
#extern
fun
d0exp_errvl_d0es
(d0es: d0explst): sint
#symload
d0exp_errvl with d0exp_errvl_d0es
#symload errvl with d0exp_errvl_d0es
//
#implfun
d0exp_errvl_d0es(d0es) =
(
case+ d0es of
|
list_nil
((*nil*)) => 0
|
list_cons
(d0e1,d0es) =>
gmax(errvl(d0e1), errvl(d0es)))
//
(* ****** ****** *)
//
#extern
fun
d0exp_errvl_then
(drp: d0exp_THEN): sint
#symload errvl with d0exp_errvl_then
//
#implfun
d0exp_errvl_then
(     dthn     ) =
(
case+ dthn of
|
d0exp_THEN_none(tok) => 0
|
d0exp_THEN_some(tok,d0e) => errvl(d0e)
)
//
(* ****** ****** *)
#extern
fun
d0exp_errvl_else
(drp: d0exp_ELSE): sint
#symload errvl with d0exp_errvl_else
//
#implfun
d0exp_errvl_else
(     dels     ) =
(
case+ dels of
|
d0exp_ELSE_none(tok) => 0
|
d0exp_ELSE_some(tok,d0e) => errvl(d0e)
)
//
(* ****** ****** *)
//
#extern
fun
d0exp_errvl_drp0
(drp: d0exp_RPAREN): sint
#symload errvl with d0exp_errvl_drp0
//
#implfun
d0exp_errvl_drp0
(     drp0     ) =
(
case+ drp0 of
|
d0exp_RPAREN_cons0(tok) => 0
|
d0exp_RPAREN_cons1(tkb,des,tke) => errvl(des)
)
//
(* ****** ****** *)
//
#extern
fun
l0d0e_errvl
(lde: l0d0e): sint
#extern
fun
l0d0e_errvl_ldes
(ldes: l0d0elst): sint
(* ****** ****** *)
#symload errvl with l0d0e_errvl
#symload errvl with l0d0e_errvl_ldes
(* ****** ****** *)
//
#implfun
l0d0e_errvl(ld0e) =
(
  d0exp_errvl(d0e)) where
{
  val+
  D0LAB(lab, tok, d0e) = ld0e
}
//
#implfun
l0d0e_errvl_ldes(ldes) =
(
case+ ldes of
|
list_nil
((*nil*)) => 0
|
list_cons
(lde1,ldes) =>
gmax(errvl(lde1), errvl(ldes)))
//
(* ****** ****** *)
#extern
fun
l0d0e_errvl_ldrb
(ldrb: l0d0e_RBRACE): sint
#implfun
l0d0e_errvl_ldrb
(     ldrb     ) =
(
case+ ldrb of
|
l0d0e_RBRACE_cons0
(       tok      ) => 0
|
l0d0e_RBRACE_cons1
(  tkb,ldes,tke  ) => errvl(ldes)
)
//
#symload errvl with l0d0e_errvl_ldrb
//
(* ****** ****** *)
//
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
//
(* ****** ****** *)
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
((*nil*)) => 0
|
list_cons
(dcl1,dcls) =>
gmax(errvl(dcl1), errvl(dcls)))
//
(* ****** ****** *)
//
fun
d0exp_opid_errck
( loc
: loc_t
, id0
: d0eid): d0exp =
let
val
lvl = 0 in
d0exp_errck
(lvl+1, d0exp(loc, D0Eopid(id0)))
end (*let*) // end of [d0exp_opid_errck]
//
(* ****** ****** *)
//
fun
d0exp_apps_errck
( loc
: loc_t
, des
: d0explst): d0exp =
let
val lvl = d0exp_errvl(des)
in//let
d0exp_errck
(lvl+1, d0exp(loc, D0Eapps(des)))
end (*let*) // end of [d0exp_apps_errck]
//
(* ****** ****** *)
//
fun
d0exp_lpar_errck
( loc
: loc_t
, tkb
: token
, des
: d0explst
, drp
: d0exp_RPAREN): d0exp =
let
  val lvl =
  gmax(errvl(des),errvl(drp))
in//let
d0exp_errck
(lvl+1, d0exp(loc,D0Elpar(tkb,des,drp)))
end (*let*) // end of [d0exp_lpar_errck]
//
(* ****** ****** *)
//
fun
d0exp_if0_errck
( loc: loc_t
, tif0: token
, d0e1: d0exp
, dthn
: d0exp_THEN
, dels
: d0exp_ELSE): d0exp =
let
val lvl =
(
gmax
(errvl(d0e1)
,errvl(dthn),errvl(dels)))
in//let
d0exp_errck
( lvl+1
, d0exp
  (loc, D0Eif0(tif0,d0e1,dthn,dels)) )
end (*let*) // end of [d0exp_if0_errck]
//
(* ****** ****** *)
//
fun
d0exp_tup1_errck
( loc
: loc_t
, tbeg
: token
, topt
: tokenopt
, d0es
: d0explst
, tend
: d0exp_RPAREN): d0exp =
let
  val lvl =
  gmax(errvl(d0es),errvl(tend))
in//let
d0exp_errck
(lvl+1,
 d0exp_make_node
 (loc,D0Etup1(tbeg, topt, d0es, tend)))
end (*let*) // end of [d0exp_tup1_errck]
//
(* ****** ****** *)
//
fun
d0exp_rcd2_errck
( loc
: loc_t
, tbeg
: token
, topt
: tokenopt
, ldes
: l0d0elst
, tend
: l0d0e_RBRACE): d0exp =
let
  val lvl =
  gmax(errvl(ldes),errvl(tend))
in//let
d0exp_errck
(lvl+1,
 d0exp_make_node
 (loc,D0Ercd2(tbeg, topt, ldes, tend)))
end (*let*) // end of [d0exp_rcd2_errck]
//
(* ****** ****** *)
//
fun
d0exp_let0_errck
( loc
: loc_t
, tknd
: token
, dcls
: d0eclist
, topt
: tokenopt
, d0es
: d0explst
, tend: token): d0exp =
let
  val lvl =
  gmax(errvl(dcls),errvl(d0es))
in//let
d0exp_errck
(lvl+1,
 d0exp_make_node
 (loc
 ,D0Elet0(tknd,dcls,topt,d0es,tend)))
end (*let*) // end of [d0exp_let0_errck]
//
(* ****** ****** *)
//
fun
d0exp_where_errck
( loc
: loc_t
, d0e1
: d0exp
, dcls
: d0eclseq_WHERE): d0exp =
let
//
val lvl =
(
case+ dcls of
|
d0eclseq_WHERE
(tbeg,topt,d0cs,tend) =>
gmax(errvl(d0e1),errvl(d0cs)))
//
in//let
d0exp_errck
(lvl+1,d0exp(loc, D0Ewhere(d0e1, dcls)))
end (*let*) // end of [d0exp_where_errck]
//
(* ****** ****** *)
//
fun
d0exp_lam0_errck
( loc: loc_t
, tknd: token
, fags: f0arglst
, sres: s0res
, arrw: f0unarrw
, body: d0exp
, tend: tokenopt): d0exp =
let
  val lvl = d0exp_errvl(body)
in//let
d0exp_errck
( lvl+1,
  d0exp_make_node
  ( loc
  , D0Elam0
    (tknd,fags,sres,arrw,body,tend)) )
end (*let*) // end of [d0exp_lam0_errck]
//
(* ****** ****** *)
//
fun
d0exp_anno_errck
( loc
: loc_t
, d0e1: d0exp
, s0e2: s0exp): d0exp =
let
  val lvl = d0exp_errvl(d0e1)
in//let
d0exp_errck
(lvl+1, d0exp(loc,D0Eanno(d0e1,s0e2)))
end (*let*) // end of [d0exp_anno_errck]
//
(* ****** ****** *)
//
fun
d0exp_qual_errck
( loc
: loc_t
, tok1: token
, d0e2: d0exp): d0exp =
let
  val lvl = d0exp_errvl(d0e2)
in//let
d0exp_errck
(lvl+1, d0exp(loc,D0Equal(tok1,d0e2)))
end (*let*) // end of [d0exp_qual_errck]
//
(* ****** ****** *)
(*
HX-2022-07:
implement [preadx0_d0pat]
implement [preadx0_d0exp]
*)
(* ****** ****** *)
//
#implfun
preadx0_d0pat
  (d0p, err) =
(
case+
d0p.node() of
//
| D0Pid0 _ => d0p
//
| D0Pint _ => d0p
| D0Pchr _ => d0p
| D0Pflt _ => d0p
| D0Pstr _ => d0p
//
|
D0Papps _ => f0_apps(d0p, err)
//
|
D0Plpar _ => f0_lpar(d0p, err)
//
|
D0Ptup1 _ => f0_tup1(d0p, err)
|
D0Prcd2 _ => f0_rcd2(d0p, err)
//
|
D0Panno _ => f0_anno(d0p, err)
//
|
D0Ptkerr _ =>
(err := err+1; d0pat_errck(1, d0p))
//
|
D0Perrck _ =>
(err := err+1; d0pat_errck(1, d0p))
//
| _(*otherwise*) => (d0p) // HX: placeholder
//
) where // end-of(case(d0p.node()))
{
(* ****** ****** *)
//
fun
f0_apps
( d0p
: d0pat
, err
: &sint >> _): d0pat =
let
val e00 = err
val-
D0Papps(dps) = d0p.node()
val dps = preadx0_d0patlst(dps, err)
in//let
if
(err=e00)
then (d0p)
else d0pat_apps_errck(d0p.lctn(), dps)
end (*let*) // end of [f0_apps]
//
(* ****** ****** *)
//
fun
f0_lpar
( d0p
: d0pat
, err
: &sint >> _): d0pat =
let
//
val e00 = err
val-
D0Plpar
(tkb,dps,drp) = d0p.node()
//
val dps =
preadx0_d0patlst(dps, err)
val drp =
preadx0_d0pat_RPAREN(drp, err)
in//let
if
(err=e00)
then d0p else
d0pat_lpar_errck(d0p.lctn(),tkb,dps,drp)
end (*let*) // end of [f0_lpar]
//
(* ****** ****** *)
//
fun
f0_tup1
( d0p: d0pat
, err: &sint >> _): d0pat =
let
//
val e00 = err
//
val-
D0Ptup1
( tbeg, topt
, d0ps, tend) = d0p.node()
//
val d0p2 =
preadx0_d0patlst(d0ps, err)
val tend =
preadx0_d0pat_RPAREN(tend, err)
//
in//let
if
(err=e00)
then (d0p) else
d0pat_tup1_errck
(d0p.lctn(), tbeg, topt, d0ps, tend)
end (*let*) // end of [f0_tup1(d0p,err)]
//
(* ****** ****** *)
//
fun
f0_rcd2
( d0p: d0pat
, err: &sint >> _): d0pat =
let
//
val e00 = err
//
val-
D0Prcd2
( tbeg, topt
, ldps, tend) = d0p.node()
//
val ldps =
preadx0_l0d0plst(ldps, err)
val tend =
preadx0_l0d0p_RBRACE(tend, err)
//
in//let
if
(err=e00)
then (d0p) else
d0pat_rcd2_errck
(d0p.lctn(), tbeg, topt, ldps, tend)
end (*let*) // end of [f0_rcd2(d0p,err)]
//
(* ****** ****** *)
//
fun
f0_anno
( d0p: d0pat
, err: &sint >> _): d0pat =
let
//
val e00 = err
//
val-
D0Panno
(d0p1, s0e2) = d0p.node()
//
val d0p1 = preadx0_d0pat(d0p1, err)
val s0e2 = preadx0_s0exp(s0e2, err)
//
in//let
if
(err=e00)
then (d0p) else
d0pat_anno_errck(d0p.lctn(),d0p1,s0e2)
end (*let*) // end of [f0_anno(d0p,err)]
//
(* ****** ****** *)

} (*where*) // end-of-[preadx0_d0pat(d0p,err)]
//
(* ****** ****** *)
//
#implfun
preadx0_l0d0p
  (ldp, err) =
let
//
val e00 = err
//
val+
D0LAB
(lab,teq,d0p) = ldp
//
val ( ) =
(
case+ lab of
|
L0ABLsome _ => ()
|
L0ABLnone _ => (err := err + 1)
)
val ( ) =
(
case+ teq.node() of
|
T_EQ0() => () // HX: lab = d0p
|
_(*non-EQ0*) => (err := err + 1)
)
val d0p = preadx0_d0pat(d0p, err)
in//let
if
(err = e00) then ldp else D0LAB(lab,teq,d0p)
end (*let*) // end of [preadx0_l0d0p(ldp,err)]
//
(* ****** ****** *)

#implfun
preadx0_d0exp
  (d0e, err) =
(
case+
d0e.node() of
//
| D0Eid0 _ => d0e
//
| D0Eint _ => d0e
| D0Echr _ => d0e
| D0Eflt _ => d0e
| D0Estr _ => d0e
//
|
D0Eopid _ => f0_opid(d0e, err)
//
|
D0Eapps _ => f0_apps(d0e, err)
//
|
D0Elpar _ => f0_lpar(d0e, err)
//
|
D0Eif0
(_,_,_,_) => f0_if0( d0e, err )
(*
|
D0Eif1
(_,_,_,_,_) => f0_if1( d0e, err )
*)
//
|
D0Etup1 _ => f0_tup1(d0e, err)
|
D0Ercd2 _ => f0_rcd2(d0e, err)
//
|
D0Elet0 _ => f0_let0(d0e, err)
|
D0Ewhere _ => f0_where(d0e, err)
//
|
D0Elam0 _ => f0_lam0(d0e, err)
(*
|
D0Efix0 _ => f0_fix0(d0e, err)
*)
//
|
D0Eanno _ => f0_anno(d0e, err)
//
|
D0Equal _ => f0_qual(d0e, err)
//
|
D0Etkerr _ =>
(err := err+1; d0exp_errck(1, d0e))
//
|
D0Eerrck _ =>
(err := err+1; d0exp_errck(1, d0e))
//
| _(*otherwise*) => (d0e) // HX: placeholder
//
) where // end-of(case(d0e.node()))
{
(* ****** ****** *)
//
fun
f0_opid
( d0e
: d0exp
, err
: &sint >> _): d0exp =
let
val e00 = err
val-
D0Eopid(id0) = d0e.node()
val id0 = preadx0_i0dnt(id0, err)
in//let
if
(err=e00)
then (d0e)
else d0exp_opid_errck(d0e.lctn(), id0)
end (*let*) // end of [f0_opid]
//
(* ****** ****** *)
//
fun
f0_apps
( d0e
: d0exp
, err
: &sint >> _): d0exp =
let
val e00 = err
val-
D0Eapps(des) = d0e.node()
val des = preadx0_d0explst(des, err)
in//let
if
(err=e00)
then (d0e)
else d0exp_apps_errck(d0e.lctn(), des)
end (*let*) // end of [f0_apps]
//
(* ****** ****** *)
//
fun
f0_lpar
( d0e
: d0exp
, err
: &sint >> _): d0exp =
let
//
val e00 = err
val-
D0Elpar
(tkb,des,drp) = d0e.node()
//
val des =
preadx0_d0explst(des, err)
val drp =
preadx0_d0exp_RPAREN(drp, err)
in//let
if
(err=e00)
then d0e else
d0exp_lpar_errck(d0e.lctn(),tkb,des,drp)
end (*let*) // end of [f0_lpar]
//
(* ****** ****** *)
//
fun
f0_if0
( d0e
: d0exp
, err
: &sint >> _): d0exp =
let
//
val e00 = err
//
val loc = d0e.lctn()
//
val-
D0Eif0
( tif0
, d0e1
, dthn, dels) = d0e.node()
//
val
d0e1 = preadx0_d0exp(d0e1, err)
val
dthn = preadx0_d0exp_THEN(dthn, err)
val
dels = preadx0_d0exp_ELSE(dels, err)
//
in
if
(err=e00)
then d0e else
d0exp_if0_errck(loc,tif0,d0e1,dthn,dels)
end (*let*) // end of [f0_if0(d0e, err)]

(* ****** ****** *)
//
fun
f0_tup1
( d0e
: d0exp
, err
: &sint >> _): d0exp =
let
//
val e00 = err
//
val-
D0Etup1
( tbeg, topt
, d0es, tend) = d0e.node()
//
val d0es =
preadx0_d0explst(d0es, err)
val tend =
preadx0_d0exp_RPAREN(tend, err)
//
in//let
if
(err=e00)
then (d0e) else
d0exp_tup1_errck
(d0e.lctn(), tbeg, topt, d0es, tend)
end (*let*) // end of [f0_tup1(d0e,err)]
//
(* ****** ****** *)
//
fun
f0_rcd2
( d0e: d0exp
, err: &sint >> _): d0exp =
let
//
val e00 = err
//
val-
D0Ercd2
( tbeg, topt
, ldes, tend) = d0e.node()
//
val ldes =
preadx0_l0d0elst(ldes, err)
val tend =
preadx0_l0d0e_RBRACE(tend, err)
//
in//let
if
(err=e00)
then (d0e) else
d0exp_rcd2_errck
(d0e.lctn(), tbeg, topt, ldes, tend)
end (*let*) // end of [f0_rcd2(d0e,err)]
//
(* ****** ****** *)
//
fun
f0_let0
( d0e: d0exp
, err: &sint >> _): d0exp =
let
//
val e00 = err
//
val-
D0Elet0
( tknd
, dcls, topt
, d0es, tend) = d0e.node()
//
val dcls =
preadx0_d0eclist(dcls, err)
val d0es =
preadx0_d0explst(d0es, err)
//
val (  ) =
(
case+
tend.node() of
| T_END() => ()
| T_ENDLET() => ()
|
_(*non-T_ENDLET*) => (err := err+1)
)
//
in//let
if
(err=e00)
then (d0e) else
d0exp_let0_errck
(d0e.lctn(),tknd,dcls,topt,d0es,tend)
end (*let*) // end of [f0_let0(d0e,err)]
//
(* ****** ****** *)
//
fun
f0_where
( d0e: d0exp
, err: &sint >> _): d0exp =
let
//
val e00 = err
//
val-
D0Ewhere
( d0e1, dcls) = d0e.node()
//
val d0e1 =
preadx0_d0exp(d0e1, err)
val dcls =
preadx0_d0eclseq_WHERE(dcls, err)
//
in//let
if
(err=e00)
then (d0e) else
d0exp_where_errck(d0e.lctn(),d0e1,dcls)
end (*let*) // end of [f0_where(d0e,err)]
//
(* ****** ****** *)
//
fun
f0_lam0
( d0e: d0exp
, err: &sint >> _): d0exp =
let
//
val e00 = err
//
val loc = d0e.lctn()
//
val-
D0Elam0
( tknd, fags
, sres, arrw
, body, tend) = d0e.node()
//
val fags =
  preadx0_f0arglst(fags, err)
//
val sres = preadx0_s0res(sres, err)
//
(*
val arrw =
  preadx0_f0unarrw(arrw, err)
*)
val body = preadx0_d0exp(body, err)
//
in//let
if
(err=e00)
then (d0e) else
d0exp_lam0_errck
(loc, tknd, fags, sres, arrw, body, tend)
end (*let*) // end of [f0_lam0(d0e, err)]
//
(* ****** ****** *)
//
fun
f0_anno
( d0e: d0exp
, err: &sint >> _): d0exp =
let
//
val e00 = err
//
val-
D0Eanno
( d0e1, s0e2) = d0e.node()
//
val d0e1 = preadx0_d0exp(d0e1, err)
val s0e2 = preadx0_s0exp(s0e2, err)
//
in//let
if
(err=e00)
then (d0e) else
d0exp_anno_errck(d0e.lctn(),d0e1,s0e2)
end (*let*) // end of [f0_anno(d0e,err)]
//
(* ****** ****** *)
//
fun
f0_qual
( d0e: d0exp
, err: &sint >> _): d0exp =
let
//
val e00 = err
//
val-
D0Equal
( tok1, d0e2) = d0e.node()
//
val d0e2 = preadx0_d0exp(d0e2, err)
//
in//let
if
(err=e00)
then (d0e) else
d0exp_qual_errck(d0e.lctn(),tok1,d0e2)
end (*let*) // end of [f0_qual(d0e,err)]
//
(* ****** ****** *)

} (*where*) // end-of-[preadx0_d0exp(d0e,err)]

(* ****** ****** *)
//
#implfun
preadx0_l0d0e
  (lde, err) =
let
//
val e00 = err
//
val+
D0LAB
(lab,teq,d0e) = lde
//
val ( ) =
(
case+ lab of
|
L0ABLsome _ => ()
|
L0ABLnone _ => (err := err + 1)
)
val ( ) =
(
case+ teq.node() of
|
T_EQ0() => () // HX: lab = d0e
|
_(*non-EQ0*) => (err := err + 1)
)
val d0e = preadx0_d0exp(d0e, err)
in//let
if
(err = e00) then lde else D0LAB(lab,teq,d0e)
end (*let*) // end of [preadx0_l0d0e(lde,err)]
//
(* ****** ****** *)

#implfun
preadx0_f0arg
  (f0a, err) =
(
case+
f0a.node() of
|
F0ARGnone(tok) =>
(err := err+1; f0a)
//
|
F0ARGdyn0(dpat) =>
let
val e00 = err
val dpat =
preadx0_d0pat(dpat, err)
in//let
if
(err=e00)
then (f0a) else
f0arg(f0a.lctn(), F0ARGdyn0(dpat))
end (*let*)//end-of-[F0ARGdyn0(dpat)]
//
|
F0ARGsta0
(tbeg,s0qs,tend) =>
let
//
val e00 = err
//
val s0qs =
preadx0_s0qualst(s0qs, err)
//
val (  ) =
(
case+
tend.node() of
|
T_RBRACE() => ((*void*))
|
_(*non-T_RBRACE*) => (err := err+1)
)
//
in//let
if
(err=e00)
then (f0a) else f0arg
(f0a.lctn(),F0ARGsta0(tbeg,s0qs,tend))
end (*let*)//end-of-[F0ARGsta0(_,_,_)]
//
|
F0ARGmet0
(tbeg,s0es,tend) =>
let
//
val e00 = err
//
val s0es =
preadx0_s0explst(s0es, err)
val (  ) =
(
case+
tend.node() of
|
T_GTDOT() => ((*void*))
|
_(*non-T_GTDOT*) => (err := err+1)
)
//
in//let
if
(err=e00)
then (f0a) else f0arg
(f0a.lctn(),F0ARGmet0(tbeg,s0es,tend))
end (*let*)//end-of-[F0ARGmet0(_,_,_)]
//
) (*case+*)//end-of-[preadx0_f0arg(dcl,err)]

(* ****** ****** *)
//
#implfun
preadx0_s0res
  (sres, err) =
(
case+ sres of
|
S0RESnone() => sres
|
S0RESsome(seff,s0e1) =>
let
//
val e00 = err
//
(*
val seff =
preadx0_s0eff(seff, err)
*)
val s0e1 =
preadx0_s0exp(s0e1, err)
in
if
(err=e00)
then (sres) else S0RESsome(seff, s0e1)
endlet // end of [S0RESsome(seff,s0e1)]
) (*case+*)//end-of[ preadx0_s0res(sres,err) ]
//
(* ****** ****** *)
//
#implfun
preadx0_d0res
  (dres, err) =
(
case+ dres of
|
D0RESnone() => dres
|
D0RESsome(teq1,d0e2) =>
let
//
val e00 = err
//
val (  ) =
(
case+
teq1.node() of
| T_EQ0() => ()
| _(*non-T_EQ0*) => (err := err+1)
)
val d0e2 = preadx0_d0exp(d0e2, err)
in//let
if
(err=e00)
then (dres) else D0RESsome(teq1, d0e2)
endlet // end of [D0RESsome(teq1,d0e2)]
) (*case+*)//end-of[ preadx0_d0res(dres,err) ]
//
(* ****** ****** *)
#implfun
preadx0_d0patopt
  (  lst, err  ) =
preadx0_synentopt_fun(lst,err,preadx0_d0pat)
#implfun
preadx0_d0expopt
  (  lst, err  ) =
preadx0_synentopt_fun(lst,err,preadx0_d0exp)
(* ****** ****** *)
#implfun
preadx0_d0patlst
  (  lst, err  ) =
preadx0_synentlst_fun(lst,err,preadx0_d0pat)
#implfun
preadx0_d0explst
  (  lst, err  ) =
preadx0_synentlst_fun(lst,err,preadx0_d0exp)
(* ****** ****** *)
#implfun
preadx0_l0d0plst
  (  lst, err  ) =
preadx0_synentlst_fun(lst,err,preadx0_l0d0p)
#implfun
preadx0_l0d0elst
  (  lst, err  ) =
preadx0_synentlst_fun(lst,err,preadx0_l0d0e)
(* ****** ****** *)
#implfun
preadx0_f0arglst
  (  lst, err  ) =
preadx0_synentlst_fun(lst,err,preadx0_f0arg)
(* ****** ****** *)
//
#implfun
preadx0_d0pat_RPAREN
  (drp0, err) =
(
case+ drp0 of
|
d0pat_RPAREN_cons0
(      tend      ) =>
(
case+
tend.node() of
|
T_RPAREN() => drp0
|
_(*non-T_RPAREN*) => (err := err+1; drp0)
)
|
d0pat_RPAREN_cons1
(tbar, d0ps, tend) =>
let
//
val e00 = err
//
val d0ps =
preadx0_d0patlst(d0ps, err)
in//let
//
case+
tend.node() of
|
T_RPAREN() =>
(
if
(err=e00)
then drp0
else
d0pat_RPAREN_cons1(tbar, d0ps, tend))
|
_(*non-T_RPAREN*) =>
( err := err+1
; d0pat_RPAREN_cons1(tbar, d0ps, tend))
//
endlet // end of [d0pat_RPAREN_cons1]
) (*case*) // end of [preadx0_d0pat_RPAREN]
//
(* ****** ****** *)

#implfun
preadx0_l0d0p_RBRACE
  (ldrb, err) =
(
case+ ldrb of
|
l0d0p_RBRACE_cons0
(      tend      ) =>
(
case+
tend.node() of
|
T_RBRACE() => ldrb
|
_(*non-T_RBRACE*) => (err := err+1; ldrb)
)
|
l0d0p_RBRACE_cons1
(tbar, ldps, tend) =>
let
//
val e00 = err
//
val ldps =
preadx0_l0d0plst(ldps, err)
in//let
//
case+
tend.node() of
|
T_RBRACE() =>
(
if
(err=e00)
then ldrb
else
l0d0p_RBRACE_cons1(tbar, ldps, tend)
)
|
_(*non-T_RBRACE*) =>
(err := err+1; l0d0p_RBRACE_cons1(tbar,ldps,tend))
//
endlet // end of [l0d0p_RBRACE_cons1]
) (*case*)//end-of-[preadx0_l0d0p_RBRACE(ldrb,err)]

(* ****** ****** *)
//
#implfun
preadx0_d0exp_THEN
  (dthn, err) =
(
case+ dthn of
|
d0exp_THEN_none
(     tok1    ) => dthn
|
d0exp_THEN_some
(  tok1,d0e2  ) =>
let
//
val e00 = err
//
val d0e2 =
preadx0_d0exp(d0e2, err)
in//let
if
(err=e00)
then (dthn)
else d0exp_THEN_some(tok1, d0e2)
endlet // end of [d0exp_THEN_some(tok1,d0e2)]
)
//
(* ****** ****** *)
//
#implfun
preadx0_d0exp_ELSE
  (dels, err) =
(
case+ dels of
|
d0exp_ELSE_none
(     tok1    ) => dels
|
d0exp_ELSE_some
(  tok1,d0e2  ) =>
let
//
val e00 = err
//
val d0e2 =
preadx0_d0exp(d0e2, err)
in//let
if
(err=e00)
then (dels)
else d0exp_ELSE_some(tok1, d0e2)
endlet // end of [d0exp_ELSE_some(tok1,d0e2)]
)
//
(* ****** ****** *)

#implfun
preadx0_d0exp_RPAREN
  (drp0, err) =
(
case+ drp0 of
|
d0exp_RPAREN_cons0
(      tend      ) =>
(
case+
tend.node() of
|
T_RPAREN() => drp0
|
_(*non-T_RPAREN*) => (err := err+1; drp0)
)
|
d0exp_RPAREN_cons1
(tbar, d0es, tend) =>
let
//
val e00 = err
//
val d0es =
preadx0_d0explst(d0es, err)
in//let
//
case+
tend.node() of
|
T_RPAREN() =>
(
if
(err=e00)
then drp0
else
d0exp_RPAREN_cons1(tbar, d0es, tend)
)
|
_(*non-T_RPAREN*) =>
(err := err+1; d0exp_RPAREN_cons1(tbar,d0es,tend))
//
endlet // end of [d0exp_RPAREN_cons1]
) (*case*)//end-of-[preadx0_d0exp_RPAREN(drp0,err)]

(* ****** ****** *)

#implfun
preadx0_l0d0e_RBRACE
  (ldrb, err) =
(
case+ ldrb of
|
l0d0e_RBRACE_cons0
(      tend      ) =>
(
case+
tend.node() of
|
T_RBRACE() => ldrb
|
_(*non-T_RBRACE*) => (err := err+1; ldrb)
)
|
l0d0e_RBRACE_cons1
(tbar, ldes, tend) =>
let
//
val e00 = err
//
val ldes =
preadx0_l0d0elst(ldes, err)
in//let
//
case+
tend.node() of
|
T_RBRACE() =>
(
if
(err=e00)
then ldrb
else
l0d0e_RBRACE_cons1(tbar, ldes, tend)
)
|
_(*non-T_RBRACE*) =>
(err := err+1; l0d0e_RBRACE_cons1(tbar,ldes,tend))
//
endlet // end of [l0d0e_RBRACE_cons1]
) (*case*)//end-of-[preadx0_l0d0e_RBRACE(ldrb,err)]

(* ****** ****** *)
//
#implfun
preadx0_d0eclseq_WHERE
  (dcls, err) =
(
case+ dcls of
|
d0eclseq_WHERE
(tbeg, topt, d0cs, tend) =>
let
//
val e00 = err
//
val d0cs =
preadx0_d0eclist(d0cs, err)
//
val (  ) =
(
case+ tend of
|
tkend_WHERE_cons1
(     tok1     ) =>
(
case+
tok1.node() of
|
T_ENDWHR() =>
( case+ topt of
| optn_nil() => ()
| optn_cons _ => (err := err+1))
|
T_RBRACE() =>
(case+ topt of
| optn_nil() =>
  (err := err+1) | optn_cons _ => ())
)
) (*case+*) // end of [val()]
//
in
if
(err=e00)
then dcls else
d0eclseq_WHERE(tbeg, topt, d0cs, tend)
endlet // end of [d0eclseq_WHERE(_,_,_,_)]
) (*case+*)//end(preadx0_d0eclseq_WHERE(dcls,err))
//  
(* ****** ****** *)

(* end of [ATS3/XATSOPT_preadx0_dynexp.dats] *)
