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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Mon 09 Sep 2024 08:48:13 AM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#extern
fun<>
strn_sint$parse$fwork
( rep0: strn
, work: (sint)->void): void
//
#impltmp
g_parse$opt
< sint >
( rep0 ) =
list_head$opt
(
list_fmake_fwork
(
lam(work) =>
strn_sint$parse$fwork(rep0, work)))
//
#impltmp
<(*tmp*)>
strn_sint$parse$fwork
  (rep0, work) =
(
XATS2JS_strn_sint$parse$fwork
  (rep0, work)) where
{
#extern
fun
XATS2JS_strn_sint$parse$fwork
(rep0: strn, work:(sint)->void): void = $extnam()
}
//
(* ****** ****** *)
//
#extern
fun<>
strn_dflt$parse$fwork
( rep0: strn
, work: (dflt)->void): void
//
#impltmp
g_parse$opt
< dflt >
( rep0 ) =
list_head$opt
(
list_fmake_fwork
(
lam(work) =>
strn_dflt$parse$fwork(rep0, work)))
//
#impltmp
<(*tmp*)>
strn_dflt$parse$fwork
  (rep0, work) =
(
XATS2JS_strn_dflt$parse$fwork
  (rep0, work)) where
{
#extern
fun
XATS2JS_strn_dflt$parse$fwork
(rep0: strn, work:(dflt)->void): void = $extnam()
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_CATS_JS_gbas000.dats] *)
