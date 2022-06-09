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
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)

local

(* ****** ****** *)

datatype
symbl =
SYMBL of (strn, stamp)
#absimpl symbl_tbox = symbl

(* ****** ****** *)

val mytmper = stamper_new()

(* ****** ****** *)

in//local

(* ****** ****** *)

#implval
the_symbl_nil =
SYMBL("", the_stamp_nil)

(* ****** ****** *)

#implfun
symbl_get_name(sym) =
let
val+
SYMBL(nam, tmp) = sym in nam
end(*let*)//end-of(symbl_get_name)
#implfun
symbl_get_stmp(sym) =
let
val+
SYMBL(nam, tmp) = sym in tmp
end(*let*)//end-of(symbl_get_stmp)

(* ****** ****** *)

#implfun
symbl_make_name(nam) =
  SYMBL(nam, tmp) where
{
  val tmp = mytmper.getinc()
}(*where*)//end-of(symbl_make_name)

(* ****** ****** *)

end (*local*) // end of [local]

(* ****** ****** *)
#implfun
symbl_cmp(x,y) =
(x.stmp() \cmp y.stmp())
(* ****** ****** *)
#implfun
symbl_nilq(sym) = (sym = the_symbl_nil)
#implfun
symbl_neqz(sym) = (sym != the_symbl_nil)
(* ****** ****** *)

(* end of [ATS3/XATSOPT_xsymbol.dats] *)
