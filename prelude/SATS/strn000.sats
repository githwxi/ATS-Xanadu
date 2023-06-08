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
#sexpdef strn = string0
#sexpdef strn = string1
(* ****** ****** *)
//
#typedef cgtz =
[c:char | c > 0] char(c)
//
(* ****** ****** *)
//
prfun
strn_lemma
{n:int}(strn(n)): [n>=0] void
prfun
stropt_lemma
{n:int}(stropt(n)): [n>=0] void
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
(*
fun<>
strn_vt2t
{n:int}
(cs: strn_vt(n)): strn(n)
fun<>
stropt_vt2t
{n:int}
(cs: stropt_vt(n)): stropt(n)
*)
//
(* ****** ****** *)

fcast
strn_some
{n:int}
(cs: strn(n)): stropt(n+1)
fcast
stropt_unsome
{n:pos}
(cs: stropt(n)): strn(n-1)

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
strn_top2tr
( cs: strn) : p2tr(char)
#symload ptrof with strn_top2tr
*)
//
(* ****** ****** *)
//
fun<>
strn_nil
  ((*void*)): strn(0)
fun<>
strn_cons
  {n:int}
( c0: cgtz
, cs: strn(n)): strn(n+1)
//
(* ****** ****** *)
//
fun<>
strn_nilq
  {n:int}
  (cs: strn(n)): bool(n=0)
fun<>
strn_consq
  {n:int}
  (cs: strn(n)): bool(n>0)
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
strn_head
{n:pos}
(cs: strn(n)): cgtz
//
fun<>
strn_head_exn(strn): cgtz
fun<>
strn_head_opt(strn): char
fun<>
strn_head_raw(strn): cgtz
//
(* ****** ****** *)
//
fun<>
strn_tail
{n:pos}
(cs: strn(n)): strn(n-1)
//
fun<>
strn_tail_exn
(cs: strn): strn
fun<>
strn_tail_opt
(cs: strn): optn_vt(strn)
//
fun<>
strn_tail_raw(strn): strn
//
(* ****** ****** *)

fun<>
strn_eqzq
{n:int}
(cs: strn(n)): bool(n=0)
fun<>
strn_neqzq
{n:int}
(cs: strn(n)): bool(n>0)

(* ****** ****** *)
fun<>
strn_lt
(x1: strn, x2: strn): bool
fun<>
strn_gt
(x1: strn, x2: strn): bool
fun<>
strn_eq
(x1: strn, x2: strn): bool
(* ****** ****** *)
fun<>
strn_lte
(x1: strn, x2: strn): bool
fun<>
strn_gte
(x1: strn, x2: strn): bool
fun<>
strn_neq
(x1: strn, x2: strn): bool
(* ****** ****** *)

fun<>
strn_cmp
(x1: strn, x2: strn): sint

(* ****** ****** *)
//
fun<>
strn_print(cs: strn): void
//
(* ****** ****** *)

(*
fun<>
strn_get_next
{n:pos}{l0:addr}
( pf
! strn(n) @ l0 >>
  ( strn(n) @ l0
  - strn(n-1) @ l1 ) | p0: ptr(l0)
)
: #[l1:addr] (strn(n-1) @ l1 | ptr(l1))
*)

(* ****** ****** *)
//
fun<>
strn_length
{n:int}(cs: strn(n)): sint(n)
//
(* ****** ****** *)
//
fun<>
strn_get_at
{n:int}
{i:nat|i < n}
( cs:
  strn(n), i0: int(i)): cgtz
//
(* ****** ****** *)
//
fun<>
strn_append
{m,n:int}
( xs: strn(m)
, ys: strn(n)): strn(m+n)
//
fun<>
strn_append_vt
{m,n:int}
( xs: strn(m)
, ys: strn(n)): strn_vt(m+n)
//
(* ****** ****** *)
//
fun<>
strn_reverse
{n:int}
( cs: strn(n) ) : strn(n)
fun<>
strn_reverse_vt
{n:int}
( cs: strn(n) ) : strn_vt(n)
//
(* ****** ****** *)
//
fun<>
strn_forall(strn): bool
fun<>
strn_foreach(strn): void
//
(* ****** ****** *)
//
fun<>
strn_rforall(strn): bool
fun<>
strn_rforeach(strn): void
//
(* ****** ****** *)
//
fun<>
strn_listize
{n:int}
(strn(n)): list_vt(cgtz,n)
//
(* ****** ****** *)
//
fun<>
strn_strmize
(cs:strn): strm_vt( cgtz )
(*
HX-2022-06-12:
[strn_strxize] with an
infinite trail of zeros!
*)
fun<>
strn_strxize
(cs:strn): strx_vt( char )
//
fun<>
strn_strqize
{n:int}
(strn(n)): strq_vt(cgtz,n)
//
(* ****** ****** *)
//
fun<>
strn_rlistize
{n:int}
(cs:strn(n)): list_vt(cgtz,n)
//
(* ****** ****** *)
//
fun<>
strn_rstrmize
{n:int}
(cs:strn(n)): strm_vt( cgtz )
fun<>
strn_rstrqize
{n:int}
(cs:strn(n)): strq_vt(cgtz,n)
//
(* ****** ****** *)
//
fun<>
strn_copy
{n:int}(strn(n)): strn(n)
//
fun<>
strn_copy_vt
{n:int}(strn(n)): strn_vt(n)
//
(* ****** ****** *)
//
fun<>
strn_make_list
{n:int}
(cs:list(cgtz, n)): strn(n)
fun<>
strn_make_llist
{n:int}
(cs:list_vt(cgtz, n)): strn(n)
//
(* ****** ****** *)
//
fun<>
strn_make_strm
  (cs:strm(cgtz)): strn(*0*)
fun<>
strn_make_lstrm
  (cs:strm_vt(cgtz)): strn(*0*)
//
(* ****** ****** *)
//
fun<>
strnlst_concat
  (css: list(strn)): strn
fun<>
strnlst_concat_vt
  (css: list(strn)): strn_vt
//
(* ****** ****** *)
//
fun<>
strntrm_concat
  (css: strm(strn)): strn
fun<>
strntrm_concat_vt
  (css: strm(strn)): strn_vt
//
(* ****** ****** *)
//
fun
<n:i0>
strn_tabulate
( n0: sint(n) ) : strn(n)
//
fun<>
strn_tabulate_cfr
{n:nat}
( n0
: sint(n)
, f0
: nintlt(n) -<cfr> cgtz): strn(n)
//
(* ****** ****** *)
//
fun<>
strn_lower
{n:int}(cs: strn(n)): strn(n)
fun<>
strn_upper
{n:int}(cs: strn(n)): strn(n)
//
(* ****** ****** *)
//
fun<>
strn_prefixq
(s1: strn(*pfx*), s2: strn): bool
fun<>
strn_suffixq
(s1: strn(*sfx*), s2: strn): bool
//
(* ****** ****** *)
//
(*
HX-2020-05-30:
symbol overloading for strn
*)
//
(* ****** ****** *)
(*
HX-2022-06-12:
common strn-constructors:
*)
#symload strn
with strn_make_list of 1000
#symload strn
with strn_make_strm of 1000
#symload strn
with strn_make_llist of 1000
#symload strn
with strn_make_lstrm of 1000
(* ****** ****** *)
//
#symload
nilq with strn_nilq of 1000
#symload
consq with strn_consq of 1000
//
(* ****** ****** *)
#symload < with strn_lt of 1000
#symload > with strn_gt of 1000
#symload = with strn_eq of 1000
#symload <= with strn_lte of 1000
#symload => with strn_gte of 1000
#symload != with strn_neq of 1000
#symload cmp with strn_cmp of 1000
(* ****** ****** *)
//
#symload
[] with strn_get_at of 1000
#symload
get_at with strn_get_at of 1000
//
(* ****** ****** *)
//
#symload
[] with strn_head of 1000
#symload
head with strn_head of 1000
#symload
head_opt with strn_head_opt of 1000
#symload
head_exn with strn_head_exn of 1000
//
(* ****** ****** *)
//
#symload
tail with strn_tail of 1000
#symload
tail_opt with strn_tail_opt of 1000
#symload
tail_exn with strn_tail_exn of 1000
//
(* ****** ****** *)
//
(*
#symload print with strn_print of 1000
*)
//
(* ****** ****** *)
//
#symload length with strn_length of 1000
//
(* ****** ****** *)
//
#symload append with strn_append of 1000
//
(* ****** ****** *)
//
#symload reverse with strn_reverse of 1000
//
(* ****** ****** *)

#symload forall with strn_forall of 1000
#symload rforall with strn_rforall of 1000

(* ****** ****** *)

#symload listize with strn_listize of 1000
#symload strmize with strn_strmize of 1000
#symload strxize with strn_strxize of 1000

(* ****** ****** *)
#symload rlistize with strn_rlistize of 1000
(* ****** ****** *)

(* end of [ATS3/XANADU_prelude_strn000.sats] *)
