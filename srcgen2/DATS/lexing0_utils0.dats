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
Start Time: June 11th, 2022
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
#extern
fun
EOLq(ch: char): bool
#extern
fun
EMPq(ch: char): bool
(* ****** ****** *)
//
#implfun
EOLq(ch) = (ch = '\n')
#implfun
EMPq(ch) =
if
(ch = ' ')
then true else
(if (ch = '\t') then true else false)
//
(* ****** ****** *)

#impltmp
<obj>
gobj_lexing_tnode
(   buf   ) = let
//
val ci0 = 
gobj_lexing$getc1(buf)
val cc0 = char_make_code(ci0)
//
val () =
println
("gobj_lexing_tnode: ci0 = ", ci0)
val () =
println
("gobj_lexing_tnode: cc0 = ", cc0)
//
in//let
//
case+ 0 of
| _ when EMPq(cc0) => f0_EMP(buf, ci0)
| _ when EOLq(cc0) => f0_EOL(buf, ci0)
(*
| _ when DIGITq(cc0) => f0_DIGIT(buf, ci0)
*)
| _ (* otherwise *) => f0_otherwise(buf, ci0)
//
end where
{
//
fun
f0_EMP
( buf: !obj
, ci0: sint): tnode =
  loop( buf ) where
{
//
//HX: [ci0]: dummy
//
fun
loop
(buf: !obj): tnode =
let
//
val ci0 = 
gobj_lexing$getc1(buf)
val cc0 = char_make_code(ci0)
//
in//let
//
if
EMPq(cc0)
then loop(buf) else
let
  val ci0 =
  gobj_lexing$unget(buf)
in//let
T_BLANK(gobj_lexing$fcseg(buf))
end // end of [else]
//
end // end of [loop]
//
} (*where*) // end of [f0_EMP]
//
fun
f0_EOL
(buf: !obj, ci0: sint): tnode =
(       T_EOL()       ) where
{
  val () = gobj_lexing$fskip(buf)
} (*where*) // end of [f0_EOL]
//
fun
f0_otherwise
(buf: !obj, ci0: sint): tnode =
(
  if
  (ci0 >= 0)
  then T_SPCHR(ci0) else T_EOF()
) where
{
  val () = gobj_lexing$fskip(buf)
} (*where*) // end of [f0_otherwise]
//
} (*where*) // end of [gobj_lexing_tnode]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_lexing0_utils0.dats] *)
