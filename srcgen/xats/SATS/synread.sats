(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: 2018-09-03
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

#staload "./staexp0.sats"
#staload "./dynexp0.sats"

(* ****** ****** *)
//
typedef
synreader
(a:t@ype) = (a) -> void
//
(* ****** ****** *)
//
abstbox
synreadst_type = ptr
typedef
synreadst = synreadst_type
//
(* ****** ****** *)
//
datatype
synerr =
//
| SYNERRs0tid of (i0dnt)
//
| SYNERRs0eid of (i0dnt)
//
| SYNERRsort0 of (sort0)
//
| SYNERRlparen of (token)
| SYNERRrparen of (token)
//
fun{}
synerr_add(synerr): void
//
(* ****** ****** *)
//
fun
synread_top(d0eclist): void
//
(* ****** ****** *)
//
fun{}
synread_s0tid: synreader(s0tid)
fun{}
synread_s0eid: synreader(s0eid)
//
(* ****** ****** *)
//
fun{}
synread_sort0: synreader(sort0)
fun{}
synread_sort0lst: synreader(sort0lst)

//
(* ****** ****** *)
//
fun{}
synread_s0exp: synreader(s0exp)
fun{}
synread_s0explst: synreader(s0explst)
//
(* ****** ****** *)
//
fun{}
synread_d0pat: synreader(d0pat)
fun{}
synread_labd0pat: synreader(labd0pat)
//
(* ****** ****** *)
//
fun{}
synread_d0exp: synreader(d0exp)
fun{}
synread_labd0exp: synreader(labd0exp)
//
(* ****** ****** *)
//
fun{}
synread_d0ecl: synreader(d0ecl)
fun{}
synread_d0eclist: synreader(d0eclist)
//
(* ****** ****** *)

(* end of [xats_synread.sats] *)
