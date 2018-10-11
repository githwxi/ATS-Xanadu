(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Postiats - Unleashing the Potential of Types!
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
// Start Time: August, 2018
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
//
#staload
SYM = "./../SATS/symbol.sats"
#staload
FIX = "./../SATS/fixity.sats"
//
#staload
ENV = "./../SATS/symenv.sats"
//
#staload "./../SATS/trans01.sats"

(* ****** ****** *)
//
vtypedef
symenv(itm:type) = $ENV.symenv(itm)
//
(* ****** ****** *)

local

#staload $FIX

val
[l0:addr]
(pf | p0) =
$ENV.symenv_make_nil()
val r0 =
ref_make_viewptr(pf | p0)
val
(pf0 | p0) = ref_get_viewptr(r0)

in (* in-of-local *)

implement
the_fixtyenv_search
  (k0) =
(
  $effmask_ref
  ($ENV.symenv_search(!p0, k0))
) where
{
  prval vbox(pf) = pf0
} (* end of [the_fxtyenv_search] *)

implement
the_fixtyenv_insert
  (k0, x0) = let
//
prval vbox(pf) = pf0  
//
  fun
  mix
  (x0: fixty, x1: fixty): fixty =
  (
  case+ x0 of
  | FIXTYpre(p0) =>
    ( case+ x1 of
    | FIXTYinf
      (p1, a1) =>
      FIXTYpreinf(p0, p1, a1) | _ => x0
    ) (* end of [FIXTYinf] *)
  | FIXTYinf(p0, a0) =>
    ( case+ x1 of
    | FIXTYpre(p1) =>
      FIXTYpreinf(p1, p0, a0) | _ => x0
    ) (* end of [FIXTYinf] *)
  | _ (* non-FIXTYpre-FIXTYinf *) => x0
  )
//
in
//
$effmask_ref($ENV.symenv_insert2(!p0, k0, x0, mix))
//
end (* end of [the_fxtyenv_insert] *)

end // end of [local]

(* ****** ****** *)

(* end of [xats_trans01_envmap.dats] *)
