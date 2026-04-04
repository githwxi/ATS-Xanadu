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
Wed Apr  1 09:21:22 AM EDT 2026
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-03-29:
For multi-sets (msets), where
an item can occur multiple times
*)
//
#abstype
fmset_tbox(itm:type+) <= p0tr
#sexpdef fmset = fmset_tbox(*itm*)
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
funmset_nil
{itm:t0}((*void*)): fmset(itm)
fun<>
funmset_make_nil
{itm:t0}((*void*)): fmset(itm)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
funmset_nilq
{itm:t0}(set: fmset(itm)): bool
fun<>
funmset_consq
{itm:t0}(set: fmset(itm)): bool
//
#symload
nilq with funmset_nilq of 1000
#symload
consq with funmset_consq of 1000
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-04-01:
It counts the number of keyvals.
*)
fun
<itm:t0>
funmset_size
(set: fmset(itm)): nint
(*
HX-2026-04-01:
This one does not count duplicates
*)
fun
<itm:t0>
funmset_set$size
(set: fmset(itm)): nint
//
#symload
  size with funmset_size of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<itm:t0>
funmset_print
(set: fmset(itm)): void
fun
<itm:t0>
funmset_set$print
(set: fmset(itm)): void
(*
#symload
  print with funmset_print of 1000
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<itm:t0>
funmset_strmize
(set: fmset(itm)): strm_vt(itm)
(*
HX-2026-04-01:
This one does not enumerate duplicates
*)
fun
<itm:t0>
funmset_set$strmize
(set: fmset(itm)): strm_vt(itm)
//
#symload
  strmize with funmset_strmize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<itm:t0>
funmset_memberq
  (set: fmset(itm), x0: itm): bool
fun
<itm:t0>
funmset_member$cnt
  (set: fmset(itm), x0: itm): nint
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<itm:t0>
funmset_insert$any
(set: fmset(itm), x0: itm): fmset(itm)
//
(* ****** ****** *)
//
fun
<itm:t0>
funmset_remove$any
(set: fmset(itm), x0: itm): fmset(itm)
fun
<itm:t0>
funmset_remove$old
(set: fmset(itm), x0: itm): fmset(itm)
fun
<itm:t0>
funmset_remove$opt
(set: fmset(itm), x0: itm): (fmset(itm), bool)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<itm:t0>
funmset_getout$opt
(set: fmset(itm), x0: itm): (fmset(itm), optn_vt(itm))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_SATS_funmset.sats] *)
(***********************************************************************)
