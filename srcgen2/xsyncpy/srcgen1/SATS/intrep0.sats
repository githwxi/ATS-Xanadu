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
(* ****** ****** *)
//
#abstbox i0pat1_tbox // p0tr
#typedef i0pat1 = i0pat1_tbox
//
(* ****** ****** *)
//
#abstbox i0exp1_tbox // p0tr
#typedef i0exp1 = i0exp1_tbox
//
(* ****** ****** *)
//
datatype
i0lab(itm:type) =
|I0LAB of (label, itm(*elt*))
//
fun
<x0:t0>
i0lab_get_itm
(ilab: i0lab(x0)): x0
#symload itm with i0lab_get_itm
//
(* ****** ****** *)
#typedef l0i0p1 = i0lab(i0pat1)
#typedef l0i0e1 = i0lab(i0exp1)
(* ****** ****** *)
(* ****** ****** *)
//
#typedef i0typ1lst = list(i0typ1)
#typedef i0typ1opt = optn(i0typ1)
//
(* ****** ****** *)
//
#typedef i0pat1lst = list(i0pat1)
#typedef i0pat1opt = optn(i0pat1)
#typedef l0i0p1lst = list(l0i0p1)
(* ****** ****** *)
//
#typedef i0exp1lst = list(i0exp1)
#typedef i0exp1opt = optn(i0exp1)
#typedef l0i0e1lst = list(l0i0e1)
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
i0pat1_node
//
(* ****** ****** *)
//
|I0P1any of ()
|I0P1var of d2var
//
(* ****** ****** *)
//
|I0P1int of sint
|I0P1btf of bool
|I0P1chr of token
|I0P1flt of token
|I0P1str of token
//
(* ****** ****** *)
//
|I0P1dap1 of
(i0pat1(*dcon*))
|I0P1dapp of
(i0pat1(*dcon*)
,sint(*npf*), i0pat1lst(*darg*))
//
(* ****** ****** *)
//
|I0P1rfpt of
(i0pat1,token(*AS*),i0pat1(*aspt*))
//
(* ****** ****** *)
//
|I0P1tup0 of (sint(*npf*),i0pat1lst)
|I0P1tup1 of
(token(*knd*),sint(*npf*),i0pat1lst)
|I0P1rcd2 of
(token(*knd*),sint(*npf*),l0i0p1lst)
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
