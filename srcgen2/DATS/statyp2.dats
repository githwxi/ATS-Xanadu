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
Fri 04 Nov 2022 05:04:08 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
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
#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
#symload lctn with s1exp_get_lctn
#symload node with s1exp_get_node
(* ****** ****** *)
#implfun
s2typ_var(s2v) =
s2typ_make_node
(s2v.sort(), T2Pvar(s2v))
#implfun
s2typ_cst(s2c) =
s2typ_make_node
(s2c.sort(), T2Pcst(s2c))
(* ****** ****** *)
//
#implfun
s2typ_xtv(xtp) =
s2typ
(s2t0, T2Pxtv(xtp)) where
{
val
s2t0 = sort2_none0((*nil*)) }
//
(* ****** ****** *)
//
#implfun
s2typ_lft(t2p) =
s2typ
(s2t0, T2Plft(t2p)) where
{
val s2t0 = t2p.sort((*nil*)) }
//
(* ****** ****** *)
//
#implfun
s2typ_f2cl
(  f2cl  ) =
s2typ_make_node
( s2t0
, T2Pf2cl(f2cl)) where
{
  val s2t0 = sort2_none0()
} (*where*) // end of [s2typ_f2cl(...)]
//
(* ****** ****** *)
//
local
//
fun
f0_trcdknd
(tknd: trcdknd): sort2 =
(
case+ tknd of
|TRCDbox0() => the_sort2_tbox
|TRCDbox1() => the_sort2_tbox
|
_(*otherwise*) => the_sort2_type)
//
fun
f0_labelize
( t2ps
: s2typlst, i0: sint): l2t2plst =
(
case+ t2ps of
|
list_nil() =>
list_nil((*void*))
|
list_cons(t2p1, t2ps) =>
let
val ltp1 = S2LAB(LABint(i0),t2p1)
in//let
list_cons(ltp1,f0_labelize(t2ps,i0+1))
end (*let*)
) (*case+*) // end-[f0_labelize(...)]
//
in//local
//
#implfun
s2typ_tup0
(npf1, t2ps) =
let
val s2t0 =
the_sort2_type(*0*)
val trcd = TRCDflt0
val ltps =
f0_labelize(t2ps, 0(*i0*))
in//let
s2typ_make_node
(s2t0,T2Ptrcd(trcd,npf1,ltps))
end // end of [s2typ_tup0(...)]
//
#implfun
s2typ_tup1
( tknd
, npf1, t2ps) =
let
val s2t0 =
f0_trcdknd(tknd)
val ltps =
f0_labelize(t2ps, 0(*i0*))
in//let
s2typ_make_node
(s2t0,T2Ptrcd(tknd,npf1,ltps))
end // end of [s2typ_tup1(...)]
//
endloc // end of [local(s2typ_tup0/tup1)]
//
(* ****** ****** *)
//
#implfun
s2typ_none0() =
s2typ
(s2t0, T2Pnone0()) where
{
  val s2t0 = sort2_none0()
} (*where*) // end of [s2typ_none0(...)]
//
(* ****** ****** *)
//
#implfun
s2typ_none1(t2p0) =
let
//
  val s2t0 = t2p0.sort()
//
(*
val (  ) = prerrln
("s2typ_none1: t2p0 = ", t2p0)
*)
in//let
  s2typ(s2t0, T2Pnone1(t2p0))
end (*let*) // end of [s2typ_none1(t2p0)]
//
(* ****** ****** *)
//
#implfun
s2typ_s2exp(s2e0) =
let
//
  val s2t0 = s2e0.sort()
//
(*
val (  ) = prerrln
("s2typ_s2exp: s2e0 = ", s2e0)
*)
in//let
  s2typ(s2t0, T2Ps2exp(s2e0))
end (*let*) // end of [s2typ_s2exp(s2e0)]
//
(* ****** ****** *)

local
//
datatype s2typ =
S2TYP of (sort2,s2typ_node)
//
#absimpl s2typ_tbox = s2typ
//
in//local
//
#implfun
s2typ_get_sort
   ( t2p0 ) = let
//
val
S2TYP(s2t0, node) = t2p0 in s2t0
//
end (*let*) // end of [s2typ_get_sort]
#implfun
s2typ_get_node
   ( t2p0 ) = let
//
val
S2TYP(s2t0, node) = t2p0 in node
//
end (*let*) // end of [s2typ_get_node]
//
#implfun
s2typ_make_node
( s2t0 , node ) = S2TYP(s2t0, node)
//
endloc (*local*) // end of [local(s2typ)]
//
(* ****** ****** *)
//
#implfun
l2t2p_get_sort
(   lx   ) = s2typ_get_sort(lx.itm())
#implfun
l2t2p_get_node
(   lx   ) = s2typ_get_node(lx.itm())
//
(* ****** ****** *)
//
local
val
stamper = stamper_new()
in//local
fun
the_x2t2p_stamp_new
( (*void*) ): stamp = stamper.getinc()
endloc // end of [the_x2t2p_stamp_new]
//
(* ****** ****** *)

local
//
datatype
x2t2p =
X2T2P of
( loc_t // lctn
, s2exp // sexp
, s2typ // type
, stamp // stmp // unicity
) (* end of [x2t2p] *)
datavwtp
x2t2p_vt =
X2T2P_vt of
( loc_t // lctn
, s2exp // sexp
, s2typ // type
, stamp // stmp // unicity
) (* end of [x2t2p] *)
//
#absimpl x2t2p_tbox = x2t2p
//
in//local
//
#implfun
x2t2p_get_lctn
  (  xt2p  ) =
let
val+
X2T2P
(loc0
,s2e0
,t2p0,stmp) = xt2p in loc0 end
//
#implfun
x2t2p_get_stmp
  (  xt2p  ) =
let
val+
X2T2P
(loc0
,s2e0
,t2p0,stmp) = xt2p in stmp end
//
#implfun
x2t2p_get_styp
  (  xt2p  ) =
let
val+
X2T2P
(loc0
,s2e0
,t2p0,stmp) = xt2p in t2p0 end
//
(* ****** ****** *)
//
#implfun
x2t2p_make_lctn
  (  loc0  ) =
let
val
s2e0 = s2exp_none0()
val
t2p0 = s2typ_none0()
val
stmp = the_x2t2p_stamp_new()
in//let
  X2T2P(loc0, s2e0, t2p0, stmp)
end (*let*) // end of [x2t2p_make_lctn]
//
(* ****** ****** *)

#implfun
x2t2p_set_styp
( xt2p, t2p0 ) =
let
//
val
xt2p =
$UN.castlin10{x2t2p_vt}(xt2p)
val+
@X2T2P_vt
(loc0,
 s2e0,
!styp,stmp) = xt2p in (styp := t2p0)
//
end (*let*) // end of [ x2t2p_set_styp ]

(* ****** ****** *)
//
end (*local*) // end of [local(x2t2p_tbox)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_statyp2.dats] *)
