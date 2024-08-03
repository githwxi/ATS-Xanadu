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
// For some sugary syntax
//
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Start Time: June 5th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
//
fun
<a0:vt>
optn_vt_n0
(      ): optn_vt(a0,ff)
fun
<a0:vt>
optn_vt_n1
(x1: a0): optn_vt(a0,tt)
//
(* ****** ****** *)
//
#symload
optn_vt with optn_vt_n0
#symload
optn_vt with optn_vt_n1
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 20:35:51 EDT 2022
*)
//
fun
<a0:vt>
list_vt_n0
(      ): list_vt(a0, 0)
fun
<a0:vt>
list_vt_n1
(x1: a0): list_vt(a0, 1)
fun
<a0:vt>
list_vt_n2
(x1: a0
,x2: a0): list_vt(a0, 2)
fun
<a0:vt>
list_vt_n3
(x1: a0
,x2: a0
,x3: a0): list_vt(a0, 3)
fun
<a0:vt>
list_vt_n4
(x1: a0
,x2: a0
,x3: a0
,x4: a0): list_vt(a0, 4)
fun
<a0:vt>
list_vt_n5
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0): list_vt(a0, 5)
fun
<a0:vt>
list_vt_n6
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0
,x6: a0): list_vt(a0, 6)
fun
<a0:vt>
list_vt_n7
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0
,x6: a0
,x7: a0): list_vt(a0, 7)
fun
<a0:vt>
list_vt_n8
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0
,x6: a0
,x7: a0
,x8: a0): list_vt(a0, 8)
fun
<a0:vt>
list_vt_n9
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0
,x6: a0
,x7: a0
,x8: a0
,x9: a0): list_vt(a0, 9)
fun
<a0:vt>
list_vt_n10
(x01: a0
,x02: a0
,x03: a0
,x04: a0
,x05: a0
,x06: a0
,x07: a0
,x08: a0
,x09: a0
,x10: a0): list_vt(a0, 10)
//
(* ****** ****** *)
//
#symload list_vt with list_vt_n0
#symload list_vt with list_vt_n1
#symload list_vt with list_vt_n2
#symload list_vt with list_vt_n3
#symload list_vt with list_vt_n4
#symload list_vt with list_vt_n5
#symload list_vt with list_vt_n6
#symload list_vt with list_vt_n7
#symload list_vt with list_vt_n8
#symload list_vt with list_vt_n9
#symload list_vt with list_vt_n10
//
(* ****** ****** *)
//HX:
//implementing fproc0/1
(* ****** ****** *)
//
fun
<a0:vt>
g_fproc0(x0: ~a0): void
fun
<a0:vt>
g_fproc1(x0: !a0): void
//
(* ****** ****** *)
//
(*
fun<>
gs_fproc0_n0
((*void*)) : void
*)
fun
<a1:vt>
gs_fproc0_n1
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_fproc0_n2
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_fproc0_n3
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_fproc0_n4
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_fproc0_n5
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
gs_fproc0_n6
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
gs_fproc0_n7
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
gs_fproc0_n8
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
gs_fproc0_n9
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
gs_fproc0_n10
( x01: ~a01, x02: ~a02
, x03: ~a03, x04: ~a04
, x05: ~a05, x06: ~a06
, x07: ~a07, x08: ~a08
, x09: ~a09, x10: ~a10 ) : void
(* ****** ****** *)
//
#symload fproc0 with gs_fproc0_n1
#symload fproc0 with gs_fproc0_n2
#symload fproc0 with gs_fproc0_n3
#symload fproc0 with gs_fproc0_n4
#symload fproc0 with gs_fproc0_n5
#symload fproc0 with gs_fproc0_n6
#symload fproc0 with gs_fproc0_n7
#symload fproc0 with gs_fproc0_n8
#symload fproc0 with gs_fproc0_n9
#symload fproc0 with gs_fproc0_n10
//
(* ****** ****** *)
//
(*
fun<>
gs_fproc1_n0
((*void*)) : void
*)
fun
<a1:vt>
gs_fproc1_n1
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_fproc1_n2
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_fproc1_n3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_fproc1_n4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_fproc1_n5
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
gs_fproc1_n6
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
gs_fproc1_n7
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
gs_fproc1_n8
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
gs_fproc1_n9
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
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
gs_fproc1_n10
( x01: !a01, x02: !a02
, x03: !a03, x04: !a04
, x05: !a05, x06: !a06
, x07: !a07, x08: !a08
, x09: !a09, x10: !a10 ) : void
(* ****** ****** *)
//
#symload fproc1 with gs_fproc1_n1
#symload fproc1 with gs_fproc1_n2
#symload fproc1 with gs_fproc1_n3
#symload fproc1 with gs_fproc1_n4
#symload fproc1 with gs_fproc1_n5
#symload fproc1 with gs_fproc1_n6
#symload fproc1 with gs_fproc1_n7
#symload fproc1 with gs_fproc1_n8
#symload fproc1 with gs_fproc1_n9
#symload fproc1 with gs_fproc1_n10
//
(* ****** ****** *)
//
//HX:
//implementing fred2
//
(* ****** ****** *)
//
fun
<a0:vt>
g_fred20(~a0, ~a0): a0
fun
<a0:vt>
g_fred21(!a0, !a0): a0
//
(* ****** ****** *)
fun
<a0:vt>
gs_fred2l0_n2
(x1: ~a0, x2: ~a0): a0
fun
<a0:vt>
gs_fred2l0_n3
( x1: ~a0
, x2: ~a0, x3: ~a0): a0
fun
<a0:vt>
gs_fred2l0_n4
( x1: ~a0, x2: ~a0
, x3: ~a0, x4: ~a0): a0
fun
<a0:vt>
gs_fred2l0_n5
( x1: ~a0
, x2: ~a0, x3: ~a0
, x4: ~a0, x5: ~a0): a0
fun
<a0:vt>
gs_fred2l0_n6
( x1: ~a0, x2: ~a0
, x3: ~a0, x4: ~a0
, x5: ~a0, x6: ~a0): a0
fun
<a0:vt>
gs_fred2l0_n7
( x1: ~a0
, x2: ~a0, x3: ~a0
, x4: ~a0, x5: ~a0
, x6: ~a0, x7: ~a0): a0
fun
<a0:vt>
gs_fred2l0_n8
( x1: ~a0, x2: ~a0
, x3: ~a0, x4: ~a0
, x5: ~a0, x6: ~a0
, x7: ~a0, x8: ~a0): a0
fun
<a0:vt>
gs_fred2l0_n9
( x1: ~a0
, x2: ~a0, x3: ~a0
, x4: ~a0, x5: ~a0
, x6: ~a0, x7: ~a0
, x8: ~a0, x9: ~a0): a0
//
fun
<a0:vt>
gs_fred2l0_n10
( x01: ~a0, x02: ~a0
, x03: ~a0, x04: ~a0
, x05: ~a0, x06: ~a0
, x07: ~a0, x08: ~a0
, x09: ~a0, x10: ~a0): a0
//
(* ****** ****** *)
fun
<a0:vt>
gs_fred2l1_n2
(x1: !a0, x2: !a0): a0
fun
<a0:vt>
gs_fred2l1_n3
( x1: !a0
, x2: !a0, x3: !a0): a0
fun
<a0:vt>
gs_fred2l1_n4
( x1: !a0, x2: !a0
, x3: !a0, x4: !a0): a0
fun
<a0:vt>
gs_fred2l1_n5
( x1: !a0
, x2: !a0, x3: !a0
, x4: !a0, x5: !a0): a0
fun
<a0:vt>
gs_fred2l1_n6
( x1: !a0, x2: !a0
, x3: !a0, x4: !a0
, x5: !a0, x6: !a0): a0
fun
<a0:vt>
gs_fred2l1_n7
( x1: !a0
, x2: !a0, x3: !a0
, x4: !a0, x5: !a0
, x6: !a0, x7: !a0): a0
fun
<a0:vt>
gs_fred2l1_n8
( x1: !a0, x2: !a0
, x3: !a0, x4: !a0
, x5: !a0, x6: !a0
, x7: !a0, x8: !a0): a0
fun
<a0:vt>
gs_fred2l1_n9
( x1: !a0
, x2: !a0, x3: !a0
, x4: !a0, x5: !a0
, x6: !a0, x7: !a0
, x8: !a0, x9: !a0): a0
//
fun
<a0:vt>
gs_fred2l1_n10
( x01: !a0, x02: !a0
, x03: !a0, x04: !a0
, x05: !a0, x06: !a0
, x07: !a0, x08: !a0
, x09: !a0, x10: !a0): a0
//
(* ****** ****** *)
fun
<a0:vt>
gs_fred2r0_n2
(x1: ~a0, x2: ~a0): a0
fun
<a0:vt>
gs_fred2r0_n3
( x1: ~a0
, x2: ~a0, x3: ~a0): a0
fun
<a0:vt>
gs_fred2r0_n4
( x1: ~a0, x2: ~a0
, x3: ~a0, x4: ~a0): a0
fun
<a0:vt>
gs_fred2r0_n5
( x1: ~a0
, x2: ~a0, x3: ~a0
, x4: ~a0, x5: ~a0): a0
fun
<a0:vt>
gs_fred2r0_n6
( x1: ~a0, x2: ~a0
, x3: ~a0, x4: ~a0
, x5: ~a0, x6: ~a0): a0
fun
<a0:vt>
gs_fred2r0_n7
( x1: ~a0
, x2: ~a0, x3: ~a0
, x4: ~a0, x5: ~a0
, x6: ~a0, x7: ~a0): a0
fun
<a0:vt>
gs_fred2r0_n8
( x1: ~a0, x2: ~a0
, x3: ~a0, x4: ~a0
, x5: ~a0, x6: ~a0
, x7: ~a0, x8: ~a0): a0
fun
<a0:vt>
gs_fred2r0_n9
( x1: ~a0
, x2: ~a0, x3: ~a0
, x4: ~a0, x5: ~a0
, x6: ~a0, x7: ~a0
, x8: ~a0, x9: ~a0): a0
//
fun
<a0:vt>
gs_fred2r0_n10
( x01: ~a0, x02: ~a0
, x03: ~a0, x04: ~a0
, x05: ~a0, x06: ~a0
, x07: ~a0, x08: ~a0
, x09: ~a0, x10: ~a0): a0
//
(* ****** ****** *)
fun
<a0:vt>
gs_fred2r1_n2
(x1: !a0, x2: !a0): a0
fun
<a0:vt>
gs_fred2r1_n3
( x1: !a0
, x2: !a0, x3: !a0): a0
fun
<a0:vt>
gs_fred2r1_n4
( x1: !a0, x2: !a0
, x3: !a0, x4: !a0): a0
fun
<a0:vt>
gs_fred2r1_n5
( x1: !a0
, x2: !a0, x3: !a0
, x4: !a0, x5: !a0): a0
fun
<a0:vt>
gs_fred2r1_n6
( x1: !a0, x2: !a0
, x3: !a0, x4: !a0
, x5: !a0, x6: !a0): a0
fun
<a0:vt>
gs_fred2r1_n7
( x1: !a0
, x2: !a0, x3: !a0
, x4: !a0, x5: !a0
, x6: !a0, x7: !a0): a0
fun
<a0:vt>
gs_fred2r1_n8
( x1: !a0, x2: !a0
, x3: !a0, x4: !a0
, x5: !a0, x6: !a0
, x7: !a0, x8: !a0): a0
fun
<a0:vt>
gs_fred2r1_n9
( x1: !a0
, x2: !a0, x3: !a0
, x4: !a0, x5: !a0
, x6: !a0, x7: !a0
, x8: !a0, x9: !a0): a0
//
fun
<a0:vt>
gs_fred2r1_n10
( x01: !a0, x02: !a0
, x03: !a0, x04: !a0
, x05: !a0, x06: !a0
, x07: !a0, x08: !a0
, x09: !a0, x10: !a0): a0
//
(* ****** ****** *)
//
(*
HX:
for overloading
print0 and println0
*)
//
(* ****** ****** *)
//
(*
fun<>
gs_print0_n0
((*void*)) : void
*)
fun
<a1:vt>
gs_print0_n1
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_print0_n2
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_print0_n3
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_print0_n4
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_print0_n5
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
gs_print0_n6
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
gs_print0_n7
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
gs_print0_n8
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
gs_print0_n9
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
gs_print0_n10
(x01: ~a01, x02: ~a02
,x03: ~a03, x04: ~a04
,x05: ~a05, x06: ~a06
,x07: ~a07, x08: ~a08
,x09: ~a09, x10: ~a10) : void
(* ****** ****** *)
//
#symload print0 with gs_print0_n1
#symload print0 with gs_print0_n2
#symload print0 with gs_print0_n3
#symload print0 with gs_print0_n4
#symload print0 with gs_print0_n5
#symload print0 with gs_print0_n6
#symload print0 with gs_print0_n7
#symload print0 with gs_print0_n8
#symload print0 with gs_print0_n9
#symload print0 with gs_print0_n10
//
(* ****** ****** *)
//
fun<>
gs_println0_n0
((*void*)) : void
fun
<a1:vt>
gs_println0_n1
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_println0_n2
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_println0_n3
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_println0_n4
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_println0_n5
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
gs_println0_n6
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
gs_println0_n7
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
gs_println0_n8
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
gs_println0_n9
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
gs_println0_n10
(x01: ~a01, x02: ~a02
,x03: ~a03, x04: ~a04
,x05: ~a05, x06: ~a06
,x07: ~a07, x08: ~a08
,x09: ~a09, x10: ~a10) : void
(* ****** ****** *)
//
#symload println0 with gs_println0_n0
#symload println0 with gs_println0_n1
#symload println0 with gs_println0_n2
#symload println0 with gs_println0_n3
#symload println0 with gs_println0_n4
#symload println0 with gs_println0_n5
#symload println0 with gs_println0_n6
#symload println0 with gs_println0_n7
#symload println0 with gs_println0_n8
#symload println0 with gs_println0_n9
#symload println0 with gs_println0_n10
//
(* ****** ****** *)
//
(*
HX:
for overloading
print1 and println1
*)
//
(* ****** ****** *)
//
(*
fun<>
gs_print1_n0
((*void*)) : void
*)
fun
<a1:vt>
gs_print1_n1
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_print1_n2
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_print1_n3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_print1_n4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_print1_n5
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
gs_print1_n6
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
gs_print1_n7
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
gs_print1_n8
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
gs_print1_n9
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
gs_print1_n10
(x01: !a01, x02: !a02
,x03: !a03, x04: !a04
,x05: !a05, x06: !a06
,x07: !a07, x08: !a08
,x09: !a09, x10: !a10) : void
(* ****** ****** *)
//
#symload print1 with gs_print1_n1
#symload print1 with gs_print1_n2
#symload print1 with gs_print1_n3
#symload print1 with gs_print1_n4
#symload print1 with gs_print1_n5
#symload print1 with gs_print1_n6
#symload print1 with gs_print1_n7
#symload print1 with gs_print1_n8
#symload print1 with gs_print1_n9
#symload print1 with gs_print1_n10
//
(* ****** ****** *)
//
fun<>
gs_println1_n0
((*void*)) : void
fun
<a1:vt>
gs_println1_n1
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
gs_println1_n2
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_println1_n3
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_println1_n4
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_println1_n5
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
gs_println1_n6
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
gs_println1_n7
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
gs_println1_n8
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
gs_println1_n9
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
gs_println1_n10
(x01: !a01, x02: !a02
,x03: !a03, x04: !a04
,x05: !a05, x06: !a06
,x07: !a07, x08: !a08
,x09: !a09, x10: !a10) : void
(* ****** ****** *)
//
#symload println1 with gs_println1_n0
#symload println1 with gs_println1_n1
#symload println1 with gs_println1_n2
#symload println1 with gs_println1_n3
#symload println1 with gs_println1_n4
#symload println1 with gs_println1_n5
#symload println1 with gs_println1_n6
#symload println1 with gs_println1_n7
#symload println1 with gs_println1_n8
#symload println1 with gs_println1_n9
#symload println1 with gs_println1_n10
//
(* ****** ****** *)
(*
HX-2022-06-22:
printing for special sequences
*)
(* ****** ****** *)
//HX:optn(vt)-printing
(* ****** ****** *)
//
fun<>
optn_vt_print$beg
  ( (*void*) ): void
fun<>
optn_vt_print$end
  ( (*void*) ): void
//
fun
<a0:vt>
optn_vt_print1
(xs: optn_vt(a0)): void
fun
<a0:vt>
optn_vt_print1_begend
( xs: optn_vt(a0)
, xbeg: strn, xend: strn): void
//
(* ****** ****** *)
//HX:list(vt)-printing
(* ****** ****** *)
//
fun<>
list_vt_print$beg(): void
fun<>
list_vt_print$end(): void
fun<>
list_vt_print$sep(): void
//
fun
<a0:vt>
list_vt_print1(xs: list_vt(a0)): void
fun
<a0:vt>
list_vt_print1_begendsep
( xs: list_vt(a0)
, xbeg: strn, xend: strn, xsep: strn): void
//
(* ****** ****** *)
//HX:strm(vt)-printing
(* ****** ****** *)
//
fun<>
strm_vt_print$len(): sint
//
fun<>
strm_vt_print$beg(): void
fun<>
strm_vt_print$end(): void
fun<>
strm_vt_print$sep(): void
fun<>
strm_vt_print$rst(): void
//
fun
<a0:vt>
strm_vt_print0
  (xs: ~strm_vt(a0)): void
//
fun
<a0:vt>
strm_vt_print0_all
  (xs: ~strm_vt(a0)): void
fun
<a0:vt>
strm_vt_print0_len
(xs: ~strm_vt(a0), len: nint): void
//
fun
<a0:vt>
strm_vt_print0_begendseprst
( xs: strm_vt(a0)
, xbeg: strn, xend: strn, xsep: strn, xrst: strn): void
//
(* ****** ****** *)
//HX:strx(vt)-printing
(* ****** ****** *)
//
fun<>
strx_vt_print$len(): sint
//
fun<>
strx_vt_print$beg(): void
fun<>
strx_vt_print$end(): void
fun<>
strx_vt_print$sep(): void
fun<>
strx_vt_print$rst(): void
//
fun
<a0:vt>
strx_vt_print0
  (xs: ~strx_vt(a0)): void
//
fun
<a0:vt>
strx_vt_print0_len
  (xs: ~strx_vt(a0), ln: nint): void
//
fun
<a0:vt>
strx_vt_print0_begendseprst
( xs: ~strx_vt(a0)
, xbeg: strn, xend: strn, xsep: strn, xrst: strn): void
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 15:08:37 EDT 2022
*)
//
fun<>
strn_vt_append0_n2
( ~strn_vt
, ~strn_vt ): strn_vt
fun<>
strn_vt_append0_n3
( ~strn_vt
, ~strn_vt, ~strn_vt): strn_vt
fun<>
strn_vt_append0_n4
( ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt): strn_vt
fun<>
strn_vt_append0_n5
( ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt): strn_vt
fun<>
strn_vt_append0_n6
( ~strn_vt, ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt): strn_vt
fun<>
strn_vt_append0_n7
( ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt): strn_vt
fun<>
strn_vt_append0_n8
( ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt): strn_vt
fun<>
strn_vt_append0_n9
( ~strn_vt, ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt): strn_vt
fun<>
strn_vt_append0_n10
( ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt
, ~strn_vt, ~strn_vt, ~strn_vt): strn_vt
//
(* ****** ****** *)
//
#symload append0 with strn_vt_append0_n2
#symload append0 with strn_vt_append0_n3
#symload append0 with strn_vt_append0_n4
#symload append0 with strn_vt_append0_n5
#symload append0 with strn_vt_append0_n6
#symload append0 with strn_vt_append0_n7
#symload append0 with strn_vt_append0_n8
#symload append0 with strn_vt_append0_n9
#symload append0 with strn_vt_append0_n10
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 18:29:59 EDT 2022
*)
//
fun<>
strn_vt_append1_n2
( !strn_vt
, !strn_vt ): strn_vt
fun<>
strn_vt_append1_n3
( !strn_vt
, !strn_vt, !strn_vt): strn_vt
fun<>
strn_vt_append1_n4
( !strn_vt, !strn_vt
, !strn_vt, !strn_vt): strn_vt
fun<>
strn_vt_append1_n5
( !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt): strn_vt
fun<>
strn_vt_append1_n6
( !strn_vt, !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt): strn_vt
fun<>
strn_vt_append1_n7
( !strn_vt
, !strn_vt, !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt): strn_vt
fun<>
strn_vt_append1_n8
( !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt): strn_vt
fun<>
strn_vt_append1_n9
( !strn_vt, !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt): strn_vt
fun<>
strn_vt_append1_n10
( !strn_vt
, !strn_vt, !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt
, !strn_vt, !strn_vt, !strn_vt): strn_vt
//
(* ****** ****** *)
//
#symload append1 with strn_vt_append1_n2
#symload append1 with strn_vt_append1_n3
#symload append1 with strn_vt_append1_n4
#symload append1 with strn_vt_append1_n5
#symload append1 with strn_vt_append1_n6
#symload append1 with strn_vt_append1_n7
#symload append1 with strn_vt_append1_n8
#symload append1 with strn_vt_append1_n9
#symload append1 with strn_vt_append1_n10
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 19:09:52 EDT 2022
*)
//
fun
<a0:vt>
list_vt_append0_n2
( ~list_vt(a0)
, ~list_vt(a0) ): list_vt(a0)
fun
<a0:vt>
list_vt_append0_n3
( ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_append0_n4
( ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_append0_n5
( ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_append0_n6
( ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_append0_n7
( ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_append0_n8
( ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_append0_n9
( ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_append0_n10
( ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)
, ~list_vt(a0), ~list_vt(a0)): list_vt(a0)
//
(* ****** ****** *)
//
#symload append0 with list_vt_append0_n2
#symload append0 with list_vt_append0_n3
#symload append0 with list_vt_append0_n4
#symload append0 with list_vt_append0_n5
#symload append0 with list_vt_append0_n6
#symload append0 with list_vt_append0_n7
#symload append0 with list_vt_append0_n8
#symload append0 with list_vt_append0_n9
#symload append0 with list_vt_append0_n10
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 20:25:07 EDT 2022
*)
//
fun
<a0:vt>
list_vt_append1_n2
( !list_vt(a0)
, !list_vt(a0) ): list_vt(a0)
fun
<a0:vt>
list_vt_append1_n3
( !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_append1_n4
( !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_append1_n5
( !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_append1_n6
( !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_append1_n7
( !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_append1_n8
( !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_append1_n9
( !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
fun
<a0:vt>
list_vt_append1_n10
( !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)
, !list_vt(a0), !list_vt(a0)): list_vt(a0)
//
(* ****** ****** *)
//
#symload append1 with list_vt_append1_n2
#symload append1 with list_vt_append1_n3
#symload append1 with list_vt_append1_n4
#symload append1 with list_vt_append1_n5
#symload append1 with list_vt_append1_n6
#symload append1 with list_vt_append1_n7
#symload append1 with list_vt_append1_n8
#symload append1 with list_vt_append1_n9
#symload append1 with list_vt_append1_n10
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_synoug0_vt.sats] *)
