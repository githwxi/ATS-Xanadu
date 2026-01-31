(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Fri Jan 30 08:57:25 PM EST 2026
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
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/xsymmap.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
#staload "./../SATS/gmacro1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/tread30.sats"
(* ****** ****** *)
(* ****** ****** *)
//
datavwtp
tr30evn =
TR30EVN of trdstk(*void*)
//
where
{
//
datavwtp
trdstk =
|trdstk_nil of ()
|trdstk_cons of (timpl, trdstk)
//
}(*where*)//end(datavwtp(tr30evn))
//
#absimpl tr30evn_vtbx = tr30evn
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
trdstk_poptimp
( stk0:
& trdstk): sint =
(
case+ stk0 of
|
trdstk_nil
((*void*)) => ( 1 )
|
trdstk_cons
(timp, stk1) => (stk0 := stk1; 0)
)(*case+*)//end-of-[trdstk_poptimp]
//
fun
trdstk_pshtimp
( stk0:
& trdstk
, timp: timpl): void =
(
  stk0 := trdstk_cons(timp, stk0))
//end-of-[trdstk_pshtimp(stk0,timp)]
//
(* ****** ****** *)
//
fun
trdstk_gettmps
( stk0:
! trdstk): list(timpl) =
(
list_vt2t(
loop(stk0, list_vt_nil(*0*)))
) where
{
//
fun
loop
( stk0:
! trdstk
, tmps
: list_vt(timpl)): list_vt(timpl) =
(
case+ stk0 of
|trdstk_nil
( (*void*) ) => ( tmps )
|trdstk_cons
(tmp1, stk1) =>
loop(stk1, list_vt_cons(tmp1, tmps)))
//
}(*where*)//end-of-[trdstk_gettmps(stk0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tr30evn_make_nil
  ((*nil*)) =
(
  TR30EVN(trdstk_nil((*void*)))
) where
{
// (*
  val () =
  prerrsln("tr30evn_make_nil(", ")")
// *)
}(*where*)//end of [tr30evn_make_nil(...)]
//
(* ****** ****** *)
//
#implfun
tr30evn_free_nil
  (  evn0  ) =
let
//
val+
TR30EVN(stk0) = evn0
//
in//let
//
case- stk0 of
//
| ~trdstk_nil() => ((*void*))
(*
| ~trdstk_cons(tmp1, stk1) => ...
*)
//
end(*let*)//end-of-[tr30evn_free_nil(evn0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_tread30_myenv0.dats] *)
(***********************************************************************)
