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
//
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with g1exp_get_lctn
#symload node with g1exp_get_node
(* ****** ****** *)
#symload lctn with sort1_get_lctn
#symload node with sort1_get_node
(* ****** ****** *)
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
(* ****** ****** *)
#symload lctn with s1arg_get_lctn
#symload node with s1arg_get_node
#symload lctn with s1mag_get_lctn
#symload node with s1mag_get_node
#symload lctn with t1arg_get_lctn
#symload node with t1arg_get_node
#symload lctn with t1mag_get_lctn
#symload node with t1mag_get_node
(* ****** ****** *)
#symload lctn with s1qua_get_lctn
#symload node with s1qua_get_node
(* ****** ****** *)
#symload lctn with s1tdf_get_lctn
#symload node with s1tdf_get_node
(* ****** ****** *)
//
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
g1exp_errvl_lst
(ges: g1explst): sint
//
#implfun
g1exp_errvl_lst(ges) =
(
case+ ges of
|
list_nil((*nil*)) => 0
|
list_cons(ge1,ges) =>
(
gmax
(errvl(ge1),g1exp_errvl_lst(ges)))
endcas // end of [ case+(ges) ]
)
//
#symload errvl with g1exp_errvl_lst
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
val lvl = gmax
(errvl(ge1), errvl(ge2))
in//let
g1exp_errck
(lvl+1, g1exp(loc, G1Ea1pp(ge1, ge2)))
endlet // end of [g1exp_a1pp_errck(...)]
(* ****** ****** *)
fun
g1exp_a2pp_errck
(loc: loc_t
,ge1: g1exp
,ge2: g1exp
,ge3: g1exp): g1exp =
let
val lvl = gmax
( errvl(ge1)
, errvl(ge2), errvl(ge3))
in//let
g1exp_errck
(lvl+1,g1exp(loc,G1Ea2pp(ge1,ge2,ge3)))
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
(lvl+1, g1exp( loc , G1Elist( ges ) ))
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
val lvl = gmax
( errvl(ge1)
, errvl(ge2), errvl(ge3))
in//let
g1exp_errck
(lvl+1, g1exp(loc,G1Eif0(ge1,ge2,ge3)))
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
G1Eif0(_,_,_) =>
f0_cond(g1e0, err)
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
val loc = g1e.lctn()
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
g1exp_cond_errck(loc,g1e1,g1e2,g1e3)
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
//
fun
sort1_errvl_opt
( opt
: sort1opt): sint =
(
case+ opt of
|
optn_nil((*nil*)) => 0
|
optn_cons(st1) => errvl(st1)
endcas // end of [ case+(sts) ]
)
//
#symload
sort1_errvl with sort1_errvl_opt
#symload errvl with sort1_errvl_opt
//
(* ****** ****** *)
//
#extern
fun
sort1_errvl_lst
(sts: sort1lst): sint
//
#implfun
sort1_errvl_lst
(  sts  ) =
(
case+ sts of
|
list_nil((*nil*)) => 0
|
list_cons(st1,sts) =>
(
gmax
(errvl(st1),sort1_errvl_lst(sts)))
endcas // end of [ case+(sts) ]
)
//
#symload
sort1_errvl with sort1_errvl_lst
#symload errvl with sort1_errvl_lst
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
val lvl = gmax
(errvl(st1), errvl(st2))
in//let
sort1_errck
(lvl+1,sort1(loc, S1Ta1pp(st1, st2)))
endlet // end of [sort1_a1pp_errck(...)]
(* ****** ****** *)
fun
sort1_a2pp_errck
(loc: loc_t
,st1: sort1
,st2: sort1
,st3: sort1): sort1 =
let
val lvl = gmax
( errvl(st1)
, errvl(st2), errvl(st3))
in//let
sort1_errck
(lvl+1,sort1(loc,S1Ta2pp(st1,st2,st3)))
endlet // end of [sort1_a2pp_errck(...)]
(* ****** ****** *)
fun
sort1_list_errck
( loc
: loc_t
, sts
: sort1lst ): sort1 =
let
val lvl = errvl(sts)
in//let
sort1_errck
(lvl+1, sort1( loc , S1Tlist( sts ) ))
endlet // end of [sort1_list_errck(...)]
(* ****** ****** *)
fun
sort1_qual_errck
( loc: loc_t
, tok1: token
, s1t2: sort1): sort1 =
let
val lvl = errvl(s1t2)
in//let
sort1_errck
(lvl+1, sort1(loc, S1Tqual(tok1,s1t2)))
endlet // end of [sort1_qual_errck(...)]
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
|
S1Tlist(s1ts) =>
let
val e00 = err
val s1ts =
  tread01_sort1lst(s1ts, err)
in//let
if
(e00=err)
then (s1t0)
else sort1_list_errck( loc0, s1ts )
endlet // end of [ S1Tlist( s1ts ) ]
//
|
S1Tqual(tok1, s1t2) =>
let
val e00 = err
val s1t2 = tread01_sort1(s1t2, err)
in//let
if
(e00=err)
then (s1t0) else
sort1_qual_errck( loc0, tok1, s1t2 )
endlet // end of [S1Tqual(tok1,s1t2)]
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
(*
val (  ) =
prerrln("tread01_sort1: loc0 = ", loc0)
val (  ) =
prerrln("tread01_sort1: s1t0 = ", s1t0)
*)
//
} (*where*) // end of [tread01_sort1(s1t0,err)]

(* ****** ****** *)
//
fun
s1exp_errck
(lvl: sint
,s1e: s1exp): s1exp =
(
s1exp
(s1e.lctn(), S1Eerrck(lvl, s1e)))
//
(* ****** ****** *)
//
fun
s1exp_errvl_a1
(s1e: s1exp): sint =
(
case+ s1e.node() of
|
S1Eerrck
(lvl, _) => lvl | _ => 0
)
#symload
s1exp_errvl with s1exp_errvl_a1
#symload errvl with s1exp_errvl_a1
//
(* ****** ****** *)
//
fun
s1exp_errvl_a2
(se1: s1exp
,se2: s1exp): sint =
gmax
(errvl(se1),errvl(se2))
#symload
s1exp_errvl with s1exp_errvl_a2
#symload errvl with s1exp_errvl_a2
//
(* ****** ****** *)
//
#extern
fun
s1exp_errvl_lst
(ses: s1explst): sint
//
#implfun
s1exp_errvl_lst(ses) =
(
case+ ses of
|
list_nil((*nil*)) => 0
|
list_cons(se1,ses) =>
(
gmax
(errvl(se1),s1exp_errvl_lst(ses)))
endcas // end of [ case+(ses) ]
)
//
#symload errvl with s1exp_errvl_lst
//
(* ****** ****** *)
//
#extern
fun
l1s1e_errvl_lses
(lses: l1s1elst): sint
//
#implfun
l1s1e_errvl_lses
(   lses   ) =
(
case+ lses of
|
list_nil((*nil*)) => 0
|
list_cons(lse1,lses) =>
let
val+
S1LAB(lab, se1) = lse1 in
gmax
( errvl(se1)
, l1s1e_errvl_lses(lses)) end
endcas // end of [ case+(lses) ]
)
//
#symload errvl with l1s1e_errvl_lses
//
(* ****** ****** *)
fun
s1exp_b0sh_errck
(loc: loc_t): s1exp =
s1exp_errck
(1, s1exp(loc, S1Eb0sh()))
(* ****** ****** *)
fun
s1exp_b1sh_errck
(loc: loc_t
,s1e: s1exp): s1exp =
s1exp_errck
(1, s1exp(loc, S1Eb1sh(s1e)))
(* ****** ****** *)
fun
s1exp_a0pp_errck
(loc: loc_t): s1exp =
s1exp_errck(1,s1exp(loc,S1Ea0pp()))
(* ****** ****** *)
fun
s1exp_a1pp_errck
(loc: loc_t
,se1: s1exp
,se2: s1exp): s1exp =
let
val lvl = gmax
(errvl(se1), errvl(se2))
in//let
s1exp_errck
(lvl+1, s1exp(loc, S1Ea1pp(se1, se2)))
endlet // end of [s1exp_a1pp_errck(...)]
(* ****** ****** *)
fun
s1exp_a2pp_errck
(loc: loc_t
,se1: s1exp
,se2: s1exp
,se3: s1exp): s1exp =
let
val lvl = gmax
( errvl(se1)
, errvl(se2), errvl(se3))
in//let
s1exp_errck
(lvl+1,s1exp(loc,S1Ea2pp(se1,se2,se3)))
endlet // end of [s1exp_a2pp_errck(...)]
(* ****** ****** *)
fun
s1exp_l1st_errck
( loc
: loc_t
, ses
: s1explst ): s1exp =
let
val lvl = errvl(ses)
in//let
s1exp_errck
(lvl+1, s1exp( loc , S1El1st( ses ) ))
endlet // end of [s1exp_l1st_errck(...)]
(* ****** ****** *)
fun
s1exp_l2st_errck
( loc
: loc_t
, ses1
: s1explst 
, ses2
: s1explst ): s1exp =
let
val lvl = gmax
(errvl(ses1), errvl(ses2))
in//let
s1exp_errck
(lvl+1, s1exp(loc, S1El2st(ses1,ses2)))
endlet // end of [s1exp_l2st_errck(...)]
(* ****** ****** *)
fun
s1exp_t1up_errck
( loc
: loc_t
, tknd
: token
, s1es
: s1explst ): s1exp =
let
val lvl = errvl(s1es)
in//let
s1exp_errck
(lvl+1, s1exp(loc, S1Et1up(tknd,s1es)))
endlet // end of [s1exp_t1up_errck(...)]
(* ****** ****** *)
fun
s1exp_t2up_errck
( loc
: loc_t
, tknd
: token
, ses1
: s1explst
, ses2
: s1explst ): s1exp =
let
val lvl = gmax
(errvl(ses1), errvl(ses2))
in//let
s1exp_errck
(lvl+1
,s1exp(loc, S1Et2up(tknd, ses1, ses2)))
endlet // end of [s1exp_t2up_errck(...)]
(* ****** ****** *)
fun
s1exp_r1cd_errck
( loc
: loc_t
, tknd
: token
, lses
: l1s1elst ): s1exp =
let
val lvl = errvl(lses)
in//let
s1exp_errck
(lvl+1, s1exp(loc, S1Er1cd(tknd,lses)))
endlet // end of [s1exp_r1cd_errck(...)]
(* ****** ****** *)
fun
s1exp_r2cd_errck
( loc
: loc_t
, tknd
: token
, lss1
: l1s1elst
, lss2
: l1s1elst ): s1exp =
let
val lvl = gmax
(errvl(lss1), errvl(lss2))
in//let
s1exp_errck
(lvl+1
,s1exp(loc, S1Er2cd(tknd, lss1, lss2)))
endlet // end of [s1exp_r2cd_errck(...)]
(* ****** ****** *)
fun
s1exp_uni0_errck
( loc
: loc_t
, s1qs
: s1qualst): s1exp =
let
val lvl = 0 // errvl(s1qs)
in//let
s1exp_errck
(lvl+1, s1exp( loc , S1Euni0( s1qs ) ))
endlet // end of [s1exp_uni0_errck(...)]
(* ****** ****** *)
fun
s1exp_exi0_errck
( loc
: loc_t
, tknd
: token
, s1qs
: s1qualst): s1exp =
let
val lvl = 0 // errvl(s1qs)
in//let
s1exp_errck
(lvl+1, s1exp(loc,S1Eexi0(tknd, s1qs)))
endlet // end of [s1exp_exi0_errck(...)]
(* ****** ****** *)
fun
s1exp_lam0_errck
( loc
: loc_t
, smas
: s1maglst
, tres
: sort1opt
, s1e1: s1exp): s1exp =
let
val lvl = gmax
(errvl(tres), errvl(s1e1))
in//let
s1exp_errck
(lvl,s1exp(loc,S1Elam0(smas,tres,s1e1)))
endlet // end of [s1exp_lam0_errck(...)]
(* ****** ****** *)
fun
s1exp_anno_errck
( loc: loc_t
, s1e1: s1exp
, s1t2: sort1): s1exp =
let
val lvl = gmax
(errvl(s1e1), errvl(s1t2))
in//let
s1exp_errck
(lvl, s1exp(loc, S1Eanno(s1e1, s1t2)))
endlet // end of [s1exp_anno_errck(...)]
(* ****** ****** *)
fun
s1exp_qual_errck
( loc: loc_t
, tok1: token
, s1e2: s1exp): s1exp =
let
val lvl = errvl(s1e2)
in//let
s1exp_errck
(lvl+1, s1exp(loc, S1Equal(tok1,s1e2)))
endlet // end of [s1exp_qual_errck(...)]
(* ****** ****** *)

#implfun
tread01_s1exp
( s1e0, err ) =
(
case+
s1e0.node() of
//
| S1Eid0 _ => s1e0
//
| S1Eint _ => s1e0
| S1Echr _ => s1e0
| S1Eflt _ => s1e0
| S1Estr _ => s1e0
//
| S1Eb0sh() =>
( err := err+1
; s1exp_b0sh_errck(loc0))
| S1Eb1sh(s1e1) =>
let
//
val s1e1 =
  tread01_s1exp(s1e1, err)
//
in//let
( err := err+1
; s1exp_b1sh_errck(loc0,s1e1))
endlet // end of [S1Eb1sh(s1e1)]
//
| S1Ea0pp() =>
(
s1exp_a0pp_errck(loc0)
) where
{ val () = ( err := err + 1 ) }
//
|
S1Ea1pp(s1e1,s1e2) =>
let
//
val e00 = err
//
val
s1e1 = tread01_s1exp(s1e1, err)
val
s1e2 = tread01_s1exp(s1e2, err)
//
in//let
if
(e00=err)
then (s1e0) else
s1exp_a1pp_errck(loc0, s1e1, s1e2)
endlet // end of [S1Ea1pp(s1e1,s1e2)]
//
|
S1Ea2pp
(s1e1, s1e2, s1e3) =>
let
//
val e00 = err
//
val
s1e1 = tread01_s1exp(s1e1, err)
val
s1e2 = tread01_s1exp(s1e2, err)
val
s1e3 = tread01_s1exp(s1e3, err)
//
in//let
if
(e00=err)
then (s1e0) else
s1exp_a2pp_errck(loc0,s1e1,s1e2,s1e3)
endlet//end-(S1Ea2pp(s1e1,s1e2,s1e3))
//
|
S1El1st(s1es) =>
let
//
val e00 = err
//
val s1es =
  tread01_s1explst(s1es, err)
//
in//let
if
(e00=err)
then (s1e0)
else s1exp_l1st_errck(loc0, s1es )
endlet // end of [ S1El1st( s1es ) ]
|
S1El2st(ses1,ses2) =>
let
//
val e00 = err
//
val ses1 =
  tread01_s1explst(ses1, err)
val ses2 =
  tread01_s1explst(ses2, err)
//
in//let
if
(e00=err)
then (s1e0) else
s1exp_l2st_errck(loc0, ses1, ses2)
endlet // end of [S1El2st(ses1,ses2)]
//
|
S1Et1up(tknd,s1es) =>
let
//
val e00 = err
//
val s1es =
  tread01_s1explst(s1es, err)
//
in//let
if
(e00=err)
then (s1e0) else
s1exp_t1up_errck(loc0, tknd, s1es)
endlet // end of [S1Et1up(tknd,s1es)]
|
S1Et2up
(tknd, ses1, ses2) =>
let
//
val e00 = err
//
val ses1 =
  tread01_s1explst(ses1, err)
val ses2 =
  tread01_s1explst(ses2, err)
//
in//let
if
(e00=err)
then (s1e0) else
s1exp_t2up_errck(loc0,tknd,ses1,ses2)
endlet // end(S1Et2up(tknd,ses1,ses2))
//
|
S1Er1cd(tknd,lses) =>
let
//
val e00 = err
//
val lses =
  tread01_l1s1elst(lses, err)
//
in//let
if
(e00=err)
then (s1e0) else
s1exp_r1cd_errck(loc0, tknd, lses)
endlet // end of [S1Er1cd(tknd,lses)]
|
S1Er2cd
(tknd, lss1, lss2) =>
let
//
val e00 = err
//
val
lss1 = tread01_l1s1elst(lss1, err)
val
lss2 = tread01_l1s1elst(lss2, err)
//
in//let
if
(e00=err)
then (s1e0) else
s1exp_r2cd_errck(loc0,tknd,lss1,lss2)
endlet // end(S1Er2cd(tknd,lss1,lss2))
//
|
S1Euni0(s1qs) =>
let
val e00 = err
val s1qs =
  tread01_s1qualst(s1qs, err)
in//let
if
(e00=err)
then (s1e0)
else s1exp_uni0_errck(loc0,s1qs)
endlet // end of [ S1Euni0(s1qs) ]
|
S1Eexi0(tknd,s1qs) =>
let
val e00 = err
val s1qs =
  tread01_s1qualst(s1qs, err)
in//let
if
(e00=err)
then (s1e0)
else s1exp_exi0_errck(loc0,tknd,s1qs)
endlet // end of [ S1Eexi0(tknd,s1qs) ]
//
|
S1Elam0 _ =>
f0_lam0(s1e0, err)
//
|
S1Eanno(s1e1,s1t2) =>
let
val e00 = err
val s1e1 =
  tread01_s1exp(s1e1, err)
val s1t2 =
  tread01_sort1(s1t2, err)
in//let
if
(e00=err)
then (s1e0)
else s1exp_anno_errck(loc0,s1e1,s1t2)
endlet // end of [S1Eanno(s1e1, s1t2)]
//
|
S1Equal(tok1, s1e2) =>
let
//
val e00 = err
//
val
s1e2 = tread01_s1exp(s1e2, err)
//
in//let
if
(e00=err)
then (s1e0) else
s1exp_qual_errck( loc0, tok1, s1e2 )
endlet // end of [S1Equal(tok1,s1e2)]
//
| _(* otherwise *) =>
let
val lvl = 1
in//let
(err := err+1; s1exp_errck(lvl, s1e0))
endlet // end of [ _(* otherwise *) ]
//
) where // end-of-[ case(s1e0.node()) ]
{
(* ****** ****** *)
//
val loc0 = s1e0.lctn()
//
(* ****** ****** *)
//
fun
f0_lam0
( s1e: s1exp
, err: &sint >> _): s1exp =
let
//
val e00 = err
val loc = s1e.lctn()
//
val-
S1Elam0
( smas
, tres, s1e1) = s1e.node()
//
val smas =
tread01_s1maglst(smas, err)
val tres =
tread01_sort1opt(tres, err)
//
val
s1e1 = tread01_s1exp(s1e1, err)
//
in//let
if
(e00=err)
then (s1e) else
s1exp_lam0_errck(loc,smas,tres,s1e1)
endlet // end of [ f0_lam0( s1e,err ) ]
//
(* ****** ****** *)
(*
val (  ) =
prerrln("tread01_s1exp: loc0 = ", loc0)
val (  ) =
prerrln("tread01_s1exp: s1e0 = ", s1e0)
*)
(* ****** ****** *)
//
} (*where*) // end of [tread01_s1exp(s1e0,err)]

(* ****** ****** *)
//
#implfun
tread01_l1s1e
  (ls1e, err) =
let
//
val e00 = err
//
val+
S1LAB(lab,s1e) = ls1e
val s1e = tread01_s1exp(s1e, err)
//
in//let
if
(e00=err) then ls1e else S1LAB(lab,s1e)
endlet // end of [tread01_l1s1e(ls1e,err)]
//
(* ****** ****** *)
//
#implfun
tread01_s1arg
( s1a1, err ) =
(
case+
s1a1.node() of
|
S1ARGsome
(sid0,tres) =>
let
//
val e00 = err
//
val tres =
tread01_sort1opt(tres, err)
//
in//let
if
(e00=err)
then (s1a1) else
s1arg_make_node
(s1a1.lctn(), S1ARGsome(sid0, tres))
endlet // end of [S1ARGsome(sid0,tres)]
) (*case+*) // end of [tread01_s1arg(s1a1,err)]
//
(* ****** ****** *)
//
#implfun
tread01_s1mag
  (s1ma, err) =
(
case+
s1ma.node() of
|
S1MAGlist(s1as) =>
let
val e00 = err
val s1as =
tread01_s1arglst(s1as, err)
in//let
if
(e00=err)
then (s1ma) else
s1mag(s1ma.lctn(), S1MAGlist(s1as))
endlet // end of [ S1MAGlist( s1as ) ]
) (*case+*) // end of [tread01_s1mag(s1ma,err)]
//
(* ****** ****** *)
//
#implfun
tread01_t1arg
( t1a1, err ) =
(
case+
t1a1.node() of
|
T1ARGsome
(s1t1, topt) =>
let
//
val e00 = err
//
val
s1t1 = tread01_sort1(s1t1, err)
//
in//let
if
(e00=err)
then (t1a1) else
t1arg_make_node
(t1a1.lctn(), T1ARGsome(s1t1, topt))
endlet // end of [T1ARGsome(s1t1,topt)]
) (*case+*) // end of [tread01_t1arg(t1a1,err)]
//
(* ****** ****** *)
//
#implfun
tread01_t1mag
  (t1ma, err) =
(
case+
t1ma.node() of
|
T1MAGlist(t1as) =>
let
val e00 = err
val t1as =
tread01_t1arglst(t1as, err)
in//let
if
(e00=err)
then (t1ma) else
t1mag(t1ma.lctn(), T1MAGlist(t1as))
endlet // end of [ T1MAGlist( t1as ) ]
) (*case+*) // end of [tread01_t1mag(t1ma,err)]
//
(* ****** ****** *)
//
#implfun
tread01_s1qua
  (s1q0, err) =
(
case+
s1q0.node() of
|
S1QUAprop(s1e1) =>
let
//
val e00 = err
//
val s1e1 =
tread01_s1exp(s1e1, err)
//
in//let
if
(e00=err)
then (s1q0)
else
s1qua_make_node
(s1q0.lctn(), S1QUAprop(s1e1))
endlet // end of [S1QUAprop(s1e1)]
|
S1QUAvars(toks,tres) =>
let
//
val e00 = err
//
val tres =
tread01_sort1opt(tres, err)
//
in//let
if
(e00=err)
then (s1q0)
else
s1qua_make_node
(s1q0.lctn(), S1QUAvars(toks,tres))
endlet // end of [S1QUAvars(toks,tres)]
) (*case+*) // end of [tread01_s1qua(s1q0,err)]
//
(* ****** ****** *)
//
#implfun
tread01_s1uni
  (s1u0, err) =
(
case+
s1u0.node() of
|
S1UNIsome(s1qs) =>
let
//
val e00 = err
//
val s1qs =
tread01_s1qualst(s1qs, err)
in//let
if
(e00=err)
then (s1u0) else
s1uni(s1u0.lctn(), S1UNIsome(s1qs))
endlet // end of [ S1UNIsome( s1qs ) ]
) (*case+*) // end of [tread01_s1uni(s1u0,err)]
//
(* ****** ****** *)
//
#implfun
tread01_s1tdf
  (stdf, err) =
(
case+
stdf.node() of
|
S1TDFsort(s1t1) =>
let
//
val e00 = err
//
val s1t1 =
tread01_sort1(s1t1, err)
in
if
(e00=err)
then (stdf) else
s1tdf(stdf.lctn(),S1TDFsort(s1t1))
endlet // end of [ S1TDFsort(s1t1) ]
|
S1TDFtsub
(s1a1, s1ps) =>
let
//
val e00 = err
//
val
s1a1 = tread01_s1arg(s1a1, err)
val
s1ps = tread01_s1explst(s1ps, err)
//
in//let
if
(e00=err)
then (stdf)
else
s1tdf_make_node
(stdf.lctn(), S1TDFtsub(s1a1, s1ps))
endlet // end of [S1TDFtsub(s1as,s1ps)]
//
) (*case*)//end-of-[tread01_s1tdf(stdf,err)]
//
(* ****** ****** *)
//
#implfun
tread01_g1explst
  (  g1es, err  ) =
list_tread01_fnp(g1es, err, tread01_g1exp)
#implfun
tread01_g1expopt
  (  gopt, err  ) =
optn_tread01_fnp(gopt, err, tread01_g1exp)
//
(* ****** ****** *)
//
#implfun
tread01_sort1lst
  (  s1ts, err  ) =
list_tread01_fnp(s1ts, err, tread01_sort1)
#implfun
tread01_sort1opt
  (  topt, err  ) =
optn_tread01_fnp(topt, err, tread01_sort1)
//
(* ****** ****** *)
//
#implfun
tread01_s1explst
  (  s1es, err  ) =
list_tread01_fnp(s1es, err, tread01_s1exp)
#implfun
tread01_s1expopt
  (  sopt, err  ) =
optn_tread01_fnp(sopt, err, tread01_s1exp)
//
(* ****** ****** *)
#implfun
tread01_l1s1elst
  (  lses, err  ) =
list_tread01_fnp(lses, err, tread01_l1s1e)
(* ****** ****** *)
//
#implfun
tread01_s1arglst
  (  s1as, err  ) =
list_tread01_fnp(s1as, err, tread01_s1arg)
#implfun
tread01_s1maglst
  (  smas, err  ) =
list_tread01_fnp(smas, err, tread01_s1mag)
//
(* ****** ****** *)
//
#implfun
tread01_t1arglst
  (  t1as, err  ) =
list_tread01_fnp(t1as, err, tread01_t1arg)
#implfun
tread01_t1maglst
  (  tmas, err  ) =
list_tread01_fnp(tmas, err, tread01_t1mag)
//
(* ****** ****** *)
#implfun
tread01_s1qualst
  (  s1qs, err  ) =
list_tread01_fnp(s1qs, err, tread01_s1qua)
(* ****** ****** *)
#implfun
tread01_s1unilst
  (  s1us, err  ) =
list_tread01_fnp(s1us, err, tread01_s1uni)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_tread01_staexp.dats] *)
