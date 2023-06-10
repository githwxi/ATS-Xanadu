(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2022 Hongwei Xi, ATS Trustful Software, Inc.
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
(*
Author: Hongwei Xi
Start Time: June 09th, 2022
Authoremail: gmhwxiATgmailDOTcom
*)
//
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/filpath.sats"
(* ****** ****** *)
#symload name with drpth_get_name
(* ****** ****** *)
//
#implfun
fsrch_absolute
  (base) =
(
  optn_cons(fpth)) where
{
  val
  fpth =
  fpath_make_absolute(base)
}(*where*) // fsrch_absolute(base)
//
#implfun
fsrch_dcurrent
  (base) = let
//
val
dir0 = the_drpth_get()
//
in
(
  fsrch_dir1base(dir0, base)
) where
{
//
val () =
prerrln
("fsrch_dcurrent: dir0 = ", dir0)
val () =
prerrln
("fsrch_dcurrent: base = ", base)
//
} (*where*) // end-(fsrch_dir1base)
end // end-of-[fsrch_dcurrent(base)]
//
(*
#implfun
fsrch_includes
  (base) = let
  val
  dirs = the_includes_get()
in
  fsrch_dirsbase(dirs, base)
end // end-of-[fsrch_includes(base)]
*)
//
(* ****** ****** *)

local

fun
fkndq0
(base: strn): bool =
if
strn_nilq(base)
then false else
(base[0] = theDirSep_get())

fun
fkndq1
(base: strn): bool =
let
//
val
cdir = theCurDir_get()
//
fun
loop
(i0: int, n0: int): bool =
if
(i0 < n0)
then
(
if
cdir[i0]=base[i0]
then
loop(i0+1, n0) else false)
else
(base[i0]=theDirSep_get())
//
in
let
  val n0 = strn_length(cdir)
  and n1 = strn_length(base)
in//let
  if
  (n0 < n1)
  then loop(0(*i0*), n0) else false
end//let
end (*let*) // end of [fkndq1(base)]

in (*in-of-local*)

#implmnt
fsrch_combined(fnm0) =
let
//
//
val
base =
(
case+
fnm0 of
|FNMbase(name) => name
) : strn // end-of-[val(base)]
//
val
fknd =
(
if
fkndq0(base) then 0
else if
fkndq1(base) then 1 else -1
) : sint // end-of-[val(fknd)]
//
// (*
val () =
prerrln
("fsrch_combined: fnm0 = ", fnm0)
val () =
prerrln
("fsrch_combined: fknd = ", fknd)
// *)
//
in
//
if
(fknd = 0)
then fsrch_absolute(base)//("/")
else if
(fknd = 1)
then fsrch_dcurrent(base)//("./")
else fsrch_includes(base)//otherwise
//
endlet // end of [fsrch_combined(fnm0)]

endloc // end of [fsrch_combined(fnm0)]

(* ****** ****** *)

#implfun
fname_stadyn
(   name   ) = let
//
val n0 =
strn_length(name)
//
fun f0_ats(): bool =
(
if
(
name[n0-3] != 'a'
) then false else
(
if
(name[n0-2] != 't')
then
false else (name[n0-1] != 's'))
)
//
in//let
if
n0 <= 4
then -1 else
(
if
name[n0-5] != '.' then -1 else
(
let
val c4 = name[n0-4]
in//let
if c4 = 'd'
then
(if f0_ats() then 1 else -1)
else
(
if c4 = 's'
then
(if f0_ats() then 0 else -1) else -1)
end(*let*)
)
)
end(*let*)//end-of-[fname_stadyn(name)]

(* ****** ****** *)

#implfun
fname_dbjoin
(dir0, base) = let
//
val n0 = strn_length(dir0)
//
in//let
if
n0 <= 0
then base else
let
val c1 = dir0[n0-1]
val n1 = 
(if
 c1 !=
 theDirSep_get()
 then n0 else n0-1): sint
val nb = strn_length(base)
in//let
strn_tabulate_cfr
( n1+nb
, lam i0 =>
  if
  i0 < n1
  then dir0[i0] else base[i0-n1])
end // else // end-of-if
end (*let*) // end of [fname_dbjoin]

(* ****** ****** *)

#implfun
fsrch_dir1base
  (dir0, base) =
let
val
dir0 =
drpth_get_name(dir0)
val
fnm1 =
fname_dbjoin(dir0, base)
val
isexi =
(
  fname_rexists(fnm1)) where
{
(*
HX-2023-05-29:
[fpath_rexists]
is implemented in
xatslib/githwxi/f00path.dats
*)
fun
fname_rexists
(name: strn) =
fpath_rexists(name) where
{
val () =
prerrln
("fname_rexists: name = ", name)
}
//
(*
val
((*void*)) =
prerrln
("fsrch_dir1base: fname = ", fname)
*)
//
}
in(* in-of-let *)
//
if
isexi
then
(
optn_cons
(fpath(base, fnm1))
) where
{
(*
val ((*void*)) =
prerrln("fsrch_dir1base: fname = ", fname)  
*)
}
else optn_nil(*void*)
//
end (*let*)//end-[fsrch_dir1base(dir0, base)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_filpath_search.dats] *)
