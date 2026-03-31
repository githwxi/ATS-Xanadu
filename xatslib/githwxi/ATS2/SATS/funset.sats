(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
(*
Author: Hongwei Xi
Tue Mar 31 10:00:19 AM EDT 2026
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
//
#abstype
fset_tbox(itm:type+) <= p0tr
#sexpdef fset = fset_tbox(*itm*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
equal_itm_itm
(x1: x0, x2: x0): bool
fun
<x0:t0>
compare_itm_itm
(x1: x0, x2: x0): sint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
funset_nil
{x0:t0}((*void*)): fset(x0)
fun<>
funset_make_nil
{x0:t0}((*void*)): fset(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
funset_nilq
{x0:t0}(set: fset(x0)): bool
fun<>
funset_consq
{x0:t0}(set: fset(x0)): bool
//
#symload
nilq with funset_nilq of 1000
#symload
consq with funset_consq of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
funset_size(set: fset(x0)): nint
#symload size with funset_size of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
funset_print(set: fset(x0)): void
(*
#symload print with funset_print of 1000
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
funset_strmize
(set: fset(x0)): strm_vt(x0)
#symload
  strmize with funset_strmize of 1000
//
(* ****** ****** *)
//
fun
<x0:t0>
funset_forall(set: fset(x0)): bool
#symload forall with funset_forall of 1000
fun
<x0:t0>
funset_foritm(set: fset(x0)): void
#symload foritm with funset_foritm of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funset_memberq
(set: fset(x0), x0: x0): bool
//
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funset_union
(set: fset(x0), st2: fset(x0)): fset(x0)
fun
<key:t0>
<itm:t0>
funset_inter
(set: fset(x0), st2: fset(x0)): fset(x0)
//
(* ****** ****** *)
//
fun
<key:t0>
<itm:t0>
funset_insert$any
(set: fset(x0), x0: x0): fset(x0)
fun
<key:t0>
<itm:t0>
funset_insert$new
(set: fset(x0), x0: x0): fset(x0)
fun
<key:t0>
<itm:t0>
funset_insert$opt
(set: fset(x0), x0: x0): (fset(x0), bool)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_SATS_funset.sats] *)
(***********************************************************************)
