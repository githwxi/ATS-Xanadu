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
Wed Dec 31 12:25:51 PM EST 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-31:
Wed Dec 31 11:38:57 AM EST 2025
*)
//
fun
<x0:vt>
segment$delim1(x0: !x0): bool
//
(* ****** ****** *)
//
(*
HX-2025-12-31:
Wed Dec 31 11:38:57 AM EST 2025
*)
//
#impltmp
< xs:vt >
< x0:vt >
gseq_segmentize0_lstrm$llist
  (  xs  ) =
let
//
#vwtpdef rs = list_vt(x0)
//
#impltmp
map$fopr0<rs><rs> = list_vt_reverse0<x0>
in//let
strm_vt_map0<rs>(
gseq_segmentize0_lstrm$rllist<xs><x0>(xs))
end//let//end(gseq_segmentize0_lstrm$llist<xs><x0>)
//
(* ****** ****** *)
//
#impltmp
<xs:vt>
<x0:vt>
gseq_segmentize0$f1un_lstrm$llist
  (xs, test) =
let
#impltmp
segmentize$test1<x0> = test(*x0*)
in//let
(
  gseq_segmentize0_lstrm$llist<xs><x0>(xs))
end//let//end(gseq_segmentize0$f1un_lstrm$llist<xs><x0>)
//
#impltmp
<xs:vt>
<x0:vt>
gseq_segmentize0$f1un_lstrm$rllist
  (xs, test) =
let
#impltmp
segmentize$test1<x0> = test(*x0*)
in//let
(
  gseq_segmentize0_lstrm$rllist<xs><x0>(xs))
end//let//end(gseq_segmentize0$f1un_lstrm$rllist<xs><x0>)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_almanac_SATS_VT_pre2026.sats] *)
(***********************************************************************)
