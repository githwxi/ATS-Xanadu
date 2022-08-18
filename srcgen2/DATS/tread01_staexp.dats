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
Mon Aug 15 17:33:54 EDT 2022
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
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)
#staload "./../SATS/tread01.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with g1exp_get_lctn
#symload node with g1exp_get_node
(* ****** ****** *)
//
fun
g1exp_errck
(lvl: sint
,g1e: g1exp): g1exp =
(
g1exp
(g1e.lctn(), G1Eerrck(lvl, g1e)))
//
(* ****** ****** *)
//
fun
g1exp_errvl_a1
(g1e: g1exp): sint =
(
case+ g1e.node() of
|
G1Eerrck
(lvl, _) => lvl | _ => 0
)
#symload
g1exp_errvl with g1exp_errvl_a1
#symload errvl with g1exp_errvl_a1
//
(* ****** ****** *)
//
fun
g1exp_errvl_a2
(ge1: g1exp
,ge2: g1exp): sint =
gmax
(errvl(ge1),errvl(ge2))
#symload
g1exp_errvl with g1exp_errvl_a2
#symload errvl with g1exp_errvl_a2
//
(* ****** ****** *)
//
#extern
fun
g1exp_errvl_ges
(ges: g1explst): sint
//
#implfun
g1exp_errvl_ges(ges) =
(
case+ ges of
|
list_nil((*nil*)) => 0
|
list_cons(ge1,ges) =>
(
gmax
( errvl(ge1),g1exp_errvl_ges(ges)))
endcas // end of [ case+(ges) ]
)
//
#symload errvl with g1exp_errvl_ges
//
(* ****** ****** *)
fun
g1exp_b0sh_errck
(loc: loc_t): g1exp =
g1exp_errck
(1, g1exp(loc, G1Eb0sh()))
(* ****** ****** *)
fun
g1exp_b1sh_errck
(loc: loc_t
,g1e: g1exp): g1exp =
g1exp_errck
(1, g1exp(loc, G1Eb1sh(g1e)))
(* ****** ****** *)
fun
g1exp_a0pp_errck
(loc: loc_t): g1exp =
g1exp_errck(1,g1exp(loc,G1Ea0pp()))
(* ****** ****** *)
fun
g1exp_a1pp_errck
(loc: loc_t
,ge1: g1exp
,ge2: g1exp): g1exp =
let
val lvl =
gmax
(errvl(ge1), errvl(ge2))
in//let
g1exp_errck
(lvl, g1exp(loc, G1Ea1pp(ge1, ge2)))
endlet // end of [g1exp_a1pp_errck(...)]
(* ****** ****** *)
fun
g1exp_a2pp_errck
(loc: loc_t
,ge1: g1exp
,ge2: g1exp
,ge3: g1exp): g1exp =
let
val lvl =
gmax
( errvl(ge1)
, errvl(ge2), errvl(ge3))
in//let
g1exp_errck
(lvl,g1exp(loc,G1Ea2pp(ge1,ge2,ge3)))
endlet // end of [g1exp_a2pp_errck(...)]
(* ****** ****** *)
fun
g1exp_list_errck
( loc
: loc_t
, ges
: g1explst ): g1exp =
let
val lvl = errvl(ges)
in//let
g1exp_errck
(lvl , g1exp( loc , G1Elist( ges ) ))
endlet // end of [g1exp_list_errck(...)]
(* ****** ****** *)
fun
g1exp_cond_errck
( loc
: loc_t
, ge1: g1exp
, ge2: g1exp
, ge3: g1exp): g1exp =
let
val lvl =
gmax
(errvl(ge1)
,errvl(ge2),errvl(ge3))
in//let
g1exp_errck
(lvl , g1exp(loc,G1Eif0(ge1,ge2,ge3)))
endlet // end of [g1exp_cond_errck(...)]
(* ****** ****** *)

#implfun
tread01_g1exp
( g1e0, err ) =
(
case+
g1e0.node() of
//
| G1Eid0 _ => g1e0
//
| G1Eint _ => g1e0
| G1Echr _ => g1e0
| G1Eflt _ => g1e0
| G1Estr _ => g1e0
//
| G1Eb0sh() =>
( err := err+1
; g1exp_b0sh_errck(loc0))
| G1Eb1sh(g1e1) =>
let
//
val g1e1 =
  tread01_g1exp(g1e1, err)
//
in//let
( err := err+1
; g1exp_b1sh_errck(loc0,g1e1))
endlet // end of [G1Eb1sh(g1e1)]
//
| G1Ea0pp() =>
(
g1exp_a0pp_errck(loc0)
) where
{ val () = ( err := err + 1 ) }
//
|
G1Ea1pp(g1e1, g1e2) =>
let
//
val e00 = err
//
val g1e1 =
  tread01_g1exp(g1e1, err)
val g1e2 =
  tread01_g1exp(g1e2, err)
in//let
if
(e00=err)
then (g1e0) else
g1exp_a1pp_errck(loc0, g1e1, g1e2)
endlet // end of [G1Ea1pp(g1e1,g1e2)]
//
|
G1Ea2pp
(g1e1, g1e2, g1e3) =>
let
//
val e00 = err
//
val g1e1 =
  tread01_g1exp(g1e1, err)
val g1e2 =
  tread01_g1exp(g1e2, err)
val g1e3 =
  tread01_g1exp(g1e3, err)
in//let
if
(e00=err)
then (g1e0) else
g1exp_a2pp_errck(loc0,g1e1,g1e2,g1e3)
endlet // end-[G1Ea2pp(g1e1,g1e2,g1e3)]
//
|
G1Elist(g1es) =>
let
val e00 = err
val g1es =
  tread01_g1explst(g1es, err)
in//let
if
(e00=err)
then (g1e0)
else g1exp_list_errck(loc0, g1es )
endlet // end of [ G1Elist( g1es ) ]
//
|
G1Eif0(_,_,_) => f0_cond(g1e0, err)
//
| _(*otherwise*) =>
let
val lvl = 1
in//let
(err := err+1; g1exp_errck(lvl, g1e0))
endlet // end of [ _(* otherwise *) ]
//
) where // end-of-[ case(g1e0.node()) ]
{
//
val loc0 = g1e0.lctn()
//
fun
f0_cond
(g1e: g1exp
,err: &sint >> _): g1exp =
let
//
val e00 = err
//
val-
G1Eif0
(g1e1,g1e2,g1e3) = g1e.node()
//
val
g1e1 = tread01_g1exp(g1e1, err)
val
g1e2 = tread01_g1exp(g1e2, err)
val
g1e3 = tread01_g1exp(g1e3, err)
//
in//let
if
(e00=err)
then (g1e) else
g1exp_cond_errck(loc0,g1e1,g1e2,g1e3)
endlet // end-of-[ f0_cond(g1e,err) ]
//
(*
val (  ) =
prerrln("tread01_g1exp: loc0 = ", loc0)
val (  ) =
prerrln("tread01_g1exp: g1e0 = ", g1e0)
*)
//
} (*where*) // end of [tread01_g1exp(g1e0,err)]

(* ****** ****** *)
fun
sort1_errck
(lvl: sint
,s1t: sort1): sort1 =
(
sort1
(s1t.lctn(), S1Terrck(lvl, s1t)))
(* ****** ****** *)
//
fun
sort1_errvl_a1
(s1t: sort1): sint =
(
case+ s1t.node() of
|
S1Terrck
(lvl, _) => lvl | _ => 0
)
#symload
sort1_errvl with sort1_errvl_a1
#symload errvl with sort1_errvl_a1
//
(* ****** ****** *)
//
fun
sort1_errvl_a2
(st1: sort1
,st2: sort1): sint =
gmax
(errvl(st1),errvl(st2))
#symload
sort1_errvl with sort1_errvl_a2
#symload errvl with sort1_errvl_a2
//
(* ****** ****** *)
fun
sort1_a0pp_errck
(loc: loc_t): sort1 =
sort1_errck(1,sort1(loc,S1Ta0pp()))
(* ****** ****** *)
fun
sort1_a1pp_errck
(loc: loc_t
,st1: sort1
,st2: sort1): sort1 =
let
val lvl =
gmax
(errvl(st1), errvl(st2))
in//let
sort1_errck
(lvl, sort1(loc, S1Ta1pp(st1, st2)))
endlet // end of [sort1_a1pp_errck(...)]
(* ****** ****** *)
fun
sort1_a2pp_errck
(loc: loc_t
,st1: sort1
,st2: sort1
,st3: sort1): sort1 =
let
val lvl =
gmax
( errvl(st1)
, errvl(st2), errvl(st3))
in//let
sort1_errck
(lvl,sort1(loc,S1Ta2pp(st1,st2,st3)))
endlet // end of [sort1_a2pp_errck(...)]
(* ****** ****** *)

#implfun
tread01_sort1
( s1t0, err ) =
(
case+
s1t0.node() of
//
| S1Tid0 _ => s1t0
//
| S1Tint _ => s1t0
//
| S1Ta0pp() =>
(
sort1_a0pp_errck(loc0)
) where
{ val () = ( err := err + 1 ) }
//
|
S1Ta1pp(s1t1, s1t2) =>
let
//
val e00 = err
//
val s1t1 =
  tread01_sort1(s1t1, err)
val s1t2 =
  tread01_sort1(s1t2, err)
in//let
if
(e00=err)
then (s1t0) else
sort1_a1pp_errck(loc0, s1t1, s1t2)
endlet // end of [S1Ta1pp(s1t1,s1t2)]
//
|
S1Ta2pp
(s1t1, s1t2, s1t3) =>
let
//
val e00 = err
//
val s1t1 =
  tread01_sort1(s1t1, err)
val s1t2 =
  tread01_sort1(s1t2, err)
val s1t3 =
  tread01_sort1(s1t3, err)
in//let
if
(e00=err)
then (s1t0) else
sort1_a2pp_errck(loc0,s1t1,s1t2,s1t3)
endlet // end-[S1Ta2pp(s1t1,s1t2,s1t3)]
//
| _(*otherwise*) =>
let
val lvl = 1
in//let
(err := err+1; sort1_errck(lvl, s1t0))
endlet // end of [ _(* otherwise *) ]
//
) where // end-of-[ case(s1t0.node()) ]
{
//
val loc0 = s1t0.lctn()
//
val (  ) =
prerrln("tread01_sort1: loc0 = ", loc0)
val (  ) =
prerrln("tread01_sort1: s1t0 = ", s1t0)
//
} (*where*) // end of [tread01_sort1(s1t0,err)]

(* ****** ****** *)

#implfun
tread01_g1explst
  (  g1es, err  ) =
list_tread01_fnp(g1es, err, tread01_g1exp)
#implfun
tread01_g1expopt
  (  gopt, err  ) =
optn_tread01_fnp(gopt, err, tread01_g1exp)

(* ****** ****** *)

#implfun
tread01_sort1lst
  (  s1ts, err  ) =
list_tread01_fnp(s1ts, err, tread01_sort1)
#implfun
tread01_sort1opt
  (  topt, err  ) =
optn_tread01_fnp(topt, err, tread01_sort1)

(* ****** ****** *)

#implfun
tread01_s1explst
  (  s1es, err  ) =
list_tread01_fnp(s1es, err, tread01_s1exp)
#implfun
tread01_s1expopt
  (  sopt, err  ) =
optn_tread01_fnp(sopt, err, tread01_s1exp)

(* ****** ****** *)

(* end of [ATS3/XATSOPT_tread01_staexp.dats] *)
