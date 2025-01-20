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
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
(* ****** ****** *)
#include
"./../HATS/xatsopt_sats.hats"
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/filpath.sats"
(* ****** ****** *)
#staload "./../SATS/xglobal.sats"
(* ****** ****** *)
(* ****** ****** *)
#symload name with drpth_get_name
(* ****** ****** *)
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
(*
val () =
prerrsln
("fsrch_dcurrent: dir0 = ", dir0)
val () =
prerrsln
("fsrch_dcurrent: base = ", base)
*)
//
} (*where*) // end-(fsrch_dir1base)
endlet // end-of-[fsrch_dcurrent(base)]
//
#implfun
fsrch_includes
  (base) = let
//
val
dirs = the_xatsopt_include()
val
fopt = fsrch_dnmsbase(dirs, base)
//
in//let
//
case+ fopt of
//
|optn_nil() => 
let
  val dir0 = the_XATSHOME()
in//let
  fsrch_dnm1base(dir0, base) end
//
|optn_cons _ => (      fopt      )
//
endlet // end-of-[fsrch_includes(base)]
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
char_eq
(cdir[i0], base[i0])
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
(*
val () =
prerrsln
("fsrch_combined: fnm0 = ", fnm0)
val () =
prerrsln
("fsrch_combined: fknd = ", fknd)
*)
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
(
name[n0-2] != 't'
) then false else
(name[n0-1] = 's'))
)
//
in//let
if
n0 <= 4
then -1 else
(
if
(
name[n0-5] != '.'
) then (-1) else
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
val sp = theDirSep_get()
//
val n0 = strn_length(dir0)
//
(*
val () =
prerrsln
("fname_dbjoin: dir0 = ", dir0)
val () =
prerrsln
("fname_dbjoin: base = ", base)
*)
//
in//let
if
n0 <= 0
then base else
let
val c1 = dir0[n0-1]
val n1 = 
(if
 c1 != sp
 then n0 else n0-1): sint
val nb = strn_length(base)
in//let
strn_tabulate$f1un
( n1+nb+1
, lam i0 =>
  if
  i0 < n1
  then dir0[i0] else
  (if i0 <= n1
   then sp else base[i0-n1-1]) )
end // else // end-of-if
end (*let*) // end of [fname_dbjoin]

(* ****** ****** *)

local
//
fun
auxmain
(dir0, base) =
let
val
fnm1 =
fname_dbjoin(dir0, base)
//
(*
val () =
prerrsln
("auxmain: dir0 = ", dir0)
val () =
prerrsln
("auxmain: base = ", base)
val () =
prerrsln
("auxmain: fnm1 = ", fnm1)
*)
//
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
(*
val () =
prerrsln
("fname_rexists: name = ", name)
*)
} (*where*)//end-[fname_rexists]
//
} (*where*)//end-[ val( isexi ) ]
//
in(* in-of-let *)
//
if
isexi
then
(
optn_cons
(fpath(base, fnm1)) // relative
) where
{
(*
val () =
prerrsln("auxmain: base = ", base)
val () =
prerrsln("auxmain: fnm1 = ", fnm1)
val () =
prerrsln("auxmain: isexi = ", isexi)
*)
}
else optn_nil(*void*)
//
end (*let*)//end-of-[auxmain(dir0, base)]
//
(* ****** ****** *)
in//local
(* ****** ****** *)

#implfun
fsrch_dnm1base
  (dir0, base) =
(
  auxmain(dir0, base)
) where {
//
(*
val ((*0*)) =
prerrsln("fsrch_dnm1base: dir0 = ", dir0)
val ((*0*)) =
prerrsln("fsrch_dnm1base: base = ", base)
*)
//
} (*where*) // [fsrch_dnm1base(dirs,base)]

(* ****** ****** *)

#implfun
fsrch_dir1base
  (dir0, base) =
(
  auxmain(dir0, base)
) where {
//
  val dir0 = drpth_get_name(dir0)
(*
val ((*0*)) =
(
 prerrsln("fsrch_dir1base: dir0 = ", dir0))
*)
//
} where {
//
(*
val ((*0*)) =
(
 prerrsln("fsrch_dir1base: dir0 = ", dir0))
val ((*0*)) =
(
 prerrsln("fsrch_dir1base: base = ", base))
*)
//
} (*where*)//end-[fsrch_dir1base(dirs,base)]

(* ****** ****** *)

#implfun
fsrch_dnmsbase
  (dirs, base) =
(
case+ dirs of
|list_nil() =>
 optn_nil((*void*))
|list_cons(dir1, dirs) =>
let
val fopt = auxmain(dir1, base)
in//let
case+ fopt of
|
optn_nil() =>
fsrch_dnmsbase
( dirs, base ) | optn_cons _ => fopt
end(*let*) // end of [list_cons(...)]
)(*case+*)//end-[fsrch_dnmsbase(dirs,base)]

(* ****** ****** *)

end (*local*) // end of [local(fsrch_dirsbase)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_filpath_search.dats] *)
