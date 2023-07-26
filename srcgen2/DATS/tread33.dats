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
Wed 26 Jul 2023 01:13:09 PM EDT
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
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/tread33.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
//
#implfun
list_tread33_fnp
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
}(*where*)//end(list_tread33_fnp(lst,err,fpr))
//
(* ****** ****** *)
//
#implfun
optn_tread33_fnp
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
)(*case+*)//end(optn_tread33_fnp(opt,err,fpr)
//
(* ****** ****** *)
//
#implfun
d3parsed_of_tread33
  (dpar) =
let
//
var nerror: sint = 0
//
val stadyn =
d3parsed_get_stadyn(dpar)
val source =
d3parsed_get_source(dpar)
//
val t1penv =
d3parsed_get_t1penv(dpar)
val t2penv =
d3parsed_get_t2penv(dpar)
//
val parsed =
d3parsed_get_parsed(dpar)
//
val parsed =
tread33_d3eclistopt(parsed, nerror)
//
in//let
//
if
(nerror=0)
then (dpar) else
d3parsed
(stadyn,nerror,source,t1penv,t2penv,parsed)
//
end(*let*)//end-of(d3parsed_of_tread33(dpar))
//
(* ****** ****** *)
//
#implfun
tread33_d3explstopt
  (  dopt, err0  ) =
optn_tread33_fnp(dopt, err0, tread33_d3explst)
//
(* ****** ****** *)
//
#implfun
tread33_d3eclistopt
  (  dopt, err0  ) =
optn_tread33_fnp(dopt, err0, tread33_d3eclist)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread33.dats] *)
