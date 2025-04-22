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
Thu 29 Aug 2024 09:18:40 AM EDT
//
Authoremail: gmhwxiATgmailDOTcom
*)
(* ****** ****** *)
(* ****** ****** *)
#include
"./../../..\
/HATS/xatsopt_sats.hats"
(*
#include
"./../../..\
/HATS/xatsopt_dats.hats"
*)
#include
"./../../..\
/HATS/xatsopt_dpre.hats"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/libxatsopt.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/intrep0.sats"
#staload "./../SATS/intrep1.sats"
#staload "./../SATS/trxd3i0.sats"
#staload "./../SATS/trxi0i1.sats"
#staload "./../SATS/xats2js.sats"
#staload "./../SATS/js1emit.sats"
//
(* ****** ****** *)
(* ****** ****** *)
//
#typedef
argv = jsarray(strn)
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
(fpth: string): void =
let
//
val dpar =
d3parsed_of_trtmp3b(dpar)
val dpar =
d3parsed_of_trtmp3c(dpar)
val dpar =
d3parsed_of_tread30(dpar)
//
(*
val (  ) =
(
prerrsln
("d3parsed(30) = ", dpar))
*)
//
val (  ) =
let
val
out0 = g_stderr((*0*))
in//let
prerrsln
("FPERR30_D3PARSED:");
fperr30_d3parsed(out0, dpar)
end//let
//
val ipar =
(
  i0parsed_of_trxd3i0(dpar))
//
val ipar =
(
  i1parsed_of_trxi0i1(ipar))
//
in//let
//
let
val
filr = g_stdout<>()
in//let
(
  js1emit_i1parsed(filr, ipar))
end//let
//
end where
{
//
val
dpar = d3parsed_of_fildats(fpth)
//
(*
val (  ) =
prerrsln("mymain_work(allist):")
val (  ) = the_gmacenv_allist_prerr()
*)
}(*where*)//end-of-[mymain_work(fpth)]
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
the_tr12env_pvsl00d((*nil*))
val (  ) =
if
(ret2 > 0)
then prerrsln("\
// The trans12-defs loaded!")
//
val (  ) =
argv$loop(3) where
{
//
val alen = length(argv)
//
fun
argv$loop(i0: sint): void =
if
(i0 >= alen)
then () else
(
argv$loop(i0+1))
where{
val argi = argv[i0]
val (  ) =
xatsopt_flag$pvsadd0(argi) }
//
}(*where*)
//
}(*where*)//then//end-of-(if)
else
(
let
val (  ) =
(
prerrsln("ERROR: \
no source is given: ", argv))
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

(* end of [ATS3/XANADU_srcgen2_xats2js_srcgen1_UTIL_xats2js_jsemit00.dats] *)
