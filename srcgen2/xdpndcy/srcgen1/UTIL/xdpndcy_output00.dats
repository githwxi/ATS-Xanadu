(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Wed Apr  9 08:47:19 PM EDT 2025
//
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/libxatsopt.hats"
(* ****** ****** *)
#include
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
//
#staload "./../SATS/xdpndcy.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
argv = jsa1sz(strn)
#extern
fun
XATS2JS_NODE_argv$get
  ((*void*)): argv = $extnam()
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
mymain_work
(fpath: string): void =
let
//
val dpar =
d2parsed_of_tread20(dpar)
//
(*
val (  ) =
let
val
out = g_stderr((*0*))
in//let
prerrsln
("FPERR20_D2PARSED:");
fperr20_d2parsed(out, dpar)
end//let
*)
//
in//let
//
let
//
val filr = g_stdout<>()
val dcls = xdpndcy_d2parsed(dpar)
//
in//let
//
printsln
("xdpndcy_output00: dcls = ", dcls)
//
end//let
//
end where
{
val dpar = d2parsed_of_fildats(fpath)}
//
(* ****** ****** *)
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
  mymain_work(argv[2]))
where
{
//
val ret1 =
the_fxtyenv_pvsload((*0*))
val (  ) =
if
(ret1 > 0)
then
prerrsln("\
// The fixity-defs loaded!")
//
val ret2 =
the_tr12env_pvsl00d((*0*))
val (  ) =
if
(ret2 > 0)
then prerrsln("\
// The trans12-defs loaded!")
}
else
(
let
val (  ) =
prerrsln("\
[argv] is too short: ", argv)
end//let
)
) where
{
//
val (  ) =
prerrsln("\
// Welcome from ATS3/Xanadu!")
val (  ) =
prerrsln("\
// XATSHOME = ", the_XATSHOME())
//
val argv =
(
  XATS2JS_NODE_argv$get((*void*)))
(*
val (  ) = prerrsln
("// xats2js_jsemit: argv = ", argv)
*)
//
}(*where*)//end-of-[mymain((*void*))]
//
}(*where*)//end-of-[val() = mymain()]
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_UTIL_xdpndcy_output00.dats] *)
