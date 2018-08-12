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
exception XATSOPT_FIXITY_EXN of ()
//
(* ****** ****** *)
//
exception XATSOPT_TRANS1_EXN of ()
exception XATSOPT_TRANS2_EXN of ()
exception XATSOPT_TRANS3_EXN of ()
exception XATSOPT_TRANS4_EXN of ()
//
(* ****** ****** *)
//
// HX:
// raising FatalErrorException
// raising FatalErrorException_interr
//
fun abort{a:vt0ype}():<!exn> (a)
fun abort_interr{a:vt0ype}():<!exn> (a)
//
(* ****** ****** *)

(* end of [xats_error.sats] *)
