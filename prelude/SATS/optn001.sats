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
Sat 07 Sep 2024 08:18:49 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
optn_forall(xs: optn(x0)): bool
fun
<x0:t0>
optn_rforall(xs: optn(x0)): bool
fun
<x0:t0>
optn_iforall(xs: optn(x0)): bool
fun
<x0:t0>
optn_irforall(xs: optn(x0)): bool
//
#symload forall with optn_forall of 1000
#symload rforall with optn_rforall of 1000
#symload iforall with optn_iforall of 1000
#symload irforall with optn_irforall of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:t0>
optn_foritm(xs: optn(x0)): void
fun
<x0:t0>
optn_rforitm(xs: optn(x0)): void
fun
<x0:t0>
optn_iforitm(xs: optn(x0)): void
fun
<x0:t0>
optn_irforitm(xs: optn(x0)): void
//
#symload foritm with optn_foritm of 1000
#symload rforitm with optn_rforitm of 1000
#symload iforitm with optn_iforitm of 1000
#symload irforitm with optn_irforitm of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
//
(*
HX-2025-05-29:
Thu May 29 08:44:08 AM EDT 2025
*)
//
fun
<x0:t0>
<y0:t0>
optn_map
{ln:b0}
(xs: optn(x0, ln)): optn(y0, ln)
fun
<x0:t0>
<y0:t0>
optn_map$f1un
{ln:b0}
(xs: optn(x0, ln), (x0)->y0): optn(y0, ln)
//
#symload map with optn_map of 1000
#symload map with optn_map$f1un of 1000
#symload map$fun with optn_map$f1un of 1000
#symload optn_map with optn_map$f1un of 1000
//
(* ****** ****** *)
//
fun
<x0:t0>
<y0:vt>
optn_map_vt
{ln:b0}
(xs: optn(x0, ln)): optn_vt(y0, ln)
fun
<x0:t0>
<y0:vt>
optn_map$f1un_vt
{ln:b0}
(xs: optn(x0, ln), (x0)->y0): optn_vt(y0, ln)
//
#symload map_vt with optn_map_vt of 1000
#symload map_vt with optn_map$f1un_vt of 1000
#symload map$fun_vt with optn_map$f1un_vt of 1000
#symload optn_map_vt with optn_map$f1un_vt of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-06-01:
Sun Jun  1 06:32:15 PM EDT 2025
*)
//
fun
<x0:t0>
<y0:t0>
<e1:vt>
optn_map$e1nv
{ln:b0}
(xs: optn(x0, ln), e1: !e1): optn(y0, ln)
fun
<x0:t0>
<y0:t0>
<e1:vt>
optn_map$e1nv$f2un
{ln:b0}
( xs
: optn(x0, ln), e1: !e1, fopr: (x0, !e1)->y0): optn(y0, ln)
//
#symload map$e1nv with optn_map$e1nv of 1000
#symload map$e1nv with optn_map$e1nv$f2un of 1000
(*
HX-2025-09-08:
Mon Sep  8 02:35:01 AM EDT 2025
This conflicts with optn_map$f2un:
#symload optn_map with optn_map$e1nv of 1000
#symload optn_map with optn_map$e1nv$f2un of 1000
*)
#symload optn_map$e1nv with optn_map$e1nv$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_optn001.sats] *)
(***********************************************************************)
