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
<a0:t0>
gs_max_n1
 (x1: a0): a0
fun
<a0:t0>
gs_max_n2
(x1: a0, x2: a0): a0
fun
<a0:t0>
gs_max_n3
( x1: a0
, x2: a0, x3: a0): a0
fun
<a0:t0>
gs_max_n4
( x1: a0, x2: a0
, x3: a0, x4: a0): a0
fun
<a0:t0>
gs_max_n5
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0): a0
fun
<a0:t0>
gs_max_n6
( x1: a0, x2: a0
, x3: a0, x4: a0
, x5: a0, x6: a0): a0
fun
<a0:t0>
gs_max_n7
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0
, x6: a0, x7: a0): a0
fun
<a0:t0>
gs_max_n8
( x1: a0, x2: a0
, x3: a0, x4: a0
, x5: a0, x6: a0
, x7: a0, x8: a0): a0
fun
<a0:t0>
gs_max_n9
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0
, x6: a0, x7: a0
, x8: a0, x9: a0): a0
//
fun
<a0:t0>
gs_max_n10
( x01: a0, x02: a0
, x03: a0, x04: a0
, x05: a0, x06: a0
, x07: a0, x08: a0
, x09: a0, x10: a0): a0
//
(* ****** ****** *)
//
#symload maxs with gs_max_n2
#symload maxs with gs_max_n3
#symload maxs with gs_max_n4
#symload maxs with gs_max_n5
#symload maxs with gs_max_n6
#symload maxs with gs_max_n7
#symload maxs with gs_max_n8
#symload maxs with gs_max_n9
#symload maxs with gs_max_n10
//
(* ****** ****** *)
//
fun
<a0:t0>
gs_min_n1
 (x1: a0): a0
fun
<a0:t0>
gs_min_n2
(x1: a0, x2: a0): a0
fun
<a0:t0>
gs_min_n3
( x1: a0
, x2: a0, x3: a0): a0
fun
<a0:t0>
gs_min_n4
( x1: a0, x2: a0
, x3: a0, x4: a0): a0
fun
<a0:t0>
gs_min_n5
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0): a0
fun
<a0:t0>
gs_min_n6
( x1: a0, x2: a0
, x3: a0, x4: a0
, x5: a0, x6: a0): a0
fun
<a0:t0>
gs_min_n7
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0
, x6: a0, x7: a0): a0
fun
<a0:t0>
gs_min_n8
( x1: a0, x2: a0
, x3: a0, x4: a0
, x5: a0, x6: a0
, x7: a0, x8: a0): a0
fun
<a0:t0>
gs_min_n9
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0
, x6: a0, x7: a0
, x8: a0, x9: a0): a0
//
fun
<a0:t0>
gs_min_n10
( x01: a0, x02: a0
, x03: a0, x04: a0
, x05: a0, x06: a0
, x07: a0, x08: a0
, x09: a0, x10: a0): a0
//
(* ****** ****** *)
//
#symload mins with gs_min_n2
#symload mins with gs_min_n3
#symload mins with gs_min_n4
#symload mins with gs_min_n5
#symload mins with gs_min_n6
#symload mins with gs_min_n7
#symload mins with gs_min_n8
#symload mins with gs_min_n9
#symload mins with gs_min_n10
//
(* ****** ****** *)
//
fun
<a1:vt>
gs_free_n1
(x1: ~a1): void
fun
<a1:vt>
<a2:vt>
gs_free_n2
(x1: ~a1, x2: ~a2): void
fun
<a1:vt>
<a2:vt>
<a3:vt>
gs_free_n3
( x1: ~a1
, x2: ~a2, x3: ~a3): void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
gs_free_n4
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ): void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
gs_free_n5
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5 ): void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
gs_free_n6
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6 ): void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
gs_free_n7
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7 ): void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
<a6:vt>
<a7:vt>
<a8:vt>
gs_free_n8
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4
, x5: ~a5, x6: ~a6
, x7: ~a7, x8: ~a8 ): void
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
gs_free_n9
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ): void
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
gs_free_n10
(x01: ~a01,x02: ~a02
,x03: ~a03,x04: ~a04
,x05: ~a05,x06: ~a06
,x07: ~a07,x08: ~a08
,x09: ~a09,x10: ~a10): void
//
(* ****** ****** *)
//
#symload free with gs_free_n1
(*
#symload frees with gs_free_n1
*)
#symload frees with gs_free_n2
#symload frees with gs_free_n3
#symload frees with gs_free_n4
#symload frees with gs_free_n5
#symload frees with gs_free_n6
#symload frees with gs_free_n7
#symload frees with gs_free_n8
#symload frees with gs_free_n9
#symload frees with gs_free_n10
//
(* ****** ****** *)
//
fun
<a0:t0>
optn_n0
(      ): optn(a0,ff)
fun
<a0:t0>
optn_n1
(x1: a0): optn(a0,tt)
//
(* ****** ****** *)
//
#symload optn with optn_n0
#symload optn with optn_n1
//
(* ****** ****** *)
//
fun
<a0:t0>
list_n0
(      ): list(a0, 0)
fun
<a0:t0>
list_n1
(x1: a0): list(a0, 1)
fun
<a0:t0>
list_n2
(x1: a0
,x2: a0): list(a0, 2)
fun
<a0:t0>
list_n3
(x1: a0
,x2: a0
,x3: a0): list(a0, 3)
fun
<a0:t0>
list_n4
(x1: a0
,x2: a0
,x3: a0
,x4: a0): list(a0, 4)
fun
<a0:t0>
list_n5
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0): list(a0, 5)
fun
<a0:t0>
list_n6
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0
,x6: a0): list(a0, 6)
fun
<a0:t0>
list_n7
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0
,x6: a0
,x7: a0): list(a0, 7)
fun
<a0:t0>
list_n8
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0
,x6: a0
,x7: a0
,x8: a0): list(a0, 8)
fun
<a0:t0>
list_n9
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0
,x6: a0
,x7: a0
,x8: a0
,x9: a0): list(a0, 9)
fun
<a0:t0>
list_n10
(x01: a0
,x02: a0
,x03: a0
,x04: a0
,x05: a0
,x06: a0
,x07: a0
,x08: a0
,x09: a0
,x10: a0): list(a0, 10)
//
(* ****** ****** *)
//
#symload list with list_n0
#symload list with list_n1
#symload list with list_n2
#symload list with list_n3
#symload list with list_n4
#symload list with list_n5
#symload list with list_n6
#symload list with list_n7
#symload list with list_n8
#symload list with list_n9
#symload list with list_n10
//
(* ****** ****** *)
//
//HX:
//implementing fproc
//
(* ****** ****** *)
//
fun
<a:t0>
g_fproc(x: a): void
//
(* ****** ****** *)
//
(*
fun<>
gs_fproc_n0
((*void*)) : void
*)
//
fun
<a1:t0>
gs_fproc_n1
( x1: a1 ) : void
fun
<a1:t0>
<a2:t0>
gs_fproc_n2
( x1: a1, x2: a2 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
gs_fproc_n3
( x1: a1
, x2: a2, x3: a3 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
gs_fproc_n4
( x1: a1, x2: a2
, x3: a3, x4: a4 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
gs_fproc_n5
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
gs_fproc_n6
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
gs_fproc_n7
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
gs_fproc_n8
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
gs_fproc_n9
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
gs_fproc_n10
( x01: a01, x02: a02
, x03: a03, x04: a04
, x05: a05, x06: a06
, x07: a07, x08: a08
, x09: a09, x10: a10 ) : void
(* ****** ****** *)
//
#symload fprocs with gs_fproc_n1
#symload fprocs with gs_fproc_n2
#symload fprocs with gs_fproc_n3
#symload fprocs with gs_fproc_n4
#symload fprocs with gs_fproc_n5
#symload fprocs with gs_fproc_n6
#symload fprocs with gs_fproc_n7
#symload fprocs with gs_fproc_n8
#symload fprocs with gs_fproc_n9
#symload fprocs with gs_fproc_n10
//
(* ****** ****** *)
//
//HX:
//implementing fred2
//
(* ****** ****** *)
//
fun
<a0:t0>
g_fred2(a0, a0): a0
//
(* ****** ****** *)
fun
<a0:t0>
gs_fred2l_n2
(x1: a0, x2: a0): a0
fun
<a0:t0>
gs_fred2l_n3
( x1: a0
, x2: a0, x3: a0): a0
fun
<a0:t0>
gs_fred2l_n4
( x1: a0, x2: a0
, x3: a0, x4: a0): a0
fun
<a0:t0>
gs_fred2l_n5
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0): a0
fun
<a0:t0>
gs_fred2l_n6
( x1: a0, x2: a0
, x3: a0, x4: a0
, x5: a0, x6: a0): a0
fun
<a0:t0>
gs_fred2l_n7
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0
, x6: a0, x7: a0): a0
fun
<a0:t0>
gs_fred2l_n8
( x1: a0, x2: a0
, x3: a0, x4: a0
, x5: a0, x6: a0
, x7: a0, x8: a0): a0
fun
<a0:t0>
gs_fred2l_n9
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0
, x6: a0, x7: a0
, x8: a0, x9: a0): a0
//
fun
<a0:t0>
gs_fred2l_n10
( x01: a0, x02: a0
, x03: a0, x04: a0
, x05: a0, x06: a0
, x07: a0, x08: a0
, x09: a0, x10: a0): a0
//
(* ****** ****** *)
fun
<a0:t0>
gs_fred2r_n2
(x1: a0, x2: a0): a0
fun
<a0:t0>
gs_fred2r_n3
( x1: a0
, x2: a0, x3: a0): a0
fun
<a0:t0>
gs_fred2r_n4
( x1: a0, x2: a0
, x3: a0, x4: a0): a0
fun
<a0:t0>
gs_fred2r_n5
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0): a0
fun
<a0:t0>
gs_fred2r_n6
( x1: a0, x2: a0
, x3: a0, x4: a0
, x5: a0, x6: a0): a0
fun
<a0:t0>
gs_fred2r_n7
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0
, x6: a0, x7: a0): a0
fun
<a0:t0>
gs_fred2r_n8
( x1: a0, x2: a0
, x3: a0, x4: a0
, x5: a0, x6: a0
, x7: a0, x8: a0): a0
fun
<a0:t0>
gs_fred2r_n9
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0
, x6: a0, x7: a0
, x8: a0, x9: a0): a0
//
fun
<a0:t0>
gs_fred2r_n10
( x01: a0, x02: a0
, x03: a0, x04: a0
, x05: a0, x06: a0
, x07: a0, x08: a0
, x09: a0, x10: a0): a0
//
(* ****** ****** *)
//
(*
HX:
for overloading
prints and printsln
*)
//
(* ****** ****** *)
//
fun<>
gs_print_n0
((*void*)) : void
fun
<a1:t0>
gs_print_n1
( x1: a1 ) : void
fun
<a1:t0>
<a2:t0>
gs_print_n2
( x1: a1, x2: a2 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
gs_print_n3
( x1: a1
, x2: a2, x3: a3 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
gs_print_n4
( x1: a1, x2: a2
, x3: a3, x4: a4 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
gs_print_n5
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
gs_print_n6
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
gs_print_n7
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
gs_print_n8
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
gs_print_n9
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
gs_print_n10
( x01: a01, x02: a02
, x03: a03, x04: a04
, x05: a05, x06: a06
, x07: a07, x08: a08
, x09: a09, x10: a10) : void
//
(* ****** ****** *)
//
#symload print with gs_print_n1
#symload prints with gs_print_n0
(*
#symload prints with gs_print_n1
*)
#symload prints with gs_print_n2
#symload prints with gs_print_n3
#symload prints with gs_print_n4
#symload prints with gs_print_n5
#symload prints with gs_print_n6
#symload prints with gs_print_n7
#symload prints with gs_print_n8
#symload prints with gs_print_n9
#symload prints with gs_print_n10
//
(* ****** ****** *)
//
fun<>
gs_println_n0
((*void*)) : void
fun
<a1:t0>
gs_println_n1
( x1: a1 ) : void
fun
<a1:t0>
<a2:t0>
gs_println_n2
( x1: a1, x2: a2 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
gs_println_n3
( x1: a1
, x2: a2, x3: a3 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
gs_println_n4
( x1: a1, x2: a2
, x3: a3, x4: a4 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
gs_println_n5
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
gs_println_n6
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
gs_println_n7
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
gs_println_n8
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
gs_println_n9
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
gs_println_n10
( x01: a01, x02: a02
, x03: a03, x04: a04
, x05: a05, x06: a06
, x07: a07, x08: a08
, x09: a09, x10: a10) : void
//
(* ****** ****** *)
//
#symload println with gs_println_n1
#symload printsln with gs_println_n0
(*
#symload printsln with gs_println_n1
*)
#symload printsln with gs_println_n2
#symload printsln with gs_println_n3
#symload printsln with gs_println_n4
#symload printsln with gs_println_n5
#symload printsln with gs_println_n6
#symload printsln with gs_println_n7
#symload printsln with gs_println_n8
#symload printsln with gs_println_n9
#symload printsln with gs_println_n10
//
(* ****** ****** *)
(*
HX-2022-06-22:
printing for special sequences
*)
(* ****** ****** *)
//HX:optn-printing
(* ****** ****** *)
//
fun<>
optn_print$beg(): void
fun<>
optn_print$end(): void
//
fun
<a0:t0>
optn_print
( xs: optn(a0) ): void
fun
<a0:t0>
optn_print_begend
( xs: optn(a0)
, xbeg: strn, xend: strn): void
//
(* ****** ****** *)
//HX:list-printing
(* ****** ****** *)
//
fun<>
list_print$beg(): void
fun<>
list_print$end(): void
fun<>
list_print$sep(): void
//
fun
<a0:t0>
list_print(xs: list(a0)): void
fun
<a0:t0>
list_print_begendsep
( xs: list(a0)
, xbeg: strn, xend: strn, xsep: strn): void
//
(* ****** ****** *)
//HX:strm-printing
(* ****** ****** *)
//
fun<>
strm_print$len(): sint
//
fun<>
strm_print$beg(): void
fun<>
strm_print$end(): void
fun<>
strm_print$sep(): void
fun<>
strm_print$rst(): void
//
fun
<a0:t0>
strm_print
  ( xs: strm(a0) ): void
//
fun
<a0:t0>
strm_print_all
  ( xs: strm(a0) ): void
fun
<a0:t0>
strm_print_len
  (xs: strm(a0), ln: nint): void
//
fun
<a0:t0>
strm_print_begendseprst
( xs: strm(a0)
, xbeg: strn, xend: strn, xsep: strn, xrst: strn): void
//
(* ****** ****** *)
//HX:strx-printing
(* ****** ****** *)
//
fun<>
strx_print$len(): nint
//
fun<>
strx_print$beg(): void
fun<>
strx_print$end(): void
fun<>
strx_print$sep(): void
fun<>
strx_print$rst(): void
//
fun
<a0:t0>
strx_print(xs: strx(a0)): void
//
fun
<a0:t0>
strx_print_len
  (xs: strx(a0), ln: nint): void
//
fun
<a0:t0>
strx_print_begendseprst
( xs: strx(a0)
, xbeg: strn, xend: strn, xsep: strn, xrst: strn): void
//
(* ****** ****** *)
//HX:a0ref-printing
(* ****** ****** *)
//
fun<>
a0ref_print$beg(): void
fun<>
a0ref_print$end(): void
//
fun
<a:vt>
a0ref_print1
(A0: a0ref(a)): void
fun
<a:vt>
a0ref_print1_begend
( A0: a0ref(a)
, xbeg: strn, xend: strn): void
//
(* ****** ****** *)
//HX:a1ref-printing
(* ****** ****** *)
//
fun<>
a1ref_print$beg(): void
fun<>
a1ref_print$end(): void
fun<>
a1ref_print$sep(): void
//
fun<>
a1rsz_print$beg(): void
fun<>
a1rsz_print$end(): void
fun<>
a1rsz_print$sep(): void
//
fun
<a0:vt>
a1rsz_print1
{n0:i0}
(A0: a1rsz(a0,n0)): void
fun
<a0:vt>
a1ref_print1
{n0:i0}
(A0: a1ref(a0,n0), n0: sint(n0)): void
//
fun
<a0:vt>
a1rsz_print1_begendsep
{n0:i0}
( A0: a1rsz(a0,n0)
, xbeg: strn, xend: strn, xsep: strn): void
fun
<a0:vt>
a1ref_print1_begendsep
{n0:i0}
( A0: a1ref(a0,n0), n0: sint(n0)
, xbeg: strn, xend: strn, xsep: strn): void
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 13:22:11 EDT 2022
*)
//
(*
fun<>
strn_append_n2
(strn, strn): strn
fun<>
strn_append_n3
(strn, strn, strn): strn
fun<>
strn_append_n4
( strn
, strn, strn, strn): strn
fun<>
strn_append_n5
( strn, strn
, strn, strn, strn): strn
fun<>
strn_append_n6
( strn, strn, strn
, strn, strn, strn): strn
fun<>
strn_append_n7
( strn, strn, strn
, strn, strn, strn, strn): strn
fun<>
strn_append_n8
( strn, strn, strn, strn
, strn, strn, strn, strn): strn
fun<>
strn_append_n9
( strn
, strn, strn, strn, strn
, strn, strn, strn, strn): strn
fun<>
strn_append_n10
( strn, strn
, strn, strn, strn, strn
, strn, strn, strn, strn): strn
//
#symload appends with strn_append_n2
#symload appends with strn_append_n3
#symload appends with strn_append_n4
#symload appends with strn_append_n5
#symload appends with strn_append_n6
#symload appends with strn_append_n7
#symload appends with strn_append_n8
#symload appends with strn_append_n9
#symload appends with strn_append_n10
//
*)
//
(* ****** ****** *)
//
(*
HX-2022-07-05:
Tue Jul  5 13:47:16 EDT 2022
*)
//
(*
fun
<a0:t0>
list_append_n2
(list(a0), list(a0)): list(a0)
fun
<a0:t0>
list_append_n3
( list(a0)
, list(a0), list(a0)): list(a0)
fun
<a0:t0>
list_append_n4
( list(a0), list(a0)
, list(a0), list(a0)): list(a0)
fun
<a0:t0>
list_append_n5
( list(a0)
, list(a0), list(a0)
, list(a0), list(a0)): list(a0)
fun
<a0:t0>
list_append_n6
( list(a0), list(a0)
, list(a0), list(a0)
, list(a0), list(a0)): list(a0)
fun
<a0:t0>
list_append_n7
( list(a0)
, list(a0), list(a0)
, list(a0), list(a0)
, list(a0), list(a0)): list(a0)
fun
<a0:t0>
list_append_n8
( list(a0), list(a0)
, list(a0), list(a0)
, list(a0), list(a0)
, list(a0), list(a0)): list(a0)
fun
<a0:t0>
list_append_n9
( list(a0)
, list(a0), list(a0)
, list(a0), list(a0)
, list(a0), list(a0)
, list(a0), list(a0)): list(a0)
fun
<a0:t0>
list_append_n10
( list(a0), list(a0)
, list(a0), list(a0)
, list(a0), list(a0)
, list(a0), list(a0)
, list(a0), list(a0)): list(a0)
//
#symload appends with list_append_n2
#symload appends with list_append_n3
#symload appends with list_append_n4
#symload appends with list_append_n5
#symload appends with list_append_n6
#symload appends with list_append_n7
#symload appends with list_append_n8
#symload appends with list_append_n9
#symload appends with list_append_n10
//
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_srcgen1_prelude_SATS_synoug0.sats] *)
