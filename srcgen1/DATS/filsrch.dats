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
// Start Time: May, 2018
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

#staload
"./../UTIL/SATS/mylibc0.sats"

(* ****** ****** *)

#staload "./../SATS/filpath.sats"
#staload "./../SATS/filsrch.sats"

(* ****** ****** *)
//
implement
print_fname(f0) =
fprint_fname(stdout_ref, f0)
implement
prerr_fname(f0) =
fprint_fname(stderr_ref, f0)
implement
fprint_fname(out, f0) =
(
case+ f0 of
| FNM0(nm) =>
  fprint!(out, "FNM(", nm, ")")
)
//
(* ****** ****** *)
//
implement
filsrch_absolut
  (base) =
(
  Some_vt(fp0)
) where
{
  val fp0 =
  filpath_make(base, base)
}
//
implement
filsrch_current
  (base) = let
  val
  dir0 = the_dirpath_get()
in
  filsrch_dirbase(dir0, base)
end // filsrch_current
//
implement
filsrch_includes
  (base) = let
  val
  dirs = the_includes_get()
in
  filsrch_dirsbase(dirs, base)
end // filsrch_includes
//
(* ****** ****** *)

local

fun
aux0
(p0: ptr): bool =
let
val c0 =
$UN.ptr0_get<char>(p0)
in
  (c0 = theDirSep_get())
end // end of [aux0]
fun
aux1
(p0: ptr): bool =
(
loop(p0, string2ptr(q0))
) where
{
//
val q0 = theCurDir_get()
//
fun
loop
(p0: ptr, q0: ptr): bool =
let
  val c0 =
  $UN.ptr0_get<char>(p0)
  val d0 =
  $UN.ptr0_get<char>(q0)
in
  if
  iseqz(d0)
  then
  (c0 = theDirSep_get())
  else
  (
  if
  (c0 = d0)
  then
  loop(ptr0_succ<char>(p0), ptr0_succ<char>(q0))
  else false
  ) (* end of [else] *)
end
//
} (* end of [aux1] *)

fun
auxknd
(base: string): int =
let
val p0 = string2ptr(base)
in
//
ifcase
| aux0(p0) => 0
| aux1(p0) => 1
| _(* else *) => 2
//
end // end of [auxknd]

in(*in-of-local*)

implement
filsrch_combined
  (fnm0) = let
//
val
base =
(
case+
fnm0 of
| FNM0(fnm) => fnm
) : string
//
val
fknd = auxknd(base)
//
(*
val () =
println!
("//filsrch_combined: base = ", base)
val () =
println!
("//filsrch_combined: fknd = ", fknd)
*)
//
in
//
ifcase
//
| fknd = 0 =>
  filsrch_absolut(base)
//
| fknd = 1 =>
  filsrch_current(base)
//
| _(* else *) =>
  filsrch_includes(base)
//
end // end of [filsrch_combined]

end // end of [local]

(* ****** ****** *)

implement
filsrch_dirbase
  (dir0, base) =
(
let
val
dir0 =
dir0.name()
val
fname =
filpath_dirbase_vt
  (dir0, base)
val
isexi =
(
xatsopt_is_exist(fname)
) where
{
//
val fname = $UN.strptr2string(fname)
//
(*
val ((*void*)) =
println!
("//filsrch_dirbase: fname = ", fname)
*)
//
}
in(* in-of-let *)
//
if
isexi
then
(
Some_vt
(filpath_make(base, fname))
) where
{
  val fname = strptr2string(fname)
}
else let
  val () = strptr_free(fname) in None_vt()
end // end of [else]
//
end // end of [let]
) (* end of [filsrch_dirbase] *)

(* ****** ****** *)

implement
filsrch_dirsbase
  (dirs, base) =
(
  loop(dirs)
) where
{
fun
loop
( dirs
: List(dirpath)
) : Option_vt(filpath) =
(
case+ dirs of
| list_nil() =>
  None_vt(*void*)
| list_cons(dir, dirs) =>
  let
    val
    opt =
    filsrch_dirbase(dir, base)
  in
    case+ opt of
    | ~None_vt() => loop(dirs) | Some_vt _ => opt
  end
)
} (* end of [filsrch_dirsbase] *)

(* ****** ****** *)

(* end of [xats_filsrch.dats] *)
