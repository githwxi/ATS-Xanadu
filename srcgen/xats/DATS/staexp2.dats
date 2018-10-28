(***********************************************************************)
(*                                                                     *)
(*                         Applied Type System                         *)
(*                                                                     *)
(***********************************************************************)

(*
** ATS/Xanadu - Unleashing the Potential of Types!
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
// Start Time: October, 2018
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

#staload
STM = "./../SATS/stamp0.sats"

(* ****** ****** *)

#staload "./../SATS/staexp2.sats"

(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
t2dat_stamp_new() = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
s2var_stamp_new() = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local

val
stamper = $STM.stamper_new()

in (* in-of-local *)

implement
s2xtv_stamp_new() = $STM.stamper_getinc(stamper)

end // end of [local]

(* ****** ****** *)

local
//
typedef
t2dat_struct = $rec
{
  t2dat_sym= sym_t // name
, t2dat_stamp= stamp // unicity
, t2dat_sconlst= s2cstlst
}
//
absimpl
t2dat_tbox = ref(t2dat_struct)
//
in (* in-of-local *)

implement
t2dat_get_sym(s2td) = s2td->t2dat_sym
implement
t2dat_get_stamp(s2td) = s2td->t2dat_stamp
implement
t2dat_get_sconlst(s2td) = s2td->t2dat_sconlst

end // end of [local]

(* ****** ****** *)

local
//
typedef
t2xtv_struct = $rec
{
  t2xtv_stamp= stamp
,
  t2xtv_sortopt= sort2opt
}
//
absimpl
t2xtv_tbox = ref(t2xtv_struct)
//
in (* in-of-local *)
//
implement
t2xtv_get_stamp
  (s2tx) = s2tx->t2xtv_stamp
//
implement
t2xtv_get_sortopt
  (s2tx) = s2tx->t2xtv_sortopt
//
end // end of [t2xtv_struct]

(* ****** ****** *)

implement
t2xtv_get_sort
  (s2tx) = s2t0 where
{
val-Some(s2t0) = s2tx.sortopt()
} (* end of [t2xtv_get_sort] *)
//
(* ****** ****** *)

(* end of [xats_staexp2.dats] *)
