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
Wed 10 Jul 2024 10:42:18 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
max$nil() =
(
  $raise UndefinedExn())
#impltmp
< x0:t0 >
min$nil() =
(
  $raise UndefinedExn())
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
get_at$exn
  (xs, i0) =
(
$raise SubscriptExn(*void*))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
set_at$exn
  (xs, i0, x0) =
(
$raise SubscriptExn(*void*))
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
fset_at$exn
  (xs, i0, x0) =
(
$raise SubscriptExn(*void*))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
forall$test =
rforall$test<x0>
#impltmp
< x0:t0 >
rforall$test = forall$test<x0>
//
#impltmp
< x0:t0 >
iforall$test =
irforall$test<x0>
#impltmp
< x0:t0 >
irforall$test = iforall$test<x0>
*)
//
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
foritm$work =
rforitm$work<x0>
#impltmp
< x0:t0 >
rforitm$work = foritm$work<x0>
//
#impltmp
< x0:t0 >
iforitm$work =
irforitm$work<x0>
#impltmp
< x0:t0 >
irforitm$work = iforitm$work<x0>
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
< r0:vt >
folditm$fopr
( r0
, x0 ) =
(
rfolditm$fopr<x0><r0>(x0, r0))
#impltmp
< x0:t0 >
< r0:vt >
rfolditm$fopr
( x0
, r0 ) =
(
  folditm$fopr<x0><r0>(r0, x0))
*)
//
(* ****** ****** *)
//
(*
#impltmp
< x0:t0 >
< r0:vt >
foldall$fopr
( r0
, x0 ) =
(
rfoldall$fopr<x0><r0>(x0, r0))
#impltmp
< x0:t0 >
< r0:vt >
rfoldall$fopr
( x0
, r0 ) =
(
  foldall$fopr<x0><r0>(r0, x0))
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-16:
Tue 16 Jul 2024 10:43:39 AM EDT
*)
(*
#impltmp
< x0:t0 >
exists$test =
rexists$test<x0>
#impltmp
< x0:t0 >
rexists$test = exists$test<x0>
//
#impltmp
< x0:t0 >
iexists$test =
irexists$test<x0>
#impltmp
< x0:t0 >
irexists$test = iexists$test<x0>
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gbas001.dats] *)
