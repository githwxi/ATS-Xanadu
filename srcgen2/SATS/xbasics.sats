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
Start Time: May 28th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(*
#typedef int0 = sint
#typedef btf0 = bool
#typedef chr0 = char
#typedef str0 = strn
*)
(* ****** ****** *)
#symload &  with land of 0
#symload << with lsln of 0
#symload >> with asrn of 0
#symload >> with lsrn of 0
(* ****** ****** *)
//
#define INFIX0 0 // n-assoc
#define INFIXL 1 // l-assoc
#define INFIXR 2 // r-assoc
//
#define PREFIX 3 // prefix0
#define PSTFIX 4 // postfix
//
(* ****** ****** *)
//
#define BOXFLG 0x001 // (0x1 << 0)
#define LINFLG 0x010 // (0x1 << 1)
#define PRFFLG 0x100 // (0x1 << 2)
//
(* ****** ****** *)

fun sortbox(x: sint): sint // 0,1
fun sortlin(x: sint): sint // 0,1
fun sortprf(x: sint): sint // 0,1
fun sortpol(x: sint): sint // -1,0,1

(* ****** ****** *)
//
datatype funkind =
//
| FNKfn0 // nonrec fun
| FNKfn1 // genrec fun
| FNKfn2 // tailrec fun
| FNKfnx // tailopt fun
| FNKfun // ex-specified
//
| FNKpraxi // proof axiom
//
| FNKprfn0 // nonrec prfun
| FNKprfn1 // genrec prfun
| FNKprfun // ex-specified
//
| FNKfcast // no-op casting
//
(* ****** ****** *)

fun//<>
funkind_fprint
(out: FILR, fnk: funkind): void

(* ****** ****** *)

(* end of [ATS3/XATSOPT_xbasics.sats] *)
