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
Tue Jul  1 05:33:10 PM EDT 2025
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
"./../SATS/trxltck.sats"
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
d3parsed1_trxltck
  (dpar) = let
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
val env0 = envltck_make_nil()
//
val parsed =
d3ecl1lstopt_trxltck(parsed, env0)
//
in//let
//
let
val ((*0*)) = envltck_free_nil(env0)
in//let
(
d3parsed1(stadyn, nerror, source, parsed))
end//let
//
end(*let*)//end-of-[d3parsed1_trxltck(dpar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3exp1lst_trxltck
(d3es, env0) =
list_map$e1nv(d3es, env0) where
{
#typedef x0 = d3exp1
#typedef y0 = d3exp1
#vwtpdef e1 = envltck
#impltmp
map$e1nv$fopr<x0><y0><e1> = d3exp1_trxltck
}(*where*)//end-of-[d3exp1lst_trxltck(d3es,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3ecl1lst_trxltck
(dcls, env0) =
list_map$e1nv(dcls, env0) where
{
#typedef x0 = d3ecl1
#typedef y0 = d3ecl1
#vwtpdef e1 = envltck
#impltmp
map$e1nv$fopr<x0><y0><e1> = d3ecl1_trxltck
}(*where*)//end-of-[d3ecl1lst_trxltck(dcls,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3valdcl1lst_trxltck
(d3vs, env0) =
list_map$e1nv(d3vs, env0) where
{
#vwtpdef e1 = envltck
#typedef x0 = d3valdcl1
#typedef y0 = d3valdcl1
#impltmp
map$e1nv$fopr<x0><y0><e1> = d3valdcl1_trxltck
}(*where*)//end-of-[d3valdcl1lst_trxltck(d3es,env0)]
//
#implfun
d3vardcl1lst_trxltck
(d3vs, env0) =
list_map$e1nv(d3vs, env0) where
{
#vwtpdef e1 = envltck
#typedef x0 = d3vardcl1
#typedef y0 = d3vardcl1
#impltmp
map$e1nv$fopr<x0><y0><e1> = d3vardcl1_trxltck
}(*where*)//end-of-[d3vardcl1lst_trxltck(d3es,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3ecl1lstopt_trxltck
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
  optn_cons(d3ecl1lst_trxltck(dcls, env0)))
)(*case+*)//end-of-[d3ecl1lstopt_trxltck(dopt,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trxltck.dats] *)
(***********************************************************************)
