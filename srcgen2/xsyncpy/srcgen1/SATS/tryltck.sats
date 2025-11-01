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
Wed Jul  9 02:28:26 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(*
HX-2025-11-01:
For performing trxltck-proofread
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#include
"xatslib\
/libcats\
/HATS/libcats_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
ftryltck
(syn: tx) =
(syn , &sint >> _) -> ( syn )
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
list_tryltck_fnp
{syn:tx}
( lst: list(syn)
, err: &sint >> _
, fpr: ftryltck(syn)): list(syn)
//
fun
optn_tryltck_fnp
{syn:tx}
( opt: optn(syn)
, err: &sint >> _
, fpr: ftryltck(syn)): optn(syn)
//
(* ****** ****** *)
(* ****** ****** *)
fun d3pat1_tryltck: ftryltck(d3pat1)
fun d3exp1_tryltck: ftryltck(d3exp1)
(* ****** ****** *)
fun d3ecl1_tryltck: ftryltck(d3ecl1)
(* ****** ****** *)
(* ****** ****** *)
fun d3pat1lst_tryltck: ftryltck(d3pat1lst)
fun d3pat1opt_tryltck: ftryltck(d3pat1opt)
fun l3d3p1lst_tryltck: ftryltck(l3d3p1lst)
(* ****** ****** *)
fun d3exp1lst_tryltck: ftryltck(d3exp1lst)
fun d3exp1opt_tryltck: ftryltck(d3exp1opt)
fun l3d3e1lst_tryltck: ftryltck(l3d3e1lst)
(* ****** ****** *)
fun d3ecl1lst_tryltck: ftryltck(d3ecl1lst)
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3ecl1lstopt_tryltck: ftryltck(d3ecl1lstopt)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_tryltck.sats] *)
(***********************************************************************)
