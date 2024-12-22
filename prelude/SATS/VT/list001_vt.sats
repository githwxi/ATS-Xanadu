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
//
(*
Author: Hongwei Xi
(*
Mon 08 Jul 2024 04:08:25 PM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_forall0
(xs: ~list_vt(x0)): bool
fun
<x0:vt>
list_vt_forall1
(xs: !list_vt(x0)): bool
//
fun
<x0:vt>
list_vt_rforall0
(xs: ~list_vt(x0)): bool
fun
<x0:vt>
list_vt_rforall1
(xs: !list_vt(x0)): bool
//
fun
<x0:vt>
list_vt_iforall0
(xs: ~list_vt(x0)): bool
fun
<x0:vt>
list_vt_iforall1
(xs: !list_vt(x0)): bool
//
fun
<x0:vt>
list_vt_irforall0
(xs: ~list_vt(x0)): bool
fun
<x0:vt>
list_vt_irforall1
(xs: !list_vt(x0)): bool
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_foritm0
(xs: ~list_vt(x0)): void
fun
<x0:vt>
list_vt_foritm1
(xs: !list_vt(x0)): void
//
fun
<x0:vt>
list_vt_rforitm0
(xs: ~list_vt(x0)): void
fun
<x0:vt>
list_vt_rforitm1
(xs: !list_vt(x0)): void
//
fun
<x0:vt>
list_vt_iforitm0
(xs: ~list_vt(x0)): void
fun
<x0:vt>
list_vt_iforitm1
(xs: !list_vt(x0)): void
fun
<x0:vt>
list_vt_irforitm0
(xs: ~list_vt(x0)): void
fun
<x0:vt>
list_vt_irforitm1
(xs: !list_vt(x0)): void
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
list_vt_folditm0
(xs: list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_rfolditm0
(xs: list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_ifolditm0
(xs: list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_irfolditm0
(xs: list_vt(x0), r0: r0): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<x0:vt>
<r0:vt>
list_vt_foldall0
(xs: ~list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_rfoldall0
(xs: ~list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_ifoldall0
(xs: ~list_vt(x0), r0: r0): (r0)
fun
<x0:vt>
<r0:vt>
list_vt_irfoldall0
(xs: ~list_vt(x0), r0: r0): (r0)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-04:
Wed 04 Sep 2024 06:29:48 AM EDT
*)
//
fun
<x0:vt>
list_vt_strmize0
(xs: ~list_vt(x0)): strm_vt(x0)
fun
<x0:vt>
list_vt_strqize0
{n:int}
(xs: ~list_vt(x0, n)): strq_vt(x0, n)
//
fun
<x0:vt>
list_vt_rstrmize0
(xs: ~list_vt(x0)): strm_vt(x0)
fun
<x0:vt>
list_vt_rstrqize0
{n:int}
(xs: ~list_vt(x0, n)): strq_vt(x0, n)
//
(* ****** ****** *)
//
fun
<x0:vt>
list_vt_listize0
{n:int}
(xs: ~list_vt(x0, n)): list_vt(x0, n)
fun
<x0:vt>
list_vt_rlistize0
{n:int}
(xs: ~list_vt(x0, n)): list_vt(x0, n)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-31:
Wed 31 Jul 2024 03:16:49 AM EDT
*)
fun
<x0:vt>
list_vt_c2hoose0_lstrm
(xs: ~list_vt(x0)): strm_vt@(x0, x0)
fun
<x0:vt>
list_vt_c3hoose0_lstrm
(xs: ~list_vt(x0)): strm_vt@(x0, x0, x0)
//
fun
<x0:vt>
list_vt_nchoose0_lstrm$llist
{n0:nat}
( xs:
~ list_vt(x0)
, n0: nint(n0)): strm_vt(list_vt(x0, n0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-14:
Sat 14 Sep 2024 03:34:58 PM EDT
*)
//
fun
<x0:vt>
<y0:vt>
list_vt_map0
{ln:nat}
(xs: ~list_vt(x0, ln)): list_vt(y0, ln)
fun
<x0:vt>
<y0:vt>
list_vt_map1
{ln:nat}
(xs: !list_vt(x0, ln)): list_vt(y0, ln)
//
#symload map0 with list_vt_map0 of 1000
#symload map1 with list_vt_map1 of 1000
//
fun
<x0:vt>
<y0:vt>
list_vt_map0$f1un
{ln:nat}
(xs:
~list_vt(x0, ln)
,fopr: (  ~x0  ) -> y0): list_vt(y0, ln)
fun
<x0:vt>
<y0:vt>
list_vt_map1$f1un
{ln:nat}
(xs:
!list_vt(x0, ln)
,fopr: (  !x0  ) -> y0): list_vt(y0, ln)
//
#symload map0$fun with list_vt_map0$f1un of 1000
#symload map1$fun with list_vt_map1$f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-09-14:
Sat 14 Sep 2024 03:34:58 PM EDT
*)
//
fun
<x0:vt>
<y0:vt>
list_vt_maprev0
{ln:nat}
(xs: ~list_vt(x0, ln)): list_vt(y0, ln)
fun
<x0:vt>
<y0:vt>
list_vt_maprev1
{ln:nat}
(xs: !list_vt(x0, ln)): list_vt(y0, ln)
//
#symload maprev0 with list_vt_maprev0 of 1000
#symload maprev1 with list_vt_maprev1 of 1000
//
fun
<x0:vt>
<y0:vt>
list_vt_maprev0$f1un
{ln:nat}
(xs:
~list_vt(x0, ln)
,fopr: (  ~x0  ) -> y0): list_vt(y0, ln)
fun
<x0:vt>
<y0:vt>
list_vt_maprev1$f1un
{ln:nat}
(xs:
!list_vt(x0, ln)
,fopr: (  !x0  ) -> y0): list_vt(y0, ln)
//
#symload maprev0$fun with list_vt_maprev0$f1un of 1000
#symload maprev1$fun with list_vt_maprev1$f1un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_VT_list001_vt.sats] *)
