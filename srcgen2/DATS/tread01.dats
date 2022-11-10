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
Mon Aug 15 17:37:59 EDT 2022
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
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
#staload "./../SATS/dynexp1.sats"
(* ****** ****** *)
#staload "./../SATS/tread01.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
//
#implfun
optn_tread01_fnp
{  syn:tx  }
(  opt , err , fpr  ) =
(
case+ opt of
|
optn_nil() => opt
|
optn_cons(tm1) =>
let
val e00 = err
val tm1 = fpr(tm1, err)
in // let
if
(err=e00)
then opt else optn_cons(tm1)
endlet // end of [optn_cons(tm1)]
)(*case+*)//end(optn_tread01_fnp(opt,err,fpr)
//
(* ****** ****** *)
//
#implfun
list_tread01_fnp
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
val tm2 = auxlst(tms, err)
in//let
if
(err = e00)
then lst else list_cons(tm1,tm2)
endlet // end of [auxlst(lst,err)]
//
}(*where*)//end(list_tread01_fnp(lst,err,fpr))
//
(* ****** ****** *)

#implfun
d1parsed_tread01
  (dpar) =
let
//
var nerror: sint = 0
//
val stadyn =
d1parsed_get_stadyn(dpar)
val source =
d1parsed_get_source(dpar)
val topenv =
d1parsed_get_topenv(dpar)
val parsed =
d1parsed_get_parsed(dpar)
//
val parsed =
tread01_d1eclistopt(parsed, nerror)
//
in//let
//
if
(nerror=0)
then (dpar) else
d1parsed
(stadyn, nerror, source, topenv, parsed)
//
end (*let*) // end of [d1parsed_tread01(dpar)]

(* ****** ****** *)
//
#implfun
tread01_d1eclistopt
  (  dopt, err  ) =
optn_tread01_fnp(dopt, err, tread01_d1eclist)
//
(* ****** ****** *)
//
#implfun
d1parsed_fpemsg
  (out, dpar) = let
//
val nerror =
d1parsed_get_nerror(dpar)
//
in//let
if
(nerror > 0) then
let
val parsed =
d1parsed_get_parsed(dpar)
in
d1eclistopt_fpemsg(out, parsed) end else ()
end (*let*)//end-of-[d1parsed_fpemsg(out,dpar)]
//
(* ****** ****** *)
//
#implfun
d1eclistopt_fpemsg
  (out, dopt) =
(
case+ dopt of
| optn_nil() => ((*void*))
| optn_cons(d1cs) => d1eclist_fpemsg(out, d1cs)
)
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_tread01.dats] *)
