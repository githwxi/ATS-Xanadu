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
Sun Feb 22 09:58:07 PM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload
"./../SATS/dynexp3.sats"
#staload
"./../SATS/intrep0.sats"
#staload
"./../SATS/trxd3i0.sats"
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
d3pat1lst_trxd3i0
(d3ps, env0) =
list_map$e1nv(d3ps, env0) where
{
#typedef x0 = d3pat1
#typedef y0 = i0pat1
#vwtpdef e1 = envd3i0
#impltmp
map$e1nv$fopr<x0><y0><e1> = d3pat1_trxd3i0
}(*where*)//end-of-[d3pat1lst_trxd3i0(d3ps,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3exp1lst_trxd3i0
(d3es, env0) =
list_map$e1nv(d3es, env0) where
{
#typedef x0 = d3exp1
#typedef y0 = i0exp1
#vwtpdef e1 = envd3i0
#impltmp
map$e1nv$fopr<x0><y0><e1> = d3exp1_trxd3i0
}(*where*)//end-of-[d3exp1lst_trxd3i0(d3es,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3ecl1lst_trxd3i0
(dcls, env0) =
list_map$e1nv(dcls, env0) where
{
#typedef x0 = d3ecl1
#typedef y0 = i0dcl1
#vwtpdef e1 = envd3i0
#impltmp
map$e1nv$fopr<x0><y0><e1> = d3ecl1_trxd3i0
}(*where*)//end-of-[d3ecl1lst_trxd3i0(dcls,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3fundcl1lst_trxd3i0
(d3fs, env0) =
list_map$e1nv(d3fs, env0) where
{
#vwtpdef e1 = envd3i0
#typedef x0 = d3fundcl1
#typedef y0 = i0fundcl1
#impltmp
map$e1nv$fopr<x0><y0><e1> = d3fundcl1_trxd3i0
}(*where*)//end-of-[d3fundcl1lst_trxd3i0(d3es,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3ecl1lstopt_trxd3i0
(dopt, env0) =
(
case+ dopt of
|
optn_nil
( (*0*) ) => optn_nil((*void*))
|
optn_cons
(  dcls  ) =>
(
  optn_cons(d3ecl1lst_trxd3i0(dcls, env0)))
)(*case+*)//end-of-[d3ecl1lstopt_trxd3i0(dopt,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trxd3i0.dats] *)
(***********************************************************************)
