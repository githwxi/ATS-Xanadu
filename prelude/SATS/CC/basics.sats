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
//
// For various pointers
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: July, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
typedef
p1gez = [l:agez] p1tr1(l)
typedef
p1gtz = [l:agtz] p1tr1(l)
typedef
p2gez(a:vt) = [l:agez] p2tr1(a,l)
typedef
p2gtz(a:vt) = [l:agtz] p2tr1(a,l)
(* ****** ****** *)
//
(*
HX-2020-07-30:
const pointers are read-only
*)
typedef
cp1tr_k =
$extype("xats_cp1tr_t")
typedef
cp2tr_k =
$extype("xats_cp2tr_t")
(* ****** ****** *)
abstype
cp1tr_tbox(l:a0) <= cp1tr_k
abstype
cp2tr_tbox(a:vt, l:a0) <= cp2tr_k
(* ****** ****** *)
//
typedef
cp1tr0 = [l:a0] cp1tr_tbox(l)
typedef
cp1tr1(l: a0) = cp1tr_tbox(l)
//
typedef
cp2tr0
(a:vt) = [l:a0] cp2tr_tbox(a,l)
typedef
cp2tr1(a:vt,l:a0) = cp2tr_tbox(a,l)
//
typedef
cp1tr = cp1tr0
typedef
cp1tr(l:a0) = cp1tr1(l)
//
typedef cp2tr(a:vt) = cp2tr0(a)
typedef cp2tr(a:vt, l:a0) = cp2tr1(a,l)
//
(* ****** ****** *)
typedef
cp1gez = [l:agez] cp1tr1(l)
typedef
cp1gtz = [l:agtz] cp1tr1(l)
typedef
cp2gez(a:vt) = [l:agez] cp2tr1(a,l)
typedef
cp2gtz(a:vt) = [l:agtz] cp2tr1(a,l)
(* ****** ****** *)

fcast
p2tr_constize
{a:vt}{l:a0}
(p0: p2tr(a, l)): cp2tr(a, l)
#symload
cp2tr with p2tr_constize of 1000
#symload
const with p2tr_constize of 1000

(* ****** ****** *)
//
fun<>
p1tr_eqzq
{l:a0}
(p0: p1tr(l)): bool(l=0)
fun<>
p1tr_neqzq
{l:a0}
(p0: p1tr(l)): bool(l!=0)
//
#symload eqzq with p1tr_eqzq of 1000
#symload neqzq with p1tr_neqzq of 1000
//
(* ****** ****** *)
//
fun<>
p2tr_eqzq
{a:vt}
{l:a0}
(p0: p2tr(a, l)): bool(l=0)
fun<>
p2tr_neqzq
{a:vt}
{l:a0}
(p0: p2tr(a, l)): bool(l!=0)
//
#symload eqzq with p2tr_eqzq of 1000
#symload neqzq with p2tr_neqzq of 1000
//
(* ****** ****** *)
//
fun
<a:vt>
UN_p1gtz_get(p0: p1gtz): a
fun
<a:vt>
UN_p2gtz_get(p0: p2gtz(a)): a
//
fun
<a:vt>
UN_cp1gtz_get(cp: cp1gtz): a
fun
<a:vt>
UN_cp2gtz_get(cp: cp2gtz(a)): a
//
fun
<a:vt>
UN_p1gtz_set(p0: p1gtz, x0: a): void
fun
<a:vt>
UN_p2gtz_set(p0: p2gtz(a), x0: a): void
//
(* ****** ****** *)

(*
prfun
<a:vt>
array_get_at
{n:int}
{i:nat|i<n}
(array(a,n)@l | int(i))
:
(a@(l+i*sz(a)), array(a, n)@l - a@(l+i*sz(a)))
*)

(* ****** ****** *)
//
(*
HX-2020-08-02: arrays
*)
//
(* ****** ****** *)
typedef
p2trn_k =
$extype("xats_p2trn_t")
(* ****** ****** *)
abstype
p2trn_tbox
(a:vt,n:i0,l:a0) <= p2trn_k
(* ****** ****** *)

typedef
p2trn
(a:vt,n:i0) =
[l:a0] p2trn_tbox(a,n,l)
typedef
p2trn
(a:vt
,n:i0,l:a0) = p2trn_tbox(a,n,l)

(* ****** ****** *)
typedef
p2trn_k =
$extype("xats_cp2trn_t")
(* ****** ****** *)
abstype
cp2trn_tbox
(a:vt,n:i0,l:a0) <= cp2trn_k
(* ****** ****** *)

typedef
cp2trn
(a:vt,n:i0) =
[l:a0] cp2trn_tbox(a,n,l)
typedef
cp2trn
(a:vt
,n:i0,l:a0) = cp2trn_tbox(a,n,l)

(* ****** ****** *)
fun
<a:vt>
UN_p2trn_get_at
{n:int}
(p0: p2trn(a, n), i0: nintlt(n)): ( a )
fun
<a:vt>
UN_cp2trn_get_at
{n:int}
(cp: cp2trn(a, n), i0: nintlt(n)): ( a )
(* ****** ****** *)
fun
<a:vt>
UN_p2trn_set_at
{n:int}
(p0: p2trn(a, n), i0: nintlt(n), x0: a): void
fun
<a:vt>
UN_p2trn_exch_at
{n:int}
(p0: p2trn(a, n), i0: nintlt(n), x0: a): ( a )
(* ****** ****** *)

(* end of [CC/basics.sats] *)
