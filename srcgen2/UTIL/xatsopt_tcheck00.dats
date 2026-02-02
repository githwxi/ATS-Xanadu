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
//
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dpre.hats"
//
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
#if
defq(_XATS2JS_)
#typedef argv=jsa1sz(strn)
#endif//#if(defq(_XATS2JS_))
//
#if
defq(_XATS2PY_)
#typedef argv=pya1sz(strn)
#endif//#if(defq(_XATS2PY_))
//
#extern
fun
XATSOPT_argv$get
  ((*0*)): argv = $extnam()
//
(* ****** ****** *)
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
prerrsln("dpar = ", dpar)
*)
//
in//let
//
prerrsln
("F3PERR0_D3PARSED:");
f3perr0_d3parsed(out0, dpar)
//
end//let
//
end where
{
//
val out0 =
(
  g_stderr((*0*)))
//
val dpar =
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
(*
val () =
prerrsln("mymain_work(allist):")
val () = the_gmacenv_allist_prerr()
*)
//
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
the_fxtyenv_pvsl00d((*0*))
val (  ) =
if // if
(ret1 > 0)
then
prerrsln("\
// The fixity-defs loaded!")
val ret2 =
the_tr12env_pvsl00d((*nil*))
val (  ) =
if // if
(ret2 > 0)
then prerrsln("\
// The trans12-defs loaded!")
//
val (  ) =
xatsopt_flag$pvsadd0("--_XATSOPT_")
val (  ) =
xatsopt_flag$pvsadd0("--_SRCGEN2_XATSOPT_")
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
end(*let*)//if(length(argv) <= 2)//val()
//
endlet where
{
//
val (  ) =
prerrsln("// Welcome from ATS3/Xanadu!")
val (  ) =
prerrsln("// XATSHOME = ", the_XATSHOME())
//
val argv =
  XATSOPT_argv$get((*0*)) // val(argv)
(*
val (  ) =
prerrsln("xatsopt_tcheck00: argv = ", argv)
*)
//
}(*where*)//end-of-[mymain_main( (*void*) )]
//
(* ****** ****** *)
(* ****** ****** *)
val ((*the_entry_point*)) = mymain_main((*void*))
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_srcgen2_UTIL_xatstop_tcheck00.dats] *)
(***********************************************************************)
