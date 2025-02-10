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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sat 28 Jan 2023 04:03:29 PM EST
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
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
(* ****** ****** *)
#staload "./../SATS/tread20.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
//
#implfun
list_tread20_fnp
{  syn:tx  }
(  lst , err , fpr  ) =
(
  auxlst(lst, err)) where
{
//
fun
auxlst
( lst: list(syn)
, err: &sint >> _): list(syn) =
case+ lst of
|
list_nil() =>
list_nil()
|
list_cons(tm1, tms) =>
let
val e00 = err
val tm1 = fpr(tm1, err)
val tms = auxlst(tms, err)
in//let
if
(err = e00)
then lst else list_cons(tm1, tms)
endlet // end of [auxlst(lst,err)]
//
}(*where*)//end(list_tread20_fnp(lst,err,fpr))
//
(* ****** ****** *)
//
#implfun
optn_tread20_fnp
{  syn:tx  }
(  opt , err , fpr  ) =
(
case+ opt of
|
optn_nil() => opt
|
optn_cons(syn) =>
let
val e00 = err
val syn = fpr(syn, err)
in // let
if
(err=e00)
then opt else optn_cons(syn)
endlet // end of [optn_cons(syn)]
)(*case+*)//end(optn_tread20_fnp(opt,err,fpr)
//
(* ****** ****** *)
//
#implfun
d2parsed_of_tread20
  (dpar) =
let
//
var nerror: sint = 0
//
val stadyn =
d2parsed_get_stadyn(dpar)
val source =
d2parsed_get_source(dpar)
//
val t1penv =
d2parsed_get_t1penv(dpar)
val t2penv =
d2parsed_get_t2penv(dpar)
//
val parsed =
d2parsed_get_parsed(dpar)
//
val parsed =
tread20_d2eclistopt(parsed, nerror)
//
in//let
//
if
(nerror=0)
then (dpar) else
d2parsed
(stadyn,nerror,source,t1penv,t2penv,parsed)
//
end(*let*)//end-of(d2parsed_of_tread20(dpar))
//
(* ****** ****** *)
//
#implfun
tread20_d2explstopt
  (  dopt, err0  ) =
optn_tread20_fnp(dopt, err0, tread20_d2explst)
//
(* ****** ****** *)
//
#implfun
tread20_d2eclistopt
  (  dopt, err0  ) =
optn_tread20_fnp(dopt, err0, tread20_d2eclist)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_tread20.dats] *)
