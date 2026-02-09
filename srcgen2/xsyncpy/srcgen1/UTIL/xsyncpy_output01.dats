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
Tue May 20 02:26:22 AM EDT 2025
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
//
#staload
"./../SATS/statyp2.sats"
#staload
"./../SATS/dynexp3.sats"
//
#staload
"./../SATS/trx3cpy.sats"
#staload
"./../SATS/trxltck.sats"
#staload
"./../SATS/tryltck.sats"
#staload
"./../SATS/fpeltck.sats"
//
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/libxatsopt.hats"
(* ****** ****** *)
#staload
"./../HATS/mytmplib00.hats"
(* ****** ****** *)
(* ****** ****** *)
//
#if
defq(_XATS2JS_)
#typedef argv=jsa1sz(strn)
#endif//#if(defq(_XATS2JS_))
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
//
fun
mymain_work
(fpth: string): void =
let
//
val dpar =
d3parsed_of_tread3a(dpar)
//
(*
//
val dpar =
(
d3parsed_of_trtmp3b(dpar))
val dpar =
(
d3parsed_of_trtmp3c(dpar))
//
val dpar =
(
d3parsed_of_t3read0(dpar))
//
*)
//
val (  ) =
(
prerrsln
("d3parsed(30) = ", dpar))
//
(* ****** ****** *)
//
val (  ) =
let//1
val
out0 = g_stderr((*0*))
in//let1
prerrsln
("F3PERR0_D3PARSED:");
f3perr0_d3parsed(out0,dpar)
end//let1//end-of-(val(...))
//
(* ****** ****** *)
//
local
val
dpar1 =
d3parsed_of_trx3cpy(dpar)
in//local
//
val dpar1 =
(
d3parsed1_of_trxltck(dpar1))
val dpar1 =
(
d3parsed1_of_tryltck(dpar1))
//
end//local
//
(* ****** ****** *)
//
val (  ) =
let//2
#extern
fcast
castxy
{ax:t0}
{ay:t0}(ax:ax):(ay)
val
filr = castxy(g_stdout<>())
in//let2
//
prints("d3parsed1(ltck) = ");
d3parsed1_fprint(dpar1, filr);
printsln((*endof(d3parsed1)*))
//
end//let2
//
(* ****** ****** *)
//
val (  ) =
let//3
#extern
fcast
castxy
{ax:t0}
{ay:t0}(ax:ax):(ay)
val
filr = castxy(g_stdout<>())
in//let3
prerrsln
("FPELTCK_D3PARSED1:");
fpeltck_d3parsed1(filr, dpar1)
end//let3
//
(* ****** ****** *)
//
end where // end-of(let)
{
//
val
dpar = d3parsed_of_fildats(fpth)
//
val (  ) =
(
prerrsln("d3parsed(23) = ", dpar))
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
the_fxtyenv_pvsl01d((*0*))
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
in//let
(
argv$loop(argv);mymain_work(argv[2]))
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
prerrsln("// Welcome from ATS3/Xanadu!")
val (  ) =
prerrsln("// XATSHOME = ", the_XATSHOME())
//
val argv =
  XATSOPT_argv$get((*0*)) // end(val(argv))
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
(* end of [ATS3/XANADU_srcgen2_xsyncpy_srcgen1_UTIL_xsyncpy_output01.dats] *)
(***********************************************************************)
