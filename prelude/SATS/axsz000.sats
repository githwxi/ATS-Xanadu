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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Sun 11 Aug 2024 12:59:19 PM EDT
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
a1sz_vt_i0_i0_tx(a:vt,n:i0)
#abstbox
a1sz_vt_i0_i0_vt(a:vt,n:i0)
//
#typedef
a1sz
(a:vt,n:i0) = a1sz_vt_i0_i0_tx(a,n)
#vwtpdef
a1sz_vt
(a:vt,n:i0) = a1sz_vt_i0_i0_vt(a,n)
//
#typedef
a1sz(x0:vt) = [n:i0] a1sz(x0,n)
#vwtpdef
a1sz_vt(x0:vt) = [n:i0] a1sz_vt(x0,n)
//
(* ****** ****** *)
(* ****** ****** *)
//
#abstbox
a2sz_vt_i0_i0_tx(a:vt,m:i0,n:i0)
#abstbox
a2sz_vt_i0_i0_vt(a:vt,m:i0,n:i0)
//
#typedef
a2sz
(a:vt
,m:i0,n:i0) = a2sz_vt_i0_i0_tx(a,m,n)
#vwtpdef
a2sz_vt
(a:vt
,m:i0,n:i0) = a2sz_vt_i0_i0_vt(a,m,n)
//
#typedef
a2sz(x0:vt) = [m:i0;n:i0] a2sz(x0,m,n)
#vwtpdef
a2sz_vt(x0:vt) = [m:i0;n:i0] a2sz_vt(x0,m,n)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_axsz000.sats] *)
