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
#staload "./lexing0_utils1.dats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
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
//
#implfun
gobj_lexing$fclst<obj>(buf) = buf.tclst()
#implfun
gobj_lexing$fcnil<obj>(buf) = free(buf.tclst())
#implfun
gobj_lexing$fcseg<obj>(buf) = strn(buf.tclst())
//
#implfun
gobj_lexing$unget<obj>(buf, ci0) = buf.unget(ci0)
//
} (*where*) // end of [lxbf1_lexing_token]

(* ****** ****** *)

#implfun
lxbf1_lexing_tnodelst
(   buf   ) =
list_vt_reverse0
(
loop(buf, list_vt_nil())
) where
{
//
fnx
loop
( buf: !lxbf1
, res
: list_vt(tnode)
)
: list_vt(tnode) =
let
val tnd =
lxbf1_lexing_tnode(buf)
val res = cons_vt(tnd, res)
in//let
case+ tnd of
| T_EOF() => res
| _(*non-T_EOF*) => loop(buf, res)
end
//
}(*whr*)//end-of(lxbf1_lexing_tnodelst)

(* ****** ****** *)

#implfun
fpath_tokenize(fpx) =
let
val
buf =
lxbf1_make_fpath(fpx)
val
lcs = LCSRCsome1(fpx)
in
lexing_preping_all
(
lexing_lctnize_all
(lcs, lxbf1_lexing_tnodelst(buf))
)
endlet // end of [fpath_tokenize(fpath)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_lexing0.dats] *)
