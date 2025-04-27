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
Fri 26 Jul 2024 09:17:44 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_strmize
(cs: strn): strm_vt(cgtz)
fun<>
strn_strqize
{n0:i0}
(cs: strn(n0)): strq_vt(cgtz, n0)
//
fun<>
strn_rstrmize
(cs: strn): strm_vt(cgtz)
fun<>
strn_rstrqize
{n0:i0}
(cs: strn(n0)): strq_vt(cgtz, n0)
//
#symload strmize with strn_strmize of 1000
#symload strqize with strn_strqize of 1000
#symload rstrmize with strn_strmize of 1000
#symload rstrqize with strn_strqize of 1000
//
(* ****** ****** *)
//
fun<>
strn_listize
{n0:i0}
(cs: strn(n0)): list_vt(cgtz, n0)
fun<>
strn_rlistize
{n0:i0}
(cs: strn(n0)): list_vt(cgtz, n0)
//
#symload listize with strn_listize of 1000
#symload rlistize with strn_listize of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_forall(cs: strn): bool
fun<>
strn_rforall(cs: strn): bool
fun<>
strn_iforall(cs: strn): bool
fun<>
strn_irforall(cs: strn): bool
//
#symload forall with strn_forall of 1000
#symload rforall with strn_rforall of 1000
#symload iforall with strn_iforall of 1000
#symload irforall with strn_irforall of 1000
//
(* ****** ****** *)
//
(*
HX-2024-08-16:
Fri 16 Aug 2024 05:08:22 PM EDT
*)
//
fun<>
strn_forall$f1un
(cs: strn, test: (cgtz)->bool): bool
#symload forall with strn_forall$f1un of 1000
//
fun<>
strn_rforall$f1un
(cs: strn, test: (cgtz)->bool): bool
#symload rforall with strn_rforall$f1un of 1000
//
fun<>
strn_iforall$f2un
(cs: strn, test: (ni,cgtz)->bool): bool
#symload iforall with strn_iforall$f2un of 1000
//
fun<>
strn_irforall$f2un
(cs: strn, test: (ni,cgtz)->bool): bool
#symload irforall with strn_irforall$f2un of 1000
//
(* ****** ****** *)
//
(*
HX-2024-08-07:
There is no need for
these special interfaces!
HX-2024-08-08:
However, they do support
symbol overloading nicely!
*)
//
fun<>
strn_foritm(cs: strn): void
fun<>
strn_rforitm(cs: strn): void
fun<>
strn_iforitm(cs: strn): void
fun<>
strn_irforitm(cs: strn): void
//
#symload foritm with strn_foritm of 1000
#symload rforitm with strn_rforitm of 1000
#symload iforitm with strn_iforitm of 1000
#symload irforitm with strn_irforitm of 1000
//
(* ****** ****** *)
//
(*
HX-2024-08-16:
Fri 16 Aug 2024 05:08:22 PM EDT
*)
//
fun<>
strn_foritm$f1un
(cs: strn, work: (cgtz)->void): void
#symload foritm with strn_foritm$f1un of 1000
//
fun<>
strn_rforitm$f1un
(cs: strn, work: (cgtz)->void): void
#symload rforitm with strn_rforitm$f1un of 1000
//
fun<>
strn_iforitm$f2un
(cs: strn, work: (ni,cgtz)->void): void
#symload iforitm with strn_iforitm$f2un of 1000
//
fun<>
strn_irforitm$f2un
(cs: strn, work: (ni,cgtz)->void): void
#symload irforitm with strn_irforitm$f2un of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-16:
Fri 16 Aug 2024 04:48:12 PM EDT
*)
//
(*
fun<>
strn_fmake((*void*)): strn
*)
fun<>
strn_fmake_fwork
(fwork: (cgtz->void)->void): strn//HX:3rd-order!
//
fun
<env:vt>
strn_fmake0_env$fwork
( env: env
, fwork: (env, cgtz->void)->void): strn//HX:3rd-order!
fun
<env:vt>
strn_fmake1_env$fwork
( env: !env
, fwork: (!env, cgtz->void)->void): strn//HX:3rd-order!
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-08-17:
Sat 17 Aug 2024 12:27:46 PM EDT
*)
fun
<xs:t0>
gseq_strn$concat(xs: xs(*strnseq*)): strn
#symload strn$concat with gseq_strn$concat of 1000
//
fun
<xs:t0>
gseq_strn$rconcat(xs: xs(*strnseq*)): strn
#symload strn$rconcat with gseq_strn$rconcat of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_strn001.sats] *)
