(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
//
// Author: Hongwei Xi
// Start Time: May 24, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./staexp2.sats"
#staload "./statyp2.sats"
#staload "./dynexp2.sats"

(* ****** ****** *)

#staload "./dynexp3.sats"

(* ****** ****** *)

#staload "./intrep0.sats"

(* ****** ****** *)
//
fun
the_d2vmap_search_ref
(d2v: d2var): cPtr0(hdvar)
fun
the_d2vmap_search_opt
(d2v: d2var): Option_vt(hdvar)
//
fun
the_d2vmap_insert_any
(d2v0: d2var, hdv1: hdvar): void
fun
the_d2vmap_insert_exn
(d2v0: d2var, hdv1: hdvar): void
//
(* ****** ****** *)

fun
tcomp30_program
(prog: d3eclist): h0dclist

(* ****** ****** *)

fun
hdvar_make_dvar(d2var): hdvar
fun
hdcon_make_dcon(d2con): hdcon
fun
hdcst_make_dcst(d2cst): hdcst

(* ****** ****** *)
//
fun
tcomp30_sort
  (s2t0: sort2): h0srt
fun
tcomp30_sortlst
  (s2ts: sort2lst): h0srtlst
//
(* ****** ****** *)
//
fun
tcomp30_type
  (t2p0: t2ype): h0typ
fun
tcomp30_typelst
  (t2ps: t2ypelst): h0typlst
//
(* ****** ****** *)
//
fun
tcomp30_dvar(d2v0: d2var): hdvar
fun
tcomp30_dcon(d2c0: d2con): hdcon
fun
tcomp30_dcst(d2c0: d2cst): hdcst
//
(* ****** ****** *)

fun
tcomp30_dexp(d3e0: d3exp): h0exp
fun
tcomp30_dexpopt(d3expopt): h0expopt
fun
tcomp30_dexplst(d3explst): h0explst
//
(* ****** ****** *)
//
fun
tcomp30_decl(d3c0: d3ecl): h0dcl
fun
tcomp30_declist(d3eclist): h0dclist
//
(* ****** ****** *)

(* end of [xats_tcomp30.sats] *)
