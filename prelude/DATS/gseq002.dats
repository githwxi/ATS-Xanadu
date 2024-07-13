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
Sat 13 Jul 2024 10:17:23 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#typedef ni = nint
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iforitm(xs) =
gseq_iforitm0<xs><x0>(xs)
//
#impltmp
< xs:t0 >
< x0:t0 >
gseq_iforall(xs) =
gseq_iforall0<xs><x0>(xs)
//
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_ifolditm(xs, r0) =
gseq_ifolditm0<xs><x0><r0>(xs, r0)
//
#impltmp
< xs:t0 >
< x0:t0 >
< r0:vt >
gseq_ifoldall(xs, r0) =
gseq_ifoldall0<xs><x0><r0>(xs, r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:t0 >
gseq_imap_list(xs) =
list_vt2t{y0}
(
gseq_imap_llist<xs><x0><y0>(xs))
//
#impltmp
< xs:t0 >
< x0:t0 >
< y0:vt >
gseq_imap_llist(xs) =
gseq_imap0_llist<xs><x0><y0>(xs)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_DATS_gseq002.dats] *)
