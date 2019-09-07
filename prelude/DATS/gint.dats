(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

typedef sik = sint_k
typedef uik = uik

typedef slik = slint_k
typedef ulik = ulint_k

typedef ssik = ssize_k
typedef usik = usize_k

typedef sllik = sllint_k
typedef ullik = ullint_k

(* ****** ****** *)
//
impltmp
g0int_add<sik,sik><sik> = g0add_sint_sint
impltmp
g1int_add<sik,sik><sik> = g1add_sint_sint
//
(* ****** ****** *)
//
impltmp
g0int_sub<sik,sik><sik> = g0sub_sint_sint
impltmp
g1int_sub<sik,sik><sik> = g1sub_sint_sint
//
(* ****** ****** *)
//
impltmp
g0int_mul<sik,sik><sik> = g0mul_sint_sint
impltmp
g1int_mul<sik,sik><sik> = g1mul_sint_sint
//
(* ****** ****** *)
//
impltmp
g0int_div<sik,sik><sik> = g0div_sint_sint
impltmp
g1int_div<sik,sik><sik> = g1div_sint_sint
//
(* ****** ****** *)
(*
** for generics
*)
(* ****** ****** *)

#staload
"./../SATS/gint.sats"

(* ****** ****** *)
//
impltmp
gint_add<sik>(x, y) = gint_add_sint_sint(x, y)
impltmp
gint_sub<sik>(x, y) = gint_sub_sint_sint(x, y)
impltmp
gint_mul<sik>(x, y) = gint_mul_sint_sint(x, y)
impltmp
gint_div<sik>(x, y) = gint_div_sint_sint(x, y)
impltmp
gint_mod<sik>(x, y) = gint_mod_sint_sint(x, y)
//
(* ****** ****** *)
//
impltmp
gint_add<uik>(x, y) = gint_add_uint_uint(x, y)
impltmp
gint_sub<uik>(x, y) = gint_sub_uint_uint(x, y)
impltmp
gint_mul<uik>(x, y) = gint_mul_uint_uint(x, y)
impltmp
gint_div<uik>(x, y) = gint_div_uint_uint(x, y)
impltmp
gint_mod<uik>(x, y) = gint_mod_uint_uint(x, y)
//
(* ****** ****** *)

(* end of [gint.dats] *)
