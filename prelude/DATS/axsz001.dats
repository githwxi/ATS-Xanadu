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
Mon 12 Aug 2024 09:58:00 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
a1sz_forall =
gasz_forall<a1sz(x0)><x0>
#impltmp
< x0:vt >
a1sz_forall_f1un
  (A, test) =
(
a1sz_forall<x0>(A)) where
{
#impltmp
forall$test1<x0>(x0) = test(x0)
}(*where*)//end(a1sz_forall_f1un)
//
#impltmp
{ x0:t0 }
gseq_forall
<a1sz(x0)><x0>
  ( A ) =
(
a1sz_forall<x0>(A)) where
{
#impltmp
forall$test1<x0> = forall$test<x0>
}
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
a1sz_rforall =
gasz_rforall<a1sz(x0)><x0>
#impltmp
{ x0:vt }
a1sz_rforall_f1un
  (A, test) =
(
a1sz_rforall<x0>(A)) where
{
#impltmp
rforall$test1<x0>(x0) = test(x0)
}(*where*)//end(a1sz_rforall_f1un)
//
#impltmp
{ x0:t0 }
gseq_rforall
<a1sz(x0)><x0>
  ( A ) =
(
a1sz_rforall<x0>(A)) where
{
#impltmp
rforall$test1<x0> = rforall$test<x0>
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_axsz001.dats] *)
