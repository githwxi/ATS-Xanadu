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
p1gez = [l:agez] p1tr1(l)
typedef
p1gtz = [l:agtz] p1tr1(l)
typedef
p2gez(a:vt) = [l:agez] p2tr1(a,l)
typedef
p2gtz(a:vt) = [l:agtz] p2tr1(a,l)
(* ****** ****** *)
typedef
cp1gez = [l:agez] cp1tr1(l)
typedef
cp1gtz = [l:agtz] cp1tr1(l)
typedef
cp2gez(a:vt) = [l:agez] cp2tr1(a,l)
typedef
cp2gtz(a:vt) = [l:agtz] cp2tr1(a,l)
(* ****** ****** *)

fcast
p2tr_constize
{a:vt}{l:a0}
(p0: p2tr(a, l)): cp2tr(a, l)
#symload
cp2tr with p2tr_constize of 1000
#symload
const with p2tr_constize of 1000

(* ****** ****** *)
//
fun
<a:vt>
p1gtz_get(p0: p1gtz): a
fun
<a:vt>
p2gtz_get(p0: p2gtz(a)): a
//
fun
<a:vt>
cp1gtz_get(cp: cp1gtz): a
fun
<a:vt>
cp2gtz_get(cp: cp2gtz(a)): a
//
fun
<a:vt>
p1gtz_set(p0: p1gtz, x0: a): void
fun
<a:vt>
p2gtz_set(p0: p2gtz(a), x0: a): void
//
(* ****** ****** *)

(* end of [gptr.sats] *)
