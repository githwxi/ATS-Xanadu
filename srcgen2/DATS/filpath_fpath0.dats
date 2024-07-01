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

local

datatype
fpath =
FPATH of
( strn (*gvn0*)
, strn (*fnm1*)
, symbl(*fnm2*)) // fpath
#absimpl fpath_tbox = fpath

in//local

(* ****** ****** *)

#implfun
fpath_get_gvn0(fpx) =
let
val+
FPATH
( gvn0
, fnm1, fnm2) = fpx in gvn0
end // end of [fpath_get_gvn0]

#implfun
fpath_get_fnm1(fpx) =
let
val+
FPATH
( gvn0
, fnm1, fnm2) = fpx in fnm1
end // end of [fpath_get_fnm1]

#implfun
fpath_get_fnm2(fpx) =
let
val+
FPATH
( gvn0
, fnm1, fnm2) = fpx in fnm2
end // end of [fpath_get_fnm2]

(* ****** ****** *)

#implfun
fpath_make_absolute
  (fnm1) =
(
FPATH
(gvn0, fnm1, fnm2)) where
{
//
val gvn0 = fnm1
val fnm1 = fpath_normize(fnm1)
//
val fnm2 = symbl_make_name(fnm1)
//
} (*where*)//end-[fpath_make_absolute]

(* ****** ****** *)

#implfun
fpath_make_relative
  (gvn0, fnm1) =
(
FPATH
(gvn0, fnm1, fnm2)) where
{
//
val fnm1 = fpath_normize(fnm1)
//
val fnm2 = symbl_make_name(fnm1)
//
} (*where*)//end-[fpath_make_relative]

(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_DATS_filpath_fpath0.dats] *)
