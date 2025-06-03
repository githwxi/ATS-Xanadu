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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Thu 29 Dec 2022 06:20:02 PM EST
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
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
#staload "./../SATS/xlabel0.sats"
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/statyp2.sats"
(* ****** ****** *)
#staload _ = "./statyp2_tmplib.dats"
(* ****** ****** *)
(* ****** ****** *)
#symload name with s2cst_get_name
#symload sort with s2cst_get_sort
#symload styp with s2cst_get_styp
(* ****** ****** *)
#symload name with s2var_get_name
#symload sort with s2var_get_sort
(* ****** ****** *)
(* ****** ****** *)

#implfun
s2typ_hnfiz0
(   t2p0   ) =
let
//
#typedef
e1nv = sint
//
val env0: e1nv = 0
//
#impltmp
s2typ_eval$s2cst
<e1nv>(env0,s2c0) = s2c0.styp()
#impltmp
s2typ_eval$s2var
<e1nv>(env0,s2v0) = optn_vt_nil()
//
(*
val () =
prerrsln
("s2typ_hnfiz0: t2p0 = ", t2p0)
*)
//
in//let
s2typ_hnfiz0_e1nv<e1nv>(env0, t2p0)
end (*let*) // end of [s2typ_hnfiz0(t2p0)]

(* ****** ****** *)

#implfun
s2typlst_hnfiz0
(    t2ps    ) =
(
  list_map(t2ps)) where
{
//
#typedef x0 = s2typ
#typedef y0 = s2typ
//
#impltmp map$fopr<x0><y0> = s2typ_hnfiz0
}(*where*)//end-of-[s2typlst_hnfiz0(t2ps,svts)]

(* ****** ****** *)

#implfun
s2typ_subst0
(t2p0, svts) =
let
//
#typedef
e1nv = sint
//
val env0: e1nv = 0
//
#impltmp
s2typ_eval$s2cst
<e1nv>(env0,s2c0) = s2c0.styp()
//
(*
#impltmp
s2typ_eval$s2var
<e1nv>(env0,s2v0) = optn_vt_nil()
*)
//
in//let
s2typ_subst0_e1nv<e1nv>(env0, t2p0, svts)
end (*let*)//end-of-[s2typ_subst0(t2p0,svts)]

(* ****** ****** *)

#implfun
s2typlst_subst0
( t2ps , svts ) =
(
  list_map(t2ps)) where
{
//
#typedef x0 = s2typ
#typedef y0 = s2typ
//
#impltmp
map$fopr<x0><y0>(x0) = s2typ_subst0(x0, svts)
}(*where*)//end-of-[s2typlst_subst0(t2ps,svts)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_statyp2_utils2.dats] *)
