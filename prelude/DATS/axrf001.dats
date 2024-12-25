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
Sun 11 Aug 2024 03:44:27 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_forall
<a0rf(x0)><x0>
 (   arf   ) =
let
val x0 =
a0rf_get<x0>(arf) in
(
  forall$test<x0>(x0)) end
#impltmp
{ x0:t0 }
gseq_rforall
<a0rf(x0)><x0>
 (   arf   ) =
let
val x0 =
a0rf_get<x0>(arf) in
(
  rforall$test<x0>(x0)) end
#impltmp
{ x0:t0 }
gseq_iforall
<a0rf(x0)><x0>
 (   arf   ) =
let
val x0 =
a0rf_get<x0>(arf) in
(
  iforall$test<x0>(0, x0)) end
#impltmp
{ x0:t0 }
gseq_irforall
<a0rf(x0)><x0>
 (   arf   ) =
let
val x0 =
a0rf_get<x0>(arf) in
(
  irforall$test<x0>(0, x0)) end
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:vt }
gasz_forall
<a0rf(x0)><x0>
 (   arf   ) =
let
val
(pf|x0) = 
a0rf_lget<x0>(arf)
val btf =
forall$test1<x0>(x0)
prval () =
owed_vt_return0(pf, x0) in btf end
//
#impltmp
{ x0:vt }
gasz_rforall
<a0rf(x0)><x0>
 (   arf   ) =
let
val
(pf|x0) = 
a0rf_lget<x0>(arf)
val btf =
rforall$test1<x0>(x0)
prval () =
owed_vt_return0(pf, x0) in btf end
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:vt >
a1rf_strmize =
gasz_strmize<a1rf(x0)><x0>(*void*)
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_strmize
<a1rf(x0)><x0> =
gasz_strmize<a1rf(x0)><x0>(*void*)
#impltmp
{ x0:vt }
gseq_strmize1
<a1rf(x0)><x0> =
gasz_strmize<a1rf(x0)><x0>(*void*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_forall
<a1rf(x0)><x0>
  ( A ) =
(
gasz_forall
<a1rf(x0)><x0>(A)) where
{
#impltmp
forall$test1<x0> = forall$test<x0>
}
#impltmp
{ x0:vt }
gseq_forall1
<a1rf(x0)><x0> =
gasz_forall<a1rf(x0)><x0>(* void *)
//
(* ****** ****** *)
//
#impltmp
{ x0:t0 }
gseq_rforall
<a1rf(x0)><x0>
  ( A ) =
(
gseq_rforall1
<a1rf(x0)><x0>(A)) where
{
#impltmp
rforall$test1<x0> = rforall$test<x0>
}
//
#impltmp
{ x0:vt }
gseq_rforall1
<a1rf(x0)><x0> =
gasz_rforall<a1rf(x0)><x0>(* void *)
//
(* ****** ****** *)
//
#impltmp
< x0:vt >
a1rf_forall$size
  (A, n) =
let
#impltmp
gasz_length
<a1rf(x0)><x0>(A) = (n)
in//let
  gasz_forall<a1rf(x0)><x0>(A)
end//let//end-of-[a1rf_forall$size]
//
#impltmp
< x0:vt >
a1rf_forall$size$f1un
  (A, n, test) =
(
  a1rf_forall$size<x0>(A, n))
where
{ #impltmp
  forall$test1<x0>(x0) = test(x0) }
(*where*)//end-of-[a1rf_forall$size$f1un]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_axrf001.dats] *)
