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
#include
"share/atspre_staload.hats"
#staload
UN = "prelude/SATS/unsafe.sats"
//
(* ****** ****** *)
//
#staload
"./../../SATS/mylibc0.sats"
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
implement
xatsopt_memcpy
(dst, src, nbyte) =
(
$extfcall
( ptr
, "memcpy", dst, src, nbyte)
)
//
(* ****** ****** *)
//
implement
xatsopt_chrunq(src) =
let
//
#define OCT 8 // base
//
fun
auxmain
( p1: ptr
, ln
: intGte(0)): char =
let
//
val c1 =
$UN.ptr0_get<char>(p1)
//
in
//
ifcase
|
(ln = 0) =>
let
val () =
assertloc(c1 = '\'')
in
  int2char0(0)
end
|
(ln = 1) => c1
|
_(* ln>=2 *) =>
let
val () =
assertloc(c1 = '\\')
//
val p2 =
ptr0_succ<char>(p1)
val c2 =
$UN.ptr0_get<char>(p2)
//
in
//
case+ c2 of
| '"' => '"'
| 'a' => '\a'
| 'b' => '\b'
| 'f' => '\f'
| 'n' => '\n'
| 'r' => '\r'
| 't' => '\t'
| 'v' => '\v'
| '\'' => '\''
| '\\' => '\\'
| _(*isdigit*) =>
let
//
fun
auxrest
( ds: int
, p2: ptr
, ln
: intGte(0)): int =
if
(ln <= 0)
then ds else
let
val c2 =
$UN.ptr0_get<char>(p2)
in
  if
  isdigit(c2)
  then
  let
  val d2 = c2 - '0'
  val p2 =
  ptr0_succ<char>(p2)
  in
    auxrest
    (OCT*ds+d2, p2, ln-1)
  end
  else ds // end-of-if
end // end of [auxrest]
//
in
  int2char0
  (auxrest(0(*ds*), p2, ln))
end
end // end of [ln>=2]
//
end // end of [ifcase]
//
in
  auxmain(p1, sz2i(n0) - 2)
end where
{
  val p0 = string2ptr(src)
  val n0 = g1ofg0(length(src))
  val () = assertloc(n0 >= 2)
  val p1 = ptr0_succ<char>(p0)
} (* end of [xatsopt_chrunq] *)
//
(* ****** ****** *)
//
(*
//
(*
HX-2020-10-26:
This function is
merged with [xatsopt_chrunq]
*)
//
extern
fun
xatsopt_chrunq2
( source
: string): char
= "ext#xatsopt_chrunq2"
//
implement
xatsopt_chrunq2(src) =
(
let
//
val c1 =
$UN.ptr0_get<char>(p1)
val () = assertloc(c1 = SLASH)
//
val p2 = ptr0_succ<char>(p1)
val c2 = $UN.ptr0_get<char>(p2)
//
in
//
case+ c2 of
| '"' => '"'
| 'a' => '\a'
| 'b' => '\b'
| 'f' => '\f'
| 'n' => '\n'
| 'r' => '\r'
| 't' => '\t'
| 'v' => '\v'
| '\'' => '\''
| '\\' => '\\'
| _(*rest*) => auxrest(p2, 0(*ds*))
//
end
) where
{
//
#define OCT 8
//
#define DQUOT '\"'
#define SQUOT '\''
#define SLASH '\\'
//
fun
auxrest
( p2: ptr
, ds: int): char =
let
//
val c2 =
$UN.ptr0_get<char>(p2)
//
in
//
if
isdigit(c2)
then
let
val d0 =
(c2 - '0')
val p2 =
ptr0_succ<char>(p2)
in
auxrest(p2, OCT*ds + d0)
end else ( int2char0(ds) )
//
end // end of [auxrest]
//
  val p0 = string2ptr(src)
  val n0 = g1ofg0(length(src))
  val () = assertloc(n0 >= 2)
  val p1 = ptr0_succ<char>(p0)
//
} (* end of [xatsopt_chrunq2] *)
*)
//
(* ****** ****** *)
//
implement
xatsopt_strunq(src) =
let
//
#define OCT 8
#define CNUL '\000'
//
val p0 = string2ptr(src)
val n0 = g1ofg0(length(src))
val () = assertloc(n0 >= 2)
val p1 = ptr0_succ<char>(p0)
//
fun
isBS
( c0
: char
)
: bool = (c0 = '\\')
//
fun
auxmain
( q0: ptr
, p1: ptr
, ln: Nat): void =
if
(ln <= 0)
then
(
auxfini(q0)
)
else let
//
val c1 =
$UN.ptr0_get<char>(p1)
//
in
ifcase
|
isBS(c1) =>
let
val p1 =
ptr0_succ<char>(p1)
in
auxisbs(q0, p1, ln-1)
end
|
_(* else *) =>
let
val () =
$UN.ptr0_set<char>(q0, c1)
in
let
  val p1 =
  ptr0_succ<char>(p1)
  val q0 =
  ptr0_succ<char>(q0)
in
  auxmain(q0, p1, ln-1)
end
end
// end of [ifcase]
end // if-else // auxmain
//
and
auxisbs
( q0: ptr
, p1: ptr
, ln: Nat): void =
let
//
val () =
assertloc(ln >= 1)
//
val c1 =
$UN.ptr0_get<char>(p1)
//
fun
auxescp
(c1: char): void =
let
val () =
$UN.ptr0_set<char>(q0, c1)
val p1=ptr0_succ<char>(p1)
val q0=ptr0_succ<char>(q0)
in
  auxmain(q0, p1, ln - 1)
end
//
fun
auxskip
((*void*)): void =
(
  auxmain(q0, p1, ln - 1)
) where
{
val p1=ptr0_succ<char>(p1)
}
//
in
case+ c1 of
//
| '"' => auxescp('"')
//
| 'a' => auxescp('\a')
| 'b' => auxescp('\b')
| 'f' => auxescp('\f')
| 'n' => auxescp('\n')
| 'r' => auxescp('\r')
| 't' => auxescp('\t')
| 'v' => auxescp('\v')
| '\'' => auxescp('\'')
| '\\' => auxescp('\\')
//
| '\n' => auxskip((*void*))
//
| _(*else*) =>
(
  auxisds
  (q0, p1, ln, 3(*nd*), 0(*ds*))
)
//
end // end of [auxisbs]
//
and
auxisds
( q0: ptr
, p1: ptr
, ln: Nat
, nd: int
, ds: int): void =
if
(ln <= 0)
then
let
val cc = int2char0(ds)
val () =
$UN.ptr0_set<char>(q0, cc)
in
  auxfini
  (ptr0_succ<char>(q0))
end
else
(
if
(nd <= 0)
then
let
val cc = int2char0(ds)
val () =
$UN.ptr0_set<char>(q0, cc)
val q0=ptr0_succ<char>(q0)
in
  auxmain( q0, p1, ln )
end
else
let
val c1 =
$UN.ptr0_get<char>(p1)
in
if
isdigit(c1)
then
let
val d1 = c1 - '0'
val ds = OCT*ds+d1
val p1 =
ptr0_succ<char>(p1)
in
auxisds
(q0, p1, ln-1, nd-1, ds)
end
else
let
val cc = int2char0(ds)
val () =
$UN.ptr0_set<char>(q0, cc)
val q0=ptr0_succ<char>(q0)
in
  auxmain( q0, p1, ln )
end
end // else
) (* if-else *) // auxisds
//
and
auxfini
( q0: ptr): void =
(
$UN.ptr0_set<char>(q0, CNUL)
)
//
val
( pf0
, fpf | q0) = malloc_gc(n0-1)
//
in
let
  val () =
  auxmain(q0, p1, sz2i(n0)-2)
in
  $UN.castvwtp0((pf0, fpf | q0))
end
end // end of [xatsopt_strunq]
//
(* ****** ****** *)

implement
xatsopt_strbtwe(p0, p1) =
let
//
#define CNUL '\000'
//
  val
  bsz0 =
  sub_ptr0_ptr0(p1, p0)
  val bsz1 = succ(bsz0)
  val bsz1 =
  $UN.cast{Size_t}(bsz1)
  val
  ( pf0
  , fpf | q0) = malloc_gc(bsz1+1)
  val () =
  ignoret(xatsopt_memcpy(q0, p0, bsz1))
  val () =
  $UN.ptr0_set_at<char>(q0, bsz1, CNUL)
//
in
  $UN.castvwtp0((pf0, fpf | q0))
end // end of [xatsopt_strbtwe]

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
  $extfcall
  (int, "strcmp", cs1, cs2)
)
implement
xatsopt_strncmp(cs1, cs2, nlen) =
(
  $extfcall
  (int, "strncmp", cs1, cs2, nlen)
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
//
implement
xatsopt_getenv(key) =
(
$extfcall(ptr, "getenv", key)
)
//
(* ****** ****** *)

%{$
//
extern
atstype_strptr
xatsopt_getenv_gc
(
atstype_string key
) {
  int len;
  char *val;
  char *res;
//
  val = xatsopt_getenv(key);
//
  if(!val) { return (char*)0 ; }
//
  len = strlen(val);
  res = atspre_malloc_gc(len+1) ;
  strcpy(res, val) ; return res ;
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

(* end of [XATSOPT_UTIL_Posix_mylibc0.dats] *)
