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
Thu May 22 05:53:42 PM EDT 2025
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
"./../SATS/trx3cpy.sats"
//
(* ****** ****** *)
//
#staload
"./../../../SATS/dynexp3.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#include "./../HATS/mytmplib00.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3parsed_trx3cpy
  (dpar) = let
//
val stadyn =
d3parsed_get_stadyn(dpar)
val nerror =
d3parsed_get_nerror(dpar)
val source =
d3parsed_get_source(dpar)
//
(*
val t1penv =
d3parsed_get_t1penv(dpar)
val t2penv =
d3parsed_get_t2penv(dpar)
val t3penv =
d3parsed_get_t3penv(dpar)
*)
val parsed =
d3parsed_get_parsed(dpar)
//
val env0 = env3cpy_make_nil()
//
val parsed =
d3eclistopt_trx3cpy(parsed, env0)
//
in//let
//
let
val ((*0*)) = env3cpy_free_nil(env0)
in//let
(
d3parsed1(stadyn, nerror, source, parsed))
end//let
//
end(*let*)//end-of-[d3parsed_trx3cpy(dpar)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3patlst_trx3cpy
(d3ps, env0) =
list_map$e1nv(d3ps, env0) where
{
#typedef x0 = d3pat
#typedef y0 = d3pat1
#vwtpdef e1 = env3cpy
#impltmp
map$e1nv$fopr<x0><y0><e1> = d3pat_trx3cpy
}(*where*)//end-of-[d3patlst_trx3cpy(d3ps,env0)]
//
(* ****** ****** *)
//
#implfun
d3explst_trx3cpy
(d3es, env0) =
list_map$e1nv(d3es, env0) where
{
#typedef x0 = d3exp
#typedef y0 = d3exp1
#vwtpdef e1 = env3cpy
#impltmp
map$e1nv$fopr<x0><y0><e1> = d3exp_trx3cpy
}(*where*)//end-of-[d3explst_trx3cpy(d3es,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3eclist_trx3cpy
(dcls, env0) =
list_map$e1nv(dcls, env0) where
{
#typedef x0 = d3ecl
#typedef y0 = d3ecl1
#vwtpdef e1 = env3cpy
#impltmp
map$e1nv$fopr<x0><y0><e1> = d3ecl_trx3cpy
}(*where*)//end-of-[d3eclist_trx3cpy(d3es,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3valdclist_trx3cpy
(d3vs, env0) =
list_map$e1nv(d3vs, env0) where
{
#vwtpdef e1 = env3cpy
#typedef x0 = d3valdcl
#typedef y0 = d3valdcl1
#impltmp
map$e1nv$fopr<x0><y0><e1> = d3valdcl_trx3cpy
}(*where*)//end-of-[d3valdclist_trx3cpy(d3es,env0)]
//
#implfun
d3vardclist_trx3cpy
(d3vs, env0) =
list_map$e1nv(d3vs, env0) where
{
#vwtpdef e1 = env3cpy
#typedef x0 = d3vardcl
#typedef y0 = d3vardcl1
#impltmp
map$e1nv$fopr<x0><y0><e1> = d3vardcl_trx3cpy
}(*where*)//end-of-[d3vardclist_trx3cpy(d3es,env0)]
//
(* ****** ****** *)
//
#implfun
d3fundclist_trx3cpy
(d3fs, env0) =
list_map$e1nv(d3fs, env0) where
{
#vwtpdef e1 = env3cpy
#typedef x0 = d3fundcl
#typedef y0 = d3fundcl1
#impltmp
map$e1nv$fopr<x0><y0><e1> = d3fundcl_trx3cpy
}(*where*)//end-of-[d3fundclist_trx3cpy(d3es,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
#implfun
d3eclistopt_trx3cpy
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
  optn_cons(d3eclist_trx3cpy(dcls, env0)))
)(*case+*)//end-of-[d3eclistopt_trx3cpy(dopt,env0)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_DATS_trx3cpy.dats] *)
(***********************************************************************)
