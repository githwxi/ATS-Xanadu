(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2025 Hongwei Xi, ATS Trustful Software, Inc.
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
Thu Dec 25 10:09:49 AM EST 2025
*)
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
(* ****** ****** *)
#typedef igtz = sintgt(0)
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-25:
For sorted lists
Originall, I named it 'lord'
instead of 'lsrt'. And today
is Christmas, 2025!
Thu Dec 25 12:03:10 PM EST 2025
*)
//
#abstbox
lsrt_t0_i0_tx
( a:t0,n:i0 ) <= list(a)
//
#sexpdef
lsrt = lsrt_t0_i0_tx
#typedef
lsrt(a: t0) = [n:i0] lsrt(a, n)
//
(* ****** ****** *)
//
fcast
lsrt_decd
{a:t0}
(lsrt(a, n)): list(a, n)
//
fcast
UN_lsrt_encd
{a:t0}
(list(a, n)): lsrt(a, n)
//
(* ****** ****** *)
//
fun<>
lsrt_nil
{a:t0}((*0*)): lsrt(a, 0)
//
(* ****** ****** *)
//
fun<>
lsrt_nilq
{a:t0}{n:i0}
(xs: lsrt(a,n)): bool(n=0)
fun<>
lsrt_consq
{a:t0}{n:i0}
(xs: lsrt(a,n)): bool(n>0)
//
#symload
nilq with lsrt_nilq of 1000
consq with lsrt_consq of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
lsrt_head
{n:i0|n>0}
(xs: lsrt(a,n)): ( a )
fun
<a:t0>
lsrt_tail
{n:i0|n>0}
( xs
: lsrt(a,n)): lsrt(a,n-1)
//
#symload
head with lsrt_head of 1000
#symload
tail with lsrt_tail of 1000
//
(* ****** ****** *)
//
fun
<a:t0>
lsrt_head$opt
(xs: lsrt(a)): optn_vt(a)
fun
<a:t0>
lsrt_tail$opt
(xs: lsrt(a)): optn_vt(lsrt(a))
//
#symload
head$opt with lsrt_head$opt of 1000
#symload
tail$opt with lsrt_tail$opt of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
lsrt_make_1val
( x1: a): lsrt(a, 1)
fun
<a:t0>
lsrt_make_2val
(x1: a, x2: a): lsrt(a, 2)
fun
<a:t0>
lsrt_make_3val
(x1: a
,x2: a, x3: a): lsrt(a, 3)
//
#symload
lsrt_sing with lsrt_make_1val
#symload
lsrt_pair with lsrt_make_2val
//
#symload
lsrt_1val with lsrt_make_1val
#symload
lsrt_2val with lsrt_make_2val
#symload
lsrt_3val with lsrt_make_3val
//
(* ****** ****** *)
(* ****** ****** *)
//
fun
<a:t0>
lsrt_length
{n:i0}
(xs: lsrt(a, n)): sint(n)
//
#symload
length with lsrt_length of 1000
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-25:
This one uses [search$tcmp]
*)
fun
<x0:t0>
lsrt_exists
(xs: lsrt(x0)): ( bool )
fun
<x0:t0>
lsrt_search
(xs: lsrt(x0)): optn_vt(x0)
//
(* ****** ****** *)
//
(*
HX-2025-12-25:
insertion happens
at the first available position
Thu Dec 25 12:35:50 PM EST 2025
*)
fun
<x0:t0>
lsrt_insert
{ln:i0}
(xs: lsrt(x0, ln), x0: x0): lsrt(x0, ln+1)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-26:
Fri Dec 26 10:46:11 PM EST 2025
*)
//
fun
<x0:t0>
lsrt_msetize
(xs: lsrt(x0)): list@(x0, igtz)
fun
<x0:t0>
lsrt_msetize_vt
(xs: lsrt(x0)): list_vt@(x0, igtz)
//
(* ****** ****** *)
(* ****** ****** *)
//
(*
HX-2025-12-26:
The keys in a lsrt-map
are assumed to be distinct!!!
Fri Dec 26 10:27:50 AM EST 2025
*)
//
fun
<k0:t0>
<x0:t0>
lsrt$map_search$tst
( map
: lsrt@(k0,x0), key: k0): bool
fun
<k0:t0>
<x0:t0>
lsrt$map_search$get
( map
: lsrt@(k0,x0), key: k0): optn_vt(x0)
//
fun
<k0:t0>
<x0:t0>
lsrt$map_getout$opt
( map
: lsrt@(k0, x0)
, key   :   k0): (lsrt@(k0,x0), optn_vt(x0))
//
fun
<k0:t0>
<x0:t0>
lsrt$map_insert$opt
( map
: lsrt@(k0,x0)
, key: k0, itm: x0): (lsrt@(k0, x0), optn_vt(x0))
//
(* ****** ****** *)
(* ****** ****** *)
//
(***********************************************************************)
(* end of [ATS3/XANADU_prelude_SATS_lsrt000.sats] *)
(***********************************************************************)
