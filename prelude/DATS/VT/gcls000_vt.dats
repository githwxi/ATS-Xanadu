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
Mon 29 Jul 2024 06:15:29 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#staload UN = 
"prelude/SATS/unsfx00.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_unmk0
(  gseq  ) = $UN.castxy0(gseq)
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_unmk1
(  gseq  ) = $UN.castxy1(gseq)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_forall0
  (gseq) =
(
gseq_forall0<xs><x0>(GLSEQ_unmk0(gseq)))
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_forall1
  (gseq) =
let
val
(pf|xs) = GLSEQ_unmk1(gseq)
val btf = gseq_forall1<xs><x0>(xs)
prval () = owed_vt_return0(pf, xs) in btf
end//let//end-of-[GLSEQ_forall1(gseq)]
//
(* ****** ****** *)
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_forall0$f1un
  (gseq, test) =
(
GLSEQ_forall0<xs><x0>(gseq)) where
{
#impltmp forall$test0<x0>(x0) = test(x0)
}
//
#impltmp
< xs:vt >
< x0:vt >
GLSEQ_forall1$f1un
  (gseq, test) =
(
GLSEQ_forall1<xs><x0>(gseq)) where
{
#impltmp forall$test1<x0>(x0) = test(x0)
}
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_VT_gcls000_vt.dats] *)
