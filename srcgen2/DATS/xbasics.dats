(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Start Time: May 28th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)
//
fun
POLPOS
(x:int):int=(x+0010(*08*))
fun
POLNEG
(x:int):int=(x+0100(*64*))
//
(* ****** ****** *)

#implfun
sortbox(knd) =
g0u2s
(g0s2u(knd) & g0s2u(01))

#implfun
sortlin(knd) =
g0u2s
((g0s2u(knd)>>1) & g0s2u(01))

#implfun
sortprf(knd) =
g0u2s
((g0s2u(knd)>>2) & g0s2u(01))

#implfun
sortpol(knd) =
let
val knd = (knd >> 3)
in//let
if knd <= 1 then knd else (-1)
end // end of [sortpol]

(* ****** ****** *)
//
#implfun
sortpolpos
  (knd) = POLPOS
(
 g0u2s(g0s2u(knd) & g0s2u(07))
)
#implfun
sortpolneg
  (knd) = POLNEG
(
 g0u2s(g0s2u(knd) & g0s2u(07))
)
//
(* ****** ****** *)
//
(*
HX-2022-10-28:
1. vwtp <= view
2. type <= prop
3. type <= vwtp
*)
//
#implfun
subsort_test(t1, t2) =
(
if
( sortbox(t1)
< sortbox(t2) ) then false
else
(
if
( sortlin(t1)
> sortlin(t2) ) then false
else
( sortprf(t1) <= sortprf(t2) )
)
) (*if*) // end of [subsort_test]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xbasics.dats] *)
