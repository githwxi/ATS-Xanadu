(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: June, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload "./../SATS/xbasics.sats"
#staload "./../SATS/xstamp0.sats"
#staload "./../SATS/xsymbol.sats"
#staload "./../SATS/locinfo.sats"
#staload "./../SATS/lexing0.sats"
//
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
//
(* ****** ****** *)

local

val
stamper = stamper_new()

in (* in-of-local *)

implement
htcst_stamp_new
((*void*)) = stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = stamper_new()

in (* in-of-local *)

implement
htvar_stamp_new
((*void*)) = stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = stamper_new()

in (* in-of-local *)

implement
h0con_stamp_new
((*void*)) = stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = stamper_new()

in (* in-of-local *)

implement
h0cst_stamp_new
((*void*)) = stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = stamper_new()

in (* in-of-local *)

implement
h0var_stamp_new
((*void*)) = stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

(* end of [xats_intrep0.dats] *)
