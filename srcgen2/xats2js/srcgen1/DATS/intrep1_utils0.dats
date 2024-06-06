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
Fri 31 May 2024 02:02:10 AM EDT
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
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dats.hats"
(* ****** ****** *)
#include
"./../HATS/xats2js_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../../../SATS/xstamp0.sats"
#staload
"./../../../SATS/xsymbol.sats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
(* ****** ****** *)
(* ****** ****** *)

#implfun
t1imp_i1cmpq
(   timp   ) =
(
case+
timp.node() of
|T1IMPall1
(dcst, dopt) => f0_dopt(dopt)
|T1IMPallx
(dcst, dopt) => f0_dopt(dopt)
) where
{
//
fun
f0_dopt
( dopt
: i1dclopt): i1cmpopt =
(
case+ dopt of
|
optn_nil() => optn_nil((*0*))
|
optn_cons(idcl) => f1_idcl(idcl))
//
and
f1_idcl
(idcl: i1dcl): i1cmpopt =
(
case+
idcl.node() of
|
I1Dtmpsub
(svts, dcl1) => f1_idcl(dcl1)
|
I1Dimplmnt0
( tknd
, stmp, dimp
, fjas, icmp) =>
(
case+ fjas of
|list_nil() => optn_cons(icmp)
|list_cons(_, _) => optn_nil((*0*))
)
//
| _(*otherwise*) => optn_nil((*0*))
//
)(*case+*)//end-of-[ f1_dopt(dopt) ]
//
val () =
prerrln("t1imp_i1cmpq: timp = ", timp)
//
}(*where*)//end-of-[t1imp_i1cmpq( timp )]

(* ****** ****** *)
(* ****** ****** *)

#implfun
t1imp_i1dclq
(   timp   ) =
(
case+
timp.node() of
|T1IMPall1
(dcst, dopt) => f0_dopt(dopt)
|T1IMPallx
(dcst, dopt) => f0_dopt(dopt)
) where
{
//
fun
f0_dopt
( dopt
: i1dclopt): i1dclopt =
(
case+ dopt of
|
optn_nil() => optn_nil((*0*))
|
optn_cons(idcl) => f1_idcl(idcl))
//
and
f1_idcl
(idcl: i1dcl): i1dclopt =
(
case+
idcl.node() of
//
|I1Dtmpsub
(svts,dcl1) => f1_idcl(dcl1)
//
|I1Dimplmnt0
( _,_,_,_,_ ) => optn_cons(idcl)
//
| _(*otherwise*) => optn_nil((*0*))
//
)(*case+*)//end-of-[ f1_dopt(dopt) ]
//
val () =
prerrln("t1imp_i1dclq: timp = ", timp)
//
}(*where*)//end-of-[t1imp_i1dclq( timp )]

(* ****** ****** *)
(* ****** ****** *)

(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_DATS_intrep1_utils0.dats] *)
(***********************************************************************)
