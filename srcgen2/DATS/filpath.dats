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
Start Time: June 07th, 2022
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
#staload "./../SATS/filpath.sats"
(* ****** ****** *)

local

(*
#if
(_FILESYS_UNIX_LIKE_)
*)
val theDirSep: char = '/'
val theCurDir: strn = "."
val theParDir: strn = ".."
(*
// #endif // end-of(#if)
*)

in//local
//
#implfun
theDirSep_get() = theDirSep
#implfun
theCurDir_get() = theCurDir
#implfun
theParDir_get() = theParDir
//
end (*local*) // end of [local]

(* ****** ****** *)

#implfun
fpath_normq
(   fpx   ) = let
//
#vwtpdef
clst=list_vt(cgtz)
#vwtpdef
fnms=strm_vt(clst)
//
val DS = theDirSep_get()
val CD = theCurDir_get()
val PD = theParDir_get()
//
fun
ftest
( nms: fnms
, npd: sint): bool =
(
case+ !nms of
| ~
strmcon_vt_nil
( (*void*) ) => true
| ~
strmcon_vt_cons
( nm1, nms ) =>
(
if
z2eq(nm1,CD)
then
( $free(nms); false )
else
(
if
z2eq(nm1,PD)
then
(
if
(npd >= 1)
then
( $free(nms); false )
else ftest(nms, npd))//then
else ftest(nms, npd+1))//else
) // end of [strm_vt_cons]
) where
{
fun
z2eq
( x1: clst
, x2: strn): bool =
glseq_z2cmp11
<clst,strn><cgtz>(x1, x2) = 0
} (*where*) // end of [ftest]
//
val nms =
gseq_group_list
(   fpx   ) where
{
#impltmp
group$test<cgtz>(ch) = (ch != DS) }
//
in//let
  ftest(nms, 0(*npd*))
end (*let*) // end of [fpath_normq]

(* ****** ****** *)

#implfun
fpath_normize
(   fpx   ) = let
//
#vwtpdef
clst=list_vt(cgtz)
#vwtpdef
slst=list_vt(clst)
#vwtpdef
fnms=strm_vt(clst)
//
val DS = theDirSep_get()
val CD = theCurDir_get()
val PD = theParDir_get()
//
val nms =
gseq_group_list
(   fpx   ) where
{
#impltmp
group$test<cgtz>(ch) = (ch != DS)
}
//
fnx
fcats
(nms: slst): clst =
case+ nms of
| ~
list_vt_nil
( (*void*) ) => list_vt_nil()
| ~
list_vt_cons
( nm1, nms ) => fcats_2(nms, nm1)
and
fcats_2
( nms: slst
, acc: clst): clst =
(
case+ nms of
| ~
list_vt_nil
((*void*)) => acc
| ~
list_vt_cons
(nm1, nms) =>
fcats_2(nms, acc) where
{
val acc = list_vt_cons(DS, acc)
val acc = list_vt_append0(nm1, acc)
}
) (* case *) // end-of-( fcats_2 )
//
fun
fmain
( nms: fnms
, npd: sint
, acc: slst): slst =
(
case+ !nms of
| ~
strmcon_vt_nil() => acc
| ~
strmcon_vt_cons(nm1, nms) =>
(
if
z2eq(nm1,CD)
then
(
free(nm1);
fmain(nms, npd, acc))
else
(
if
z2eq(nm1,PD)
then
(
  if
  (npd > 0)
  then
  (
  free(nm1);
  fmain(nms, npd, acc)) where
  {
    val npd = npd - 1
    val-
    ~list_vt_cons(ac1, acc) = acc
  }
  else
  (
  fmain(nms, npd, acc)) where
  {
    val npd = npd + 1
    val acc = list_vt_cons(nm1, acc)
  }
)
else
(
  fmain(nms, npd, acc)
) where
{
val npd = npd + 1
val acc = list_vt_cons(nm1, acc)
}
)
) (* end-of-(strmcon_vt_cons) *)
) where
{
fun
z2eq
( x1: clst
, x2: strn): bool =
glseq_z2cmp11<clst,strn><cgtz>(x1, x2) = 0
} (*where*) // end of [fmain]
//
val nms =
gseq_group_list
(   fpx   ) where
{
#impltmp
group$test<cgtz>(ch) = (ch != DS) }
//
in
strn_make_list_vt(fcats(fmain(nms,0,nil_vt())))
end (*let*) // end-of-(fpath_normize)

(* ****** ****** *)

(* end of [ATS3/XATSOPT_filpath.dats] *)
