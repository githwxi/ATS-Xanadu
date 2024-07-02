(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2023 Hongwei Xi, ATS Trustful Software, Inc.
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
Fri 28 Jul 2023 09:39:54 PM EDT
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
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/tread33.sats"
(* ****** ****** *)
//
(* ****** ****** *)
#symload styp with x2t2p_get_styp
(* ****** ****** *)
#symload node with s2typ_get_node
#symload sort with s2typ_get_sort
(* ****** ****** *)
#symload lctn with t2jag_get_lctn
#symload t2ps with t2jag_get_t2ps
(* ****** ****** *)
//
(* ****** ****** *)
//
fun
s2typ_errck
(lvl0: sint
,t2p0: s2typ): s2typ =
let
val s2t0 = t2p0.sort()
in//let
s2typ_make_node
(s2t0, T2Perrck(lvl0,t2p0))
end//let//end-of(s2typ_errck)
//
(* ****** ****** *)
//
fun
s2typ_lft_errck
(s2t0: sort2
,t2p1: s2typ): s2typ =
let
val lvl0 = 1
in//let
s2typ_errck
(lvl0, s2typ(s2t0, T2Plft(t2p1)))
end//let//end-of(s2typ_lft_errck(...))
//
(* ****** ****** *)
//
fun
s2typ_top0_errck
(s2t0: sort2
,t2p1: s2typ): s2typ =
let
val lvl0 = 1
in//let
s2typ_errck
(lvl0, s2typ(s2t0, T2Ptop0(t2p1)))
end//let//end-of(s2typ_top0_errck(...))
//
fun
s2typ_top1_errck
(s2t0: sort2
,t2p1: s2typ): s2typ =
let
val lvl0 = 1
in//let
s2typ_errck
(lvl0, s2typ(s2t0, T2Ptop1(t2p1)))
end//let//end-of(s2typ_top1_errck(...))
//
(* ****** ****** *)
//
fun
s2typ_arg1_errck
(s2t0: sort2
,knd0: (int)
,t2p1: s2typ): s2typ =
let
val lvl0 = 1
in//let
s2typ_errck
( lvl0
, s2typ(s2t0, T2Parg1(knd0, t2p1)))
end//let//end-of(s2typ_arg1_errck(...))
//
(* ****** ****** *)
//
fun
s2typ_atx2_errck
(s2t0: sort2
,t2p1: s2typ
,t2p2: s2typ): s2typ =
let
val lvl0 = 1
in//let
s2typ_errck
( lvl0
, s2typ(s2t0, T2Patx2(t2p1, t2p2)))
end//let//end-of(s2typ_atx2_errck(...))
//
(* ****** ****** *)
//
fun
s2typ_apps_errck
(s2t0: sort2
,t2f0: s2typ
,t2ps: s2typlst): s2typ =
let
val lvl0 = 1
in//let
s2typ_errck
( lvl0
, s2typ(s2t0, T2Papps(t2f0, t2ps)))
end//let//end-of(s2typ_apps_errck(...))
//
(* ****** ****** *)
//
fun
s2typ_fun1_errck
(s2t0: sort2
,f2cl: s2typ
,npf1: ( sint )
,t2ps: s2typlst
,tres: ( s2typ )): s2typ =
let
val lvl0 = 1
in//let
s2typ_errck
( lvl0
, s2typ_make_node
  ( s2t0(*sort*)
  , T2Pfun1(f2cl,npf1,t2ps,tres)) )
end//let//end-of(s2typ_fun1_errck(...))
//
(* ****** ****** *)
//
fun
s2typ_exi0_errck
(s2t0: sort2
,s2vs: s2varlst
,t2p1
:s2typ(*scope*)): s2typ =
let
val lvl0 = 1
in//let
s2typ_errck
( lvl0
, s2typ(s2t0, T2Pexi0(s2vs, t2p1)))
end//let//end-of(s2typ_exi0_errck(...))
//
fun
s2typ_uni0_errck
(s2t0: sort2
,s2vs: s2varlst
,t2p1
:s2typ(*scope*)): s2typ =
let
val lvl0 = 1
in//let
s2typ_errck
( lvl0
, s2typ(s2t0, T2Puni0(s2vs, t2p1)))
end//let//end-of(s2typ_uni0_errck(...))
//
(* ****** ****** *)
//
fun
s2typ_text_errck
(s2t0: sort2
,name: (strn)
,t2ps: s2typlst): s2typ =
let
val lvl0 = 1
in//let
s2typ_errck
( lvl0
, s2typ(s2t0, T2Ptext(name, t2ps)))
end//let//end-of(s2typ_text_errck(...))
//
(* ****** ****** *)
//
fun
s2typ_trcd_errck
(s2t0: sort2
,tknd: trcdknd
,npf1: ( int )
,ltps: l2t2plst): s2typ =
let
val lvl0 = 1
in//let
s2typ_errck
( lvl0
, s2typ
  (s2t0, T2Ptrcd(tknd, npf1, ltps)))
end//let//end-of(s2typ_trcd_errck(...))
//
(* ****** ****** *)
//
#implfun
tread33_s2typ
( t2p0, err ) =
(
case+
t2p0.node() of
//
(*
|T2Pbas _ => t2p0
*)
//
|T2Pcst _ => t2p0
|T2Pvar _ => t2p0
//
|T2Plft _ => f0_lft(t2p0, err)
//
|T2Pxtv _ => f0_xtv(t2p0, err)
//
|T2Pf2cl _ => (     t2p0     )
//
|T2Ptop0 _ => f0_top0(t2p0, err)
|T2Ptop1 _ => f0_top1(t2p0, err)
//
|T2Parg1 _ => f0_arg1(t2p0, err)
|T2Patx2 _ => f0_atx2(t2p0, err)
//
|T2Papps _ => f0_apps(t2p0, err)
//
|T2Pfun1 _ => f0_fun1(t2p0, err)
//
|T2Pexi0 _ => f0_exi0(t2p0, err)
|T2Puni0 _ => f0_uni0(t2p0, err)
//
|T2Ptext _ => f0_text(t2p0, err)
//
|T2Ptrcd _ => f0_trcd(t2p0, err)
//
|T2Pnone0 _ => f0_none0(t2p0, err)
|T2Pnone1 _ => f0_none1(t2p0, err)
|T2Ps2exp _ => f0_s2exp(t2p0, err)
//
(*
|
_(* otherwise *) =>
let
val lvl0 = 1
in//let
(
err := err+1; s2typ_errck(lvl0,t2p0))
endlet // end of [ _(* otherwise *) ]
*)
) where // end-of-[(*case+(t2p0)-of*)]
{
//
(* ****** ****** *)
//
fun
f0_lft
( t2p: s2typ
, err: &sint >> _): s2typ =
let
//
val e00 = err
//
val-
T2Plft(t2p1) = t2p.node()
//
val
t2p1 = tread33_s2typ(t2p1, err)
in//let
if
(err=e00)
then (t2p) else
(
  s2typ_lft_errck(t2p.sort(), t2p1))
end(*let*)// end-of-[ f0_lft(t2p,err) ]
//
(* ****** ****** *)
//
fun
f0_xtv
( t2p: s2typ
, err: &sint >> _): s2typ =
let
(*
val e00 = err
*)
val-
T2Pxtv(xtv1) = t2p.node()
in//let
(
tread33_s2typ(xtv1.styp((*0*)),err))
end(*let*)// end-of-[ f0_xtv(t2p,err) ]
//
(* ****** ****** *)
//
fun
f0_top0
( t2p: s2typ
, err: &sint >> _): s2typ =
let
//
val e00 = err
val-
T2Ptop0(t2p1) = t2p.node()
//
val
t2p1 = tread33_s2typ(t2p1, err)
//
in//let
if
(err=e00)
then (t2p) else
(
  s2typ_top0_errck(t2p.sort(),t2p1))
end(*let*)// end-of-[ f0_top0(t2p,err) ]
//
fun
f0_top1
( t2p: s2typ
, err: &sint >> _): s2typ =
let
//
val e00 = err
val-
T2Ptop1(t2p1) = t2p.node()
//
val
t2p1 = tread33_s2typ(t2p1, err)
//
in//let
if
(err=e00)
then (t2p) else
(
  s2typ_top1_errck(t2p.sort(),t2p1))
end(*let*)// end-of-[ f0_top1(t2p,err) ]
//
(* ****** ****** *)
//
fun
f0_arg1
( t2p: s2typ
, err: &sint >> _): s2typ =
let
//
val e00 = err
val-
T2Parg1
( knd0, t2p1) = t2p.node()
//
val
t2p1 = tread33_s2typ(t2p1, err)
//
in//let
if
(err=e00)
then (t2p) else
s2typ_arg1_errck(t2p.sort(),knd0,t2p1)
end(*let*)// end-of-[ f0_arg1(t2p,err) ]
//
(* ****** ****** *)
//
fun
f0_atx2
( t2p: s2typ
, err: &sint >> _): s2typ =
let
//
val e00 = err
val-
T2Patx2
( t2p1, t2p2) = t2p.node()
//
val
t2p1 = tread33_s2typ(t2p1, err)
val
t2p2 = tread33_s2typ(t2p2, err)
//
in//let
if
(err=e00)
then (t2p) else
s2typ_atx2_errck(t2p.sort(),t2p1,t2p2)
end(*let*)// end-of-[ f0_atx2(t2p,err) ]
//
(* ****** ****** *)
//
fun
f0_apps
( t2p: s2typ
, err: &sint >> _): s2typ =
let
//
val e00 = err
val-
T2Papps
( t2f0, t2ps) = t2p.node()
//
val
t2f0 = tread33_s2typ(t2f0, err)
val
t2ps = tread33_s2typlst(t2ps, err)
//
in//let
if
(err=e00)
then (t2p) else
s2typ_apps_errck(t2p.sort(),t2f0,t2ps)
end(*let*)// end-of-[ f0_apps(t2p,err) ]
//
(* ****** ****** *)
//
fun
f0_fun1
( t2p: s2typ
, err: &sint >> _): s2typ =
let
//
val e00 = err
val-
T2Pfun1
( f2cl, npf1
, t2ps, tres) = t2p.node()
//
val
f2cl =
tread33_s2typ(f2cl, err)
val
t2ps =
tread33_s2typlst(t2ps, err)
val
tres = tread33_s2typ(tres, err)
//
in//let
if
(err=e00)
then (t2p) else
s2typ_fun1_errck
(t2p.sort(), f2cl, npf1, t2ps, tres)
end(*let*)// end-of-[ f0_fun1(t2p,err) ]
//
(* ****** ****** *)
//
fun
f0_exi0
( t2p: s2typ
, err: &sint >> _): s2typ =
let
//
val e00 = err
//
val-
T2Pexi0
( s2vs, t2p1) = t2p.node()
//
val
t2p1 = tread33_s2typ(t2p1, err)
//
in//let
if
(err=e00)
then (t2p) else
let
val s2t = t2p.sort() in//let
(
  s2typ_exi0_errck(s2t, s2vs, t2p1))
end(*let*)// end-of-else // end-of-if
end(*let*)// end-of-[ f0_exi0(t2p,err) ]
//
fun
f0_uni0
( t2p: s2typ
, err: &sint >> _): s2typ =
let
//
val e00 = err
//
val-
T2Puni0
( s2vs, t2p1) = t2p.node()
//
val
t2p1 = tread33_s2typ(t2p1, err)
//
in//let
if
(err=e00)
then (t2p) else
let
val s2t = t2p.sort() in//let
(
  s2typ_uni0_errck(s2t, s2vs, t2p1))
end(*let*)// end-of-else // end-of-if
end(*let*)// end-of-[ f0_uni0(t2p,err) ]
//
(* ****** ****** *)
//
fun
f0_text
( t2p: s2typ
, err: &sint >> _): s2typ =
let
//
val e00 = err
val-
T2Ptext
( name, t2ps) = t2p.node()
//
val
t2ps = tread33_s2typlst(t2ps, err)
//
in//let
if
(err=e00)
then (t2p) else
s2typ_text_errck(t2p.sort(),name,t2ps)
end(*let*)// end-of-[ f0_text(t2p,err) ]
//
(* ****** ****** *)
//
fun
f0_trcd
( t2p: s2typ
, err: &sint >> _): s2typ =
let
//
val e00 = err
//
val-
T2Ptrcd
( tknd
, npf1, ltps) = t2p.node()
//
val
ltps = tread33_l2t2plst(ltps, err)
//
in//let
if
(err=e00)
then (t2p) else
let
val s2t = t2p.sort() in//let
s2typ_trcd_errck(s2t, tknd,npf1,ltps)
end(*let*)// end-of-else // end-of-if
end(*let*)// end-of-[ f0_trcd(t2p,err) ]
//
(* ****** ****** *)
//
fun
f0_none0
( t2p: s2typ
, err: &sint >> _): s2typ = t2p//endfun
//
fun
f0_none1
( t2p: s2typ
, err: &sint >> _): s2typ =
let
val lvl0 = 1
in//let
  err := err+1; s2typ_errck(lvl0, t2p0)
end//let
//
fun
f0_s2exp
( t2p: s2typ
, err: &sint >> _): s2typ = t2p//endfun
//
(* ****** ****** *)
//
(*
  val (  ) =
  prerrln("tread33_s2typ: t2p0 = ", t2p0)
*)
//
}(*where*)//end-of[tread33_s2typ(t2p0,err)]
//
(* ****** ****** *)
//
#implfun
tread33_l2t2p
  (lt2p, err) =
let
//
val e00 = err
//
val+
S2LAB(lab,t2p) = lt2p
val t2p = tread33_s2typ(t2p, err)
//
in//let
if
(err=e00) then lt2p else S2LAB(lab,t2p)
endlet // end of [tread33_l2t2p(lt2p,err)]
//
(* ****** ****** *)
//
#implfun
tread33_t2jag
( tjag, err ) =
let
//
val e00 = err
//
val
t2ps = t2jag_get_t2ps(tjag)
val
t2ps = tread33_s2typlst(t2ps, err)
//
in//let
if
(err=e00)
then (tjag) else
t2jag_make_t2ps(tjag.lctn((*0*)), t2ps)
end(*let*)//end-of-[tread33_t2jag(tjag,err)]
//
(* ****** ****** *)
//
#implfun
tread33_s2typlst
  (  t2ps, err  ) =
(
  list_tread33_fnp(t2ps, err, tread33_s2typ))
//
(* ****** ****** *)
//
#implfun
tread33_l2t2plst
  (  ltps, err  ) =
(
  list_tread33_fnp(ltps, err, tread33_l2t2p))
//
(* ****** ****** *)
//
#implfun
tread33_t2jaglst
  (  t2js, err  ) =
(
  list_tread33_fnp(t2js, err, tread33_t2jag))
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_tread33_staexp.dats] *)
