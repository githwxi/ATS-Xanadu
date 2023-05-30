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
#staload "./../SATS/filpath.sats"
(* ****** ****** *)

local
//
datatype
drpth =
DRPTH of
(strn(*name*))
//
#absimpl drpth_tbox = drpth
//
in(*in-of-local*)

#implfun
drpth_get_name(dpx) =
let
val+DRPTH(dnm) = dpx in dnm
end // end of [drpth_get_name]

(* ****** ****** *)

#impltmp
drpth_make_name(dnm) = DRPTH(dnm)

end (*local*) // end of [local(drpth)]

(* ****** ****** *)

local
//
val
the_drpth_nil =
drpth_make_name("")
//
val
the_drpth_ref =
a0ref_make_1val(the_drpth_nil)
val
the_drpthlst_ref =
a0ref_make_1val(list_nil(*void*))
//
in//local

#implfun
the_drpth_get
  ( (*void*) ) = !the_drpth_ref
#implfun
the_drpthlst_get
  ( (*void*) ) = !the_drpthlst_ref

(* ****** ****** *)

#implfun
the_drpth_pop0() =
let
val dpx0 = !the_drpth_ref
val dpxs = !the_drpthlst_ref
in//let
case- dpxs of
|
list_cons(dpx1, dpxs) =>
(
  the_drpth_ref[] := dpx1;
  the_drpthlst_ref[] := dpxs )
end//let//end-of-[the_drpth_pop0(...)]

(* ****** ****** *)

#implfun
the_drpth_pop1() =
let
val dpx0 = !the_drpth_ref
val dpxs = !the_drpthlst_ref
in//let
case- dpxs of
|
list_cons(dpx1, dpxs) =>
(
the_drpth_ref[] := dpx1;
the_drpthlst_ref[] := dpxs; dpx0 )
end//let//end-of-[the_drpth_pop1(...)]

(* ****** ****** *)

#implfun
the_drpth_push(dpth) =
let
val dpx0 = !the_drpth_ref
val (  ) = !the_drpth_ref := dpth
in//let
(
  the_drpthlst_ref[] :=
  list_cons(dpx0, !the_drpthlst_ref))
end//let//end-of-[the_drpth_push(dpth)]

end (*local*) // end of [the_drpth/the_drpthlst]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_filpath_drpth0.dats] *)
