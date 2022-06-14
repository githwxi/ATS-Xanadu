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
Start Time: June 14th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
//
fun
EOLq
(ch: char): bool = (ch = '\n')
//
(* ****** ****** *)

local

datavwtp
pstn1 =
PSTN1 of
( sint(*ntot*)
, sint(*nrow*), sint(*ncol*))

in//local

(* ****** ****** *)

fun
pstn1_inc1
( pos:
! pstn1
, chr: char): void =
let
val+
@PSTN1
(!nt0, !nr1, !nc2) = pos
in//in
if
EOLq(chr)
then
( nc2 := 0
; nt0 := nt0+1
; nr1 := nr1+1; $fold(pos))
else
( nt0 := nt0+1
; nc2 := nc2+1; $fold(pos))
endlet // end of [pstn1_inc1]

(* ****** ****** *)

fun
pstn1_incs
( pos:
! pstn1
, cs0: strn): void =
gseq_foreach_env
  <strn><char>(cs0, pos) where
{
#impltmp
foreach_env1$work
<strn>
<char>
<pstn1>
(chr, pos) = pstn1_inc1(pos, chr)
} (*where*) // end of [pstn1_incs]

(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_lexing0_lctniz.dats] *)
