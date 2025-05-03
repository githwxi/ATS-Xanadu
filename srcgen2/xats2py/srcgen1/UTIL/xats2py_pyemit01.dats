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
Sat Nov 30 09:30:10 PM EST 2024
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
#include
"./../HATS/libxats2js.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#staload "./../SATS/xats2py.sats"
#staload "./../SATS/py1emit.sats"
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
  py1emit_i1parsed(filr, ipar))
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
fun
argv$loop
(argv: argv): void =
(
  loop(3)) where
{
//
val n0 = length(argv)
//
fun
loop(i0: sint): void =
if
(i0 < n0)
then
(
  loop(i0+1)) where
{
val () =
xatsopt_flag$pvsadd0(argv[i0])
}
}(*where*)//end-of-[argv$loop(argv)]
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
mymain_main(): void =
let
//
val alen = length(argv)
//
val (  ) =
if
(
alen >= 3)
then
let // let
//
val ret1 =
the_fxtyenv_pvsload((*0*))
val (  ) =
if // if
(ret1 > 0)
then
prerrsln("\
// The fixity-defs loaded!")
val ret2 =
the_tr12env_pvsl01d((*nil*))
val (  ) =
if // if
(ret2 > 0)
then prerrsln("\
// The trans12-defs loaded!")
//
val (  ) =
xatsopt_flag$pvsadd0("--_XATS2PY_")
val (  ) =
xatsopt_flag$pvsadd0("--_SRCGEN2_XATS2PY_")
//
in//let
(
argv$loop(argv); mymain_work(argv[2]))
endlet // let // if(length(argv) >= 3)
//
val (  ) =
if
(
alen<=2)
then
let//let
val (  ) =
(
prerrsln
("ERROR: no source is given: ", argv))
endlet // let // if(length(argv) <= 2)
//
endlet where
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
val (  ) = prerrsln("\
// xats2py_pyemit01: argv = ", argv)
*)
//
}(*where*)//end-of-[mymain_main(...)]
//
(* ****** ****** *)
(* ****** ****** *)
val ((*entry*)) = mymain_main((*void*))
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen2_xats2py_srcgen1_UTIL_xats2py_pyemit01.dats] *)
