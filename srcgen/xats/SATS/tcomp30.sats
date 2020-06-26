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

#staload "./statyp2.sats"
#staload "./dynexp3.sats"
#staload "./intrep0.sats"

(* ****** ****** *)

fun
tcomp30_program
(prog: d3eclist): h0dclist

(* ****** ****** *)
//
fun
tcomp30_sort(s2t0: sort2): h0srt
fun
tcomp30_type(t2p0: t2ype): h0typ
//
(* ****** ****** *)
//
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
