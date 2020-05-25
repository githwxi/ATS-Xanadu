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

#staload "./basics.sats"

(* ****** ****** *)

#staload "./staexp2.sats"
#staload "./statyp2.sats"

(* ****** ****** *)

#staload "./dynexp3.sats"

(* ****** ****** *)

#staload "./intrep0.sats"

(* ****** ****** *)

absvtype compenv_vtype
vtypedef compenv = compenv_vtype

(* ****** ****** *)
//
fun
xcomp3i_dexp
( env0
: !compenv, d3e0: d3exp): i0val
fun
xcomp3i_dexpopt
( env0
: !compenv, opt0: d3expopt): i0valopt
fun
xcomp3i_dexplst
( env0
: !compenv, d3es: d3explst): i0valist
//
(* ****** ****** *)

(* end of [xats_xcomp3i.sats] *)
