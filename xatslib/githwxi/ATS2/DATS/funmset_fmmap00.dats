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
Wed Apr  1 04:49:24 PM EDT 2026
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/funmset.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/funmmap.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef emp = void
//
#absimpl
fmset_tbox(itm:t0) = fmmap(itm, emp)
// end of [fset_tbox]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*00*)>
funmset_nil() = funmmap_nil<>()
#impltmp
<(*00*)>
funmset_make_nil
  ((*void*)) = funmmap_make_nil<>()
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funmset_size(*set*) =
  funmmap_size<itm><emp>(*set*)
//
(* ****** ****** *)
//
#impltmp
<itm:t0>
funmset_strmize
  (  set  ) =
(
strm_vt_map0<kx><k0>
(
funmmap_keyval$strmize<itm><emp>(set))
) where
{
#typedef k0 = itm
#typedef kx = @(itm, emp)
#impltmp map$fopr0<kx><k0>(kx) = (kx.0)
}(*where*)//end-of-[funmset_strmize(set)]
//
(* ****** ****** *)
//
#impltmp
<itm:t0>
funmset_set$strmize
  (* set *) =
  funmmap_key$strmize<itm><emp>(*set*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funmset_memberq
  (*set, x0*) = 
  funmmap_search$tst<itm><emp>(*set,x0*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funmset_remove$old
  (* set, x0 *) =
  funmmap_remove$old<itm><emp>(*set,x0*)
//
#impltmp
<itm:t0>
funmset_remove$opt
  (* set, x0 *) =
  funmmap_remove$opt<itm><emp>(*set,x0*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funmset_insert$any
  (  set, x0  ) =
(
funmmap_insert$any<itm><emp>(set, x0, ()))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_DATS_funmset_fmmap00.dats] *)
(***********************************************************************)
