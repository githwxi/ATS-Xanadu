(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2019 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: February, 2019
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
fun
<xs:type>
<x0:type>
gseq_forall(xs): bool
fun
<xs:type>
<x0:type>
gseq_foreach(xs): void
//
(* ****** ****** *)
//
fun
<xs:type>
<x0:type>
gseq_iforall(xs): bool
fun
<xs:type>
<x0:type>
gseq_iforeach(xs): void
//
(* ****** ****** *)
//
fun
<xs:type>
<x0:type>
<y0:vtype>
gseq_map_list(xs): list_vt(y0)
fun
<xs:type>
<x0:type>
<y0:vtype>
gseq_map_rlist(xs): list_vt(y0)
//
fun
<xs:type>
<x0:type>
<y0:vtype>
gseq_map_stream(xs): stream_vt(y0)
//
(* ****** ****** *)
//
fun
<xs:type>
<x0:type>
<y0:vtype>
gseq_imap_list(xs): list_vt(y0)
fun
<xs:type>
<x0:type>
<y0:vtype>
gseq_imap_rlist(xs): list_vt(y0)
//
fun
<xs:type>
<x0:type>
<y0:vtype>
gseq_imap_stream(xs): stream_vt(y0)
//
(* ****** ****** *)

(* end of [gseq.sats] *)
