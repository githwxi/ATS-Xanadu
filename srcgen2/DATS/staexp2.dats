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
#staload "./../SATS/xsymbol.sats"
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
datatype t2abs =
T2ABS of
( sym_t
, stamp // unicity
) (* datatype(t2abs) *)
//
#absimpl t2abs_tbox = t2abs
//
in (* in-of-local *)
//
#implfun
t2abs_make_name
  (sym) =
(
T2ABS(sym, tmp)) where
{
val tmp = the_t2abs_stamp_new()
} (*where*)//end-of-[t2abs_make_name]
//
(* ****** ****** *)
//
#implfun
t2abs_get_name
  (t2a) = let
//
val
T2ABS
( sym
, tmp (*unicity*) ) = t2a in sym
//
end (*let*) // end of [t2abs_get_name]
//
(* ****** ****** *)
//
#implfun
t2abs_get_stmp
  (t2a) = let
//
val
T2ABS
( sym
, tmp (*unicity*) ) = t2a in tmp
//
end (*let*) // end of [t2abs_get_stmp]
//
(* ****** ****** *)

end (*local*) // end of [local(t2abs)]

(* ****** ****** *)
//
#implfun
sort2_none0() = S2Tnone0()
#implfun
sort2_none1(s1t0) = S2Tnone1(s1t0)
//
(* ****** ****** *)

local
//
datatype s2cst =
S2CST of
( loc_t
, sym_t
, sort2
, stamp // unicity
) (* datatype(s2cst) *)
//
#absimpl s2cst_tbox = s2cst
//
in//local

#implfun
s2cst_get_stmp(s2c) =
let
val
S2CST
( loc
, sym
, s2t
, tmp (*unicity*) ) = s2c in tmp
end (*let*) // end of [s2cst_get_stmp]

endloc (*local*) // end of [local(s2cst)]

(* ****** ****** *)

local
//
datatype s2var =
S2VAR of
(sym_t, sort2, stamp)
(*
datavwtp s2var_vt =
S2VAR_vt of
(sym_t, sort2, stamp)
*)
//
#absimpl s2var_tbox = s2var
//
in//local

#implfun
s2var_get_name(s2v) =
let
val
S2VAR(sym, s2t, tmp) = s2v in sym
end (*let*) // end of [s2var_get_name]

#implfun
s2var_get_sort(s2v) =
let
val
S2VAR(sym, s2t, tmp) = s2v in s2t
end (*let*) // end of [s2var_get_sort]

#implfun
s2var_get_stmp(s2v) =
let
val
S2VAR(sym, s2t, tmp) = s2v in tmp
end (*let*) // end of [s2var_get_stmp]

(* ****** ****** *)
//
#implfun
s2var_make_idst
  (sid, s2t) =
let
val s2v =
S2VAR(sid, s2t, tmp) where
{val tmp = the_s2var_stamp_new()}
in//let
  the_s2varmap_insert_any(s2v); s2v
end (*let*) // end of [s2var_make_idst]
//
(* ****** ****** *)

endloc (*local*) // end of [local(s2var)]

(* ****** ****** *)
#implfun
s2var_make_sort(s2t) =
let
val id0 =
SRP_symbl in s2var_make_idst(id0, s2t)
end (*let*)//end of [s2var_make_sort(s2t)]
(* ****** ****** *)

(* end of [ATS3/XATSOPT_srcgen2_staexp2.dats] *)
