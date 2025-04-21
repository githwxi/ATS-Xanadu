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
Sat 15 Jul 2023 10:26:59 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/parsing.sats"
(* ****** ****** *)
#staload "./../SATS/preadx0.sats"
(* ****** ****** *)
#staload "./../SATS/trans01.sats"
#staload "./../SATS/tread01.sats"
(* ****** ****** *)
#staload "./../SATS/trans12.sats"
#staload "./../SATS/tread12.sats"
(* ****** ****** *)
#staload "./../SATS/trans2a.sats"
#staload "./../SATS/trsym2b.sats"
(* ****** ****** *)
#staload "./../SATS/tread20.sats"
(* ****** ****** *)
#staload "./../SATS/trans23.sats"
#staload "./../SATS/tread23.sats"
(* ****** ****** *)
#staload "./../SATS/trans3a.sats"
(* ****** ****** *)
#staload "./../SATS/tread30.sats"
(* ****** ****** *)
#staload "./../SATS/xatsopt.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xatsopt_flag$split
  (arg0) =
(
//
if // if
len0 <= 2
then
optn_vt_nil((*0*))
else
(
if
(
(arg0[0]!='-')
* // HX: conj
(arg0[1]!='-'))
then
optn_vt_nil((*0*))
else
optn_vt_cons(
f0_flag$split(arg0)))
//
) where
{
//
val
len0 =
strn_length(arg0)
//
fun
f0_flag$split
(cs: strn): @(
strn, optn_vt(strn)) =
let
//
val pos1 =
f1_eqpos(cs, 2(*i0*))
//
in//let
//
if // if
(pos1 < 0)
then // then
(
  key1, optn_vt_nil())
where{
val
key1 =
f1_substr(cs, 2, len0)}
else // else
(key1, optn_vt_cons(itm2))
where{
val
key1 = f1_substr(cs, 2, pos1)
val
itm2 = f1_substr(cs,pos1+1,len0)}
//  
end where // end-of-[let]
{
//
fnx
f1_eqpos
( cs: strn
, i0: sint): sint =
if
(i0 >= len0)
then -1 else
(
if
(
cs[i0] = '=')
then (  i0  )
else f1_eqpos(cs, i0+1))
//
fn0
f1_substr
( cs: strn
, i0: sint
, j0: sint): strn =
(
  strn_tabulate$f1un
  (j0-i0, lam(i1) => cs[i0+i1]))
//
}(*where*)//end-of-[f0_flag$split(...)]
//
(*
val () =
(
prerrsln
("xatsopt_flag$split: arg0 = ", arg0))
*)
//
}(*where*)//end-of-[xatsopt_flag$split]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2parsed_of_filsats
  ( fpth ) =
d2parsed_of_trans02
(
d0parsed_of_preadx0(dpar)) where
{
val dpar =
d0parsed_from_fpath(0(*sta*), fpth)
}
//
#implfun
d2parsed_of_fildats
  ( fpth ) =
d2parsed_of_trans02
(
d0parsed_of_preadx0(dpar)) where
{
val dpar =
d0parsed_from_fpath(1(*dyn*), fpth)
}(*where*)//end-of-[d2parsed_of_fildats]
//
(* ****** ****** *)
//
#implfun
d3parsed_of_filsats
  ( fpth ) =
d3parsed_of_trans03
(
d0parsed_of_preadx0(dpar)) where
{
val dpar =
d0parsed_from_fpath(0(*sta*), fpth)
}
//
#implfun
d3parsed_of_fildats
  ( fpth ) =
d3parsed_of_trans03
(
d0parsed_of_preadx0(dpar)) where
{
val dpar =
d0parsed_from_fpath(1(*dyn*), fpth)
}(*where*)//end-of-[d3parsed_of_fildats]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2parsed_of_trans02(dpar) =
let
//
val dpar = d1parsed_of_trans01(dpar)
val dpar = d1parsed_of_tread01(dpar)
//
val dpar = d2parsed_of_trans12(dpar)
val dpar = d2parsed_of_tread12(dpar)
//
val dpar = d2parsed_of_trans2a(dpar)
val (  ) = d2parsed_by_trsym2b(dpar)
val dpar = d2parsed_of_tread20(dpar) in dpar
//
end (*let*) // end of [d2parsed_of_trans02(dpar)]
//
(* ****** ****** *)
//
#implfun
d3parsed_of_trans03(dpar) =
let
//
val dpar = d2parsed_of_trans02(dpar)
//
val dpar = d3parsed_of_trans23(dpar)
val dpar = d3parsed_of_tread23(dpar)
//
val dpar = d3parsed_of_trans3a(dpar)
val dpar = d3parsed_of_tread30(dpar) in dpar
//
end (*let*) // end of [d3parsed_of_trans03(dpar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_xatsopt_utils0.dats] *)
