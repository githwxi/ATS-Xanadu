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
#staload UN = 
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_unmk
(  gseq  ) = $UN.castxy(gseq)
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_unmk
(  gasz  ) = $UN.castxy(gasz)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_listize
  (gseq) =
(
gseq_listize<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_rlistize
  (gseq) =
(
gseq_rlistize<xs><x0>(GSEQ_unmk(gseq)))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_forall
  (gseq) =
(
gseq_forall<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_rforall
  (gseq) =
(
gseq_rforall<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_iforall
  (gseq) =
(
gseq_iforall<xs><x0>(GSEQ_unmk(gseq)))
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_irforall
  (gseq) =
(
gseq_irforall<xs><x0>(GSEQ_unmk(gseq)))
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_forall_c1fr
  (gseq, test) =
(
gseq_forall_c1fr<xs><x0>(GSEQ_unmk(gseq), test))
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : t0>
GSEQ_rforall_c1fr
  (gseq, test) =
(
gseq_rforall_c1fr<xs><x0>(GSEQ_unmk(gseq), test))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_forall
  (gasz) =
(
gasz_forall<xs><x0>(GASZ_unmk(gasz)))
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_rforall
  (gasz) =
(
gasz_rforall<xs><x0>(GASZ_unmk(gasz)))
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_iforall
  (gasz) =
(
gasz_iforall<xs><x0>(GASZ_unmk(gasz)))
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_irforall
  (gasz) =
(
gasz_irforall<xs><x0>(GASZ_unmk(gasz)))
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_forall_c1fr
  (gasz, test) =
(
gasz_forall_c1fr<xs><x0>(GASZ_unmk(gasz), test))
//
(* ****** ****** *)
//
#impltmp
<xs : t0>
<x0 : vt>
GASZ_rforall_c1fr
  (gasz, test) =
(
gasz_rforall_c1fr<xs><x0>(GASZ_unmk(gasz), test))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
GSEQ_make_list
{ x0:t0 }(  xs  ) =
let
#typedef xs = list(x0)
in//let
$UN.castxy{xs}{GSEQ(xs,x0)}(xs)
end//let//end-of-[GSEQ_make_list(xs)]
//
(* ****** ****** *)
//
#impltmp
GSEQ_make_nint0
(  xs  ) =
let
#typedef x0 = unit
#typedef xs = nint
in//let
$UN.castxy{xs}{GSEQ(xs,x0)}(xs)
end//let//end-of-[GSEQ_make_nint0(xs)]
//
#impltmp
GSEQ_make_nint1
(  xs  ) =
let
#typedef x0 = nint
#typedef xs = nint
in//let
$UN.castxy{xs}{GSEQ(xs,x0)}(xs)
end//let//end-of-[GSEQ_make_nint1(x)]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gcls000.dats] *)
