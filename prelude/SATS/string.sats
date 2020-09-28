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
// For C-strings, that is,
// char sequence ending with 0
//
(* ****** ****** *)
//
// Author: Hongwei Xi
// Start Time: March, 2020
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
// HX-2020-06-10:
// Note that string_vt is included
//
(* ****** ****** *)
//
typedef cgtz =
[c:char|c > 0]char(c)
//
(* ****** ****** *)

prfun
string_lemma
{n:int}
(string(n)): [n>=0] void
prfun
stropt_lemma
{n:int}
(stropt(n)): [n>=0] void
prfun
string_vt_lemma
{n:int}
(!string_vt(n)): [n>=0] void

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

fcast
string_some
{n:int}
(cs: string(n)): stropt(n+1)
fcast
stropt_unsome
{n:pos}
(cs: stropt(n)): string(n-1)

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
absvwtp
strtmp_i0_vx(n:int) <= ptr
vwtpdef
strtmp0_vt =
[n:int] strtmp_i0_vx(n)
vwtpdef
strtmp1_vt
(n:int) = strtmp_i0_vx(n)
//
(* ****** ****** *)
//
vwtpdef
strtmp_vt = strtmp0_vt
vwtpdef
strtmp_vt(n:int) = strtmp1_vt(n)
//
fcast
UN_string_vt_cast
{n:int}
(cs: strtmp_vt(n)): string_vt(n)
//
(* ****** ****** *)
//
(*
//
// HX-2020-03-07:
// This is only good
// for targeting C-likes
//
fcast
string_top2tr
(cs: string): p2tr(char)
#symload
ptrof with string_top2tr
*)
//
(* ****** ****** *)
//
fun<>
string_print(string): void
fun<>
string_vt_print(!string_vt): void
fun<>
string_vt_print0(~string_vt): void
//
(* ****** ****** *)
//
fun<>
string_nil
  ((*void*)): string(0)
fun<>
string_cons
  {n:int}
( c0: cgtz
, cs: string(n)): string(n+1)
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
string_nilq
  {n:int}
  (cs: string(n)): bool(n=0)
fun<>
string_consq
  {n:int}
  (cs: string(n)): bool(n>0)
//
(* ****** ****** *)
//
fun<>
stropt_nilq
  {n:int}
  (cs: stropt(n)): bool(n=0)
fun<>
stropt_consq
  {n:int}
  (cs: stropt(n)): bool(n>0)
//
(* ****** ****** *)
//
fun<>
string_vt_nilq
{n:int}
(cs: !string_vt(n)): bool(n=0)
fun<>
string_vt_consq
{n:int}
(cs: !string_vt(n)): bool(n>0)
//
(* ****** ****** *)
//
fun<>
string_head
{n:pos}
(cs: string(n)): cgtz
//
fun<>
string_head_exn(string): cgtz
fun<>
string_head_opt(string): char
fun<>
string_head_raw(string): cgtz
//
(* ****** ****** *)
//
fun<>
string_tail
{n:pos}
(cs: string(n)): string(n-1)
//
fun<>
string_tail_exn
(cs: string): string
fun<>
string_tail_opt
(cs: string): optn_vt(string)
//
fun<>
string_tail_raw(string): string
//
(* ****** ****** *)

(*
fun<>
string_get_next
{n:pos}{l0:addr}
( pf
! string(n) @ l0 >>
  ( string(n) @ l0
  - string(n-1) @ l1 ) | p0: ptr(l0)
)
: #[l1:addr] (string(n-1) @ l1 | ptr(l1))
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

fun<>
string_length
{n:int}(string(n)): int(n)
fun<>
string_vt_length
{n:int}(!string_vt(n)): int(n)

(* ****** ****** *)
//
fun<>
string_get_at
{n:int}
{i:nat|i < n}
( cs:
  string(n), i0: int(i)): cgtz
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
string_append
{m,n:int}
( string(m)
, string(n)): string(m+n)
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
//
fun<>
string_forall(string): bool
fun<>
string_rforall(string): bool
//
(* ****** ****** *)
fun<>
string_vt_forall0(~string_vt): bool
fun<>
string_vt_forall1(!string_vt): bool
(* ****** ****** *)
fun<>
string_vt_rforall0(~string_vt): bool
fun<>
string_vt_rforall1(!string_vt): bool
(* ****** ****** *)
//
fun<>
string_listize
{n:int}
(string(n)): list_vt(cgtz,n)
fun<>
string_rlistize
{n:int}
(string(n)): list_vt(cgtz,n)
//
fun<>
string_streamize
(cs: string): stream_vt(cgtz)
//
(* ****** ****** *)
//
fun<>
strtmp_vt_alloc
{n:nat}
(bsz: sint(n)): strtmp_vt(n)
//
(* ****** ****** *)

fun<>
string_copy
{n:int}(string(n)): string(n)
fun<>
string_copy_vt
{n:int}(string(n)): string_vt(n)
fun<>
string_vt_copy
{n:int}
(cs: !string_vt(n)): string_vt(n)

(* ****** ****** *)
//
fun<>
string_make_list
{n:int}
(cs: list(cgtz, n)): string(n)
fun<>
string_vt_make_list
{n:int}
(cs: list(cgtz, n)): string_vt(n)
//
(* ****** ****** *)
//
fun<>
string_make_list_vt
{n:int}
(cs: list_vt(cgtz, n)): string(n)
fun<>
string_vt_make_list_vt
{n:int}
(cs: list_vt(cgtz, n)): string_vt(n)
//
(* ****** ****** *)
//
fun<>
string_make_stream_vt
  (cs: stream_vt(cgtz)): string
fun<>
string_vt_make_stream_vt
  (cs: stream_vt(cgtz)): string_vt
//
(* ****** ****** *)
//
fun
<n:i0>
string_tabulate
( n0: int(n) ) : string(n)
fun
<n:i0>
string_vt_tabulate
( n0: int(n) ) : string_vt(n)
//
fun<>
string_tabulate_cfr
{n:nat}
( n0
: int(n)
, f0
: nintlt(n) -<cfr> cgtz): string(n)
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
// HX-2020-05-30:
// symbol overloading for string
//
(* ****** ****** *)
//
#symload
nilq with string_nilq of 1000
#symload
consq with string_consq of 1000
//
(* ****** ****** *)
//
#symload
[] with string_get_at of 1000
#symload
get_at with string_get_at of 1000
//
#symload
[] with string_vt_get_at of 1000
#symload
get_at with string_vt_get_at of 1000
//
#symload
[] with string_vt_set_at of 1000
#symload
[] with strtmp_vt_set_at of 1000
#symload
set_at with string_vt_set_at of 1000
#symload
set_at with strtmp_vt_set_at of 1000
//
(* ****** ****** *)
//
#symload
[] with string_head of 1000
#symload
head with string_head of 1000
#symload
head_opt with string_head_opt of 1000
#symload
head_exn with string_head_exn of 1000
//
(* ****** ****** *)
//
#symload
tail with string_tail of 1000
#symload
tail_opt with string_tail_opt of 1000
#symload
tail_exn with string_tail_exn of 1000
//
(* ****** ****** *)
//
#symload
print with string_print of 1000
//
#symload
print with string_vt_print of 1000
#symload
print0 with string_vt_print0 of 1000
//
(* ****** ****** *)
//
#symload
length with string_length of 1000
#symload
length with string_vt_length of 1000
//
(* ****** ****** *)
//
#symload
append with string_append of 1000
#symload
append with string_vt_append of 1000
//
(* ****** ****** *)

#symload forall with string_forall of 1000
#symload rforall with string_rforall of 1000

(* ****** ****** *)

#symload listize with string_listize of 1000
#symload rlistize with string_rlistize of 1000
#symload streamize with string_streamize of 1000

(* ****** ****** *)

(* end of [string.sats] *)
