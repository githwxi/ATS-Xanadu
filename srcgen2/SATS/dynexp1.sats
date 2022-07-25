(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
Sun Jul 24 17:59:26 EDT 2022
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
//
#staload
FP0 = "./filpath.sats"
//
#typedef
fpath = $FP0.fpath
#typedef
fpathopt = $FP0.fpathopt
//
(* ****** ****** *)

#staload
S0E = "./staexp0.sats"
#staload
D0E = "./dynexp0.sats"

(* ****** ****** *)
#staload "./xbasics.sats"
#staload "./staexp1.sats"
(* ****** ****** *)
//
#abstype d1pat_tbox // ptr
#abstype d1exp_tbox // ptr
//
(* ****** ****** *)
//
#typedef d1pat = d1pat_tbox
#typedef d1patlst = list(d1pat)
#typedef d1patopt = optn(d1pat)
//
#typedef d1exp = d1exp_tbox
#typedef d1explst = list(d1exp)
#typedef d1expopt = optn(d1exp)
//
(* ****** ****** *)
#typedef
l0d1p = $D0E.d0lab(d1pat)
#typedef
l0d1e = $D0E.d0lab(d1exp)
#typedef l0d1plst = list(l0d1p)
#typedef l0d1elst = list(l0d1e)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_dynexp1.sats] *)
