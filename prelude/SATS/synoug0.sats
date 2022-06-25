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
#symload max with max_a07
#symload max with max_a08
#symload max with max_a09
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
#symload min with min_a07
#symload min with min_a08
#symload min with min_a09
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
#symload free with free_a04
#symload free with free_a05
#symload free with free_a06
#symload free with free_a07
#symload free with free_a08
#symload free with free_a09
//
(* ****** ****** *)
//
fun
<a0:t0>
optn_a00
(      ): optn(a0,ff)
fun
<a0:t0>
optn_a01
(x1: a0): optn(a0,tt)
//
(* ****** ****** *)
//
#symload optn with optn_a00
#symload optn with optn_a01
//
(* ****** ****** *)
//
fun
<a0:t0>
list_a00
(      ): list(a0, 0)
fun
<a0:t0>
list_a01
(x1: a0): list(a0, 1)
fun
<a0:t0>
list_a02
(x1: a0
,x2: a0): list(a0, 2)
fun
<a0:t0>
list_a03
(x1: a0
,x2: a0
,x3: a0): list(a0, 3)
fun
<a0:t0>
list_a04
(x1: a0
,x2: a0
,x3: a0
,x4: a0): list(a0, 4)
fun
<a0:t0>
list_a05
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0): list(a0, 5)
fun
<a0:t0>
list_a06
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0
,x6: a0): list(a0, 6)
fun
<a0:t0>
list_a07
(x1: a0
,x2: a0
,x3: a0
,x4: a0
,x5: a0
,x6: a0
,x7: a0): list(a0, 7)
fun
<a0:t0>
list_a08
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
list_a09
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
list_a10
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
#symload list with list_a00
#symload list with list_a01
#symload list with list_a02
#symload list with list_a03
#symload list with list_a04
#symload list with list_a05
#symload list with list_a06
#symload list with list_a07
#symload list with list_a08
#symload list with list_a09
#symload list with list_a10
//
(* ****** ****** *)
//HX: implementing fproc
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
fproc_a10
( x01: a01, x02: a02
, x03: a03, x04: a04
, x05: a05, x06: a06
, x07: a07, x08: a08
, x09: a09, x10: a10 ) : void
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
#symload fproc with fproc_a10
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
fun
<a0:vt>
a1ref_print1
{n0:i0}
(A0: a1ref(a0,n0), n0: sint(n0)): void
fun
<a0:vt>
a1ref_print1_begendsep
{n0:i0}
( A0: a1ref(a0,n0), n0: sint(n0)
, xbeg: strn, xend: strn, xsep: strn): void
//
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_synoug0.sats] *)
