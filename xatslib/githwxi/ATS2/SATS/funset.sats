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
<itm:t0>
equal_itm_itm
(x1: itm, x2: itm): bool
fun
<itm:t0>
compare_itm_itm
(x1: itm, x2: itm): sint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
funset_nil
{itm:t0}((*void*)): fset(itm)
fun<>
funset_make_nil
{itm:t0}((*void*)): fset(itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
funset_nilq
{itm:t0}(set: fset(itm)): bool
fun<>
funset_consq
{itm:t0}(set: fset(itm)): bool
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
<itm:t0>
funset_size(set: fset(itm)): nint
#symload size with funset_size of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<itm:t0>
funset_print(set: fset(itm)): void
(*
#symload print with funset_print of 1000
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<itm:t0>
funset_strmize
(set: fset(itm)): strm_vt(itm)
#symload
  strmize with funset_strmize of 1000
//
fun
<itm:t0>
funset_listize
(set: fset(itm)): list_vt(itm)
#symload
  listize with funset_listize of 1000
//
(* ****** ****** *)
//
(*
HX-2026-04-04:
Should be using GSEQ instead?
*)
fun
<itm:t0>
funset_forall(set: fset(itm)): bool
#symload forall with funset_forall of 1000
fun
<itm:t0>
funset_foritm(set: fset(itm)): void
#symload foritm with funset_foritm of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<itm:t0>
funset_memberq
(set: fset(itm), x0: itm): bool
//
(* ****** ****** *)
//
fun
<itm:t0>
funset_union
(set: fset(itm), xs: fset(itm)): fset(itm)
fun
<itm:t0>
funset_inter
(set: fset(itm), xs: fset(itm)): fset(itm)
fun
<itm:t0>
funset_diffr
(set: fset(itm), xs: fset(itm)): fset(itm)
//
(* ****** ****** *)
//
fun
<itm:t0>
funset_insert$any
(set: fset(itm), x0: itm): fset(itm)
fun
<itm:t0>
funset_insert$new
(set: fset(itm), x0: itm): fset(itm)
fun
<itm:t0>
funset_insert$opt
(set: fset(itm), x0: itm): (fset(itm), bool)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<itm:t0>
funset_remove$any
(set: fset(itm), x0: itm): fset(itm)
fun
<itm:t0>
funset_remove$old
(set: fset(itm), x0: itm): fset(itm)
fun
<itm:t0>
funset_remove$opt
(set: fset(itm), x0: itm): (fset(itm), bool)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_SATS_funset.sats] *)
(***********************************************************************)
