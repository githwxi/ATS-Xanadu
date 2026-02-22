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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
(*
Sat Feb 21 09:40:52 PM EST 2026
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX: for [FILR]
*)
#include
"xatslib\
/libcats\
/HATS/libcats_dats.hats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox i0typ1_tbox // p0tr
#typedef i0typ1 = i0typ1_tbox
//
(* ****** ****** *)
//
#typedef i0typ1lst = list(i0typ1)
#typedef i0typ1opt = optn(i0typ1)
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0typ1_node =
(* ****** ****** *)
|I0T1cst of s2cst//constant
|T0T1var of s2var//variable
(* ****** ****** *)
|I0T1lft of s2typ1//lft-value
(* ****** ****** *)
//
|I0T1tcon of (d2con, i0typ1lst)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0typ1_fprint
(ityp: i0typ1, out0: FILR): void
#symload fprint with i0typ1_fprint of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
datatype
i0exp1_node =
//
(* ****** ****** *)
//
|I0E1int of sint
|I0E1btf of bool
|I0E1chr of token
|I0E1flt of token
|I0E1str of token
//
(* ****** ****** *)
//
|I0E1seqn of
(i0exp1lst(*init*), i0exp1(*last*))
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
i0exp1_fprint
(iexp: i0exp1, out0: FILR): void
#symload fprint with i0exp1_fprint of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XATSOPT_srcgen2_xsyncpy_srcgen1_SATS_intrep0.sats] *)
(***********************************************************************)
