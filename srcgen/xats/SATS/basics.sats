(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: June, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#define PROPSORT 0
#define VIEWSORT 0
//
#define TYPESORT 0
#define TBOXSORT 0
#define TFLATSORT 0
#define VTYPESORT 0
#define VTBOXSORT 0
#define VTFLATSORT 0
//
(* ****** ****** *)
//
typedef
eq_type(a:t0ype) = (a, a) -> bool
typedef
neq_type(a:t0ype) = (a, a) -> bool
//
typedef
compare_type(a:t0ype) = (a, a) -> int
//
(* ****** ****** *)

(* end of [xats_basics.sats] *)
