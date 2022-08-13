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
Start Time: June 17th, 2022
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
#staload "./../SATS/staexp0.sats"
#staload "./../SATS/dynexp0.sats"
(* ****** ****** *)
#staload "./../SATS/preadx0.sats"
(* ****** ****** *)
//
#implfun
preadx0_synentopt_fun
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
)(*case+*)//end(preadx0_synentopt_fun)
//
(* ****** ****** *)
//
#implfun
preadx0_synentlst_fun
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
}(*where*)//end(preadx0_synentlst_fun)
//
(* ****** ****** *)

#implfun
d0parsed_preadx0
  (dpar) =
let
//
var nerror: sint = 0
//
val stadyn =
d0parsed_get_stadyn(dpar)
val source =
d0parsed_get_source(dpar)
val parsed =
d0parsed_get_parsed(dpar)
//
val parsed =
preadx0_d0eclistopt(parsed, nerror)
//
val
( (*void*) ) =
(
if
(nerror > 0)
then
d0eclistopt_fpemsg(parsed)
)
//
in//let
d0parsed(stadyn,nerror,source,parsed)
end (*let*) // end of [d0parsed_preadx0(dpar)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_preadx0.dats] *)
