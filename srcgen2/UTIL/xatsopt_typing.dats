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
fpath_satsq
(fp: strn): bool =
let
//
val n0 =
strn_length(fp)
//
in//in
//
if
(n0 <= 4)
then false else
(
if(fp[n0-1]!='s')
then (false) else
if(fp[n0-2]!='t')
then (false) else
if(fp[n0-3]!='a')
then (false) else
if(fp[n0-4]!='s')
then (false) else
if(fp[n0-5]!='.')
then (false) else (true))
//
end//let//end-of-[fpath_satsq(fp)]
//
(* ****** ****** *)
//
fun
fpath_datsq
(fp: strn): bool =
let
//
val n0 =
strn_length(fp)
//
in//in
//
if
(n0 <= 4)
then false else
(
if(fp[n0-1]!='s')
then (false) else
if(fp[n0-2]!='t')
then (false) else
if(fp[n0-3]!='a')
then (false) else
if(fp[n0-4]!='d')
then (false) else
if(fp[n0-5]!='.')
then (false) else (true))
//
end//let//end-of-[fpath_datsq(fp)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
mymain_work
(fpth: strn): void =
let
//
val ( ) =
let
//
(*
val (   ) =
prerrsln("dpar3 = ", dpar3)
*)
//
in//let
//
prerrsln
("FPERR30_D3PARSED:");
fperr30_d3parsed(out, dpar3)
//
end//let
//
end where
{
//
val out =
(
  g_stderr((*0*)))
//
val dpar3 =
if
(
fpath_satsq(fpth))
then
(
  d3parsed_of_filsats(fpth))//then
else
(
  d3parsed_of_fildats(fpth))//else
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
then prerrsln("\
// The fixity-defs loaded!")
//
val ret2 =
the_tr12env_pvsload((*0*))
val (  ) =
if
(ret2 > 0)
then prerrsln("\
// The trans12-defs loaded!")
//
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
  XATS2JS_NODE_argv_get((*void*)))
(*
val (  ) = prerrsln
("// xatsopt_typing: argv = ", argv)
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
