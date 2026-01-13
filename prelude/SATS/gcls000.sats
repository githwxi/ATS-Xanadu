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
//
(*
Author: Hongwei Xi
(*
Mon 29 Jul 2024 06:15:29 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
(*
HX-2026-01-12:
Mon Jan 12 11:55:56 PM EST 2026
This is 100% boilerplate stuff!
It should be automated eventually.
*)
(* ****** ****** *)
(* ****** ****** *)
#typedef ni = nint
#typedef si = sint
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX:
For functional lists
*)
#abstype
GSEQ_type
(xs: t0, x0: t0) <= xs
#sexpdef GSEQ = GSEQ_type
//
(* ****** ****** *)
//
(*
HX:
For persistent arrays
*)
//
#abstype
GASQ_type
(xs: t0, x0: vt) <= xs
#sexpdef GASQ = GASQ_type
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_make
(xs: xs): GSEQ(xs, x0)
fun
<xs:t0>
<x0:vt>
GASQ_make
(xs: xs): GASQ(xs, x0)
//
#symload GSEQ with GSEQ_make of 0000
#symload GASQ with GASQ_make of 0000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_unmk
(gseq: GSEQ(xs, x0)): (xs)
fun
<xs:t0>
<x0:vt>
GASQ_unmk
(gasq: GASQ(xs, x0)): (xs)
//
#symload unmk with GSEQ_unmk of 1000
#symload unmk with GASQ_unmk of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2026-01-11:
GASQ is a subclass of GSEQ!
Sun Jan 11 09:54:46 PM EST 2026
*)
fcast
GASQ_GSEQ$cast
{xs:t0}{x0:t0}
(gasq: GASQ(xs, x0)): GSEQ(xs, x0)
#symload GSEQ with GASQ_GSEQ$cast of 1000
//
(* ****** ****** *)
(* ****** ****** *)
(*
//
HX-2024-08-03:
//
[GSEQ] is
like a functional list (list)
[GASQ] is
like a persistent array (a1sz)
//
*)
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_sum
(gseq: GSEQ(xs, x0)): (x0)
fun
<xs:t0>
<x0:t0>
GSEQ_prod
(gseq: GSEQ(xs, x0)): (x0)
//
#symload sum with GSEQ_sum of 1000
#symload prod with GSEQ_prod of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_length
(gseq: GSEQ(xs, x0)): nint
//
#symload length with GSEQ_length of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_listize
(GSEQ(xs,x0)): list_vt(x0)
fun
<xs:t0>
<x0:t0>
GSEQ_rlistize
(GSEQ(xs,x0)): list_vt(x0)
//
#symload listize with GSEQ_listize of 1000
#symload rlistize with GSEQ_rlistize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_strmize
(GSEQ(xs,x0)): strm_vt(x0)
fun
<xs:t0>
<x0:t0>
GSEQ_rstrmize
(GSEQ(xs,x0)): strm_vt(x0)
//
#symload strmize with GSEQ_strmize of 1000
#symload rstrmize with GSEQ_rstrmize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_forall
(gseq: GSEQ(xs, x0)): bool
fun
<xs:t0>
<x0:t0>
GSEQ_exists
(gseq: GSEQ(xs, x0)): bool
fun
<xs:t0>
<x0:t0>
GSEQ_rforall
(gseq: GSEQ(xs, x0)): bool
fun
<xs:t0>
<x0:t0>
GSEQ_rexists
(gseq: GSEQ(xs, x0)): bool
fun
<xs:t0>
<x0:t0>
GSEQ_iforall
(gseq: GSEQ(xs, x0)): bool
fun
<xs:t0>
<x0:t0>
GSEQ_irforall
(gseq: GSEQ(xs, x0)): bool
//
#symload forall with GSEQ_forall of 1000
#symload exists with GSEQ_exists of 1000
#symload rforall with GSEQ_rforall of 1000
#symload rexists with GSEQ_rexists of 1000
#symload iforall with GSEQ_iforall of 1000
#symload irforall with GSEQ_irforall of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_forall$f1un
( gseq: GSEQ(xs, x0)
, test: ( x0 )->bool): bool
//
#symload forall with GSEQ_forall$f1un of 1000
#symload forall$fun with GSEQ_forall$f1un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_exists$f1un
( gseq: GSEQ(xs, x0)
, test: ( x0 )->bool): bool
//
#symload exists with GSEQ_exists$f1un of 1000
#symload exists$fun with GSEQ_exists$f1un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_rforall$f1un
( gseq: GSEQ(xs, x0)
, test: ( x0 )->bool): bool
//
#symload rforall with GSEQ_rforall$f1un of 1000
#symload rforall$fun with GSEQ_rforall$f1un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_rexists$f1un
( gseq: GSEQ(xs, x0)
, test: ( x0 )->bool): bool
//
#symload rexists with GSEQ_rexists$f1un of 1000
#symload rexists$fun with GSEQ_rexists$f1un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_iforall$f2un
( gseq: GSEQ(xs, x0)
, test: (ni, x0)->bool): bool
//
#symload iforall with GSEQ_iforall$f2un of 1000
#symload iforall$fun with GSEQ_iforall$f2un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_irforall$f2un
( gseq: GSEQ(xs, x0)
, test: (ni, x0)->bool): bool
//
#symload irforall with GSEQ_irforall$f2un of 1000
#symload irforall$fun with GSEQ_irforall$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_foritm
(gseq: GSEQ(xs, x0)): void
fun
<xs:t0>
<x0:t0>
GSEQ_rforitm
(gseq: GSEQ(xs, x0)): void
fun
<xs:t0>
<x0:t0>
GSEQ_iforitm
(gseq: GSEQ(xs, x0)): void
fun
<xs:t0>
<x0:t0>
GSEQ_irforitm
(gseq: GSEQ(xs, x0)): void
//
#symload foritm with GSEQ_foritm of 1000
#symload rforitm with GSEQ_rforitm of 1000
#symload iforitm with GSEQ_iforitm of 1000
#symload irforitm with GSEQ_irforitm of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_foritm$f1un
( gseq: GSEQ(xs, x0)
, test: ( x0 )->void): void
//
#symload foritm with GSEQ_foritm$f1un of 1000
#symload foritm$fun with GSEQ_foritm$f1un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_rforitm$f1un
( gseq: GSEQ(xs, x0)
, test: ( x0 )->void): void
//
#symload rforitm with GSEQ_rforitm$f1un of 1000
#symload rforitm$fun with GSEQ_rforitm$f1un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_iforitm$f2un
( gseq: GSEQ(xs, x0)
, test: (ni, x0)->void): void
//
#symload iforitm with GSEQ_iforitm$f2un of 1000
#symload iforitm$fun with GSEQ_iforitm$f2un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
GSEQ_irforitm$f2un
( gseq: GSEQ(xs, x0)
, test: (ni, x0)->void): void
//
#symload irforitm with GSEQ_irforitm$f2un of 1000
#symload irforitm$fun with GSEQ_irforitm$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_folditm
(
gseq:
GSEQ(xs,x0), r0: r0): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_rfolditm
(
gseq:
GSEQ(xs,x0), r0: r0): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_ifolditm
(
gseq:
GSEQ(xs,x0), r0: r0): (r0)
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_irfolditm
(
gseq:
GSEQ(xs,x0), r0: r0): (r0)
//
#symload folditm with GSEQ_folditm of 1000
#symload rfolditm with GSEQ_rfolditm of 1000
#symload ifolditm with GSEQ_ifolditm of 1000
#symload irfolditm with GSEQ_irfolditm of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_folditm$f2un
( gseq
: GSEQ(xs, x0), r0: r0
, fopr: (r0, x0)->(r0)): (r0)
//
#symload folditm with GSEQ_folditm$f2un of 1000
#symload folditm$fun with GSEQ_folditm$f2un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_rfolditm$f2un
( gseq
: GSEQ(xs, x0), r0: r0
, fopr: (x0, r0)->(r0)): (r0)
//
#symload rfolditm with GSEQ_rfolditm$f2un of 1000
#symload rfolditm$fun with GSEQ_rfolditm$f2un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_ifolditm$f3un
( gseq
: GSEQ(xs, x0), r0: r0
, fopr: (r0, ni, x0)->(r0)): (r0)
//
#symload ifolditm with GSEQ_ifolditm$f3un of 1000
#symload ifolditm$fun with GSEQ_ifolditm$f3un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:t0>
<r0:vt>
GSEQ_irfolditm$f3un
( gseq
: GSEQ(xs, x0), r0: r0
, fopr: (ni, x0, r0)->(r0)): (r0)
//
#symload irfolditm with GSEQ_irfolditm$f3un of 1000
#symload irfolditm$fun with GSEQ_irfolditm$f3un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-03:
[GASQ] is for
persistent arrays with size attched
For instance, it should support ops
like binary search.
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASQ_length
(gasq: GASQ(xs, x0)): nint
//
#symload length with GASQ_length of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASQ_listize
(gasq: GASQ(xs,x0)): list_vt(x0)
fun
<xs:t0>
<x0:vt>
GASQ_rlistize
(gasq: GASQ(xs,x0)): list_vt(x0)
//
#symload listize with GASQ_listize of 1000
#symload rlistize with GASQ_rlistize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASQ_strmize
(gasq: GASQ(xs,x0)): strm_vt(x0)
fun
<xs:t0>
<x0:vt>
GASQ_rstrmize
(gasq: GASQ(xs,x0)): strm_vt(x0)
//
#symload strmize with GASQ_strmize of 1000
#symload rstrmize with GASQ_rstrmize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASQ_forall
(gasq: GASQ(xs, x0)): bool
fun
<xs:t0>
<x0:vt>
GASQ_exists
(gasq: GASQ(xs, x0)): bool
//
fun
<xs:t0>
<x0:vt>
GASQ_rforall
(gasq: GASQ(xs, x0)): bool
fun
<xs:t0>
<x0:vt>
GASQ_rexists
(gasq: GASQ(xs, x0)): bool
//
fun
<xs:t0>
<x0:vt>
GASQ_iforall
(gasq: GASQ(xs, x0)): bool
fun
<xs:t0>
<x0:vt>
GASQ_irforall
(gasq: GASQ(xs, x0)): bool
//
#symload forall with GASQ_forall of 1000
#symload exists with GASQ_exists of 1000
#symload rforall with GASQ_rforall of 1000
#symload rexists with GASQ_rexists of 1000
#symload iforall with GASQ_iforall of 1000
#symload irforall with GASQ_irforall of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASQ_forall$f1un
( gasq: GASQ(xs, x0)
, test: ( !x0 )->bool): bool
//
#symload forall with GASQ_forall$f1un of 1000
#symload forall$fun with GASQ_forall$f1un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASQ_exists$f1un
( gasq: GASQ(xs, x0)
, test: ( !x0 )->bool): bool
//
#symload exists with GASQ_exists$f1un of 1000
#symload exists$fun with GASQ_exists$f1un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASQ_rforall$f1un
( gasq: GASQ(xs, x0)
, test: ( !x0 )->bool): bool
//
#symload rforall with GASQ_rforall$f1un of 1000
#symload rforall$fun with GASQ_rforall$f1un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASQ_rexists$f1un
( gasq: GASQ(xs, x0)
, test: ( !x0 ) -> bool): bool
//
#symload rexists with GASQ_rexists$f1un of 1000
#symload rexists$fun with GASQ_rexists$f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASQ_foritm
(gasq: GASQ(xs, x0)): void
fun
<xs:t0>
<x0:vt>
GASQ_rforitm
(gasq: GASQ(xs, x0)): void
fun
<xs:t0>
<x0:vt>
GASQ_iforitm
(gasq: GASQ(xs, x0)): void
fun
<xs:t0>
<x0:vt>
GASQ_irforitm
(gasq: GASQ(xs, x0)): void
//
#symload foritm with GASQ_foritm of 1000
#symload rforitm with GASQ_rforitm of 1000
#symload iforitm with GASQ_iforitm of 1000
#symload irforitm with GASQ_irforitm of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASQ_foritm$f1un
( gasq: GASQ(xs, x0)
, test: ( x0 )->void): void
//
#symload foritm with GASQ_foritm$f1un of 1000
#symload foritm$fun with GASQ_foritm$f1un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASQ_rforitm$f1un
( gasq: GASQ(xs, x0)
, test: ( x0 )->void): void
//
#symload rforitm with GASQ_rforitm$f1un of 1000
#symload rforitm$fun with GASQ_rforitm$f1un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASQ_iforitm$f2un
( gasq: GASQ(xs, x0)
, test: (ni, x0)->void): void
//
#symload iforitm with GASQ_iforitm$f2un of 1000
#symload iforitm$fun with GASQ_iforitm$f2un of 1000
//
(* ****** ****** *)
//
fun
<xs:t0>
<x0:vt>
GASQ_irforitm$f2un
( gasq: GASQ(xs, x0)
, test: (ni, x0)->void): void
//
#symload irforitm with GASQ_irforitm$f2un of 1000
#symload irforitm$fun with GASQ_irforitm$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_gcls000.sats] *)
(***********************************************************************)
