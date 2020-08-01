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
// For pure arrays in C
//
(* ****** ****** *)
//
praxi
array_view_nil :
{a:vt}
{l:a0}
((*void*)) -<prf> arrvw(a,l,0)
//
praxi
array_view_cons
{a:vt}
{l:a0}
{n:i0}
( pf1
: a @ l
, pf2
: arrvw(a,l+sz(a),n)): arrvw(a,l,n+1)
//
praxi
array_view_uncons :
{a:vt}
{l:a0}
{n:i0|n > 0}
(
! arrvw(a,l,n) >>
  arrvw(a,l+sz(a),n-1)) -<prf> (a @ l)
//
(* ****** ****** *)

#symload nil with array_view_cons
#symload cons with array_view_cons
#symload uncons with array_view_uncons

(* ****** ****** *)
prfun
array_view_split_at
{a:vt}
{l:a0}
{n:i0}{i:nat|i<=n}
( A0:
  arrvw(a,l,n) | i0: int(i) )
:
(
  arrvw(a,l,i), arrvw(a,l+i*sz(a),n-i)
) (* end of [array_v_split_at] *)
(* ****** ****** *)
prfun
array_view_unsplit
{a:vt}
{l:a0}
{n1:i0
;n2:i0}
( pf1
: arrvw(a,l, n1)
, pf2
: arrvw(a,l+n1*sz(a),n2)): arrvw(a,l,n1+n2)
(* ****** ****** *)

(* end of [CC/array.sats]
