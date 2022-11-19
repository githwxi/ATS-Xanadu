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
#include
"./../HATS/xatsopt_sats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(*
#typedef int0 = sint
#typedef btf0 = bool
#typedef chr0 = char
#typedef str0 = strn
*)
(* ****** ****** *)
#symload &  with land of 0
#symload << with lsln of 0
#symload >> with asrn of 0
#symload >> with lsrn of 0
(* ****** ****** *)
//
#define KINFIX0 0 // n-assoc
#define KINFIXL 1 // l-assoc
#define KINFIXR 2 // r-assoc
//
#define KPREFIX 3 // prefix0
#define KPSTFIX 4 // postfix
//
(* ****** ****** *)
//
#define BOXKIND 0x001 // (0x1 << 0)
#define LINKIND 0x010 // (0x1 << 1)
#define PRFKIND 0x100 // (0x1 << 2)
//
(* ****** ****** *)
//
#define PROPSORT 4 // 00100
//
#define VIEWSORT 6 // 00110
//
#define TYPESORT 0 // 00000
#define TBOXSORT 1 // 00001
#define TFLTSORT 0 // 00000
//
#define VWTPSORT 2 // 00010
#define VTBXSORT 3 // 00011
#define VTFTSORT 2 // 00010
//
(* ****** ****** *)

fun
sortbox(k0: sint): sint(*0,1*)
fun
sortlin(k0: sint): sint(*0,1*)
fun
sortprf(k0: sint): sint(*0,1*)
fun
sortpol(k0: sint): sint(*-1,0,1*)

(* ****** ****** *)
//
fun sortpolpos(k0: sint): sint
fun sortpolneg(k0: sint): sint
//
(* ****** ****** *)
//
fun
subsort_test(t1:int,t2:int):bool
//
(* ****** ****** *)
//
datatype
dctkind =
//
| DCKfun of ()
| DCKval of ()
| DCKpraxi of ()
| DCKprfun of ()
| DCKprval of ()
//
| DCKfcast of () // castfn
//
| DCKnspec of () // unspeced
// end of [dcstkind]
//
(* ****** ****** *)
//
fun//<>
dctkind_fprint
(out: FILR, dck: dctkind): void
//
(* ****** ****** *)
//
datatype
valkind =
//
| VLKval // val
//
| VLKvlp // val+
| VLKvln // val-
//
| VLKvlr // vlr: valrec
//
(*
// for model-checking
| VLKmcval of () // check-val
*)
// for theorem-proving
| VLKprval of () // proof-val
//
(* ****** ****** *)
//
fun//<>
valkind_fprint
(out: FILR, vlk: valkind): void
//
(* ****** ****** *)
//
datatype
varkind =
| VRKvar // var 
(*
// there may be some more
*)
(* ****** ****** *)
//
fun//<>
varkind_fprint
(out: FILR, vlk: varkind): void
//
(* ****** ****** *)
//
datatype
funkind =
//
| FNKfn0 // nonrec fun
| FNKfn1 // genrec fun
| FNKfn2 // tailrec fun
| FNKfnx // tailopt fun
| FNKfun // ex-specified
//
| FNKpraxi // proof axiom
//
| FNKprfn0 // nonrec prfun
| FNKprfn1 // genrec prfun
| FNKprfun // ex-specified
//
| FNKfcast // no-op casting
//
(* ****** ****** *)
fun//<>
funkind_fprint
(out: FILR, fnk: funkind): void
(* ****** ****** *)
//
datatype
caskind =
// case
| CSKcas0//warning only
// case+
| CSKcasp//stopping with errors
// case- 
| CSKcasn//ignoring non-exhaust
//
(* ****** ****** *)
fun//<>
caskind_fprint
(out: FILR, csk: caskind): void
(* ****** ****** *)
//
datatype
implknd =
//
| IMPLgen // for non-proof case
| IMPLprf // proof implementation
| IMPLval // value implementation
| IMPLfun // function implementation
| IMPLtmp // template implementation
//
(* ****** ****** *)
//
fun
implknd_fprint(FILR, implknd): void
//
(* ****** ****** *)
//
#define CLOFLT = 0 // flat
#define CLOPTR = 1 // linear-boxed
(*
#define CLOREF = -1 // non-linear-boxed
*)
#define LINCLOFLT = 2 // linear-flat
#define LINCLOPTR = 3 // linear-boxed
//
(* ****** ****** *)
datatype
f2clknd =
//
// func/clos-kind
//
| F2CLfun of ((*fun*))
| F2CLclo of int(*knd*)
  // closure: knd=1/0/~1: ptr/flt/ref
(* ****** ****** *)
fun
f2clknd_linq(f2cl: f2clknd): bool
(* ****** ****** *)
fun
f2clknd_fprint: (FILR, f2clknd)->void
(* ****** ****** *)
datatype
trcdknd =
//
| TRCDbox0 (*box*) // nonlin
| TRCDbox1 (*box*) // linear
//
| TRCDflt0 (* flat: non/lin *)
(*
| TRCDflt1 of stamp (* flat *)
*)
| TRCDflt2 of string (* flat *)
// end of [ datatype(trcdknd) ]
(* ****** ****** *)
fun
trcdknd_fprint: (FILR, trcdknd)->void
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_xbasics.sats] *)
