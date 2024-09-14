(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
(*
Sat 07 Sep 2024 12:09:18 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX:
This one is also
implemented in [gdbg000.dats]:
*)
#impltmp
{ t0:t0 }
g_ptype
<optn(t0)>
( (*void*) ) =
(
pstrn("optn(");
g_ptype<t0>((*0*)); pstrn(")"))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_nil
<optn(x0)><x0>
  ((*void*)) =
(
  optn_nil((*0*)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
optn_nil_
 ((*0*)) = optn_nil()
#impltmp
< a: t0 >
optn_cons_
 (  x0  ) = optn_cons(x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< (*0*) >
optn_nilq
{a:t0}(xs) =
(
case+ xs of
| optn_nil() => true
| optn_cons(_) => false)
//
#impltmp
{ x0:t0 }
gseq_nilq
<optn(x0)><x0> =
optn_nilq<>{x0}(* void *)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
optn_head
  ( xs ) =
(
case+ xs of
| optn_cons(x0) => (x0))
//
#impltmp
{ x0:t0 }
gseq_head
<optn(x0)><x0> = optn_head<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
$UN.gseq_head$raw
<optn(x0)><x0>(xs) =
(
case- xs of
| optn_cons(x0) => x0)
//
#impltmp
{ x0:t0 }
$UN.gseq_tail$raw
<optn(x0)><x0>(xs) =
(
case- xs of
|
optn_cons(x0) => optn_nil(*0*))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_sep
<optn(x0)><x0>() = ","
#impltmp
{ x0:t0 }
gseq_end
<optn(x0)><x0>() = ")"
#impltmp
{ x0:t0 }
gseq_beg
<optn(x0)><x0>() = "optn("
//
#impltmp
{ x0:t0 }
g_print
<optn(x0)>(xs) =
(
gseq_print<optn(x0)><x0>(xs))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< a: t0 >
optn_make_1val = optn_cons_<a>
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
optn_length
  (xs) =
(
case+ xs of
| optn_nil( ) => 0
| optn_cons(_) => 1)//impltmp
//
#impltmp
{ x0:t0 }
gseq_length
<optn(x0)><x0> = optn_length<x0>
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_optn000.dats] *)
