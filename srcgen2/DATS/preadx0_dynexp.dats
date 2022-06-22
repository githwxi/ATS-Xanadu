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
max
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
max
(errvl(de1)
,errvl(de2),errvl(de3))
#symload
d0exp_errvl with d0exp_errvl_a3
#symload errvl with d0exp_errvl_a3
(* ****** ****** *)
//
#extern
fun
d0exp_errvl_des
(des: d0explst): sint
#symload
d0exp_errvl with d0exp_errvl_des
#symload errvl with d0exp_errvl_des
//
#implfun
d0exp_errvl_des(des) =
(
case+ des of
|
list_nil
((*nil*)) => 0
|
list_cons
(de1,des) => max(errvl(de1),errvl(des)))
//
(* ****** ****** *)
//
#extern
fun
d0exp_errvl_drp
(drp: d0exp_RPAREN): sint
#symload errvl with d0exp_errvl_drp
//
#implfun
d0exp_errvl_drp
(     drp     ) =
(
case+ drp of
|
d0exp_RPAREN_cons0(tok) => 0
|
d0exp_RPAREN_cons1(tkb,des,tke) => errvl(des)
)
//
(* ****** ****** *)
fun
l0d0e_errvl
(lde: l0d0e): sint =
(
  d0exp_errvl(d0e)) where
{
  val+
  D0LAB(lab, tok, d0e) = lde
}
#symload errvl with l0d0e_errvl
(* ****** ****** *)
//
#extern
fun
l0d0e_errvl_ldes
(ldes: l0d0elst): sint
#symload errvl with l0d0e_errvl_ldes
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
(lde1,ldes) => max(errvl(lde1),errvl(ldes)))
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
#symload errvl with l0d0e_errvl_ldrb
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
d0exp_errck(lvl+1, d0exp(loc,D0Eapps(des)))
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
val lvl = max(errvl(des),errvl(drp))
in//let
d0exp_errck
(lvl+1, d0exp(loc,D0Elpar(tkb,des,drp)))
end (*let*) // end of [d0exp_lpar_errck]
//
(* ****** ****** *)

#implfun
preadx0_d0exp(d0e, err) =
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
D0Eapps _ => f0_apps(d0e, err)
//
|
D0Elpar _ => f0_lpar(d0e, err)
//
|
D0Etkerr _ =>
(err := err+1; d0exp_errck(1, d0e))
//
|
D0Eerrck _ =>
(err := err+1; d0exp_errck(1, d0e))
) where // end-of(case(d0e.node()))
{
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
(err = e00)
then d0e else d0exp_apps_errck(d0e.lctn(), des)
end (*let*) // end of [f0_apps]
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
(err = e00)
then d0e else
d0exp_lpar_errck(d0e.lctn(),tkb,des,drp)
end (*let*) // end of [f0_lpar]
//
(* ****** ****** *)

} (*where*) // end-of-[preadx0_d0exp(d0e,err)]

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
  else d0exp_RPAREN_cons1(tbar, d0es, tend)
)
|
_(*non-T_RPAREN*) =>
(err := err+1; d0exp_RPAREN_cons1(tbar, d0es, tend))
//
endlet // end of [d0exp_RPAREN_cons1]
) (*case*) // end of [preadx0_d0exp_RPAREN]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_preadx0_dynexp.dats] *)
