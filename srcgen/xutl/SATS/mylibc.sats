(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2018 Hongwei Xi, ATS Trustful Software, Inc.
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
// Author: Hongwei Xi
// Start Time: April, 2018
// Authoremail: gmhwxiATgmailDOTcom
//
(* ****** ****** *)
//
fun
xatsopt_memcpy
( dst: ptr
, src: ptr
, nbyte: Size_t): ptr = "ext#xatsopt_memcpy"
//
(* ****** ****** *)
//
(*
char *strchr(const char *s, int c);
char *strrchr(const char *s, int c);
*)
//
fun
xatsopt_strchr
(cs: ptr, c0: int): ptr = "ext#xatsopt_strchr"
fun
xatsopt_strrchr
(cs: ptr, c0: int): ptr = "ext#xatsopt_strrchr"
//      
(* ****** ****** *)
//
fun
xatsopt_chrunq // '<char>' -> <char>
(source: string): char = "ext#xatsopt_chrunq"
fun
xatsopt_strunq // "<string>" -> <string>
(source: string): string = "ext#xatsopt_strunq"
//
(* ****** ****** *)
//
fun
xatsopt_chrunq2 // '<slashed>' -> <slashed>
(source: string): char = "ext#xatsopt_chrunq2"
//
(* ****** ****** *)
//
fun
xatsopt_strbtwe
(p0: ptr, p1: ptr): string = "ext#xatsopt_strbtwe"
//
(* ****** ****** *)
//
(*
int
strcmp(const char *s1, const char *s2);
int
strncmp(const char *s1, const char *s2, size_t n);
*)
//
fun
xatsopt_strcmp
(cs1: ptr, cs2: ptr): int = "ext#xatsopt_strcmp"
fun
xatsopt_strncmp
( cs1: ptr
, cs2: ptr, nlen: size_t): int = "ext#xatsopt_strncmp"
//       
(* ****** ****** *)
//
fun
xatsopt_getcwd
( buf: ptr
, bsz: size_t): ptr = "ext#xatsopt_getcwd"
fun
xatsopt_getcwd_gc
  ((*void*)): Strptr0 = "ext#xatsopt_getcwd_gc"
//
(* ****** ****** *)
//
fun
xatsopt_getenv
  (key: string): ptr = "ext#xatsopt_getenv"
fun
xatsopt_getenv_gc
  (key: string): Strptr0 = "ext#xatsopt_getenv_gc"
//
(* ****** ****** *)
//
fun
xatsopt_is_exist
  (fpath: string): bool = "ext#xatsopt_is_exist"
//
(* ****** ****** *)

(* end of [mylibc.sats] *)
