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
max_a02
(x1: a0, x2: a0): a0
fun
<a0:t0>
max_a03
( x1: a0
, x2: a0, x3: a0): a0
fun
<a0:t0>
max_a04
( x1: a0, x2: a0
, x3: a0, x4: a0): a0
fun
<a0:t0>
max_a05
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0): a0
fun
<a0:t0>
max_a06
( x1: a0, x2: a0
, x3: a0, x4: a0
, x5: a0, x6: a0): a0
fun
<a0:t0>
max_a07
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0
, x6: a0, x7: a0): a0
fun
<a0:t0>
max_a08
( x1: a0, x2: a0
, x3: a0, x4: a0
, x5: a0, x6: a0
, x7: a0, x8: a0): a0
fun
<a0:t0>
max_a09
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0
, x6: a0, x7: a0
, x8: a0, x9: a0): a0
//
(* ****** ****** *)
//
#symload max with max_a02
#symload max with max_a03
#symload max with max_a04
#symload max with max_a05
#symload max with max_a06
//
(* ****** ****** *)
//
fun
<a0:t0>
min_a02
(x1: a0, x2: a0): a0
fun
<a0:t0>
min_a03
( x1: a0
, x2: a0, x3: a0): a0
fun
<a0:t0>
min_a04
( x1: a0, x2: a0
, x3: a0, x4: a0): a0
fun
<a0:t0>
min_a05
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0): a0
fun
<a0:t0>
min_a06
( x1: a0, x2: a0
, x3: a0, x4: a0
, x5: a0, x6: a0): a0
fun
<a0:t0>
min_a07
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0
, x6: a0, x7: a0): a0
fun
<a0:t0>
min_a08
( x1: a0, x2: a0
, x3: a0, x4: a0
, x5: a0, x6: a0
, x7: a0, x8: a0): a0
fun
<a0:t0>
min_a09
( x1: a0
, x2: a0, x3: a0
, x4: a0, x5: a0
, x6: a0, x7: a0
, x8: a0, x9: a0): a0
//
(* ****** ****** *)
//
#symload min with min_a02
#symload min with min_a03
#symload min with min_a04
#symload min with min_a05
#symload min with min_a06
//
(* ****** ****** *)
//
fun
<a1:vt>
free_a01
(x1: ~a1): void
fun
<a1:vt>
<a2:vt>
free_a02
(x1: ~a1, x2: ~a2): void
fun
<a1:vt>
<a2:vt>
<a3:vt>
free_a03
( x1: ~a1
, x2: ~a2, x3: ~a3): void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
free_a04
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
free_a05
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
free_a06
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
free_a07
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
free_a08
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
free_a09
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ) : void
//
(* ****** ****** *)
//
#symload free with free_a01
#symload free with free_a02
#symload free with free_a03
//
(* ****** ****** *)
//
fun
<a:t0>
g_fproc(x: a): void
//
fun
<a:vt>
gl_fproc0(x: ~a): void
fun
<a:vt>
gl_fproc1(x: !a): void
//
(* ****** ****** *)
//
(*
fun<>
fproc_a00
((*void*)) : void
*)
fun
<a1:t0>
fproc_a01
( x1: a1 ) : void
fun
<a1:t0>
<a2:t0>
fproc_a02
( x1: a1, x2: a2 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
fproc_a03
( x1: a1
, x2: a2, x3: a3 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
fproc_a04
( x1: a1, x2: a2
, x3: a3, x4: a4 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
fproc_a05
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
fproc_a06
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
fproc_a07
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
fproc_a08
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
fproc_a09
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5
, x6: a6, x7: a7
, x8: a8, x9: a9 ) : void
(* ****** ****** *)
//
#symload fproc with fproc_a01
#symload fproc with fproc_a02
#symload fproc with fproc_a03
#symload fproc with fproc_a04
#symload fproc with fproc_a05
#symload fproc with fproc_a06
#symload fproc with fproc_a07
#symload fproc with fproc_a08
#symload fproc with fproc_a09
//
(* ****** ****** *)
//
(*
fun<>
fproc0_a00
((*void*)) : void
*)
fun
<a1:vt>
fproc0_a01
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
fproc0_a02
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
fproc0_a03
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
fproc0_a04
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
fproc0_a05
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
fproc0_a06
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
fproc0_a07
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
fproc0_a08
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
fproc0_a09
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ) : void
(* ****** ****** *)
//
#symload fproc0 with fproc0_a01
#symload fproc0 with fproc0_a02
#symload fproc0 with fproc0_a03
#symload fproc0 with fproc0_a04
#symload fproc0 with fproc0_a05
#symload fproc0 with fproc0_a06
#symload fproc0 with fproc0_a07
#symload fproc0 with fproc0_a08
#symload fproc0 with fproc0_a09
//
(* ****** ****** *)
//
(*
fun<>
fproc1_a00
((*void*)) : void
*)
fun
<a1:vt>
fproc1_a01
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
fproc1_a02
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
fproc1_a03
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
fproc1_a04
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
fproc1_a05
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
fproc1_a06
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
fproc1_a07
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
fproc1_a08
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
fproc1_a09
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
//
#symload fproc1 with fproc1_a01
#symload fproc1 with fproc1_a02
#symload fproc1 with fproc1_a03
#symload fproc1 with fproc1_a04
#symload fproc1 with fproc1_a05
#symload fproc1 with fproc1_a06
#symload fproc1 with fproc1_a07
#symload fproc1 with fproc1_a08
#symload fproc1 with fproc1_a09
//
(* ****** ****** *)
//
(*
HX:
for overloading
print and println
*)
//
(* ****** ****** *)
//
(*
fun<>
print_a00
((*void*)) : void
*)
fun
<a1:t0>
print_a01
( x1: a1 ) : void
fun
<a1:t0>
<a2:t0>
print_a02
( x1: a1, x2: a2 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
print_a03
( x1: a1
, x2: a2, x3: a3 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
print_a04
( x1: a1, x2: a2
, x3: a3, x4: a4 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
print_a05
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
print_a06
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
print_a07
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
print_a08
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
print_a09
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5
, x6: a6, x7: a7
, x8: a8, x9: a9 ) : void
(* ****** ****** *)
//
#symload print with print_a01
#symload print with print_a02
#symload print with print_a03
#symload print with print_a04
#symload print with print_a05
#symload print with print_a06
#symload print with print_a07
#symload print with print_a08
#symload print with print_a09
//
(* ****** ****** *)
//
fun<>
println_a00
((*void*)) : void
fun
<a1:t0>
println_a01
( x1: a1 ) : void
fun
<a1:t0>
<a2:t0>
println_a02
( x1: a1, x2: a2 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
println_a03
( x1: a1
, x2: a2, x3: a3 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
println_a04
( x1: a1, x2: a2
, x3: a3, x4: a4 ) : void
fun
<a1:t0>
<a2:t0>
<a3:t0>
<a4:t0>
<a5:t0>
println_a05
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
println_a06
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
println_a07
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
println_a08
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
println_a09
( x1: a1
, x2: a2, x3: a3
, x4: a4, x5: a5
, x6: a6, x7: a7
, x8: a8, x9: a9 ) : void
(* ****** ****** *)
//
#symload println with println_a00
#symload println with println_a01
#symload println with println_a02
#symload println with println_a03
#symload println with println_a04
#symload println with println_a05
#symload println with println_a06
#symload println with println_a07
#symload println with println_a08
#symload println with println_a09
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
print0_a00
((*void*)) : void
*)
fun
<a1:vt>
print0_a01
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
print0_a02
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
print0_a03
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
print0_a04
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
print0_a05
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
print0_a06
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
print0_a07
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
print0_a08
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
print0_a09
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ) : void
(* ****** ****** *)
//
#symload print0 with print0_a01
#symload print0 with print0_a02
#symload print0 with print0_a03
#symload print0 with print0_a04
#symload print0 with print0_a05
#symload print0 with print0_a06
#symload print0 with print0_a07
#symload print0 with print0_a08
#symload print0 with print0_a09
//
(* ****** ****** *)
//
fun<>
println0_a00
((*void*)) : void
fun
<a1:vt>
println0_a01
( x1: ~a1 ) : void
fun
<a1:vt>
<a2:vt>
println0_a02
( x1: ~a1, x2: ~a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
println0_a03
( x1: ~a1
, x2: ~a2, x3: ~a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
println0_a04
( x1: ~a1, x2: ~a2
, x3: ~a3, x4: ~a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
println0_a05
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
println0_a06
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
println0_a07
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
println0_a08
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
println0_a09
( x1: ~a1
, x2: ~a2, x3: ~a3
, x4: ~a4, x5: ~a5
, x6: ~a6, x7: ~a7
, x8: ~a8, x9: ~a9 ) : void
(* ****** ****** *)
//
#symload println0 with println0_a00
#symload println0 with println0_a01
#symload println0 with println0_a02
#symload println0 with println0_a03
#symload println0 with println0_a04
#symload println0 with println0_a05
#symload println0 with println0_a06
#symload println0 with println0_a07
#symload println0 with println0_a08
#symload println0 with println0_a09
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
print1_a00
((*void*)) : void
*)
fun
<a1:vt>
print1_a01
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
print1_a02
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
print1_a03
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
print1_a04
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
print1_a05
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
print1_a06
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
print1_a07
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
print1_a08
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
print1_a09
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
//
#symload print1 with print1_a01
#symload print1 with print1_a02
#symload print1 with print1_a03
#symload print1 with print1_a04
#symload print1 with print1_a05
#symload print1 with print1_a06
#symload print1 with print1_a07
#symload print1 with print1_a08
#symload print1 with print1_a09
//
(* ****** ****** *)
//
fun<>
println1_a00
((*void*)) : void
fun
<a1:vt>
println1_a01
( x1: !a1 ) : void
fun
<a1:vt>
<a2:vt>
println1_a02
( x1: !a1, x2: !a2 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
println1_a03
( x1: !a1
, x2: !a2, x3: !a3 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
println1_a04
( x1: !a1, x2: !a2
, x3: !a3, x4: !a4 ) : void
fun
<a1:vt>
<a2:vt>
<a3:vt>
<a4:vt>
<a5:vt>
println1_a05
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
println1_a06
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
println1_a07
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
println1_a08
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
println1_a09
( x1: !a1
, x2: !a2, x3: !a3
, x4: !a4, x5: !a5
, x6: !a6, x7: !a7
, x8: !a8, x9: !a9 ) : void
(* ****** ****** *)
//
#symload println1 with println1_a00
#symload println1 with println1_a01
#symload println1 with println1_a02
#symload println1 with println1_a03
#symload println1 with println1_a04
#symload println1 with println1_a05
#symload println1 with println1_a06
#symload println1 with println1_a07
#symload println1 with println1_a08
#symload println1 with println1_a09
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_synoug0.sats] *)
