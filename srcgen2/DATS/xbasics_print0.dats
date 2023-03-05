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
Start Time: May 28th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload "./../SATS/xbasics.sats"
(* ****** ****** *)

#implfun
//<>(*tmp*)
dctkind_fprint
  (out, dck) =
(
case+ dck of
|
DCKfun() => print("DCKfun")
|
DCKval() => print("DCKval")
|
DCKpraxi() => print("DCKpraxi")
|
DCKprfun() => print("DCKprfun")
|
DCKprval() => print("DCKprval")
//
|
DCKfcast() => print("DCKfcast")
//
|
DCKnspec() => print("DCKnspec")
) where
{
  #impltmp g_print$out<>() = out
}(*where*)//end-of(dctkind_fprint)

(* ****** ****** *)

#implfun
//<>(*tmp*)
valkind_fprint
  (out, vlk) = let
//
#impltmp g_print$out<>() = out
//
in//let
//
case+ vlk of
//
| VLKval() => print("VLKval")
//
| VLKvlp() => print("VLKvlp")
| VLKvln() => print("VLKvln")
//
| VLKvlr() => print("VLKvlr")
//
| VLKprval() => print("VLKprval")
//
end(*let*)//end-of(valkind_fprint)

(* ****** ****** *)

#implfun
//<>(*tmp*)
varkind_fprint
  (out, vrk) = let
//
#impltmp g_print$out<>() = out
//
in//let
//
case+ vrk of
| VRKvar() => print( "VAKvar" )
//
end(*let*)//end-of(varkind_fprint)

(* ****** ****** *)

#implfun
//<>(*tmp*)
funkind_fprint
  (out, fnk) = let
//
#impltmp g_print$out<>() = out
//
in//let
//
case+ fnk of
| FNKfn0() => print("FNKfn0")
| FNKfn1() => print("FNKfn1")
| FNKfn2() => print("FNKfn2")
| FNKfnx() => print("FNKfnx")
| FNKfun() => print("FNKfun")
//
| FNKpraxi() => print("FNKpraxi")
//
| FNKprfn0() => print("FNKprfn0")
| FNKprfn1() => print("FNKprfn1")
| FNKprfun() => print("FNKprfun")
//
| FNKfcast() => print("FNKfcast")
//
end(*let*)//end-of(funkind_fprint)

(* ****** ****** *)

#implfun
//<>(*tmp*)
caskind_fprint
  (out, csk) = let
//
#impltmp g_print$out<>() = out
//
in//let
//
case+ csk of
// case
| CSKcas0() => print( "CSKcas0" )
// case+
| CSKcasp() => print( "CSKcasp" )
// case-
| CSKcasn() => print( "CSKcasn" )
//
end(*let*)//end-of(caskind_fprint)

(* ****** ****** *)

#implfun
//<>(*tmp*)
implknd_fprint
  (out, knd) = let
//
#impltmp g_print$out<>() = out
//
in//let
//
case+ knd of
| IMPLgen() => print( "IMPLgen" )
| IMPLprf() => print( "IMPLprf" )
| IMPLval() => print( "IMPLval" )
| IMPLfun() => print( "IMPLfun" )
| IMPLtmp() => print( "IMPLtmp" )
//
end(*let*)//end-of(implknd_fprint)

(* ****** ****** *)

#implfun
//<>(*tmp*)
f2clknd_fprint
  (out, f2cl) = let
//
#impltmp g_print$out<>() = out
//
in//let
//
case+ f2cl of
//
(*
| F2CLcon() =>
    print( "F2CLcon" )
*)
//
| F2CLfun() =>
    print( "F2CLfun" )
| F2CLclo(knd) =>
    print( "F2CLclo(", knd, ")" )
//
end(*let*)//end-of(f2clknd_fprint)

(* ****** ****** *)

#implfun
//<>(*tmp*)
trcdknd_fprint
  (out, tknd) = let
//
#impltmp g_print$out<>() = out
//
in//let
//
case+ tknd of
|
TRCDbox0() => print( "TRCDbox0" )
|
TRCDbox1() => print( "TRCDbox1" )
|
TRCDflt0() => print( "TRCDflt0" )
(*
|
TRCDflt1() => print( "TRCDflt1" )
*)
|
TRCDflt2
(  name  ) => print("TRCDflt2(",name,")")
//
end(*let*)//end-of(trcdknd_fprint)

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xbasics_print0.dats] *)
