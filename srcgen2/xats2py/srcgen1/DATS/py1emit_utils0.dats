(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Fri Nov 29 04:20:01 PM EST 2024
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/libxatsopt.hats"
#include
"./../HATS/libxats2js.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/py1emit.sats"
//
(* ****** ****** *)
//
#staload
_(*DATS*)="./../DATS/py1emit.dats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i1tnmpy1
( filr,itnm ) =
(
prints("pytnm", stmp)) where
{
//
#impltmp g_print$out<>() = filr
//
val stmp = i1tnm_get_stmp(itnm)
//
}(*where*)//end-of-[i1tnmpy1(filr,itnm)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
i0intpy1
(filr, tint) =
(
case-
tint.node() of
|T_INT01
(  rep  ) => prints
("XATSINT1(", rep, ")")
|T_INT02
(bas,rep) => prints
("XATSINT2(",bas,",",rep,")")
|T_INT03
(bas
,rep,sfx) => prints
("XATSINT3("
,bas, ",", rep, ",", sfx, ")")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0intpy1(...)]
//
(* ****** ****** *)
//
#implfun
i0btfpy1
(filr, btf0) =
(
if
(btf0 = TRUE_symbl)
then print("XATSBOOL(true)")
else print("XATSBOOL(false)")
) where
{
#impltmp g_print$out<>() = filr
}(*where*)//end-of-[i0btfpy1(...)]
//
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_py1emit_utils0.dats] *)
(***********************************************************************)
