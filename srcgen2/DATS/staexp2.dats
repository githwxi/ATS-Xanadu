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
(*
Sat 27 Aug 2022 02:13:22 AM EDT
*)
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
#staload "./../SATS/xstamp0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp2.sats"
(* ****** ****** *)
//
local
val
stamper = stamper_new()
in//local
fun
the_t2abs_stamp_new
( (*void*) ): stamp = stamper.getinc()
endloc // end of [the_t2abs_stamp_new]
//
(* ****** ****** *)
//
local
val
stamper = stamper_new()
in//local
fun
the_t2dat_stamp_new
( (*void*) ): stamp = stamper.getinc()
endloc // end of [the_t2dat_stamp_new]
//
(* ****** ****** *)
//
local
val
stamper = stamper_new()
in//local
fun
the_s2cst_stamp_new
( (*void*) ): stamp = stamper.getinc()
endloc // end of [the_s2cst_stamp_new]
//
(* ****** ****** *)
//
local
val
stamper = stamper_new()
in//local
fun
the_s2var_stamp_new
( (*void*) ): stamp = stamper.getinc()
endloc // end of [the_s2var_stamp_new]
//
(* ****** ****** *)
//
local
val
stamper = stamper_new()
in//local
fun
the_s2xtv_stamp_new
( (*void*) ): stamp = stamper.getinc()
endloc // end of [the_s2xtv_stamp_new]
//
(* ****** ****** *)

local
//
datatype s2var =
S2VAR of
(sym_t, sort2, stamp)
datavwtp s2var_vt =
S2VAR_vt of
(sym_t, sort2, stamp)
//
#absimpl s2var_tbox = s2var
//
in//local

#implfun
s2var_get_sort(s2v) =
let
val
S2VAR(sym, s2t, tmp) = s2v in s2t
end (*let*) // end of [s2var_get_sort]

endloc (*local*) // end of [local(s2var)]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_staexp2.dats] *)
