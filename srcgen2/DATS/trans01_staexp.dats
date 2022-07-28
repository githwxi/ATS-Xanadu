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
Tue Jul 26 11:26:29 EDT 2022
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
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/xfixity.sats"
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
(* ****** ****** *)
#sexpdef fxitm = fxitm
(* ****** ****** *)
#typedef i0dnt = i0dnt
#typedef g1efx = fxitm(g1exp)
#typedef g1efxlst = list(g1efx)
(* ****** ****** *)
#typedef s1tfx = fxitm(sort1)
#typedef s1efx = fxitm(s1exp)
#typedef s1tfxlst = list(s1tfx)
#typedef s1efxlst = list(s1efx)
(* ****** ****** *)
#symload node with i0dnt_get_node
(* ****** ****** *)
#symload lctn with g0exp_get_lctn
#symload node with g0exp_get_node
(* ****** ****** *)
#symload g1exp with g1exp_make_node
(* ****** ****** *)

fun
fxitmlst_resolve_g1exp
( loc0: loc_t
, itms: g1efxlst): g1exp =
let
//
#impltmp
fxitm_infix0<g1exp>
  (x0, f1, x2) =
let
val loc0 =
x0.lctn() + x2.lctn()
val g1en =
(
  case+
  f1.node() of
  | G1Ea0pp() =>
    G1Ea1pp(x0, x2)
  | _(*non-G1Eapp*) =>
    G1Ea2pp(f1, x0, x2)
) : g1exp_node // end of [val]
in
  FXITMatm(g1exp(loc0, g1en))
end // end of [$FIX.fxitm_infix0]
//
#impltmp
fxitm_prefix<g1exp>
  (f0, x1) = let
  val loc0 =
  f0.lctn() + x1.lctn()
in
  FXITMatm
  (g1exp(loc0, G1Ea1pp(f0, x1)))
end // end of [$FIX.fxitm_prefix]
//
#impltmp
fxitm_pstfix<g1exp>
  (x0, f1) = let
  val loc0 =
  x0.lctn() + f1.lctn()
in
  FXITMatm
  (g1exp(loc0, G1Ea1pp(f1, x0)))
end // end of [$FIX.fxitm_pstfix]
//
#impltmp
fxatm_none<g1exp>
  (loc) =
  g1exp_none0(loc)
#impltmp
fxopr_get_lctn<g1exp>
  (opr) = opr.lctn()
//
#impltmp
fxitm_get_lctn<g1exp>
  (itm) =
(
case+ itm of
| FXITMatm(x0) => x0.lctn()
| FXITMopr(x0, _) => x0.lctn()
) (* end of [$FIX.fxitm_get_lctn] *)
//
#impltmp
fxitmlst_resolve$appopr<g1exp>
  (itm) = let
//
val g1e1 =
g1exp
(loc0, G1Ea0pp(*void*)) where
{
val
loc0 = fxitm_get_lctn<g1exp>(itm)
}
//
in//let
  FXITMopr(g1e1, app_fixty)
end // end of [$FIX.fxitmlst_resolve$appopr]
//
in//let
  fxitmlst_resolve<g1exp>(loc0, itms)
end (*let*) // end of [fxitmlst_resolve_g1exp]

(* ****** ****** *)

fun
fxitmlst_resolve_sort1
( loc0: loc_t
, itms: s1tfxlst): sort1 =
let
//
#impltmp
fxitm_infix0<sort1>
  (x0, f1, x2) =
let
val loc0 =
x0.lctn() + x2.lctn()
val s1tn =
(
  case+
  f1.node() of
  | S1Ta0pp() =>
    S1Ta1pp(x0, x2)
  | _(*non-S1Tapp*) =>
    S1Ta2pp(f1, x0, x2)
) : sort1_node // end of [val]
in
  FXITMatm(sort1(loc0, s1tn))
end // end of [$FIX.fxitm_infix0]
//
#impltmp
fxitm_prefix<sort1>
  (f0, x1) = let
  val loc0 =
  f0.lctn() + x1.lctn()
in
  FXITMatm
  (sort1(loc0, S1Ta1pp(f0, x1)))
end // end of [$FIX.fxitm_prefix]
//
#impltmp
fxitm_pstfix<sort1>
  (x0, f1) = let
  val loc0 =
  x0.lctn() + f1.lctn()
in
  FXITMatm
  (sort1(loc0, S1Ta1pp(f1, x0)))
end // end of [$FIX.fxitm_pstfix]
//
#impltmp
fxatm_none<sort1>
  (loc) =
  sort1_none0(loc)
#impltmp
fxopr_get_lctn<sort1>
  (opr) = opr.lctn()
//
#impltmp
fxitm_get_lctn<sort1>
  (itm) =
(
case+ itm of
| FXITMatm(x0) => x0.lctn()
| FXITMopr(x0, _) => x0.lctn()
) (* end of [$FIX.fxitm_get_lctn] *)
//
#impltmp
fxitmlst_resolve$appopr<sort1>
  (itm) = let
//
val s1t1 =
sort1
(loc0, S1Ta0pp(*void*)) where
{
val loc0 =
$FIX.fxitm_get_lctn<sort1>(itm)
}
//
in//let
  $FIX.FXITMopr(s1t1, app_fixty)
end // end of [$FIX.fxitmlst_resolve$appopr]
//
in//let
  fxitmlst_resolve<sort1>(loc0, itms)
end (*let*) // end of [fxitmlst_resolve_sort1]

(* ****** ****** *)

fun
fxitmlst_resolve_s1exp
( loc0: loc_t
, itms: s1efxlst): s1exp =
let
//
#impltmp
fxitm_infix0<s1exp>
  (x0, f1, x2) =
let
val loc0 =
x0.lctn() + x2.lctn()
val s1en =
(
  case+
  f1.node() of
  | S1Ea0pp() =>
    S1Ea1pp(x0, x2)
  | _(*non-S1Eapp*) =>
    S1Ea2pp(f1, x0, x2)
) : s1exp_node // end of [val]
in
  FXITMatm(s1exp(loc0, s1en))
end // end of [$FIX.fxitm_infix0]
//
#impltmp
fxitm_prefix<s1exp>
  (f0, x1) = let
  val loc0 =
  f0.lctn() + x1.lctn()
in
  FXITMatm
  (s1exp(loc0, S1Ea1pp(f0, x1)))
end // end of [$FIX.fxitm_prefix]
//
#impltmp
fxitm_pstfix<s1exp>
  (x0, f1) = let
  val loc0 =
  x0.lctn() + f1.lctn()
in
  FXITMatm
  (s1exp(loc0, S1Ea1pp(f1, x0)))
end // end of [$FIX.fxitm_pstfix]
//
#impltmp
fxatm_none<s1exp>
  (loc) =
  s1exp_none0(loc)
#impltmp
fxopr_get_lctn<s1exp>
  (opr) = opr.lctn()
//
#impltmp
fxitm_get_lctn<s1exp>
  (itm) =
(
case+ itm of
| FXITMatm(x0) => x0.lctn()
| FXITMopr(x0, _) => x0.lctn()
) (* end of [$FIX.fxitm_get_lctn] *)
//
#impltmp
fxitmlst_resolve$appopr<s1exp>
  (itm) = let
//
val s1e1 =
s1exp
(loc0, S1Ea0pp(*void*)) where
{
val loc0 =
$FIX.fxitm_get_lctn<s1exp>(itm)
}
//
in//let
  $FIX.FXITMopr(s1e1, app_fixty)
end // end of [$FIX.fxitmlst_resolve$appopr]
//
in//let
  fxitmlst_resolve<s1exp>(loc0, itms)
end (*let*) // end of [fxitmlst_resolve_s1exp]

(* ****** ****** *)

local

#extern
fun
f0_gid:(g0exp) -> g1efx
#extern
fun
f0_main:(g0exp) -> g1efx

#implfun
f0_main(g0e0) =
(
case+
g0e0.node() of
//
|
G0Eid0 _ => f0_gid(g0e0)
//
|
G0Eint _ => f0_int(g0e0)
|
G0Echr _ => f0_chr(g0e0)
|
G0Eflt _ => f0_flt(g0e0)
|
G0Estr _ => f0_str(g0e0)
//
|
G0Eapps _ => f0_apps(g0e0)
//
|
G0Elist _ => f0_list(g0e0)
//
) where
{
//
fun
f0_int
(g0e0: g0exp): g1efx =
let
val-
G0Eint(int) = g0e0.node()
in//let
//
case+ int of
|
T0INTnone(tok) =>
FXITMatm(g1exp_none1(g0e0))
|
T0INTsome(tok) =>
FXITMatm
(g1exp(g0e0.lctn(), G1Eint(tok)))
//
endlet // end of [f0_int(g0e0)]
//
fun
f0_chr
(g0e0: g0exp): g1efx =
let
val-
G0Echr(chr) = g0e0.node()
in//let
//
case+ chr of
|
T0CHRnone(tok) =>
FXITMatm(g1exp_none1(g0e0))
|
T0CHRsome(tok) =>
FXITMatm
(g1exp(g0e0.lctn(), G1Echr(tok)))
//
endlet // end of [f0_chr(g0e0)]
//
fun
f0_flt
(g0e0: g0exp): g1efx =
let
val-
G0Eflt(flt) = g0e0.node()
in//let
//
case+ flt of
|
T0FLTnone(tok) =>
FXITMatm(g1exp_none1(g0e0))
|
T0FLTsome(tok) =>
FXITMatm
(g1exp(g0e0.lctn(), G1Eflt(tok)))
//
endlet // end of [f0_flt(g0e0)]
//
fun
f0_str
(g0e0: g0exp): g1efx =
let
val-
G0Estr(str) = g0e0.node()
in//let
//
case+ str of
|
T0STRnone(tok) =>
FXITMatm(g1exp_none1(g0e0))
|
T0STRsome(tok) =>
FXITMatm
(g1exp(g0e0.lctn(), G1Estr(tok)))
//
endlet // end of [f0_str(g0e0)]
//
(* ****** ****** *)
//
fun
f0_g0es
( g0es
: g0explst): g1efxlst =
(
list_map
<g0exp><g1efx>(g0es)) where
{
#impltmp
map$fopr<g0exp><g1efx> = f0_main
} (*where*)//end-of(f0_g0es(g0es))
//
(* ****** ****** *)
//
fun
f0_apps
(g0e0: g0exp): g1efx =
let
//
val loc0 = g0e0.lctn()
//
val-
G0Eapps(g0es) = g0e0.node()
//
in//let
FXITMatm
(fxitmlst_resolve_g1exp(loc0, f0_g0es(g0es)))
endlet // end of [ f0_apps(g0e0) ]
//
(* ****** ****** *)
//
fun
f0_list
(g0e0: g0exp): g1efx =
let
val-
G0Elist
(tbeg
,g0es,tend) = g0e0.node()
in//let
let
val
g1es = trans01_g0explst(g0es)
in//let
FXITMatm
(g1exp(g0e0.lctn(),G1Elist(g1es)))
endlet
endlet // end of [ f0_list(g0e0) ]

(* ****** ****** *)

}(*where*)//end-of-[f0_main(g0e0)]

in//let

#implfun
trans01_g0exp(g0e0) =
let
//
(*
//
val loc0 = g0e0.lctn()
val (  ) =
prerrln
("trans01_gexp: g0e0 = ", g0e0)
*)
//
in(*in-of-let*)
//
case+
f0_main(g0e0) of
| FXITMatm(g1e0) => g1e0
| FXITMopr(g1e0, fxty) => g1e0
//
end (*let*) // end of [trans01_g0exp(g0e0)]

endloc(*local*)//end-of-[local(trans01_g0exp)]

(* ****** ****** *)

#implfun
trans01_g0namlst
  (g0ns) =
(
list_map
<g0nam><g1nam>(g0ns)) where
{
#impltmp
map$fopr<g0nam><g1nam> = trans01_g0nam
} (*where*) // end of [trans01_g0namlst(g0ns)]

(* ****** ****** *)

#implfun
trans01_g0explst
  (g0es) =
(
list_map
<g0exp><g1exp>(g0es)) where
{
#impltmp
map$fopr<g0exp><g1exp> = trans01_g0exp
} (*where*) // end of [trans01_g0explst(g0es)]

(* ****** ****** *)

#implfun
trans01_sort0lst
  (s0ts) =
(
list_map
<sort0><sort1>(s0ts)) where
{
#impltmp
map$fopr<sort0><sort1> = trans01_sort0
} (*where*) // end of [trans01_sort0lst(s0ts)]

(* ****** ****** *)

#implfun
trans01_s0explst
  (s0es) =
(
list_map
<s0exp><s1exp>(s0es)) where
{
#impltmp
map$fopr<s0exp><s1exp> = trans01_s0exp
} (*where*) // end of [trans01_s0explst(s0es)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_trans01_staexp.dats] *)
