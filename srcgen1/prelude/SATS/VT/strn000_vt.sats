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
// HX:
// For C-strings, that is,
// char sequences ending with 0
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: March, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
(*
#sexpdef
strn_vt = string0_vt
#sexpdef
strn_vt = string1_vt
*)
(* ****** ****** *)
//
#typedef cgtz =
[c:char | c > 0] char(c)
//
(* ****** ****** *)
//
prfun
strn_vt_lemma
{n:int}
(!strn_vt(n)): [n>=0] void
//
(* ****** ****** *)
//
(*
HX-2020-09-27:
//
[string]
and
[string_vt]
are NOT assumed to be of the
same representation!
//
For instance, a string is a
JS_string in JS but a string_vt
is a JS_array (of chars) in JS!
*)
//
(*
fcast
strn_vt2t
{n:int}
(cs: strn_vt(n)): strn(n)
*)
fun<>
strn_vt2t
{n:int}
(cs: strn_vt(n)): strn(n)
fun<>
stropt_vt2t
{n:int}
(cs: stropt_vt(n)): stropt(n)
//
(* ****** ****** *)
//
(*
HX-2020-09-27:
(Please see prelude/basics0.sats)
Note that [strtmp_vt] and [string_vt] are
assumed to be of the same representation.
//
The former is actually a temporary of the latter:
A string_vt construction is cemented with a call to the
cast-function UN_string_vt_cast, which itself is just a no-op.
//
*)
//
(* ****** ****** *)
//
fcast
UN_strn_vt_cast
{n:int}
(cs: strtmp_vt(n)): strn_vt(n)
//
(* ****** ****** *)
//
fun<>
strn_vt_nil
  ((*void*)): strn_vt(0)
fun<>
strn_vt_cons
  {n:int}
( c0: cgtz
, cs: strn_vt(n)): strn_vt(n+1)
//
(* ****** ****** *)
fun<>
strn_vt_nilq1
  {n:int}
( cs: !strn_vt(n)): bool(n = 0)
fun<>
strn_vt_consq1
  {n:int}
( cs: !strn_vt(n)): bool(n > 0)
(* ****** ****** *)
//
fun<>
strn_vt_print0(~strn_vt): void
fun<>
strn_vt_print1(!strn_vt): void
//
(* ****** ****** *)

(*
fun<>
strn_vt_get_next
{n:pos}{l0:addr}
( pf
! strn_vt(n) @ l0 >>
  ( strn_vt(n) @ l0
  - strn_vt(n-1) @ l1 ) | p0: ptr(l0)
)
: #[l1:addr] (strn_vt(n-1) @ l1 | ptr(l1))
*)

(* ****** ****** *)
//
fun<>
strn_vt_length0
{n:int}(~strn_vt(n)): int(n)
fun<>
strn_vt_length1
{n:int}(!strn_vt(n)): int(n)
//
(* ****** ****** *)
//
fun<>
strn_vt_get$at
{n:int}
{i:nat|i < n}
( cs:
! strn_vt(n), i0: int(i)): cgtz
//
fun<>
strn_vt_set$at
{n:int}
{i:nat|i < n}
( p0:
! strn_vt(n), i0: int(i), c0: cgtz): void
//
fun<>
strtmp_vt_set$at
{n:int}
{i:nat|i < n}
( p0:
! strtmp_vt(n), i0: int(i), c0: cgtz): void
//
(* ****** ****** *)
//
fun<>
strn_vt_append0
{m,n:int}
( ~strn_vt(m)
, ~strn_vt(n)): strn_vt(m+n)
fun<>
strn_vt_append1
{m,n:int}
( !strn_vt(m)
, !strn_vt(n)): strn_vt(m+n)
//
(* ****** ****** *)
fun<>
strn_vt_reverse0
{n:int}
(cs: strn_vt(n)): strn_vt(n)
(* ****** ****** *)
//
fun<>
strn_vt_forall0(~strn_vt): bool
fun<>
strn_vt_forall1(!strn_vt): bool
//
(* ****** ****** *)
//
fun<>
strn_vt_rforall0(~strn_vt): bool
fun<>
strn_vt_rforall1(!strn_vt): bool
//
(* ****** ****** *)
//
fun<>
strn_vt_listize0
{n:int}
( cs:
~ strn_vt(n)): list_vt(cgtz,n)
fun<>
strn_vt_rlistize0
{n:int}
( cs:
~ strn_vt(n)): list_vt(cgtz,n)
//
(* ****** ****** *)
//
fun<>
strn_vt_strmize0
(cs: ~strn_vt): strm_vt(cgtz)
fun<>
strn_vt_rstrmize0
(cs: ~strn_vt): strm_vt(cgtz)
//
(* ****** ****** *)
//
fun<>
strn_vt_listize1
{n:int}
( cs:
! strn_vt(n)): list_vt(cgtz,n)
fun<>
strn_vt_rlistize1
{n:int}
( cs:
! strn_vt(n)): list_vt(cgtz,n)
//
fun<>
strn_vt_copy_llist
{n:int}
( cs:
! strn_vt(n)): list_vt(cgtz,n)
fun<>
strn_vt_copy_rlist
{n:int}
( cs:
! strn_vt(n)): list_vt(cgtz,n)
(* ****** ****** *)
//
// HX:
// rcopy_llist = copy_rllist
fun<>
strn_vt_rcopy_llist
{n:int}
( cs:
! strn_vt(n)): list_vt(cgtz,n)
// HX:
// rcopy_rllist = copy_llist
fun<>
strn_vt_rcopy_rlist
{n:int}
( cs:
! strn_vt(n)): list_vt(cgtz,n)
//
(* ****** ****** *)
//
(*
HX-2020-12-05:
This one needs to be
given a native implementation
*)
//
fun<>
strtmp_vt_alloc
{n:nat}
( bsz: sint(n) ): strtmp_vt(n)
//
(* ****** ****** *)
//
fun<>
strn_vt_free(cs:strn_vt): void
//
(* ****** ****** *)
//
fun<>
strn_vt_copy
{n:int}
(cs: !strn_vt(n)): strn_vt( n )
//
(* ****** ****** *)
//
fun<>
strn_vt_make_strn
{n:int}(cs:strn(n)): strn_vt(n)
//
(* ****** ****** *)
//
fun<>
strn_vt_make_list
{n:int}
(cs: list(cgtz, n)): strn_vt(n)
//
(* ****** ****** *)
//
fun<>
strn_vt_make0_llist
{n:int}
( cs
: list_vt(cgtz, n)): strn_vt(n)
//
(* ****** ****** *)
//
fun<>
strn_vt_make_strm
  (cs: strm(cgtz)): strn_vt
//
fun<>
strn_vt_make0_lstrm
  (cs: strm_vt(cgtz)): strn_vt
//
(* ****** ****** *)
//
fun<>
strnlst_vt_concat0
  (css: list_vt(strn)): strn_vt
fun<>
strntrm_vt_concat0
  (css: strm_vt(strn)): strn_vt
//
(* ****** ****** *)
//
fun<>
lstrnlst_vt_concat0
  (css: list_vt(strn_vt)): strn_vt
fun<>
lstrntrm_vt_concat0
  (css: strm_vt(strn_vt)): strn_vt
//
(* ****** ****** *)
//
fun
<n:i0>
strn_vt_tabulate
( n0: int(n) ) : strn_vt(n)
//
fun<>
strn_vt_tabulate$f1un
{n:nat}
( n0
: int(n)
, f0
: nintlt(n) -> cgtz): strn_vt(n)
//
(* ****** ****** *)
//
fun<>
strn_lower_vt
{n:int}
(cs: strn(n)): strn_vt(n)
fun<>
strn_upper_vt
{n:int}
(cs: strn(n)): strn_vt(n)
//
(* ****** ****** *)
//
fun<>
strn_vt_lower0
{n:int}
(cs: strn_vt(n)): strn_vt(n)
fun<>
strn_vt_upper0
{n:int}
(cs: strn_vt(n)): strn_vt(n)
//
(* ****** ****** *)
//
(*
HX-2020-05-30:
symbol overloading for strn_vt
*)
//
(* ****** ****** *)
#symload
strn_vt with strn_vt_copy
#symload
strn_vt with strn_vt_make_list
#symload
strn_vt with strn_vt_make_strm
#symload
strn_vt with strn_vt_make0_llist
#symload
strn_vt with strn_vt_make0_lstrm
(* ****** ****** *)
//
#symload
[] with strn_vt_get$at of 1000
#symload
[] with strn_vt_set$at of 1000
#symload
[] with strtmp_vt_set$at of 1000
//
#symload
get$at with strn_vt_get$at of 1000
#symload
set$at with strn_vt_set$at of 1000
#symload
set$at with strtmp_vt_set$at of 1000
//
(* ****** ****** *)
//
(*
#symload
print0 with strn_vt_print0 of 1000
#symload
print1 with strn_vt_print1 of 1000
*)
//
(* ****** ****** *)
#symload
nilq1 with strn_vt_nilq1 of 1000
#symload
consq1 with strn_vt_consq1 of 1000
(* ****** ****** *)
//
(*
#symload
length with strn_vt_length1 of 1000
*)
#symload
length0 with strn_vt_length0 of 1000
#symload
length1 with strn_vt_length1 of 1000
//
(* ****** ****** *)
//
(*
#symload
append with strn_vt_append0 of 1000
*)
#symload
append0 with strn_vt_append0 of 1000
//
(* ****** ****** *)
//
(*
#symload
reverse with strn_vt_reverse0 of 1000
*)
#symload
reverse0 with strn_vt_reverse0 of 1000
//
(* ****** ****** *)
//
#symload
listize0 with strn_vt_listize0 of 1000
#symload
rlistize0 with strn_vt_rlistize0 of 1000
//
(* ****** ****** *)
//
#symload
strmize0 with strn_vt_strmize0 of 1000
#symload
rstrmize0 with strn_vt_rstrmize0 of 1000
//
(* ****** ****** *)

#symload forall0 with strn_vt_forall0 of 1000

(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_strn000_vt.sats] *)
