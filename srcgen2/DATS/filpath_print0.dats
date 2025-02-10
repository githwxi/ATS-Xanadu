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
(* ****** ****** *)
//
(*
Author: Hongwei Xi
Start Time: June 07th, 2022
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
//
#include
"./../HATS/xatsopt_sats.hats"
(*
#include
"./../HATS/xatsopt_dats.hats"
*)
#include
"./../HATS/xatsopt_dpre.hats"
//
(* ****** ****** *)
(* ****** ****** *)
#staload "./../SATS/filpath.sats"
(* ****** ****** *)
//
#impltmp
drpth_fprint(out, dpx) =
(
prints
("DRPTH(", dpx.name(), ")")
) where
{
  #impltmp g_print$out<>() = out
}
//
(* ****** ****** *)
//
#impltmp
fpath_fprint(out, fpx) =
(
prints
("FPATH(", fpx.fnm1(), ")")
) where
{
  #impltmp g_print$out<>() = out
}
//
(* ****** ****** *)
//
#impltmp
fname_fprint(out, fnm) =
(
case+ fnm of
|
FNMbase(name) =>
prints("FNMbase(", name, ")")
) where
{
  #impltmp g_print$out<>() = out
}
//
(* ****** ****** *)
//
#implfun
the_drpth_fprint
  (out) =
drpth_fprint
( out, dir0 ) where
{
val
dir0 = the_drpth_get() }
//
#implfun
the_drpthlst_fprint
  (out) = let
//
val
dirs =
the_drpthlst_get()
//
in//let
(
  list_foritm(dirs)) where
{
#impltmp
foritm$work
<drpth>(dir) = drpth_fprint(out, dir)
}
end//let//end-of-[the_drpthlst_fprint]
//
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_filpath_print0.dats] *)
