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
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with i0dnt_get_lctn
#symload node with i0dnt_get_node
(* ****** ****** *)
#symload lctn with g0exp_get_lctn
#symload node with g0exp_get_node
#symload lctn with g1exp_get_lctn
#symload node with g1exp_get_node
(* ****** ****** *)
#symload g1exp with g1exp_make_node
(* ****** ****** *)
#symload lctn with sort0_get_lctn
#symload node with sort0_get_node
#symload lctn with sort1_get_lctn
#symload node with sort1_get_node
(* ****** ****** *)
#symload lctn with s0exp_get_lctn
#symload node with s0exp_get_node
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
(* ****** ****** *)
#symload sort1 with sort1_make_node
#symload s1exp with s1exp_make_node
(* ****** ****** *)
#symload lctn with s0tcn_get_lctn
#symload node with s0tcn_get_node
(* ****** ****** *)
#symload lctn with d0tst_get_lctn
#symload node with d0tst_get_node
(* ****** ****** *)
#symload lctn with s0arg_get_lctn
#symload node with s0arg_get_node
#symload lctn with s0mag_get_lctn
#symload node with s0mag_get_node
(* ****** ****** *)
#symload lctn with t0arg_get_lctn
#symload node with t0arg_get_node
#symload lctn with t0mag_get_lctn
#symload node with t0mag_get_node
(* ****** ****** *)
#symload lctn with s0qua_get_lctn
#symload node with s0qua_get_node
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
#symload s1mag with s1mag_make_node
#symload t1mag with t1mag_make_node
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
#symload
fxis_resolve
with fxitmlst_resolve_g1exp
#symload
fxis_resolve
with fxitmlst_resolve_sort1
#symload
fxis_resolve
with fxitmlst_resolve_s1exp
(* ****** ****** *)
//
#implfun
trans01_i0dnt
(tenv, id0) =
(
case+
id0.node() of
|
I0DNTsome(tok) => tok
|
I0DNTnone(tok) =>
token_none(tok.lctn())
) where
{
fun
token_none
(loc: loc_t): token = 
token_make_node
(loc, T0IDENT_NONE(*val*))
}(*where*)//end-of(trans01_i0dnt)
//
(* ****** ****** *)
//
#implfun
trans01_t0int
(tenv, int) =
(
case+ int of
|
T0INTsome(tok) => tok
|
T0INTnone(tok) =>
token_none(tok.lctn())
) where
{
fun
token_none
(loc: loc_t): token = 
token_make_node(loc, T_ERR())
}(*where*)//end-of(trans01_t0int)
//
(* ****** ****** *)
//
#implfun
trans01_t0chr
(tenv, chr) =
(
case+ chr of
|
T0CHRsome(tok) => tok
|
T0CHRnone(tok) =>
token_none(tok.lctn())
) where
{
fun
token_none
(loc: loc_t): token = 
token_make_node(loc, T_ERR())
}(*where*)//end-of(trans01_t0chr)
//
(* ****** ****** *)
//
#implfun
trans01_t0flt
(tenv, flt) =
(
case+ flt of
|
T0FLTsome(tok) => tok
|
T0FLTnone(tok) =>
token_none(tok.lctn())
) where
{
fun
token_none
(loc: loc_t): token = 
token_make_node(loc, T_ERR())
}(*where*)//end-of(trans01_t0flt)
//
(* ****** ****** *)
//
#implfun
trans01_t0str
(tenv, str) =
(
case+ str of
|
T0STRsome(tok) => tok
|
T0STRnone(tok) =>
token_none(tok.lctn())
) where
{
fun
token_none
(loc: loc_t): token = 
token_make_node(loc, T_ERR())
}(*where*)//end-of(trans01_t0str)
//
(* ****** ****** *)
//
#implfun
trans01_s0qid
(tenv, sqid) =
(
case+ sqid of
|
S0QIDnone(id0) =>
S1QIDnone
(trans01_i0dnt(tenv, id0))
|
S0QIDsome(tok, id0) =>
S1QIDsome
(tok, trans01_i0dnt(tenv, id0))
)
//
#implfun
trans01_d0qid
(tenv, sqid) =
(
case+ sqid of
|
D0QIDnone(id0) =>
D1QIDnone
(trans01_i0dnt(tenv, id0))
|
D0QIDsome(tok, id0) =>
D1QIDsome
(tok, trans01_i0dnt(tenv, id0))
)
//
(* ****** ****** *)

local

(* ****** ****** *)
#extern
fun
f0_gid:
(!tr01env, g0exp) -> g1efx
#extern
fun
f0_main:
(!tr01env, g0exp) -> g1efx
(* ****** ****** *)

#implfun
f0_main
(tenv, g0e0) =
(
case+
g0e0.node() of
//
|
G0Eid0 _ => f0_gid(tenv, g0e0)
//
|
G0Eint _ => f0_int(tenv, g0e0)
|
G0Echr _ => f0_chr(tenv, g0e0)
|
G0Eflt _ => f0_flt(tenv, g0e0)
|
G0Estr _ => f0_str(tenv, g0e0)
//
|
G0Eif0 _ => f0_if0(tenv, g0e0)
//
|
G0Eapps _ => f0_apps(tenv, g0e0)
//
|
G0Elist _ => f0_list(tenv, g0e0)
//
|
G0Enone1 _ =>
FXITMatm
(
g1exp(g0e0.lctn(),G1Enone1(g0e0)))
) where
{
//
fun
f0_int
( tenv:
! tr01env
, g0e0: g0exp): g1efx =
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
endlet // end of [f0_int(tenv,g0e0)]
//
fun
f0_chr
( tenv:
! tr01env
, g0e0: g0exp): g1efx =
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
endlet // end of [f0_chr(tenv,g0e0)]
//
fun
f0_flt
( tenv:
! tr01env
, g0e0: g0exp): g1efx =
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
endlet // end of [f0_flt(tenv,g0e0)]
//
fun
f0_str
( tenv:
! tr01env
, g0e0: g0exp): g1efx =
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
endlet // end of [f0_str(tenv,g0e0)]
//
(* ****** ****** *)
//
fun
f0_g0es
( tenv:
! tr01env
, g0es
: g0explst): g1efxlst =
(
list_map_e1nv
<g0exp><g1efx>(g0es, tenv)) where
{
#impltmp
map$fopr_e1nv
<g0exp><g1efx>
( g0e1, tenv ) = f0_main(tenv, g0e1)
} (*where*)//end-of(f0_g0es(tenv,g0es))
//
(* ****** ****** *)
//
fun
f0_if0
( tenv:
! tr01env
, g0e0: g0exp): g1efx =
let
//
val loc0 = g0e0.lctn()
//
val-
G0Eif0
(tknd
,g0e1,g0e2
,g0e3,tend) = g0e0.node()
//
val g1e1 =
trans01_g0exp(tenv, g0e1)
//
val g1e2 =
(
case+ g0e2 of
|
g0exp_THEN
(tok1, g0e2) =>
trans01_g0exp(tenv, g0e2)): g1exp
//
val g1e3 =
(
case+ g0e3 of
|
g0exp_ELSE
(tok1, g0e3) =>
trans01_g0exp(tenv, g0e3)): g1exp
//
in
FXITMatm
(
g1exp
(loc0, G1Eif0(g1e1, g1e2, g1e3)))
endlet // end of [ f0_if0(g0e0) ]
//
(* ****** ****** *)
//
fun
f0_apps
( tenv:
! tr01env
, g0e0: g0exp): g1efx =
let
//
val loc0 = g0e0.lctn()
//
val-
G0Eapps(g0es) = g0e0.node()
//
val g1es = f0_g0es(tenv, g0es)
//
in//let
FXITMatm(fxis_resolve(loc0,g1es))
endlet // end of [ f0_apps(g0e0) ]
//
(* ****** ****** *)
//
fun
f0_list
( tenv:
! tr01env
, g0e0: g0exp): g1efx =
let
val-
G0Elist
(tbeg
,g0es,tend) = g0e0.node()
in//let
let
val
g1es =
trans01_g0explst(tenv, g0es)
in//let
FXITMatm
(g1exp(g0e0.lctn(),G1Elist(g1es)))
endlet
endlet // end of [ f0_list(g0e0) ]

(* ****** ****** *)

}(*where*)//end-of-[f0_main(g0e0)]

in//let
//
#implfun
trans01_g0exp
(tenv, g0e0) = let
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
f0_main
(tenv, g0e0) of
| FXITMatm(g1e0) => g1e0
| FXITMopr(g1e0, fxty) => g1e0
//
end (*let*) // end of [trans01_g0exp(g0e0)]
//
endloc(*local*)//end-of-[local(trans01_g0exp)]

(* ****** ****** *)

#implfun
trans01_sort0
(tenv, s0t0) = let
(* ****** ****** *)
val () =
prerrln(
"trans01_sort0: s0t0 = ", s0t0
)(*prerrln*)
(* ****** ****** *)
val
sfx0 =
f0_sort(tenv, s0t0)
in//let
case+ sfx0 of
| FXITMatm(s1e0) => s1e0
| FXITMopr(s1e0, fxty) => s1e0
end where // end of [val(sfx0)]
{
fun
f0_sort
( tenv:
! tr01env
, s0t0: sort0): s1tfx =
(
case+
s0t0.node() of
//
| S0Tid0 _ => f0_id0(tenv, s0t0)
//
| S0Tint _ => f0_int(tenv, s0t0)
//
|
S0Tapps(s0ts) =>
FXITMatm(s1t0) where
{
//
val loc0 = s0t0.lctn()
//
val s1ts =
  f0_s0ts(tenv, s0ts)
val s1t0 =
  fxis_resolve(loc0, s1ts) }
(*where*) // end of [S0Tapps(...)]
//
|
S0Tlpar
(tbeg,s0ts,tend) =>
FXITMatm(s1t0) where
{
//
val loc0 = s0t0.lctn()
//
val s1ts =
trans01_sort0lst(tenv, s0ts)
val s1t0 =
sort1_make_node(loc0, S1Tlist(s1ts))
//
} (*where*) // end of [S0Tlpar(...)]
//
|
_(*otherwise*) =>
let
val s1t0 =
sort1_none1(s0t0) in FXITMatm(s1t0)
end
) (*case+*) // end of [f0_sort(s0t0)]
//
and
f0_id0
( tenv:
! tr01env
, s0t0: sort0): s1tfx =
let
//
val
loc0 = s0t0.lctn()
//
val
S0Tid0(tid) = s0t0.node()
//
val
tok0 = trans01_i0dnt(tenv, tid)
//
val sym0 =
(
case-
tok0.node() of
|
T_IDALP(nam) => symbl(nam)
|
T_IDSYM(nam) => symbl(nam)): sym_t
//
val opt1 =
(
if
(
sym0=ADD_symbl)
then
optn_vt_cons
(postplus_fixty) else
(
if
(
sym0=SUB_symbl)
then
optn_vt_cons
(postmnus_fixty) else
tr01env_search_opt(tenv, sym0))
) : fixtyopt_vt // end(val(opt))
//
val
s1t0 = sort1(loc0, S1Tid0(sym0))
//
in//let
//
case+ opt1 of
| ~
optn_vt_nil() =>
FXITMatm(s1t0)
| ~
optn_vt_cons(fxty) =>
(
case+ fxty of
|
FIXTYnon() => FXITMatm(s1t0)
|
_(* else *) => FXITMopr(s1t0, fxty))
//
end (*let*) //end-of(f0_id0(tenv,s0t0))
//
and
f0_int
( tenv:
! tr01env
, s0t0: sort0): s1tfx =
let
val
loc0 = s0t0.lctn()
val-
S0Tint
( int ) = s0t0.node() in
FXITMatm
(
sort1
(loc0,S1Tint(trans01_t0int(tenv,int)))
)
end (*let*) // end of [f0_int(tenv,s0t0)]
//
and
f0_s0ts
( tenv:
! tr01env
, s0ts: sort0lst): s1tfxlst =
list_map_e1nv
<sort0><s1tfx>(s0ts, tenv) where
{
#impltmp
map$fopr_e1nv
<sort0><s1tfx>(s1t1, tenv) = f0_sort(tenv, s1t1)
} (* end of [f0_s0ts] *)
//
} (*where*) // end of [trans01_sort0(tenv,s0t0)]

(* ****** ****** *)

#implfun
trans01_s0exp
(tenv, s0e0) = let
(* ****** ****** *)
val () =
prerrln(
"trans01_s0exp: s0e0 = ", s0e0
)(*prerrln*)
(* ****** ****** *)
val
sfx0 =
f0_sexp(tenv, s0e0)
in//let
case+ sfx0 of
| FXITMatm(s1e0) => s1e0
| FXITMopr(s1e0, fxty) => s1e0
end where // end of [val(sfx0)]
{
(* ****** ****** *)
//
fun
f0_sexp
( tenv:
! tr01env
, s0e0: s0exp): s1efx =
(
case+
s0e0.node() of
//
|
S0Eid0 _ => f0_id0(tenv, s0e0)
//
|
S0Eint _ => f0_int(tenv, s0e0)
|
S0Echr _ => f0_chr(tenv, s0e0)
|
S0Eflt _ => f0_flt(tenv, s0e0)
|
S0Estr _ => f0_str(tenv, s0e0)
//
|
S0Eapps(s0es) =>
FXITMatm(s1e0) where
{
//
val loc0 = s0e0.lctn()
//
val s1es =
  f0_s0es(tenv, s0es)
val s1e0 =
  fxis_resolve(loc0, s1es) }
(*where*) // end of [S0Eapps(...)]
//
|
S0Elpar
(tbeg,ses1,tend) =>
let
//
val loc0 = s0e0.lctn()
//
in//let
//
case+ tend of
|
s0exp_RPAREN_cons0
(      tok       ) =>
FXITMatm
(
s1exp
(loc0, S1El1st(ses1))) where
{
val ses1 =
  trans01_s0explst(tenv, ses1)
}
|
s0exp_RPAREN_cons1
(tbeg, ses2, tend) =>
FXITMatm
(
s1exp
( loc0
, S1El2st(ses1, ses2))) where
{
val ses1 =
  trans01_s0explst(tenv, ses1)
val ses2 =
  trans01_s0explst(tenv, ses2)
}
//
endlet // end of [ S0Elpar(_,_,_) ]
//
|
S0Etup1
(tknd
,topt,ses1,tend) =>
//
let
//
val loc0 = s0e0.lctn()
//
in//let
//
case+ tend of
|
s0exp_RPAREN_cons0
(      tok       ) =>
FXITMatm
(
s1exp
( loc0
, S1Et1up(tknd,ses1))) where
{
val ses1 =
  trans01_s0explst(tenv, ses1)
}
|
s0exp_RPAREN_cons1
(tbeg, ses2, tend) =>
FXITMatm
(
s1exp
( loc0
, S1Et2up
  (tknd, ses1, ses2))) where
{
val ses1 =
  trans01_s0explst(tenv, ses1)
val ses2 =
  trans01_s0explst(tenv, ses2)
}
//
endlet // end of [S0Etup1(_,_,_,_)]
//
|
S0Ercd2
(tknd
,topt,lss1,tend) =>
//
let
//
val loc0 = s0e0.lctn()
//
in//let
//
case+ tend of
|
l0s0e_RBRACE_cons0
(      tok       ) =>
FXITMatm
(
s1exp
( loc0
, S1Er1cd(tknd,lss1))) where
{
val lss1 =
  trans01_l0s0elst(tenv, lss1)
}
|
l0s0e_RBRACE_cons1
(tbeg, lss2, tend) =>
FXITMatm
(
s1exp
( loc0
, S1Er2cd
  (tknd, lss1, lss2))) where
{
val lss1 =
  trans01_l0s0elst(tenv, lss1)
val lss2 =
  trans01_l0s0elst(tenv, lss2)
}
//
endlet // end of [S0Ercd2(_,_,_,_)]
//
|
S0Euni0
(tbeg,s0qs,tend) =>
FXITMopr
(s1e0, forall_fixty) where
{
val
s1qs =
trans01_s0qualst(tenv, s0qs)
val
s1e0 =
s1exp(s0e0.lctn(), S1Euni0(s1qs))
} (*where*) // end of [S0Euni0(...)]
//
|
S0Eexi0
(tknd,s0qs,tend) =>
FXITMopr
(s1e0, exists_fixty) where
{
val
s1qs =
trans01_s0qualst(tenv, s0qs)
val
s1e0 =
s1exp
(s0e0.lctn(), S1Eexi0(tknd,s1qs))
} (*where*) // end of [S0Eexi0(...)]
//
|
S0Elam0
(tknd
,smas,tres
,teg1,s0e1,tend) =>
let
//
val loc0 = s0e0.lctn()
//
val smas =
  trans01_s0maglst(tenv, smas)
val tres =
  trans01_sort0opt(tenv, tres)
//
val
s1e1 = trans01_s0exp(tenv, s0e1)
//
in//let
FXITMatm
(
s1exp_make_node
(loc0, S1Elam0(smas, tres, s1e1)))
end (*let*) // end of [S0Elam(...)]
//
|
S0Eanno(s0e1, s0t2) =>
let
val loc0 = s0e0.lctn()
val s1e1 =
  trans01_s0exp(tenv, s0e1)
val s1t2 =
  trans01_sort0(tenv, s0t2)
in//let
FXITMatm
(s1exp(loc0, S1Eanno(s1e1, s1t2)))
end (*let*) // end of [S0Eanno(_,_)]
//
|
S0Equal(tok1, s0e2) =>
let
val loc0 = s0e0.lctn()
val s1e2 =
  trans01_s0exp(tenv, s0e2)
in
FXITMatm
(s1exp(loc0, S1Equal(tok1, s1e2)))
end (*let*) // end of [S0Equal(_,_)]
//
|
_(*otherwise*) =>
let
val s1e0 =
s1exp_none1(s0e0) in FXITMatm(s1e0) end
//
) (*case+*) // end of [f0_sexp(tenv,s0e0)]
//
and
f0_id0
( tenv:
! tr01env
, s0e0: s0exp): s1efx =
let
//
val
loc0 = s0e0.lctn()
val
S0Eid0
( sid0 ) = s0e0.node()
val
tok0 =
trans01_i0dnt(tenv, sid0)
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
, nam1: string): s1efx =
let
//
val loc0 = tok0.lctn()
val sym1 = symbl(nam1)
val s1e0 =
s1exp(loc0, S1Eid0(sym1))
val fopt =
tr01env_search_opt(tenv, sym1)
//
in
case+ fopt of
| ~
optn_vt_nil() => FXITMatm(s1e0)
| ~
optn_vt_cons(fxty) =>
(
case+ fxty of
|
FIXTYnon() => FXITMatm(s1e0)
|
_(*otherwise*) => FXITMopr(s1e0, fxty)
) (* end of [optn_vt_cons(fxty)] *)
end (*let*) // end of [f0_id0_1(_,_,_)]
//
and
f0_id0_2
( tenv:
! tr01env
, tok0: token): s1efx =
(
FXITMopr
(s1e0, bslash_fixty)) where
{
val loc0 = tok0.lctn()
val s1e0 =
s1exp_make_node(loc0, S1Eb0sh())
} (*where*) // end of [ f0_id0_2(_,_) ]
//
and
f0_int
( tenv:
! tr01env
, s0e0: s0exp): s1efx =
let
val
loc0 = s0e0.lctn()
val-
S0Eint
( int ) = s0e0.node() in
FXITMatm
(
s1exp
( loc0
, S1Eint(trans01_t0int(tenv, int))))
end // end of [let] // end of [f0_int]
//
and
f0_chr
( tenv:
! tr01env
, s0e0: s0exp): s1efx =
let
val
loc0 = s0e0.lctn()
val-
S0Echr
( chr ) = s0e0.node() in
FXITMatm
(
s1exp
( loc0
, S1Echr(trans01_t0chr(tenv, chr))))
end // end of [let] // end of [f0_chr]
//
and
f0_flt
( tenv:
! tr01env
, s0e0: s0exp): s1efx =
let
val
loc0 = s0e0.lctn()
val-
S0Eflt
( flt ) = s0e0.node() in
FXITMatm
(
s1exp
( loc0
, S1Eflt(trans01_t0flt(tenv, flt))))
end // end of [let] // end of [f0_flt]
//
and
f0_str
( tenv:
! tr01env
, s0e0: s0exp): s1efx =
let
val
loc0 = s0e0.lctn()
val-
S0Estr
( str ) = s0e0.node() in
FXITMatm
(
s1exp
( loc0
, S1Estr(trans01_t0str(tenv, str))))
end // end of [let] // end of [f0_str]
//
and
f0_s0es
( tenv:
! tr01env
, s0es: s0explst): s1efxlst =
list_trans01_fnp(tenv, s0es, f0_sexp)
//
} (*where*) // end of [trans01_s0exp(s0e0)]

(* ****** ****** *)
//
#implfun
trans01_s0tcn
(tenv, tcn0) =
(
case+
tcn0.node() of
|
S0TCNnode(seid, tres) =>
s1tcn_make_node
( tcn0.lctn()
, S1TCNnode(seid, tres)) where
{
val seid = trans01_i0dnt(tenv, seid)
val tres = trans01_sort0opt(tenv, tres)
} (*where*)//end-of(S0TCNnode(seid,tres))
) (*case+*)//end(trans01_s0tcn(tenv,tcn0))
//
(* ****** ****** *)
//
#implfun
trans01_d0tst
(tenv, d0t0) =
(
case+
d0t0.node() of
|
D0TSTnode
( stid
, teq1
, tbar,tcns) =>
d1tst_make_node
( d0t0.lctn()
, D1TSTnode(stid, tcns)) where
{
val stid = trans01_i0dnt(tenv, stid)
val tcns = trans01_s0tcnlst(tenv, tcns)
} (*where*)//end-of(D0TSTnode(_,_,_,_))
) (*case+*)//end(trans01_d0tst(tenv,d0t0))
//
(* ****** ****** *)

#implfun
trans01_s0arg
(tenv, s0a0) =
(
case+
s0a0.node() of
|
S0ARGnone
(  tok1  ) =>
let
val
loc0 = s0a0.lctn()
val
loc1 = tok1.lctn()
val
sid1 =
token_make_node
(loc1, T0IDENT_NONE)
val tres = optn_nil()
in//let
s1arg
(loc0, S1ARGsome(sid1, tres))
end (*let*) // S0ARGnone(_)
|
S0ARGsome
(sid1, tres) =>
let
val
loc0 = s0a0.lctn()
val
sid1 =
trans01_i0dnt(tenv, sid1)
val
tres =
trans01_sort0opt(tenv, tres)
in//let
s1arg
(loc0, S1ARGsome(sid1, tres))
end (*let*) // S0ARGsome(_, _)
) (*case+*) // end of [trans01_s0arg(s0a0)]

(* ****** ****** *)

#implfun
trans01_s0mag
(tenv, s0ma) = let
//
val loc0 = s0ma.lctn()
//
(*
val () =
prerrln
("trans01_s0mag: s0ma = ", s0ma)
*)
//
in//let
//
case+
s0ma.node() of
|
S0MAGnone(tok) => let
  val sid =
  token_make_node
  ( tok.lctn()
  , T0IDENT_NONE(*val*))
  val
  s1a =
  s1arg_make_node
  ( sid.lctn()
  , S1ARGsome(sid, optn_nil()))
in
  s1mag_make_node
  (loc0, S1MAGlist(list_sing(s1a)))
end (*let*) // end of [S0MAGnone]
|
S0MAGsing(sid) => let
val
sid =
trans01_i0dnt(tenv, sid)
val
s1a =
s1arg_make_node
( sid.lctn()
, S1ARGsome(sid, optn_nil()))
in
  s1mag_make_node
  (loc0, S1MAGlist(list_sing(s1a)))
end (*let*) // end of [S0MAGsing]
|
S0MAGlist
(tbeg,s0as,tend) => let
val
s1as =
trans01_s0arglst(tenv, s0as)
in
s1mag_make_node(loc0, S1MAGlist(s1as))
end (*let*) // end of [S0MAGlist]
//
end (*let*) // end of [trans01_s0mag(s0ma)]

(* ****** ****** *)

#implfun
trans01_t0arg
(tenv, t0a0) =
(
case+
t0a0.node() of
|
T0ARGnone
(  tok1  ) =>
let
val
loc0 = t0a0.lctn()
val
s1t1 =
sort1_none0(tok1.lctn())
in//let
t1arg
(loc0
,T1ARGsome(s1t1,optn_nil()))
end (*let*) // T0ARGnone(_)
|
T0ARGsome
(s0t1, topt) =>
let
val
loc0 = t0a0.lctn()
val
s1t1 =
trans01_sort0(tenv, s0t1)
in//let
t1arg
(loc0, T1ARGsome(s1t1, topt))
endlet // end of (S0ARGsome(_,_))
) (*case+*)//end-of(trans01_t0arg(tenv,t0a0))

(* ****** ****** *)

#implfun
trans01_t0mag
(tenv, t0ma) = let
//
val
loc0 = t0ma.lctn()
//
in//let
//
case-
t0ma.node() of
|
T0MAGnone(tok) =>
let
val loc =
tok.lctn()
val s1t =
sort1_none0(loc)
val
t1a =
t1arg_make_node
( loc
, T1ARGsome(s1t, optn_nil()))
in
t1mag_make_node
(loc0, T1MAGlist(list_sing(t1a)))
end (*let*) // end of [T0MAGnone]
|
T0MAGlist
(tbeg,t0as,tend) =>
let
val t1as =
trans01_t0arglst(tenv, t0as)
in//let
t1mag_make_node(loc0, T1MAGlist(t1as))
end (*let*) // end of [T0MAGlist]
//
end (*let*) // end of [trans01_t0mag(tenv,t0ma)]

(* ****** ****** *)

#implfun
trans01_s0qua
(tenv, s0q0) = let
//
val
loc0 = s0q0.lctn()
//
in//let
//
case+
s0q0.node() of
|
S0QUAprop(s0e1) =>
s1qua
( loc0
, S1QUAprop
  (trans01_s0exp(tenv, s0e1)))
|
S0QUAvars(sids, topt) =>
s1qua
( loc0
, S1QUAvars(sids, topt)) where
{
val
sids = trans01_i0dntlst(tenv, sids)
val
topt = trans01_sort0opt(tenv, topt) }
//
end (*let*) // end of [trans01_s0qua(s0q0)]

(* ****** ****** *)

#implfun
trans01_s0uni
(tenv, s0u0) = let
//
val
loc0 = s0u0.lctn()
//
in//let
//
case+
s0u0.node() of
|
S0UNInone(tok) =>
let
val s1qs = list_nil()
in
  s1uni(loc0,S1UNIsome(s1qs))
end (*let*)//end-of-(S0UNInone(tok))
|
S0UNIsome
(tbeg,s0qs,tend) =>
let
val s1qs =
trans01_s0qualst(tenv, s0qs)
in
s1uni_make_node(loc0,S1UNIsome(s1qs))
end (*let*)//end-of-(S0UNIsome(_,_,_))
//
end (*let*)//end of [trans01_s0uni(tenv,s0u0)]

(* ****** ****** *)

#implfun
trans01_d0tcn
(tenv, tcn0) = let
//
val
loc0 = tcn0.lctn()
//
in//let
//
case+
tcn0.node() of
|
D0TCNnode
( s0us
, deid
, s0es, sres) =>
let
val deid =
trans01_i0dnt(tenv, deid)
val s1us =
trans01_s0unilst(tenv, s0us)
val s1es =
trans01_s0explst(tenv, s0es)
val sres =
trans01_s0expopt(tenv, sres)
in
d1tcn_make_node
(loc0,D1TCNnode(s1us,deid,s1es,sres))
end (*let*)//end-of-(D0TCNnode(_,_,_,_))
//
end (*let*)//end-of-[trans01_d0tcn(tenv,tcn0)]

(* ****** ****** *)

#implfun
trans01_d0typ
(tenv, d0t0) = let
//
val
loc0 = d0t0.lctn()
//
in//let
//
case+
d0t0.node() of
|
D0TYPnode
( deid
, tmas, tres
, teq1, tcns) =>
let
val deid =
trans01_i0dnt(tenv, deid)
val tmas =
trans01_t0maglst(tenv, tmas)
val tres =
trans01_sort0opt(tenv, tres)
val tcns =
trans01_d0tcnlst(tenv, tcns)
in
d1typ_make_node
(loc0,D1TYPnode(deid,tmas,tres,tcns))
end (*let*)//end-of-(D0TYPnode(_,_,_,_,_))
//
end (*let*)//end-of-[trans01_d0typ(tenv,d0t0)]

(* ****** ****** *)
//
#implfun
trans01_i0dntlst
  (tenv, ids) =
(
list_map_e1nv
<i0dnt><i1dnt>(ids, tenv)) where
{
#impltmp
map$fopr_e1nv
<i0dnt><i1dnt>
( id0, tenv ) = trans01_i0dnt(tenv, id0)
} (*where*) // end of [trans01_i0dntlst(ids)]
//
#implfun
trans01_i0dntopt
  (tenv, opt) =
(
case+ opt of
| optn_nil() =>
  optn_nil()
| optn_cons(id0) =>
  optn_cons(id1) where
  { val id1 = trans01_i0dnt(tenv, id0) }
) (*case+*) // end of [trans01_i0dntopt(opt)]
//
(* ****** ****** *)

#implfun
trans01_g0namlst
(tenv, g0ns) =
list_trans01_fnp(tenv, g0ns, trans01_g0nam)

(* ****** ****** *)

#implfun
trans01_g0explst
  (tenv, g0es) =
list_trans01_fnp(tenv, g0es, trans01_g0exp)

(* ****** ****** *)

#implfun
trans01_sort0lst
(tenv, s0ts) =
list_trans01_fnp(tenv, s0ts, trans01_sort0)

(* ****** ****** *)

#implfun
trans01_sort0opt
(tenv, opt0) =
optn_trans01_fnp(tenv, opt0, trans01_sort0)

(* ****** ****** *)

#implfun
trans01_s0tcnlst
(tenv, tcns) =
list_trans01_fnp(tenv, tcns, trans01_s0tcn)

(* ****** ****** *)

#implfun
trans01_d0tstlst
(tenv, d0ts) =
list_trans01_fnp(tenv, d0ts, trans01_d0tst)

(* ****** ****** *)

#implfun
trans01_s0arglst
(tenv, s0as) =
list_trans01_fnp(tenv, s0as, trans01_s0arg)

(* ****** ****** *)

#implfun
trans01_s0maglst
(tenv, smas) =
list_trans01_fnp(tenv, smas, trans01_s0mag)

(* ****** ****** *)

#implfun
trans01_t0arglst
(tenv, t0as) =
list_trans01_fnp(tenv, t0as, trans01_t0arg)

(* ****** ****** *)

#implfun
trans01_t0maglst
(tenv, tmas) =
list_trans01_fnp(tenv, tmas, trans01_t0mag)

(* ****** ****** *)

#implfun
trans01_s0qualst
(tenv, s0qs) =
list_trans01_fnp(tenv, s0qs, trans01_s0qua)

(* ****** ****** *)

#implfun
trans01_s0explst
( tenv, s0es ) =
list_trans01_fnp(tenv, s0es, trans01_s0exp)

(* ****** ****** *)

#implfun
trans01_s0expopt
( tenv, opt0 ) =
optn_trans01_fnp(tenv, opt0, trans01_s0exp)

(* ****** ****** *)

#implfun
trans01_s0unilst
( tenv, s0us ) =
list_trans01_fnp(tenv, s0us, trans01_s0uni)

(* ****** ****** *)

#implfun
trans01_d0tcnlst
(tenv, tcns) =
list_trans01_fnp(tenv, tcns, trans01_d0tcn)

(* ****** ****** *)

#implfun
trans01_d0typlst
(tenv, d0ts) =
list_trans01_fnp(tenv, d0ts, trans01_d0typ)

(* ****** ****** *)

(* end of [ATS3/XATSOPT_trans01_staexp.dats] *)
