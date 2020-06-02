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

(* ****** ****** *)

fcast
string_vt2t
{n:int}
(cs: string_vt(n)): string(n)
fcast
stropt_vt2t
{n:int}
(cs: stropt_vt(n)): stropt(n)

(* ****** ****** *)

absvtype
strptr_i0_vx(n:int) <= ptr
vtypedef
strptr(n:int) = strptr_i0_vx(n)

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
string_head
{n:pos}(string(n)): cgtz
fun<>
string_tail
{n:pos}(string(n)): string(n-1)
//
(* ****** ****** *)
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
string_length
{n:int}(cs: string(n)): int(n)

(* ****** ****** *)
//
fun<>
string_forall(cs: string): bool
fun<>
string_rforall(cs: string): bool
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
fun<>
strptr_make
{n:nat}
(bsz: int(n)): strptr(n)
//
fun<>
strptr_set_at
{n:int}
{i:nat|i < n}
( p0: !strptr(n)
, i0: int(i), c0: cgtz): void
//
(* ****** ****** *)
//
fun<>
string_make_list
{n:int}
(cs: list(cgtz, n)): string(n)
fun<>
string_vt_make_list
{n:int}
(cs: list(cgtz, n)): string(n)
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
#symload head with string_head of 1000
#symload tail with string_tail of 1000
//
(* ****** ****** *)
//
#symload print with string_print of 1000
//
(* ****** ****** *)
//
#symload length with string_length of 1000
//
(* ****** ****** *)

#symload forall with string_forall of 1000

(* ****** ****** *)

(* end of [string.sats] *)
