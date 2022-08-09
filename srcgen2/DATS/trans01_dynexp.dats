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
#symload lctn with d0pat_get_lctn
#symload node with d0pat_get_node
#symload lctn with d0exp_get_lctn
#symload node with d0exp_get_node
(* ****** ****** *)
#symload lctn with d0gua_get_lctn
#symload node with d0gua_get_node
#symload lctn with d0gpt_get_lctn
#symload node with d0gpt_get_node
#symload lctn with d0cls_get_lctn
#symload node with d0cls_get_node
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
  val loc0 =
  f0.lctn() + x1.lctn()
in
  FXITMatm
  (d1pat(loc0, D1Pa1pp(f0, x1)))
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
  val loc0 =
  f0.lctn() + x1.lctn()
in
  FXITMatm
  (d1exp(loc0, D1Ea1pp(f0, x1)))
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

#implfun
trans01_d0pat
  (tenv, d0p0) =
let
//
val loc0 = d0p0.lctn()
//
val () =
prerrln
("trans01_d0pat: loc0 = ", loc0)
val () =
prerrln
("trans01_d0pat: d0p0 = ", d0p0)
//
in//let
case+
d0p0.node() of
| _(*otherwise*) => d1pat_none1(d0p0)
end (*let*) // end of [trans01_d0pat(d0p0)]

(* ****** ****** *)

#implfun
trans01_d0exp
(tenv, d0e0) = let
//
val loc0 = d0e0.lctn()
//
(* ****** ****** *)
//
val () =
prerrln
("trans01_d0exp: loc0 = ", loc0)
val () =
prerrln
("trans01_d0exp: d0e0 = ", d0e0)
//
(* ****** ****** *)
val
dfx0 =
f0_dexp(tenv, d0e0)
in//let
case+ dfx0 of
| FXITMatm(d1e0) => d1e0
| FXITMopr(d1e0, fxty) => d1e0
end where // end of [val(sfx0)]
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
val loc0 = d0e0.lctn()
//
val d1es = f0_d0es(tenv, d0es)
val d1e0 =
fxitmlst_resolve_d1exp(loc0, d1es)
}
//
|
_(*otherwise*) =>
let
val d1e0 =
d1exp_none1(d0e0) in FXITMatm(d1e0) end
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
//
and
f0_d0es
( tenv:
! tr01env
, d0es: d0explst): d1efxlst =
list_trans01_fnp(tenv, d0es, f0_dexp)
//
(* ****** ****** *)

} (*where*) // end of [trans01_d0exp(d0e0)]

(* ****** ****** *)

#implfun
trans01_d0gua
  (tenv, d0g0) =
let
//
val loc0 = d0g0.lctn()
//
val () =
prerrln
("trans01_d0gua: loc0 = ", loc0)
val () =
prerrln
("trans01_d0gua: d0g0 = ", d0g0)
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
trans01_d0patlst
(tenv, d0ps) =
list_trans01_fnp(tenv, d0ps, trans01_d0pat)

(* ****** ****** *)

#implfun
trans01_d0explst
(tenv, d0es) =
list_trans01_fnp(tenv, d0es, trans01_d0exp)

(* ****** ****** *)

#implfun
trans01_d0gualst
(tenv, d0ps) =
list_trans01_fnp(tenv, d0ps, trans01_d0gua)

(* ****** ****** *)

#implfun
trans01_d0clslst
(tenv, d0ps) =
list_trans01_fnp(tenv, d0ps, trans01_d0cls)

(* ****** ****** *)

(* end of [ATS3/XATSOPT_trans01_dynexp.dats] *)
