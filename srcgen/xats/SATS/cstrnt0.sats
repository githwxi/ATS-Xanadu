(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: March 27, 2021
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./xbasics.sats"

(* ****** ****** *)

#staload S2E = "./staexp2.sats"
#staload S2T = "./statyp2.sats"

(* ****** ****** *)

typedef s2exp = $S2E.s2exp
typedef t2ype = $S2T.t2ype

(* ****** ****** *)

abstbox c0str_tbox = ptr
typedef c0str = c0str_tbox
typedef c0strlst = List0(c0str)
typedef c0stropt = Option(c0str)

(* ****** ****** *)
//
datatype
c0str_node =
| C0Stlte of (s2exp, s2exp)
//
(* ****** ****** *)

(* end of [xats_cstrnt0.sats] *)
