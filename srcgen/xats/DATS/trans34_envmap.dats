(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
** Copyright (C) 2021 Hongwei Xi, ATS Trustful Software, Inc.
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
// Start Time: January, 2021
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

#staload "./../SATS/statyp2.sats"
#staload "./../SATS/staexp2.sats"
#staload "./../SATS/dynexp2.sats"
#staload "./../SATS/dynexp3.sats"
#staload "./../SATS/dynexp4.sats"

(* ****** ****** *)

#staload "./../SATS/trans34.sats"

(* ****** ****** *)
//
datavtype
tr34env =
TR34ENV of tr34stk
//
and
tr34stk =
//
| tr34stk_nil of ()
//
(* ****** ****** *)

absimpl
tr34env_vtype = tr34env

(* ****** ****** *)

implement
tr34env_make_nil() =
TR34ENV(tr34stk_nil(*void*))

(* ****** ****** *)
//
implement
tr34env_free_nil
  (env0) =
(
let
val+
~TR34ENV(stk0) = env0
in
case+ stk0 of
//
|
~tr34stk_nil((*void*)) => ()
//
end
) (* end of [tr34env_free_nil] *)
//
(* ****** ****** *)

(* end of [xats_trans34_envmap.dats] *)
