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
Start Time: June 07th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./lexing0_utils0.dats"
(* ****** ****** *)
#staload "./../SATS/lexbuf0.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)

#implfun
lxbf1_lexing_tnode
(   buf   ) =
(
gobj_lexing_tnode<obj>(buf)
) where
{
//
#vwtpdef obj = lxbf1
//
#implfun
gobj_lexing$getc1<obj>(buf) = buf.getc1()
#implfun
gobj_lexing$unget<obj>(buf) = buf.unget()
#implfun
gobj_lexing$fcseg<obj>(buf) = strn(buf.tcseg())
#implfun
gobj_lexing$fskip<obj>(buf) = free(buf.tcseg())
//
} (*where*) // end of [lxbf1_lexing_token]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_lexing0.dats] *)
