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
Sun Jul 24 18:05:31 EDT 2022
*)
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
#include
"./../HATS/xatsopt_dats.hats"
(* ****** ****** *)
#define
ATS_PACKNAME
"ATS3.XANADU.xatsopt-20220500"
(* ****** ****** *)
#staload "./../SATS/xsymbol.sats"
(* ****** ****** *)
#staload "./../SATS/xlabel0.sats"
(* ****** ****** *)
#staload "./../SATS/locinfo.sats"
(* ****** ****** *)
#staload "./../SATS/lexing0.sats"
(* ****** ****** *)
#staload "./../SATS/staexp1.sats"
(* ****** ****** *)

local
//
datatype
g1exp =
G1EXP of
(
loctn, g1exp_node)
//
#absimpl g1exp_tbox = g1exp
//
in (* in-of-local *)
//
#implfun
g1exp_make_node
(   loc,nod   ) = G1EXP(loc,nod)
//
#implfun
g1exp_get_lctn(g1e) =
let
  val+G1EXP(loc,nod) = g1e in loc
end
#implfun
g1exp_get_node(g1e) =
let
  val+G1EXP(loc,nod) = g1e in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
sort1 =
SORT1 of
(
loctn, sort1_node)
//
#absimpl sort1_tbox = sort1
//
in (* in-of-local *)
//
#implfun
sort1_make_node
(   loc,nod   ) = SORT1(loc,nod)
//
#implfun
sort1_get_lctn(s1t) =
let
  val+SORT1(loc,nod) = s1t in loc
end
#implfun
sort1_get_node(s1t) =
let
  val+SORT1(loc,nod) = s1t in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
s1qua =
S1QUA of
(
loctn, s1qua_node)
//
#absimpl s1qua_tbox = s1qua
//
in (* in-of-local *)
//
#implfun
s1qua_make_node
(   loc,nod   ) = S1QUA(loc,nod)
//
#implfun
s1qua_get_lctn(s1q) =
let
  val+S1QUA(loc,nod) = s1q in loc
end
#implfun
s1qua_get_node(s1q) =
let
  val+S1QUA(loc,nod) = s1q in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
s1uni =
S1UNI of
(
loctn, s1uni_node)
//
#absimpl s1uni_tbox = s1uni
//
in (* in-of-local *)
//
#implfun
s1uni_make_node
(   loc,nod   ) = S1UNI(loc,nod)
//
#implfun
s1uni_get_lctn(s1u) =
let
  val+S1UNI(loc,nod) = s1u in loc
end
#implfun
s1uni_get_node(s1u) =
let
  val+S1UNI(loc,nod) = s1u in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

local
//
datatype
s1exp =
S1EXP of
(
loctn, s1exp_node)
//
#absimpl s1exp_tbox = s1exp
//
in (* in-of-local *)
//
#implfun
s1exp_make_node
(   loc,nod   ) = S1EXP(loc,nod)
//
#implfun
s1exp_get_lctn(s1e) =
let
  val+S1EXP(loc,nod) = s1e in loc
end
#implfun
s1exp_get_node(s1e) =
let
  val+S1EXP(loc,nod) = s1e in nod
end
//
endloc (*local*) // end of [ local ]

(* ****** ****** *)

(* end of [ATS3/XATSOPT_staexp1.dats] *)
