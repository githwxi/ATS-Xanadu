(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun Dec 21 01:27:59 AM EST 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_forall
  ( xs ) =
(
  auxmain(xs)) where
{
fun
auxmain
(xs: strm(x0)): bool =
(
case+ !xs of
|strmcon_nil
( (*void*) ) => true
|strmcon_cons
(  x1, xs  ) =>
(
if
forall$test
< x0 >( x1 )
then auxmain(xs) else false)
)(*case+*)//end-of-[auxmain(xs)]
}(*where*)//end-of-[strm_forall(xs)]
//
#impltmp
{ x0:t0 }
gseq_forall
<strm(x0)><x0> = strm_forall<x0>(*0*)
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
strm_forall$f1un
  (xs, test) =
(
strm_forall
<  x0  >(  xs  )) where
{
#impltmp
forall$test<x0>(x0) = test(x0)
}(*where*)//end-of-[strm_forall$f1un]
//
#impltmp
{ x0:t0 }
gseq_forall$f1un
<strm(x0)>< x0 > = strm_forall$f1un<x0>(*0*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_strm001.dats] *)
(***********************************************************************)
