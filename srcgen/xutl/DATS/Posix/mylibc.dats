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
#staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload
"libats/libc/SATS/string.sats"
#staload
"libats/libc/SATS/unistd.sats"
#staload
"libats/libc/SATS/sys/stat.sats"
//
(* ****** ****** *)
//
#staload "./../../SATS/mylibc.sats"
//
(* ****** ****** *)
//
implement
xatsopt_memcpy
(dst, src, nbyte) =
(
  $extfcall(ptr, "memcpy", dst, src, nbyte)
)
//
(* ****** ****** *)
//
implement
xatsopt_strunq(src) =
let
//
#define CNUL '\000'
//
  val p0 = string2ptr(src)
  val n0 = g1ofg0(length(src))
  val () = assertloc(n0 >= 2)
  val p1 = ptr0_succ<char>(p0)
  val
  ( pf0
  , fpf | q0) = malloc_gc(n0-1)
  val () =
  ignoret
  (xatsopt_memcpy(q0, p1, n0-2))
  val () =
  $UN.ptr0_set_at<char>(q0, n0-2, CNUL)
in
  $UN.castvwtp0((pf0, fpf | q0))
end // end of [xatsopt_strunq]
//
(* ****** ****** *)
//
implement
xatsopt_strchr(cs, c0) =
(
  $extfcall(ptr, "strchr", cs, c0)
)
implement
xatsopt_strrchr(cs, c0) =
(
  $extfcall(ptr, "strrchr", cs, c0)
)
//
(* ****** ****** *)
//
implement
xatsopt_strcmp(cs1, cs2) =
(
  $extfcall(int, "strcmp", cs1, cs2)
)
implement
xatsopt_strncmp(cs1, cs2, nlen) =
(
  $extfcall(int, "strncmp", cs1, cs2, nlen)
)
//
(* ****** ****** *)
//
implement
xatsopt_getcwd(buf, bsz) =
(
  $extfcall(ptr, "getcwd", buf, bsz)
)
//
(* ****** ****** *)

%{$
//
extern
atstype_strptr
xatsopt_getcwd_gc
(
// void
) {
  int bsz ;
  int myeno ;
  char *p1_cwd ;
  char *p2_cwd ;
//
// HX: [64] is chosen nearly randomly
//
  bsz = 64 ;
  p1_cwd = (char*)0 ;
//
  while(1)
  {
    p1_cwd =
    atspre_malloc_gc(bsz) ;
    p2_cwd =
    xatsopt_getcwd(p1_cwd, bsz) ; myeno = errno ;
    if (p2_cwd != 0) return p1_cwd ; else atspre_mfree_gc(p1_cwd) ;
    if ( myeno != ERANGE ) break ; bsz = 2 * bsz ;
  }
//
  return (char*)0 ;
//
} /* end of [xatsopt_getcwd_gc] */
%}

(* ****** ****** *)

%{$
//
atstype_bool
xatsopt_is_exist
  (atstype_string fp)
{
  int err;
  struct stat st ;
  err = stat((const char*)fp, &st) ;
  return \
  (err==0 ? atsbool_true : atsbool_false) ;
} // end of [xatsopt_is_exist]
//
%}

(* ****** ****** *)

(* end of [Posix_mylibc.dats] *)
