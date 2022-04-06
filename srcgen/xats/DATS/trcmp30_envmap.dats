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
// Author: Hongwei Xi
// Start Time: April, 2022
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

#staload "./../SATS/locinfo.sats"

(* ****** ****** *)

#staload "./../SATS/statyp2.sats"
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp3.sats"

(* ****** ****** *)

#staload "./../SATS/trcmp30.sats"

(* ****** ****** *)

local
//
datavtype compenv =
|
COMPENV of
( List0_vt(d3exp)
, List0_vt(t3sub) )
where
t3sub = (s2varlst, t2ypelst)
//
absimpl compenv_vtype = compenv
//
in(*in-of-local*)

(* ****** ****** *)
//
implement
compenv_make_nil
((*void*)) =
COMPENV
(d3es, tsub) where
{
  val d3es = list_vt_nil()
  val tsub = list_vt_nil()
}
//
implement
compenv_free_nil
  ( env0 ) =
let
val+
~COMPENV
 (d3es, tsub) = env0
val-
~list_vt_nil() = d3es
val-
~list_vt_nil() = tsub in (*nothing*)
end (*let*)//end of [compenv_free_nil]
// 
(* ****** ****** *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trcmp30_envmap.dats] *)
