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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sun May 11 09:05:29 AM EDT 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#abstbox d3pat1_tbox // p0tr
#typedef d3pat1 = d3pat_tbox
(* ****** ****** *)
#abstbox d3exp1_tbox // p0tr
#typedef d3exp1 = d3exp1_tbox
(* ****** ****** *)
#typedef d3pat1lst = list(d3pat1)
#typedef d3exp1lst = list(d3exp1)
(* ****** ****** *)
//
datatype
d3pat1_node =
//
|D3P1any of ()
|D3P1var of d2var
//
|D3P1tup0 of (sint(*npf*), d3pat1lst)
//
|D3P1tup1 of
(
token(*knd*), sint(*npf*), d3pat1lst)
//
|D3P1errck of (sint(*lvl*), d3pat1(*err*))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_dynexp3.sats] *)
(***********************************************************************)
