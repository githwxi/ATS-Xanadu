(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2024 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
//
Thu 29 Aug 2024 08:38:27 AM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/libxatsopt.hats"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
//
fun
mymain_work
(fpth: strn): void =
let
//
val (  ) =
let
//
val out = g_stderr((*0*))
//
in//let
//
(
prerrln
("FPERR20_D2PARSED:");
fperr20_d2parsed(out, dpar))
//
end//let
//
end where
{
//
val dpar = d2parsed_of_fildats(fpth)
//
}(*where*)//end-of-[mymain_work(fpth)]
//
(* ****** ****** *)
(* ****** ****** *)
//
local
//
#staload
"\
srcgen1\
/prelude\
/DATS/CATS/JS/basics1.dats"
(* ****** ****** *)
#staload
"\
srcgen1\
/prelude\
/DATS/CATS/JS/Node/process.dats"
//
(* ****** ****** *)
in//local
(* ****** ****** *)
//
val () =
mymain() where
{
//
fun
mymain((*void*)) =
(
if
length(argv) >= 3
then
(
  mymain_work(argv[2])
) where
{
//
val ret1 =
the_fxtyenv_pvsload((*0*))
val (  ) =
if
(ret1 > 0)
then
prerrln
("The fixity-defs loaded!")
//
val ret2 =
the_tr12env_pvsload((*0*))
val (  ) =
if
(ret2 > 0)
then prerrln
("The trans12-defs loaded!")
//
}
else
(
let
val (  ) =
prerrln("\
[argv] is too short: ", argv)
end//let
)
) where
{
//
val argv =
(
  XATS2JS_NODE_argv_get((*0*)))
(*
val (  ) = prerrln("argv = ", argv)
*)
//
}(*where*)//end-of-[mymain((*void*))]
//
}(*where*)//end-of-[val() = mymain()]
//
(* ****** ****** *)
endloc//end-of-local(val() = mymain())
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_UTIL_xatstop_typing.dats] *)
