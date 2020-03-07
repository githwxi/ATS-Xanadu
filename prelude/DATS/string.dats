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
// Start Time: March, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)

implement<>
string_forall
  (cs) =
(
  loop(ptrof(cs))
) where
{
fun
loop
( p0
: p2tr(char)): bool
let
val c0 = !p0
in(*in-of-let*)
if
eqz?(c0)
then true else
(
if
forall$test<x0>(c0)
then loop(succ(p0)) else false
)
end // end of [loop]
} (* end of [string_forall] *)

(* ****** ****** *)

local
//
typedef x0 = cgtz
typedef xs = string
//
in (* in-of-local *)

(* ****** ****** *)

impltmp
g_print<xs> = string_print
impltmp
gseq_print$beg<x0,xs>() = ()
impltmp
gseq_print$end<x0,xs>() = ()
impltmp
gseq_print$sep<x0,xs>() = ()

(* ****** ****** *)

impltmp
gseq_nilq<x0,xs> = string_nilq<>
impltmp
gseq_consq<x0,xs> = string_consq<>

(* ****** ****** *)

impltmp
gseq_forall<x0,xs> = string_forall<>
impltmp
gseq_rforall<x0,xs> = string_rforall<>

end // end of [local]

(* ****** ****** *)

(* end of [string.dats] *)
