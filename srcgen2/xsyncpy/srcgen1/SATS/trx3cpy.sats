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
Tue May 20 12:46:19 PM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
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
#absvtbx
env3cpy_vtbx
#vwtpdef
env3cpy = env3cpy_vtbx
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../SATS/dynexp3.sats"
(* ****** ****** *)
#staload
"./../../../SATS/dynexp3.sats"
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3parsed_trx3cpy
( dpar : d3parsed ): (d3parsed1)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
env3cpy_make$nil((*0*)): env3cpy
fun
env3cpy_free$top(env3cpy): (void)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3pat_trx3cpy
(d3p0: d3pat, env0: !env3cpy): d3pat1
fun
d3exp_trx3cpy
(d3e0: d3exp, env0: !env3cpy): d3exp1
//
fun
d3ecl_trx3cpy
(d3cl: d3ecl, env0: !env3cpy): d3ecl1
//
(* ****** ****** *)
//
fun
d3patlst_trx3cpy
(d3ps: d3patlst, env0: !env3cpy): d3pat1lst
fun
d3explst_trx3cpy
(d3es: d3explst, env0: !env3cpy): d3exp1lst
//
fun
d3eclist_trx3cpy
(dcls: d3eclist, env0: !env3cpy): d3ecl1lst
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
d3eclistopt_trx3cpy
(dcls: d3eclistopt, env0: !env3cpy): d3ecl1lstopt
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_trx3cpy.sats] *)
(***********************************************************************)
