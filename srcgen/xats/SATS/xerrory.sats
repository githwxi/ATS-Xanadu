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
// Start Time: August, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
exception
FatalErrorExn of ()
exception
FatalErrorExn_interr of ()
//
(* ****** ****** *)
//
exception
XATSOPT_FIXITY_EXN of ((*void*))
//
(* ****** ****** *)
//
exception
XATSOPT_SYNERR_EXN of ((*void*))
//
(* ****** ****** *)
//
exception
XATSOPT_TRERR01_EXN of ((*void*))
exception
XATSOPT_TRERR12_EXN of ((*void*))
exception
XATSOPT_TRERR23_EXN of ((*void*))
exception
XATSOPT_TRERR33_EXN of ((*void*))
exception
XATSOPT_TRERR3X_EXN of ((*void*))
//
(* ****** ****** *)
//
// HX:
// raising FatalErrorException
// raising FatalErrorException_interr
//
fun abort((*void*)):<!exn> void
fun abort_interr((*void*)):<!exn> void
//
(* ****** ****** *)

(* end of [xats_xerrory.sats] *)
