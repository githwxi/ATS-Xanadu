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
Mon 08 Jul 2024 09:12:42 AM EDT
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
#sortdef c0 = char
#typedef cgtz =
[c:c0 | c > 0] char(c)
//
#typedef
strnlst = list(strn)
#typedef
strnopt = optn(strn)
//
#vwtpdef
strnllst = list_vt(strn)
#vwtpdef
strnlopt = optn_vt(strn)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_nilq
 {n:i0}
(cs: strn(n)): bool(n=0)
fun<>
strn_consq
 {n:i0}
(cs: strn(n)): bool(n>0)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_lt
(xs:strn, ys:strn): bool
fun<>
strn_gt
(xs:strn, ys:strn): bool
fun<>
strn_eq
(xs:strn, ys:strn): bool
fun<>
strn_lte
(xs:strn, ys:strn): bool
fun<>
strn_gte
(xs:strn, ys:strn): bool
fun<>
strn_neq
(xs:strn, ys:strn): bool
//
#symload < with strn_lt of 1000
#symload > with strn_gt of 1000
#symload = with strn_eq of 1000
#symload <= with strn_lte of 1000
#symload >= with strn_gte of 1000
#symload != with strn_neq of 1000
//
(* ****** ****** *)
//
fun<>
strn_cmp
( xs: strn
, ys: strn): sint(*sign*)
#symload
cmp with strn_cmp of 1000
//
(*
fun<>
strn_compare // = strn_cmp
(x:strn, y:strn): sint(*sign*)
#symload
compare with strn_compare of 1000
*)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-17:
Note strn_print may not
be the same as g_print<strn>
*)
fun<>
strn_print(strn): void
//
#symload
pstrn with strn_print of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_length
{n0:i0}
(cs: strn(n0)): sint(n0)
//
#symload
length with strn_length of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_get$at
(cs: strn, i0: nint): cgtz
fun<>
strn_fset$at
(cs: strn
,i0: nint, c0: cgtz): strn
//
(*
HX-2024-08-16:
Plz see [unsfx00.sats]:
fun<>
UN_strn_get$at$raw
(cs: strn, i0: nint): cgtz
fun<>
UN_strn_fset$at$raw
( cs: strn
, i0: nint, c0: cgtz): strn
*)
//
#symload
[] with strn_get$at of 1000
#symload
get$at with strn_get$at of 1000
#symload
fset$at with strn_fset$at of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2024-07-11:
The 'g' in 'gmake' means
that the argument, which is
the subject here, is polymorphic.
*)
fun
<a:t0>
strn_gmake(x: a): (strn)
fun
<a:vt>
strn_gmake0(x: (~a)): (strn)
fun
<a:vt>
strn_gmake1(x: (!a)): (strn)
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_slice
{n0:i0}
{i0:nat
;j0:int
|i0<=j0
;j0<=n0}
( cs: strn(n0)
, i0: sint(i0)
, j0: sint(j0)): strn(j0-i0)
#symload
slice with strn_slice of 1000
//
fun<>
strn_prefix
{n0:i0}
{i0:nat
|i0<=n0}
( cs: strn(n0)
, i0: sint(i0)): strn(i0)
#symload
prefix with strn_prefix of 1000
//
fun<>
strn_suffix
{n0:i0}
{i0:nat
|i0<=n0}
( cs: strn(n0)
, i0: sint(i0)): strn(n0-i0)
#symload
suffix with strn_suffix of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_make_1val
(c0: cgtz): strn(1)
//
fun<>
strn_make_2val
(c0: cgtz, c1: cgtz): strn(2)
fun<>
strn_make_3val
( c0: cgtz
, c1: cgtz, c2: cgtz): strn(3)
//
#symload
strn with strn_make_1val of 1000
#symload
strn with strn_make_2val of 1000
#symload
strn with strn_make_3val of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_make_ncpy
{n0:i0}
(n0:nint(n0),ch:cgtz): strn(n0)
#symload
strn with strn_make_ncpy of 1000
//
fun<>
strn_make_nfun
{n0:i0}
(n0:nint(n0)
,f0:nintlt(n0)->cgtz): strn(n0)
#symload
strn with strn_make_nfun of 1000
//
(* ****** ****** *)
//
fun
<cs:t0>
strn_make_gseq(cs: cs): strn
//
fun
<xs:t0>
<x0:t0>
// HX: map$fopr(x0):cgtz
strn_map$make_gseq(xs: xs): strn
//
(* ****** ****** *)
//
fun<>
strn_make_list
{n0:i0}
(cs: list(cgtz, n0)): strn(n0)
#symload
strn with strn_make_list of 1000
//
(* ****** ****** *)
//
fun<>
strn_make0_llist
{n0:i0}
(cs: ~list_vt(cgtz,n0)): strn(n0)
fun<>
strn_make1_llist
{n0:i0}
(cs: !list_vt(cgtz,n0)): strn(n0)
//
#symload
strn with strn_make0_llist of 1000
//
(* ****** ****** *)
//
fun<>
strn_make0_lstrm
{n0:i0}
(cs: ~strm_vt(cgtz,n0)): strn(n0)
//
#symload
strn with strn_make0_lstrm of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun<>
strn_append
{m0,n0:i0}
( xs: strn(m0)
, ys: strn(n0)): strn(m0+n0)
#symload + with strn_append of 1000
#symload append with strn_append of 1000
//
(* ****** ****** *)
//
fun<>
strn_reverse
{n0:i0}
( cs: strn(n0)): strn(n0)
#symload reverse with strn_reverse of 1000
fun<> // HX-2024-08-17: is
strn_rappend // this one really useful?
{m0,n0:i0}
( xs: strn(m0)
, ys: strn(n0)): strn(m0+n0)
#symload rappend with strn_rappend of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fcast // fun
GSEQ_make_strn
(xs: strn): GSEQ(strn, cgtz)
#symload GSEQ with GSEQ_make_strn of 1000
#symload GSEQ_strn with GSEQ_make_strn of 1000
//
fcast // fun
GASZ_make_strn
(xs: strn): GASZ(strn, cgtz)
#symload GASZ with GASZ_make_strn of 1000
#symload GASZ_strn with GASZ_make_strn of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(* ****** ****** *)(* ****** ****** *)
(* ****** ****** *)(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_SATS_strn000.sats] *)
