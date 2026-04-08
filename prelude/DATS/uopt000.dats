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
Wed Apr  8 09:15:52 AM EDT 2026
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload UN =
"prelude/SATS/unsfx00.sats"
(* ****** ****** *)
(* ****** ****** *)
//
#absimpl
uopt_t0_b0_t0
 (a:t0,b:b0) = uflat(optn(a, b))
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
uopt_none
( (*0*) ) = $debox(optn_nil(*0*))
#impltmp
< x0:t0 >
uopt_some
(   x0   ) = $debox(optn_cons(x0))
//
(* ****** ****** *)
//
#impltmp
< x0:t0 >
uopt_unsome(xs) =
(case- xs of @optn_cons(x0) => x0)
//
(* ****** ****** *)
(* ****** ****** *)
//
#impltmp
< x0:t0 >
uopt_nilq(xs) =
( case+ xs of
| @optn_nil() => true | _ => false)
#impltmp
< x0:t0 >
uopt_noneq(xs) =
( case+ xs of
| @optn_nil() => true | _ => false)
//
#impltmp
< x0:t0 >
uopt_consq(xs) =
( case+ xs of
| @optn_cons _ => true | _ => false)
#impltmp
< x0:t0 >
uopt_someq(xs) =
( case+ xs of
| @optn_cons _ => true | _ => false)
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_DATS_uopt000.dats] *)
(***********************************************************************)
