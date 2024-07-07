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
Fri 11 Nov 2022 01:49:13 PM EST
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
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
#staload "./../SATS/trans12.sats"
#staload "./../SATS/tread12.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d2parsed_of_tread12
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
tread12_d2eclistopt(parsed, nerror)
//
in//let
//
if
(nerror=0)
then (dpar) else
d2parsed
( stadyn
, nerror, source, t1penv, t2penv, parsed)
//
end(*let*)//end-(d2parsed_of_tread12(dpar))
//
(* ****** ****** *)
//
#implfun
tread02_from_fpath
  (stadyn, source) =
(
  d2parsed_of_tread12(d2par)) where
{
//
  val d2par =
  (
    trans02_from_fpath(stadyn, source))
//
}(*where*)//end-of-[tread02_from_fpath(...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
tread12_d2explstopt
  (  dopt, err0  ) =
optn_tread12_fnp(dopt, err0, tread12_d2explst)
//
(* ****** ****** *)
//
#implfun
tread12_d2eclistopt
  (  dopt, err0  ) =
optn_tread12_fnp(dopt, err0, tread12_d2eclist)
//
(* ****** ****** *)
//
#implfun
d2parsed_fpemsg
  (out, dpar) = let
//
val
nerror =
d2parsed_get_nerror(dpar)
//
(*
val () =
let
val
source =
d2parsed_get_source(dpar)
in//let
prerrln
("d2parsed_fpemsg: source = ", source)
end//let//end-of-[val()]
*)
//
in//let
if
(nerror > 0) then
let
val parsed =
d2parsed_get_parsed(dpar)
in
d2eclistopt_fpemsg(out, parsed) end else ()
end (*let*)//end-of-[d2parsed_fpemsg(out,dpar)]
//
(* ****** ****** *)
//
#implfun
d2explstopt_fpemsg
  (out, dopt) =
(
case+ dopt of
| optn_nil() => ((*void*))
| optn_cons(d2es) => d2explst_fpemsg(out, d2es)
)
//
(* ****** ****** *)
//
#implfun
d2eclistopt_fpemsg
  (out, dopt) =
(
case+ dopt of
| optn_nil() => ((*void*))
| optn_cons(d2cs) => d2eclist_fpemsg(out, d2cs)
)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
list_tread12_fnp
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
}(*where*)//end(list_tread12_fnp(lst,err,fpr))
//
(* ****** ****** *)
//
#implfun
optn_tread12_fnp
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
)(*case+*)//end(optn_tread12_fnp(opt,err,fpr)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_tread12.dats] *)
