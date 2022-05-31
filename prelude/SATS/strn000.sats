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
#typedef str0 = string0
#typedef str1 = string1
(* ****** ****** *)
//
#typedef cgtz =
[c:char | c > 0] char(c)
//
(* ****** ****** *)
//
prfun
string_lemma
{n:int}
(string(n)): [n>=0] void
prfun
stropt_lemma
{n:int}
(stropt(n)): [n>=0] void
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
(*
fun<>
string_vt2t
{n:int}
(cs: string_vt(n)): string(n)
fun<>
stropt_vt2t
{n:int}
(cs: stropt_vt(n)): stropt(n)
*)
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
HX-2020-03-07:
This is only good
for targeting C-likes
*)
//
(*
fcast
string_top2tr
( cs: string ) : p2tr(char)
#symload ptrof with string_top2tr
*)
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

fun<>
string_eqzq
{n:int}
(cs: string(n)): bool(n=0)
fun<>
string_neqzq
{n:int}
(cs: string(n)): bool(n>0)

(* ****** ****** *)
fun<>
string_lt
(x1: string, x2: string): bool
fun<>
string_gt
(x1: string, x2: string): bool
fun<>
string_eq
(x1: string, x2: string): bool
(* ****** ****** *)
fun<>
string_lte
(x1: string, x2: string): bool
fun<>
string_gte
(x1: string, x2: string): bool
fun<>
string_neq
(x1: string, x2: string): bool
(* ****** ****** *)

fun<>
string_cmp
(x1: string, x2: string): sint

(* ****** ****** *)
//
fun<>
string_print(cs: string): void
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
*)

(* ****** ****** *)
//
fun<>
string_length
{n:int}(cs: string(n)): sint(n)
//
(* ****** ****** *)
//
fun<>
string_get_at
{n:int}
{i:nat|i < n}
( cs:
  string(n), i0: int(i)): cgtz
//
(* ****** ****** *)
//
fun<>
string_append
{m,n:int}
( xs: string(m)
, ys: string(n)): string(m+n)
//
(* ****** ****** *)
fun<>
string_reverse
{n:int}
( cs: string(n) ) : string(n)
(* ****** ****** *)
//
fun<>
string_forall(string): bool
fun<>
string_rforall(string): bool
//
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
string_copy
{n:int}(string(n)): string(n)
//
(* ****** ****** *)
//
fun<>
string_make_list
{n:int}
(cs: list(cgtz, n)): string(n)
//
(* ****** ****** *)
//
fun<>
string_make_list_vt
{n:int}
(cs: list_vt(cgtz, n)): string(n)
//
(* ****** ****** *)
fun<>
string_make_stream
  (cs: stream(cgtz)): string
fun<>
string_make_stream_vt
  (cs: stream_vt(cgtz)): string
(* ****** ****** *)
//
fun
<n:i0>
string_tabulate
( n0: int(n) ) : string(n)
//
fun<>
string_tabulate_cfr
{n:nat}
( n0
: int(n)
, f0
: nintlt(n) -<cfr> cgtz): string(n)
//
(* ****** ****** *)
//
fun<>
string_lower
{n:int}(cs: string(n)): string(n)
fun<>
string_upper
{n:int}(cs: string(n)): string(n)
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
#symload < with string_lt of 1000
#symload > with string_gt of 1000
#symload = with string_eq of 1000
#symload <= with string_lte of 1000
#symload => with string_gte of 1000
#symload != with string_neq of 1000
#symload cmp with string_cmp of 1000
(* ****** ****** *)
//
#symload
[] with string_get_at of 1000
#symload
get_at with string_get_at of 1000
//
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
(* ****** ****** *)
//
#symload
length with string_length of 1000
//
(* ****** ****** *)
//
#symload
append with string_append of 1000
//
(* ****** ****** *)
//
#symload
reverse with string_reverse of 1000
//
(* ****** ****** *)

#symload forall with string_forall of 1000
#symload rforall with string_rforall of 1000

(* ****** ****** *)

#symload listize with string_listize of 1000
#symload rlistize with string_rlistize of 1000
#symload streamize with string_streamize of 1000

(* ****** ****** *)

(* end of [prelude_strn000.sats] *)
