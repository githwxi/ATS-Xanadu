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
Tue Mar 31 12:27:13 PM EDT 2026
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/funset.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/funmap.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef emp = void
//
#absimpl
fset_tbox(itm:t0) = fmap(itm, emp)
// end of [fset_tbox]
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funset_strmize =
  funmap_key$strmize<itm><emp>(*set*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funset_remove$old =
  funmap_remove$old<itm><emp>(*set,x0*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<itm:t0>
funset_insert$new
  (set, x0) =
  funmap_insert$new<itm><emp>(set, x0, ())
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_xatslib_githwxi_ATS2_DATS_funset_fmap000.dats] *)
(***********************************************************************)
