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
#include
"./../HATS/xatsopt_dpre.hats"
//
(*
HX-2025-05-01:
SRCGEN1_XATSOPT:
This is needed due to a bug in
handling typing and overloading!
SRCGEN2_XATSOPT: It's not needed
*)
#symload * with bool_mul of 1002
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/xsymbol.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/staexp0.sats"
//
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/gmacro1.sats"
//
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
//
(* ****** ****** *)
#staload "./../SATS/dynexp0.sats"
#staload "./../SATS/dynexp1.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/parsing.sats"
(* ****** ****** *)
#staload "./../SATS/pread00.sats"
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
#staload "./../SATS/tread3a.sats"
(* ****** ****** *)
#staload "./../SATS/xatsopt.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/xglobal.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
xatsopt_flag$split
  ( arg0 ) =
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
* // \bool_mul
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
// (*
val () =
(
 prerrsln
 ("xatsopt_flag$split: arg0 = ", arg0))
// *)
//
}(*where*)//end-of-[xatsopt_flag$split]
//
(* ****** ****** *)
//
#implfun
xatsopt_flag$pvsadd0
  ( arg0 ) =
let
val opt1 =
xatsopt_flag$split(arg0)
in//let
//
case+ opt1 of
| ~
optn_vt_nil
( (*void*) ) => ((*void*))
| ~
optn_vt_cons
@(key1, opt2) =>
(
the_gmacenv_pvsadd0(key1, itm2)
) where
{
//
fun
f0_g1mstr
( str0
: strn): g1mac = G1Mstr(str0)
//
val key1 = symbl_make_name(key1)
//
val itm2 =
(
case+ opt2 of
| ~
optn_vt_nil((*0*)) => G1Mint(1)
| ~
optn_vt_cons(str2) => f0_g1mstr(str2))
}
//
end(*let*)//end-of-[xatsopt_flag$addenv]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-05-24:
Note that
[d2parsed_of_fil?ats]
does not check the output!
*)
//
#implfun
d2parsed_of_filsats
  ( fpth ) =
d2parsed_of_trans02
(
d0parsed_of_pread00(dpar)) where
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
d0parsed_of_pread00(dpar)) where
{
val dpar =
d0parsed_from_fpath(1(*dyn*), fpth)
}(*where*)//end-of-[d2parsed_of_fildats]
//
(* ****** ****** *)
//
(*
HX-2025-05-24:
Note that
[d3parsed_of_fil?...]
does not check the output!
*)
//
#implfun
d3parsed_of_filsats
  ( fpth ) =
d3parsed_of_trans03
(
d0parsed_of_pread00(dpar)) where
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
d0parsed_of_pread00(dpar)) where
{
val dpar =
d0parsed_from_fpath(1(*dyn*), fpth)
}(*where*)//end-of-[d3parsed_of_fildats]
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-05-24:
Note that
[d2parsed_of_trans02]
does call tread20 to check
before it returns the output!
*)
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
(*
Note that
[d3parsed_of_trans03]
does call tread3a to check
before it returns the output!
*)
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
val dpar = d3parsed_of_tread3a(dpar) in dpar
//
end (*let*) // end of [d3parsed_of_trans03(dpar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_xatsopt_utils0.dats] *)
(***********************************************************************)
