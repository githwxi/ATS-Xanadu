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
//
Sat 16 Mar 2024 07:00:59 PM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
#define
XATSOPT "./../../.."
*)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
(* ****** ****** *)
//
#staload I0R="./intrep0.sats"
#staload I1R="./intrep1.sats"
//
(* ****** ****** *)
#typedef i0pat = $I0R.i0pat
#typedef i0exp = $I0R.i0exp
(* ****** ****** *)
#typedef i1val = $I1R.i1val
#typedef i1cmp = $I1R.i1cmp
(* ****** ****** *)
(* ****** ****** *)
#typedef i0patlst = list(i0pat)
#typedef i0explst = list(i0exp)
(* ****** ****** *)
#typedef i1valist = list(i1val)
#typedef i1cmplst = list(i1cmp)
(* ****** ****** *)
#absvtbx trenv01_vtbx
#vwtpdef trenv01 = trenv01_vtbx
(* ****** ****** *)
(* ****** ****** *)
fun
trcmp01_i0exp
(env0: !trenv01, i0e0: i0exp): i1val
(* ****** ****** *)
(* ****** ****** *)
fun
trcmp01_i0explst
(env0: !trenv01, i0es: i0explst): i1valist
(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_SATS_trcmp01.sats] *)
(***********************************************************************)
