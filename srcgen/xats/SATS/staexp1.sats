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
// Start Time: Auguest, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#staload
LEX = "./lexing.sats"
typedef token = $LEX.token
//
#staload
SYM = "./symbol.sats"
typedef symbol = $SYM.symbol
//
(* ****** ****** *)
//
abstbox sort1_tbox = ptr
abstbox s1exp_tbox = ptr
//
(* ****** ****** *)
//
typedef sort1 = sort1_tbox
typedef sort1lst = List0(sort1)
typedef sort1opt = Option(sort1)
//
typedef s1exp = s1exp_tbox
typedef s1explst = List0(s1exp)
typedef s1expopt = Option(s1exp)
//
(* ****** ****** *)

datatype
sort1_node =
  | S1Tid of (symbol)
  | S1Ttype of int(*kind*)
    (*prop/view/type/t0ype/viewtype/viewt0ype*)
  | S1Tapps of (sort1, sort1lst)
  | S1Tlist of sort1lst // temporary
  | S1Tqual of (token, sort1)
  | S1Terror of () // error indication
// end of [s1rt_node]

(* ****** ****** *)

(* end of [xats_staexp1.sats] *)
