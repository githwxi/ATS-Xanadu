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
Fri Jan 30 11:37:39 AM EST 2026
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
#staload "./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload "./../SATS/t3read0.sats"
(* ****** ****** *)
#symload lctn with token_get_lctn
#symload node with token_get_node
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3parsed_of_t3read0
  (   dpar   ) =
let
//
val stadyn =
d3parsed_get_stadyn(dpar)
val nerror =
d3parsed_get_nerror(dpar)
val source =
d3parsed_get_source(dpar)
val t1penv =
d3parsed_get_t1penv(dpar)
val t2penv =
d3parsed_get_t2penv(dpar)
val t3penv =
d3parsed_get_t3penv(dpar)
val parsed =
d3parsed_get_parsed(dpar)
//
var err0
  : sint = ( 0 )
val evn0 = t3r0evn_make_nil()
//
val parsed =
(*
if // if
(nerror != 0)
then parsed else *)
t3read0_d3eclistopt(evn0,parsed,err0)
//
in//let
//
let//1
val ((*0*)) =
t3r0evn_free_nil( evn0 )
in//let1
if // if
(err0 = 0)
then (dpar) else
let//2
val nerror = nerror + ( err0 )
in//let2
d3parsed(stadyn,
nerror,source,t1penv,t2penv,t3penv,parsed)
end//let2
end//let1
//
end where
{
//
val () =
(prerrs("d3parsed_t3read0: ")
;prerrsln("template-resolution checking!"))
//
}(*where*)//end-of-[d3parsed_t3read0( dpar )]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
optn_t3read0_fnp
{x0:tx}
( e1
, xs, err0, fopr) =
(
auxopt(e1,xs,err0))
where
{
//
fun
auxopt
( e1:
! t3r0evn
, xs: optn(x0)
, err0: &sint >> _): optn(x0) =
(
case+ xs of
|
optn_nil() =>
optn_nil(*void*)
|
optn_cons(x1) =>
let
//
val n0 = err0
val x1 = fopr(e1, x1, err0)
//
in//let
(
if // if
(n0 = err0)
then (xs) else optn_cons(x1))
end(*end*)//end-of-[optn_cons(x1)]
)(*case+*)//end-of-[auxopt(e1,xs,err0)]
//
}(*where*)//end-of-[optn_t3read0_fnp(e1,xs,...)]
//
(* ****** ****** *)
//
#implfun
list_t3read0_fnp
{x0:tx}
( e1
, xs, err0, fopr) =
(
auxlst(e1,xs,err0))
where
{
//
fun
auxlst
( e1:
! t3r0evn
, xs: list(x0)
, err0: &sint >> _): list(x0) =
(
case+ xs of
|
list_nil() =>
list_nil(*void*)
|
list_cons(x1, rs) =>
let
//
val n0 = err0
val x1 = fopr(e1, x1, err0)
val rs = auxlst(e1, rs, err0)
//
in//let
(
if // if
(n0 = err0)
then (xs) else list_cons(x1, rs))
end(*end*)//end-of-[list_cons(x1,rs)]
)(*case+*)//end-of-[auxlst(e1,xs,err0)]
//
}(*where*)//end-of-[list_t3read0_fnp(e1,xs,...)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t3read0_d3patlst
( evn0
, d3ps, err0 ) = d3ps
(*
#implfun
t3read0_d3patlst
( evn0
, d3ps, err0 ) =
list_t3read0_fnp(evn0, d3ps, err0, t3read0_d3pat)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t3read0_d3explst
( evn0
, d3es, err0 ) =
list_t3read0_fnp(evn0, d3es, err0, t3read0_d3exp)
//
#implfun
t3read0_d3expopt
( evn0
, dopt, err0 ) =
optn_t3read0_fnp(evn0, dopt, err0, t3read0_d3exp)
//
(* ****** ****** *)
//
#implfun
t3read0_d3clslst
( evn0
, dclz, err0 ) =
list_t3read0_fnp(evn0, dclz, err0, t3read0_d3cls)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t3read0_d3eclist
( evn0, d3cs, err0 ) =
list_t3read0_fnp(evn0, d3cs, err0, t3read0_d3ecl)
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
t3read0_d3explstopt
( evn0, dopt, err0 ) =
optn_t3read0_fnp(evn0, dopt, err0, t3read0_d3explst)
//
(* ****** ****** *)
//
#implfun
t3read0_d3eclistopt
( evn0, dopt, err0 ) =
optn_t3read0_fnp(evn0, dopt, err0, t3read0_d3eclist)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_DATS_t3read0.dats] *)
(***********************************************************************)
