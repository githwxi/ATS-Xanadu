(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2026 Hongwei Xi, ATS Trustful Software, Inc.
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
Thu Jan 22 09:14:02 AM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
//
HX-2020-07-04:
Sequences with length
HX-2026-01-22:
Revisiting an old idea :)
Thu Jan 22 09:23:47 AM EST 2026
//
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef
nlt(i0:int) = nintlt(i0)
#typedef
nlte(i0:int) = nintlte(i0)
(* ****** ****** *)
(* ****** ****** *)
//
#sexpdef
listn(a:t0) =
(
  lam(n:i0) => list(a,n))
#sexpdef
strqn(a:t0) =
(
  lam(n:i0) => strq(a,n))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:
i0->t0>
<x0:t0>
gseqn_nil
( (*void*) ): xs(0)
//
fun
<xs:
i0->t0>
<x0:t0>
<ln:i0>
gseqn_cons
(x0:x0, xs:xs(ln)): xs(ln+1)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:
i0->t0>
<x0:t0>
<ln:i0>
gseqn_nilq
 (xs: xs(ln)): bool(ln=0)
//
fun
<xs:
i0->t0>
<x0:t0>
<ln:i0>
gseqn_consq
  (xs: xs(ln)): bool(ln>0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:
i0->t0>
<x0:t0>
<y0:t0>
<ln:i0>
gseqn_map_list
  (xs:xs(ln)): list(y0,ln)
fun
<xs:
i0->t0>
<x0:t0>
<y0:t0>
<ln:i0>
gseqn_map_rlist
  (xs:xs(ln)): list(y0,ln)
//
(* ****** ****** *)
//
fun
<xs:
i0->t0>
<x0:t0>
<y0:t0>
<ln:i0>
gseqn_map_list$f1un
( xs: xs(ln)
, fopr: (nlt(ln), x0) -> y0): list(y0,ln)
fun
<xs:
i0->t0>
<x0:t0>
<y0:t0>
<ln:i0>
gseqn_map_rlist$f1un
( xs: xs(ln)
, fopr: (nlt(ln), x0) -> y0): list(y0,ln)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:
i0->t0>
<x0:t0>
<y0:vt>
<ln:i0>
gseqn_map_llist
  (xs:xs(ln)): list_vt(y0,ln)
//
fun
<xs:
i0->t0>
<x0:t0>
<y0:vt>
<ln:i0>
gseqn_map_rllist
  (xs:xs(ln)): list_vt(y0,ln)
//
(* ****** ****** *)
//
fun
<xs:
i0->t0>
<x0:t0>
<y0:vt>
<ln:i0>
gseqn_map_llist$f1un
( xs: xs(ln)
, fopr: (nlt(ln), x0) -> y0): list_vt(y0,ln)
fun
<xs:
i0->t0>
<x0:t0>
<y0:vt>
<ln:i0>
gseqn_map_rllist$f1un
( xs: xs(ln)
, fopr: (nlt(ln), x0) -> y0): list_vt(y0,ln)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:
i0->t0>
<x0:t0>
<y0:vt>
<ln:i0>
gseqn_map_lstrq
  (xs:xs(ln)): strq_vt(y0,ln)
//
fun
<xs:
i0->t0>
<x0:t0>
<y0:vt>
<ln:i0>
gseqn_map_lstrq$f1un
( xs: xs(ln)
, fopr: (nlt(ln), x0) -> y0): strq_vt(y0,ln)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_gseqn00.sats] *)
(***********************************************************************)
