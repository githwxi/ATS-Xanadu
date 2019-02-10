(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
(*
//
#define none optn_nil
#define some optn_cons
//
#define none_vt optn_vt_nil
#define some_vt optn_vt_cons
//
*)
(* ****** ****** *)
//
prfun
lemma_optn_param
{x:t0}{n:i0}
(optn(x, n)): [0<=n; n<=1] void
//
prfun
lemma_optn_vt_param
{x:vt}{n:i0}
(!optn_vt(x, n)): [0<=n; n<=1] void
//
(* ****** ****** *)
//
typedef
option(x:t0) = optn(x)
typedef
option
(x:t0, b:b0) = optn(x, b2i(b))
//
typedef
option_vt(x:t0) = optn_vt(x)
typedef
option_vt
(x:vt, b:b0) = optn_vt(x, b2i(b))
//
(* ****** ****** *)

(* end of [option.sats] *)
