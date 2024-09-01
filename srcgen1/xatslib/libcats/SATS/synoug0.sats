(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2020 Hongwei Xi, ATS Trustful Software, Inc.
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
//
(*
HX-2022-06-03
Syntactic candies :)
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Start Time: April, 2020
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#staload
"./../SATS/libcats.sats"
(* ****** ****** *)
(* ****** ****** *)
(*
fun<>
gs_prout_n0
((*void*)) : void
*)
fun
<a1:t0>
gs_prout_n1
( x1: a1 ) : void
fun
<a1:t0>
<a2:t0>
gs_prout_n2
( x1: a1, x2: a2 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
gs_prout_n3
( x1: a1
, x2: a2, x3: a3 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
gs_prout_n4
( x1: a1, x2: a2
, x3: a3, x4: a4 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
gs_prout_n5
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
gs_prout_n6
( x1: a1, x2: a2
, x3: a3, x4: a4
, x5: a5, x6: a6 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<a7:t0>
gs_prout_n7
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5
, x6: a6, x7: a7 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<a7:t0>
<a8:t0>
gs_prout_n8
( x1: a1, x2: a2
, x3: a3, x4: a4
, x5: a5, x6: a6
, x7: a7, x8: a8 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<a7:t0>
<a8:t0>
<a9:t0>
gs_prout_n9
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5
, x6: a6, x7: a7
, x8: a8, x9: a9 ) : void
(* ****** ****** *)
fun
<a01:t0>
<a02:t0>
<a03:t0>
<a04:t0>
<a05:t0>
<a06:t0>
<a07:t0>
<a08:t0>
<a09:t0>
<a10:t0>
gs_prout_n10
(x01: a01, x02: a02
,x03: a03, x04: a04
,x05: a05, x06: a06
,x07: a07, x08: a08
,x09: a09, x10: a10) : void
(* ****** ****** *)
//
#symload prout with gs_prout_n1
//
#symload prouts with gs_prout_n1
#symload prouts with gs_prout_n2
#symload prouts with gs_prout_n3
#symload prouts with gs_prout_n4
#symload prouts with gs_prout_n5
#symload prouts with gs_prout_n6
#symload prouts with gs_prout_n7
#symload prouts with gs_prout_n8
#symload prouts with gs_prout_n9
#symload prouts with gs_prout_n10
//
(* ****** ****** *)
(* ****** ****** *)
(*
fun<>
gs_prout0_n0
((*void*)) : void
*)
fun
<a1:vt>
gs_prout0_n1
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_prout0_n2
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_prout0_n3
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_prout0_n4
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_prout0_n5
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_prout0_n6
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_prout0_n7
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_prout0_n8
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6
, x7: ~a7, x8: ~a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_prout0_n9
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ) : void
(* ****** ****** *)
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_prout0_n10
(x01: ~a01, x02: ~a02
,x03: ~a03, x04: ~a04
,x05: ~a05, x06: ~a06
,x07: ~a07, x08: ~a08
,x09: ~a09, x10: ~a10) : void
(* ****** ****** *)
//
#symload prout0 with gs_prout0_n1
//
#symload prout0s with gs_prout0_n1
#symload prout0s with gs_prout0_n2
#symload prout0s with gs_prout0_n3
#symload prout0s with gs_prout0_n4
#symload prout0s with gs_prout0_n5
#symload prout0s with gs_prout0_n6
#symload prout0s with gs_prout0_n7
#symload prout0s with gs_prout0_n8
#symload prout0s with gs_prout0_n9
#symload prout0s with gs_prout0_n10
//
(* ****** ****** *)
(* ****** ****** *)
(*
fun<>
gs_prout1_n0
((*void*)) : void
*)
fun
<a1:vt>
gs_prout1_n1
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_prout1_n2
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_prout1_n3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_prout1_n4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_prout1_n5
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_prout1_n6
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_prout1_n7
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_prout1_n8
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6
, x7: !a7, x8: !a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_prout1_n9
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_prout1_n10
(x01: !a01, x02: !a02
,x03: !a03, x04: !a04
,x05: !a05, x06: !a06
,x07: !a07, x08: !a08
,x09: !a09, x10: !a10) : void
(* ****** ****** *)
//
#symload prout1 with gs_prout1_n1
//
#symload prout1s with gs_prout1_n1
#symload prout1s with gs_prout1_n2
#symload prout1s with gs_prout1_n3
#symload prout1s with gs_prout1_n4
#symload prout1s with gs_prout1_n5
#symload prout1s with gs_prout1_n6
#symload prout1s with gs_prout1_n7
#symload prout1s with gs_prout1_n8
#symload prout1s with gs_prout1_n9
#symload prout1s with gs_prout1_n10
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun<>
gs_prerr_n0
((*void*)) : void
*)
fun
<a1:t0>
gs_prerr_n1
( x1: a1 ) : void
fun
<a1:t0>
<a2:t0>
gs_prerr_n2
( x1: a1, x2: a2 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
gs_prerr_n3
( x1: a1
, x2: a2, x3: a3 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
gs_prerr_n4
( x1: a1, x2: a2
, x3: a3, x4: a4 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
gs_prerr_n5
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
gs_prerr_n6
( x1: a1, x2: a2
, x3: a3, x4: a4
, x5: a5, x6: a6 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<a7:t0>
gs_prerr_n7
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5
, x6: a6, x7: a7 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<a7:t0>
<a8:t0>
gs_prerr_n8
( x1: a1, x2: a2
, x3: a3, x4: a4
, x5: a5, x6: a6
, x7: a7, x8: a8 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<a7:t0>
<a8:t0>
<a9:t0>
gs_prerr_n9
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5
, x6: a6, x7: a7
, x8: a8, x9: a9 ) : void
//
fun
<a01:t0>
<a02:t0>
<a03:t0>
<a04:t0>
<a05:t0>
<a06:t0>
<a07:t0>
<a08:t0>
<a09:t0>
<a10:t0>
gs_prerr_n10
(x01: a01, x02: a02
,x03: a03, x04: a04
,x05: a05, x06: a06
,x07: a07, x08: a08
,x09: a09, x10: a10) : void
//
(* ****** ****** *)
//
#symload prerr with gs_prerr_n1
//
#symload prerrs with gs_prerr_n1
#symload prerrs with gs_prerr_n2
#symload prerrs with gs_prerr_n3
#symload prerrs with gs_prerr_n4
#symload prerrs with gs_prerr_n5
#symload prerrs with gs_prerr_n6
#symload prerrs with gs_prerr_n7
#symload prerrs with gs_prerr_n8
#symload prerrs with gs_prerr_n9
#symload prerrs with gs_prerr_n10
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
fun<>
gs_prerr0_n0
((*void*)) : void
*)
fun
<a1:vt>
gs_prerr0_n1
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_prerr0_n2
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_prerr0_n3
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_prerr0_n4
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_prerr0_n5
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_prerr0_n6
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_prerr0_n7
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_prerr0_n8
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6
, x7: ~a7, x8: ~a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_prerr0_n9
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ) : void
//
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_prerr0_n10
(x01: ~a01, x02: ~a02
,x03: ~a03, x04: ~a04
,x05: ~a05, x06: ~a06
,x07: ~a07, x08: ~a08
,x09: ~a09, x10: ~a10) : void
//
(* ****** ****** *)
//
#symload prerr0 with gs_prerr0_n1
//
#symload prerr0s with gs_prerr0_n1
#symload prerr0s with gs_prerr0_n2
#symload prerr0s with gs_prerr0_n3
#symload prerr0s with gs_prerr0_n4
#symload prerr0s with gs_prerr0_n5
#symload prerr0s with gs_prerr0_n6
#symload prerr0s with gs_prerr0_n7
#symload prerr0s with gs_prerr0_n8
#symload prerr0s with gs_prerr0_n9
#symload prerr0s with gs_prerr0_n10
//
(* ****** ****** *)
(* ****** ****** *)
(*
fun<>
gs_prerr1_n0
((*void*)) : void
*)
fun
<a1:vt>
gs_prerr1_n1
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_prerr1_n2
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_prerr1_n3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_prerr1_n4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_prerr1_n5
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_prerr1_n6
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_prerr1_n7
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_prerr1_n8
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6
, x7: !a7, x8: !a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_prerr1_n9
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_prerr1_n10
(x01: !a01, x02: !a02
,x03: !a03, x04: !a04
,x05: !a05, x06: !a06
,x07: !a07, x08: !a08
,x09: !a09, x10: !a10) : void
(* ****** ****** *)
//
#symload prerr1 with gs_prerr1_n1
//
#symload prerr1s with gs_prerr1_n1
#symload prerr1s with gs_prerr1_n2
#symload prerr1s with gs_prerr1_n3
#symload prerr1s with gs_prerr1_n4
#symload prerr1s with gs_prerr1_n5
#symload prerr1s with gs_prerr1_n6
#symload prerr1s with gs_prerr1_n7
#symload prerr1s with gs_prerr1_n8
#symload prerr1s with gs_prerr1_n9
#symload prerr1s with gs_prerr1_n10
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
g_prout_newln
((*void*)): void
//
(* ****** ****** *)
//
fun<>
gs_proutln_n0
((*void*)) : void
fun
<a1:vt>
gs_proutln_n1
( x1: a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_proutln_n2
( x1: a1, x2: a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_proutln_n3
( x1: a1
, x2: a2, x3: a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_proutln_n4
( x1: a1, x2: a2
, x3: a3, x4: a4) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_proutln_n5
( x1: a1
, x2: a2, x3: a3 
, x4: a4, x5: a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_proutln_n6
( x1: a1, x2: a2
, x3: a3, x4: a4
, x5: a5, x6: a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_proutln_n7
( x1: a1
, x2: a2, x3: a3 
, x4: a4, x5: a5 
, x6: a6, x7: a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_proutln_n8
( x1: a1, x2: a2
, x3: a3, x4: a4
, x5: a5, x6: a6
, x7: a7, x8: a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_proutln_n9
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5
, x6: a6, x7: a7
, x8: a8, x9: a9 ) : void
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_proutln_n10
(x01: a01, x02: a02
,x03: a03, x04: a04
,x05: a05, x06: a06
,x07: a07, x08: a08
,x09: a09, x10: a10) : void
//
(* ****** ****** *)
//
#symload proutln with gs_proutln_n1
//
#symload proutsln with gs_proutln_n0
#symload proutsln with gs_proutln_n1
#symload proutsln with gs_proutln_n2
#symload proutsln with gs_proutln_n3
#symload proutsln with gs_proutln_n4
#symload proutsln with gs_proutln_n5
#symload proutsln with gs_proutln_n6
#symload proutsln with gs_proutln_n7
#symload proutsln with gs_proutln_n8
#symload proutsln with gs_proutln_n9
#symload proutsln with gs_proutln_n10
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
gs_prout0ln_n0
((*void*)) : void
fun
<a1:vt>
gs_prout0ln_n1
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_prout0ln_n2
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_prout0ln_n3
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_prout0ln_n4
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_prout0ln_n5
( x1: ~a1
, x2: ~a2, x3: ~a3 
, x4: ~a4, x5: ~a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_prout0ln_n6
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_prout0ln_n7
( x1: ~a1
, x2: ~a2, x3: ~a3 
, x4: ~a4, x5: ~a5 
, x6: ~a6, x7: ~a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_prout0ln_n8
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6
, x7: ~a7, x8: ~a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_prout0ln_n9
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ) : void
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_prout0ln_n10
(x01: ~a01, x02: ~a02
,x03: ~a03, x04: ~a04
,x05: ~a05, x06: ~a06
,x07: ~a07, x08: ~a08
,x09: ~a09, x10: ~a10) : void
//
(* ****** ****** *)
//
#symload prout0ln with gs_prout0ln_n1
//
#symload prout0sln with gs_prout0ln_n0
#symload prout0sln with gs_prout0ln_n1
#symload prout0sln with gs_prout0ln_n2
#symload prout0sln with gs_prout0ln_n3
#symload prout0sln with gs_prout0ln_n4
#symload prout0sln with gs_prout0ln_n5
#symload prout0sln with gs_prout0ln_n6
#symload prout0sln with gs_prout0ln_n7
#symload prout0sln with gs_prout0ln_n8
#symload prout0sln with gs_prout0ln_n9
#symload prout0sln with gs_prout0ln_n10
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
gs_prout1ln_n0
((*void*)) : void
fun
<a1:vt>
gs_prout1ln_n1
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_prout1ln_n2
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_prout1ln_n3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_prout1ln_n4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_prout1ln_n5
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_prout1ln_n6
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_prout1ln_n7
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_prout1ln_n8
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6
, x7: !a7, x8: !a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_prout1ln_n9
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
//
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_prout1ln_n10
(x01: !a01, x02: !a02
,x03: !a03, x04: !a04
,x05: !a05, x06: !a06
,x07: !a07, x08: !a08
,x09: !a09, x10: !a10) : void
//
(* ****** ****** *)
//
#symload prout1ln with gs_prout1ln_n1
//
#symload prout1sln with gs_prout1ln_n0
#symload prout1sln with gs_prout1ln_n1
#symload prout1sln with gs_prout1ln_n2
#symload prout1sln with gs_prout1ln_n3
#symload prout1sln with gs_prout1ln_n4
#symload prout1sln with gs_prout1ln_n5
#symload prout1sln with gs_prout1ln_n6
#symload prout1sln with gs_prout1ln_n7
#symload prout1sln with gs_prout1ln_n8
#symload prout1sln with gs_prout1ln_n9
#symload prout1sln with gs_prout1ln_n10
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
g_prerr_newln
((*void*)) : void
//
(* ****** ****** *)
//
fun<>
gs_prerrln_n0
((*void*)) : void
fun
<a1:t0>
gs_prerrln_n1
( x1: a1 ) : void
fun
<a1:t0>
<a2:t0>
gs_prerrln_n2
( x1: a1, x2: a2 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
gs_prerrln_n3
( x1: a1
, x2: a2, x3: a3 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
gs_prerrln_n4
( x1: a1, x2: a2
, x3: a3, x4: a4) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
gs_prerrln_n5
( x1: a1
, x2: a2, x3: a3 
, x4: a4, x5: a5 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
gs_prerrln_n6
( x1: a1, x2: a2
, x3: a3, x4: a4
, x5: a5, x6: a6 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<a7:t0>
gs_prerrln_n7
( x1: a1
, x2: a2, x3: a3 
, x4: a4, x5: a5 
, x6: a6, x7: a7 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<a7:t0>
<a8:t0>
gs_prerrln_n8
( x1: a1, x2: a2
, x3: a3, x4: a4
, x5: a5, x6: a6
, x7: a7, x8: a8 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
<a6:t0>
<a7:t0>
<a8:t0>
<a9:t0>
gs_prerrln_n9
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5
, x6: a6, x7: a7
, x8: a8, x9: a9 ) : void
fun
<a01:t0>
<a02:t0>
<a03:t0>
<a04:t0>
<a05:t0>
<a06:t0>
<a07:t0>
<a08:t0>
<a09:t0>
<a10:t0>
gs_prerrln_n10
(x01: a01, x02: a02
,x03: a03, x04: a04
,x05: a05, x06: a06
,x07: a07, x08: a08
,x09: a09, x10: a10) : void
//
(* ****** ****** *)
//
#symload prerrln with gs_prerrln_n1
#symload prerrsln with gs_prerrln_n0
#symload prerrsln with gs_prerrln_n1
#symload prerrsln with gs_prerrln_n2
#symload prerrsln with gs_prerrln_n3
#symload prerrsln with gs_prerrln_n4
#symload prerrsln with gs_prerrln_n5
#symload prerrsln with gs_prerrln_n6
#symload prerrsln with gs_prerrln_n7
#symload prerrsln with gs_prerrln_n8
#symload prerrsln with gs_prerrln_n9
#symload prerrsln with gs_prerrln_n10
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
gs_prerr0ln_n0
((*void*)) : void
fun
<a1:vt>
gs_prerr0ln_n1
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_prerr0ln_n2
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_prerr0ln_n3
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_prerr0ln_n4
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_prerr0ln_n5
( x1: ~a1
, x2: ~a2, x3: ~a3 
, x4: ~a4, x5: ~a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_prerr0ln_n6
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_prerr0ln_n7
( x1: ~a1
, x2: ~a2, x3: ~a3 
, x4: ~a4, x5: ~a5 
, x6: ~a6, x7: ~a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_prerr0ln_n8
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6
, x7: ~a7, x8: ~a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_prerr0ln_n9
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ) : void
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_prerr0ln_n10
(x01: ~a01, x02: ~a02
,x03: ~a03, x04: ~a04
,x05: ~a05, x06: ~a06
,x07: ~a07, x08: ~a08
,x09: ~a09, x10: ~a10) : void
//
(* ****** ****** *)
//
#symload prerr0ln with gs_prerr0ln_n1
#symload prerr0sln with gs_prerr0ln_n0
#symload prerr0sln with gs_prerr0ln_n1
#symload prerr0sln with gs_prerr0ln_n2
#symload prerr0sln with gs_prerr0ln_n3
#symload prerr0sln with gs_prerr0ln_n4
#symload prerr0sln with gs_prerr0ln_n5
#symload prerr0sln with gs_prerr0ln_n6
#symload prerr0sln with gs_prerr0ln_n7
#symload prerr0sln with gs_prerr0ln_n8
#symload prerr0sln with gs_prerr0ln_n9
#symload prerr0sln with gs_prerr0ln_n10
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
gs_prerr1ln_n0
((*void*)) : void
fun
<a1:vt>
gs_prerr1ln_n1
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_prerr1ln_n2
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_prerr1ln_n3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_prerr1ln_n4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_prerr1ln_n5
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_prerr1ln_n6
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_prerr1ln_n7
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_prerr1ln_n8
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4
, x5: !a5, x6: !a6
, x7: !a7, x8: !a8 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
<a9:vt>
gs_prerr1ln_n9
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
//
fun
<a01:vt>
<a02:vt>
<a03:vt>
<a04:vt>
<a05:vt>
<a06:vt>
<a07:vt>
<a08:vt>
<a09:vt>
<a10:vt>
gs_prerr1ln_n10
(x01: !a01, x02: !a02
,x03: !a03, x04: !a04
,x05: !a05, x06: !a06
,x07: !a07, x08: !a08
,x09: !a09, x10: !a10) : void
//
(* ****** ****** *)
//
#symload prerr1ln with gs_prerr1ln_n1
#symload prerr1sln with gs_prerr1ln_n0
#symload prerr1sln with gs_prerr1ln_n1
#symload prerr1sln with gs_prerr1ln_n2
#symload prerr1sln with gs_prerr1ln_n3
#symload prerr1sln with gs_prerr1ln_n4
#symload prerr1sln with gs_prerr1ln_n5
#symload prerr1sln with gs_prerr1ln_n6
#symload prerr1sln with gs_prerr1ln_n7
#symload prerr1sln with gs_prerr1ln_n8
#symload prerr1sln with gs_prerr1ln_n9
#symload prerr1sln with gs_prerr1ln_n10
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_xatslib_libcats_SATS_synoug0.sats] *)
