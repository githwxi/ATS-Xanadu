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
// Start Time: December, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

#staload
SYM = "./../SATS/symbol.sats"

(* ****** ****** *)
//
#staload "./../SATS/staexp2.sats"
//
(* ****** ****** *)
//
abstype
s2cstnul_tbox(l:addr) = ptr
typedef
s2cstnul(l:addr) = s2cstnul_tbox(l)
//
typedef s2cstnul = [l:agez] s2cstnul(l)
//
(* ****** ****** *)
//
extern
castfn
s2cstnul_none(ptr(null)): s2cstnul(null)
extern
castfn
s2cstnul_some(s2cst):<> [l:agz] s2cstnul(l)
extern
castfn
s2cstnul_unsome{l:agz}(s2cstnul(l)):<> s2cst
//
(* ****** ****** *)
//
extern
fun
s2cstnul_iseqz
{l:addr}(s2cstnul(l)): bool(l==null)
// end of [s2cstnul_iseqz]
extern
fun
s2cstnul_isneqz
{l:addr}(s2cstnul(l)): bool(l > null)
// end of [s2cstnul_isneqz]
//
overload iseqz with s2cstnul_iseqz
overload isneqz with s2cstnul_isneqz
//
(* ****** ****** *)
//
local

extern
castfn
_cast_
{l:addr}(s2cstnul(l)):<> ptr(l)

in (*in-of-local*)
//
implement
s2cstnul_iseqz
  (s2c) = (_cast_(s2c) = the_null_ptr)
implement
s2cstnul_isneqz
  (s2c) = (_cast_(s2c) > the_null_ptr)
//
end // end of [local]
//
(* ****** ****** *)

(* end of [xats_staexp2_const.dats] *)
