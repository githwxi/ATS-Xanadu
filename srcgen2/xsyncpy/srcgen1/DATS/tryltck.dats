(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Thu Sep 18 02:03:56 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
//
#staload
"./../SATS/tryltck.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
list_tryltck_fnp
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
}(*where*)//end(list_tryltck_fnp(lst,err,fpr))
//
(* ****** ****** *)
//
#implfun
optn_tryltck_fnp
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
)(*case+*)//end(optn_tryltck_fnp(opt,err,fpr)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3parsed1_of_tryltck
  ( dpar ) = let
//
val stadyn =
d3parsed1_stadyn$get(dpar)
val nerror =
d3parsed1_nerror$get(dpar)
val source =
d3parsed1_source$get(dpar)
//
(*
val t1penv =
d3parsed1_t1penv$get(dpar)
val t2penv =
d3parsed1_t2penv$get(dpar)
val t3penv =
d3parsed1_t3penv$get(dpar)
*)
val parsed =
d3parsed1_parsed$get(dpar)
//
var
err0: sint = 0
//
val parsed =
d3ecl1lstopt_tryltck(parsed, err0)
//
val nerror = err0
//
in//let
//
if
(nerror=0)
then (dpar) else
(
d3parsed1(stadyn, nerror, source, parsed))
//
end(*let*)//end-of-[d3parsed1_of_tryltck(dpar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3pat1lst_tryltck
  (d3ps, err0) =
(
list_tryltck_fnp(d3ps, err0, d3pat1_tryltck))
//
#implfun
d3pat1opt_tryltck
  (dopt, err0) =
(
optn_tryltck_fnp(dopt, err0, d3pat1_tryltck))
//
(* ****** ****** *)
//
#implfun
d3exp1lst_tryltck
  (d3es, err0) =
(
list_tryltck_fnp(d3es, err0, d3exp1_tryltck))
//
#implfun
d3exp1opt_tryltck
  (dopt, err0) =
(
optn_tryltck_fnp(dopt, err0, d3exp1_tryltck))
//
(* ****** ****** *)
//
#implfun
d3ecl1lst_tryltck
  (dcls, err0) =
(
list_tryltck_fnp(dcls, err0, d3ecl1_tryltck))
//
#implfun
d3ecl1opt_tryltck
  (dopt, err0) =
(
optn_tryltck_fnp(dopt, err0, d3ecl1_tryltck))
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3ecl1lstopt_tryltck
  (dopt, err0) =
(
case+ dopt of
|
optn_nil
( (*0*) ) => optn_nil((*void*))
|
optn_cons
(  dcls  ) =>
(
  optn_cons(d3ecl1lst_tryltck(dcls, err0)))
)(*case+*)//end-of-[d3ecl1lstopt_tryltck(dopt,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_tryltck.dats] *)
(***********************************************************************)
