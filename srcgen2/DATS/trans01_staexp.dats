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
#symload lctn with token_get_lctn
(* ****** ****** *)
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
#symload sort1 with sort1_make_node
(* ****** ****** *)
#symload lctn with s0arg_get_lctn
#symload node with s0arg_get_node
#symload lctn with s0mag_get_lctn
#symload node with s0mag_get_node
(* ****** ****** *)
#symload s1mag with s1mag_make_node
(* ****** ****** *)
#symload lctn with s0exp_get_lctn
#symload node with s0exp_get_node
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
(* ****** ****** *)
#symload s1exp with s1exp_make_node
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
//
#implfun
trans01_i0dnt
  (id0) =
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
  (int) =
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
  (chr) =
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
  (flt) =
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
  (str) =
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

local

(* ****** ****** *)
#extern
fun
f0_gid:(g0exp) -> g1efx
#extern
fun
f0_main:(g0exp) -> g1efx
(* ****** ****** *)

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
G0Eif0 _ => f0_if0(g0e0)
//
|
G0Eapps _ => f0_apps(g0e0)
//
|
G0Elist _ => f0_list(g0e0)
//
|
G0Enone1 _ =>
FXITMatm
(
g1exp
(g0e0.lctn(),G1Enone1(g0e0)))
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
f0_if0
( g0e0
: g0exp): g1efx =
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
val g1e1 = trans01_g0exp(g0e1)
//
val g1e2 =
(
case+ g0e2 of
|
g0exp_THEN
(tok1, g0e2) => trans01_g0exp(g0e2))
//
val g1e3 =
(
case+ g0e3 of
|
g0exp_ELSE
(tok1, g0e3) => trans01_g0exp(g0e3))
//
in
FXITMatm
(
g1exp(loc0, G1Eif0(g1e1, g1e2, g1e3)))
endlet // end of [ f0_if0(g0e0) ]
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
trans01_sort0(s0t0) =
let
(* ****** ****** *)
val () =
prerrln(
"trans01_sort0: s0t0 = ", s0t0
)(*prerrln*)
(* ****** ****** *)
val sfx0 = f0_sort(s0t0)
in//let
case+ sfx0 of
| FXITMatm(s1e0) => s1e0
| FXITMopr(s1e0, fxty) => s1e0
end where
{
fun
f0_sort
(s0t0: sort0): s1tfx =
(
case+
s0t0.node() of
//
| S0Tint _ => f0_int(s0t0)
//
|
S0Tapps(s0ts) =>
FXITMatm(s1t0) where
{
//
val loc0 = s0t0.lctn()
//
val s1ts = f0_s0ts(s0ts)
val s1t0 =
fxitmlst_resolve_sort1(loc0, s1ts)
}
|
_(*otherwise*) =>
let
val s1t0 =
sort1_none1(s0t0) in FXITMatm(s1t0)
end
) (*case+*) // end of [f0_sort(s0t0)]
//
and
f0_int
(s0t0: sort0): s1tfx =
let
val
loc0 = s0t0.lctn()
val-
S0Tint
( int ) = s0t0.node() in
FXITMatm
(
sort1(loc0,S1Tint(trans01_t0int(int)))
)
end // end of [let] // end of [f0_int]
//
and
f0_s0ts
(s0ts: sort0lst): s1tfxlst =
list_map<sort0><s1tfx>(s0ts) where
{
#impltmp map$fopr<sort0><s1tfx> = f0_sort
} (* end of [f0_s0ts] *)
//
} (*where*) // end of [trans01_sort0(s0t0)]

(* ****** ****** *)

#implfun
trans01_s0exp(s0e0) =
let
(* ****** ****** *)
val () =
prerrln(
"trans01_s0exp: s0e0 = ", s0e0
)(*prerrln*)
(* ****** ****** *)
val sfx0 = f0_sexp(s0e0)
in//let
case+ sfx0 of
| FXITMatm(s1e0) => s1e0
| FXITMopr(s1e0, fxty) => s1e0
end where
{
(* ****** ****** *)
//
fun
f0_sexp
(s0e0: s0exp): s1efx =
(
case+
s0e0.node() of
//
| S0Eint _ => f0_int(s0e0)
| S0Echr _ => f0_chr(s0e0)
| S0Eflt _ => f0_flt(s0e0)
| S0Estr _ => f0_str(s0e0)
//
|
S0Eapps(s0es) =>
FXITMatm(s1e0) where
{
//
val loc0 = s0e0.lctn()
//
val s1es = f0_s0es(s0es)
val s1e0 =
fxitmlst_resolve_s1exp(loc0, s1es)
}
//
|
_(*otherwise*) => FXITMatm(s1exp_none1(s0e0))
//
) (*case+*) // end of [f0_sexp(s0e0)]
//
and
f0_int
(s0e0: s0exp): s1efx =
let
val
loc0 = s0e0.lctn()
val-
S0Eint
( int ) = s0e0.node() in
FXITMatm
(
s1exp(loc0,S1Eint(trans01_t0int(int)))
)
end // end of [let] // end of [f0_int]
//
and
f0_chr
(s0e0: s0exp): s1efx =
let
val
loc0 = s0e0.lctn()
val-
S0Echr
( chr ) = s0e0.node() in
FXITMatm
(
s1exp(loc0,S1Echr(trans01_t0chr(chr)))
)
end // end of [let] // end of [f0_chr]
//
and
f0_flt
(s0e0: s0exp): s1efx =
let
val
loc0 = s0e0.lctn()
val-
S0Eflt
( flt ) = s0e0.node() in
FXITMatm
(
s1exp(loc0,S1Eflt(trans01_t0flt(flt)))
)
end // end of [let] // end of [f0_flt]
//
and
f0_str
(s0e0: s0exp): s1efx =
let
val
loc0 = s0e0.lctn()
val-
S0Estr
( str ) = s0e0.node() in
FXITMatm
(
s1exp(loc0,S1Estr(trans01_t0str(str)))
)
end // end of [let] // end of [f0_str]
//
and
f0_s0es
(s0es: s0explst): s1efxlst =
list_map<s0exp><s1efx>(s0es) where
{
#impltmp map$fopr<s0exp><s1efx> = f0_sexp
} (* end of [f0_s0es] *)
//
} (*where*) // end of [trans01_s0exp(s0e0)]

(* ****** ****** *)

#implfun
trans01_s0arg
  (s0a0) =
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
trans01_i0dnt(sid1)
val
tres =
trans01_sort0opt(tres)
in//let
s1arg
(loc0, S1ARGsome(sid1, tres))
end (*let*) // S0ARGsome(_, _)
) (*case+*) // end of [trans01_s0arg(s0a0)]

(* ****** ****** *)

#implfun
trans01_s0mag
  (s0ma) = let
//
val loc0 = s0ma.lctn()
//
(*
val () =
prerrln
("trans01_s0mag: s0ma = ", s0ma)
*)
//
in
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
  sid = trans01_i0dnt(sid)
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
  s1as = trans01_s0arglst(s0as)
in
  s1mag_make_node(loc0, S1MAGlist(s1as))
end (*let*) // end of [S0MAGlist]
//
end (*let*) // end of [trans01_s0mag(s0ma)]

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
trans01_sort0opt
  (opt0) =
(
optn_map
<sort0><sort1>(opt0)) where
{
#impltmp
map$fopr<sort0><sort1> = trans01_sort0
} (*where*) // end of [trans01_sort0opt(opt0)]

(* ****** ****** *)

#implfun
trans01_s0arglst
  (s0as) =
(
list_map
<s0arg><s1arg>(s0as)) where
{
#impltmp
map$fopr<s0arg><s1arg> = trans01_s0arg
} (*where*) // end of [trans01_s0arglst(s0as)]

(* ****** ****** *)

#implfun
trans01_s0maglst
  (smas) =
(
list_map
<s0mag><s1mag>(smas)) where
{
#impltmp
map$fopr<s0mag><s1mag> = trans01_s0mag
} (*where*) // end of [trans01_s0maglst(smas)]

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

#implfun
trans01_s0expopt
  (opt0) =
(
optn_map
<s0exp><s1exp>(opt0)) where
{
#impltmp
map$fopr<s0exp><s1exp> = trans01_s0exp
} (*where*) // end of [trans01_s0explst(opt0)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_trans01_staexp.dats] *)
