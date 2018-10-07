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
// Start Time: October, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
local
//
#include
"./../../util/DATS/cblist.dats"
#include
"./../../util/DATS/Posix/cblist.dats"
//
in
  // nothing
end // end of [local]
//
(* ****** ****** *)
//
#dynload "./basics.dats"
//
#dynload "./symbol.dats"
#dynload "./symmap.dats"
#dynload "./symenv.dats"
//
#dynload "./label0.dats"
//
#dynload "./fixity.dats"
//
#dynload "./xerrory.dats"
//
#dynload "./filepath.dats"
#dynload "./location.dats"
//
// HX-2018-10:
// The following
// order is significant!
#dynload "./lexbuf.dats"
#dynload "./lexing_token.dats"
#dynload "./lexing_kword.dats"
#dynload "./lexing_util0.dats"
//
#dynload "./staexp0.dats"
#dynload "./dynexp0.dats"
#dynload "./staexp0_print.dats"
#dynload "./dynexp0_print.dats"
//
#dynload "./parsing_tokbuf.dats"
//
#dynload "./parsing_basics.dats"
#dynload "./parsing_staexp.dats"
#dynload "./parsing_dynexp.dats"
//
#dynload "./synread_staexp.dats"
//
#dynload "./staexp1.dats"
#dynload "./dynexp1.dats"
#dynload "./staexp1_print.dats"
#dynload "./dynexp1_print.dats"
//
#dynload "./trans01_envmap.dats"
#dynload "./trans01_staexp.dats"
#dynload "./trans01_dynexp.dats"
//
(* ****** ****** *)
//
datatype
commarg =
| COMMARG of (int, string)
//
typedef
commarglst
  (n:int) = list(commarg, n)
//
(* ****** ****** *)
//
extern
fun
parse_commarg
( string
) :<> commarg
and
parse_commarglst
  {n:nat}
( argc: int(n)
, argv: argv(n)) :<> commarglst(n)
//
(* ****** ****** *)
//
extern
fun
print_commarg(commarg): void
extern
fun
fprint_commarg
(out: FILEref, x0: commarg): void
//
(* ****** ****** *)
//
extern
fun
commarg_warning(arg: string): void
//
(* ****** ****** *)
//
implement
print_commarg(x0) =
fprint_commarg(stdout_ref, x0)
implement
fprint_commarg(out, x0) =
(
case+ x0 of
| COMMARG(i, k) =>
  fprint!(out, "COMMARG(", i, ", ", k, ")")
) (* end of [fprint_commarg] *)
//
(* ****** ****** *)

implement
commarg_warning
  (arg) = () where
{
//
val () =
prerr("WARNING(ATS)")
val () =
prerrln!
(": unrecognized command line argument [", arg, "] is ignored.")
//
} (* end of [commarg_warning] *)

(* ****** ****** *)
//
extern
fun
xatsopt_main0
{n:int | n >= 1}
(n: int(n), argv: !argv(n)): void
//
(* ****** ****** *)

local

in (* in-of-local *)

implement
xatsopt_main0
  (argc, argv) = let
//
val () =
println!
("xatsopt_main0: called")
//
in
end // end of [xatsopt_main0]

end // end of [local]

(* ****** ****** *)
//
#ifndef
XATSOPT_MAIN_NONE
//
implement
main0(argc, argv) =
(
//
if
(argc >= 2)
then xatsopt_main0(argc, argv)
else prerrln! ("Hello from ATS3(ATS/Xanadu)!")
// end of [if]
) (* end of [main] *)
//
#endif // ifndef(XATSOPT_MAIN_NONE)
//
(* ****** ****** *)

(* end of [xatsopt.dats] *)
