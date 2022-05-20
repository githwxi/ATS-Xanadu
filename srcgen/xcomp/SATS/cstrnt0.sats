(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: March 27, 2021
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.libxatsopt"
(* ****** ****** *)
#staload "./xbasics.sats"
(* ****** ****** *)
#staload "./locinfo.sats"
(* ****** ****** *)
//
#staload S2E = "./staexp2.sats"
#staload S2T = "./statyp2.sats"
#staload D2E = "./dynexp2.sats"
//
(* ****** ****** *)
//
typedef s2exp = $S2E.s2exp
typedef t2ype = $S2T.t2ype
typedef d2var = $D2E.d2var
//
(* ****** ****** *)
//
datatype c0str =
//
(*
| C0Heqeq of
  (s2exp, s2exp) // equality
*)
| C0Htpeq of
  (s2exp, s2exp) // type-equality
//
(*
| C0Ieqeq of
  (s2exp, s2exp) // equality
*)
| C0Itple of
  (s2exp, s2exp) // subtyping
| C0Itpeq of
  (s2exp, s2exp) // type-equality
//
where c0strlst = List0(c0str)
//
typedef
c0stropt = Option(c0str)
typedef
c0strlstopt = Option(c0strlst)
//
(* ****** ****** *)
//
fun
print_c0str : print_type(c0str)
fun
prerr_c0str : prerr_type(c0str)
fun
fprint_c0str : fprint_type(c0str)
//
overload print with print_c0str
overload prerr with prerr_c0str
overload fprint with fprint_c0str
//
(* ****** ****** *)
//
fun
c0str_make_tasmp
(s2e1: s2exp, s2e2: s2exp): c0str
fun
c0str_make_tcast
(s2e1: s2exp, s2e2: s2exp): c0str
//
(* ****** ****** *)

(* end of [xats_cstrnt0.sats] *)
