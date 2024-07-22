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
Fri 12 Jul 2024 11:29:01 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsafex.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<(*tmp*)>
nint_forall(xs) =
loop(xs, 0(*i0*)) where
{
fun
loop
(xs: ni, i0: ni): bool =
if
(i0 >= xs)
then false else
(
if
forall$test<ni>(i0)
then loop(xs, i0+1) else false)}
//
#impltmp
gseq_forall0
<ni><ni>(xs) =
(
nint_forall<>(xs)) where
{
#typedef x0 = ni
#impltmp
forall$test<x0> = forall0$test<x0>
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-22:
Mon 22 Jul 2024 09:02:06 AM EDT
*)
//
#impltmp
<(*tmp*)>
nint_strmize(ni) =
(
  auxmain(0)) where
{
fun
auxmain
(i0: nint):
strm_vt(ni) = $llazy
(
if
(i0 >= ni)
then strmcon_vt_nil() else
strmcon_vt_cons(i0, auxmain(i0+1))
)
}(*where*)//end-[nint_strmize(ni)]
//
#impltmp
<(*tmp*)>
nint_strqize(ni) =
(
 $UN.strm2q_vt(nint_strmize<>(ni)))
//
(* ****** ****** *)
//
#impltmp
gseq_strmize0<ni><ni> = nint_strmize<>
#impltmp
gseq_strmize1<ni><ni> = nint_strmize<>
//
#impltmp
gseq_strqize0<ni><ni> = nint_strqize<>
#impltmp
gseq_strqize1<ni><ni> = nint_strqize<>
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gint001.dats] *)
