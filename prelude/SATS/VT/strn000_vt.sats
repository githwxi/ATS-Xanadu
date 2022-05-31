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
#vwtpdef
str0_vt = string0_vt
#vwtpdef
str1_vt = string1_vt
(* ****** ****** *)
//
#typedef cgtz =
[c:char|c > 0]char(c)
//
(* ****** ****** *)
//
prfun
string_vt_lemma
{n:int}
(!string_vt(n)): [n>=0] void
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
string_vt2t
{n:int}
(cs: string_vt(n)): string(n)
*)
fun<>
string_vt2t
{n:int}
(cs: string_vt(n)): string(n)
fun<>
stropt_vt2t
{n:int}
(cs: stropt_vt(n)): stropt(n)
//
(* ****** ****** *)
//
(*
HX-2020-09-27:
Note that [strtmp_vt] and [string_vt] are
assumed to be of the same representation.
The former is actually a temporary of the
latter:
A string_vt construction is cemented with
a call to the cast-function UN_string_vt_cast,
which itself is just a no-op.
*)
//
#absvwtp
strtmp_i0_vx(n:int) <= p0tr
#vwtpdef
strtmp0_vt =
[n:int] strtmp_i0_vx(n)
#vwtpdef
strtmp1_vt
(n: int) = strtmp_i0_vx( n )
//
(* ****** ****** *)
//
#vwtpdef
strtmp_vt = strtmp0_vt
#vwtpdef
strtmp_vt(n:int) = strtmp1_vt(n)
//
(* ****** ****** *)
//
fcast
UN_string_vt_cast
{n:int}
(cs: strtmp_vt(n)): string_vt(n)
//
(* ****** ****** *)
//
fun<>
string_vt_nil
  ((*void*)): string_vt(0)
fun<>
string_vt_cons
  {n:int}
( c0: cgtz
, cs: string_vt(n)): string_vt(n+1)
//
(* ****** ****** *)
//
fun<>
string_vt_print(!string_vt): void
fun<>
string_vt_print0(~string_vt): void
fun<>
string_vt_print1(!string_vt): void
//
(* ****** ****** *)

(*
fun<>
string_vt_get_next
{n:pos}{l0:addr}
( pf
! string_vt(n) @ l0 >>
  ( string_vt(n) @ l0
  - string_vt(n-1) @ l1 ) | p0: ptr(l0)
)
: #[l1:addr] (string_vt(n-1) @ l1 | ptr(l1))
*)

(* ****** ****** *)
//
fun<>
string_vt_length
{n:int}(!string_vt(n)): int(n)
fun<>
string_vt_length0
{n:int}(~string_vt(n)): int(n)
fun<>
string_vt_length1
{n:int}(!string_vt(n)): int(n)
//
(* ****** ****** *)
//
fun<>
string_vt_get_at
{n:int}
{i:nat|i < n}
( cs:
! string_vt(n), i0: int(i)): cgtz
//
fun<>
strtmp_vt_set_at
{n:int}
{i:nat|i < n}
( p0:
! strtmp_vt(n), i0: int(i), c0: cgtz): void
fun<>
string_vt_set_at
{n:int}
{i:nat|i < n}
( p0:
! string_vt(n), i0: int(i), c0: cgtz): void
//
(* ****** ****** *)
//
fun<>
string_append_vt
{m,n:int}
( string(m)
, string(n)): string_vt(m+n)
//
fun<>
string_vt_append
{m,n:int}
( !string_vt(m)
, !string_vt(n)): string_vt(m+n)
//
(* ****** ****** *)
fun<>
string_reverse_vt
{n:int}
(cs: string(n)): string_vt(n)
fun<>
string_vt_reverse
{n:int}
(cs: string_vt(n)): string_vt(n)
(* ****** ****** *)
//
fun<>
string_vt_forall0(~string_vt): bool
fun<>
string_vt_forall1(!string_vt): bool
//
(* ****** ****** *)
//
fun<>
string_vt_rforall0(~string_vt): bool
fun<>
string_vt_rforall1(!string_vt): bool
//
(* ****** ****** *)
//
fun<>
string_vt_listize1
{n:int}
( cs:
! string_vt(n)): list_vt(cgtz,n)
fun<>
string_vt_rlistize1
{n:int}
( cs:
! string_vt(n)): list_vt(cgtz,n)
//
(* ****** ****** *)
//
fun<>
string_vt_streamize
(cs: string_vt): stream_vt(cgtz)
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
string_vt_free(string_vt): void
//
(* ****** ****** *)
//
fun<>
string_copy_vt
{n:int}(string(n)): string_vt(n)
//
fun<>
string_vt_copy
{n:int}
(cs: !string_vt(n)): string_vt(n)
//
(* ****** ****** *)
//
fun<>
string_vt_make_list
{n:int}
(cs: list(cgtz, n)): string_vt(n)
//
(* ****** ****** *)
//
fun<>
string_vt_make_list_vt
{n:int}
( cs
: list_vt(cgtz, n)): string_vt(n)
//
(* ****** ****** *)
fun<>
string_vt_make_stream
  (cs: stream(cgtz)): string_vt
fun<>
string_vt_make_stream_vt
  (cs: stream_vt(cgtz)): string_vt
(* ****** ****** *)
//
fun
<n:i0>
string_vt_tabulate
( n0: int(n) ) : string_vt(n)
//
fun<>
string_vt_tabulate_cfr
{n:nat}
( n0
: int(n)
, f0
: nintlt(n) -<cfr> cgtz): string_vt(n)
//
(* ****** ****** *)
//
fun<>
string_lower_vt
{n:int}
(cs: string(n)): string_vt(n)
fun<>
string_upper_vt
{n:int}
(cs: string(n)): string_vt(n)
//
(* ****** ****** *)
//
fun<>
string_vt_lower
{n:int}
(cs: string_vt(n)): string_vt(n)
fun<>
string_vt_upper
{n:int}
(cs: string_vt(n)): string_vt(n)
//
(* ****** ****** *)
//
// HX-2020-05-30:
// symbol overloading for string
//
(* ****** ****** *)
//
#symload
[] with string_vt_get_at of 1000
#symload
[] with string_vt_set_at of 1000
#symload
[] with strtmp_vt_set_at of 1000
//
#symload
get_at with string_vt_get_at of 1000
#symload
set_at with string_vt_set_at of 1000
#symload
set_at with strtmp_vt_set_at of 1000
//
(* ****** ****** *)
//
#symload
print with string_vt_print of 1000
#symload
print0 with string_vt_print0 of 1000
#symload
print1 with string_vt_print1 of 1000
//
(* ****** ****** *)
//
#symload
length with string_vt_length of 1000
//
(* ****** ****** *)
//
#symload
append with string_vt_append of 1000
//
(* ****** ****** *)
//
#symload
reverse with string_vt_reverse of 1000
//
(* ****** ****** *)

(* end of [prelude_strn000_vt.sats] *)
