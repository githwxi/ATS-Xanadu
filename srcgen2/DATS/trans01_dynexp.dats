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
Tue Jul 26 12:37:25 EDT 2022
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
_(*XFIXITY*) = "./xfixity.dats"
#staload
_(*TRANS01*) = "./trans01.dats"
(* ****** ****** *)
#staload "./../SATS/xlabel0.sats"
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
#sexpdef fxitm = fxitm
(* ****** ****** *)
#typedef d1pfx = fxitm(d1pat)
#typedef d1efx = fxitm(d1exp)
#typedef d1pfxlst = list(d1pfx)
#typedef d1efxlst = list(d1efx)
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with l0abl_get_lctn
#symload node with l0abl_get_node
(* ****** ****** *)
#symload lctn with d0pat_get_lctn
#symload node with d0pat_get_node
#symload lctn with d0exp_get_lctn
#symload node with d0exp_get_node
(* ****** ****** *)
#symload lctn with f0arg_get_lctn
#symload node with f0arg_get_node
(* ****** ****** *)
#symload lctn with d0gua_get_lctn
#symload node with d0gua_get_node
#symload lctn with d0gpt_get_lctn
#symload node with d0gpt_get_node
#symload lctn with d0cls_get_lctn
#symload node with d0cls_get_node
(* ****** ****** *)
#symload lctn with t1qua_get_lctn
#symload lctn with t1inv_get_lctn
(* ****** ****** *)
#symload trans01 with trans01_d0pat
#symload trans01 with trans01_d0exp
(* ****** ****** *)

fun
fxitmlst_resolve_d1pat
( loc0: loc_t
, itms: d1pfxlst): d1pat =
let
//
#impltmp
fxitm_infix0<d1pat>
  (x0, f1, x2) =
let
val loc0 =
x0.lctn() + x2.lctn()
val d1pn =
(
  case+
  f1.node() of
  | D1Pa0pp() =>
    D1Pa1pp(x0, x2)
  | _(*non-D1Papp*) =>
    D1Pa2pp(f1, x0, x2)
) : d1pat_node // end of [val]
in
  FXITMatm(d1pat(loc0, d1pn))
end // end of [$FIX.fxitm_infix0]
//
#impltmp
fxitm_prefix<d1pat>
  (f0, x1) = let
//
val loc0 =
f0.lctn() + x1.lctn()
//
in//let
//
case+
f0.node() of
|
D1Pb0sh() => let
  val d1p =
  d1pat_make_node
  (loc0, D1Pb1sh(x1))
in
  FXITMopr(d1p, inftmp_fixty)
end // end of [D1Pbs0]
|
_(*non-D1Pb0sh*) =>
FXITMatm
(d1pat(loc0, D1Pa1pp(f0, x1)))
//
end // end of [$FIX.fxitm_prefix]
//
#impltmp
fxitm_pstfix<d1pat>
  (x0, f1) = let
  val loc0 =
  x0.lctn() + f1.lctn()
in
  FXITMatm
  (d1pat(loc0, D1Pa1pp(f1, x0)))
end // end of [$FIX.fxitm_pstfix]
//
#impltmp
fxatm_none<d1pat>
  (loc) =
  d1pat_none0(loc)
#impltmp
fxopr_get_lctn<d1pat>
  (opr) = opr.lctn()
//
#impltmp
fxitm_get_lctn<d1pat>
  (itm) =
(
case+ itm of
| FXITMatm(x0) => x0.lctn()
| FXITMopr(x0, _) => x0.lctn()
) (* end of [$FIX.fxitm_get_lctn] *)
//
#impltmp
fxitmlst_resolve$appopr<d1pat>
  (itm) = let
//
val d1p1 =
d1pat
(loc0, D1Pa0pp(*void*)) where
{
val loc0 =
$FIX.fxitm_get_lctn<d1pat>(itm)
}
//
in//let
  $FIX.FXITMopr(d1p1, app_fixty)
end // end of [$FIX.fxitmlst_resolve$appopr]
//
in//let
  fxitmlst_resolve<d1pat>(loc0, itms)
end (*let*) // end of [fxitmlst_resolve_d1pat]

(* ****** ****** *)

fun
fxitmlst_resolve_d1exp
( loc0: loc_t
, itms: d1efxlst): d1exp =
let
//
#impltmp
fxitm_infix0<d1exp>
  (x0, f1, x2) =
let
val loc0 =
x0.lctn() + x2.lctn()
val d1en =
(
  case+
  f1.node() of
  | D1Ea0pp() =>
    D1Ea1pp(x0, x2)
  | _(*non-D1Eapp*) =>
    D1Ea2pp(f1, x0, x2)
) : d1exp_node // end of [val]
in
  FXITMatm(d1exp(loc0, d1en))
end // end of [$FIX.fxitm_infix0]
//
#impltmp
fxitm_prefix<d1exp>
  (f0, x1) = let
//
val loc0 =
f0.lctn() + x1.lctn()
//
in//let
//
case+
f0.node() of
|
D1Eb0sh() => let
  val d1e =
  d1exp_make_node
  (loc0, D1Eb1sh(x1))
in
  FXITMopr(d1e, inftmp_fixty)
end // end of [D1Ebs0]
|
_(*non-D1Eb0sh*) =>
FXITMatm
(d1exp(loc0, D1Ea1pp(f0, x1)))
//
end // end of [$FIX.fxitm_prefix]
//
#impltmp
fxitm_pstfix<d1exp>
  (x0, f1) = let
  val loc0 =
  x0.lctn() + f1.lctn()
in
  FXITMatm
  (d1exp(loc0, D1Ea1pp(f1, x0)))
end // end of [$FIX.fxitm_pstfix]
//
#impltmp
fxatm_none<d1exp>
  (loc) =
  d1exp_none0(loc)
#impltmp
fxopr_get_lctn<d1exp>
  (opr) = opr.lctn()
//
#impltmp
fxitm_get_lctn<d1exp>
  (itm) =
(
case+ itm of
| FXITMatm(x0) => x0.lctn()
| FXITMopr(x0, _) => x0.lctn()
) (* end of [$FIX.fxitm_get_lctn] *)
//
#impltmp
fxitmlst_resolve$appopr<d1exp>
  (itm) = let
//
val d1e1 =
d1exp
(loc0, D1Ea0pp(*void*)) where
{
val loc0 =
$FIX.fxitm_get_lctn<d1exp>(itm)
}
//
in//let
  $FIX.FXITMopr(d1e1, app_fixty)
end // end of [$FIX.fxitmlst_resolve$appopr]
//
in//let
  fxitmlst_resolve<d1exp>(loc0, itms)
end (*let*) // end of [fxitmlst_resolve_d1exp]

(* ****** ****** *)
#symload
fxis_resolve
with fxitmlst_resolve_d1pat
#symload
fxis_resolve
with fxitmlst_resolve_d1exp
(* ****** ****** *)

#implfun
trans01_d0pat
(tenv, d0p0) = let
//
val loc0 = d0p0.lctn()
//
(* ****** ****** *)
(*
val () =
prerrln
("trans01_d0pat: loc0 = ", loc0)
val () =
prerrln
("trans01_d0pat: d0p0 = ", d0p0)
*)
(* ****** ****** *)
val
dfx0 =
f0_dpat(tenv, d0p0)
in//let
case+ dfx0 of
| FXITMatm(d1p0) => d1p0
| FXITMopr(d1p0, fxty) => d1p0
end where // end of [val(dfx0)]
{
//
fun
f0_dpat
( tenv:
! tr01env
, d0p0: d0pat): d1pfx =
(
case+
d0p0.node() of
//
|
D0Pid0 _ => f0_id0(tenv, d0p0)
|
D0Pint _ => f0_int(tenv, d0p0)
|
D0Pchr _ => f0_chr(tenv, d0p0)
|
D0Pflt _ => f0_flt(tenv, d0p0)
|
D0Pstr _ => f0_str(tenv, d0p0)
//
|
D0Papps(d0ps) =>
FXITMatm(d1p0) where
{
//
val loc0 = d0p0.lctn()
//
val d1ps =
f0_d0ps(tenv, d0ps)
val d1p0 =
fxis_resolve(loc0, d1ps)
}
//
|
D0Psarg _ => f0_sarg(tenv, d0p0)
//
|
D0Plpar _ => f0_lpar(tenv, d0p0)
//
|
D0Ptup1 _ => f0_tup1(tenv, d0p0)
|
D0Prcd2 _ => f0_rcd2(tenv, d0p0)
//
|
D0Pannot(d0p1, s0e2) =>
let
val d1p1 =
  trans01_d0pat(tenv, d0p1)
val s1e2 =
  trans01_s0exp(tenv, s0e2)
in // let
//
FXITMatm(d1p0) where
{
val d1p0 = d1pat_make_node
(d0p0.lctn(), D1Pannot(d1p1, s1e2)) }
//
end (*let*)//end of [D0Pannot(d0p1,s0e2)]
//
|
D0Pqual0
(tok1, d0p2) =>
let
val d1p2 = 
  trans01_d0pat(tenv, d0p2)
in // let
FXITMatm
(d1pat(d0p0.lctn(),D1Pqual0(tok1,d1p2)))
end (*let*)//end of [D0Pqual0(tok1,d0p2)]
//
|
_(*otherwise*) =>
let
val d1p0 =
d1pat_none1(d0p0) in FXITMatm(d1p0) end
//
) (*case+*)//end-of-[f0_dpat(tenv,d0p0)]
//
(* ****** ****** *)
//
and
f0_id0
( tenv:
! tr01env
, d0p0: d0pat): d1pfx =
let
//
val
loc0 = d0p0.lctn()
val
D0Pid0
( deid ) = d0p0.node()
val
tok0 =
trans01_i0dnt(tenv, deid)
//
in//let
//
case-
tok0.node() of
|
T_IDALP(nam1) =>
f0_id0_1(tenv, tok0, nam1)
|
T_IDSYM(nam1) =>
f0_id0_1(tenv, tok0, nam1)
|
T_IDDLR(nam1) =>
f0_id0_1(tenv, tok0, nam1)
//
|
T_BSLSH
((*nil*)) => f0_id0_2(tenv, tok0)
//
end // end of [f0_id0(tenv,s0e0)]
//
and
f0_id0_1
( tenv:
! tr01env
, tok0: token
, nam1: string): d1pfx =
let
//
val loc0 = tok0.lctn()
val sym1 = symbl(nam1)
val d1p0 =
d1pat(loc0, D1Pid0(sym1))
val fopt =
tr01env_search_opt(tenv, sym1)
//
in
case+ fopt of
| ~
optn_vt_nil() => FXITMatm(d1p0)
| ~
optn_vt_cons(fxty) =>
(
case+ fxty of
|
FIXTYnon() => FXITMatm(d1p0)
|
_(*otherwise*) => FXITMopr(d1p0, fxty)
) (* end of [optn_vt_cons(fxty)] *)
end (*let*) // end of [f0_id0_1(_,_,_)]
//
and
f0_id0_2
( tenv:
! tr01env
, tok0: token): d1pfx =
(
FXITMopr
(d1p0, bslash_fixty)) where
{
val loc0 = tok0.lctn()
val d1p0 =
d1pat_make_node(loc0, D1Pb0sh())
} (*where*) // end of [ f0_id0_2(_,_) ]
//
(* ****** ****** *)
//
and
f0_int
( tenv:
! tr01env
, d0p0: d0pat): d1pfx =
let
val
loc0 = d0p0.lctn()
val-
D0Pint
( int ) = d0p0.node() in
FXITMatm
(
d1pat
( loc0
, D1Pint(trans01_t0int(tenv, int))))
end // end of [let] // end of [f0_int]
//
(* ****** ****** *)
//
and
f0_chr
( tenv:
! tr01env
, d0p0: d0pat): d1pfx =
let
val
loc0 = d0p0.lctn()
val-
D0Pchr
( chr ) = d0p0.node() in
FXITMatm
(
d1pat
( loc0
, D1Pchr(trans01_t0chr(tenv, chr))))
end // end of [let] // end of [f0_chr]
//
(* ****** ****** *)
//
and
f0_flt
( tenv:
! tr01env
, d0p0: d0pat): d1pfx =
let
val
loc0 = d0p0.lctn()
val-
D0Pflt
( flt ) = d0p0.node() in
FXITMatm
(
d1pat
( loc0
, D1Pflt(trans01_t0flt(tenv, flt))))
end // end of [let] // end of [f0_flt]
//
(* ****** ****** *)
//
and
f0_str
( tenv:
! tr01env
, d0p0: d0pat): d1pfx =
let
val
loc0 = d0p0.lctn()
val-
D0Pstr
( str ) = d0p0.node() in
FXITMatm
(
d1pat
( loc0
, D1Pstr(trans01_t0str(tenv, str))))
end // end of [let] // end of [f0_str]
//
(* ****** ****** *)

and
f0_sarg
( tenv:
! tr01env
, d0p0: d0pat): d1pfx =
let
//
val
loc0 = d0p0.lctn()
val-
D0Psarg
(tbeg
,s0as,tend) = d0p0.node()
//
in//let
FXITMatm
(
d1pat
(loc0,D1Psarg(s1as))) where
{
val s1as =
trans01_s0arglst(tenv, s0as)
}
endlet // end of [ D0Psarg(_,_,_) ]

(* ****** ****** *)

and
f0_lpar
( tenv:
! tr01env
, d0p0: d0pat): d1pfx =
let
//
val
loc0 = d0p0.lctn()
val-
D0Plpar
(tbeg
,dps1,tend) = d0p0.node()
//
in//let
//
case+ tend of
|
d0pat_RPAREN_cons0
(      tok       ) =>
FXITMatm
(
d1pat
(loc0, D1Pl1st(dps1))) where
{
val dps1 =
  trans01_d0patlst(tenv, dps1)
}
|
d0pat_RPAREN_cons1
(tbeg, dps2, tend) =>
FXITMatm
(
d1pat
( loc0
, D1Pl2st(dps1, dps2))) where
{
val dps1 =
  trans01_d0patlst(tenv, dps1)
val dps2 =
  trans01_d0patlst(tenv, dps2)
}
//
endlet // end of [ D0Plpar(_,_,_) ]

(* ****** ****** *)

and
f0_tup1
( tenv:
! tr01env
, d0p0: d0pat): d1pfx =
let
//
val
loc0 = d0p0.lctn()
val-
D0Ptup1
(tknd
,topt
,dps1,tend) = d0p0.node()
//
in//let
//
case+ tend of
|
d0pat_RPAREN_cons0
(      tok       ) =>
FXITMatm
(
d1pat
( loc0
, D1Pt1up(tknd,dps1))) where
{
val dps1 =
  trans01_d0patlst(tenv, dps1)
}
|
d0pat_RPAREN_cons1
(tbeg, dps2, tend) =>
FXITMatm
(
d1pat
( loc0
, D1Pt2up
  (tknd, dps1, dps2))) where
{
val dps1 =
  trans01_d0patlst(tenv, dps1)
val dps2 =
  trans01_d0patlst(tenv, dps2)
}
//
endlet // end of [D0Ptup1(_,_,_,_)]
//
(* ****** ****** *)

and
f0_rcd2
( tenv:
! tr01env
, d0p0: d0pat): d1pfx =
let
//
val
loc0 = d0p0.lctn()
//
val-
D0Prcd2
(tknd
,topt
,lss1,tend) = d0p0.node()
//
in//let
//
case+ tend of
|
l0d0p_RBRACE_cons0
(      tok       ) =>
FXITMatm
(
d1pat
( loc0
, D1Pr1cd(tknd,lss1))) where
{
val lss1 =
  trans01_l0d0plst(tenv, lss1)
}
|
l0d0p_RBRACE_cons1
(tbeg, lss2, tend) =>
FXITMatm
(
d1pat
( loc0
, D1Pr2cd
  (tknd, lss1, lss2))) where
{
val lss1 =
  trans01_l0d0plst(tenv, lss1)
val lss2 =
  trans01_l0d0plst(tenv, lss2)
}
//
endlet // end of [D0Prcd2(_,_,_,_)]

(* ****** ****** *)
//
and
f0_d0ps
( tenv:
! tr01env
, d0ps: d0patlst): d1pfxlst =
(
  list_trans01_fnp(tenv, d0ps, f0_dpat)
)
//
(* ****** ****** *)

} (*where*)//end-of[trans01_d0pat(tenv,d0p0)]

(* ****** ****** *)

#implfun
trans01_d0exp
(tenv, d0e0) = let
//
val loc0 = d0e0.lctn()
//
(* ****** ****** *)
//
(*
val () =
prerrln
("trans01_d0exp: loc0 = ", loc0)
val () =
prerrln
("trans01_d0exp: d0e0 = ", d0e0)
*)
//
(* ****** ****** *)
val
dfx0 =
f0_dexp(tenv, d0e0)
in//let
case+ dfx0 of
| FXITMatm(d1e0) => d1e0
| FXITMopr(d1e0, fxty) => d1e0
end where // end of [val(dfx0)]
{
//
fun
f0_dexp
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
(
case+
d0e0.node() of
//
|
D0Eid0 _ => f0_id0(tenv, d0e0)
|
D0Eint _ => f0_int(tenv, d0e0)
|
D0Echr _ => f0_chr(tenv, d0e0)
|
D0Eflt _ => f0_flt(tenv, d0e0)
|
D0Estr _ => f0_str(tenv, d0e0)
//
|
D0Eapps(d0es) =>
FXITMatm(d1e0) where
{
//
val
loc0 = d0e0.lctn()
//
val d1es =
f0_d0es(tenv, d0es)
val d1e0 =
fxis_resolve(loc0, d1es)
}
//
|
D0Esarg _ => f0_sarg(tenv, d0e0)
|
D0Etarg _ => f0_targ(tenv, d0e0)
//
|
D0Elpar _ => f0_lpar(tenv, d0e0)
//
|D0Eift0 _ => f0_ift0(tenv, d0e0)
|D0Eift1 _ => f0_ift1(tenv, d0e0)
//
|D0Ecas0 _ => f0_cas0(tenv, d0e0)
|D0Ecas1 _ => f0_cas1(tenv, d0e0)
//
|D0Etup1 _ => f0_tup1(tenv, d0e0)
|D0Ercd2 _ => f0_rcd2(tenv, d0e0)
//
|
D0Ebrckt
(tbeg,d0es,tend) =>
let
val loc0 = d0e0.lctn()
val d1es =
trans01_d0explst(tenv, d0es)
in // let
FXITMopr(d1e0, brckt_fixty) where
{ val
  d1e0 = d1exp(loc0, D1Ebrckt(d1es)) }
end (*let*) // end of [D0Ebrckt(_,_,_)]
//
|
D0Edtsel
(tknd, l0ab, dopt) =>
let
//
val loc0 = d0e0.lctn()
//
val lab1 =
(
case+
l0ab.node() of
|
L0ABLsome(lab1) => lab1
|
L0ABLnone(tok1) => label_none()
) : label // end of [val(lab1)]
//
val dopt =
(
  trans01_d0expopt(tenv, dopt))
//
in // let // HX: postfix
FXITMopr(d1e0, dtsel_fixty) where
{
val d1e0 =
d1exp(loc0,D1Edtsel(tknd,lab1,dopt)) }
end (*let*) // end of [D0Edtsel(_,_,_)]
//
|
D0Elet0
(tknd
,d0cs,topt
,d0es,tend) =>
let
//
val
loc0 = d0e0.lctn()
//
val (  ) =
tr01env_pshlet0(tenv)
//
val d1cs =
trans01_d0eclist(tenv, d0cs)
//
val loc1 =
(
case+ topt of
|
optn_nil() => tend.lctn()
|
optn_cons(tkin) =>
(tkin.lctn() + tend.lctn())
) : loc_t // end of [val loc1]
//
val d1e1 =
d1exp_make_node
(loc1, D1Es1eq(d1es)) where
{
  val d1es =
  trans01_d0expseq(tenv, d0es) }
//
val (  ) = tr01env_poplet0(tenv)
//
in//let
FXITMatm
(d1exp(loc0, D1Elet0(d1cs, d1e1)))
end (*let*)//end-of(f0_let0(tenv,d0e0))
|
D0Ewhere
(d0e1,d0cs) =>
let
//
val
loc0 = d0e0.lctn()
//
val (  ) =
tr01env_pshlet0(tenv)
//
val d1cs =
(
case+ d0cs of
|
d0eclseq_WHERE
(twhr
,topt,d0cs,tend) =>
trans01_d0eclist(tenv,d0cs)
) : d1eclist//end(val(d1cs))
val
d1e1 =
trans01_d0exp( tenv, d0e1 )
//
val (  ) = tr01env_poplet0(tenv)
//
in//let
FXITMatm
(d1exp(loc0, D1Ewhere(d1e1, d1cs)))
end (*let*)//end(f0_where(tenv,d0e0))
//
|
D0Elam0 _ => f0_lam0(tenv, d0e0)
|
D0Efix0 _ => f0_fix0(tenv, d0e0)
//
|
D0Etry0 _ => f0_try0(tenv, d0e0)
//
|
D0Eraise
(tknd, d0e1) =>
let
val d1e1 =
  trans01_d0exp(tenv, d0e1)
in // let
//
FXITMatm(d1e0) where
{ val d1e0 = d1exp_make_node
  (d0e0.lctn(), D1Eraise(tknd, d1e1)) }
//
end (*let*)//end of [D0Eraise(tknd,d0e1)]
//
|
D0Eannot
(d0e1, s0e2) =>
let
val d1e1 =
  trans01_d0exp(tenv, d0e1)
val s1e2 =
  trans01_s0exp(tenv, s0e2)
in // let
//
FXITMatm(d1e0) where
{ val d1e0 = d1exp_make_node
  (d0e0.lctn(), D1Eannot(d1e1, s1e2)) }
//
end (*let*)//end of [D0Eannot(d0e1,s0e2)]
//
|
D0Equal0
(tok1, d0e2) =>
let
val d1e2 = 
  trans01_d0exp(tenv, d0e2)
in // let
FXITMatm
(d1exp(d0e0.lctn(),D1Equal0(tok1,d1e2)))
end (*let*)//end of [D0Equal0(tok1,d0e2)]
//
|
D0Eextnam
(tknd, gnam) =>
let
//
val loc0 = d0e0.lctn()
//
val
gnam = trans01_g0nam(tenv, gnam)
in // let
FXITMatm
(d1exp(loc0, D1Eextnam(tknd, gnam)))
end (*let*)//end-of(D0Eextnam(tknd,gnam))
|
D0Eexists
(tknd,d0es,d0e1) =>
let
//
val loc0 = d0e0.lctn()
//
val
d1es =
trans01_d0explst(tenv, d0es)
val
d1e1 = trans01_d0exp(tenv, d0e1)
//
in // let
FXITMatm
(d1exp(loc0, D1Eexists(tknd,d1es,d1e1)))
endlet//end-of-[D0Eexists(tknd,d0es,d0e1)]
//
|
D0Esynext
(tknd, dexp) =>
let
//
val loc0 = d0e0.lctn()
//
val
dexp = trans01_d0exp(tenv, dexp)
in // let
FXITMatm
(d1exp(loc0, D1Esynext(tknd, dexp)))
end (*let*)//end-of(D0Esynext(tknd,dexp))
//
|
_(* otherwise *) =>
let
val
d1e0 = d1exp_none1(d0e0) in FXITMatm(d1e0)
endlet // end of [ _(*otherwise*) ]
//
) (*case+*) // end of [f0_dexp(tenv,d0e0)]
//
(* ****** ****** *)
//
and
f0_id0
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
//
val
loc0 = d0e0.lctn()
val
D0Eid0
( deid ) = d0e0.node()
val
tok0 =
trans01_i0dnt(tenv, deid)
//
in//let
//
case-
tok0.node() of
|
T_IDALP(nam1) =>
f0_id0_1(tenv, tok0, nam1)
|
T_IDSYM(nam1) =>
f0_id0_1(tenv, tok0, nam1)
|
T_IDDLR(nam1) =>
f0_id0_1(tenv, tok0, nam1)
//
|
T_BSLSH
((*nil*)) => f0_id0_2(tenv, tok0)
//
end // end of [f0_id0(tenv,s0e0)]
//
and
f0_id0_1
( tenv:
! tr01env
, tok0: token
, nam1: string): d1efx =
let
//
val loc0 = tok0.lctn()
val sym1 = symbl(nam1)
val d1e0 =
d1exp(loc0, D1Eid0(sym1))
val fopt =
tr01env_search_opt(tenv, sym1)
//
in
case+ fopt of
| ~
optn_vt_nil() => FXITMatm(d1e0)
| ~
optn_vt_cons(fxty) =>
(
case+ fxty of
|
FIXTYnon() => FXITMatm(d1e0)
|
_(*otherwise*) => FXITMopr(d1e0, fxty)
) (* end of [optn_vt_cons(fxty)] *)
end (*let*) // end of [f0_id0_1(_,_,_)]
//
and
f0_id0_2
( tenv:
! tr01env
, tok0: token): d1efx =
(
FXITMopr
(d1e0, bslash_fixty)) where
{
val loc0 = tok0.lctn()
val d1e0 =
d1exp_make_node(loc0, D1Eb0sh())
} (*where*) // end of [ f0_id0_2(_,_) ]
//
(* ****** ****** *)
//
and
f0_int
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
val
loc0 = d0e0.lctn()
val-
D0Eint
( int ) = d0e0.node() in
FXITMatm
(
d1exp
( loc0
, D1Eint(trans01_t0int(tenv, int))))
end // end of [let] // end of [f0_int]
//
(* ****** ****** *)
//
and
f0_chr
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
val
loc0 = d0e0.lctn()
val-
D0Echr
( chr ) = d0e0.node() in
FXITMatm
(
d1exp
( loc0
, D1Echr(trans01_t0chr(tenv, chr))))
end // end of [let] // end of [f0_chr]
//
(* ****** ****** *)
//
and
f0_flt
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
val
loc0 = d0e0.lctn()
val-
D0Eflt
( flt ) = d0e0.node() in
FXITMatm
(
d1exp
( loc0
, D1Eflt(trans01_t0flt(tenv, flt))))
end // end of [let] // end of [f0_flt]
//
(* ****** ****** *)
//
and
f0_str
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
val
loc0 = d0e0.lctn()
val-
D0Estr
( str ) = d0e0.node() in
FXITMatm
(
d1exp
( loc0
, D1Estr(trans01_t0str(tenv, str))))
end // end of [let] // end of [f0_str]
//
(* ****** ****** *)

and
f0_sarg
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
//
val
loc0 = d0e0.lctn()
val-
D0Esarg
(tbeg
,s0es,tend) = d0e0.node()
//
in//let
FXITMatm
(
d1exp
(loc0,D1Esarg(s1es))) where
{
val s1es =
trans01_s0explst(tenv, s0es)
}
endlet // end of [ D0Esarg(_,_,_) ]

(* ****** ****** *)

and
f0_targ
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
//
val
loc0 = d0e0.lctn()
val-
D0Etarg
(tbeg
,s0es,tend) = d0e0.node()
//
in//let
FXITMatm
(
d1exp
(loc0,D1Etarg(s1es))) where
{
val s1es =
trans01_s0explst(tenv, s0es)
}
endlet // end of [ D0Etarg(_,_,_) ]

(* ****** ****** *)

and
f0_lpar
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
//
val
loc0 = d0e0.lctn()
val-
D0Elpar
(tbeg
,des1,tend) = d0e0.node()
//
in//let
//
case+ tend of
|
d0exp_RPAREN_cons0
(      tok       ) =>
FXITMatm
(
d1exp
(loc0, D1El1st(des1))) where
{
val des1 =
  trans01_d0explst(tenv, des1)
}
|
d0exp_RPAREN_cons1
(tbeg, des2, tend) =>
FXITMatm
(
d1exp
( loc0
, D1El2st(des1, des2))) where
{
val des1 =
  trans01_d0explst(tenv, des1)
val des2 =
  trans01_d0explst(tenv, des2)
}
|
d0exp_RPAREN_cons2
(tbeg, des2, tend) =>
FXITMatm
(
d1exp
( loc0
, D1Es2eq(des1, des2))) where
{
val des1 =
  trans01_d0explst(tenv, des1)
val des2 =
  trans01_d0explst(tenv, des2)
}
//
endlet // end of [ D0Elpar(_,_,_) ]

(* ****** ****** *)

and
f0_ift0
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
//
val
loc0 = d0e0.lctn()
//
val-
D0Eift0
(tift
,d0e1
,dthn,dels) = d0e0.node()
//
val d1e1 =
trans01_d0exp(tenv, d0e1)
val dthn =
trans01_d0exp_THEN(tenv, dthn)
val dels =
trans01_d0exp_ELSE(tenv, dels)
//
in//let
FXITMatm(d1e0) where
{
val d1e0 = d1exp
(loc0, D1Eift0(d1e1, dthn, dels)) }
//
end (*let*)//end-of(f0_ift0(tenv,d0e0))

(* ****** ****** *)

and
f0_ift1
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
//
val
loc0 = d0e0.lctn()
//
val-
D0Eift1
(tift
,d0e1,dthn
,dels,tinv) = d0e0.node()
//
val d1e1 =
trans01_d0exp(tenv, d0e1)
val dthn =
trans01_d0exp_THEN(tenv, dthn)
val dels =
trans01_d0exp_ELSE(tenv, dels)
//
val tinv = trans01_t0inv(tenv, tinv)
//
in//let
FXITMatm(d1e0) where
{
val d1e0 = d1exp
(loc0, D1Eift1(d1e1,dthn,dels,tinv)) }
//
end (*let*)//end-of(f0_ift1(tenv,d0e0))

(* ****** ****** *)

and
f0_cas0
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
//
val loc0 = d0e0.lctn()
//
val-
D0Ecas0
(tknd
,d0e1,tkof
,tbar,d0cs) = d0e0.node()
//
val d1e1 =
trans01_d0exp(tenv, d0e1)
val d1cs =
trans01_d0clslst(tenv, d0cs)
//
in
FXITMatm(d1e0) where
{
val d1e0 = d1exp
(loc0, D1Ecas0(tknd, d1e1, d1cs)) }
end (*let*) // end of [f0_cas0(tenv,d0e0)]

(* ****** ****** *)

and
f0_cas1
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
//
val loc0 = d0e0.lctn()
//
val-
D0Ecas1
(tknd
,d0e1
,tkof,tbar
,d0cs,tinv) = d0e0.node()
//
val d1e1 =
trans01_d0exp(tenv, d0e1)
val d1cs =
trans01_d0clslst(tenv, d0cs)
//
val tinv = trans01_t0inv(tenv, tinv)
//
in//let
FXITMatm(d1e0) where
{
val d1e0 = d1exp
(loc0, D1Ecas1(tknd,d1e1,d1cs,tinv)) }
end (*let*) // end of [f0_cas1(tenv,d0e0)]

(* ****** ****** *)
//
and
f0_tup1
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
//
val
loc0 = d0e0.lctn()
val-
D0Etup1
(tknd
,topt
,dps1,tend) = d0e0.node()
//
in//let
//
case+ tend of
|
d0exp_RPAREN_cons0
(      tok       ) =>
FXITMatm
(
d1exp
( loc0
, D1Et1up(tknd,dps1))) where
{
val dps1 =
  trans01_d0explst(tenv, dps1)
}
|
d0exp_RPAREN_cons1
(tbeg, dps2, tend) =>
FXITMatm
(
d1exp
( loc0
, D1Et2up
  (tknd, dps1, dps2))) where
{
val dps1 =
  trans01_d0explst(tenv, dps1)
val dps2 =
  trans01_d0explst(tenv, dps2)
}
//
endlet // end of [D0Etup1(_,_,_,_)]
//
(* ****** ****** *)
//
and
f0_rcd2
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
//
val
loc0 = d0e0.lctn()
//
val-
D0Ercd2
(tknd
,topt
,lss1,tend) = d0e0.node()
//
in//let
//
case+ tend of
|
l0d0e_RBRACE_cons0
(      tok       ) =>
FXITMatm
(
d1exp
( loc0
, D1Er1cd(tknd,lss1))) where
{
val lss1 =
  trans01_l0d0elst(tenv, lss1)
}
|
l0d0e_RBRACE_cons1
(tbeg, lss2, tend) =>
FXITMatm
(
d1exp
( loc0
, D1Er2cd
  (tknd, lss1, lss2))) where
{
val lss1 =
  trans01_l0d0elst(tenv, lss1)
val lss2 =
  trans01_l0d0elst(tenv, lss2)
}
//
endlet // end of [D0Ercd2(_,_,_,_)]
//
(* ****** ****** *)

and
f0_lam0
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
//
val loc0 = d0e0.lctn()
//
val-
D0Elam0
(tknd
,f0as
,sres,arrw
,body,topt) = d0e0.node()
//
val
f1as =
trans01_f0arglst(tenv, f0as)
//
val
sres =
trans01_s0res(tenv, sres)
val
arrw =
trans01_f0unarrw(tenv, arrw)
//
val
body = trans01_d0exp(tenv, body)
//
in//let
FXITMatm(d1e0) where
{
val d1e0 = d1exp
( loc0
, D1Elam0(tknd,f1as,sres,arrw,body)) }
end (*let*)//end-of(f0_lam0(tenv,d0e0))

(* ****** ****** *)

and
f0_fix0
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
//
val loc0 = d0e0.lctn()
//
val-
D0Efix0
(tknd
,deid,f0as
,sres,arrw
,body,topt) = d0e0.node()
//
val
deid =
trans01_i0dnt(tenv, deid)
val
f1as =
trans01_f0arglst(tenv, f0as)
//
val
sres =
trans01_s0res(tenv, sres)
val
arrw =
trans01_f0unarrw(tenv, arrw)
//
val
body = trans01_d0exp(tenv, body)
//
in//let
FXITMatm(d1e0) where
{
val d1e0 = d1exp
(
loc0,
D1Efix0
(tknd, deid, f1as, sres, arrw, body)) }
end (*let*)//end-of(f0_fix0(tenv,d0e0))

(* ****** ****** *)

and
f0_try0
( tenv:
! tr01env
, d0e0: d0exp): d1efx =
let
//
val loc0 = d0e0.lctn()
//
val-
D0Etry0
(tknd
,d0es
,twth,tbar
,d0cs,tend) = d0e0.node()
//
val
d1e1 =
d1exp
(loc1, D1Es1eq(d1es)) where
{
val loc1 =
(tknd.lctn() + twth.lctn())
val d1es =
trans01_d0explst(tenv, d0es)
}
//
val d1cs =
trans01_d0clslst(tenv, d0cs)
//
in//let
FXITMatm(d1e0) where
{
val d1e0 = d1exp
(loc0,D1Etry0(tknd,d1e1,d1cs)) }
end (*let*)//end-of(f0_try0(tenv,d0e0))

(* ****** ****** *)
//
and
f0_d0es
( tenv:
! tr01env
, d0es: d0explst): d1efxlst =
(
  list_trans01_fnp(tenv, d0es, f0_dexp)
)
//
(* ****** ****** *)

} (*where*)//end-of[trans01_d0exp(tenv,d0e0)]

(* ****** ****** *)
//
#implfun
trans01_l0d0e
( tenv, ld0e ) =
let
//
val+
D0LAB
( l0ab
, teq1, d0e1) = ld0e
//
val lab0 =
(
case+
l0ab.node() of
|
L0ABLsome(lab1) => lab1
| // HX:error
L0ABLnone(tok1) => label_none())
//
in//let
D1LAB(lab0, trans01_d0exp(tenv, d0e1))
end (*let*)//end-of[trans01_l0d0e(tenv,ld0e)]
//
(* ****** ****** *)

#implfun
trans01_f0arg
( tenv, f0a0 ) =
let
val
loc0 = f0a0.lctn()
in//let
case+
f0a0.node() of
|
F0ARGnone(tok) =>
let
val
loc = tok.lctn()
val
sym =
(
case+
T0IDALP_NONE of
|
T_IDALP
( nam ) => symbl(nam)): sym_t
in//let
f1arg
(loc0
,F1ARGdapp(d1pat(loc,D1Pid0(sym))))
end (*let*) // end of [F0ARGnone(tok)]
//
|
F0ARGdapp(d0p1) =>
let
val
d1p1 = trans01_d0pat(tenv, d0p1)
in//let
f1arg_make_node(loc0,F1ARGdapp(d1p1))
end (*let*) // end of [F0ARGdapp(d0p1)]
//
|
F0ARGsapp
(tbeg,s0qs,tend) =>
let
val
s1qs = trans01_s0qualst(tenv, s0qs)
in//let
f1arg_make_node(loc0,F1ARGsapp(s1qs))
end (*let*) // end of [F0ARGsapp(_,_,_)]
|
F0ARGmets
(tbeg,s0es,tend) =>
let
val
s1es = trans01_s0explst(tenv, s0es)
in//let
f1arg_make_node(loc0,F1ARGmets(s1es))
end (*let*) // end of [F0ARGmets(_,_,_)]
//
end (*let*) // end of [trans01_f0arg(tenv,f0a0)]

(* ****** ****** *)
//
#implfun
trans01_f0unarrw
  (tenv, arrw) =
(
case+ arrw of
|
F0UNARRWnone(tok) =>
F1UNARRWdflt(tok.lctn())
|
F0UNARRWdflt(tok) =>
F1UNARRWdflt(tok.lctn())
|
F0UNARRWlist(tbeg,s0es,tend) =>
(
F1UNARRWlist(loc0, s1es)) where
{
val loc0 = tbeg.lctn()+tend.lctn()
val s1es = trans01_s0explst(tenv, s0es) }
) (*case+*)//end-of(trans01_f0unarrw(tenv,arrw))
//
(* ****** ****** *)

#implfun
trans01_d0exp_THEN
  (tenv, dthn) =
(
case+ dthn of
|
d0exp_THEN_none
(     tok1     ) => optn_nil()
|
d0exp_THEN_some
(  tok1, d0e2  ) =>
optn_cons(trans01_d0exp(tenv, d0e2))
)
#implfun
trans01_d0exp_ELSE
  (tenv, dthn) =
(
case+ dthn of
|
d0exp_ELSE_none
(     tok1     ) => optn_nil()
|
d0exp_ELSE_some
(  tok1, d0e2  ) =>
optn_cons(trans01_d0exp(tenv, d0e2))
)

(* ****** ****** *)

#implfun
trans01_d0gua
  (tenv, d0g0) =
let
//
val loc0 = d0g0.lctn()
//
(*
val () =
prerrln
("trans01_d0gua: loc0 = ", loc0)
val () =
prerrln
("trans01_d0gua: d0g0 = ", d0g0)
*)
//
in//let
case+
d0g0.node() of
|
D0GUAexp(d0e1) =>
d1gua_make_node
(loc0, D1GUAexp(d1e1)) where
{
val
d1e1 = trans01_d0exp(tenv, d0e1) }
|
D0GUAmat(d0e1,tkas,d0p2) =>
d1gua_make_node
(loc0, D1GUAmat(d1e1, d1p2)) where
{
val d1e1 = trans01_d0exp(tenv, d0e1)
val d1p2 = trans01_d0pat(tenv, d0p2)
}
end (*let*) // end of [trans01_d0gua(d0g0)]

(* ****** ****** *)

#implfun
trans01_d0gua
  (tenv, d0g0) =
let
//
val loc0 = d0g0.lctn()
//
(*
val () =
prerrln
("trans01_d0gua: loc0 = ", loc0)
val () =
prerrln
("trans01_d0gua: d0g0 = ", d0g0)
*)
//
in//let
case+
d0g0.node() of
|
D0GUAexp(d0e1) =>
d1gua_make_node
(loc0, D1GUAexp(d1e1)) where
{
val
d1e1 = trans01_d0exp(tenv, d0e1) }
|
D0GUAmat(d0e1,tkas,d0p2) =>
d1gua_make_node
(loc0, D1GUAmat(d1e1, d1p2)) where
{
val d1e1 = trans01_d0exp(tenv, d0e1)
val d1p2 = trans01_d0pat(tenv, d0p2)
}
end (*let*) // end of [trans01_d0gua(d0g0)]

(* ****** ****** *)

#implfun
trans01_d0gpt
  (tenv, dgt0) =
let
//
val loc0 = dgt0.lctn()
//
(*
val () =
prerrln
("trans01_d0gpt: loc0 = ", loc0)
val () =
prerrln
("trans01_d0gpt: dgt0 = ", dgt0)
*)
//
in//let
case+
dgt0.node() of
|
D0GPTpat(d0p1) =>
d1gpt_make_node
(loc0, D1GPTpat(d1p1)) where
{
val
d1p1 = trans01_d0pat(tenv, d0p1) }
|
D0GPTgua
(d0p1,twhn,d0gs) =>
d1gpt_make_node
(loc0, D1GPTgua(d1p1, d1gs)) where
{
val d1p1 = trans01_d0pat(tenv, d0p1)
val d1gs = trans01_d0gualst(tenv, d0gs)
}
end (*let*) // end of [trans01_d0gpt(d0g0)]

(* ****** ****** *)

#implfun
trans01_d0cls
  (tenv, dcls) =
let
//
val loc0 = dcls.lctn()
//
(*
val () =
prerrln
("trans01_d0cls: loc0 = ", loc0)
val () =
prerrln
("trans01_d0cls: dcls = ", dcls)
*)
//
in//let
case+
dcls.node() of
|
D0CLSgpt(dgt1) =>
d1cls_make_node
(loc0, D1CLSgpt(dgt1)) where
{
val
dgt1 = trans01_d0gpt(tenv, dgt1) }
|
D0CLScls
(dgt1,tkeg,d0e2) =>
d1cls_make_node
(loc0, D1CLScls(dgt1, d1e2)) where
{
val dgt1 = trans01_d0gpt(tenv, dgt1)
val d1e2 = trans01_d0exp(tenv, d0e2)
}
end (*let*) // end of [trans01_d0cls(dcls)]

(* ****** ****** *)
//
#implfun
trans01_s0eff
(tenv, seff) =
(
case+ seff of
|
S0EFFnone
(  tok  ) =>
S1EFFnone((*void*))
|
S0EFFsome
(tbeg,s0es,tend) =>
S1EFFsome( s1es ) where
{
val s1es = trans01_s0explst(tenv, s0es)
}
) (*case+*) // end of [trans01_s0eff(...)]
//
(* ****** ****** *)
//
#implfun
trans01_s0res
(tenv, sres) =
(
case+ sres of
|
S0RESnone() => S1RESnone()
|
S0RESsome(seff,s0e1) =>
S1RESsome(seff,s1e1) where
{
val seff = trans01_s0eff(tenv, seff)
val s1e1 = trans01_s0exp(tenv, s0e1)
}
) (*case+*) // end of [trans01_s0res(...)]
//
(* ****** ****** *)
//
#implfun
trans01_d0res
(tenv, dres) =
(
case+ dres of
|
D0RESnone() =>
TEQD1EXPnone((*void*))
|
D0RESsome(teq0,d0e1) =>
TEQD1EXPsome(teq0,d1e1) where
{
val d1e1 = trans01_d0exp(tenv, d0e1)
}
) (*case+*) // end of [trans01_d0res(...)]
//
(* ****** ****** *)

#implfun
trans01_t0qua
(tenv, t0q0) =
(
case+ t0q0 of
|
T0QUAnone
(  tok  ) =>
let
val loc0 = tok.lctn()
in
T1QUAsome(loc0, list_nil())
end // end of [T0QUAnone(tok)]
|
T0QUAsome
(tbeg,s0qs,tend) =>
(
T1QUAsome(loc0, s1qs)) where
{
//
val
loc0 = tbeg.lctn()+tend.lctn()
val
s1qs = trans01_s0qualst(tenv, s0qs)
} (*where*)//end-of-[T0QUAsome(_,_,_)]
) (*case+*)//end-of[trans01_t0qua(tenv,dres)]

(* ****** ****** *)

#implfun
trans01_t0inv
(tenv, tinv) =
(
case+ tinv of
|
T0INVnone
(t0qs, tok1) =>
let
//
val t1qs =
trans01_t0qualst(tenv, t0qs)
val d1ps = list_nil((*void*))
//
val loc0 =
(
case+ t1qs of
|
list_nil() => tok1.lctn()
|
list_cons
(t1q1, t1qs) =>
(t1q1.lctn() + tok1.lctn())
) : loc_t // end-(val(loc0))
//
in//let
  T1INVsome(loc0, t1qs, d1ps)
endlet // end of [ T0INVnone(_,_) ]
|
T0INVsome
(t0qs,tbeg,d0ps,tend) =>
let
//
val t1qs =
trans01_t0qualst(tenv, t0qs)
val d1ps =
trans01_d0patlst(tenv, d0ps)
//
val loc0 =
(
case+ t1qs of
|
list_nil() =>
(tbeg.lctn()+tend.lctn())
|
list_cons
(t1q1, t1qs) =>
(t1q1.lctn() + tend.lctn())
) : loc_t // end-(val(loc0))
//
in//let
  T1INVsome(loc0, t1qs, d1ps)
endlet // end of [T0INVsome(_,_,_,_)]
) (*case+*)//end-of[trans01_t0inv(tenv,tinv)]

(* ****** ****** *)
//
#implfun
trans01_teqd0exp
  (tenv, tdxp) =
(
case+ tdxp of
|
TEQD0EXPnone() =>
TEQD1EXPnone((*void*))
|
TEQD0EXPsome(teq1, d0e2) =>
TEQD1EXPsome(teq1, d1e2) where
{ val
  d1e2 = trans01_d0exp(tenv, d0e2) }
) (*case+*)//end-of(trans01_teqd0exp(...))
//
(* ****** ****** *)
//
#implfun
trans01_wths0exp
  (tenv, tdxp) =
(
case+ tdxp of
|
WTHS0EXPnone() =>
WTHS1EXPnone((*void*))
|
WTHS0EXPsome(twth, s0e2) =>
WTHS1EXPsome(twth, s1e2) where
{ val
  s1e2 = trans01_s0exp(tenv, s0e2) }
) (*case+*)//end-of(trans01_wths0exp(...))
//
(* ****** ****** *)
//
#implfun
trans01_d0patlst
( tenv, d0ps ) =
list_trans01_fnp(tenv, d0ps, trans01_d0pat)
//
#implfun
trans01_l0d0plst
( tenv, ldps ) =
list_trans01_fnp(tenv, ldps, trans01_l0d0p)
//
(* ****** ****** *)
#implfun
trans01_d0explst
( tenv, d0es ) =
list_trans01_fnp(tenv, d0es, trans01_d0exp)
#implfun
trans01_d0expopt
( tenv, dopt ) =
optn_trans01_fnp(tenv, dopt, trans01_d0exp)
(* ****** ****** *)
//
#implfun
trans01_l0d0elst
( tenv, ldes ) =
list_trans01_fnp(tenv, ldes, trans01_l0d0e)
//
(* ****** ****** *)

#implfun
trans01_f0arglst
( tenv, f0as ) =
list_trans01_fnp(tenv, f0as, trans01_f0arg)

(* ****** ****** *)

#implfun
trans01_d0gualst
( tenv, d0gs ) =
list_trans01_fnp(tenv, d0gs, trans01_d0gua)

(* ****** ****** *)

#implfun
trans01_d0clslst
( tenv, d0cs ) =
list_trans01_fnp(tenv, d0cs, trans01_d0cls)

(* ****** ****** *)
//
#implfun
trans01_d0expseq
( tenv, d0es ) =
let
fun
auxloop
( tenv:
! tr01env
, d0e1: d0exp
, d0es: d0explst
, d1es: list_vt(d1exp)): d1explst =
(
case+ d0es of
//
|
list_nil
((*void*)) =>
let
val d1e1 =
(
case+
d0e1.node() of
| D0Etkerr(tok1) =>
(
  d1exp_none0(d0e1.lctn()))
| _(*non-D0Etkerr*) =>
(
  trans01_d0exp(tenv, d0e1)))
: d1exp // end-of-[val(d1e1)]
in//let
list_vt2t(list_vt_reverse0(d1es))
where {
val d1es = list_vt_cons(d1e1,d1es) }
end//let//end-of-[list_nil()]
//
|
list_cons
(d0e2, d0es) =>
let
val d1e1 =
(
  trans01_d0exp(tenv, d0e1)): d1exp
in//let
auxloop
(tenv,d0e2,d0es,list_vt_cons(d1e1,d1es))
end//let//end-of-[list_cons(d0e2,d0es)]
)
in//let
//
case+ d0es of
|
list_nil() =>
list_nil((*void*))
|
list_cons(d0e1, d0es) =>
auxloop(tenv, d0e1, d0es, list_vt_nil(*0*))
//
end//let//end-of-[trans01_d0expseq(tenv,d0es)]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_trans01_dynexp.dats] *)
