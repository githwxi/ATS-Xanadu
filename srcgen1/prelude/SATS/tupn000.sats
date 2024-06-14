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
(*
** for flat tuple arrays
** for boxed tuple arrays
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Sat Jan  6 13:57:54 EST 2024
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
// HX: singleton
// HX: for boxing
(* ****** ****** *)
//
#abstbox
t0ref_vt_x0
(elem:vwtp)
//
#typedef
t0ref(a:vt) = t0ref_vt_x0(a)
//
(* ****** ****** *)
// HX: 1-dimensional
(* ****** ****** *)
//
#abstbox
t1ref_vt_i0_x0
(elem:vt,ntot:i0)
//
#typedef
t1ref(a:vt,n:i0) = t1ref_vt_i0_x0(a, n)
//
(* ****** ****** *)
// HX: 2-dimensional
(* ****** ****** *)
//
#abstbox
t2ref_vt_i0_i0_x0
(elem:vt,nrow:i0,ncol:i0)
//
#typedef
t2ref
(a:vt
,m:i0,n:i0) = t2ref_vt_i0_i0_x0(a, m, n)
//
(* ****** ****** *)
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_tupn000.sats] *)
