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
// Authoremail: gmhwxiATgmailDOTcom
//
// This one should be loaded after xsetup.sats
//
(* ****** ****** *)
//
(*
HX-2024-01-11:
For general errors
Thu Jan 11 20:32:29 EST 2024
*)
excptcon
ErrorExn of ((*void*))
excptcon
ErrmsgExn of ( string )
//
(* ****** ****** *)
//
(*
HX-2020-03-05:
Out-of-range subscripting
*)
//
excptcon
SubemptyExn of ((*void*))
excptcon
SubscriptExn of ((*void*))
//
(* ****** ****** *)
//
(*
HX-2024-07-15:
Generally undefined value
*)
//
excptcon
UndefinedExn of ((*void*))
//
(* ****** ****** *)
//
// For indicating the failure of
excptcon AssertExn of () // an assertion
// For indicating something expected
excptcon NotFoundExn of () // to be found but not
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_INIT_srcgen2_excptn0.sats] *)
