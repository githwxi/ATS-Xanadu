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
// For various pointers
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: July, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
typedef
cp1tr_k = $extype("xats_cp1tr_t")
typedef
cp2tr_k = $extype("xats_cp2tr_t")
(* ****** ****** *)
//
(*
HX-2020-07-30:
const pointers are read-only
*)
//
abstype
cp1tr_tbox
(l:addr) <= cp1tr_k
abstype
cp2tr_tbox
(x:vwtp, l:addr) <= cp2tr_k
//
typedef
cp1tr0 = [l:a0] cp1tr_tbox(l)
typedef
cp1tr1(l: a0) = cp1tr_tbox(l)
//
typedef
cptr0(x: vt) = [l:a0] cptr_tbox(x, l)
typedef
cptr1(x: vt, l: a0) = cptr_tbox(x, l)
//
typedef cp1tr = cp1tr0
typedef cp1tr(l:a0) = cp1tr1(l)
typedef cp2tr(x:vt) = cp2tr0(x)
typedef cp2tr(x:vt, l:a0) = cp2tr1(x, l)
//
(* ****** ****** *)

fcast
{a:vt}
{l:addr}
p2tr_constize
(p0: p2tr(a, l)): cp2tr(a, l)
#symload cp2tr with p2tr_constize of 1000
#symload const with p2tr_constize of 1000

(* ****** ****** *)

(* end of [gptr.sats] *)
